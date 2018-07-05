package cn.ln.shiro_demo.domain;

import javax.persistence.*;
import java.io.Serializable;

@Entity(name = "user_info")
public class UserInfo implements Serializable {

    @Id
    private String userId;

    @Column(unique = true)
    private String username;

    private String name;

    private String password;

    private String salt;

    private String status;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * 密码盐
     * @return
     */
    public String getCredentialsSalt(){
        return this.username + this.salt;
    }

    @Override
    public String toString() {
        return "UserInfo [uid=" + userId + ", username=" + username + ", name=" + name + ", password=" + password
                + ", salt=" + salt + ", status=" + status + "]";
    }


}
