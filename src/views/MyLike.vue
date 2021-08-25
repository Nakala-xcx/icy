<template>
  <div class="mycar">
    <mt-header title="我的收藏" class=" bg-my pt-1">
      <div @click="back()" slot="left">
        <img src="img/pro_detail_icon/back.png" alt="" style="width: 30%;" />
      </div>

      <router-link :to="`/myCar/${uid}`" slot="right">
        <img
          src="/img/pro_icon/shejishi.png"
          alt=""
          class="mr-2"
          width="24px"
          height="24px"
        />
      </router-link>
    </mt-header>
    <div class="car" v-if="show">
      <div
        class="car-pro"
        v-for="(item, i) of product"
        :key="i"
        @click="goShop(item.pid)"
      >
        <img :src="item.pic" alt="" style="width:30%" />
        <div class="text">
          <span>{{ item.title }}</span>
          <p>￥{{ item.price }}</p>
          <span style="float:right;" @click.stop="del(item.pid)">x</span>
        </div>
      </div>
    </div>
    <div v-else></div>
    <maylike></maylike>
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
      product: [],
      show:true,
    };
  },
  methods: {
    del(pid){
        this.axios.get(`/product/dislike?uid=${this.uid}&pid=${pid}`).then((result) => {
        if(this.product.length==1){
          this.show=false;
        }
        this.getlike();
      });
    },
    back() {
      window.history.go(-1);
    },
    goShop(pid) {
      this.$router.push(`/detail/${pid}`);
    },
    getlike(){
        this.axios.get(`/product/getlike?uid=${this.uid}`).then((result) => {
        this.product = result.data;
     });
    },
  },
  mounted() {
      this.getlike();
  },
};
</script>
<style scoped>
.car {
  width: 100%;
  background: #f8f8f8;
  padding-top: 2px;
}
.bg-my {
  background: #fff;
  font-size: 16px;
  color: black;
}
.car-pro {
  display: flex;
  flex-flow: row nowrap;
  align-items: center;
  justify-content: start;
  background: #fff;
  margin-top: 2px;
  padding: 0 15px;
}
.text > p {
  margin-top: 30px;
  margin-bottom: 0;
  color: gray;
}
.text {
  margin-left: 20px;
  text-align: left;
  width: 200px;
}
</style>
