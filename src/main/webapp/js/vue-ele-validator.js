var vueReg = {
	mobReg: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
	emailReg: /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/,
	idCardReg: /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/,
	bankNoReg: /^\d{16,}$/,
	usernameReg: /(^[a-zA-Z0-9]{1}([a-zA-Z0-9]|[.-_@]){5,19}$)|(^\d{6,20}$)/,
	passwordReg: /^([a-zA-z]+[0-9]+)|([0-9]+[a-zA-Z]+)$/
}

Vue.prototype.validator = {
	validMob: function(rule, value, callback) {
		if(!value) {
			callback(new Error('请输入手机号码'))
		} else if(!vueReg.mobReg.test(value)) {
			callback(new Error('请输入正确的11位手机号码'))
		} else {
			callback()
		}
	},
	validEmail: function(rule, value, callback) {
		if(!value) {
			callback(new Error('请输入邮箱号码'))
		} else if(!vueReg.emailReg.test(value)) {
			callback(new Error('请输入正确的邮箱号码'))
		} else {
			callback()
		}
	},
	validIdCard: function(rule, value, callback) {
		if(!value) {
			callback(new Error('请输入身份证号码'))
		} else if(!vueReg.idCardReg.test(value)) {
			callback(new Error('请输入正确的身份证号码'))
		} else {
			callback()
		}
	},
	validBankNo: function(rule, value, callback) {
		if(!value) {
			callback(new Error('请输入银行卡号码'))
		} else if(!vueReg.bankNoReg.test(value)) {
			callback(new Error('请输入正确的银行卡号码'))
		} else {
			callback()
		}
	},
	validUsername: function(rule, value, callback) {
		if(!value) {
			callback(new Error('请输入名字'))
		} else if(!vueReg.usernameReg.test(value)) {
			callback(new Error('名字只支持数字、字母开头的6-20字符'))
		} else {
			callback()
		}
	},
	validPsw: function(rule, value, callback) {
		if(!value) {
			callback(new Error('请输入密码'))
		} else if(!vueReg.passwordReg.test(value)) {
			callback(new Error('密码只支持数字、字母'))
		} else {
			callback()
		}
	},
	
	
	
	
	
}