const express=require('express');
const pool=require('../pool');
const r=express.Router();
const query= require('./query');

//添加收藏
r.get('/like',(req,res)=>{
    let obj=req.query;
    let sql="insert into I_like values(null,?,?)";
    pool.query(sql,[obj.uid,obj.pid],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({msg:"success",code:200});
        }else{
            res.send({msg:"fail",code:201});
        }
    })
})

//删除收藏
r.get('/dislike',(req,res)=>{
    let obj=req.query;
    let sql="delete from I_like where uid=? and pid=?";
    pool.query(sql,[obj.uid,obj.pid],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({msg:"success",code:200});
        }else{
            res.send({msg:"fail",code:201});
        }
    })
})

//获取收藏
r.get('/getlike',(req,res)=>{
    let obj=req.query;
    let sql="select * from I_like where uid=?";
    query(sql,[obj.uid])
    .then(result=>{
        let pid=[];
        for(let i=0;i<result.length;i++){
            pid.push(`pid=${result[i].pid}`);
        }
        let where= pid.join(" or "); 
    
        return query(`select *,(select pic from i_product_pic where pro_pid=pid limit 1) as pic from i_product where ${where} `)
    }).then(result=>{
        res.send(result);
    })
})
//添加购物车
r.get('/addshoppingcart',(req,res)=>{
    let obj=req.query;
    let sql="insert into I_shop_cart values(null,?,?,?)";
    pool.query(sql,[obj.uid,obj.pid,obj.count],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({msg:"success",code:200});
        }else{
            res.send({msg:"fail",code:201});
        }
    })
})

//删除购物车
r.get('/dropshoppingcart',(req,res)=>{
    let obj=req.query;
    let sql="delete from I_shop_cart where suid=? and spid=?";
    pool.query(sql,[obj.uid,obj.pid],(err,result)=>{
        if(err) throw err;
        if(result.affectedRows>0){
            res.send({msg:"success",code:200});
        }else{
            res.send({msg:"fail",code:201});
        }
    })
})

//获取购物车
r.get('/getshoppingcart',(req,res)=>{
    let obj=req.query;
    let sql="select * from I_shop_cart where suid=?";
    query(sql,[obj.uid])
    .then(result=>{
        let pid=[];
        for(let i=0;i<result.length;i++){
            pid.push(`pid=${result[i].spid}`);
        }
        let where= pid.join(" or "); 
        console.log(where);
    
        return query(`select *,(select pic from i_product_pic where pro_pid=pid limit 1) as pic from i_product where ${where} `)
    }).then(result=>{
        res.send(result);
    })
})

//模糊查询input
r.get("/search",(req,res)=>{
    var output={
      count:0,
      pageSize:20,
      pageCount:0,
      pno:req.query.pno||0,
      data:[]
    };
    var kw=req.query.kw||"";
    //"mac i5 128g"
    var kws=kw.split(" ");
    //[mac,i5,128g]
    kws.forEach((elem,i,arr)=>{
      arr[i]=`title like '%${elem}%'`;
    })
    /*[
      title like '%mac%',
      title like '%i5%',
      title like '%128g%'
    ]*/
    //join(" and ");
    var where=kws.join(" and ");
    //"title like '%mac%' and title like '%i5%' and title like '%128g%'"
    var sql=`select *,(select pic from i_product_pic where pro_pid=pid limit 1) as pic from i_product where ${where}`;
    query(sql,[])
    .then(result=>{
      output.count=result.length;
      output.pageCount=
        Math.ceil(output.count/output.pageSize);
      sql+=` limit ?,?`;
      return query(sql,[output.pageSize*output.pno,output.pageSize]);
    })
    .then(result=>{
      output.data=result;
      res.send(output);
    })
  })


module.exports=r;