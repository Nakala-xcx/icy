<template>
    <div class="icyicon">
        <mt-header fixed title="博主穿搭VOL.40">
            <router-link to="/" slot="left">
                <mt-button icon="back"></mt-button>
            </router-link>
            <a href="#" slot="right">
                <img src="/img/index/icon/shoppingcart.png" alt="" class="shoppingcart">
            </a>
        </mt-header>
        <div class="detail">
            <img src="/img/index/swipe/swipe1_1.jpg" alt="">
            <img src="/img/index/swipe/swipe1_2.jpg" alt="">
            <img src="/img/index/swipe/swipe1_3.jpg" alt="">
            <img src="/img/index/swipe/swipe1_4.jpg" alt="">
            <img src="/img/index/swipe/swipe1_5.jpg" alt="">
            <img src="/img/index/swipe/swipe1_6.jpg" alt="">
            <img src="/img/index/swipe/swipe1_7.jpg" alt="">
        </div>
        <mt-button type="primary" size="large" @click="openpup">查看单品</mt-button>
        <mt-popup
        v-model="popupVisible"
        position="bottom">
            <div class="producticon">
                <maylike></maylike>
                <myend></myend>
            </div>
        </mt-popup>
    </div>
</template>

<script>
export default {
    data(){
        return{
            popupVisible:false
        }
    },
    methods:{
        openpup(){
            this.popupVisible=!this.popupVisible
        }
    }    
}
</script>

<style lang="scss">
.icyicon{
    position: relative;
    .mint-header.is-fixed{
      z-index: 2000;
      border-bottom: 1px solid rgb(241, 241, 241);
    }
    .mint-header{
      background-color: #fff;
      color: #000;
      .logo{
        height: 1.5em;
        margin: 10% 20%;
      }
      .mint-header-title{
          font-size: 18px;
      }
      .shoppingcart{
        height: 1.9em;
        margin-right: 10%;
      }
    }
    .detail{
        margin-top: 40px;
        margin-bottom: 48px;
        img{
            width: 100vw;
        }
    }
    .mint-button--primary{
        background-color: #222;
        position: fixed;
        bottom: 0;
        left: 0;
    }
    .producticon{
        width: 100vw;
        height: 80vh;
        background-color: #fff;
        overflow-x: auto;
    }
}
</style>