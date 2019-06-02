package grade.bean;

public class Grade {
    private String username;
    private float classGrade;
    private float midGrade;
    private float finalGrade;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public float getClassGrade() {
        return classGrade;
    }

    public void setClassGrade(float classGrade) {
        this.classGrade = classGrade;
    }

    public float getMidGrade() {
        return midGrade;
    }

    public void setMidGrade(float midGrade) {
        this.midGrade = midGrade;
    }

    public float getFinalGrade() {
        return finalGrade;
    }

    public void setFinalGrade(float finalGrade) {
        this.finalGrade = finalGrade;
    }

    public float getGrade() {
        return classGrade * 0.2f + midGrade * 0.3f + finalGrade * 0.5f;
    }
}
