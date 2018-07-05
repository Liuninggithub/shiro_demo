package cn.ln.shiro_demo.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.io.Serializable;

public class SysRolePermissionMutiKer implements Serializable {

    private String permissionId;
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
