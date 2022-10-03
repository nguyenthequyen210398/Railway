package entity;

public class News implements INews {
    private int id;
    private String title;
    private String publishDate;
    private String author;
    private String content;
    private Float averageRate;

    public static int count = 0 ;


    public void setId(int id) {
        count++;
        this.id = count;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setPublishDate(String publishDate) {
        this.publishDate = publishDate;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getPublishDate() {
        return publishDate;
    }

    public String getAuthor() {
        return author;
    }

    public String getContent() {
        return content;
    }

    public Float getAverageRate() {
        return averageRate;
    }




    @Override
    public void display() {
        System.out.println("News"
                            + "\n" + "title: " + title
                            + "\n" + "publishDate: " + publishDate
                            + "\n" + "author: " + author);

    }

    @Override
    public float calculate() {
        return 0;
    }
}
