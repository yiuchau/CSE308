/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Items;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class EMF implements ServletContextListener {

    private static EntityManagerFactory emf;
    final private static String pu = "308ProjectPU";
    
    @Override
    public void contextInitialized(ServletContextEvent event) {
        System.out.println("+++ ServletContextListener : contextInitialized - Inititalizing EMF for PU: " + pu);
        emf = Persistence.createEntityManagerFactory(pu);
        System.out.println("+++ ServletContextListener : contextInitialized - Init EMF done for PU: " + pu);
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {
        System.out.println("+++ ServletContextListener : contextDestroyed - Closing EMF for PU: " + pu);
        emf.close();
        System.out.println("+++ ServletContextListener : contextDestroyed - Closed EMF done for PU " + pu);
    }

    public static EntityManager createEntityManager() {
        if (emf == null) {
            throw new IllegalStateException("Context is not initialized yet.");
        }
        return emf.createEntityManager();
    }
}