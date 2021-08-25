<template>
  <div class="bottom">
    <mt-tabbar v-model="selected" fixed>
      <div @click="goHome()" style="width:25%">
        <mt-tab-item id="">
          <img
            slot="icon"
            v-if="selected == ''"
            src="/img/index/icon/homeon.png"
          />
          <img slot="icon" v-else src="/img/index/icon/home.png" alt="" />
          首页
        </mt-tab-item>
      </div>
      <div @click="goCommunity()" style="width:25%">
        <mt-tab-item id="community">
          <img
            slot="icon"
            v-if="selected == 'community'"
            src="/img/index/icon/sociatyon.png"
          />
          <img slot="icon" v-else src="/img/index/icon/sociaty.png" alt="" />
          社区
        </mt-tab-item>
      </div>
      <div @click="goProduct()" style="width:25%">
        <mt-tab-item id="product">
          <img
            slot="icon"
            v-if="selected == 'product'"
            src="/img/index/icon/shopon.png"
          />
          <img slot="icon" v-else src="/img/index/icon/shop.png" alt="" />
          购物
        </mt-tab-item>
      </div>
      <div @click="goMy()" style="width:25%">
        <mt-tab-item id="my">
          <img
            slot="icon"
            v-if="selected == 'my'"
            src="/img/index/icon/wodeon.png"
          />
          <img slot="icon" v-else src="/img/index/icon/wode.png" alt="" />
          我的
        </mt-tab-item>
      </div>
    </mt-tabbar>
  </div>
</template>
<script>
import { mapState } from "vuex";
export default {
  computed: {
    ...mapState(["uid"]),
  },
  data() {
    return {
      selected: "",
      home: 0,
      community: 0,
      product: 0,
      my: 0,
    };
  },
  methods: {
    goHome() {
      this.selected = "";
      this.$router.push(`/${this.selected}`).catch((err) => err);
    },
    goCommunity() {
      this.selected = "community";
      this.$router.push(`/${this.selected}`).catch((err) => err);
    },
    goProduct() {
      this.selected = "product";
      this.$router.push(`/${this.selected}`).catch((err) => err);
    },
    goMy() {
      this.selected = "my";
      if(localStorage.getItem("uid")){
        this.$router.push(`/${this.selected}/${this.uid}`).catch((err) => err);
      }else{
        this.$router.push('/login');
      }
    },
  },
};
</script>
<style scoped>
.mint-tabbar {
  background-color: #fff;
  color: #cdcdcd;
  background-image: linear-gradient(180deg, #ffffff, #fff 50%, transparent 50%);
  z-index: 200;
}
.mint-tab-item.is-selected {
  background-color: #fff;
  color: #000;
}
</style>
