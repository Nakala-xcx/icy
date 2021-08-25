<template>
  <div class="product">
    <bottom ref="product"></bottom>
    <div class="head">
      <div @click="showInput()">
        <img src="img/pro_icon/search.png" alt="" />
      </div>
      <input type="text" style="border:0" ref="inputFocus" v-model="message" />
      <div>
        <img
          src="img/pro_icon/shejishi.png"
          alt=""
          style="margin-right:20px;"
        />
        <router-link :to="`/myCar/${uid}`">
          <img src="img/pro_icon/jiarugouwu.png" alt="" />
        </router-link>
      </div>
    </div>
    <div class="title">All products 全部商品</div>
    <div :class="nav">
      <div class="paixu">
        <span
          v-for="(item, i) in navlist"
          :key="i"
          :class="{ cur: item.isactive }"
          @click="activefun(item)"
          :v-model="item"
          >{{ item.text }}</span
        >
        <img
          src="img/pro_icon/paixu.png"
          alt=""
          style="width:15px;height:20px;margin-bottom:4px;"
        />
      </div>
      <div style="padding-top:2px;">
        <span style="margin-right:0;" @click="show">筛选</span>
      </div>
    </div>
    <div class="saixuan" v-show="isshow">
      <div
        @click="close"
        style="width: 20%;background-color: black;opacity: 0.3;"
      ></div>
      <div
        style="width: 80%;background-color: white;padding:20px;z-index:2;height:667px;overflow-y:auto"
      >
        <div class="pinglie">
          <div>品类</div>
          <div class="pinglie">
            <span
              v-for="(item, i) in productlist"
              :key="i"
              :class="{ cur1: item.isactive }"
              @click="activeproduct(item, i)"
              >{{ item.text }}</span
            >
          </div>
        </div>
        <div class="jiage">
          <div>价格</div>
          <div>
            <span
              v-for="(item, i) in pricelist"
              :key="i"
              :class="{ cur1: item.isactive }"
              @click="activeprice(item, i)"
              >{{ item.text }}</span
            >
          </div>
        </div>
        <div class="yansei">
          <div>颜色</div>
          <div>
            <span
              v-for="(item, i) in colorlist"
              :key="i"
              :class="{ cur3: item.isactive }"
              @click="activecolor(item, i)"
              >{{ item.text }}</span
            >
          </div>
        </div>
        <div class="btns">
          <div @click="reset">重置</div>
          <div @click="enter">确定</div>
        </div>
      </div>
    </div>
    <mt-tab-container
      v-infinite-scroll="loadMore"
      infinite-scroll-distance="40"
      infinite-scroll-disabled="busy"
      :infinite-scroll-immediate-check="true"
    >
      <div class="products">
        <div class="my-card" v-for="(item, i) in product" :key="i">
          <router-link :to="`/detail/${item.pid}`">
            <div style="margin:0;">
              <img :src="item.pic" alt="" style="width:167.5px;" />
            </div>
            <div style="font-weight: bold;">
              {{ item.subtitle.split("|")[0] }}
            </div>
            <div>{{ item.title }}</div>
          </router-link>
          <div style="margin:0;display:flex;justify-content: space-between;">
            <div class="price">¥{{ item.price }}</div>
            <div class="I-like" @click="like(i)">
              <img
                slot="icon"
                v-if="!iLike[i]"
                src="/img/community/HEART (2).png"
              />
              <img slot="icon" v-else src="/img/community/heart.png" />
            </div>
          </div>
        </div>
      </div>
    </mt-tab-container>
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
      message: "",
      likePro: [],
      iLike: {},
      product: [],
      pno: 0,
      busy: false,
      nav: "nav",
      navlist: [
        { text: "综合", isactive: true },
        { text: "销量", isactive: false },
        { text: "新品", isactive: false },
        { text: "价格", isactive: false },
      ],
      productlist: [
        { text: "连衣裙", isactive: false },
        { text: "上装", isactive: false },
        { text: "下装", isactive: false },
      ],
      pricelist: [
        { text: "0-299", isactive: false },
        { text: "300-699", isactive: false },
        { text: "700以上", isactive: false },
      ],
      colorlist: [
        { text: "白", isactive: false },
        { text: "黑", isactive: false },
        { text: "黄", isactive: false },
      ],
      item: "综合",
      list: 0,
      color: "",
      spec: "",
      price: "",
      isshow: false,
      hotheartpic: "img/pro_icon/tianjia.png",
    };
  },
  watch: {
    item() {
      window.scrollTo(0, 0);
      this.pno = 0;
      this.product = [];
      this.list = 0;
      if (this.$refs.inputFocus.value == "") {
        this.loadArticles(0, (list) => {
          this.product = [...this.product, ...list];
        });
      } else {
        this.$indicator.open({
          text: "加载中...",
        });
        this.axios
          .get("/product/search", {
            params: { pno: 0, kw: this.$refs.inputFocus.value },
          })
          .then((result) => {
            this.product = [];
            this.product = result.data.data;
            this.$indicator.close();
          });
      }
    },
  },
  methods: {
    getParams() {
      this.message = this.$route.query.spec;
    },
    showInput() {
      if (this.$refs.inputFocus.value == "") {
        this.$nextTick(function() {
          //DOM 更新了
          this.$refs.inputFocus.focus();
        });
      } else {
        this.$indicator.open({
          text: "加载中...",
        });
        this.axios
          .get("/product/search", {
            params: { pno: 0, kw: this.$refs.inputFocus.value },
          })
          .then((result) => {
            this.product = [];
            this.product = result.data.data;
            this.$indicator.close();
          });
      }
    },
    like(i) {
      let pid = this.product[i].pid;
      let newArr = this.iLike[i];
      newArr = !newArr;
      this.$set(this.iLike, i, newArr);
      if (this.iLike[i]) {
        this.axios
          .get("/product/like", {
            params: { uid: this.uid, pid },
          })
          .then((result) => {});
      } else {
        this.axios
          .get("/product/dislike", {
            params: { uid: this.uid, pid },
          })
          .then((result) => {});
      }
    },
    reset() {
      this.pricelist.forEach(function(obj) {
        obj.isactive = false;
      });
      this.colorlist.forEach(function(obj) {
        obj.isactive = false;
      });
      this.productlist.forEach(function(obj) {
        obj.isactive = false;
      });
    },
    enter() {
      this.isshow = false;
      window.scrollTo(0, 0);
      this.pno = 0;
      this.loadArticles(this.pno, (list) => {
        this.product = [...list];
        console.log(this.product);
      });
    },
    activecolor(item, i) {
      this.$set(item, "isactive", !item.isactive);

      this.color = item.isactive ? i : 5;
      this.colorlist.forEach((obj, index) => {
        if (index != i) {
          this.$set(obj, "isactive", false);
        }
      });
      this.$set(this.colorlist, i, item);
    },
    activeprice(item, i) {
      this.$set(item, "isactive", !item.isactive);
      this.price = item.isactive ? i : 5;
      this.pricelist.forEach((obj, index) => {
        if (index != i) {
          this.$set(obj, "isactive", false);
        }
      });
      this.$set(this.pricelist, i, item);
    },
    activeproduct(item, i) {
      this.$set(item, "isactive", !item.isactive);
      this.spec = item.isactive ? i : 5;
      this.productlist.forEach((obj, index) => {
        if (index != i) {
          this.$set(obj, "isactive", false);
        }
      });
      this.$set(this.productlist, i, item);
    },
    close() {
      this.isshow = false;
    },
    show() {
      this.isshow = true;
    },
    activefun(item) {
      this.navlist.forEach(function(obj) {
        if (obj != item) {
          obj.isactive = false;
        }
      });
      item.isactive = true;
      this.item = item.text;

      this.product = [];
      if (this.item == "价格") {
        if (this.list == 0) {
          this.list = 1;
        } else {
          this.list = 0;
        }
        //升降序
        this.product = [];
        this.loadArticles(this.pno, (list) => {
          this.product = [...this.product, ...list];
        });
      } else {
        this.product = [];
        this.loadArticles(this.pno, (list) => {
          this.product = [...this.product, ...list];
        });
      }
    },
    loadArticles(page, callback) {
      this.$indicator.open({
        text: "加载中...",
      });

      this.axios
        .get("/details/list/spec", {
          params: {
            list: this.list,
            color: this.color,
            spec: this.spec,
            price: this.price,
            pno: page,
          },
        })
        .then((res) => {
          var articles = res.data.data;
          callback(articles);
          this.$indicator.close();
        });
    },
    loadMore() {
      this.pno++;
      this.busy = true;
      // 发送http请求，获取当前类别下的下一页数据，更新列表
      if (this.$refs.inputFocus.value == "") {
        console.log(1111);
        this.loadArticles(this.pno, (list) => {
          this.product = [...this.product, ...list];
          this.busy = false;
        });
      } else {
        this.$indicator.open({
          text: "加载中...",
        });
        this.axios
          .get("/product/search", {
            params: { pno: this.pno, kw: this.$refs.inputFocus.value },
          })
          .then((result) => {
            this.product = [...this.product, ...result.data.data];
            this.$indicator.close();
            this.busy = false;
          });
      }
    },
    handleScroll(e) {
      var scrollTop =
        e.target.documentElement.scrollTop || e.target.body.scrollTop;
      // console.log(scrollTop);
      // console.log(this.item);
      if (scrollTop >= 46) {
        this.nav = "nav1";
      } else if (scrollTop < 46) {
        this.nav = "nav";
      }
    },
  },
  mounted() {
    window.scrollTo(0, 0);
    this.$refs.product.selected = "product";
    if (this.$refs.inputFocus.value == "") {
      this.loadArticles(0, (list) => {
        this.product = [...this.product, ...list];
      });
    } else {
      this.$indicator.open({
        text: "加载中...",
      });
      this.axios
        .get("/product/search", {
          params: { pno: 0, kw: this.$refs.inputFocus.value },
        })
        .then((result) => {
          this.product = result.data.data;
          this.$indicator.close();
        });
    }
    this.getParams();
    this.showInput();
    window.addEventListener("scroll", this.handleScroll, true);
    this.axios.get(`/product/getlike?uid=${this.uid}`).then((result) => {
      this.likePro = result.data;

      for (let i = 0; i < this.likePro.length; i++) {
        let j = this.likePro[i].pid - 1;
        this.iLike[j] = true;
        console.log(this.likePro[i].pid);
      }
    });
  },
  // console.log(this.uid);
};
</script>

<style scoped>
*,
::after,
::before {
  box-sizing: content-box;
}
.product {
  text-align: left;
}

.pinglie span:last-child {
  margin-right: 0 !important;
}
.cur3 {
  border: 1px solid black;
  box-sizing: border-box;
}
.cur2 {
  border: 1px solid black;
  box-sizing: border-box;
}
.cur1 {
  border: 1px solid black;
  box-sizing: border-box;
}
.p2 {
  border: 1px solid black;
  box-sizing: border-box;
}
.p3 {
  border: 1px solid black;
  box-sizing: border-box;
}
.pl {
  border: 1px solid black;
  box-sizing: border-box;
}
.btns {
  position: fixed;
  bottom: 0;
  left: 20%;
  right: 0;
  background-color: #fff;
}
.btns div:nth-child(1) {
  float: left;
  text-align: center;
  width: 40%;
  height: 55px;
  line-height: 55px;
  color: rgb(51, 51, 51);
}
.btns div:nth-child(2) {
  float: left;
  text-align: center;
  width: 60%;
  height: 55px;
  line-height: 55px;
  color: #fff;
  background-color: rgb(51, 51, 51);
}
.pinglie div:nth-child(1) {
  font-weight: bold;
  margin-bottom: 15px;
}
.pinglie {
  margin-bottom: 40px;
}
.pinglie div:nth-child(2) span {
  display: inline-block;
  width: 78.6px;
  height: 30px;
  line-height: 30px;
  text-align: center;
  background-color: rgba(128, 128, 128, 0.123);
  margin-right: 15px;
  font-size: 15px;
}
.jiage div:nth-child(1) {
  font-weight: bold;
  margin-bottom: 15px;
}
.jiage {
  margin-bottom: 40px;
}
.jiage div:nth-child(2) span:nth-child(3) {
  margin-right: 0;
}
.jiage div:nth-child(2) span {
  display: inline-block;
  width: 78.6px;
  height: 30px;
  line-height: 30px;
  text-align: center;
  background-color: rgba(128, 128, 128, 0.123);
  margin-right: 15px;
  font-size: 14px;
  margin-bottom: 15px;
}
.yansei div:nth-child(1) {
  font-weight: bold;
  margin-bottom: 15px;
}
.yansei {
  margin-bottom: 100px;
}
.yansei div:nth-child(2) span:nth-child(3) {
  margin-right: 0;
}
.yansei div:nth-child(2) span {
  display: inline-block;
  width: 78.6px;
  height: 30px;
  line-height: 30px;
  text-align: center;
  background-color: rgba(128, 128, 128, 0.123);
  margin-right: 15px;
  font-size: 15px;
  margin-bottom: 15px;
}
a:link,
a:visited,
a:hover,
a:active {
  color: #000;
  text-decoration: none;
}
.paixu span:nth-child(4) {
  margin-right: 0;
}
.saixuan {
  width: 100%;
  height: 100%;
  position: fixed;
  top: 0;
  z-index: 1;
  display: flex;
}

.title {
  padding: 15px;
  font-weight: bold;
  margin-top: 60px;
}
.head {
  display: flex;
  justify-content: space-between;
  padding: 15px;
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  background-color: white;
  z-index: 1;
}
.head img {
  width: 30px;
  height: 30px;
}
.nav {
  display: flex;
  justify-content: space-between;
  padding: 15px;
}
.nav1 {
  display: flex;
  justify-content: space-between;
  padding: 15px;
  position: fixed;
  top: 60px;
  background-color: white;
  z-index: 1;
  width: 345px;
}
.nav1 span {
  margin-right: 25px;
  color: rgb(153, 153, 153);
  font-size: 15px;
}
.nav1 .cur {
  color: #000;
  font-weight: bold;
  font-size: 16px;
  border-bottom: 1px solid #000;
}
.nav span {
  margin-right: 25px;
  color: rgb(153, 153, 153);
  font-size: 15px;
}
.nav .cur {
  color: #000;
  font-weight: bold;
  font-size: 16px;
  border-bottom: 1px solid #000;
}
.products {
  padding: 15px;
  margin-bottom: 55px;
}
.products div:nth-child(2n + 0) {
  margin-right: 0;
}
.my-card {
  float: left;
  display: flex;
  flex-flow: column;
  flex-wrap: wrap;
  width: 167.5px;
  margin-right: 10px;
  margin-bottom: 55px;
}
.my-card div {
  margin-top: 12px;
  font-size: 12px;
}
.my-card .price {
  color: rgb(153, 153, 153);
}
.saixuan {
  z-index: 5000;
}
</style>
