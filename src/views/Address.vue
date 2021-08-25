<template>
  <div>
    <mt-header class="bg-info pt-2" title="我的收货地址">
      <router-link :to="`/mySet/${uid}`" slot="left">
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

    <router-link :to="`/myAddress/${uid}`">
      <mt-button
        size="large"
        class="bg-dark text-white pt-2 position-fixed fixed-bottom"
        >新添收货地址</mt-button
      >
    </router-link>
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
<style scoped></style>
