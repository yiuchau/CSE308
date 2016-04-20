package Users;

import java.io.Serializable;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class UserManager {
    User user;
    
    public int login(String username, String password){
        int test = 3 + 3;  
        return test;
    }
    
    public  void register(){
        
      EntityManagerFactory emfactory = Persistence.createEntityManagerFactory("308ProjectPU1" );
      
      EntityManager entitymanager = emfactory.createEntityManager( );
      entitymanager.getTransaction( ).begin( );

      User employee = new User( ); 
      employee.setFirstName( "Yiiiii" );
      employee.setLastName( "Xie" );
      employee.setEmail("anc");
      employee.setPassword("erer");
      employee.setRePassword("wewewewe");
      entitymanager.persist( employee );
      entitymanager.getTransaction( ).commit( );

      entitymanager.close( );
      emfactory.close( );
        //System.out.println("aaaaa");
    }
}
