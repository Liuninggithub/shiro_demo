package cn.ln.shiro_demo.domain;

import javax.persistence.*;
import java.io.Serializable;

@Entity(name = "sys_permission")
public class SysPermission implements Serializable {

    @Id
    private String permissionId;

    /**
     * 权限名称
     */
    private String permissionName;

    /**
     * 资源类型
     * 0-菜单
     * 1-api接口
     */
//    private String resourceType;

    private String url; // 资源路径

    /**
     *  权限编码
     *  用来校验用户是否有权限访问
     */
    private String permission;


    /**
     * 父节点
     */
    private String parentsId;

    /**
     * 状态
     *  0-正常
     *  1-禁用
     */
    private String status;

    public String getPermissionId() {
        return permissionId;
    }

    public void setPermissionId(String permissionId) {
        this.permissionId = permissionId;
    }

    public String getPermissionName() {
        return permissionName;
    }

    public void setPermissionName(String permissionName) {
        this.permissionName = permissionName;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    public String getParentsId() {
        return parentsId;
    }

    public void setParentsId(String parentsId) {
        this.parentsId = parentsId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }


}
