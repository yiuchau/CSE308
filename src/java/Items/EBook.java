
package Items;

import java.io.Serializable;

public class EBook extends Item implements Serializable {
    
    
    String author;
    int pages;
    
    public EBook() {
        super();
    }
    //Test bean only, needs to be changed later
     public String[] getList(){
        String[] list={"images/book1.jpg","images/book2.jpg","images/book3.jpg","images/book4.jpg","images/book5.jpg","images/book6.jpg"};
        return list;
    } 
}
