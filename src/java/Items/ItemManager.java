package Items;

import Users.User;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.annotation.PreDestroy;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

public class ItemManager {

    private static ItemManager singleton = null;

    private List<Item> itemCollection;
    User user;

    //EntityManagerFactory emf;
    EntityManager em;

    @PreDestroy
    public void destroy() {
        System.out.println("Im inside destroy...");
        em.close();
        //emf.close();
    }

    public static ItemManager getInstance() {
        if (singleton == null) {
            singleton = new ItemManager();
        }
        return singleton;
    }

    public ItemManager() {
        itemCollection = new ArrayList<Item>();
        //emf = Persistence.createEntityManagerFactory("308ProjectPU");
        em = EMF.createEntityManager();
    }

    public List<Item> getItemCollection() {
        return this.itemCollection;
    }

    public Item findItem(String ISBN) {
        Item retItem;
        for (Item i : itemCollection) {
            if (i.getISBN().equals(ISBN)) {
                em.refresh(i);
                retItem = i;
                return retItem;
            }
        }
        try {
            Query query = em.createQuery("Select i from  Item i Where i.isbn = ?1");
            query.setParameter(1, ISBN);
            retItem = (Item) query.getSingleResult();
        } catch (NoResultException e) {
            System.out.println("Item with ISBN " + ISBN + " not found.\n");
            return null;
        }
        addItem(retItem);
        return retItem;
    }

    public void addItem(Item newItem) {
        Iterator<Item> it = itemCollection.iterator();
        while (it.hasNext()) {
            Item oldItem = it.next();
            if (oldItem.getISBN().equals(newItem.getISBN())) {
                it.remove();
            }
        }
        itemCollection.add(newItem);
    }

    public void persist(Item item) {
        em.getTransaction().begin();
        em.persist(item);
        em.getTransaction().commit();
    }

    public void updateItemTitle(String ISBN, String newTitle) {
        Item itemToUpdate = findItem(ISBN);
        em.getTransaction().begin();
        itemToUpdate.setTitle(newTitle);
        em.getTransaction().commit();
    }
    
    //Decrease one each time(borrow book)
     public void updateItemAvailableCopies(String ISBN) {
        Item itemToUpdate = findItem(ISBN);
        em.getTransaction().begin();
        int currentNumber=itemToUpdate.getAvailableCopies();
        itemToUpdate.setAvailableCopies(currentNumber-1);
        em.getTransaction().commit();
    }

    public void deleteItem(String ISBN) {
        Item itemToDelete = findItem(ISBN);
        em.getTransaction().begin();
        em.remove(itemToDelete);
        em.getTransaction().commit();
    }

    public boolean addToCheckoutList(String ISBN){
        String current=user.getUserName();
        boolean success=false;
        if(itemExist(ISBN,current,"CheckoutList")==false){
            CheckoutList newItem=new CheckoutList();
            newItem.setIsbn(ISBN);
            newItem.setUserName(current);
            em.getTransaction().begin();
            em.persist(newItem);
            em.getTransaction().commit();
            updateItemAvailableCopies(ISBN);
            success=true;
        }
        return success;
    }
    
    public boolean itemExist(String ISBN,String userName,String table) {
        boolean isPresent = false;
        if(table.equals("CheckoutList")){
            CheckoutKey checkoutKey=new CheckoutKey(ISBN,userName);
            if(em.find(Items.CheckoutList.class, checkoutKey)!=null){
                isPresent = true;
            }
        }
        return isPresent;
    }
     
    public List<Item> getCollection(String category) {
        System.out.println("Query: " + category);
        List<Item> retList = new ArrayList<Item>();
        
        Query query;
        if (category.equals("MostPopular")) {
            query = em.createQuery("SELECT i FROM Item i ORDER BY i.averageRating DESC");
            query.setMaxResults(50);
        } else if (category.equals("MostRecent")) {
            query = em.createQuery("SELECT i FROM Item i ORDER BY i.releaseDate DESC");
            query.setMaxResults(50);
        } else if (category.equals("Checkouts")) {
            query = em.createQuery("SELECT c FROM CheckoutList c WHERE c.userName = ?1");
            query.setParameter(1, user.getUserName());
            List<CheckoutList> rs = (List<CheckoutList>) query.getResultList();

            for (CheckoutList checkoutItem : rs) {
               Item item = findItem(checkoutItem.getIsbn());
                if (item.getBanned() == 0) {
                    retList.add(item);
                }
            }
            return retList;

        } 
        else if (category.equals("WishList")) {
            query = em.createQuery("SELECT w FROM WishList w WHERE w.userName = ?1");
            query.setParameter(1, user.getUserName());
            List<WishList> rs = (List<WishList>) query.getResultList();
            for (WishList wishItem : rs) {
                Item item = findItem(wishItem.getIsbn());
                if (item.getBanned() == 0) {
                    retList.add(item);
                }
            }
            return retList;

        } 

        else if (category.equals("WishListA")) {
            query = em.createQuery("SELECT w FROM WishList w WHERE w.userName = ?1");
            query.setParameter(1, user.getUserName());
            List<WishList> rs = (List<WishList>) query.getResultList();
            for (WishList wishItem : rs) {
                Item item = findItem(wishItem.getIsbn());
                if(item.getBanned()==0){
                    retList.add(item);
                }             
            }
            return retList;

        } else if (category.equals("Holds")) {
            query = em.createQuery("SELECT h FROM Holds h WHERE h.userName = ?1");
            query.setParameter(1, user.getUserName());
            List<Holds> rs = (List<Holds>) query.getResultList();
            for (Holds holdItem : rs) {
                Item item = findItem(holdItem.getIsbn());
                if (item.getBanned() == 0) {
                    retList.add(item);
                }
            }
            System.out.println("Size: " + retList.size());
            return retList;

        } else if (category.equals("Ratings")) {
            query = em.createQuery("SELECT r FROM RateList r WHERE r.userName = ?1");
            query.setParameter(1, user.getUserName());
            List<RateList> rs = (List<RateList>) query.getResultList();
            for (RateList rateItem : rs) {
                Item item = findItem(rateItem.getIsbn());
                if (item.getBanned() == 0) {
                    retList.add(item);
                }
            }
            return retList;

        } else {
            //TODO RECOMMENDATIONS
            query = em.createQuery("SELECT i FROM Item i ORDER BY i.totalCopies DESC");
            query.setMaxResults(50);
        }

        List<Item> tempList = (List<Item>) query.getResultList();
        for (Item newItem : tempList) {
            if (newItem.getBanned() == 0) {
                   retList.add(newItem);
                }
            addItem(newItem);
        }

        System.out.println("Size: " + retList.size());
        return retList;
    }

     public List<RateList> getRateList(User user){
        String userName=user.getUserName();
        Query query1=em.createQuery("Select e " + "from  RateList e " + "Where e.userName= '"+userName+"'");
        List<RateList> list=(List<RateList>)query1.getResultList( );        
        return list;
    } 
     
    public String login(String username, String password) {
        String retValue;
        User user = em.find(Users.User.class, username);
        if (user == null) {
            retValue = "User Name doesn't exist. Please register first";
        } else if (user.getPassword().equals(password)) {
            this.setUser(user);
            retValue = "Success";
        } else {
            retValue = "Incorrect password";
        }
        return retValue;
    }

    public boolean register(User newUser) {
        boolean retValue = false;
        if (userExist(newUser.getUserName()) == false) {
            em.getTransaction().begin();
            em.persist(newUser);
            em.getTransaction().commit();
            if (userExist(newUser.getUserName())) {
                retValue = true;
            }
        }
        return retValue;
    }

    public User getUser() {
        return this.user;
    }

    public void setUser(User user) {
        this.user = user;

    }

    public boolean userExist(String userName) {
        User u = em.find(Users.User.class, userName);
        return u != null;
    }

    public void signOut() {
        this.user = null;
    }

    //update user information
    public void updateUser(String newFName, String newLName, String newEmail, String newPassword, String newPhoneNumber) {
        em.getTransaction().begin();
        user.setFirstName(newFName);
        user.setLastName(newLName);
        user.setEmail(newEmail);
        user.setPassword(newPassword);
        user.setPhoneNumber(newPhoneNumber);
        em.getTransaction().commit();
    }

    public void removeUser(String userName) {
        em.getTransaction().begin();
        em.remove(user);
        em.getTransaction().commit();
    }
}
