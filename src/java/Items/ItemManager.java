package Items;

import Users.User;
import com.sun.mail.smtp.SMTPTransport;
import java.security.Security;
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
import java.util.Properties;
import javax.annotation.PreDestroy;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
    
    public Item findItemByID(int id){
        Item i = em.find(Items.Item.class, id);
        return i;
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
            newItem.setSuspendHold(currentDate);
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
    
    /*
    public List<Item> basicSearch(String searchParameter) {
        Query query = em.createQuery("SELECT i FROM Item i WHERE i.title LIKE ?1 OR i.author LIKE ?2");
    
                
        searchParameter = '%' + searchParameter + '%';
        query.setParameter(1, searchParameter);
        query.setParameter(2, searchParameter);
        
        List<Item> retList = new ArrayList<Item>();
        
        List<Item> rs = (List<Item>) query.getResultList();
        for (Item newItem : rs) {
            addItem(newItem);
            retList.add(newItem);
        }

        System.out.println("Size: " + retList.size());
        return retList;
    }*/
    
    public List<Item> search(String queryString) {
        Query query = em.createQuery(queryString);
        List<Item> retList = new ArrayList<Item>();
        
        List<Item> rs = (List<Item>) query.getResultList();
        for (Item newItem : rs) {
            addItem(newItem);
            
            retList.add(newItem);
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
     
    public String updateInformation(Item newItem){
        String message="";
        
        //add a new item
        if(itemExist(newItem.getID())==false){
            em.getTransaction().begin();
            em.persist(newItem);
            em.getTransaction().commit();
            message=newItem.getTitle()+" added to library\r\n";
        }
        //modify a book information(isbn/title/author)
        else{
            int flag=0; //number of fileds to be updated
            int id=newItem.getID();
            Item itemToUpdate=findItemByID(id);
            if(!itemToUpdate.getISBN().equals(newItem.getISBN())){
                flag++;
                em.getTransaction().begin();
                itemToUpdate.setISBN(newItem.getISBN());
                em.getTransaction().commit();
                message=message+" Book ISBN updated, new ISBN: " +newItem.getISBN()+ "  ";
               
            }
            if(!itemToUpdate.getTitle().equals(newItem.getTitle())){
                flag++;
                em.getTransaction().begin();
                itemToUpdate.setTitle(newItem.getTitle());
                em.getTransaction().commit();
                message=message+" Book Title updated, new Title: " +newItem.getTitle()+ "  ";
            }
            if(!itemToUpdate.getAuthor().equals(newItem.getAuthor())){
                flag++;
                em.getTransaction().begin();
                itemToUpdate.setAuthor(newItem.getAuthor());
                em.getTransaction().commit();
                message=message+" Book Author updated, new Author: " +newItem.getAuthor()+ "  ";
               
            }
            if(flag==0){
                message="No changes made on book "+itemToUpdate.getTitle();
            }
        }
        return message;
    }
    
    public boolean itemExist(int id) {
        Item i = em.find(Items.Item.class, id);
        return i != null;
    }
    
    
    public void notifyUser(String ISBN,int amount) throws MessagingException{
        //System.out.println("hhh");
       Query query1=em.createQuery("Select e " + "from  Holds e " + "Where e.isbn= ?1" );
       query1.setParameter(1,ISBN);
       List<Holds> returnList =(List<Holds>)query1.getResultList( );
        if(returnList.isEmpty()==false){
            query1=em.createQuery("Select e " + "from  Holds e " + "Where e.isbn= ?1 ORDER BY e.placeHoldTime ASC" );
            query1.setParameter(1,ISBN);
            Item item=findItem(ISBN);
            returnList =(List<Holds>)query1.getResultList( );
            for(int i=0;i<amount;i++){
                User u=findUser(returnList.get(i).getUserName());
                send("308cedar","308cedar123",u.getEmail(),"",item.getTitle()+" is available now! ",item.getTitle()+" is available now! ");
            }
        }
    }
    
     public void send(final String username, final String password, String recipientEmail, String ccEmail, String title, String message) throws AddressException, MessagingException {
        Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
        final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory";
        // Get a Properties object
        Properties props = System.getProperties();
        props.setProperty("mail.smtps.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
        props.setProperty("mail.smtp.socketFactory.fallback", "false");
        props.setProperty("mail.smtp.port", "465");
        props.setProperty("mail.smtp.socketFactory.port", "465");
        props.setProperty("mail.smtps.auth", "true");
        props.put("mail.smtps.quitwait", "false");
        Session session = Session.getInstance(props, null);
        // -- Create a new message --
        final MimeMessage msg = new MimeMessage(session);
        // -- Set the FROM and TO fields --
        msg.setFrom(new InternetAddress(username + "@gmail.com"));
        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail, false));
        if (ccEmail.length() > 0) {
            msg.setRecipients(Message.RecipientType.CC, InternetAddress.parse(ccEmail, false));
        }
        msg.setSubject(title);
        msg.setText(message, "utf-8");
        msg.setSentDate(new Date());
        SMTPTransport t = (SMTPTransport)session.getTransport("smtps");
        t.connect("smtp.gmail.com", username, password);
        t.sendMessage(msg, msg.getAllRecipients());      
        t.close();
    }
     
     
    //remove book from library
    public String removeBook(String ISBN){
        String returnMessage="";
        Item item=findItem(ISBN);
        if(item==null){
            returnMessage="The book is not in our library.Please try another one!";
        }
        else{
            em.getTransaction().begin();
            em.remove(item);
            em.getTransaction().commit();
            returnMessage="success";
        }
        return returnMessage;
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
    
    public User findUser(String userName){
        User u = em.find(Users.User.class, userName);
        return u;
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
    
    public void updateHold(String email, Holds h, String type, String days) {
        em.getTransaction().begin();
        if(!days.equals("")){
            int days2 = Integer.parseInt(days);  
            Date today = new Date();
            Calendar c = Calendar.getInstance();
            c.setTime(today); 
            c.add(Calendar.DATE, days2); 
            Date newDate =c.getTime();
            h.setSuspendHold(newDate); 
        }
        h.setCheckOutType(type);
        if(!email.equals("")){
          user.setEmail(email);
        }
        em.getTransaction().commit();
    }
    
    
    
    public void updateUser2(User userupdated,String newFName, String newLName, String newEmail, String newPassword, String newPhoneNumber,String newLendingPeriod,String newMaturityLevel, int role) {
        em.getTransaction().begin();
        userupdated.setFirstName(newFName);
        userupdated.setLastName(newLName);
        userupdated.setEmail(newEmail);
        userupdated.setPassword(newPassword);
        userupdated.setPhoneNumber(newPhoneNumber);
        userupdated.setLendingPeriod(newLendingPeriod);
        userupdated.setMaturityLevel(newMaturityLevel);
        userupdated.setRole(role);
        em.getTransaction().commit();
    }

    public void removeUser(String userName) {
        em.getTransaction().begin();
        em.remove(user);
        em.getTransaction().commit();
    }
    
    public void deleteUser(User userName) {
        em.getTransaction().begin();
        em.remove(userName);
        em.getTransaction().commit();
    }
    
    public void removeCheckOut(CheckoutList u){
        em.getTransaction().begin();
        em.remove(u);
        em.getTransaction().commit();
    }
    
    public void removeWish(WishList u){
        em.getTransaction().begin();
        em.remove(u);
        em.getTransaction().commit();
    }
    
    public void removeHolds(Holds u){
        em.getTransaction().begin();
        em.remove(u);
        em.getTransaction().commit();
    }
    
    public void removeRate(RateList u){
        em.getTransaction().begin();
        em.remove(u);
        em.getTransaction().commit();
    }
    
    public void removeRe(RecommendedList u){
        em.getTransaction().begin();
        em.remove(u);
        em.getTransaction().commit();
    }
    
    public List<CheckoutList> getCheckoutList(User user){
        String userName=user.getUserName();
        List<CheckoutList> listreturn = new ArrayList();
        Query query1=em.createQuery("Select e " + "from  CheckoutList e " + "Where e.userName= '"+userName+"'");
        listreturn =(List<CheckoutList>)query1.getResultList( ); 
        return listreturn;
    } 
    
    public List<WishList> getWishList(User user){
        String userName=user.getUserName();
        List<WishList> listreturn = new ArrayList();
        Query query1=em.createQuery("Select e " + "from  WishList e " + "Where e.userName= '"+userName+"'");
        listreturn =(List<WishList>)query1.getResultList( ); 
        return listreturn;
    } 
    
    public List<Holds> getHolds(User user){
        String userName=user.getUserName();
        List<Holds> listreturn;
        Query query1=em.createQuery("Select e " + "from  Holds e " + "Where e.userName= '"+userName+"'");
        listreturn =(List<Holds>)query1.getResultList( ); 
        return listreturn;
    }
    
    public List<RateList> getAllRateList(User user){
        String userName=user.getUserName();
        List<RateList> listreturn = new ArrayList();
        Query query1=em.createQuery("Select e " + "from  RateList e " + "Where e.userName= '"+userName+"'");
        listreturn=(List<RateList>)query1.getResultList( ); 
        
        return listreturn;
    }
    
    public List<RecommendedList> getRecomList(User user){
        String userName=user.getUserName();
        List<RecommendedList> listreturn = new ArrayList();
        Query query1=em.createQuery("Select e " + "from  RecommendedList e " + "Where e.userName= '"+userName+"'");
        listreturn=(List<RecommendedList>)query1.getResultList( ); 
        
        return listreturn;
    }
   
}
