package bean;

public class MessageBean {
    private String username;
    private String datetime;
    private String title;
    private String message;

    @Override
    public String toString() {
        return "MessageBean{" +
                "username='" + username + '\'' +
                ", datetime='" + datetime + '\'' +
                ", title='" + title + '\'' +
                ", message='" + message + '\'' +
                '}';
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
