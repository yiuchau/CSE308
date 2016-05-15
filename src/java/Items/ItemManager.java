package Items;

import Users.User;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
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
            Date currentDate=getCurrentDate();
            newItem.setCheckoutTime(currentDate);
            Date dueDate=calculateDueDate(newItem.getCheckoutTime());
            newItem.setDueTime(dueDate);
            Item itemToUpdate=findItem(ISBN);
            em.getTransaction().begin();
            itemToUpdate.setBorrowedTimes(itemToUpdate.getBorrowedTimes()+1); //updtae borrowedTimes
            em.persist(newItem);
            em.getTransaction().commit();
            updateItemAvailableCopies(ISBN);
            success=true;
        }
        return success;
    }
    
    public boolean addToWishList(String ISBN){
        String current=user.getUserName();
        boolean success=false;
        if(itemExist(ISBN,current,"WishList")==false){
            WishList newItem=new  WishList();
            newItem.setIsbn(ISBN);
            newItem.setUserName(current);
            Date currentDate=getCurrentDate();
            newItem.setWishtime(currentDate);
            em.getTransaction().begin();
            em.persist(newItem);
            em.getTransaction().commit();
            success=true;
        }
        return success;
    }
    
     public String addToHoldsList(String ISBN,String checkoutType){
        String current=user.getUserName();
        String returnMessage="success";
        if(itemExist(ISBN,current,"CheckoutList")==true){
            returnMessage="You've already borrowed this book!";
        }
        else if(itemExist(ISBN,current,"Holds")==true){
            returnMessage="You've already placed a hold on this book!";
        }
        else{
            Holds newItem=new Holds();
            newItem.setIsbn(ISBN);
            newItem.setUserName(current);
            Date currentDate=getCurrentDate();
            newItem.setPlaceHoldTime(currentDate);
            newItem.setCheckOutType(checkoutType);
            em.getTransaction().begin();
            em.persist(newItem);
            em.getTransaction().commit();
        }
        return returnMessage;
    }
    
     public boolean addToRecommended(String ISBN,String checkoutType,String email){
        String current=user.getUserName();
        boolean success=false;
        if(itemExist(ISBN,current,"Recommended")==false){
            RecommendedList newItem=new RecommendedList();
            newItem.setIsbn(ISBN);
            newItem.setUserName(current);
            Date currentDate=getCurrentDate();
            newItem.setRecommendedTime(currentDate);
            newItem.setCheckOutType(checkoutType);
            newItem.setEmail(email);
            newItem.setStatus("wait");
            em.getTransaction().begin();
            em.persist(newItem);
            em.getTransaction().commit();
            success=true;
        }
        return success;
     }
    public void removeFromWishList(String ISBN){
        String current=user.getUserName();
        WishlistKey wishlistKey=new WishlistKey(ISBN,current);
        WishList item=em.find(Items.WishList.class, wishlistKey);
        em.getTransaction().begin();
        em.remove(item);
        em.getTransaction().commit();
    }
    
    public boolean itemExist(String ISBN,String userName,String table) {
        boolean isPresent = false;
        if(table.equals("CheckoutList")){
            CheckoutKey checkoutKey=new CheckoutKey(ISBN,userName);
            if(em.find(Items.CheckoutList.class, checkoutKey)!=null){
                isPresent = true;
            }
        }
        else if(table.equals("WishList")){
            WishlistKey wishlistKey=new WishlistKey(ISBN,userName);
            if(em.find(Items.WishList.class, wishlistKey)!=null){
                isPresent = true;
            }
        }
        else if(table.equals("Holds")){
            HoldsKey holdsKey=new  HoldsKey(ISBN,userName);
            if(em.find(Items.Holds.class,holdsKey)!=null){
                isPresent = true;
            }
        }
        else if(table.equals("Recommended")){
            RecommendedKey recommendedKey=new  RecommendedKey(ISBN,userName);
            if(em.find(Items.RecommendedList.class,recommendedKey)!=null){
                isPresent = true;
            }
        }
        return isPresent;
    }
    
    public Date getCurrentDate(){
        java.util.Date javaDate = new java.util.Date();
        long javaTime = javaDate.getTime();
        java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(javaTime);
        return sqlTimestamp;
    }
    
    public Date calculateDueDate(Date checkoutTime){
        String period=user.getLendingPeriod();
        Calendar c = Calendar.getInstance();
        c.setTime(checkoutTime); // use checkout Time
        Date newDate;
        if(period.equals("3 days")){
            c.add(Calendar.DATE, 3); // Adding 3 days
        }
        else if(period.equals("7 days")){
             c.add(Calendar.DATE, 7);
        }
        else if(period.equals("10 days")){
             c.add(Calendar.DATE, 10);
        }
        else if (period.equals("5 minutes")){
            c.add(Calendar.MINUTE, 5);
        }
        newDate =c.getTime();
        return newDate;
    }
    
    public void updateDueTime(String userName){
        Query query = em.createQuery("SELECT c FROM CheckoutList c WHERE c.userName = ?1");
        query.setParameter(1, userName);
        List<CheckoutList> rs = (List<CheckoutList>) query.getResultList();
        for (CheckoutList checkoutItem : rs) {
            Item item = findItem(checkoutItem.getIsbn());
            if (item.getBanned() == 0) {
                em.getTransaction().begin();
                checkoutItem.setDueTime(calculateDueDate(checkoutItem.getCheckoutTime()));
                em.getTransaction().commit();
            }
        }
    }
    
    
    public List<Item> basicSearch(String searchParameter) {
        Query query = em.createQuery("SELECT i FROM Item i WHERE i.title LIKE ?1 OR i.author LIKE ?2");
        searchParameter = '%' + searchParameter + '%';
        query.setParameter(1, searchParameter);
        query.setParameter(2, searchParameter);
        
        return search(query);
    }
    
    public List<Item> search(Query query) {
        List<Item> retList = new ArrayList<Item>();
        
        List<Item> rs = (List<Item>) query.getResultList();
        for (Item newItem : rs) {
            if (newItem.getBanned() == 0) {
                   retList.add(newItem);
                }
            addItem(newItem);
        }

        System.out.println("Size: " + retList.size());
        return retList;
    }
    
    
    public List<Item> getCollection(String category) {
        System.out.println("Query: " + category);
        List<Item> retList = new ArrayList<>();
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
        //All books in wishlist
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
        //currently available books in wishlist
        else if (category.equals("WishListA")) {
            query = em.createQuery("SELECT w FROM WishList w WHERE w.userName = ?1");
            query.setParameter(1, user.getUserName());
            List<WishList> rs = (List<WishList>) query.getResultList();
            for (WishList wishItem : rs) {
                Item item = findItem(wishItem.getIsbn());
                if(item.getBanned()==0){
                    if(item.getAvailableCopies()!=0){
                        retList.add(item);
                    }
                }             
            }
            return retList;
        } 
        else if (category.equals("Holds")) {
            query = em.createQuery("SELECT h FROM Holds h WHERE h.userName = ?1");
            query.setParameter(1, user.getUserName());
            List<Holds> rs = (List<Holds>) query.getResultList();
            for (Holds holdItem : rs) {
                Item item = findItem(holdItem.getIsbn());
                if (item.getBanned() == 0) {
                    retList.add(item);
                }
            }
            return retList;
        } 
        else if (category.equals("Recommended")) {
            query = em.createQuery("SELECT r FROM RecommendedList r WHERE r.userName = ?1");
            query.setParameter(1, user.getUserName());
            List<RecommendedList> rs = (List<RecommendedList>) query.getResultList();
            for (RecommendedList recommendedItem : rs) {
                Item item = findItem(recommendedItem.getIsbn());
                if (item.getBanned() == 0) {
                    retList.add(item);
                }
            }
            return retList;
        }
        else if(category.equals("AllRecommended")){
            query = em.createQuery("SELECT DISTINCT(r.isbn) FROM RecommendedList r WhERE r.status=?1");
            query.setParameter(1, "wait");
            List<String> rs = (List<String>)query.getResultList();
            for(int i=0;i<rs.size();i++){
                retList.add(findItem(rs.get(i)));
            }
            return retList;
        }
        else if(category.equals("BannedBooks")){
             query = em.createQuery("SELECT i FROM Item i WhERE i.banned=1");
             retList = (List<Item>) query.getResultList();
             return retList;
        }
        else if(category.equals("bestSeller")){
            query = em.createQuery("SELECT i FROM Item i WHERE i.borrowedTimes>0 ORDER BY i.borrowedTimes DESC");
            query.setMaxResults(10);       
        }
        else {
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
        return retList;
    }

     public List<RateList> getRateList(User user){
        String userName=user.getUserName();
        List<RateList> listreturn = new ArrayList();
        Query query1=em.createQuery("Select e " + "from  RateList e " + "Where e.userName= '"+userName+"'");
        List<RateList> list=(List<RateList>)query1.getResultList( ); 
        int counter = 0;
        for (RateList rateItem : list) {
               Item item = findItem(rateItem.getIsbn());
                if (item.getBanned() == 0) {
                    listreturn.add(list.get(counter));
                }
                counter = counter +1;
            }
        
        //need to check if book has been banned
        return listreturn;
    } 
    
    //set banned=1
    public String banABook(String ISBN){
        String message;
        Item item=findItem(ISBN);
        if(item==null){
            message="Wrong ISBN. Please try again!";
        }
        else{
            if(item.getBanned()==1){
                message="You've already banned this book!";
            }
            else{
                em.getTransaction().begin();
                item.setBanned(1);
                em.getTransaction().commit();
                message="success";
            }
        }
        return message;
    }
    //set banned=0
    public String unbanABook(String ISBN){
        String message;
        Item item=findItem(ISBN);
        if(item==null){
            message="Failed. Please try again!";
        }
        else{
            em.getTransaction().begin();
            item.setBanned(0);
            em.getTransaction().commit();
            message="success";
        }
        return message;
    }
    public String dismiss(String ISBN){
        String message;
        Item item=findItem(ISBN);
        if(item==null){
            message="Failed. Please try again!";
        }
        else{
            Query query = em.createQuery("SELECT r FROM RecommendedList r WHERE r.isbn = ?1");
            query.setParameter(1,ISBN);
            List<RecommendedList> rs = (List<RecommendedList>) query.getResultList();
            for(RecommendedList recommendedItem : rs){
                em.getTransaction().begin();
                recommendedItem.setStatus("dismiss"); //set status to dismiss
                em.getTransaction().commit();
            }
            message="success";
        }
        return message;
    }
    public String purchase(String ISBN, int amount,int flag){
        String message;
        Item item=findItem(ISBN);
        if(item==null){
            message="The boook is currently not in our database.Please try another one!";
        }
        else{
            em.getTransaction().begin();
            item.setAvailableCopies(item.getAvailableCopies()+amount);
            item.setTotalCopies(item.getTotalCopies()+amount);
            if(flag==0){ //update status in recommended table
                Query query = em.createQuery("SELECT r FROM RecommendedList r WHERE r.isbn = ?1");
                query.setParameter(1,ISBN);
                List<RecommendedList> rs = (List<RecommendedList>) query.getResultList();
                for(RecommendedList recommendedItem : rs){
                    recommendedItem.setStatus("approved"); //set status to approved
                }
            }
            em.getTransaction().commit();
            message="success";
        }
        return message;
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
    public void updateUser(String newFName, String newLName, String newEmail, String newPassword, String newPhoneNumber,String newLendingPeriod,String newMaturityLevel) {
        em.getTransaction().begin();
        user.setFirstName(newFName);
        user.setLastName(newLName);
        user.setEmail(newEmail);
        user.setPassword(newPassword);
        user.setPhoneNumber(newPhoneNumber);
        user.setLendingPeriod(newLendingPeriod);
        user.setMaturityLevel(newMaturityLevel);
        em.getTransaction().commit();
    }

    public void removeUser(String userName) {
        em.getTransaction().begin();
        em.remove(user);
        em.getTransaction().commit();
    }
    
   
}
