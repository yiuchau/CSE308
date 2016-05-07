package Users;

import java.io.Serializable;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class UserManager implements Serializable{

    User user;

    public String login(String username, String password) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("308ProjectPU1");
        EntityManager em = emf.createEntityManager();
        String retValue;
        User user = em.find(User.class, username);
        if (user == null) {
            retValue = "User Name doesn't exist. Please register first";
        } else if (user.getPassword().equals(password)) {
            this.setUser(user);
            retValue = "Success";
        } else {
            retValue = "Incorrect password";
        }
        em.close();
        emf.close();
        return retValue;
    }

    public boolean register(User newUser){
        boolean retValue = false;
        if (userExist(newUser.getUserName()) == false) {
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("308ProjectPU1");
            EntityManager em = emf.createEntityManager();
            em.getTransaction().begin();
            em.persist(newUser);
            em.getTransaction().commit();
            em.close();
            emf.close();
            if(userExist(newUser.getUserName())){
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

    //check if userName is already taken
    public boolean userExist(String userName) {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("308ProjectPU1");
        EntityManager em = emf.createEntityManager();
        User u = em.find(User.class, userName);
        em.close();
        emf.close();
        return u != null;
    }
    
    public void signOut() {
        this.user = null;
    }

    //update user information
    public void update(String newFName,String newLName,String newEmail,String newPassword){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("308ProjectPU1");
        EntityManager em = emf.createEntityManager();
        em.getTransaction( ).begin( );
        User current=em.find(User.class, getUser().getUserName());
        current.setFirstName(newFName);
        current.setLastName(newLName);
        current.setEmail(newEmail);
        current.setPassword(newPassword);
        em.getTransaction( ).commit( );
        em.close();
        emf.close();
        setUser(current);
    }
    //delete user account
    public void remove(String userName){
        EntityManagerFactory emf = Persistence.createEntityManagerFactory("308ProjectPU1");
        EntityManager em = emf.createEntityManager();
        em.getTransaction( ).begin( );
        User current=em.find(User.class, getUser().getUserName());
        em.remove( current );
        em.getTransaction( ).commit( );
        em.close( );
        emf.close( );
    }

}
