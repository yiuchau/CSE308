
package Items;


import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class ItemManager {
    private List<Item> itemCollection;
    
    public ItemManager() {
        //initialize itemCollection
        itemCollection = new ArrayList<Item>();
        System.out.println("Test: ItemManager instantiated.");
    }
    
    Item findItem(Long ISBN) {
        
        
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
    
    void createItem(Item item) {
        
        EntityManagerFactory emf = Persistence.createEntityManagerFactory( "CSE308WebAppPU" );
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.persist(item);
        em.getTransaction().commit();
        emf.close();
        em.close();
    }
    
    void updateItemTitle(Long ISBN, String newTitle) {
        Item itemToUpdate = findItem(ISBN);
        
        EntityManagerFactory emf = Persistence.createEntityManagerFactory( "CSE308WebAppPU" );
        EntityManager em = emf.createEntityManager();
        em.getTransaction( ).begin( );
        itemToUpdate.setTitle(newTitle);
        em.getTransaction().commit();
        emf.close();
        em.close();
    }
    
    void deleteItem(Long ISBN) {
        
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
    
    void queryExample() {
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
}
