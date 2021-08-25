<template>
  <div class="home">
    <!-- <mt-loadmore :top-method="loadTop" @top-status-change="handleTopChange" ref="loadmore"> -->
    <!-- 下拉时显示的内容（加载中）  -->
    <!-- <div slot="top" class="mint-loadmore-top">
          <span v-show="topStatus !== 'loading'" :class="{ 'rotate': topStatus === 'drop' }">↓</span>
          <span v-show="topStatus === 'loading'">Loading...</span>
        </div>
    </mt-loadmore> -->
    <bottom ref="home"></bottom>
    <mt-header fixed>
      <img
        src="/img/index/icon/logo.png"
        alt=""
        slot="left"
        class="logo"
        style="width:50px;"
        @click="tologin"
      />
      <router-link :to="`/myCar/${uid}`" slot="right">
        <img
          src="/img/index/icon/shoppingcart.png"
          alt=""
          class="shoppingcart"
          style="    width: 30px;"
        />
      </router-link>
    </mt-header>
    <router-link to="/search">
      <img src="/img/index/icon/search.png" alt="" class="search" />
    </router-link>
    <div
      class="carousel"
      :style="{ height: h }"
      :speed="200"
      :auto="3000"
      :showIndicators="false"
      :continuous="true"
      :defaultIndex="1"
    >
      <mt-swipe :auto="4000">
        <mt-swipe-item v-for="(p, i) of carousel" :key="i">
          <a href="#">
            <img :src="p.img" alt="" />
          </a>
        </mt-swipe-item>
      </mt-swipe>
    </div>
    <div class="swp">
      <img src="/img/index/swipe/swipe.jpg" alt="" />
      <router-link to="/icyicon"></router-link>
      <router-link to="/toplist"></router-link>
    </div>
    <div class="designer card">
      <span>Designer</span>
      <span>设计师说</span>
      <div class="bg"></div>
      <div class="designerscrollout">
        <div class="designerscroll">
          <div class="designeritem" v-for="(p, i) of designer" :key="i">
            <router-link :to="`/designer/${p.did}`"
              ><div
                class="designeravatar"
                :style="{ backgroundImage: ' url(' + p.avatar + ')' }"
              ></div
            ></router-link>
            <div class="designername">{{ p.name }}</div>
          </div>
        </div>
      </div>
    </div>
    <div class="category card">
      <span>Category</span>
      <span>类目精选</span>
      <div class="bg"></div>
      <div class="productspec">
        <div
          @click="delivery(p.spec)"
          class="productspecitem"
          v-for="(p, i) of category"
          :key="i"
          :style="{ backgroundImage: ' url(' + p.img + ')' }"
        >
          {{ p.spec }}
        </div>
      </div>
    </div>
    <div class="newin card">
      <span>New In</span>
      <span>每期精选</span>
      <div class="bg"></div>
      <div class="outer">
        <ul class="newinswiper">
          <li>
            <img src="/img/index/newin/newin1/newin1.jpg" alt="" />
          </li>
          <li v-for="(p, i) of newin[0]" :key="i">
            <img :src="p" alt="" />
          </li>
          <li>
            <img src="/img/index/newin/newin1/newin2.jpg" alt="" />
          </li>
        </ul>
      </div>
    </div>
    <div class="newin card">
      <span>New In</span>
      <span>每期精选</span>
      <div class="bg"></div>
      <div class="outer">
        <ul class="newinswiper">
          <li>
            <img src="/img/index/newin/newin2/newin1.jpg" alt="" />
          </li>
          <li v-for="(p, i) of newin[1]" :key="i">
            <img :src="p" alt="" />
          </li>
          <li>
            <img src="/img/index/newin/newin2/newin2.jpg" alt="" />
          </li>
        </ul>
      </div>
    </div>
    <div class="newin card">
      <span>New In</span>
      <span>每期精选</span>
      <div class="bg"></div>
      <div class="outer">
        <ul class="newinswiper">
          <li>
            <img src="/img/index/newin/newin3/newin1.jpg" alt="" />
          </li>
          <li v-for="(p, i) of newin[2]" :key="i">
            <img :src="p" alt="" />
          </li>
          <li>
            <img src="/img/index/newin/newin3/newin2.jpg" alt="" />
          </li>
        </ul>
      </div>
    </div>
    <div class="grand card">
      <span>Grand Opening</span>
      <span>线下门店</span>
      <div class="bg"></div>
      <div class="swiper">
        <ul class="grandswiper">
          <li>
            <img src="/img/index/grandopening/grandopening1.jpg" alt="" />
          </li>
          <li>
            <img src="/img/index/grandopening/grandopening2.jpg" alt="" />
          </li>
          <li>
            <img src="/img/index/grandopening/grandopening3.jpg" alt="" />
          </li>
          <li>
            <img src="/img/index/grandopening/grandopening4.jpg" alt="" />
          </li>
          <li>
            <img src="/img/index/grandopening/grandopening5.jpg" alt="" />
          </li>
          <li>
            <img src="/img/index/grandopening/grandopening6.jpg" alt="" />
          </li>
          <li>
            <img src="/img/index/grandopening/grandopening7.png" alt="" />
          </li>
        </ul>
      </div>
    </div>
    <div class="branding card">
      <span>Branding</span>
      <span>品牌事件</span>
      <div class="bg"></div>
      <div class="brandimg">
        <img src="/img/index/branding/branding.jpg" alt="" />
      </div>
    </div>
    <div class="guessyoulike">
      <maylike></maylike>
      <myend></myend>
    </div>
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
      h: "",
      carousel: [],
      designer: [],
      category: [],
      newin: [],
      topStatus: "",
    };
  },

  mounted() {
    window.scrollTo(0, 0);
    let picWidth = 750;
    let picHeight = 420;
    let screenWidth = window.screen.width;
    let swipeHeight = Math.floor((picHeight * screenWidth) / picWidth) + "px";
    this.h = swipeHeight;
    this.$refs.home.selected = "";
    this.loadcarousel();
    this.loaddesigner();
    this.loadcategory();
    this.loadnewin();
  },
  methods: {
    // loadTop(){
    //        //在你写完所要执行的方法后，一定一定要加上这句代码，这个是收回下拉动作的
    //         this.$refs.loadmore.onTopLoaded();
    //     },
    //     //下拉过程，加载过程，顶部状态的改变
    //     handleTopChange(status){
    //         this.topStatus = status;
    //     },
    delivery(spec) {
      this.$router.push({
        path: "/product",
        query: {
          spec: spec,
        },
      });
    },
    loadcarousel() {
      this.axios.get("/carousel").then((res) => {
        this.carousel = res.data.data;
      });
    },
    loaddesigner() {
      this.axios.get("/designer/designerindex").then((res) => {
        this.designer = res.data;
      });
    },
    loadcategory() {
      this.axios.get("/spec").then((res) => {
        this.category = res.data.data;
      });
    },
    loadnewin() {
      this.axios.get("/details/newin").then((res) => {
        this.newin = res.data.data;
      });
    },
    tologin(){
      if(localStorage.getItem("uid")){
        this.$router.push(`/my/${this.uid}`)
      }else{
         this.$router.push("/login")
      }
    }
  },
};
</script>

<style lang="scss">
.home {
  background-color: rgb(248, 248, 248);
  margin-bottom: 55px;
  margin-top: 40px;
}
.home .mint-header.is-fixed {
  z-index: 2000;
}
.home .mint-header {
  background-color: #fff;
  position: relative;
  .home .logo {
    height: 1.5em;
    margin: 10% 20%;
  }
  .home .shoppingcart {
    height: 1.9em;
    margin-right: 10%;
  }
}
.search {
  height: 1.2em;
  z-index: 2000;
  position: fixed;
  top: 1.5vh;
  left: 75vw;
}
.carousel {
  img {
    width: 100vw;
  }
}
.swp {
  padding-top: 1vh;
  padding-bottom: 2vh;
  margin-bottom: 1.3vh;
  background-color: #fff;
  position: relative;
  z-index: 1;
  a {
    display: inline-block;
    background-color: transparent;
    width: 45vw;
    height: 45.5vw;
    position: absolute;
    top: 1vh;
    z-index: 10;
    &:first-of-type {
      left: 4vw;
    }
    &:last-of-type {
      left: 52vw;
    }
  }
  img {
    width: 92vw;
    z-index: 1;
  }
}
.bg {
  background-color: #fff;
  width: 8.3em;
  height: 1.2em;
  background-color: #fddde180;
  position: absolute;
  top: 2em;
  left: 1.5em;
}
.card {
  background-color: #fff;
  width: 100vw;
  padding-top: 2em;
  padding-bottom: 2em;
  text-align: left;
  position: relative;
  z-index: 1;
  margin-bottom: 1.3vh;
  > .bg {
    z-index: -1;
  }
  > span {
    z-index: 10;
    background-color: transparent;
    display: inline-block;
  }
  & > :nth-child(1) {
    font-size: 1em;
    font-weight: 700;
    margin-left: 0.9em;
  }
  & > :nth-child(2) {
    font-size: 0.6em;
    font-weight: 500;
    margin-left: 1.2em;
  }
}
.designer {
  .designerscrollout {
    width: 100vw;
    overflow-x: auto;
    &::-webkit-scrollbar {
      width: 0 !important;
    }
    .designerscroll {
      font-size: 0.7em;
      font-weight: 500;
      margin-top: 2em;
      padding: 1em 0;
      display: flex;
      .designeritem {
        margin: 0 1.3em;
        .designeravatar {
          border-radius: 50%;
          width: 6em;
          height: 6em;
          background-repeat: no-repeat;
          background-size: cover;
          background-position: 0 -2px;
        }
        .designername {
          text-align: center;
          margin-top: 1em;
        }
      }
    }
  }
}
.category {
  .productspec {
    display: flex;
    justify-content: space-around;
    margin-top: 2em;
    .productspecitem {
      width: 30vw;
      height: 50vw;
      background-repeat: no-repeat;
      background-size: cover;
      background-position: -31px 0;
      text-align: center;
      line-height: 50vw;
      color: #fff;
    }
  }
}
.newin {
  width: 100vw;
  .bg {
    width: 7em;
  }
  .outer {
    overflow-x: auto;
    &::-webkit-scrollbar {
      width: 0 !important;
    }
    .newinswiper {
      display: flex;
      margin-left: 1.1em;
      margin-top: 2em;
      img {
        height: 28vh;
      }
    }
  }
}
.grand {
  .bg {
    width: 11em;
  }
  .swiper {
    margin-top: 2em;
    overflow-x: auto;
    &::-webkit-scrollbar {
      width: 0 !important;
    }
    .grandswiper {
      display: flex;
      li {
        margin-left: 1.1em;
        img {
          width: 18em;
        }
      }
    }
  }
}
.branding {
  .brandimg {
    img {
      width: 100vw;
    }
  }
}
.guessyoulike {
  width: 100%;
}
</style>
