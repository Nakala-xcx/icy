<template>
  <div>
    <mt-header class="bg-info pt-2" title="新添收货地址">
      <router-link :to="`/address/${uid}`" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
      <router-link to="/设计师" slot="right">
        <img
          src="/img/My/listen.png"
          alt=""
          class="mr-4"
          width="24px"
          height="24px"
        />
      </router-link>
      <router-link to="/购物车" slot="right">
        <img
          src="/img/My/cart.png"
          alt=""
          class="mr-2"
          width="24px"
          height="24px"
        />
      </router-link>
    </mt-header>
    <mt-field label="收件人：" placeholder="请输入收件人"></mt-field>
    <mt-field label="手机号：" placeholder="请输入手机号" type="tel"></mt-field>
    <mt-field label="所在地区：" placeholder="请输入地区"></mt-field>
    <mt-field label="详细地址：" placeholder="请输入详细地址"></mt-field>
    <mt-field label="邮政编码：" placeholder="请输入邮政编码"></mt-field>
    <div class="checkbox ml-3">
      <label><input type="checkbox" />设为默认地址</label>
    </div>
    <input type="submit" class="btn btn-dark w-100 mt-5" value="保存" />
  </div>
</template>
<script>
import { mapState } from "vuex";
export default {
    computed: {
    ...mapState(["uid"]),
  },

  data() {
    return {};
  },
  methods: {},
};
</script>
<style scoped>
.my_header img {
  height: 24px;
}
</style>
