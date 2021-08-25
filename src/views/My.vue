<template>
  <div>
    <bottom ref="my"></bottom>
    <mt-header class="bg-white mt-2 ">
      <router-link to="/消息" slot="left">
        <img src="/img/My/信息提醒.png" alt="" class="mr-4" />
      </router-link>
      <router-link :to="`/mySet/${uid}`" slot="right">
        <img src="/img/My/设置.png" alt="" class="mr-4" />
      </router-link>
      <router-link :to="`/myCar/${uid}`" slot="right">
        <img src="/img/My/cart-black.png" alt="" class="mr-2" />
      </router-link>
    </mt-header>
    <div class="d-flex ">
      <img
        :src="user.avatar"
        alt=""
        class="m-3"
        width="100"
        height="100"
        style="    border-radius: 50%;"
      />

      <div class="mt-4">
        <h5>{{ user.uname }}</h5>
        <router-link :to="`/me/${uid}`">
          <mt-button size="small" class="bg-light text-dark text-white pt-2"
            >编辑资料</mt-button
          >
        </router-link>
      </div>
    </div>
    <mt-button class="w-75  pt-2" style="background:#000; color:#fff;"
      >普通会员</mt-button
    >
    <mt-cell title="我的订单" to="/" is-link value="全部"></mt-cell>
    <div class="d-flex bg-light justify-content-around align-items-center">
      <div class="text-center mt-3">
        <img src="/img/My/待付款.png" alt="" />
        <p class="mt-2 mb-3">待付款</p>
      </div>
      <div class="text-center mt-3">
        <img src="/img/My/待发货.png" alt="" />
        <p class="mt-2 mb-3">待发货</p>
      </div>
      <div class="text-center mt-3">
        <img src="/img/My/待收货.png" alt="" />
        <p class="mt-2 mb-3">待收货</p>
      </div>
      <div class="text-center mt-3">
        <img src="/img/My/退款关怀.png" alt="" />
        <p class="mt-2 mb-3">退款/退货</p>
      </div>
    </div>
    <button @click="logOut">退出登录</button>
    <mt-cell title="我的社区" to="/" is-link></mt-cell>
    <mt-cell title="礼品卡兑换" to="/" is-link></mt-cell>
    <mt-cell title="账户余额" to="/" is-link></mt-cell>
    <mt-cell title="优惠券" to="/" is-link></mt-cell>
    <mt-cell title="我的收藏" :to="`/myLike/${uid}`" is-link></mt-cell>
  </div>
</template>
<script>
import { mapState } from "vuex";
import { mapActions, mapMutations } from "vuex";
export default {
  computed: {
    ...mapState(["uid"]),
  },

  data() {
    return {
      user: {},
    };
  },
  mounted() {
    this.$refs.my.selected = "my";
    console.log(this.uid);
    this.axios
      .get("/user", {
        params: {
          uid: this.uid,
        },
      })
      .then((res) => {
        this.user = res.data.results[0];
      });
  },
  methods: {
    ...mapActions(["vLogin"]),
    ...mapMutations(["setUid"]),
    logOut() {
      this.setUid(0);
      localStorage.clear();
      this.$router.push("/");
    },
  },
};
</script>
