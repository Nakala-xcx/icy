<template>
  <div class="order">
    <div class="head">
      <div>
        <img src="/img/pro_detail_icon/back.png" alt="" @click="back" />
      </div>
      <div>
        <span>确认订单</span>
        <img
          src="/img/pro_icon/shejishi.png"
          alt=""
          style="margin-right:20px;"
        /><img src="/img/pro_icon/jiarugouwu.png" alt="" />
      </div>
    </div>
    <div class="add-address">
      <img src="/img/order/Add to.png" alt="" />
      <div>请填写收货地址</div>
    </div>
    <div class="detail">
      <div class="brand">
        <div class="brand-left">品牌</div>
        <div class="brand-right">IDID</div>
      </div>
      <div class="product-detail">
        <img src="/img/order/cloth8_2.png" alt="" />
        <div class="detail-right">
          <span>时尚简约马甲</span>
          <ul>
            <li><span>款式：</span><span>淡米</span></li>
            <li><span>尺码：</span><span>L</span></li>
            <li>
              <span>价格：</span><span style="color:#000;">￥499.00</span>
            </li>
            <li><span>数量：</span><span>1</span></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="price">
      <ul>
        <li><span>商品总额：</span><span>￥499.00</span></li>
        <li><span>运费：</span><span>承诺达物流包邮</span></li>
      </ul>
    </div>
    <div class="remark">
      <input type="text" value="您对订单有特殊要求，可以在此备注" />
    </div>
  </div>
</template>

<script>
export default {
  methods: {
    back() {
      window.history.go(-1);
    },
  },
};
</script>

<style scoped>
.order {
  background-color: #f8f8f8;
  padding-top: 2px;
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
.head span {
  position: relative;
  left: -60px;
  font-weight: bold;
  top: -9px;
}
.head img {
  width: 30px;
}
.add-address {
  width: 100%;
  background: #fff;
  padding: 40px 0;
  color: #bfbfbf;
}
.add-address > div {
  padding-top: 10px;
}
.detail {
  margin-top: 10px;
  background-color: #fff;
  padding: 20px;
}
.brand {
  display: flex;
  flex-flow: row nowrap;
  align-items: center;
  justify-content: start;
}
.brand-left {
  background-color: #f8f8f8;
  font-size: 14px;
  width: 40px;
  margin-right: 10px;
}
.product-detail {
  margin-top: 10px;
  display: flex;
  flex-flow: row nowrap;
  align-items: center;
  justify-content: start;
  width: 100%;
}
.product-detail img {
  width: 100px;
  margin-right: 10px;
}
.detail-right {
  text-align: left;
  height: 100px;
}

.detail-right > ul {
  list-style: none;
  display: flex;
  flex-flow: row wrap;
  align-items: center;
  justify-content: space-around;
  margin-top: 30px;
}

.detail-right ul li {
  width: 112px;
  margin-bottom: 10px;
  font-size: 14px;
  text-align: left;
  color: #bfbfbf;
}
.price {
  margin-top: 10px;
  background-color: #fff;
  padding: 20px;
}
.price ul {
  list-style: none;
  text-align: left;
}
.price ul > li:first-child {
  margin-bottom: 20px;
}
.price span {
  display: inline-block;
  width: 50%;
}
.remark {
  height: 80px;
  margin-top: 10px;
  background-color: #fff;
  padding: 20px;
}
.remark input {
  width: 315px;
  height: 100%;
  background-color: #f8f8f8;
  border: 0;
  color: #bfbfbf;
  padding: 0px 10px;
  vertical-align: top;
}
</style>
