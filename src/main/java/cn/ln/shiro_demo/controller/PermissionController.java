package cn.ln.shiro_demo.controller;

import cn.ln.shiro_demo.domain.SysPermission;
import cn.ln.shiro_demo.repository.PermissionRepository;
import cn.ln.shiro_demo.utils.IdGenerator;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.persistence.Id;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("permission")
public class PermissionController {

    @Autowired
    private PermissionRepository permissionRepository;

    @GetMapping("getAll")
    public String getAll(Model model){
        List<SysPermission> list = new ArrayList<>();
        list = permissionRepository.findAll();
        System.out.println(list.toString());
        model.addAttribute("list", list.toString());
        return "permission";
    }

    @PostMapping("getAll")
    @ResponseBody
    public List<SysPermission> get(){
        return permissionRepository.findAll();
    }

    @GetMapping("add")
    public String add(){
        return "system/permission/permissionAdd";
    }

    @PostMapping("add")
    @ResponseBody
    public Map add(SysPermission sysPermission){
        sysPermission.setPermissionId(IdGenerator.getInstance().generateId());
        System.out.println("+++++++++++"+sysPermission.getPermissionName());
        permissionRepository.save(sysPermission);
        Map map = new HashMap();
        map.put("code", "0000");
        map.put("id", sysPermission.getPermissionId());
        map.put("name", sysPermission.getPermissionName());
        return map;
    }

    @PostMapping("getMenu")
    @ResponseBody
    public List getMenu(){
        List<SysPermission> list1 = permissionRepository.findByParentsIdAndStatus("0", "0");
        List<Map> list= new ArrayList<>();
        for (int i=0; i<list1.size(); i++){
            String pId = list1.get(i).getPermissionId();
            List<SysPermission> list2 = permissionRepository.findByParentsIdAndStatus(pId, "0");
            Map map = new HashMap();
            map.put("name", list1.get(i).getPermissionName());
            map.put("id", list1.get(i).getPermissionId());
            List<Map> list4= new ArrayList<>();
            for (int j=0; j<list2.size(); j++){
                String pId2 = list2.get(j).getPermissionId();
                List<SysPermission> list3 = permissionRepository.findByParentsIdAndStatus(pId2, "0");
                System.out.println("======"+j+"=====");
                System.out.println(JSONObject.toJSON(list3));
                Map map1 = new HashMap();
                map1.put("name", list2.get(j).getPermissionName());
                map1.put("id", list2.get(j).getPermissionId());
                map1.put("list", list3);
                list4.add(map1);
            }
            map.put("list", list4);
            list.add(map);
        }

        return list;
    }
}
