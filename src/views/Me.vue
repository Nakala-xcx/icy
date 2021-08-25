<template>
  <div class="me">
    <mt-header title="个人资料" class="bg-dark " style="font-size:18px;">
      <router-link :to="`/mySet/${uid}`" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
      <router-link to="/" slot="right">
        <img
          src="/img/My/listen.png"
          alt=""
          class="mr-4"
          width="24px"
          height="24px"
        />
      </router-link>
      <router-link :to="`/myCar/${uid}`" slot="right">
        <img
          src="/img/My/cart.png"
          alt=""
          class="mr-2"
          width="24px"
          height="24px"
        />
      </router-link>
    </mt-header>

    <div @click="actionSheet">
      <mt-cell title="头像">
        <img :src="obj.avatar" alt="" width="24" height="24" />
        <img src="../assets/向右.png" alt="" />
      </mt-cell>
    </div>
    <hr class="m-0" />
    <mt-cell title="昵称">
      <span @click="setUname">{{ obj.uname }}</span>
      <img src="../assets/向右.png" alt="" />
    </mt-cell>
    <hr class="m-0" />
    <mt-cell title="所在省份">
      <span @click="setProvince">{{ obj.province }}</span>
      <img src="../assets/向右.png" alt="" />
    </mt-cell>
    <hr class="m-0" />
    <div>
      <mt-cell title="密码" @click="setUpwd">
        <span>{{ obj.upwd }}</span>
        <img src="../assets/向右.png" alt="" />
      </mt-cell>
    </div>
    <hr class="m-0" />

    <mt-cell title="身高">
      <span @click="setTail">{{ obj.tail }}</span>
      <img src="../assets/向右.png" alt="" />
    </mt-cell>
    <hr class="m-0" />
    <mt-cell title="体重">
      <span @click="setWeight">{{ obj.weight }}</span>
      <img src="../assets/向右.png" alt="" />
    </mt-cell>
    <mt-cell title="生日">
      <div @click="selectYear">
        <span v-if="!isClicked" class="mr-3">-</span>
        <span v-if="isClicked">{{ year }}年{{ month }}月{{ date }}日</span>
      </div>
    </mt-cell>
    <mt-datetime-picker
      v-model="dateValue"
      type="date"
      ref="datePicker"
      year-format="{value} 年"
      month-format="{value} 月"
      date-format="{value} 日"
      :endDate="new Date()"
      @confirm="handleConfirm"
    >
    </mt-datetime-picker>

    <hr class="m-0" />
    <mt-button size="large" class="bg-dark text-white pt-2" @click="changemsg"
      >完成修改</mt-button
    >
  </div>
</template>
<script>
import { MessageBox } from "mint-ui";

export default {
  data() {
    return {
      obj: {
        uname: "",
        upwd: "",
        province: "",
        tail: "",
        weight: "",
        avatar: "",
      },
      actions: [
        {
          name: "拍照",
          method: this.getCamera, // 调用methods中的函数
        },
        {
          name: "从相册中选择",
          method: this.getLibrary, // 调用methods中的函数
        },
      ],
      sheetVisible: false,
      year: "",
      month: "",
      date: "",
      dateValue: "",
      isClicked: false,
      showPicker: false,
    };
  },
  mounted() {
    this.axios
      .get("/user/", {
        params: {
          uid: localStorage.getItem("uid"),
        },
      })
      .then((res) => {
        this.obj = res.data.results[0];
      });
  },
  methods: {
    changemsg() {
      this.axios
        .post(
          "/user/changemsg",
          `uid=${this.uid}&uname=${this.obj.uname}&upwd=${this.obj.upwd}&province=${this.obj.province}&tail=${this.obj.tail}&weight=${this.obj.weight}`
        )
        .then((result) => {
          if (result.data.code == 200) {
            alert("修改成功");
          } else {
            alert(`修改失败:${result.data.msg}`);
          }
        });
    },
    setUname() {
      MessageBox.prompt("请输入新昵称").then(({ value, action }) => {
        this.obj.uname = value;
      });
    },
    setUpwd() {
      MessageBox.prompt("请输入新昵称").then(({ value, action }) => {
        this.obj.upwd = value;
      });
    },
    setProvince() {
      MessageBox.prompt("请输入省份").then(({ value, action }) => {
        this.obj.province = value;
      });
    },
    setTail() {
      MessageBox.prompt("请输入身高").then(({ value, action }) => {
        this.obj.tail = value;
      });
    },
    setWeight() {
      MessageBox.prompt("请输入体重").then(({ value, action }) => {
        this.obj.weight = value;
      });
    },
    //设置生日
    selectYear() {
      this.$refs.datePicker.open();
    },
    handleConfirm(value) {
      this.year = value.getFullYear();
      this.month = value.getMonth() + 1;
      this.date = value.getDate();
      this.isClicked = true;
    },
    //设置头像
    actionSheet: function() {
      // 打开action sheet
      this.sheetVisible = true;
    },
    getCamera: function() {
      console.log("打开照相机");
    },
    getLibrary: function() {
      console.log("打开相册");
    },
    //职业
  },

  watch: {
    /** 当改变底部选项卡selected的值后触发 */
    selected(newval) {
      if (newval == "home") {
        this.$router.push("/");
      }
    },
  },
};
</script>

<style>
.me .mint-header-title {
  margin-top: 10px;
}
</style>
