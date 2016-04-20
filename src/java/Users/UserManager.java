package Users;

import java.io.Serializable;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class UserManager {
    User user;
    
    public void login(String username, String password){
        //query database, return success or error?
    }
    
    public  void register(String firstName,String lastName,String password,String email,int role,String userName){
       
      EntityManagerFactory emfactory = Persistence.createEntityManagerFactory("308ProjectPU1" );
      EntityManager entitymanager = emfactory.createEntityManager( );
      entitymanager.getTransaction().begin( );
      User newUser = new User();
      newUser.setFirstName(firstName);
      newUser.setLastName(lastName );
      newUser.setEmail(email);
      newUser.setPassword(password);
      newUser.setRole(role);
      newUser.setUserName(userName);
      entitymanager.persist( newUser );
      entitymanager.getTransaction( ).commit( );
      entitymanager.close( );
      emfactory.close( );
    }
    
    public User getUser() {
        return this.user;
    }
}
