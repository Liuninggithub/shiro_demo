<%--
  Created by IntelliJ IDEA.
  User: liuning
  Date: 2018/4/25
  Time: 15:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%

    String path = request.getContextPath();
    System.out.println("path:"+path);
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

    String commmonJs =
            "<script src=\"https://cdn.bootcss.com/babel-polyfill/6.23.0/polyfill.min.js\"></script>"
            +"<script src=\"https://cdn.bootcss.com/vue/2.5.16/vue.min.js\" type=\"text/javascript\" charset=\"utf-8\"></script>"
            +"<script src=\"https://cdn.bootcss.com/element-ui/2.0.11/index.js\"></script>"
            +"<script src=\"js/vue-utils.js\"></script>"
            +"<script src=\"js/init-axios.js\" type=\"text/javascript\" charset=\"utf-8\"></script>";

    String commonMeta ="<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge,chrome=1\" />"
            +"<meta http-equiv=\"Cache-Control\" content=\"no-siteapp\" />"
            +"<meta http-equiv=\"Pragma\" content=\"no-cache\">"
            +"<meta name=\"renderer\" content=\"webkit\">";

    String commonCss = "<link href=\"https://cdn.bootcss.com/element-ui/2.0.11/theme-chalk/index.css\" rel=\"stylesheet\">"
            +"<link rel=\"stylesheet\" type=\"text/css\" href=\"css/init-ele-vue.css\" />";



    String interlinkJs ="<script src=\"https://cdn.bootcss.com/babel-polyfill/6.23.0/polyfill.min.js\"></script>"
            +"<script src=\"https://cdn.bootcss.com/moment.js/2.22.1/moment.min.js\"></script>"
            +"<script src=\"https://cdn.bootcss.com/vue/2.5.16/vue.min.js\"></script>"
            +"<script src=\"https://cdn.bootcss.com/element-ui/2.3.7/index.js\"></script>"
            +"<script src=\"js/vue-utils.js\"></script>"
            +"<script src=\"js/init-axios.js\" type=\"text/javascript\" charset=\"utf-8\"></script>"
            +"<script src=\"js/vue-ele-validator.js\" type=\"text/javascript\" charset=\"utf-8\"></script>";

    String interlinkCss = "<link href=\"https://cdn.bootcss.com/element-ui/2.3.7/theme-chalk/index.css\" rel=\"stylesheet\">"
            +"<link href=\"css/interlink-ele-vue.css\" rel=\"stylesheet\">";

    String commonLoad = commonMeta + commonCss + commmonJs;

    String interlinkLoad = commonMeta + interlinkCss + interlinkJs;

    String interlinkMain = commonMeta + "<link href=\"https://cdn.bootcss.com/element-ui/2.3.7/theme-chalk/index.css\" rel=\"stylesheet\">" + interlinkJs;

%>