<template>
  <div class="designer">
    <mt-header fixed :title="show ? designer.name : ''">
      <router-link to="/" slot="left">
        <mt-button icon="back" @click="destroyScroll()"></mt-button>
      </router-link>
      <a href="#" slot="right">
        <img
          src="/img/index/icon/shoppingcart.png"
          alt=""
          class="shoppingcart"
        />
      </a>
    </mt-header>
    <div
      class="title"
      :style="{ backgroundImage: ' url(' + designer.background_img + ')' }"
    >
      <div class="mask"></div>
      <div class="avatar">
        <img :src="designer.avatar" alt="" />
      </div>
      <div class="content">
        <div class="name">{{ designer.name }}</div>
        <p class="intro">{{ designer.subname }}</p>
      </div>
    </div>
    <div class="designerintro" ref="scrollOne">
      <div class="designerintrotitle">{{ designer.Intro_title }}</div>
      <div :class="isOpen ? '' : 'line-clamp'" class="designerintrodetail">
        {{ designer.Intro_content }}
      </div>
      <hr />
      <div class="more" @click="opendesc">
        <img v-if="isOpen" src="/img/designer/icon/arrow_up.png" />
        <img v-else src="/img/designer/icon/arrow_down.png" />
      </div>
    </div>
    <div class="show">作品展示</div>
    <div class="designlist">
      <div v-for="item of pic" :key="item">
        <img :src="item" alt="" />
      </div>
    </div>
    <myend></myend>
  </div>
</template>

<script>
export default {
  props: ["did"],
  data() {
    return {
      flag: true,
      isOpen: false,
      show: false,
      designer: [],
      pic: [],
    };
  },
  watch: {
    flag() {
      window.removeEventListener("scroll", this.handleScroll);
    },
  },
  mounted() {
    window.addEventListener("scroll", this.handleScroll);
    this.load();
    this.loadpic();
  },
  methods: {
    destroyScroll() {
      this.flag = false;
    },
    opendesc() {
      this.isOpen = !this.isOpen;
    },
    handleScroll() {
      //获取滚动时的高度
      let scrollTop =
        window.pageYOffset ||
        document.documentElement.scrollTop ||
        document.body.scrollTop;
      let oneHeight = this.$refs.scrollOne.offsetHeight;

      if (scrollTop > oneHeight) {
        this.show = true;
      } else {
        this.show = false;
      }
    },
    load() {
      this.axios
        .get("/designer/designerpage", {
          params: { did: this.did },
        })
        .then((res) => {
          this.designer = res.data[0];
        });
    },
    loadpic() {
      this.axios
        .get("/designer/designerdesign", {
          params: { did: this.did },
        })
        .then((res) => {
          this.pic = res.data;
        });
    },
  },
};
</script>

<style lang="scss">
.designer {
  .mint-header.is-fixed {
    z-index: 2000;
    color: #000;
  }
  .mint-header {
    background-color: #fff;
    position: relative;
    .logo {
      height: 1.5em;
      margin: 10% 20%;
    }
    h1 {
      font-size: 18px;
      font-weight: 700;
    }
    .shoppingcart {
      height: 1.9em;
      margin-right: 10%;
    }
  }
  .title {
    background-image: url("/img/designer/designer1/background.jpg");
    width: 100vw;
    height: 27vh;
    background-repeat: no-repeat;
    background-size: cover;
    background-position: 0 -80px;
    position: relative;
    margin-top: 40px;
    .mask {
      width: 0;
      height: 0;
      border-bottom: 10vh solid #fff;
      border-left: 100vw solid transparent;
      position: absolute;
      top: 17.1vh;
    }
    .avatar {
      border-radius: 50px;
      overflow: hidden;
      width: 5em;
      height: 5em;
      position: absolute;
      top: 8.5em;
      left: 1em;
      img {
        width: 5em;
      }
    }
    .content {
      text-align: left;
      position: absolute;
      top: 10.5em;
      left: 6.5em;
      .name {
        font-size: 19px;
        font-weight: 700;
        margin-bottom: 10px;
      }
      .intro {
        font-size: 10px;
        width: 70vw;
        line-height: 1.5;
      }
    }
  }
  .designerintro {
    text-align: left;
    margin-top: 76px;
    padding-left: 1em;
    padding-right: 1em;
    .designerintrotitle {
      font-size: 15px;
      font-weight: 700;
      line-height: 24px;
    }
    .designerintrodetail {
      line-height: 24px;
      margin-top: 10px;
      font-size: 11px;
    }
    .line-clamp {
      display: -webkit-box;
      -webkit-box-orient: vertical;
      -webkit-line-clamp: 3;
      text-overflow: ellipsis;
      word-wrap: break-word;
      word-break: break-all;
      overflow: hidden;
    }
    hr {
      border-color: #ededed;
    }
    .more {
      text-align: center;
      line-height: 1.1;
    }
  }
  .show {
    font-size: 16px;
    font-weight: 700;
  }
  .designlist {
    margin-top: 20px;
    padding: 5px;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    > div {
      margin-bottom: 8px;
      img {
        width: 30vw;
      }
    }
  }
}
</style>
