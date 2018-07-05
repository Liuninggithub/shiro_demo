package cn.ln.shiro_demo.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import java.io.Serializable;
@Entity(name = "sys_role_permission")
@IdClass(SysRolePermissionMutiKer.class)
public class SysRolePermission implements Serializable {

    @Id
    private String permissionId;
    @Id
    private String roleId;

    public String getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(String permissionId) {
        this.permissionId = permissionId;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }
}
