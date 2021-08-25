<template>
  <div class="search">
    <div class="title">
      <div class="head">
        <div @click="showInput()">
          <img src="img/pro_icon/search.png" alt="" />
        </div>
        <input
          type="text"
          style="border:0"
          ref="inputFocus"
          v-model="message"
        />
        <div>
          <img
            src="img/pro_icon/shejishi.png"
            alt=""
            style="margin-right:20px;"
          /><img src="img/pro_icon/jiarugouwu.png" alt="" />
        </div>
      </div>
      <router-link to="/">返回</router-link>
    </div>
    <div class="sub">
      <div class="title">热门搜索</div>
      <div class="btn" @click="btn1()">
        <span>上衣</span>
      </div>
      <div class="btn" @click="btn2()">
        <span>裤子</span>
      </div>
      <div class="btn" @click="btn3()">
        <span>连衣裙</span>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      message: "连衣裙",
    };
  },
  methods: {
    btn2() {
      this.message = "裤子";
    },
    btn1() {
      this.message = "上衣";
    },
    btn3() {
      this.message = "连衣裙";
    },
    showInput() {
      if (this.$refs.inputFocus.value == "") {
        this.$nextTick(function() {
          //DOM 更新了
          this.$refs.inputFocus.focus();
        });
      } else {
        this.$router.push({
          path: "/product",
          query: {
            spec: this.message,
          },
        });
      }
    },
  },
};
</script>

<style lang="scss">
.search {
  > .title {
    display: flex;
    justify-content: space-between;
    align-items: center;
    height: 50px;
    padding: 5px 0;
    border-bottom: 1px solid #ededed;
    margin: 0 10px;
    .mint-search {
      height: 100%;
      width: 70%;
      .mint-searchbar {
        background-color: #fff;
        .mint-searchbar-cancel {
          font-size: 10px;
        }
      }
    }
    a {
      color: #222;
    }
  }
  .sub {
    margin-top: 40px;
    margin-left: 23px;
    text-align: left;
    .title {
      font-size: 18px;
      font-weight: 700;
    }
    .btn {
      background-color: #ededed;
      margin-top: 20px;
      display: inline-block;
      padding: 6px 8px;
      margin-right: 10px;
    }
  }
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
</style>
