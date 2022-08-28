package User;

public class UserDTO {
    private String UserName;
    private String UserGender;
    private String UserID;
    private String UserPassword;
    private String UserEmail;
    private String UserPhoneNumber;

    public UserDTO(String UserName, String userGender, String UserID, String UserPassword, String UserEmail, String UserPhoneNumber) {
        super();
        this.UserName = UserName;
        this.UserGender = userGender;
        this.UserID = UserID;
        this.UserPassword = UserPassword;
        this.UserEmail = UserEmail;
        this.UserPhoneNumber = UserPhoneNumber;
    }

    public UserDTO() {
        super();
        this.UserID = UserID;
        this.UserPassword = UserPassword;
    }



    public String getUserName() {
        return UserName;
    }

    public void setUserName(String userName) {
        UserName = userName;
    }

    public String getUserGender() {
        return UserGender;
    }

    public void setUserGender(String userGender) {
        UserGender = userGender;
    }

    public String getUserID() {
        return UserID;
    }

    public void setUserID(String userID) {
        UserID = userID;
    }

    public String getUserPassword() {
        return UserPassword;
    }

    public void setUserPassword(String userPassword) {
        UserPassword = userPassword;
    }

    public String getUserEmail() {
        return UserEmail;
    }

    public void setUserEmail(String userEmail) {
        UserEmail = userEmail;
    }

    public String getUserPhoneNumber() {
        return UserPhoneNumber;
    }

    public void setUserPhoneNumber(String userPhoneNumber) {
        UserPhoneNumber = userPhoneNumber;
    }
}
