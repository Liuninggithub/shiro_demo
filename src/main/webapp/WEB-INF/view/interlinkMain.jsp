<%--
  Created by IntelliJ IDEA.
  User: xiangfeng
  Date: 2018/4/4
  Time: 15:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="./common/baseUrl.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>管理平台</title>
    <base href="<%=basePath%>">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge" />
    <%=interlinkMain%>
    <link rel="stylesheet" type="text/css" href="css/interlink-main.css" />
    <link rel="stylesheet" type="text/css" href="//at.alicdn.com/t/font_670580_36f1l6pe2g4aemi.css" />
    <script src="js/date.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
<div id="my-app" class="my-container" v-cloak>
    <div class="header">
        <div class="header-info">
            <!--<div class="header-info-logo fl"></div>-->
            <div class="header-info-txt fl" :class="{isCollapse: isCollapse}">管理系统</div>
            <div class="header-button-tab fl" :class="{isCollapse: isCollapse}" style="margin-left: 10px;">
                <i @click="isCollapse = !isCollapse"  class="iconfont icon-caidan" style="cursor: pointer;"></i>
            </div>
            <div class="header-info-user fr" style="cursor: pointer;">
                <el-dropdown  @command="logout">
                    <span class="el-dropdown-link">
					    ${name}
					    <img style="width: 40px; height: 40px; vertical-align: middle; border-radius: 40px; margin: 0 10px" src="https://raw.githubusercontent.com/taylorchen709/markdown-images/master/vueadmin/user.png"/>
					</span>
                    <el-dropdown-menu slot="dropdown">
                        <el-dropdown-item  command="logout">退出登录</el-dropdown-item>
                    </el-dropdown-menu>
                </el-dropdown>

            </div>
            <div class="header-info-time fr">{{currentTime}} </div>
        </div>

    </div>
    <div class="side" :class="{isCollapse: isCollapse}">
        <div class="side-container" style="width: 124%; height: 100%; overflow: auto; ">

            <el-menu :default-active="defaultActiveMenu" class="el-menu-vertical-demo" @open="handleOpen" @close="handleClose" :collapse="isCollapse">
                <el-submenu v-for="(list, index) in menuList" :index="index+'-'" :key="index">
                    <template slot="title">
                        <i class="iconfont " :class="iconList[list.icon]"></i>
                        <span>{{list.text}}</span>
                    </template>
                    <el-menu-item-group  >
                        <el-submenu v-for="(item, ind) in list.child" :index="index+'-'+ind" :key="index">
                            <template slot="title">{{item.text}}</template>
                            <el-menu-item v-for="(menu, index) in item.child" :index="menu.action" @click="turnToUrl(menu.action)">{{menu.text}}</el-menu-item>

                        </el-submenu>


                    </el-menu-item-group>
                </el-submenu>
            </el-menu>
        </div>
    </div>
    <div class="main" :class="{isCollapse: isCollapse}">
        <iframe id="iframe" src="index" @load="loadFrame($event)"></iframe>
    </div>
</div>
</body>
<script type="text/javascript">
    var vm = new Vue({
        el: '#my-app',
        data: function() {
            return {
                currentTime: getCurrentDateTime() +" 农历 "+ showCal(),
                isCollapse: false,
                iSrc: "index",
                defaultActiveMenu: "index",
                iconList:{
                    trader:{"icon-shanghu": true},
                    order:{"icon-dingdanguanli": true},
                    user:{"icon-yonghuguanli": true},
                    system:{"icon-xitongguanli1": true},
                    recycleChannel:{"icon-cuishouguanli": true},
                },
                menuList: []
            };
        },
        mounted: function() {
            var _this = this;
            this.init();
            this.menuList = this.menuGenerator(${permissionList});
        },
        methods: {
            init: function () {
                var _url = "index.html"
                //	sessionStorage.setItem('url', _url);
                if (sessionStorage.getItem("url") != _url && sessionStorage.getItem("url") != null){
                    document.getElementById("iframe").setAttribute("src", sessionStorage.getItem("url"));
                    // this.iSrc = ;
                    this.defaultActiveMenu = sessionStorage.getItem("url");
                }else{

                }

            },
            menuGenerator: function(list) {
                var menu1 = [];
                var menu2 = [];
                var json1 = {};
                var json2 = {};
                var resultList = [];
                for(var i = 0; i < list.length; i++) {
                    if(!json1[list[i].firstMenu]) {
                        var obj = {};
                        obj.text = list[i].firstMenu
                        obj.icon = list[i].permission;
                        menu1.push(obj);
                        json1[list[i].firstMenu] = true;
                    }
                    if(!json2[list[i].secondMenu]) {
                        var obj = {};
                        obj.text = list[i].secondMenu
                        obj.parent = list[i].firstMenu;
                        obj.child = [];
                        menu2.push(obj);
                        json2[list[i].secondMenu] = true;
                    }
                }
                for(var j = 0; j < menu2.length; j++) {
                    for(var i = 0; i < list.length; i++) {
                        var obj3 = {};
                        obj3.action = list[i].url;
                        obj3.text = list[i].currentMenu;
                        if(list[i].secondMenu == menu2[j].text) {
                            menu2[j].child.push(obj3);
                        }
                    }
                }
                for(var i = 0; i < menu1.length; i++) {
                    var obj = {};
                    obj.text = menu1[i].text;
                    obj.icon = menu1[i].icon;
                    obj.child = [];
                    for(var j = 0; j < menu2.length; j++) {
                        if(menu1[i].text == menu2[j].parent) {
                            obj.child.push(menu2[j]);
                        }
                    }
                    resultList.push(obj)
                }
                return resultList;
            },
            loadFrame: function (e) {
                var _this = this;
                console.log(e);
                var url = null;
                if(!e.path){
                    url = e.srcElement.contentDocument.location.pathname;

                }else{
                    url = e.path[0].contentDocument.location.pathname;
                }


                var menuList = ${permissionList};
                for(var i=0; i<menuList.length; i++){
                    if(url == menuList[i].url){
                        this.defaultActiveMenu = url;
                    }
                }

            },
            logout: function(param){
                if(param == "logout"){
                    window.location.href = "logout";
                }
            },
            turnToUrl: function(url) {
                // this.iSrc = "/index";
                // this.iSrc = url;
                document.getElementById("iframe").setAttribute("src", url.substr(1));
                sessionStorage.setItem('url', url.substr(1));
            },
            handleSelect: function(key, keyPath) {
                console.log(key, keyPath);
            },
            handleOpen: function(key, keyPath) {
                console.log(key, keyPath);
            },
            handleClose: function(key, keyPath) {
                console.log(key, keyPath);
            }
        }
    })




</script>

</html>