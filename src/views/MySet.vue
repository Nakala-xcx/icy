<template>
  <div class="set">
    <mt-header title="设置" class="bg-dark " style="font-size:18px;">
      <router-link :to="`/my/${uid}`" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
    </mt-header>
    <mt-cell title="个人资料" :to="`/me/${uid}`" is-link></mt-cell>
    <mt-cell title="收货地址" :to="`/address/${uid}`" is-link></mt-cell>
    <mt-cell title="消息推送设置" to="/me" is-link></mt-cell>
    <mt-cell title="账号绑定" to="/me" is-link></mt-cell>
    <mt-cell title="意见反馈" to="/me" is-link></mt-cell>
    <mt-cell title="隐私政策" to="/me" is-link></mt-cell>

    <mt-button
      size="large"
      class="bg-dark text-white pt-2 position-fixed fixed-bottom"
      @click="quit"
      >退出登录</mt-button
    >
  </div>
</template>
<script>
import { MessageBox } from "mint-ui";
import { mapState } from "vuex";
export default {
    computed: {
    ...mapState(["uid"]),
  },

  data() {
    return {};
  },
  methods: {
    quit() {
      MessageBox.confirm("", {
        title: "提示",
        message: "确定退出吗?",
        confirmButtonText: "确定",
        cancelButtonText: "取消",
      })
        .then((action) => {
          if (action == "confirm") {
            MessageBox("提示", "退出成功");
            this.$router.push("/login");
          }
        })
        .catch((err) => {
          if (err == "cancel") {
            MessageBox("提示", "点击取消");
          }
        });
    },
  },
};
</script>
<style>
.set .mint-header-title {
  margin-top: 6px;
}
</style>
