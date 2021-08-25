const express = require("express");
const pool = require("../pool.js");
const r = express.Router();
const query = require("./query");

//获取社区消息传递cid
r.get("/", (req, res) => {
  pool.query("SELECT * FROM  I_community", [], (err, result) => {
    if (err) throw err;
    //   object.pro = result;
    console.log(result);
    res.send({ code: 200, data: result, msg: "获取成功" });
  });
});
//获取cid长度
r.get("/cid", (req, res) => {
  pool.query("SELECT cid FROM i_community", [], (err, result) => {
    console.log(result);
    res.send({
      code: 200,
      msg: "查询成功",
      data: result,
    });
  });
});

//修改赞数
r.post("/getheart", (req, res, next) => {
  //3.1获取传递的数据
  let obj = req.body;
  //3.2执行SQL命令
  pool.query(
    "	update I_community set heart=? where cid=?",
    [obj.heart, obj.cid],
    (err, result) => {
      if (err) {
        next(err);
        return;
      }
      // //结果是对象，如果对象下的属性affectedRows为0说明修改失败，否则修改成功
      if (result.affectedRows === 0) {
        res.send({ code: 201, msg: "修改失败" });
      } else {
        res.send({ code: 200, msg: "修改成功" });
      }
    }
  );
});

module.exports = r;
