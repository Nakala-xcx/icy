const express=require('express');
const pool=require('../pool.js');
let router=express.Router();
//挂载路由
//轮播
router.get('/',(req,res)=>{
    pool.query('SELECT * FROM I_index_swipe',(err,result)=>{
        if(err) throw err;
        // console.log(result);
        res.send({
            code:200,
            msg:"查询成功",
            data:result
        });
    });
}); 
module.exports=router;