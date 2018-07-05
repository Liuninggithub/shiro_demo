package cn.ln.shiro_demo.domain;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity(name = "sys_role")
public class SysRole implements Serializable {


    @Id
    private String roleId;

    private String role;

    private String roleName;

    private String status;

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "SysRole [id=" + roleId + ", role=" + role + ", description=" + roleName + ", status=" + status+ "]";
    }




}
