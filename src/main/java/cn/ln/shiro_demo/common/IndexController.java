//package cn.ln.shiro_demo.common;
//
//import com.alibaba.fastjson.JSON;
//import com.interlink.common.mapper.mng.*;
//import com.interlink.mng.domain.*;
//import org.apache.shiro.SecurityUtils;
//import org.apache.shiro.authc.IncorrectCredentialsException;
//import org.apache.shiro.authc.UnknownAccountException;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
//import java.util.*;
//
//@Controller
//public class IndexController {
//
//    static String correlationID = UUID.randomUUID().toString();
//
//
//
//
//
//    @RequestMapping("/index")
//    public String index(Model model) {
//        model.addAttribute("name", "xf");
//        return "/index";
//    }
//
//    @GetMapping("403")
//    public String err(){
//        return "/403";
//    }
//    @RequestMapping({"/", "/main"})
//    public String main(Model model) {
//
//        UserInfo userInfo = (UserInfo) SecurityUtils.getSubject().getPrincipal();
//        //获取用户的角色信息
//        List<SysUserRole> userRoleList = sysUserRoleMapper.findByUid(correlationID, userInfo.getUid());
//        List<SysPermission> sysPermissionList = new ArrayList<>();
//        List<SysRole> sysRoleList = new ArrayList<>();
//        for (SysUserRole userRole : userRoleList){
//            // 根据roleid查询role信息
//            SysRole sysRole = sysRoleMapper.get(correlationID, userRole.getRoleId());
//            // 添加角色信息
//            sysRoleList.add(sysRole);
//            // 根据 roleID查询关联权限
//            List<SysRolePermission> rolePermissionList =  sysRolePermissionMapper.findByRoleId(correlationID, sysRole.getId());
//            for (SysRolePermission rolePermission : rolePermissionList ){
//                // 根据permissionId查询权限
//                SysPermission sysPermission = sysPermissionMapper.get(correlationID,rolePermission.getPermissionId());
//                // 添加权限信息
//                sysPermissionList.add(sysPermission);
//            }
//        }
//        String permissionList = JSON.toJSONString(sysPermissionList);
//        String roleList = JSON.toJSONString(sysRoleList);
//        model.addAttribute("permissionList", permissionList);
//        model.addAttribute("roleList", roleList);
//        model.addAttribute("name", userInfo.getName());
//
//
//        return "/interlinkMain";
//    }
//
//    @GetMapping("/login")
//    public String login(HttpServletRequest request, Model model) {
//
//        HttpSession session = request.getSession();
//        System.out.println("session================>>>>"+session.toString());
//
//        Enumeration<String> attrs = session.getAttributeNames();
//
//        if(null != session.getAttribute("org.apache.shiro.subject.support.DefaultSubjectContext_PRINCIPALS_SESSION_KEY")){
//            return "redirect:/logout";
//        }
//
//        model.addAttribute("name", "xf");
//        return "/login";
//    }
//
//    @RequestMapping(value = "/login", method = RequestMethod.POST)
//    public String login(HttpServletRequest request, Map<String, Object> map){
//        System.out.println("跳入IndexController.login()");
//        // 登录失败从request中获取shiro信息；
//        // shiroLoginFailure: 就是shro异常类的全类名
//        String exception = (String) request.getAttribute("shiroLoginFailure");
//        System.out.println("exception="+exception);
//        String msg = "";
//
//        if (exception != null) {
//            if (UnknownAccountException.class.getName().equals(exception)) {
//                System.out.println("UnknownAccountException -- > 账号不存在：");
//                msg = "账号不存在";
//            } else if (IncorrectCredentialsException.class.getName().equals(exception)) {
//                System.out.println("IncorrectCredentialsException -- > 密码不正确：");
//                msg = "密码不正确";
//            } else if ("kaptchaValidateFailed".equals(exception)) {
//                System.out.println("kaptchaValidateFailed -- > 验证码错误");
//                msg = "kaptchaValidateFailed -- > 验证码错误";
//            } else {
//                msg = "出现异常";
//                System.out.println("出现异常" + exception);
//            }
//
//            map.put("msg", msg);
//            map.put("username", request.getParameter("username"));
//            // 此方法不处理登录成功,由shiro进行处理.
//
//            return "/login";
//        }else{
//
//            return "/interlinkMain";
//        }
//
//    }
//
//
//
//
//}
