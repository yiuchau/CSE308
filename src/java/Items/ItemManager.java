package Items;

import Users.User;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class ItemManager {

    private List<Item> itemCollection;
    User user;
    EntityManagerFactory emf;
    EntityManager em;

    public ItemManager() {
        //initialize itemCollection
        itemCollection = new ArrayList<Item>();
        System.out.println("Test: ItemManager instantiated.");
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("CSE308WebAppPU");
        EntityManager em = emf.createEntityManager();
    }

    public List<Item> getItemCollection() {
        return this.itemCollection;
    }

    public Item findItem(String ISBN) {
        Item retItem;
        for (Item i : itemCollection) {
            if (i.getISBN() == ISBN) {
                em.refresh(i);
                retItem = i;
                return retItem;
            }
        }

        try {
            Query query = em.createQuery("Select e from  Item e Where e.isbn= '" + ISBN + "'");
            retItem = (Item) query.getSingleResult();
            if (retItem.getImageURL().equals("None")) {
                retItem.setImageURL("images/100X125.gif");
            }
        } catch (NoResultException e) {
            System.out.println("Item with ISBN" + ISBN + " not found.\n");
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
        System.out.println("Item " + newItem.getISBN() + "added to collection.");
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

    public void deleteItem(String ISBN) {
        Item itemToDelete = findItem(ISBN);
        em.getTransaction().begin();
        em.remove(itemToDelete);
        em.getTransaction().commit();
    }

    public List<Item> getCollection(String category) {
        Query query;
        List<Item> retList;
        if (category.equals("MostPopular")) {
            query = em.createQuery("Select i " + "from Item e" + "Order by averageRating Desc LIMIT 50");
        } else if (category.equals("MostRecent")) {
            query = em.createQuery("Select i " + "from Item e " + "Order by releaseDate Desc LIMIT 50");
        } else if (category.equals("Checkouts")) {
            //TODO create item list from checkout
            query = em.createQuery("Select e " + "from  CheckoutList " + "Where e.userName= '" + user.getUserName() + "'");
            List<CheckoutList> rs = (List<CheckoutList>) query.getResultList();
            retList = new ArrayList();
            for (CheckoutList checkoutItem : rs){
                Item item = findItem(checkoutItem.getIsbn());
                if (item.getBanned() == 0) {
                    retList.add(item);
                }
            }
            return retList; 
        } else if (category.equals("WishList")) {
            //TODO create item list from wish list
            query = em.createQuery("Select e " + "from  WishList e " + "Where e.userName= '" + user.getUserName() + "'");
            List<WishList> rs = (List<WishList>) query.getResultList();
            retList = new ArrayList();
            for (WishList wishItem : rs){
                Item item = findItem(wishItem.getIsbn());
                if (item.getBanned() == 0) {
                    retList.add(item);
                }
            }
            return retList; 
        
        } else if (category.equals("Holds")) {
            //TODO create item list from wish list
            query = em.createQuery("Select e " + "from  Holds e " + "Where e.userName= '" + user.getUserName() + "'");
            List<Holds> rs = (List<Holds>) query.getResultList();
            retList = new ArrayList();
            for (Holds holdItem : rs){
                Item item = findItem(holdItem.getIsbn());
                if (item.getBanned() == 0) {
                    retList.add(item);
                }
            }
            return retList; 
        
        } else if (category.equals("Ratings")) {
            //TODO create item list from wish list
            query = em.createQuery("Select e " + "from  RateList e " + "Where e.userName= '" + user.getUserName() + "'");
            List<RateList> rs = (List<RateList>) query.getResultList();
            retList = new ArrayList();
            for (RateList rateItem : rs){
                Item item = findItem(rateItem.getIsbn());
                if (item.getBanned() == 0) {
                    retList.add(item);
                }
            }
            return retList; 
        
        } else {
            //TODO RECOMMENDATIONS
            query = em.createQuery("Select e " + "from Item e " + "Order by e.totalCopies Desc LIMIT 50");
        }

        retList = (List<Item>) query.getResultList();
        for (Item newItem : retList) {
            if (newItem.getImageURL().equals("None")) {
                newItem.setImageURL("images/100X125.gif");
            }
            addItem(newItem);
        }

        return retList;
    }

    public String login(String username, String password) {
        String retValue;
        User user = em.find(User.class, username);
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
        User u = em.find(User.class, userName);
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
