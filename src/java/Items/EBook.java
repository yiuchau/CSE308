/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Items;

import java.io.Serializable;

/**
 *
 * @author yiulin
 */
public class EBook extends Item implements Serializable {
    
    //Test bean only, needs to be changed later
     public String[] getList(){
        String[] list={"images/book1.jpg","images/book2.jpg","images/book3.jpg","images/book4.jpg","images/book5.jpg","images/book6.jpg"};
        return list;
    } 
}
