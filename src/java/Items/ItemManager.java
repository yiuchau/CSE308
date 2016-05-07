
package Items;


import Users.User;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class ItemManager {
    private List<Item> itemCollection;
    Item item;
    User user;
    
    public ItemManager() {
        //initialize itemCollection
        itemCollection = new ArrayList<Item>();
        System.out.println("Test: ItemManager instantiated.");
    }
    
    public List<Item> getItemCollection() {
        return this.itemCollection;
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
    
    public void addItem(Item newItem) {
        
        Iterator<Item> it = itemCollection.iterator();
        
        while(it.hasNext()) {
            Item oldItem = it.next();
            if(oldItem.getISBN().equals(newItem.getISBN())){
                it.remove();
            }
        }
        
        itemCollection.add(newItem);
        System.out.println("Item " + newItem.getISBN() + "added to collection.");
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
        
        System.out.println("Generating Most Popular Items.");
        EntityManagerFactory emf = Persistence.createEntityManagerFactory( "308ProjectPU" );
        EntityManager em = emf.createEntityManager();
        
        Query query = em.createQuery("Select e " + "from Item e " + "Order by e.averageRating Desc");
        
        List<Item> rs = (List<Item>)query.getResultList( );
       
        for(Item newItem: rs) {
           System.out.println("Iterating through: " + newItem.getTitle());
           if(newItem.getImageURL().equals("None")){
               newItem.setImageURL("images/100X125.gif");
           }
           addItem(newItem);
        }
        
        em.close();
        emf.close();
        return rs;
    }
    
    public List getNewEBooks(){
        
        
        System.out.println("Generating Most Recent Items.");
        
        EntityManagerFactory emf = Persistence.createEntityManagerFactory( "308ProjectPU" );
        EntityManager em = emf.createEntityManager();
        Query query1 = em.createQuery("Select e " + "from Item e " + "Order by e.releaseDate Desc");
        List<Item> list1=(List<Item>)query1.getResultList( );
        for( Item e:list1 ) {
           if("none".equals(e.getImageURL())){
               e.setImageURL("images/100X125.gif");
           }
           addItem(e);
        }
        em.close();
        emf.close();
        return list1;
    }
    
    public List getRecommendations(){
        
        
        System.out.println("Generating Recommended Items.");
        
        EntityManagerFactory emf = Persistence.createEntityManagerFactory( "308ProjectPU" );
        EntityManager em = emf.createEntityManager();
        Query query1=null;
        //recommendations for guest
        if(user==null){
            query1 = em.createQuery("Select e " + "from Item e " + "Order by e.totalCopies Desc");
        }
        
        List<Item> list1=(List<Item>)query1.getResultList( );
        for( Item e:list1 ) {
           if("none".equals(e.getImageURL())){
               e.setImageURL("images/100X125.gif");
           }
           
           
           addItem(e);
           
        }
        em.close();
        emf.close();
        return list1;
    }
    
    
}
