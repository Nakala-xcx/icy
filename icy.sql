set names utf8;
drop database if exists icyshop;
create database icyshop charset=utf8;
use icyshop;

---首页轮播---
CREATE TABLE I_index_swipe(
    swid INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(128),
	link VARCHAR(128)	
);
INSERT INTO I_index_swipe VALUES
(NULL,"/img/index/carousel/carousel1.jpg","https://market.m.taobao.com/app/tb-source-app/shopact/pages/index?_w&pathInfo=shop/custom_category&userId=3165080793&shopId=479195376&pageId=271670002&alisite=true&sellerId=3165080793&shop_navi=category&displayShopHeader=true"),
(NULL,"/img/index/carousel/carousel2.jpg","https://market.m.taobao.com/app/tb-source-app/shopact/pages/index?_w&pathInfo=shop/custom_category&userId=3165080793&shopId=479195376&pageId=271670002&alisite=true&sellerId=3165080793&shop_navi=category&displayShopHeader=true"),
(NULL,"/img/index/carousel/carousel3.jpg","https://market.m.taobao.com/app/tb-source-app/shopact/pages/index?_w&pathInfo=shop/custom_category&userId=3165080793&shopId=479195376&pageId=271670002&alisite=true&sellerId=3165080793&shop_navi=category&displayShopHeader=true"),
(NULL,"/img/index/carousel/carousel4.jpg","https://market.m.taobao.com/app/tb-source-app/shopact/pages/index?_w&pathInfo=shop/custom_category&userId=3165080793&shopId=479195376&pageId=271670002&alisite=true&sellerId=3165080793&shop_navi=category&displayShopHeader=true"),
(NULL,"/img/index/carousel/carousel5.jpg","https://market.m.taobao.com/app/tb-source-app/shopact/pages/index?_w&pathInfo=shop/custom_category&userId=3165080793&shopId=479195376&pageId=271670002&alisite=true&sellerId=3165080793&shop_navi=category&displayShopHeader=true");


---购物车---
CREATE TABLE I_shop_cart(
  scid INT PRIMARY KEY AUTO_INCREMENT,
  suid INT,
	spid INT,
	count INT
  -- foreign key(suid) references I_user(uid)
);

INSERT INTO I_shop_cart VALUES
(NULL,1,1,1);


---收藏表---
CREATE TABLE I_like (
	lid int PRIMARY KEY AUTO_INCREMENT, 
	uid int(128),
	pid int(128)
	
) ;

INSERT INTO `I_like` VALUES
(NULL,1,1),
(NULL,1,2),
(NULL,1,3);


---品牌表---
DROP TABLE IF EXISTS I_product_brand;
CREATE TABLE I_product_brand (
	pbid int primary key auto_increment,
	ppic varchar(128),
  background_image varchar(128),
  brand_name varchar(16),
  brand_title varchar(16),
  brand_introduce_title  varchar(128),
  brand_introduce_content  varchar(128)
);
insert into I_product_brand VALUES
(null,'/img/brand/brand1.jpg','/img/brand_background/1.jpg','SALEWA','中国设计师集合品牌-简约都市系列','本源本我 舒适 力量 独立','SALEWA(沙乐华)1935年起源于德国 ，是欧洲著名的户外运动品牌。SA意为Saddler(制造马鞍的)、LE意为Leather(皮革)、WA意为Wares(制品)。SALEWA滑雪板及滑雪杆也在市场上取得成功，逐渐成为公司最主要的收入来源。适合各个年龄段的人群。'),
(null,'/img/brand/brand2.jpg','/img/brand_background/2.jpg','LOTTO','中国设计师集合品牌-未来感街头系列','探索实验奢华街头','Lotto是一款鞋子品牌，名字由创始人的姓氏得来的，两个重叠的菱形代表了高科技的研发和创新的设计理念，体现了Lotto品牌发展初期对足球和网球运动天生的喜好。是足球运动员的选择。'),
(null,'/img/brand/brand3.jpg','/img/brand_background/3.jpg','ELLE','中国设计师集合品牌-浪漫复古系列','细腻 内心 复古优雅','ELLE法语翻译成中文名字是"她"的意思，1945年，由Helene Lazareff在法国巴黎创立，面世后广受好评。ELLE已融入到女性生活的方方面面。以时尚导向，是女性化的、现代的、积极向上、亲切的、潮流而又充满生活气息。是20岁左右的女孩的选择。'),
(null,'/img/brand/brand4.jpg','/img/brand_background/4.jpg','圣迪奥','中国设计师集合品牌-时髦风格系列','天真 风华 强劲','圣迪奥时装有限公司创立于一九九四年，经过多年的稳健经营，已发展成为集设计、生产和销售为一体的国际化服装企业。S.DEER国际企业公司旗下拥有女装品牌S.DEER、男装品牌S.DEER/HE。是时尚年轻男女的选择。');


---收获地址表---
DROP TABLE IF EXISTS I_address;
CREATE TABLE I_address (
	aid int primary key auto_increment,
	userId int(11),
  -- 收货人
	consignee varchar(128),
  province varchar(16),
  city varchar(16),
  addressDetail  varchar(128),
  isdefault boolean,
  phone varchar(16),
  -- 备注
  tag varchar(128)
);
insert into I_address VALUES
(null,1,"张三","四川省","成都市","牛王庙2栋3单元4楼",1,"13988888888","中午送达"),
(null,2,"李四","四川省","成都市","牛王庙2栋3单元4楼",1,"13966666666","晚上8点送达");


---用户表---
CREATE TABLE I_user(
    uid INT PRIMARY KEY AUTO_INCREMENT,
    uname VARCHAR(24),                                
    upwd VARCHAR(24),                                 
    avatar VARCHAR(128),                      #头像
    province VARCHAR(16),                     #省
    tail INT,
    weight INT
);
INSERT INTO I_user VALUES(NULL,"lily","123456","/img/user/avatar/avatar1.jpg","浙江省",173,60);
INSERT INTO I_user VALUES(NULL,"jack","123456","/img/user/avatar/avatar2.jpg","山西省",166,57);
INSERT INTO I_user VALUES(NULL,"jennie","123456","/img/user/avatar/avatar3.jpg","四川省",166,50);
INSERT INTO I_user VALUES(NULL,"Jisoo","123456","/img/user/avatar/avatar4.jpg","湖南省",166,57);
INSERT INTO I_user VALUES(NULL,"cheetah","123456","/img/user/avatar/avatar5.jpg","广东省",166,57);
INSERT INTO I_user VALUES(NULL,"Lisa","123456","/img/user/avatar/avatar6.jpg","四川省",166,57);
INSERT INTO I_user VALUES(NULL,"rose","123456","/img/user/avatar/avatar7.jpg","香港",166,57);
INSERT INTO I_user VALUES(NULL,"Nakala","123456","/img/user/avatar/avatar8.jpg","湖北",166,57);



---订单表---
CREATE TABLE I_order(
    oid INT PRIMARY KEY AUTO_INCREMENT,
    uid INT,                                  #用户编号                           
    pid INT                                   #商品编号
);
INSERT INTO I_order VALUES(NULL,1,3);
INSERT INTO I_order VALUES(NULL,2,10);
INSERT INTO I_order VALUES(NULL,2,27);


---商品类别---
CREATE TABLE I_product_spec(
    psid INT PRIMARY KEY AUTO_INCREMENT,
    spec VARCHAR(10),                                  #类别名                           
    img  VARCHAR(128)                                  #类别图片
);
INSERT INTO I_product_spec VALUES(NULL,"连衣裙","/img/product/productspec/productspec1.png");
INSERT INTO I_product_spec VALUES(NULL,"上衣","/img/product/productspec/productspec2.png");
INSERT INTO I_product_spec VALUES(NULL,"裤子","/img/product/productspec/productspec3.png");


---商品表---
CREATE TABLE I_product(
    pid INT PRIMARY KEY AUTO_INCREMENT,
    did INT ,                                #设计师编号
    psid INT,                               #商品类别编号
    pbid INT,                               #品牌编号
    sid INT,                                #关联商品编号

    title VARCHAR(40),
    subtitle VARCHAR(40),
    price SMALLINT,
    color VARCHAR(10),
    detail VARCHAR(128)
    
);

INSERT INTO I_product VALUES
-- 连衣裙
(NULL,1,1,1,60,"泡泡袖设计感收腰连衣裙","IDID |复古优雅魅力，洋溢温柔气质",1499,"米白","/img/product/dress/dress1/dress1_details.png"),
(NULL,1,1,1,59,"泡泡袖刺绣印花连衣裙","MUSNOVA |都市时尚风采，展现大方魅力",1899,"米黄","/img/product/dress/dress2/dress2_details.png"),
(NULL,2,1,2,58,"系脖复古无袖两件套连衣裙","IDID |复古优雅时尚，展现优雅魅力",1399,"驼色","/img/product/dress/dress3/dress3_details.png"),
(NULL,3,1,3,57,"撞色吊带休闲连衣裙","IDID |都市时尚风采，展现大方魅力",899,"米白拼黑","/img/product/dress/dress4/dress4_details.png"),
(NULL,4,1,4,56,"复古开叉休闲连衣裙","IDID |复古优雅魅力，洋溢温柔气质",1299,"白","/img/product/dress/dress5/dress5_details.png"),

(NULL,1,1,1,55,'拼接压褶刺绣梭织连衣裙','MUSNOVA|优雅简约设计，职场气质提升',1899,'白色','/img/product/dress/dress6/dress6_details.png'),
(NULL,2,1,2,54,'中性风收腰工装连衣裙','O.M.W|独具风格的中性工装连衣裙',599,'白色','/img/product/dress/dress7/dress7_details.png'),
(NULL,2,1,2,53,'圆领修身设计感连衣裙','IDID|时尚优雅心机设计感，迷人瘦腰',799,'黑色','/img/product/dress/dress8/dress8_details.png'),
(NULL,3,1,3,52,'系扣条纹吊带裙','ZERO-3|优雅魅力，洋溢温柔魅力',899,'蓝色','/img/product/dress/dress9/dress9_details.png'),
(NULL,4,1,4,51,'碎花泡泡袖连衣裙','MUSNOVA|复古风碎花，清新优雅',1199,'印花','/img/product/dress/dress10/dress10_details.png'),

(NULL,1,1,1,50,'浪漫飘逸打懒连衣裙','MUSNOVA|优雅舒适面料，精致打懒工艺',599,'绿色','/img/product/dress/dress11/dress11_detail.jpg'),
(NULL,2,1,2,49,'倾斜泡泡袖标连衣裙','MUSNOVA|复古优雅魅力，洋溢温柔气质',1699,'灰蓝','/img/product/dress/dress12/dress12_detail.jpg'),
(NULL,3,1,3,48,'衬衫收腰连衣裙','IDID|都市时尚风采，展现大方魅力',999,'米','/img/product/dress/dress13/dress13_detail.jpg'),
(NULL,3,1,3,47,'提花珍珠吊带裙','MUSNOVA|重工提花，温柔浪漫风',1199,'提花牛仔蓝','/img/product/dress/dress14/dress14_detail.jpg'),
(NULL,4,1,4,46,'设计感手绘条纹衬衫连衣裙','MUSNOVA|手绘条纹衬衫连衣裙，气质在线',739,'蓝条','/img/product/dress/dress15/dress15_detail.jpg'),

(NULL,1,1,1,45,'蕾丝拼接百褶吊带裙','MOUSNOVA | 都市时尚风采，展现魅力',1199,'本白','/img/product/dress/dress16/dress16_details.jpg'),
(NULL,2,1,2,44,'白色连衣裙','MOUSNOVA | 文艺休闲二合一，气质连衣裙',599,'白','/img/product/dress/dress17/dress17_details.jpg'),
(NULL,3,1,3,43,'休闲泡泡袖系带V领连衣裙','MOUSNOVA | 系带连衣裙，夏日扮靓单品',799,'黄','/img/product/dress/dress18/dress18_details.jpg'),
(NULL,4,1,4,42,'花色长款连衣裙','MOUSNOVA | 文艺印花点缀，飘逸优雅',999,'粉花','/img/product/dress/dress19/dress19_details.jpg'),
(NULL,4,1,4,41,'V领收腰蕾丝连衣裙','MOUSNOVA | V领收腰，淑女气质',999,'灰紫','/img/product/dress/dress20/dress20_details.jpg'),
-- 上装
(NULL,1,2,1,40,"撞色经典翻领条纹西装","ZERO -3|经典版型，职场气质提升",1999,"黑","/img/product/cloth/cloth1/cloth1_details.png"),
(NULL,1,2,1,39,"褶皱感蓬松西装外套","IDID |优雅简约设计，职场气质提升",1799,"淡米","/img/product/cloth/cloth2/cloth2_details.png"),
(NULL,2,2,2,38,"不对称条纹拼接短袖西装","IDID |不对称个性拼接，时髦短袖设计",699,"黑","/img/product/cloth/cloth3/cloth3_details.png"),
(NULL,3,2,3,37,"印花翻领休闲短袖西服","YES.OR.NO |复古优雅时尚，展现优雅魅力",1699,"灰","/img/product/cloth/cloth4/cloth4_details.png"),
(NULL,4,2,4,36,"双排扣西装外套","IDID |率性大口袋设计，可甜可飒",1099,"卡其","/img/product/cloth/cloth5/cloth5_details.png"),

(NULL,1,2,1,35,'女神范波浪衬衣','MUSNOVA|斜向收腰设计，修饰腰部线条',359,'绿色','/img/product/dress/dress6/dress6_details.png'),
(NULL,2,2,2,34,'通勤缎面休闲衬衫','MUSNOVA|丝质缎面衬衫，凸显优雅气质',599,'灰绿色','/img/product/dress/dress7/dress7_details.png'),
(NULL,2,2,2,33,'泡泡袖多层领衬衫','IDID|兼具复古与时髦，轻松穿出少女感',649,'白色','/img/product/dress/dress8/dress8_details.png'),
(NULL,3,2,3,32,'腔调气质系带衬衫','IDID|Formal衬衫廓形，简约精致',499,'白色','/img/product/dress/dress9/dress9_details.png'),
(NULL,4,2,4,31,'绑带收腰短款上衣','THSNORTHAT|裁剪转移设计，时髦帅气',1399,'黑色','/img/product/dress/dress10/dress10_details.png'),

(NULL,1,2,1,30,"爱心印花针织毛衫T桖","MUSNOVA|都市时尚风采，展现魅力",699,"白","/img/product/cloth/clothes11/clothes11_detail.jpg"),
(NULL,2,2,2,29,"撞色拼接T桖","IDID |都市时尚风采，展现魅力",899,"白","/img/product/cloth/clothes12/clothes12_detail.jpg"),
(NULL,3,2,3,28,"腰部抽辙针织短袖T桖","IDID |都市时尚风采，打造干练形象",399,"白","/img/product/cloth/clothes13/clothes13_detail.jpg"),
(NULL,3,2,3,27,"不对称褶皱圆领T桖","IDID |简约设计，展现优雅魅力",499,"绿","/img/product/cloth/clothes14/clothes14_detail.jpg"),
(NULL,4,2,4,26,"格纹薄透单上衣","YES.OR.NO |薄透设计，简约大方显气质",299,"紫绿格","/img/product/cloth/clothes15/clothes15_detail.jpg"),

(NULL,1,2,1,25,'立领收腰短款短袖衬衫','YES.OR.NO | 个性时尚元素，时髦活力',799,'白','/img/product/cloth/cloth16/cloth16_details.jpg'),
(NULL,2,2,2,24,'设计感衬衫领T恤','SANT GUO | 都市时尚风采，展现魅力',1299,'杏','/img/product/cloth/cloth17/cloth17_details.jpg'),
(NULL,3,2,3,23,'蕾丝方格拼接短袖衬衣','YES.OR.NO | 优雅简约设计，职场气质提升',1499,'白','/img/product/cloth/cloth18/cloth18_details.jpg'),
(NULL,4,2,4,22,'侧边绑带宽松休闲百搭衬衫','IDID | 都市时尚风采，展现魅力',799,'白','/img/product/cloth/cloth19/cloth19_details.jpg'),
(NULL,4,2,4,21,'纯色衬衫连衣裙','IDID | 复古优雅魅力，洋溢温柔气质',899,'军绿','/img/product/cloth/cloth20/cloth20_details.jpg'),
-- 下装
(NULL,1,3,1,22,"毛边纯色牛仔半裤","MUSNOVA |简约设计，展现优雅魅力",599,"白","/img/product/pants/pants1/pants1_details.png"),
(NULL,1,3,1,20,"撞色条纹西装阔腿长裤","ZERO -3|都市时尚风采，展现魅力",1399,"藏青","/img/product/pants/pants2/pants2_details.png"),
(NULL,2,3,2,19,"高腰牛仔印花渐变长裤","YES.OR.NO |都市时尚风采，展现魅力",999,"蓝","/img/product/pants/pants3/pants3_details.png"),
(NULL,3,3,3,18,"高腰毛边工艺印花短裤","YES.OR.NO |毛边工艺，俏皮减龄",699,"蓝","/img/product/pants/pants4/pants4_details.png"),
(NULL,4,3,4,17,"扎染牛仔短裤","YES.OR.NO |都市时尚魅力，尽显运动风采",899,"白","/img/product/pants/pants5/pants5_details.png"),

(NULL,1,3,1,16,'运动休闲收腿长裤','YES.OR.NO|都市时尚风采，展现大方魅力',999,'藏青色','/img/product/dress/dress6/dress6_details.png'),
(NULL,2,3,2,15,'扎染牛仔连衣裤','YES.OR.NO|腰带装饰，增添造型感',1499,'白色','/img/product/dress/dress7/dress7_details.png'),
(NULL,2,3,2,14,'优雅轻奢的印花紧身裤','Girl boss|规律的字符印花，打造强烈视觉',799,'白色','/img/product/dress/dress8/dress8_details.png'),
(NULL,3,3,3,13,'休闲可拆卸腰带半裤','IDID|都市时尚风采，展现大方魅力',899,'军绿色','/img/product/dress/dress9/dress9_details.png'),
(NULL,4,3,4,12,'商务八分裤','MUSNOVA|职场气质风格，摩登复古微喇',559,'棕咖色','/img/product/dress/dress10/dress10_details.png'),

(NULL,1,3,1,11,"高腰毛边工艺短裤","YES.OR.NO |毛边工艺，俏皮减龄",799,"牛仔蓝","/img/product/pants/pant11/pant11_detail.jpg"),
(NULL,2,3,2,10,"压皱高腰休闲短裤","MOSNOVA|简约设计，展现优雅魅力",699,"蓝","/img/product/pants/pant12/pant12_detail.jpg"),
(NULL,3,3,3,9,"对称口袋设计连衣裤","IDID |优雅简约设计，职场气质提升",1199,"米","/img/product/pants/pant13/pant13_detail.jpg"),
(NULL,3,3,3,8,"印花收腰梭织工装连体裤","YES.OR.NO |个性印花，简约时尚",1299,"灰","/img/product/pants/pant14/pant14_detail.jpg"),
(NULL,4,3,4,7,"不规则高腰休闲短裤","MOSNOVA |简约设计，展现优雅魅力",699,"薰衣草紫","/img/product/pants/pant15/pant15_detail.jpg"),

(NULL,1,3,1,6,'l蓝色大花梭织半裙','FENGYI TAN | 清晰蓝纹，时髦活力',1399,'蓝','/img/product/pants/pants16/pants16_details.jpg'),
(NULL,2,3,2,5,'法式气质中长款半裙','MOSNOVA | 优雅简约设计，洋溢温柔气质',699,'灰紫','/img/product/pants/pants/pants17_details.jpg'),
(NULL,3,3,3,4,'毛边设计感牛仔','YES.OR.NO | 品牌印花，简约时尚',699,'牛仔蓝','/img/product/pants/pants18/pants18_details.jpg'),
(NULL,4,3,4,3,'时尚不对称设计半裙','梦会停 | 设计感半裙，可飒可活泼',599,'白','/img/product/pants/pants19/pants19_details.jpg'),
(NULL,4,3,4,1,'珍珠链条浅牛仔蓝半裙','COZYLUCE | 开叉设计，层次丰富时尚优雅',799,'浅牛仔蓝','/img/product/pants/pants20/pants20_details.jpg');


-- 设计师表-----------------------
DROP TABLE IF EXISTS `I_designer`;
CREATE TABLE `I_designer` (
	`did` int(11) NOT NULL,
	`name` varchar(32) DEFAULT NULL,
	`avatar` varchar(128) DEFAULT NULL,
	`subname` varchar(400) DEFAULT NULL,
	`background_img` varchar(128) DEFAULT NULL,
	`Intro_title` varchar(128) DEFAULT NULL,
	`Intro_content` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `I_designer` (`did`,`name`,`avatar`,`subname`,`background_img`,`Intro_title`,`Intro_content`) VALUES
(1,'梦会停','/img/designer/designer1/avatar.jpg','中国备受国内众多一线明星青睐的中国新锐品牌MENG HUITING创始人','/img/designer/designer1/background.jpg','风格主义与浪漫主义结合','鬼才设计师梦会停，同名品牌MENGHUITING创始人;《女神新装》明星设计师出道，蕴藏深厚美术功底,先后与多位艺术家跨界发布艺术家合作系列，不断推出惊艳视觉的二次拆分作品;善用风格主义与浪漫主义结合创作，挖掘艺术于时装的价值表现力;是蔡徐坤、羽泉御用设计师。'),
(2,'谭凤仪','/img/designer/designer2/avatar.jpg','中国FENGYI TAN品牌创始人','/img/designer/designer2/background.jpg','从实验性的尝试到日常化的展现，创作一系列能凸显当下独立女性精神的服装。','2015年毕业于英国皇家艺术学院，同年在伦敦成立FENGYI TAN同名女装品牌，并多次入选伦敦时装周官方日程;2017年与荷兰皇家舞蹈剧院首席舞者AnnaHermann合作，艺术舞蹈剧形式发布;2018年联合艺术家及建筑师林拓、编舞艺术家Malgorzata Dzierzon、音乐人张梦等，完成艺术展示。'),
(3,'XUZHI','/img/designer/designer3/avatar.jpg','中国高级时装品牌XUZHI创始人','/img/designer/designer3/background.jpg','追求现代审美和杰出手工艺，以感性的叙事手法展现当代女性精神。','设计师序之毕业于伦敦中央圣马丁，曾先后在CraigGreen，J.W.Anderson等知名设计师工作室工作;获国际羊毛标志大赛大奖，入围LVMH Prize，两次入围H&M设计大奖;2015年在伦敦创立同名高级时装品牌XU ZHI，品牌注重面料研发与工艺创由此出发的细腻设计，不仅流露着诗意情怀，更强调浪漫与理性的平衡——旨在为拥有独立思维的女性提供一个非凡的衣橱选择，营造更广泛的美学体验。2017年，入选《福布斯》亚洲30 under 30名单，2018年入选BOF 500榜单。'),
(4,'惠敏楠','/img/designer/designer4/avatar.jpg','中国品牌MINNANHUI创始人曾任职于鬼才设计师品牌亚历山大·麦昆','/img/designer/designer4/background.jpg','创造性独特的艺术女性风格','惠敏楠,2013年毕业于世界著名服装学院英国中央圣马丁艺术与设计服装学院服装设计与印染专业，以本科最高荣誉毕业并且作品入选同年圣马丁优秀毕业服装秀,同时被著名网站BOF lHE DUolVLA-g，先为年度最棒的6个毕业生之一，并与2013年7月入选TEXPRINT 2013,被免费赞助在伦敦、巴黎、意大利展出作品，成功进驻欧洲市场。');


-- 商品图片---------
CREATE TABLE I_product_pic(
    `ppid` INT PRIMARY KEY AUTO_INCREMENT,
    `pro_pid` INT ,                                  #商品编号                           
    `pic` VARCHAR(128),                          #商品图片
	foreign key(pro_pid) references I_product(pid)
);

INSERT INTO I_product_pic VALUES
-- 裤子
(NULL,41,"/img/product/pants/pants1/pants1_1.png"),
(NULL,41,"/img/product/pants/pants1/pants1_2.png"),
(NULL,41,"/img/product/pants/pants1/pants1_3.png"),
(NULL,41,"/img/product/pants/pants1/pants1_4.png"),
(NULL,41,"/img/product/pants/pants1/pants1_5.png"),
(NULL,41,"/img/product/pants/pants1/pants1_6.png"),

(NULL,42,"/img/product/pants/pants2/pants2_1.png"),
(NULL,42,"/img/product/pants/pants2/pants2_2.png"),
(NULL,42,"/img/product/pants/pants2/pants2_3.png"),
(NULL,42,"/img/product/pants/pants2/pants2_4.png"),
(NULL,42,"/img/product/pants/pants2/pants2_5.png"),
(NULL,42,"/img/product/pants/pants2/pants2_6.png"),

(NULL,43,"/img/product/pants/pants3/pants3_1.png"),
(NULL,43,"/img/product/pants/pants3/pants3_2.png"),
(NULL,43,"/img/product/pants/pants3/pants3_3.png"),
(NULL,43,"/img/product/pants/pants3/pants3_4.png"),
(NULL,43,"/img/product/pants/pants3/pants3_5.png"),
(NULL,43,"/img/product/pants/pants3/pants3_6.png"),

(NULL,44,"/img/product/pants/pants4/pants4_1.png"),
(NULL,44,"/img/product/pants/pants4/pants4_2.png"),
(NULL,44,"/img/product/pants/pants4/pants4_3.png"),
(NULL,44,"/img/product/pants/pants4/pants4_4.png"),
(NULL,44,"/img/product/pants/pants4/pants4_5.png"),
(NULL,44,"/img/product/pants/pants4/pants4_6.png"),

(NULL,45,"/img/product/pants/pants5/pants5_1.png"),
(NULL,45,"/img/product/pants/pants5/pants5_2.png"),
(NULL,45,"/img/product/pants/pants5/pants5_3.png"),
(NULL,45,"/img/product/pants/pants5/pants5_4.png"),
(NULL,45,"/img/product/pants/pants5/pants5_5.png"),
(NULL,45,"/img/product/pants/pants5/pants5_6.png"),

(null,46,'/img/product/pants/pants6/pants6_1.png'),
(null,46,'/img/product/pants/pants6/pants6_2.png'),
(null,46,'/img/product/pants/pants6/pants6_3.png'),
(null,46,'/img/product/pants/pants6/pants6_4.png'),
(null,46,'/img/product/pants/pants6/pants6_5.png'),
(null,46,'/img/product/pants/pants6/pants6_6.png'),

(null,47,'/img/product/pants/pants7/pants7_1.png'),
(null,47,'/img/product/pants/pants7/pants7_2.png'),
(null,47,'/img/product/pants/pants7/pants7_3.png'),
(null,47,'/img/product/pants/pants7/pants7_4.png'),
(null,47,'/img/product/pants/pants7/pants7_5.png'),
(null,47,'/img/product/pants/pants7/pants7_6.png'),

(null,48,'/img/product/pants/pants8/pants8_1.png'),
(null,48,'/img/product/pants/pants8/pants8_2.png'),
(null,48,'/img/product/pants/pants8/pants8_3.png'),
(null,48,'/img/product/pants/pants8/pants8_4.png'),
(null,48,'/img/product/pants/pants8/pants8_5.png'),
(null,48,'/img/product/pants/pants8/pants8_6.png'),


(null,49,'/img/product/pants/pants9/pants9_1.png'),
(null,49,'/img/product/pants/pants9/pants9_2.png'),
(null,49,'/img/product/pants/pants9/pants9_3.png'),
(null,49,'/img/product/pants/pants9/pants9_4.png'),
(null,49,'/img/product/pants/pants9/pants9_5.png'),
(null,49,'/img/product/pants/pants9/pants9_6.png'),


(null,50,'/img/product/pants/pants10/pants10_1.png'),
(null,50,'/img/product/pants/pants10/pants10_2.png'),
(null,50,'/img/product/pants/pants10/pants10_3.png'),
(null,50,'/img/product/pants/pants10/pants10_4.png'),
(null,50,'/img/product/pants/pants10/pants10_5.png'),
(null,50,'/img/product/pants/pants10/pants10_6.png'),
(null,50,'/img/product/pants/pants10/pants10_7.png'),

(NULL,51,"/img/product/pants/pant11/pant11_1.jpg"),
(NULL,51,"/img/product/pants/pant11/pant11_2.jpg"),
(NULL,51,"/img/product/pants/pant11/pant11_3.jpg"),
(NULL,51,"/img/product/pants/pant11/pant11_4.jpg"),
(NULL,51,"/img/product/pants/pant11/pant11_5.jpg"),
(NULL,51,"/img/product/pants/pant11/pant11_6.jpg"),

(NULL,52,"/img/product/pants/pant12/pant12_1.jpg"),
(NULL,52,"/img/product/pants/pant12/pant12_2.jpg"),
(NULL,52,"/img/product/pants/pant12/pant12_3.jpg"),
(NULL,52,"/img/product/pants/pant12/pant12_4.jpg"),
(NULL,52,"/img/product/pants/pant12/pant12_5.jpg"),
(NULL,52,"/img/product/pants/pant12/pant12_6.jpg"),

(NULL,53,"/img/product/pants/pant13/pant13_1.jpg"),
(NULL,53,"/img/product/pants/pant13/pant13_2.jpg"),
(NULL,53,"/img/product/pants/pant13/pant13_3.jpg"),
(NULL,53,"/img/product/pants/pant13/pant13_4.jpg"),
(NULL,53,"/img/product/pants/pant13/pant13_5.jpg"),
(NULL,53,"/img/product/pants/pant13/pant13_6.jpg"),

(NULL,54,"/img/product/pants/pant14/pant14_1.jpg"),
(NULL,54,"/img/product/pants/pant14/pant14_2.jpg"),
(NULL,54,"/img/product/pants/pant14/pant14_3.jpg"),
(NULL,54,"/img/product/pants/pant14/pant14_4.jpg"),
(NULL,54,"/img/product/pants/pant14/pant14_5.jpg"),
(NULL,54,"/img/product/pants/pant14/pant14_6.jpg"),

(NULL,55,"/img/product/pants/pant15/pant15_1.jpg"),
(NULL,55,"/img/product/pants/pant15/pant15_2.jpg"),
(NULL,55,"/img/product/pants/pant15/pant15_3.jpg"),
(NULL,55,"/img/product/pants/pant15/pant15_4.jpg"),
(NULL,55,"/img/product/pants/pant15/pant15_5.jpg"),
(NULL,55,"/img/product/pants/pant15/pant15_6.jpg"),


(NULL,56,'/img/product/pants/pants16/pants16_2.jpg'),
(NULL,56,'/img/product/pants/pants16/pants16_1.jpg'),
(NULL,56,'/img/product/pants/pants16/pants16_3.jpg'),
(NULL,56,'/img/product/pants/pants16/pants16_4.jpg'),

(NULL,57,'/img/product/pants/pants17/pants17_2.jpg'),
(NULL,57,'/img/product/pants/pants17/pants17_1.jpg'),
(NULL,57,'/img/product/pants/pants17/pants17_3.jpg'),
(NULL,57,'/img/product/pants/pants17/pants17_4.jpg'),

(NULL,58,'/img/product/pants/pants18/pants18_1.jpg'),
(NULL,58,'/img/product/pants/pants18/pants18_2.jpg'),
(NULL,58,'/img/product/pants/pants18/pants18_3.jpg'),
(NULL,58,'/img/product/pants/pants18/pants18_4.jpg'),


(NULL,59,'/img/product/pants/pants19/pants19_1.jpg'),
(NULL,59,'/img/product/pants/pants19/pants19_2.jpg'),
(NULL,59,'/img/product/pants/pants19/pants19_3.jpg'),
(NULL,59,'/img/product/pants/pants19/pants19_4.jpg'),


(NULL,60,'/img/product/pants/pants20/pants20_1.jpg'),
(NULL,60,'/img/product/pants/pants20/pants20_2.jpg'),
(NULL,60,'/img/product/pants/pants20/pants20_3.jpg'),
(NULL,60,'/img/product/pants/pants20/pants20_4.jpg'),
-- 上衣
(NULL,21,"/img/product/cloth/cloth1/cloth1_1.png"),
(NULL,21,"/img/product/cloth/cloth1/cloth1_2.png"),
(NULL,21,"/img/product/cloth/cloth1/cloth1_3.png"),
(NULL,21,"/img/product/cloth/cloth1/cloth1_4.png"),
(NULL,21,"/img/product/cloth/cloth1/cloth1_5.png"),
(NULL,21,"/img/product/cloth/cloth1/cloth1_6.png"),

(NULL,22,"/img/product/cloth/cloth2/cloth2_1.png"),
(NULL,22,"/img/product/cloth/cloth2/cloth2_2.png"),
(NULL,22,"/img/product/cloth/cloth2/cloth2_3.png"),
(NULL,22,"/img/product/cloth/cloth2/cloth2_4.png"),
(NULL,22,"/img/product/cloth/cloth2/cloth2_5.png"),
(NULL,22,"/img/product/cloth/cloth2/cloth2_6.png"),

(NULL,23,"/img/product/cloth/cloth3/cloth3_1.png"),
(NULL,23,"/img/product/cloth/cloth3/cloth3_2.png"),
(NULL,23,"/img/product/cloth/cloth3/cloth3_3.png"),
(NULL,23,"/img/product/cloth/cloth3/cloth3_4.png"),
(NULL,23,"/img/product/cloth/cloth3/cloth3_5.png"),
(NULL,23,"/img/product/cloth/cloth3/cloth3_6.png"),

(NULL,24,"/img/product/cloth/cloth4/cloth4_1.png"),
(NULL,24,"/img/product/cloth/cloth4/cloth4_2.png"),
(NULL,24,"/img/product/cloth/cloth4/cloth4_3.png"),
(NULL,24,"/img/product/cloth/cloth4/cloth4_4.png"),
(NULL,24,"/img/product/cloth/cloth4/cloth4_5.png"),
(NULL,24,"/img/product/cloth/cloth4/cloth4_6.png"),

(NULL,25,"/img/product/cloth/cloth5/cloth5_1.png"),
(NULL,25,"/img/product/cloth/cloth5/cloth5_2.png"),
(NULL,25,"/img/product/cloth/cloth5/cloth5_3.png"),
(NULL,25,"/img/product/cloth/cloth5/cloth5_4.png"),
(NULL,25,"/img/product/cloth/cloth5/cloth5_5.png"),
(NULL,25,"/img/product/cloth/cloth5/cloth5_6.png"),

(null,26,'/img/product/cloth/cloth6/cloth6_1.png'),
(null,26,'/img/product/cloth/cloth6/cloth6_2.png'),
(null,26,'/img/product/cloth/cloth6/cloth6_3.png'),
(null,26,'/img/product/cloth/cloth6/cloth6_4.png'),
(null,26,'/img/product/cloth/cloth6/cloth6_5.png'),
(null,26,'/img/product/cloth/cloth6/cloth6_6.png'),

(null,27,'/img/product/cloth/cloth7/cloth7_1.png'),
(null,27,'/img/product/cloth/cloth7/cloth7_2.png'),
(null,27,'/img/product/cloth/cloth7/cloth7_3.png'),

(null,28,'/img/product/cloth/cloth8/cloth8_1.png'),
(null,28,'/img/product/cloth/cloth8/cloth8_2.png'),
(null,28,'/img/product/cloth/cloth8/cloth8_3.png'),

(null,29,'/img/product/cloth/cloth9/cloth9_1.png'),
(null,29,'/img/product/cloth/cloth9/cloth9_2.png'),
(null,29,'/img/product/cloth/cloth9/cloth9_3.png'),
(null,29,'/img/product/cloth/cloth9/cloth9_4.png'),

(null,30,'/img/product/cloth/cloth10/cloth10_1.png'),
(null,30,'/img/product/cloth/cloth10/cloth10_2.png'),
(null,30,'/img/product/cloth/cloth10/cloth10_3.png'),
(null,30,'/img/product/cloth/cloth10/cloth10_4.png'),
(null,30,'/img/product/cloth/cloth10/cloth10_5.png'),
(null,30,'/img/product/cloth/cloth10/cloth10_6.png'),

(NULL,31,"/img/product/cloth/clothes11/clothes11_1.jpg"),
(NULL,31,"/img/product/cloth/clothes11/clothes11_2.jpg"),
(NULL,31,"/img/product/cloth/clothes11/clothes11_3.jpg"),
(NULL,31,"/img/product/cloth/clothes11/clothes11_4.jpg"),
(NULL,31,"/img/product/cloth/clothes11/clothes11_5.jpg"),
(NULL,31,"/img/product/cloth/clothes11/clothes11_6.jpg"),

(NULL,32,"/img/product/cloth/clothes12/clothes12_1.jpg"),
(NULL,32,"/img/product/cloth/clothes12/clothes12_2.jpg"),
(NULL,32,"/img/product/cloth/clothes12/clothes12_3.jpg"),
(NULL,32,"/img/product/cloth/clothes12/clothes12_4.jpg"),
(NULL,32,"/img/product/cloth/clothes12/clothes12_5.jpg"),
(NULL,32,"/img/product/cloth/clothes12/clothes12_6.jpg"),

(NULL,33,"/img/product/cloth/clothes13/clothes13_1.jpg"),
(NULL,33,"/img/product/cloth/clothes13/clothes13_2.jpg"),
(NULL,33,"/img/product/cloth/clothes13/clothes13_3.jpg"),
(NULL,33,"/img/product/cloth/clothes13/clothes13_4.jpg"),
(NULL,33,"/img/product/cloth/clothes13/clothes13_5.jpg"),
(NULL,33,"/img/product/cloth/clothes13/clothes13_6.jpg"),

(NULL,34,"/img/product/cloth/clothes14/clothes14_1.jpg"),
(NULL,34,"/img/product/cloth/clothes14/clothes14_2.jpg"),
(NULL,34,"/img/product/cloth/clothes14/clothes14_3.jpg"),
(NULL,34,"/img/product/cloth/clothes14/clothes14_4.jpg"),
(NULL,34,"/img/product/cloth/clothes14/clothes14_5.jpg"),
(NULL,34,"/img/product/cloth/clothes14/clothes14_6.jpg"),

(NULL,35,"/img/product/cloth/clothes15/clothes15_1.jpg"),
(NULL,35,"/img/product/cloth/clothes15/clothes15_2.jpg"),
(NULL,35,"/img/product/cloth/clothes15/clothes15_3.jpg"),
(NULL,35,"/img/product/cloth/clothes15/clothes15_4.jpg"),
(NULL,35,"/img/product/cloth/clothes15/clothes15_5.jpg"),
(NULL,35,"/img/product/cloth/clothes15/clothes15_6.jpg"),

(NULL,36,'/img/product/cloth/cloth16/cloth16_1.jpg'),
(NULL,36,'/img/product/cloth/cloth16/cloth16_2.jpg'),
(NULL,36,'/img/product/cloth/cloth16/cloth16_3.jpg'),
(NULL,36,'/img/product/cloth/cloth16/cloth16_4.jpg'),

(NULL,37,'/img/product/cloth/cloth17/cloth17_1.jpg'),
(NULL,37,'/img/product/cloth/cloth17/cloth17_2.jpg'),
(NULL,37,'/img/product/cloth/cloth17/cloth17_3.jpg'),
(NULL,37,'/img/product/cloth/cloth17/cloth17_4.jpg'),

(NULL,38,'/img/product/cloth/cloth18/cloth18_1.jpg'),
(NULL,38,'/img/product/cloth/cloth18/cloth18_2.jpg'),
(NULL,38,'/img/product/cloth/cloth18/cloth18_3.jpg'),
(NULL,38,'/img/product/cloth/cloth18/cloth18_4.jpg'),


(NULL,39,'/img/product/cloth/cloth19/cloth19_1.jpg'),
(NULL,39,'/img/product/cloth/cloth19/cloth19_2.jpg'),
(NULL,39,'/img/product/cloth/cloth19/cloth19_3.jpg'),
(NULL,39,'/img/product/cloth/cloth19/cloth19_4.jpg'),


(NULL,40,'/img/product/cloth/cloth20/cloth20_1.jpg'),
(NULL,40,'/img/product/cloth/cloth20/cloth20_2.jpg'),
(NULL,40,'/img/product/cloth/cloth20/cloth20_3.jpg'),
(NULL,40,'/img/product/cloth/cloth20/cloth20_4.jpg'),
-- 连衣裙
(NULL,1,"/img/product/dress/dress1/dress1_1.png"),
(NULL,1,"/img/product/dress/dress1/dress1_2.png"),
(NULL,1,"/img/product/dress/dress1/dress1_3.png"),
(NULL,1,"/img/product/dress/dress1/dress1_4.png"),
(NULL,1,"/img/product/dress/dress1/dress1_5.png"),
(NULL,1,"/img/product/dress/dress1/dress1_6.png"),

(NULL,2,"/img/product/dress/dress2/dress2_1.png"),
(NULL,2,"/img/product/dress/dress2/dress2_2.png"),
(NULL,2,"/img/product/dress/dress2/dress2_3.png"),
(NULL,2,"/img/product/dress/dress2/dress2_4.png"),
(NULL,2,"/img/product/dress/dress2/dress2_5.png"),
(NULL,2,"/img/product/dress/dress2/dress2_6.png"),

(NULL,3,"/img/product/dress/dress3/dress3_1.png"),
(NULL,3,"/img/product/dress/dress3/dress3_2.png"),
(NULL,3,"/img/product/dress/dress3/dress3_3.png"),
(NULL,3,"/img/product/dress/dress3/dress3_4.png"),
(NULL,3,"/img/product/dress/dress3/dress3_5.png"),
(NULL,3,"/img/product/dress/dress3/dress3_6.png"),

(NULL,4,"/img/product/dress/dress4/dress4_1.png"),
(NULL,4,"/img/product/dress/dress4/dress4_2.png"),
(NULL,4,"/img/product/dress/dress4/dress4_3.png"),
(NULL,4,"/img/product/dress/dress4/dress4_4.png"),
(NULL,4,"/img/product/dress/dress4/dress4_5.png"),
(NULL,4,"/img/product/dress/dress4/dress4_6.png"),

(NULL,5,"/img/product/dress/dress5/dress5_1.png"),
(NULL,5,"/img/product/dress/dress5/dress5_2.png"),
(NULL,5,"/img/product/dress/dress5/dress5_3.png"),
(NULL,5,"/img/product/dress/dress5/dress5_4.png"),
(NULL,5,"/img/product/dress/dress5/dress5_5.png"),
(NULL,5,"/img/product/dress/dress5/dress5_6.png"),

(null,6,'/img/product/dress/dress6/dress6_1.png'),
(null,6,'/img/product/dress/dress6/dress6_2.png'),
(null,6,'/img/product/dress/dress6/dress6_3.png'),
(null,6,'/img/product/dress/dress6/dress6_4.png'),
(null,6,'/img/product/dress/dress6/dress6_5.png'),

(null,7,'/img/product/dress/dress7/dress7_1.png'),
(null,7,'/img/product/dress/dress7/dress7_2.png'),
(null,7,'/img/product/dress/dress7/dress7_3.pg'),

(null,8,'/img/product/dress/dress8/dress8_1.png'),
(null,8,'/img/product/dress/dress8/dress8_2.png'),
(null,8,'/img/product/dress/dress8/dress8_3.png'),

(null,9,'/img/product/dress/dress9/dress9_1.png'),
(null,9,'/img/product/dress/dress9/dress9_2.png'),
(null,9,'/img/product/dress/dress9/dress9_3.png'),
(null,9,'/img/product/dress/dress9/dress9_4.png'),
(null,9,'/img/product/dress/dress9/dress9_5.png'),
(null,9,'/img/product/dress/dress9/dress9_6.png'),

(null,10,'/img/product/dress/dress10/dress10_1.png'),
(null,10,'/img/product/dress/dress10/dress10_2.png'),
(null,10,'/img/product/dress/dress10/dress10_3.png'),
(null,10,'/img/product/dress/dress10/dress10_4.png'),
(null,10,'/img/product/dress/dress10/dress10_5.png'),
(null,10,'/img/product/dress/dress10/dress10_6.png'),

(NULL,11,"/img/product/dress/dress11/dress11_1.jpg"),
(NULL,11,"/img/product/dress/dress11/dress11_2.jpg"),
(NULL,11,"/img/product/dress/dress11/dress11_3.jpg"),
(NULL,11,"/img/product/dress/dress11/dress11_4.jpg"),
(NULL,11,"/img/product/dress/dress11/dress11_5.jpg"),
(NULL,11,"/img/product/dress/dress11/dress11_6.jpg"),

(NULL,12,"/img/product/dress/dress12/dress12_1.jpg"),
(NULL,12,"/img/product/dress/dress12/dress12_2.jpg"),
(NULL,12,"/img/product/dress/dress12/dress12_3.jpg"),
(NULL,12,"/img/product/dress/dress12/dress12_4.jpg"),
(NULL,12,"/img/product/dress/dress12/dress12_5.jpg"),
(NULL,12,"/img/product/dress/dress12/dress12_6.jpg"),

(NULL,13,"/img/product/dress/dress13/dress13_1.jpg"),
(NULL,13,"/img/product/dress/dress13/dress13_2.jpg"),
(NULL,13,"/img/product/dress/dress13/dress13_3.jpg"),
(NULL,13,"/img/product/dress/dress13/dress13_4.jpg"),
(NULL,13,"/img/product/dress/dress13/dress13_5.jpg"),
(NULL,13,"/img/product/dress/dress13/dress13_6.jpg"),

(NULL,14,"/img/product/dress/dress14/dress14_1.jpg"),
(NULL,14,"/img/product/dress/dress14/dress14_2.jpg"),
(NULL,14,"/img/product/dress/dress14/dress14_3.jpg"),
(NULL,14,"/img/product/dress/dress14/dress14_4.jpg"),
(NULL,14,"/img/product/dress/dress14/dress14_5.jpg"),
(NULL,14,"/img/product/dress/dress14/dress14_6.jpg"),

(NULL,15,"/img/product/dress/dress15/dress15_1.jpg"),
(NULL,15,"/img/product/dress/dress15/dress15_2.jpg"),
(NULL,15,"/img/product/dress/dress15/dress15_3.jpg"),
(NULL,15,"/img/product/dress/dress15/dress15_4.jpg"),
(NULL,15,"/img/product/dress/dress15/dress15_5.jpg"),
(NULL,15,"/img/product/dress/dress15/dress15_6.jpg"),

(NULL,16,'/img/product/dress/dress16/dress16_1.jpg'),
(NULL,16,'/img/product/dress/dress16/dress16_2.jpg'),
(NULL,16,'/img/product/dress/dress16/dress16_3.jpg'),
(NULL,16,'/img/product/dress/dress16/dress16_4.jpg'),

(NULL,17,'/img/product/dress/dress17/dress17_1.jpg'),
(NULL,17,'/img/product/dress/dress17/dress17_2.jpg'),
(NULL,17,'/img/product/dress/dress17/dress17_3.jpg'),
(NULL,17,'/img/product/dress/dress17/dress17_4.jpg'),

(NULL,18,'/img/product/dress/dress18/dress18_1.jpg'),
(NULL,18,'/img/product/dress/dress18/dress18_2.jpg'),
(NULL,18,'/img/product/dress/dress18/dress18_3.jpg'),
(NULL,18,'/img/product/dress/dress18/dress18_4.jpg'),


(NULL,19,'/img/product/dress/dress19/dress19_1.jpg'),
(NULL,19,'/img/product/dress/dress19/dress19_2.jpg'),
(NULL,19,'/img/product/dress/dress19/dress19_3.jpg'),
(NULL,19,'/img/product/dress/dress19/dress19_4.jpg'),


(NULL,20,'/img/product/dress/dress20/dress20_1.jpg'),
(NULL,20,'/img/product/dress/dress20/dress20_2.jpg'),
(NULL,20,'/img/product/dress/dress20/dress20_3.jpg'),
(NULL,20,'/img/product/dress/dress20/dress20_4.jpg');




ALTER TABLE `I_designer` 
ADD PRIMARY KEY (`did`);


ALTER TABLE `I_product_pic`
MODIFY `ppid` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `I_product`
MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `I_like`
MODIFY `lid` int(11) NOT NULL AUTO_INCREMENT;



CREATE TABLE I_community(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  cuid INT,
  foreign key(cuid) references I_user(uid),
	comment VARCHAR(1280),
  img varchar(500),
  uname varchar(20),
  avatar varchar(50),
  heart INT
);

INSERT INTO I_community VALUES
(NULL,1,"黑色开叉半裙，带来别样的小众设计感<br>今日也是街头弄儿",'["/img/community/av1_1.jpg","/img/community/av1_2.jpg","/img/community/av1_3.jpg","/img/community/av1_4.jpg"]',"lily","/img/user/avatar/avatar1.jpg",50),
(NULL,2,"一件能让人舒适的短袖<br>时尚简约，但绝不单调",'["/img/community/av2_1.jpg","/img/community/av2_2.jpg","/img/community/av2_3.jpg","/img/community/av2_4.jpg"]',"jack","/img/user/avatar/avatar2.jpg",82),
(NULL,3,"衣橱中那抹素雅别致的蓝<br>带着法式复古的浪漫",'["/img/community/av3_1.jpg","/img/community/av3_2.jpg","/img/community/av3_3.jpg","/img/community/av3_4.jpg"]',"jennie","/img/user/avatar/avatar3.jpg",67),
(NULL,4,"我想把喜欢藏进裙摆里，穿上它去见你",'["/img/community/av4_1.jpg","/img/community/av4_2.jpg","/img/community/av4_3.jpg","/img/community/av4_4.jpg"]',"Jisoo","/img/user/avatar/avatar4.jpg",61),
(NULL,5,"将俏皮可爱搬到衣服上<br>别出心裁的时尚T恤<br>送给不想规规矩矩的你",'["/img/community/av5_1.jpg","/img/community/av5_2.jpg","/img/community/av5_3.jpg","/img/community/av5_4.jpg"]',"cheetah","/img/user/avatar/avatar5.jpg",59),
(NULL,6,"优雅V领设计，气质又文艺<br>腰部收腰设计拉长身材比例",'["/img/community/av6_1.jpg","/img/community/av6_2.jpg","/img/community/av6_3.jpg","/img/community/av6_4.jpg"]',"Lisa","/img/user/avatar/avatar6.jpg",54),
(NULL,7,"公主风穿搭√<br>去迪士尼当然要选公主裙了<br>碎花、尖领、泡泡袖宫廷风元素有",'["/img/community/av7_1.jpg","/img/community/av7_2.jpg","/img/community/av7_3.jpg","/img/community/av7_4.jpg"]',"rose","/img/user/avatar/avatar7.jpg",66),
(NULL,8,"特别的桃心领配上珍珠链条<br>上身立马“小公主”",'["/img/community/av8_1.jpg","/img/community/av8_2.jpg","/img/community/av8_3.jpg","/img/community/av8_4.jpg"]',"Nakala","/img/user/avatar/avatar8.jpg",9);



-- CREATE TABLE I_community_pic(
--   cpid INT PRIMARY KEY AUTO_INCREMENT,
--   ccid INT,
-- 	pic VARCHAR(128),
--     	foreign key(ccid) references I_community(cid)

-- );

-- INSERT INTO I_community_pic VALUES
-- (NULL,1,"/img/community/av1_1.jpg"),
-- (NULL,1,"/img/community/av1_2.jpg"),
-- (NULL,1,"/img/community/av1_3.jpg"),
-- (NULL,1,"/img/community/av1_4.jpg"),

-- (NULL,2,"/img/community/av2_1.jpg"),
-- (NULL,2,"/img/community/av2_2.jpg"),
-- (NULL,2,"/img/community/av2_3.jpg"),
-- (NULL,2,"/img/community/av2_4.jpg"),

-- (NULL,3,"/img/community/av3_1.jpg"),
-- (NULL,3,"/img/community/av3_2.jpg"),
-- (NULL,3,"/img/community/av3_3.jpg"),
-- (NULL,3,"/img/community/av3_4.jpg"),

-- (NULL,4,"/img/community/av4_1.jpg"),
-- (NULL,4,"/img/community/av4_2.jpg"),
-- (NULL,4,"/img/community/av4_3.jpg"),
-- (NULL,4,"/img/community/av4_4.jpg"),

-- (NULL,5,"/img/community/av5_1.jpg"),
-- (NULL,5,"/img/community/av5_2.jpg"),
-- (NULL,5,"/img/community/av5_3.jpg"),
-- (NULL,5,"/img/community/av5_4.jpg"),

-- (NULL,6,"/img/community/av6_1.jpg"),
-- (NULL,6,"/img/community/av6_2.jpg"),
-- (NULL,6,"/img/community/av6_3.jpg"),
-- (NULL,6,"/img/community/av6_4.jpg"),

-- (NULL,7,"/img/community/av7_1.jpg"),
-- (NULL,7,"/img/community/av7_2.jpg"),
-- (NULL,7,"/img/community/av7_3.jpg"),
-- (NULL,7,"/img/community/av7_4.jpg"),

-- (NULL,8,"/img/community/av8_1.jpg"),
-- (NULL,8,"/img/community/av8_2.jpg"),
-- (NULL,8,"/img/community/av8_3.jpg"),
-- (NULL,8,"/img/community/av8_4.jpg");

