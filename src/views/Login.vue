<template>
  <div>
    <!-- Register.vue -->
    <mt-header title="登录" class="bg-black pt-1">
      <router-link to="/" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
      <router-link to="/register" slot="right">
        注册
      </router-link>
    </mt-header>

    <mt-field
      type="text"
      label="用户名"
      v-model="uname"
      placeholder="请输入用户名"
    ></mt-field>
    <mt-field
      type="password"
      label="密码"
      v-model="upwd"
      placeholder="请输入密码"
    ></mt-field>
    <mt-field label="验证码" v-model="capcode" placeholder="请输入验证码">
      <img
        src="http://127.0.0.1:8080/user/code"
        height="45px"
        width="100px"
        @click="cimg"
      />
    </mt-field>
    <mt-button type="primary" size="large" @click="login" class="bg-black pt-2"
      >快速登录</mt-button
    >
  </div>
</template>
<script>
import { Toast } from "mint-ui";
import { mapActions, mapMutations} from "vuex";

export default {
  data() {
    return {
      uname: "", //uname将于用户名文本框实现双向数据绑定
      upwd: "",
      capcode: "",
      pickerOptions: {
        disabledDate(time) {
          return time.getTime() > Date.now();
        },
      },
    };
  },
  mounted(){
    var uid = localStorage.getItem('uid');
    this.setUid(uid||'')
  },
  methods: {
    cimg(e) {
      e.target.src =
        "http://127.0.0.1:8080/user/code?t=" + new Date().getTime();
    },
    ...mapActions(["vLogin"]),
    ...mapMutations(['setUid']),

    //点击快速注册之后执行，验证表单
    login() {
      this.vLogin({
        //->vuex中的form形参
        uname: this.uname,
        upwd: this.upwd,
        capcode: this.capcode,
      })
        .then(() => {
          //接resolve()
          Toast({
            message: "登录成功",
            iconClass: " ",
          });
          this.$router.push(`/`);
        })
        .catch((msg) => {
          Toast({
            message: `${msg}`,
            iconClass: " ",
          });
          this.upwd2 = "";
          this.upwd = "";
        });
    },
  },
};
</script>
<style scoped>
.bg-black {
  background: #e9e5da;
  color: black;
}
</style>
