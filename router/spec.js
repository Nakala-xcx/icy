const express = require("express");
const pool = require("../pool.js");
let router = express.Router();
//商品分类路由

router.get("/", (req, res) => {
  // let obj = req.query;
  // if (!obj.psid) {
  //   res.send({
  //     code: 401,
  //     msg: "psid required",
  //   });
  //   return;
  // }
  pool.query(
    "SELECT * FROM  I_product_spec",
    (err, result) => {
      if (err) throw err;
      //console.log(result);
      res.send({
        code: 200,
        msg: "查询成功",
        data: result,
      });
    }
  );
});

module.exports = router;
