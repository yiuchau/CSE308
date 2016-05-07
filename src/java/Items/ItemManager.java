
package Items;


import Users.User;
import Users.UserManager;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class ItemManager {
    private List<Item> itemCollection;
    Item item;
    UserManager userManager;
    User current;
    
    public ItemManager() {
        //initialize itemCollection
        itemCollection = new ArrayList<Item>();
        System.out.println("Test: ItemManager instantiated.");
    }
    
    public Item findItem(String ISBN) {
        Item retItem;
        for(Item i: itemCollection) {
            if(i.getISBN() == ISBN){
                retItem = i;
                return retItem;
            }
        }
        EntityManagerFactory emf = Persistence.createEntityManagerFactory( "CSE308WebAppPU" );
        EntityManager em = emf.createEntityManager();
        retItem = em.find( Item.class, ISBN);
        emf.close();
        em.close();
        itemCollection.add(retItem);
        return retItem;
    }
    
    public void createItem(Item item) {
        
        EntityManagerFactory emf = Persistence.createEntityManagerFactory( "CSE308WebAppPU" );
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(item);
        em.getTransaction().commit();
        emf.close();
        em.close();
    }
    
    public void updateItemTitle(String ISBN, String newTitle) {
        Item itemToUpdate = findItem(ISBN);
        EntityManagerFactory emf = Persistence.createEntityManagerFactory( "CSE308WebAppPU" );
        EntityManager em = emf.createEntityManager();
        em.getTransaction( ).begin( );
        itemToUpdate.setTitle(newTitle);
        em.getTransaction().commit();
        emf.close();
        em.close();
    }
    
    public void deleteItem(String ISBN) {
        
        EntityManagerFactory emf = Persistence.createEntityManagerFactory( "CSE308WebAppPU" );
        EntityManager em = emf.createEntityManager();
        Item itemToDelete = findItem(ISBN);
        em.getTransaction( ).begin( );
        //remove item from collection
        em.remove( itemToDelete );
        em.getTransaction( ).commit( );
        em.close();
        emf.close();
    }
    
    public void queryExample() {
        		//Scalar function
                        
        EntityManagerFactory emf = Persistence.createEntityManagerFactory( "CSE308WebAppPU" );
        EntityManager em = emf.createEntityManager();
        Query query = em.createQuery("Select UPPER(e.ename) from Employee e");
        List<String> list=query.getResultList();
		
        for(String e:list)
	{
            System.out.println("Employee NAME :"+e);
	}
	
        //Aggregate function
	Query query1 = em.createQuery("Select MAX(e.salary) from Employee e");
	Double result=(Double) query1.getSingleResult();
	System.out.println("Max Employee Salary :"+result);
        
        //Between
		Query query2 = em.createQuery( "Select e " +
                                             "from Employee e " +
					     "where e.salary " +
					     "Between 30000 and 40000" );
		List<Item> list2=(List<Item>)query2.getResultList( );
		 
		for( Item i:list2 )
		{
			//System.out.print("Employee ID :"+ i.getEid( ));
			//System.out.println("\t Employee salary :"+i.getSalary( ));
		}
		
		//Like
		Query query3 = em.
			createQuery("Select e " +
					    "from Employee e " +
					    "where e.ename LIKE 'M%'");
		List<Item> list3=(List<Item>)query1.getResultList( );
		for( Item e:list3 )
		{
			//System.out.print("Employee ID :"+e.getEid( ));
			//System.out.println("\t Employee name :"+e.getEname( ));
		}
                emf.close();
                em.close();
    }
    
    public List getMostPopular(){                       
        EntityManagerFactory emf = Persistence.createEntityManagerFactory( "308ProjectPU" );
        EntityManager em = emf.createEntityManager();
        Query query1 = em.createQuery("Select e " + "from Item e " + "Order by e.averageRating Desc");
        List<Item> list1=(List<Item>)query1.getResultList( );
        for( Item e:list1 ) {
           if("none".equals(e.getImageURL())){
               e.setImageURL("images/100X125.gif");
           }
        }
        em.close();
        emf.close();
        return list1;
    }
    
     public List getNewEBooks(){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory( "308ProjectPU" );
        EntityManager em = emf.createEntityManager();
        Query query1 = em.createQuery("Select e " + "from Item e " + "Order by e.releaseDate Desc");
        List<Item> list1=(List<Item>)query1.getResultList( );
        for( Item e:list1 ) {
          if("none".equals(e.getImageURL())){
              e.setImageURL("images/100X125.gif");
          }
        }
       em.close();
       emf.close();
       return list1;
    }
    
    public List getRecommendations(){
        
        EntityManagerFactory emf = Persistence.createEntityManagerFactory( "308ProjectPU" );
        EntityManager em = emf.createEntityManager();
        Query query;
        List<Item> list = null;
        //recommendations for guest
        current=userManager.getUser();
        System.out.println(current.getFirstName());
        if(current==null){
            query = em.createQuery("Select e " + "from Item e " + "Order by e.totalCopies Desc");
            list=(List<Item>)query.getResultList( );
        }
        else{
             Query query1 = em.createQuery("Select e " + "from Item e " + "Order by e.releaseDate Desc");
             list=(List<Item>)query1.getResultList( );
        }
        /**
        //recommendations for member
        else{
            List<CheckoutList> checkouts=getCheckoutList();
            //user hasn't borrowed a book yet
            
            if(checkouts.isEmpty()){
                query = em.createQuery("Select e " + "from Item e " + "Order by e.totalCopies Desc");
                list=(List<Item>)query.getResultList( );
            }
            
            else{
                List<String> category = new ArrayList<>();
                for(CheckoutList e:checkouts ) {
                    category.add(getInformationByISBN(e.getISBN()).getCategories());
                }
                for(String c:category ) {
                    Query tempQuery = em.createQuery("Select e " + "from Item e " + "where e.categories="+c);
                    List<Item> tempList=(List<Item>)tempQuery.getResultList( );
                    list.addAll(tempList);
                }
            }
        }
        for( Item e:list ) {
           if("none".equals(e.getImageURL())){
               e.setImageURL("images/100X125.gif");
           }
        }
*/
        em.close();
        emf.close();
        
        return list;
    }
    
    public List getCheckoutList(User user){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory( "308ProjectPU2" );
        EntityManager em = emf.createEntityManager();
        String userName=user.getUserName();
        Query query1=em.createQuery("Select e " + "from  CheckoutList e " + "Where e.userName="+userName);
        List<CheckoutList> list=(List<CheckoutList>)query1.getResultList( );
        em.close();
        emf.close();
        return list;
    }
    
    public Item getInformationByISBN(String ISBN){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory( "308ProjectPU" );
        EntityManager em = emf.createEntityManager();
        Query query=em.createQuery("Select e " + "from  Item e " + "Where e.isbn="+ISBN);
        Item item=(Item)query.getSingleResult();
        em.close();
        emf.close();
        return item;
    }
}
