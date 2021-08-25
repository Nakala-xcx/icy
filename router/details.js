const express=require('express');
const pool=require('../pool.js');
let router=express.Router();
const query= require('./query');


//首页newin图片接口
router.get('/newin',(req,res)=>{
      let obj=[];
      pool.query("SELECT * FROM i_product_pic",(err,result)=>{
        if (err) throw err;
        obj=[[result[0].pic,result[7].pic,result[13].pic,result[19].pic,result[25].pic],
        [result[31].pic,result[37].pic,result[43].pic,result[49].pic,result[55].pic],
        [result[61].pic,result[67].pic,result[73].pic,result[79].pic,result[85].pic]]
      res.send({
          code:200,
          msg:"查询成功",
          data:obj
      });
}); 
});

// 商品详情页接口
router.get('/',(req,res)=>{
    let obj=req.query;
    let object={};
    if(!obj.pid){
        res.send({
            code:401,
            msg:'pid required'
        });
        return;
    }
    pool.query('SELECT * FROM  i_product where pid =?',[obj.pid],(err,result)=>{
        if(err) throw err;
        console.log(result);
        object.pro=result;

        pool.query("SELECT * FROM i_product_pic where pro_pid=?",[obj.pid],(err,result)=>{
            object.pic=result;
        res.send({
            code:200,
            msg:"查询成功",
            data:object
        });
    });
}); 
});

//1.商品列表get /list
router.get("/list",(req,res)=>{
    var output={
      count:0,
      pageSize:20,
      pageCount:0,
      pno:req.query.pno||0,
      data:[]
    };
    var sql=`select *,(select pic from i_product_pic where pro_pid=pid limit 1) as pic from i_product `;//传递的是商品类别
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

//商品类别
router.get("/spec",(req,res)=>{
    var output={
      count:0,
      pageSize:20,
      pageCount:0,
      pno:req.query.pno||0,
      data:[]
    };
    var obj=req.query;
    var sql=`select *,(select pic from i_product_pic where pro_pid=pid limit 1) as pic from i_product where psid=${obj.psid}`;//传递的是商品类别
    query(sql,[obj.psid])
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



    //商品按照类别，颜色，价格,升序降序
    router.get("/list/spec", (req, res) => {
        let output = {
        count:0,
        pageSize:20,
        pageCount:0,
        pno:req.query.pno||0,
        data:[],
      //     hotProduct: [],
      //     styleRoom: [],
      //     yourLike: [],
        };
      var obj=req.query;
      var spec,color,price,sql,list;
      switch(obj.spec) {
        case '0':
          spec=' psid=1';
        break;
        case '1':
          spec='psid=2';
        break;
        case '2':
          spec='psid=3';
        break;
        default:
           spec='psid is not null'
   } 
   switch(obj.color) {
    case '0':
      color="like '%白%'";
    break;
    case '1':
      color="like '%黑%'";
    break;
    case '2':
      color="like '%黄%'";
    break;
    default:
       color='is not null';
} 
switch(obj.price) {
  case '0':
    price='between 0 and 299';
  break;
  case '1':
    price='between 300 and 699';
  break;
  case '2':
    price='>=700';
  break;
  default:
     price='is not null';
} 
if(obj.list==1){
  list='asc';
}else{
  list=`desc`;
}
sql=`select *,(select pic from i_product_pic where pro_pid=pid limit 1) as pic from i_product where ${spec} and color ${color} and price ${price}
order by price ${list} `
    query(sql,[spec,color,price,list]).then(result=>{
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
      
      });

module.exports=router;