package Users;

import java.io.Serializable;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class UserManager {

    User user;

    /*
     * @param username
     * @param password
     */
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

    public boolean register(String userName, String password, int role,
            String firstName, String lastName, String email) {
        boolean retValue = false;
        if (userExist(userName) == false) {
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("308ProjectPU1");
            EntityManager em = emf.createEntityManager();
            User newUser = new User();
            em.getTransaction().begin();
            newUser.setFirstName(firstName);
            newUser.setLastName(lastName);
            newUser.setEmail(email);
            newUser.setPassword(password);
            newUser.setRole(role);
            newUser.setUserName(userName);
            em.persist(newUser);
            em.getTransaction().commit();
            em.close();
            emf.close();
            if(userExist(userName)){
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

}
