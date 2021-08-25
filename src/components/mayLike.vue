<template>
  <div class="may-like">
    <div class="like-title">你可能喜欢</div>

    <div
      v-infinite-scroll="loadMore"
      infinite-scroll-distance="0"
      infinite-scroll-disabled="busy"
      :infinite-scroll-immediate-check="true"
      class="likes"
    >
      <div class="every-like" v-for="(item, i) of pid.length" :key="i">
        <router-link :to="`/detail/${pid[i]}`">
          <div class="pic">
            <img :src="pic[i]" alt="" />
          </div>
        </router-link>
        <div class="text" style="text-align:left;">
          <span class="text-up">{{ titleUp[i] }}</span>
          <p class="text-down">{{ titleDown[i] }}</p>
          <div class="bottom">
            <div>￥{{ price[i] }}</div>
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
      pid: [],
      pic: [],
      titleUp: [],
      titleDown: [],
      price: [],
      likePro: [],
      iLike: {},
      busy: false, // busy用于控制无限滚动是否禁用
      pno: 0,
    };
  },
  methods: {
    like(i) {
      let pid = this.pid[i];
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
    loadArticles(page, callback) {
      this.$indicator.open({
        text: "加载中...",
      });
      this.axios
        .get("/details/list", {
          params: { pno: page },
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
      this.loadArticles(this.pno, (list) => {
        for (let i = 0; i < list.length; i++) {
          let arr = list[i].subtitle.split("|");
          this.titleUp.push(arr[0]);
          this.titleDown.push(arr[1]);
          this.pic.push(list[i].pic);
          this.price.push(list[i].price);
          this.pid.push(list[i].pid);
        }
        this.busy = false;
      });
    },
  },
  mounted() {
    this.loadArticles(this.pno, (list) => {
      for (let i = 0; i < list.length; i++) {
        let arr = list[i].subtitle.split("|");
        this.titleUp.push(arr[0]);
        this.titleDown.push(arr[1]);
        this.pic.push(list[i].pic);
        this.price.push(list[i].price);
        this.pid.push(list[i].pid);
      }
    });
    // 获取收藏
    this.axios.get(`/product/getlike?uid=${this.uid}`).then((result) => {
      this.likePro = result.data;

      for (let i = 0; i < this.likePro.length; i++) {
        let j = this.likePro[i].pid - 1;
        this.iLike[j] = true;
          console.log(this.likePro[i].pid);
      }
    
    });
  },
};
</script>

<style scoped>
.may-like {
  background-color: #fff;
  width: 100%;
}
.like-title {
  font-size: 20px;
  font-weight: bold;
  padding: 30px 0 10px 5px;
  text-align: left;
}
.likes {
  display: flex;
  flex-flow: row wrap;
  align-items: flex-start;
  justify-content: space-between;
  padding: 0 15px;
}
.every-like {
  width: 170px;
  height: 265px;
  padding-bottom: 65px;
  position: relative;
}
.every-like > .pic {
  width: 100%;
}
.pic > img {
  width: 100%;
}
.text {
  position: absolute;
  left: 0px;
  font-size: 12px;
  padding-top: 10px;
  width: 100%;
}
.text-up {
  font-weight: bold;
}
.text-down {
  margin: 5px 0;
}
.bottom {
  display: flex;
  flex-flow: row wrap;
  align-items: flex-start;
  justify-content: space-between;
  font-size: 14px;
  color: #8f8f8f;
}
</style>
