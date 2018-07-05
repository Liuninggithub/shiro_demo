Vue.prototype.eleValidate=function (formName) {
    var flag = false;
    this.$refs[formName].validate(function(valid){
        if (valid) {
            flag = true;
        } else {
            flag = false;
            return false;
        }
    });
    return flag;
}

var vueObj = {};
vueObj.moblieFmt = function(val){
    return val.substr(0, 3)+"*****"+val.substr(7, 4);
}
vueObj.IdCardFmt = function(val){
    return val.substr(0, 6)+"*********"+val.substr(14, 4);
}
vueObj.ageFmt = function(val){
    return (new Date().getFullYear()) - Number(val.substr(6, 4));
}

Vue.prototype.utils = vueObj;