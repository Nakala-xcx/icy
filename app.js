//引入express模块
const express = require("express");
//引入body-parser
const bodyParser = require("body-parser");

//引入用户路由器
const userRouter = require("./router/user");
//引入商品详情路由器
const detailsRouter = require("./router/details");
//引入收货地址路由器
const addressRouter = require("./router/address");
//引入用户收藏、购物车路由器
const productRouter = require("./router/product");
//引入轮播路由
const carouselRouter = require("./router/carousel");
//引入商品分类路由
const specRouter = require("./router/spec");
//引入设计师路由
const designerRouter = require("./router/designer");
//引入社区路由
const communityRouter = require("./router/community");

//console.log( userRouter );
//创建WEB服务器
const app = express();
//设置端口
app.listen(8080);
//使用body-parser将post请求的数据解析为对象
app.use(
  bodyParser.urlencoded({
    extended: false,
  })
);

//引入跨域管理模块
const cors = require("cors");
//配置允许跨域程序
app.use(
  cors({
    origin: [
      "http://127.0.0.1:8080",
      "http://localhost:8080",
      "http://localhost:8081",
    ],
  })
);

const session = require("express-session");
app.use(
  session({
    name: "session-id",
    secret: "12345-67890",
    saveUninitialized: true,
    resave: true,
  })
);

//路由器挂载
// /user
app.use("/user", userRouter);
// /details
app.use("/details", detailsRouter);
// /address
app.use("/address", addressRouter);
// /product
app.use("/product", productRouter);
// /carousel
app.use("/carousel", carouselRouter);
// /spec
app.use("/spec", specRouter);
// /designer
app.use("/designer", designerRouter);
//community
app.use("/community", communityRouter);
//错误处理中间件
//要拦截所有产生的错误
app.use((err, req, res, next) => {
  //err 拦截到的错误
  console.log(err);
  res.send({ code: 500, msg: "服务器端错误" });
});

// 指定服务器对象监听的端口号
app.listen(3000, () => {
  console.log("server is running...");
});
