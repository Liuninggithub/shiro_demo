<%--
  Created by IntelliJ IDEA.
  User: liuning
  Date: 2018/5/15
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../../common/baseUrl.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>权限查询</title>
    <base href="<%=basePath%>">
    <%=interlinkLoad%>
</head>
<body>
<div id="app" class="app">
    <el-breadcrumb separator-class="el-icon-arrow-right">
        <el-breadcrumb-item :to="{ path: '/' }">首页</el-breadcrumb-item>
        <el-breadcrumb-item>系统管理</el-breadcrumb-item>
        <el-breadcrumb-item>系统信息</el-breadcrumb-item>
        <el-breadcrumb-item>新增权限</el-breadcrumb-item>
    </el-breadcrumb>

    <el-form :inline="true" :model="formInline" label-position="right" label-width="80px" class="demo-form-inline" size="mini">

        <el-form-item label="权限名称">
            <el-input v-model="formInline.permissionName" placeholder="权限名称"></el-input>
        </el-form-item>

        <el-form-item label="权限编码">
            <el-input v-model="formInline.permission" placeholder="权限编码"></el-input>
        </el-form-item>
        <el-form-item label="菜单类型">
            <el-select v-model="menuType" placeholder="菜单类型" @change="menuChange(0)">
                <el-option label="一级菜单" value="0"></el-option>
                <el-option label="二级菜单" value="1"></el-option>
                <el-option label="三级菜单" value="2"></el-option>
            </el-select>
        </el-form-item>

        <el-form-item label="一级菜单" v-show="menuType == 1 || menuType == 2" >
            <el-select v-model="firstMenu" placeholder="一级菜单" @change="menuChange(1)">
                <el-option v-for="item in menuOption" :label="item.name" :value="item.id"></el-option>
            </el-select>
        </el-form-item>

        <el-form-item label="二级菜单" v-show="(menuType == 2 && firstMenu != '')">
            <el-select v-model="secondMenu" placeholder="二级菜单" @change="menuChange(2)">
                <el-option v-for="item in secondOption" :label="item.name" :value="item.id"></el-option>
            </el-select>
        </el-form-item>



        <el-form-item label="请求链接">
            <el-input v-model="formInline.url" placeholder="请求链接"></el-input>
        </el-form-item>

        <el-form-item label="状态">
            <el-select v-model="formInline.status" placeholder="状态">
                <el-option label="正常" value="0"></el-option>
                <el-option label="禁用" value="1"></el-option>
            </el-select>
        </el-form-item>

        <div class="el-form-item el-form-item--mini">
            <label class="el-form-item__label" style="width: 80px;"></label>
            <div class="el-form-item__content marleft-4">
                <el-button type="warning" size="mini" @click="addFn">新增</el-button>

            </div>
        </div>
    </el-form>

</div>
</body>
<script type="text/javascript">
    var vm = new Vue({
        el: '#app',
        data: function() {
            return {
                menuType: "",
                firstMenu: "",
                secondMenu: "",
                formInline: {
                    status: "0",
                    permissionName: "",
                    permission: "",
                    parentsId: "",
                    url: "",
                },
                menuOption: [],
                secondOption: []
            }
        },
        mounted: function () {
            this.initOption();
        },
        methods: {
            initOption: function () {
                var _this = this;
                this.axios.post("permission/getMenu", {}).then(function (value) {
                    console.log(value);
                    _this.menuOption = value.data;
                });
            },
            menuChange: function (n) {
                var _this = this;
                if(n == 0){
                    console.log(0)
                    this.formInline.parentsId = 0;
                }else if (n == 1){
                    console.log(1)

                    this.formInline.parentsId = this.firstMenu;
                    this.menuOption.map(function (value) {
                        if(value.id == _this.firstMenu){
                            _this.secondOption = value.list;
                            return [];
                        }
                    })
                }else if(n == 2){
                    console.log(2)

                    this.formInline.parentsId = this.secondMenu;
                }

            },
            addFn: function () {
                var _this = this;
                this.axios.post("permission/add", _this.newFormData(_this.formInline)).then(function (value) {
                    console.log(value);

                });
            }

        }
    })
</script>
</html>
