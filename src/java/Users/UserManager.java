package Users;

import java.io.Serializable;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class UserManager {
    User user;
    private EntityManagerFactory emfactory;
    private EntityManager entitymanager;
    
    public UserManager(){
        emfactory = Persistence.createEntityManagerFactory("308ProjectPU1" );
        entitymanager = emfactory.createEntityManager( );
    }
    public void login(String username, String password){
        //query database, return success or error?
    }
    
    public  boolean register(String firstName,String lastName,String password,String email,int role,String userName){
        boolean success=false;
       
        if(userExist(userName)==false){
            User newUser = new User();
            entitymanager.getTransaction().begin( );
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
            success=true;
        }
        return success;
    }
    
    public User getUser() {
        return this.user;
    }
    
    //check if userName is already taken
    public boolean userExist(String userName){
        User u= entitymanager.find( User.class, userName );
        return u != null;
    }
    
}
