<template>
  <div class="community">
    <bottom ref="community"></bottom>
    <div class="content">
      <mt-navbar v-model="navactive" fixed>
        <mt-tab-item id="1">
          推荐
          <!-- <img slot="icon" src="../img/cr.jpg" alt=""> -->
        </mt-tab-item>
        <mt-tab-item id="2">I.STAR</mt-tab-item>
        <mt-tab-item id="3">I.GIRLS</mt-tab-item>
        <mt-tab-item id="4">纽约时装周</mt-tab-item>
      </mt-navbar>
      <!-- 面板 -->
      <mt-tab-container v-model="navactive">
        <mt-tab-container-item id="1">
          <div v-for="(item, i) of cid" :key="i" class="user">
            <div class="avatar">
              <img :src="item.avatar" alt="" />
              <span>{{ item.uname }}</span>
            </div>
            <div class="text" v-html="item.comment"></div>
            <viewer :images="item.img" class="user_img">
              <v-touch class="imgDiv" v-for="(src, j) in item.img" :key="j">
                <img :src="src" width="162" />
              </v-touch>
            </viewer>

            <div class="share">
              <img class="icon1" slot="icon" src="/img/community/share.png" />
              <img class="icon2" slot="icon" src="/img/community/message.png" />
              <div class="add_zan" @click="addZan(i)">
                <img
                  class="icon3"
                  slot="icon"
                  src="/img/community/zan.png"
                  v-if="!zan[i]"
                />
                <img
                  class="icon3"
                  slot="icon"
                  src="/img/community/zanp.png"
                  v-else
                />

                <span v-if="!zan[i]">{{ item.heart }}</span>
                <span v-else class="red">{{ item.heart }}</span>
              </div>
            </div>
          </div>
        </mt-tab-container-item>
        <mt-tab-container-item id="2">
          <div v-for="(item, i) of cid" :key="i" class="user">
            <div class="avatar">
              <img :src="item.avatar" alt="" />
              <span>{{ item.uname }}</span>
            </div>
            <div class="text" v-html="item.comment"></div>
            <viewer :images="item.img" class="user_img">
              <v-touch class="imgDiv" v-for="(src, j) in item.img" :key="j">
                <img :src="src" width="162" />
              </v-touch>
            </viewer>

            <div class="share">
              <img class="icon1" slot="icon" src="/img/community/share.png" />
              <img class="icon2" slot="icon" src="/img/community/message.png" />
              <div class="add_zan" @click="addZan(i)">
                <img
                  class="icon3"
                  slot="icon"
                  src="/img/community/zan.png"
                  v-if="!zan[i]"
                />
                <img
                  class="icon3"
                  slot="icon"
                  src="/img/community/zanp.png"
                  v-else
                />

                <span v-if="!zan[i]">{{ item.heart }}</span>
                <span v-else class="red">{{ item.heart }}</span>
              </div>
            </div>
          </div>
        </mt-tab-container-item>
        <mt-tab-container-item id="3">
          <div v-for="(item, i) of cid" :key="i" class="user">
            <div class="avatar">
              <img :src="item.avatar" alt="" />
              <span>{{ item.uname }}</span>
            </div>
            <div class="text" v-html="item.comment"></div>
            <viewer :images="item.img" class="user_img">
              <v-touch class="imgDiv" v-for="(src, j) in item.img" :key="j">
                <img :src="src" width="162" />
              </v-touch>
            </viewer>

            <div class="share">
              <img class="icon1" slot="icon" src="/img/community/share.png" />
              <img class="icon2" slot="icon" src="/img/community/message.png" />
              <div class="add_zan" @click="addZan(i)">
                <img
                  class="icon3"
                  slot="icon"
                  src="/img/community/zan.png"
                  v-if="!zan[i]"
                />
                <img
                  class="icon3"
                  slot="icon"
                  src="/img/community/zanp.png"
                  v-else
                />

                <span v-if="!zan[i]">{{ item.heart }}</span>
                <span v-else class="red">{{ item.heart }}</span>
              </div>
            </div>
          </div>
        </mt-tab-container-item>
        <mt-tab-container-item id="4">
          <div v-for="(item, i) of cid" :key="i" class="user">
            <div class="avatar">
              <img :src="item.avatar" alt="" />
              <span>{{ item.uname }}</span>
            </div>
            <div class="text" v-html="item.comment"></div>
            <viewer :images="item.img" class="user_img">
              <v-touch class="imgDiv" v-for="(src, j) in item.img" :key="j">
                <img :src="src" width="162" />
              </v-touch>
            </viewer>

            <div class="share">
              <img class="icon1" slot="icon" src="/img/community/share.png" />
              <img class="icon2" slot="icon" src="/img/community/message.png" />
              <div class="add_zan" @click="addZan(i)">
                <img
                  class="icon3"
                  slot="icon"
                  src="/img/community/zan.png"
                  v-if="!zan[i]"
                />
                <img
                  class="icon3"
                  slot="icon"
                  src="/img/community/zanp.png"
                  v-else
                />

                <span v-if="!zan[i]">{{ item.heart }}</span>
                <span v-else class="red">{{ item.heart }}</span>
              </div>
            </div>
          </div>
        </mt-tab-container-item>
      </mt-tab-container>
    </div>
    <myend></myend>
  </div>
</template>
<script>
export default {
  data() {
    return {
      navactive: "1",
      cidLen: 0,
      pic: [],
      user: [],
      pro: [],
      cid: [],
      zan: [],
      uname: [],
      avatar: [],
      content: [],
      heart: [],
      img: [],
    };
  },
  methods: {
    addZan(i) {
      // this.zan[i] = !this.zan;
      this.$set(this.zan, i, !this.zan[i]);
      console.log(this.zan);
      if (this.zan[i]) {
        this.pro[i][0].heart++;
      } else {
        this.pro[i][0].heart--;
      }
      this.axios
        .post(
          "community/getheart",
          `heart=${this.pro[i][0].heart}&cid=${this.pro[i][0].cid}`
        )
        .then((result) => {});
    },
  },
  mounted() {
    this.$refs.community.selected = "community";
    this.axios.get("/community/").then((result) => {
      console.log(result);
      let data = result.data.data;
      data.map((item) => {
        item.img = JSON.parse(item.img);
      });
      console.log(data);
      this.cid = data;
      // this.cidLen = result.data.data.length;
      // console.log(this.cidLen);
      // for (let i = 0; i < this.cidLen; i++) {
      //   req[i] = this.axios.get(`/community/`, {
      //     params: {
      //       cid: i + 1,
      //     },
      //   });
      // }
      // this.axios.all(req).then((result) => {
      //   console.log(result);
      //   for (let i = 0; i < result.length; i++) {
      //     this.cid[i] = result[i].data.data;
      //     this.pic[i] = result[i].data.data.pic;
      //     this.user[i] = result[i].data.data.user;
      //     this.pro[i] = result[i].data.data.pro;
      //     this.uname.push(result[i].data.data.user[0].uname);
      //     this.avatar.push(result[i].data.data.user[0].avatar);
      //     this.content.push(result[i].data.data.pro[0].comment);
      //     this.heart.push(result[i].data.data.pro[0].heart);
      //     for (let j = 0; j < this.pic[i].length; j++) {
      //       this.img[i][j] = this.pic[i][j].pic;
      //     }
      //   }
      //   console.log(this.img);
      // });
    });
  },
  watch: {
    navactive() {
      window.scrollTo(0, 0);
    },
  },
};
</script>
<style>
.community {
  background-color: #f8f8f8;
  margin-top: 49px;
  margin-bottom: 55px;
}
.community .content .mint-tab-item {
  color: #8f8f8f !important;
}
.community .content .is-selected {
  color: #000 !important;
  border-bottom: none !important;
  font-weight: bold !important;
}
.avatar {
  width: 70px;
  height: 70px;
  position: relative;
}
.avatar span {
  position: absolute;
  left: 87px;
  top: 31px;
  font-size: 16px;
  font-weight: bold;
}

.avatar img {
  width: 100%;
  border-radius: 50%;
}
.community .content .mint-tab-item-label {
  font-size: 14px;
}
.community .content .is-selected .mint-tab-item-label {
  font-size: 18px;
}
.text {
  font-size: 14px;
  padding: 24px 0;
  text-align: left;
}
.user_img {
  display: flex;
  flex-flow: row wrap;
  align-items: center;
  justify-content: space-around;
}
.share {
  position: relative;
  height: 25px;
}
.icon1 {
  position: absolute;
  left: 0;
}
.icon2 {
  position: absolute;
  right: 100px;
}
.add_zan {
  position: absolute;
  right: 28px;
}
.add_zan span {
  position: absolute;
  top: 4px;
  right: -24px;
}
.red {
  color: pink;
}
.user {
  padding: 20px 20px 60px;
  margin-bottom: 10px;
  background-color: #fff;
}
</style>
