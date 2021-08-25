<template>
  <div class="detail">
    <div class="imgs" id="imgs">
      <mt-swipe
        class="swipe"
        style="height:375px;"
        :defaultIndex="0"
        :show-indicators="false"
        :auto="0"
        @change="handleChange"
      >
        <mt-swipe-item v-for="(item, i) in pic" :key="i">
          <viewer :images="pic">
            <img :src="item" alt="" style="width:100%;" />
          </viewer>
        </mt-swipe-item>
      </mt-swipe>
      <div
        :style="
          `background-color:white;
                    height:100px;
                    position:fixed;
                    top:0;
                    left:0;
                    right: 0;
                    z-index:1;
                    opacity:${opa} ;`
        "
      >
        <div>
          <img
            :src="pic[index - 1]"
            alt=""
            style="width:50px;margin-top:15px;margin-left:152.5px;"
          />
        </div>
        <div class="opapro">
          <span
            v-for="(item, i) in navlist"
            :key="i"
            :class="{ cur1: item.isactive }"
            @click="activenav(item, $event)"
            >{{ item.text }}</span
          >
          <!-- <span><a href="#imgs">商品</a></span>
					<span><a href="#picdetail">详情</a></span>
					<span><a href="#itrforyou">推荐</a></span> -->
        </div>
      </div>
      <img
        :src="src1"
        alt=""
        style="position:fixed;top:25px;left:15px;width:25px;z-index:1;"
        @click="back"
      />
      <img
        :src="src2"
        alt=""
        style="position:fixed;top:25px;right:70px;width:25px;z-index:1;"
      />
      <router-link :to="`/myCar/${uid}`">
        <img
          :src="src3"
          alt=""
          style="position:fixed;top:25px;right:15px;width:25px;z-index:1;"
        />
      </router-link>
      <div class="feng">{{ index }}/{{ pic.length }}</div>
    </div>
    <div class="info">
      <div
        style="display:flex;justify-content: space-between;margin-bottom: 15px;"
      >
        <div style="font-size:16px;">{{ pro.title }}</div>
        <div style="font-size:14px;color:rgb(153, 153, 153);">已售0件</div>
      </div>
      <p style="font-size:14px;color:rgb(153, 153, 153);margin-bottom: 18px;">
        {{ pro.subtitle }}
      </p>
      <div class="price">¥ {{ pro.price }}</div>
      <p>颜色:</p>
      <div :class="color" @click="changecolor">
        {{ pro.color }}
      </div>
    </div>
    <div
      style="width:100%;height:10px;background-color: rgb(245, 245, 245);"
    ></div>
    <div class="pinfo">
      <div>
        <img
          src="img/pro_detail_icon/sj.png"
          alt=""
          style="width:12px;height:25px;"
        />
        <div style="display:inline-block;">品牌信息</div>
      </div>
      <div style="display:flex;margin-top: 15px;">
        <div style="width:95px;">
          <div class="bg"><img src="img/brand/brand1.jpg" alt="" /></div>
        </div>
        <div class="sjinfo">
          <div class="cur">{{ spec }}</div>
          <div>设计师集合品牌-简约都市系列</div>
          <div>{{ specs }}</div>
        </div>
      </div>
    </div>
    <div class="more">
      <span>了解更多</span>
      <img src="img/pro_detail_icon/dayu.png" alt="" />
    </div>
    <div class="morepic">
      <img v-for="(item, i) in tjlist" :key="i" :src="item" alt="" />
      <div class="moretext">
        <div
          style="padding:5px;font-size:14px;color:rgb(153, 153, 153);margin-top:24px;"
        >
          <div
            style="border-bottom:1px solid rgb(153, 153, 153);padding-bottom:5px;"
          >
            查看更多
          </div>
          <p style="margin-top:5px;">MORE ←</p>
        </div>
      </div>
    </div>
    <div
      style="width:100%;height:10px;background-color: rgb(245, 245, 245);"
    ></div>
    <div class="tproduct">
      <div>
        <img
          src="img/pro_detail_icon/sj.png"
          alt=""
          style="width:12px;height:25px;"
        />
        <div style="display:inline-block;">推荐搭配</div>
      </div>
      <div style="margin-top:10px;">
        <img :src="tj" alt="" style="width:345px;" />
      </div>
    </div>
    <div
      style="width:100%;height:10px;background-color: rgb(245, 245, 245);"
    ></div>
    <div class="picdetail" id="picdetail">
      <div>
        <img
          src="img/pro_detail_icon/sj.png"
          alt=""
          style="width:12px;height:25px;"
        />
        <div style="display:inline-block;">图文详情</div>
      </div>
      <div class="imgdetail"><img :src="pro.detail" alt="" /></div>
    </div>
    <div
      style="width:100%;height:10px;background-color: rgb(245, 245, 245);"
    ></div>

    <div class="footbtn">
      <div>
        <img
          src="img/pro_detail_icon/o.png"
          alt=""
          style="margin-right:30px;"
        />
        <img
          :src="
            xin ? 'img/pro_detail_icon/gs.png' : 'img/pro_detail_icon/g.png'
          "
          alt=""
          @click="hotxin"
        />
      </div>
      <div @click="cartadd">加入购物车</div>
      <div @click="cartbuy">立即购买</div>
    </div>
    <div class="cart" v-show="showcart">
      <div
        @click="cartclose"
        style="background-color:rgba(0, 0, 0, 0.418); width: 100%;height: 30%;"
      ></div>
      <div
        style="background-color: white;width: 100%;height: 70%;padding:15px;"
      >
        <div style="display:flex;">
          <div><img :src="pic[0]" alt="" style="width:100px;" /></div>
          <div style="margin-left:15px;">
            <div style="width:200px;">{{ pro.title }}</div>
            <div style="margin-top:10px;">¥ {{ pro.price }}</div>
          </div>
          <div style="margin-left:10px;" @click="closecart">X</div>
        </div>
        <div style="margin-top:20px;">
          <div>颜色</div>
          <div
            style="border:1px solid rgba(128, 128, 128, 0.411);padding:10px;width:160px;border-radius:4px;margin-top:15px;text-align:center;"
          >
            {{ pro.color }}
          </div>
        </div>
        <div style="margin-top:20px;margin-bottom:5px;">
          <div>尺码</div>
          <div style="display:flex;">
            <div
              style="border:1px solid rgba(128, 128, 128, 0.411);padding:10px;width:50px;border-radius:4px;margin-top:15px;text-align:center;margin-right:15px;"
            >
              L
            </div>
          </div>
        </div>
        <hr style="width:90%;position:fixed;left:15px;right:15px;" />
        <div class="count">
          <div>数量</div>
          <div @click="jian">-</div>
          <div>{{ count }}</div>
          <div @click="add">+</div>
        </div>
        <div class="queding" @click="myCar()">确定</div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";
export default {
  computed: {
    ...mapState(["uid"]),
  },
  props: ["lid"],
  data() {
    return {
      color: "color",
      index: 1,
      pic: [],
      pro: {},
      psid: 1,
      product: [],
      tj: "", //推荐搭配
      tjlist: [],
      spec: {},
      specs: {},
      opa: 0,
      src1: "img/pro_detail_icon/backs.png",
      src2: "img/pro_detail_icon/fengxiangs.png",
      src3: "img/pro_detail_icon/che.png",
      navlist: [
        { text: "商品", isactive: true },
        { text: "详情", isactive: false },
        { text: "推荐", isactive: false },
      ],
      xin: false,
      showcart: false,
      count: 1,
    };
  },
  methods: {
    add() {
      this.count++;
    },
    jian() {
      if (this.count > 1) {
        this.count--;
      }
    },
    closecart() {
      this.showcart = false;
    },
    cartclose() {
      this.showcart = false;
    },

    cartadd() {
      this.showcart = true;
    },
    myCar() {
      this.axios
        .get("/product/addshoppingcart", {
          params: { uid: this.uid, pid: this.lid, count: this.count },
        })
        .then((result) => {
          this.showcart = false;
        });
        this.$router.push("/order");
    },
    cartbuy() {
      this.showcart = true;
    },
    hotxin() {
      this.xin = !this.xin;
      if (this.xin) {
        this.axios
          .get("/product/like", {
            params: { uid: this.uid, pid: this.lid },
          })
          .then((result) => {});
      } else {
        this.axios
          .get("/product/dislike", {
            params: { uid: this.uid, pid: this.lid },
          })
          .then((result) => {});
      }
    },
    activenav(item, e) {
      this.navlist.forEach(function(obj) {
        // console.log(obj)
        obj.isactive = false;
      });
      item.isactive = true;
      var eti = e.target.innerHTML;
      // console.log(eti);
      if (eti == "商品") {
        window.scrollTo({
          top: 0,
          behavior: "smooth",
        });
      } else if (eti == "详情") {
        window.scrollTo({
          top: 1240,
          behavior: "smooth",
        });
      } else if (eti == "推荐") {
        window.scrollTo({
          top: 7866,
          behavior: "smooth",
        });
      }
    },
    changecolor() {
      this.color = "color1";
    },
    back() {
      window.history.go(-1);
    },
    handleScroll(e) {
      var scrollTop =
        e.target.documentElement.scrollTop || e.target.body.scrollTop;
      // console.log(scrollTop);
      if (scrollTop < 10) {
        this.opa = `0.${scrollTop}`;
        // console.log(this.opa);
        this.src1 = "img/pro_detail_icon/backs.png";
        this.src2 = "img/pro_detail_icon/fengxiangs.png";
        this.src3 = "img/pro_detail_icon/che.png";
      } else if (scrollTop >= 10 && scrollTop < 1240) {
        this.opa = 1;
        this.src1 = "img/pro_detail_icon/back.png";
        this.src2 = "img/pro_detail_icon/fengxiang.png";
        this.src3 = "img/pro_icon/jiarugouwu.png";
        this.navlist.forEach(function(obj) {
          obj.isactive = false;
        });
        this.navlist[0].isactive = true;
      } else if (scrollTop >= 1240 && scrollTop < 7866) {
        this.navlist.forEach(function(obj) {
          obj.isactive = false;
        });
        this.navlist[1].isactive = true;
      } else if (scrollTop >= 7866) {
        this.navlist.forEach(function(obj) {
          obj.isactive = false;
        });
        this.navlist[2].isactive = true;
      }
    },
    handleChange(index) {
      // console.log(index);
      this.index = index + 1;
    },
    foryoupro() {
      this.$indicator.open({
        text: "加载中...",
        spinnerType: "snake",
      });
      this.axios.get(`/details/list?pno=${this.psid - 1}`).then((result) => {
        // console.log(result);
        this.product = result.data.data;
        // console.log(this.product);
        this.$indicator.close();
      });
    },
    tuijian() {
      let tid = Math.floor(Math.random() * 60) + 1;
      // console.log(tid);
      this.axios.get(`/details?pid=` + tid).then((result) => {
        this.tj = result.data.data.pic[0].pic;
        for (let i = 0; i < result.data.data.pic.length; i++) {
          this.$set(this.tjlist, i, result.data.data.pic[i].pic);
        }
      });
    },
  },
  mounted() {
    window.scrollTo(0, 0);
    window.addEventListener("scroll", this.handleScroll, true);
    let pid = this.lid;
    // console.log(`输出pid=` + pid);
    this.axios.get(`/details?pid=` + pid).then((result) => {
      // console.log(result);
      var pic = result.data.data.pic;
      // console.log(pic);
      for (let i = 0; i < pic.length; i++) {
        this.$set(this.pic, i, pic[i].pic);
      }
      var pro = result.data.data.pro[0];
      // console.log(pro);
      this.spec = pro.subtitle.split("|")[0];
      this.specs = pro.subtitle.split("|")[1];
      this.pro = pro;
      this.psid = pro.psid;
      // console.log(pro.psid);
      this.foryoupro();
      this.tuijian();
    });
    //获取收藏
    this.axios.get(`/product/getlike?uid=${this.uid}`).then((result) => {
      this.likePro = result.data;
      console.log(this.likePro);
      this.xin = this.likePro.find((element) => element.pid == this.lid)
        ? true
        : false;
    });
  },
};
</script>

<style scoped>
.detail {
  text-align: left;
}
.queding {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  width: 100%;
  height: 40px;
  background-color: rgb(51, 51, 51);
  color: white;
  text-align: center;
  line-height: 40px;
}
.count {
  margin-top: 25px;
  display: flex;
}
.count div:nth-child(1) {
  margin-top: 5px;
}
.count div:nth-child(2) {
  width: 25px;
  height: 25px;
  border: 1px solid rgba(128, 128, 128, 0.411);
  text-align: center;
  line-height: 25px;
  margin-left: 10px;
}
.count div:nth-child(3) {
  width: 25px;
  height: 25px;
  border: 1px solid rgba(128, 128, 128, 0.411);
  text-align: center;
  line-height: 25px;
}
.count div:nth-child(4) {
  width: 25px;
  height: 25px;
  border: 1px solid rgba(128, 128, 128, 0.411);
  text-align: center;
  line-height: 25px;
}
.cart {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  width: 100%;
  height: 100%;
  z-index: 10;
  font-weight: bold;
}
.cur1 {
  font-weight: bold;
}
a:link,
a:visited,
a:hover,
a:active {
  color: #000;
  text-decoration: none;
}
.opapro {
  padding: 15px;
}
.opapro span:nth-child(1) {
  margin-left: 60px;
}
.opapro span:nth-child(2) {
  margin-left: 55px;
}
.opapro span:nth-child(3) {
  float: right;
  margin-right: 60px;
}
.footbtn {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  background-color: #fff;
}
.footbtn div:nth-child(1) {
  float: left;
  text-align: center;
  width: 30%;
  height: 55px;
  line-height: 55px;
}
.footbtn div:nth-child(2) {
  float: left;
  text-align: center;
  width: 35%;
  height: 55px;
  line-height: 55px;
  color: rgb(51, 51, 51);
  background-color: rgb(236, 229, 221);
}
.footbtn div:nth-child(3) {
  float: left;
  text-align: center;
  width: 35%;
  height: 55px;
  line-height: 55px;
  color: #fff;
  background-color: rgb(51, 51, 51);
}
.footbtn div img {
  width: 25px;
}
.products div:nth-child(2n) {
  margin-right: 0;
}
.card {
  float: left;
  display: flex;
  flex-flow: column;
  flex-wrap: wrap;
  width: 167.5px;
  margin-right: 10px;
  margin-bottom: 55px;
}
.card div {
  margin-top: 12px;
  font-size: 14px;
}
.card .price {
  color: rgb(153, 153, 153);
}
.itrforyou {
  padding: 15px;
}
.itrforyou .itrtext {
  text-align: center;
  margin-bottom: 10px;
}
.itrforyou .itrtext img {
  width: 60px;
}
.itrforyou .itrtext span {
  font-size: 18px;
  margin: 0 8px;
}
.picdetail .imgdetail {
  width: 345px;
  margin-top: 10px;
}
.picdetail .imgdetail img {
  width: 100%;
}
.picdetail {
  padding: 15px;
}
.tproduct {
  padding: 15px;
}
.imgs {
  widows: 375px;
  position: relative;
}
.feng {
  position: absolute;
  bottom: 25px;
  right: 20px;
  background-color: white;
  width: 40px;
  height: 20px;
  line-height: 20px;
  text-align: center;
  font-size: 14px;
}
.info {
  padding: 15px;
}
.price {
  font-weight: bold;
  font-size: 19px;
  margin-bottom: 20px;
}
.color {
  border: 1px solid rgb(234, 234, 234);
  width: 120px;
  height: 25px;
  text-align: center;
  line-height: 25px;
  margin-top: 10px;
}
.color1 {
  border: 1px solid black;
  width: 120px;
  height: 25px;
  text-align: center;
  line-height: 25px;
  margin-top: 10px;
}
.pinfo {
  padding: 15px;
}
.bg {
  width: 100%;

  background-color: rgb(245, 245, 245);
  position: relative;
}
.bg img {
  position: absolute;
  width: 100%;
}
.sjinfo {
  padding: 10px 35px 0 35px;
}
.sjinfo div:nth-child(1) {
  font-weight: bold;
}
.sjinfo div:nth-child(2) {
  font-size: 15px;
  margin: 14px 0;
}
.sjinfo div:nth-child(3) {
  font-size: 15px;
  color: rgb(153, 153, 153);
}
.cur::after {
  content: "";
  width: 35px;
  display: block;
  height: 3px;
  margin: 0;
  border-bottom: 3px solid rgb(255, 149, 107);
}
.cur {
  font-weight: bold;
  color: #1c1c1c;
}
.more {
  float: right;
  padding-right: 15px;
}
.more span {
  font-size: 14px;
  color: rgb(153, 153, 153);
}
.more img {
  width: 20px;
}
.morepic {
  padding: 15px;
  width: 345px;
  justify-content: space-between;
  white-space: nowrap;
  overflow-y: hidden;
  overflow-x: scroll;
  display: flex;
}
.morepic img {
  width: 100px;
  margin-right: 5px;
}
.morepic .moretext {
  width: 100px;
  height: 100px;
  text-align: center;
}
</style>
