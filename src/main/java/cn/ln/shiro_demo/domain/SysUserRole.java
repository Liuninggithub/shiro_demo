package cn.ln.shiro_demo.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import java.io.Serializable;

@Entity(name = "sys_user_role")
@IdClass(SysUserRoleMutiKey.class)
public class SysUserRole implements Serializable {

    @Id
    private String userId;
    @Id
    private String roleId;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }
}
