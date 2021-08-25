const express=require('express');
const pool=require('../pool.js');
let router=express.Router();
//挂载路由
//1地址添加
router.post('/add',(req,res)=>{
	let obj=req.body;
	console.log(obj);
	let i=400;
	for(let key in obj)
	{
		i++;
		console.log(obj[key]);
		if(!obj[key]){
			res.send({
				code:i,
				msg:key+" required"
			});
			return;
		}
	}
	pool.query('INSERT INTO i_address SET ?',[obj],(err,result)=>{
		if(err) throw err;
		if(result.affectedRows>0){
			res.send({
				code:200,
				msg:"添加成功"
			})
		}
	});
	});



//2得到地址
router.get('/',(req,res)=>{
    let obj=req.query;
    if(!obj.aid){
        res.send({
            code:401,
            msg:'aid required'
        });
        return;
    }
    pool.query('SELECT * FROM i_address WHERE aid=?',[obj.aid],(err,result)=>{
        if(err) throw err;
        // console.log(result);
        res.send({
            code:200,
            msg:"查询成功",
            data:result[0]
        });
    });
}); 



module.exports=router;