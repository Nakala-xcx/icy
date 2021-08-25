const express=require('express');
const pool=require('../pool');
const r=express.Router();


//设计师页面
r.get('/designerpage',(req,res)=>{
    let obj=req.query;
    let sql="select * from I_designer where did = ?";
    pool.query(sql,[obj.did],(err,result)=>{
        if(err) throw err;
        res.send(result);
    })
})

//设计师列表
r.get('/designerindex',(req,res)=>{
    let sql="select * from I_designer";
    pool.query(sql,(err,result)=>{
        if(err) throw err;
        res.send(result);
    })
})


//设计师作品
r.get('/designerdesign',(req,res)=>{
    let output=[];
    let obj=req.query;
    let sql="select pid from I_product where did=?";
    pool.query(sql,[obj.did],(err,result)=>{
        if(err) throw err;
        let i=0;
        for(var item of result){
            let sql="select pic from I_product_pic where pro_pid=?";
            pool.query(sql,[item.pid],(err,resu)=>{
                if(err)throw err;
                i++;
                output.push(resu[0].pic);
                if(i==result.length){
                    res.send(output);
                }
            })
        }
    })
})


module.exports=r;