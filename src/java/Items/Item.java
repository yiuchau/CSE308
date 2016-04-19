
package Items;

import java.util.Date;


public abstract class Item {
    
    public enum Type {
        Ebook, AudioBook, Movie
    }
    
    public Item() {
        
    }
    
    Type type;
    Long ISBN;
    String title;
    String description;
    String publisher;
    Date releaseDate;
    // URL imageURL;
    //genre
    double averageRating;
    int totalCopies;
    int availableCopies;
       
}
