
import Users.User;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author yixxie
 */
public class Test {
    public static void main(String args[]){
        //System.out.println("sss");
         EntityManagerFactory emfactory = Persistence.createEntityManagerFactory("308ProjectPU1" );
      
      EntityManager entitymanager = emfactory.createEntityManager( );
      entitymanager.getTransaction( ).begin( );

      User employee = new User( ); 
      employee.setFirstName( "1202" );
      employee.setLastName( "Gopall" );
      employee.setEmail("sssss");
      employee.setPassword("jshdjshjds");
      employee.setRePassword("sdsdsd");
      
      //employee.setSalary( 400000 );
      //employee.setDeg( "Technical Manager" );
      
      entitymanager.persist( employee );
      entitymanager.getTransaction( ).commit( );

      entitymanager.close( );
      emfactory.close( );
    }
}
