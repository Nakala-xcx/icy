<template>
  <div>
    <!-- Register.vue -->
    <mt-header title="注册" class="bg-black pt-1">
      <mt-button icon="back" slot="left" @click="toback"></mt-button>
      <router-link to="/login" slot="right">
        登录
      </router-link>
    </mt-header>

    <mt-field
      type="text"
      label="用户名"
      v-model="uname"
      placeholder="4到16位(字母/数字/下划线/减号)"
      @blur.native.capture="onUname()"
    ></mt-field>
    <mt-field
      type="password"
      label="密码"
      v-model="upwd"
      placeholder=">6位(大写字母/小写字母/数字)"
      @blur.native.capture="onUpwd()"
    ></mt-field>
    <mt-field
      type="password"
      label="确认密码"
      v-model="upwd2"
      placeholder="请再次输入密码"
    ></mt-field>
    <mt-field label="验证码" v-model="capcode" placeholder="请输入验证码">
      <img
        src="http://127.0.0.1:8080/user/code"
        height="45px"
        width="100px"
        @click="cimg"
      />
    </mt-field>
    <mt-button
      type="primary"
      size="large"
      @click="register"
      class="bg-black  pt-2"
      >快速注册</mt-button
    >
  </div>
</template>
<script>
import { Toast } from "mint-ui";

export default {
  data() {
    return {
      uname: "", //uname将于用户名文本框实现双向数据绑定
      upwd: "",
      upwd2: "",
      capcode: "",
      pickerOptions: {
        disabledDate(time) {
          return time.getTime() > Date.now();
        },
      },
    };
  },
  methods: {
    onUname() {
      var uPattern = /^[a-zA-Z0-9_-]{4,16}$/;
      console.log(uPattern.test(this.uname));
      if (!uPattern.test(this.uname)) {
        console.log("用户名错误");
        Toast({
          message: `用户名格式错误`,
          iconClass: " ",
        });
        this.uname = "";
      }
    },
    onUpwd() {
      var pPattern = /^.*(?=.{6,})(?=.*\d)(?=.*[A-Z])(?=.*[a-z]).*$/;
      if (!pPattern.test(this.upwd)) {
        Toast({
          message: `密码格式错误`,
          iconClass: " ",
        });
        this.upwd = "";
      }
    },
    cimg(e) {
      e.target.src =
        "http://127.0.0.1:8080/user/code?t=" + new Date().getTime();
    },
    //点击快速注册之后执行，验证表单
    register() {
      if (this.upwd == this.upwd2) {
        this.axios
          .post(
            "/user/register",
            `uname=${this.uname}&upwd=${this.upwd}&code=${this.capcode}`
          )
          .then((result) => {
            if (result.data.code == 200) {
              //alert("注册成功!")
              // this.$router.push("/login")
              Toast({
                message: "注册成功",
                iconClass: " ",
              });
              this.$router.push({ path: "/login" });
            } else {
              Toast({
                message: `注册失败:${result.data.msg}`,
                iconClass: " ",
              });
              this.upwd2 = "";
              this.upwd = "";
              this.uname = "";
            }
          });
      } else {
        Toast("两次密码输入不一致，请重试");
        this.upwd2 = "";
        this.upwd = "";
      }
    },
    toback(){
      this.$router.push("/")
    }
  },
};
</script>
<style scoped>
.bg-black {
  background: #e9e5da;
  color: black;
}
</style>
