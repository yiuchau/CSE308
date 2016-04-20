
package Items;


import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

public class ItemManager {
    private Item[] itemCollection;
    private EntityManagerFactory emf;
    private EntityManager em;
    
    public ItemManager() {
        //initialize itemCollection
        emf = Persistence.createEntityManagerFactory( "CSE308WebAppPU" );
        em = emf.createEntityManager();
    }
    
    Item findItem(Long ISBN) {
        Item retItem;
        //if item in item collection, set ret
        //item not in itemCollection
        retItem = em.find( Item.class, ISBN);
        //add item to itemCollection
        return retItem;
    }
    
    void createItem(Item item) {
        
        em.getTransaction().begin();
        em.persist(item);
        em.getTransaction().commit();
    }
    
    void updateItemTitle(Long ISBN, String newTitle) {
        Item itemToUpdate = findItem(ISBN);
        
        em.getTransaction( ).begin( );
        itemToUpdate.setTitle(newTitle);
        em.getTransaction().commit();
    }
    
    void deleteItem(Long ISBN) {
        Item itemToDelete = findItem(ISBN);
        em.getTransaction( ).begin( );
        //remove item from collection
        em.remove( itemToDelete );
        em.getTransaction( ).commit( );
    }
    
    void queryExample() {
        		//Scalar function
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
    }
}
