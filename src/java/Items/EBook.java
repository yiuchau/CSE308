
package Items;

import java.io.Serializable;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue( value="Ebook" )
public class EBook extends Item implements Serializable {
    
    
    String author;
    int pages;
    
    public EBook() {
        super();
    }
    
    
    
}
