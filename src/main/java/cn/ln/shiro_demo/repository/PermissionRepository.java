package cn.ln.shiro_demo.repository;


import cn.ln.shiro_demo.domain.SysPermission;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PermissionRepository extends JpaRepository<SysPermission, String> {

    List<SysPermission> findByParentsIdAndStatus(String parentsId, String status);
}
