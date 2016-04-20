
package Items;

import java.util.Date;
import java.io.Serializable;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;
import javax.persistence.Temporal;


@Entity
@Table
@Inheritance( strategy = InheritanceType.SINGLE_TABLE )
@DiscriminatorColumn( name="type" )
public abstract class Item implements Serializable {

    public enum Type {
        Ebook, AudioBook, Movie
    }
    
    public Item() {
        
    }
    
    @Id
    private Long ISBN;
    private Type type;
    private String title;
    private String description;
    private String publisher;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date releaseDate;
    //URL imageURL;
    //genre
    private double averageRating;
    private int totalCopies;
    private int availableCopies;
    
        /**
     * @return the ISBN
     */
    public Long getISBN() {
        return ISBN;
    }

    /**
     * @param ISBN the ISBN to set
     */
    public void setISBN(Long ISBN) {
        this.ISBN = ISBN;
    }
     
    /**
     * @return the type
     */
    public Type getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(Type type) {
        this.type = type;
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the publisher
     */
    public String getPublisher() {
        return publisher;
    }

    /**
     * @param publisher the publisher to set
     */
    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    /**
     * @return the releaseDate
     */
    public Date getReleaseDate() {
        return releaseDate;
    }

    /**
     * @param releaseDate the releaseDate to set
     */
    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    /**
     * @return the averageRating
     */
    public double getAverageRating() {
        return averageRating;
    }

    /**
     * @param averageRating the averageRating to set
     */
    public void setAverageRating(double averageRating) {
        this.averageRating = averageRating;
    }

    /**
     * @return the totalCopies
     */
    public int getTotalCopies() {
        return totalCopies;
    }

    /**
     * @param totalCopies the totalCopies to set
     */
    public void setTotalCopies(int totalCopies) {
        this.totalCopies = totalCopies;
    }

    /**
     * @return the availableCopies
     */
    public int getAvailableCopies() {
        return availableCopies;
    }

    /**
     * @param availableCopies the availableCopies to set
     */
    public void setAvailableCopies(int availableCopies) {
        this.availableCopies = availableCopies;
    }
       
}
