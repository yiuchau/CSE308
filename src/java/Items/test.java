/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Items;

import Users.User;
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
       ItemManager im=new ItemManager();
       User user=new User();
       user.setEmail("yi.xie.4@stonybrook.edu");
       user.setFirstName("Yi4");
       user.setLastName("Xie2");
       user.setRole(1);
       user.setPassword("aaa");
       user.setUserName("123");
       user.setPhoneNumber("12324");
       List<CheckoutList> list=im.getCheckoutList(user);
       for( CheckoutList e:list ) {
          String number=e.getIsbn();
          System.out.println(number);
          Item i=im.getInformationByISBN(number);
          System.out.println(i.getTitle());
        }
       
       
    }
}
