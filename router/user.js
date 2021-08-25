//引入express
const express = require("express");
//引入连接池模块
const pool = require("../pool.js");
//引入验证码图片
const svgCaptcha = require("svg-captcha");
const md5 = require("md5-node");

//创建路由器对象
const r = express.Router();
var capcode;
//1.用户注册(post /)
//http://127.0.0.1:8080/user/register
r.post("/register", (req, res, next) => {
  //1.1获取post请求的数据
  let uname = req.body.uname;
  let upwd = req.body.upwd;
  //验证验证码是否输入正确
  if (req.body.code != capcode) {
    res.send({ msg: "验证码输入错误", code: 203 });
    return;
  }
  //1.2验证各项数据是否为空
  if (!uname) {
    res.send({ code: 401, msg: "用户名不能为空" });
    //跳出函数
    return;
  }
  if (!upwd) {
    res.send({ code: 402, msg: "密码不能为空" });
    return;
  }
  // //1.3查找是否存在此用户
  let sql = "SELECT COUNT(uid) AS count FROM i_user WHERE uname=?";
  pool.query(sql, [uname], (error, results) => {
    if (error) throw error;
    let count = results[0].count;
    if (count == 0) {
      //   //1.4执行SQL命令
      pool.query(
        "insert into i_user (uname,upwd) VALUES (?,?)",
        [req.body.uname, req.body.upwd],
        (err, result) => {
          if (err) {
            //如果出现错误交给下一个中间件
            next(err);
            //不能往后继续执行
            return;
          }
          // console.log(result);
          res.send({ code: 200, msg: "注册成功" });
        }
      );
    } else {
      res.send({ msg: "用户名已存在", code: 201 });
    }
  });
});
//2.用户登录(post /login)
//http://127.0.0.1:8080/user/login
r.post("/login", (req, res, next) => {
  //2.1获取post传递的数据
  let obj = req.body;
  //console.log(obj);
  //验证验证码是否输入正确
  if (req.body.code != capcode) {
    res.send({ msg: "验证码输入错误", code: 203 });
    return;
  }
  //2.2验证各项数据是否为空
  if (!obj.uname) {
    res.send({ code: 401, msg: "用户名不能为空" });
    return;
  }
  if (!obj.upwd) {
    res.send({ code: 402, msg: "密码不能为空" });
    return;
  }
  //2.3执行SQL命令
  pool.query(
    "select * from i_user where uname=? and upwd=?",
    [obj.uname, obj.upwd],
    (err, result) => {
      if (err) {
        next(err);
        return;
      }
      //console.log(result);
      //结果是数组，如果数组长度为0说明登录失败，否则登录成功
      if (result.length === 0) {
        res.send({ code: 201, msg: "登录失败" });
      } else {
        res.send({ code: 200, data: result[0], msg: "登录成功" });
      }
    }
  );
  // console.log(md5(obj.upwd))
});
//3.用户修改(post /)
//http://127.0.0.1:8080/user/changemsg
r.post("/changemsg", (req, res, next) => {
  //3.1获取传递的数据
  let obj = req.body;
  console.log(obj);
  //3.2执行SQL命令
  pool.query(
    "update i_user set ? where uid=?",
    [obj, obj.uid],
    (err, result) => {
      if (err) {
        next(err);
        return;
      }
      // console.log(result);

      // //结果是对象，如果对象下的属性affectedRows为0说明修改失败，否则修改成功
      if (result.affectedRows === 0) {
        res.send({ code: 201, msg: "修改失败" });
      } else {
        res.send({ code: 200, msg: "修改成功" });
      }
    }
  );
});
//4.验证码(get/)
//http://127.0.0.1:8080/user/code
r.get("/code", (req, res) => {
  const cap = svgCaptcha.createMathExpr({
    fontSize: 45,
    mathMin: 1,
    mathMax: 9,
    mathOperator: "+-",
    width: 110,
    height: 45,
    color: true,
  });
  req.session.captcha = cap.text; // session 存储验证码数值
  capcode = req.session.captcha;
  res.type("svg"); // 响应的类型
  res.send(cap.data);
});
r.get("/",(req,res)=>{
  let uid=req.query.uid; 
    pool.query('select * from i_user where uid=?',[uid], (error, results) => {
        if (error) throw error;
       //console.log(results)
        res.send({ message: 'ok', code: 200, results: results });
    });  
})
//导出路由器对象
module.exports = r;
