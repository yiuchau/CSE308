/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Items;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

/**
 *
 * @author yixxie
 * Used to test database
 */
public class test {
    public static void main(String[] args){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory( "308ProjectPU2" );
        EntityManager em = emf.createEntityManager();
        Query query=null;
        Query query1=em.createQuery("Select e " + "from  CheckoutList e " + "Where e.userName='yii'");
        List<CheckoutList> list1=(List<CheckoutList>)query1.getResultList( );
            if(list1.isEmpty()){
                 query = em.createQuery("Select e " + "from Item e " + "Order by e.totalCopies Desc");
                 List<Item> list2=(List<Item>)query.getResultList( );
            }
            else{
                CheckoutList book1=list1.get(0);
                System.out.println(book1.getId()+" "+book1.getISBN()+" "+book1.getUserName()+" "+book1.getCheckoutTime()+" "+book1.getDueTime());
            }
    }
}
