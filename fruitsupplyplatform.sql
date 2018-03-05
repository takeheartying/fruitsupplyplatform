/*
Navicat MySQL Data Transfer

Source Server         : 本机
Source Server Version : 50628
Source Host           : localhost:3306
Source Database       : fruitsupplyplatform

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2017-12-30 15:21:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `UserNO` varchar(20) NOT NULL,
  `UserName` varchar(20) CHARACTER SET utf8mb4 DEFAULT '用户名',
  `NiChen` varchar(20) DEFAULT '昵称',
  `UserAvatarPic` varchar(255) CHARACTER SET utf8mb4 DEFAULT './images/default-avatar.jpg',
  `Sex` char(4) DEFAULT '男',
  `CompanyName` varchar(255) DEFAULT NULL,
  `CompanyTel` varchar(11) DEFAULT NULL,
  `CompanyAddress` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `LoginAccount` varchar(20) NOT NULL,
  `LoginPassword` varchar(50) NOT NULL,
  PRIMARY KEY (`UserNO`,`LoginPassword`),
  KEY `UserNO` (`UserNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', '梁晓莹', '小屋', './images/小清新.jpg', '女', '东阳有限公司', '15868157426', '浙江科技学院', '707822162@qq.com', '15868157426', '12345');
INSERT INTO `account` VALUES ('2', '何方', '小静', './images/小清新.jpg', '女', '东阳公司', '15868157504', '浙江杭州', '707822162@qq.com', '15868157429', '12345');
INSERT INTO `account` VALUES ('3', '王强', '王小强', '', '男', '王室公司', '15983762834', '浙江杭州', '9837628394@qq.com', '15868157427', '12345');
INSERT INTO `account` VALUES ('4', '用户名', '昵称', './images/default-avatar.jpg', '男', null, null, null, null, '', '');
INSERT INTO `account` VALUES ('5', '用户名', '昵称', './images/default-avatar.jpg', '男', null, null, null, null, '', '');

-- ----------------------------
-- Table structure for `accountbalance`
-- ----------------------------
DROP TABLE IF EXISTS `accountbalance`;
CREATE TABLE `accountbalance` (
  `UserNO` varchar(20) NOT NULL,
  `Balance` decimal(11,2) NOT NULL,
  PRIMARY KEY (`UserNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accountbalance
-- ----------------------------
INSERT INTO `accountbalance` VALUES ('1', '15.90');
INSERT INTO `accountbalance` VALUES ('2', '13.00');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `UserNO` varchar(20) NOT NULL,
  `GoodsNO` varchar(20) NOT NULL,
  `ListNO` int(20) NOT NULL,
  `Comment` varchar(255) DEFAULT NULL,
  `ThumbNum` int(5) DEFAULT '0',
  `CommentTime` date DEFAULT NULL,
  `CommentRank` varchar(5) NOT NULL,
  `DesRank` int(1) NOT NULL,
  `ServiceRank` int(1) NOT NULL,
  `LogisticsRank` int(1) NOT NULL,
  PRIMARY KEY (`UserNO`,`GoodsNO`,`ListNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '000001', '1000011', '挺好吃的，也没有怎么损坏', '2', '2017-06-27', '好评', '4', '5', '4');
INSERT INTO `comment` VALUES ('1', '000001', '1000015', '好吃', '0', '2017-06-28', '好评', '4', '3', '5');
INSERT INTO `comment` VALUES ('1', '000004', '1000016', '挺好的', '0', '2017-06-29', '差评', '3', '2', '2');
INSERT INTO `comment` VALUES ('1', '000012', '1000013', '还可以', '0', '2017-06-03', '好评', '4', '2', '4');
INSERT INTO `comment` VALUES ('1', '000013', '1000014', '挺好吃的', '0', '2017-06-29', '好评', '4', '3', '4');
INSERT INTO `comment` VALUES ('2', '000001', '1000030', '还不错', '0', '2017-06-15', '中评', '4', '3', '5');
INSERT INTO `comment` VALUES ('3', '000001', '1000014', '水果都压坏了', '0', '2017-06-16', '好评', '4', '5', '4');
INSERT INTO `comment` VALUES ('4', '000001', '1000015', '橙子很酸', '0', '2017-06-17', '中评', '4', '5', '5');
INSERT INTO `comment` VALUES ('5', '000001', '1000017', '还可以', '1', '2017-06-18', '好评', '4', '5', '4');

-- ----------------------------
-- Table structure for `deliverinf`
-- ----------------------------
DROP TABLE IF EXISTS `deliverinf`;
CREATE TABLE `deliverinf` (
  `ID` varchar(20) NOT NULL,
  `UserNO` varchar(20) DEFAULT NULL,
  `DowntownArea` varchar(20) DEFAULT '选择所在城区（只限杭州）',
  `Consignee` varchar(20) DEFAULT NULL,
  `Telephone` char(11) DEFAULT NULL,
  `Postcode` char(6) DEFAULT '000000',
  `DeliverAddress` varchar(50) DEFAULT NULL,
  `DefaultAddress` varchar(8) DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `DeliverUserNO` (`UserNO`),
  CONSTRAINT `DeliverUserNO` FOREIGN KEY (`UserNO`) REFERENCES `account` (`UserNO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deliverinf
-- ----------------------------
INSERT INTO `deliverinf` VALUES ('18', '2', '西湖区', '王浆谭', '15873652894', '309632', '浙江科技学院', '');
INSERT INTO `deliverinf` VALUES ('24', '2', '西湖区', '方强', '17897392749', '284927', '浙江科技学院', '默认地址');
INSERT INTO `deliverinf` VALUES ('25', '2', '上城区', '梁晓莹', '15868157426', '325612', '浙江杭州西湖区浙江科技学院', '');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `GoodsNO` varchar(20) NOT NULL,
  `GoodsName` varchar(20) NOT NULL,
  `Thermal` varchar(20) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `Soursweet` varchar(20) NOT NULL,
  `Area` varchar(20) NOT NULL,
  `GoodsWeight` float(5,0) NOT NULL,
  `GoodsPrice` float(5,2) NOT NULL,
  `Stock` int(5) NOT NULL,
  `SellNumber` int(5) NOT NULL,
  `OnTime` date NOT NULL,
  `Newest` char(4) NOT NULL DEFAULT '',
  `hottest` char(4) NOT NULL,
  PRIMARY KEY (`GoodsNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('000001', '橙子', '寒凉', '酸性', '中国', '5', '40.00', '70990', '10000', '2017-02-01', '新品', '热卖');
INSERT INTO `goods` VALUES ('000002', '山竹', '寒凉', '碱性', '马来西亚', '5', '70.00', '20000', '8000', '2017-02-02', '新品', '热卖');
INSERT INTO `goods` VALUES ('000003', '红柚', '寒凉', '碱性', '泰国', '5', '59.00', '10000', '7000', '2017-02-10', '新品', '热卖');
INSERT INTO `goods` VALUES ('000004', '鳄梨', '温热', '碱性', '泰国', '5', '25.00', '13400', '6500', '2017-02-12', '新品', '热卖');
INSERT INTO `goods` VALUES ('000005', '菠萝蜜', '温热', '碱性', '马来西亚', '10', '80.00', '10000', '3000', '2017-03-12', '新品', '热卖');
INSERT INTO `goods` VALUES ('000006', '杏子', '温热', '亚酸性', '马来西亚', '2', '36.00', '9873', '2650', '2017-03-18', '新品', '热卖');
INSERT INTO `goods` VALUES ('000007', '贵妃芒', '甘平', '亚酸性', '马来西亚', '8', '27.00', '9812', '2233', '2017-03-20', '新品', '热卖');
INSERT INTO `goods` VALUES ('000008', '黑布林', '寒凉', '酸性', '越南', '5', '29.00', '10000', '2166', '2017-04-22', '新品', '热卖');
INSERT INTO `goods` VALUES ('000009', '猕猴桃', '寒凉', '酸性', '中国', '5', '50.00', '20000', '2000', '2017-04-25', '新品', '热卖');
INSERT INTO `goods` VALUES ('000010', '荔枝', '温热', '碱性', '中国', '5', '39.00', '5000', '1899', '2017-05-04', '新品', '');
INSERT INTO `goods` VALUES ('000011', '杨梅', '温热', '酸性', '中国', '6', '89.00', '23905', '1830', '2017-05-08', '', '热卖');
INSERT INTO `goods` VALUES ('000012', '柚子', '寒凉', '碱性', '中国', '5', '53.00', '13000', '1800', '2017-05-08', '新品', '');
INSERT INTO `goods` VALUES ('000013', '红毛丹', '温热', '碱性', '马来西亚', '3', '68.00', '7600', '1790', '2017-05-09', '', '热卖');
INSERT INTO `goods` VALUES ('000014', '木瓜', '甘平', '碱性', '马来西亚', '9', '26.00', '12059', '1780', '2017-05-10', '', '');
INSERT INTO `goods` VALUES ('000015', '莲雾', '甘平', '酸性', '马来西亚', '4', '69.00', '13600', '1755', '2017-05-10', '新品', '');
INSERT INTO `goods` VALUES ('000016', '龙眼', '寒凉', '碱性', '泰国', '5', '79.00', '13680', '1750', '2017-05-11', '', '热卖');
INSERT INTO `goods` VALUES ('000017', '人参果', '甘平', '酸性', '泰国', '5', '27.00', '12000', '1742', '2017-05-11', '新品', '热卖');
INSERT INTO `goods` VALUES ('000018', '白蜜柚', '寒凉', '碱性', '泰国', '5', '82.00', '11900', '1740', '2017-05-12', '', '热卖');
INSERT INTO `goods` VALUES ('000019', '龙公果', '温热', '碱性', '泰国', '3', '89.00', '10000', '1700', '2017-05-12', '新品', '');
INSERT INTO `goods` VALUES ('000020', '火龙果', '寒凉', '碱性', '越南', '5', '39.00', '13770', '1690', '2017-05-13', '', '热卖');
INSERT INTO `goods` VALUES ('000021', '蛇果', '寒凉', '酸性', '越南', '5', '49.00', '2000', '1670', '2017-05-14', '', '');
INSERT INTO `goods` VALUES ('000022', '青柠', '甘平', '碱性', '越南', '4', '23.00', '12680', '2030', '2017-05-15', '新品', '热卖');
INSERT INTO `goods` VALUES ('000023', '百香果', '寒凉', '碱性', '越南', '5', '27.00', '13200', '1688', '2017-05-16', '', '');

-- ----------------------------
-- Table structure for `goodsdes`
-- ----------------------------
DROP TABLE IF EXISTS `goodsdes`;
CREATE TABLE `goodsdes` (
  `GoodsNO` varchar(20) NOT NULL,
  `Des1` varchar(255) DEFAULT NULL,
  `Des2` varchar(255) DEFAULT NULL,
  `Des3` varchar(255) DEFAULT NULL,
  `Des4` varchar(255) DEFAULT NULL,
  `Des5` varchar(255) DEFAULT NULL,
  `Picture1` varchar(255) DEFAULT NULL,
  `Picture2` varchar(255) DEFAULT NULL,
  `Picture3` varchar(255) DEFAULT NULL,
  `Picture4` varchar(255) DEFAULT NULL,
  `Picture5` varchar(255) DEFAULT NULL,
  `Picture6` varchar(255) DEFAULT NULL,
  `Picture7` varchar(255) DEFAULT NULL,
  `Picture8` varchar(255) DEFAULT NULL,
  `Picture9` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`GoodsNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goodsdes
-- ----------------------------
INSERT INTO `goodsdes` VALUES ('000001', '黑标脐橙果圆形至长圆形，橙黄色，果实硕大，果皮不易剥离。无苦味，中心柱充实；甜度高，汁味甜而香，加州阳光吻过的甜蜜脐橙，闻一闻浓郁橙香，咬上一口，鲜甜的果汁欢跳而出，充盈口中。', '橙子果实营养丰富，色香味兼优，既可鲜食，又可加工成以果汁为主的各种加工制品。且橙子中含量丰富的维生素C、P，能增加机体抵抗力，增加毛细血管的弹性，降低血中胆固醇。', '橙子被称为“疗疾佳<br>果”，含有丰富的维生素C、钙、磷', '<ul>\r\n							<li>英文名：orange</li>\r\n							<li>产地：中国</li>\r\n							<li>别称：金环、黄果</li>\r\n							<li>起源地：东南亚</li>\r\n						</ul>', '<ul>\r\n							<li>储藏：冷藏</li>\r\n							<li>作用：药用、食用</li>\r\n							<li>分布区域：甘肃、江西、陕西、湖南</li>\r\n							<li>口感：橙香味浓，脆嫩化渣</li>\r\n						</ul>', './images/orange.png', './images/orange1.png', './images/bgorange1.png', './images/bgorange3.png', './images/bgorange6.png', './images/bgorange2.png', './images/bgorange4.png', './images/bgorange5.png', './images/orange7.png');
INSERT INTO `goodsdes` VALUES ('000002', '山竹有一个小秘密，山竹的底部，有花瓣形状的蒂瓣，它的数量就等于果实内部肉瓣的数量。温馨提示下，山竹表皮有少数黄色斑点，是植物汁水形成的，属于正常现象。', '山竹属于热带果品中的珍品。支葵精选泰国山竹，果肉雪白，口感清甜柔滑，润而不腻，酸甜爽口，富含纤维素。在热带地区，山竹可谓家喻户晓，每个尝过的小伙伴都爱吃。', '山竹果肉雪白嫩软，<br>味清甜甘香，带微酸性凉，润滑可口', '<ul>\r\n							<li>英文名：Mangosteen</li>\r\n							<li>产地：马来西亚</li>\r\n							<li>别称：莽吉柿、倒捻子</li>\r\n							<li>起源地：马鲁古</li>\r\n						</ul>', '<ul>\r\n							<li>储藏：冷藏</li>\r\n							<li>作用：药用、食用</li>\r\n							<li>分布区域：中国台湾、福建、广东</li>\r\n							<li>食用：可生食或制果脯</li>\r\n						</ul>', './images/Mangosteen.png', './images/Mangosteen3.jpg', './images/bgMangosteen.png', './images/bgMangosteen1.png', './images/bgMangosteen4.png', './images/bgMangosteen3.png', './images/bgMangosteen2.png', './images/bgMangosteen5.png', './images/Mangosteen1.png');
INSERT INTO `goodsdes` VALUES ('000003', '红心柚，又称血柚，柚果呈球形、扁球形或梨形。果皮光滑，皮淡黄或橙色，果肉呈粉红色。汁胞呈红色，果汁丰富，味道酸甜，略带苦味，品质上等。红柚抗病性强，无裂果现象，耐运输。', '柚子中含有高血压患者必须的天然微量元素钾，不含钠，是患有心脑血管病及肾脏病患者最佳的食疗水果，并且柚子中有大量的维生素C，能降低血液中的胆固醇，新鲜的柚子肉中含有作用类似于胰岛素的成分，能降低血糖。', '泰国红心柚，乃泰国<br>柚子中的贵族。果肉呈浅粉色，软嫩多汁', '<ul>\r\n							<li>英文名：grapefruit</li>\r\n							<li>产地：泰国</li>\r\n							<li>水果种类: 柚子</li>\r\n							<li>起源地：南非</li>\r\n						</ul>', '<ul>\r\n							<li>储藏：冷藏</li>\r\n							<li>作用：药用、食用</li>\r\n							<li>分布区域：浙江丽水</li>\r\n							<li>食用：可生食或制果脯</li>\r\n						</ul>', './images/grapefruit.png', './images/redgrapefruit.png', './images/bgredgrapefruit.png', './images/bgredgrapefruit1.png', './images/bgredgrapefruit5.png', './images/bgredgrapefruit2.png', './images/bgredgrapefruit3.png', './images/bgredgrapefruit4.png', './images/grapefruit3.png');
INSERT INTO `goodsdes` VALUES ('000004', '鳄梨的果实是一种营养价值很高的水果，含多种维生素、丰富的脂肪酸', '', '鳄梨的果实是一种<br>营养价值很高的水果，含多种维生素、丰富的脂肪酸', '<ul>\r\n							<li>英文名：avocado</li>\r\n							<li>产地：泰国</li>\r\n							<li>别称：牛油果</li>\r\n							<li>起源地：南非</li>\r\n						</ul>', '<ul>\r\n							<li>储藏：冷藏</li>\r\n							<li>作用：药用、食用</li>\r\n							<li>分布区域：非洲热带</li>\r\n							<li>食用：可生食或制罐头</li>\r\n						</ul>', './images/avocado.png', '', '', '', '', '', '', '', './images/avocado1.png');
INSERT INTO `goodsdes` VALUES ('000005', '果形大，味甜，芳香；核果可煮食，富含淀粉；果实清甜可口，香味浓郁', '', '果形大，味甜，芳<br>香；核果可煮食，富含淀粉；果实清甜可口，香味浓郁', '<ul>\r\n							<li>英文名：jackfruit</li>\r\n							<li>产地：马来西亚</li>\r\n							<li>别称：蜜冬瓜、牛肚子果</li>\r\n							<li>起源地：东南亚</li>\r\n						</ul>', '<ul>\r\n							<li>储藏：冷藏</li>\r\n							<li>作用：药用、食用</li>\r\n							<li>分布区域：东南亚热带森林及河岸边</li>\r\n							<li>食用：可生食或制罐头</li>\r\n						</ul>', './images/jackfruit.png', '', '', '', '', '', '', '', './images/avocado.png');
INSERT INTO `goodsdes` VALUES ('000006', '杏子 是中国北方的主要栽培果树品种之一，以果实早熟、色泽鲜艳', '', '杏子 是中国北方的主<br>要栽培果树品种之一，以果实早熟、色泽鲜艳', '<ul>\r\n							<li>英文名：apricot</li>\r\n							<li>产地：马来西亚</li>\r\n							<li>花语：少女的慕情、娇羞、疑惑</li>\r\n							<li>起源地：中国</li>\r\n						</ul>', '<ul>\r\n							<li>储藏：冷藏</li>\r\n							<li>作用：药用、食用</li>\r\n							<li>分布区域：华北、西北和华东地区</li>\r\n							<li>食用：可生食或制罐头</li>\r\n						</ul>', './images/apricot.png', '', '', '', '', '', '', '', './images/apricot2.png');
INSERT INTO `goodsdes` VALUES ('000007', '海南贵妃芒果外表美艳无比，果皮青里透红，成熟可以做成各种水果拼盘', '', '海南贵妃芒果外表美<br>艳无比，果皮青里透红，成熟', '<ul>\r\n							<li>英文名：Royalawn</li>\r\n							<li>产地：马来西亚</li>\r\n							<li>别称：红金龙</li>\r\n							<li>起源地：海南</li>\r\n						</ul>', '<ul>\r\n							<li>储藏：冷藏</li>\r\n							<li>作用：药用、食用</li>\r\n							<li>分布区域：海南</li>\r\n							<li>颜色：未成熟果紫红色，成熟后底色深黄</li>\r\n						</ul>', './images/Royalawn.png', '', '', '', '', '', '', '', './images/Royalawn.png');
INSERT INTO `goodsdes` VALUES ('000008', '黑布林香、甜、肉鲜<br>软，新鲜浆果类的水果吃起来会感觉非常爽口。', '', '黑布林香、甜、肉鲜<br>软，新鲜浆果类的水果吃起来会感觉非常爽口。可以做成各种水果拼盘，甜点，果酱。', '<ul>\r\n							<li>英文名：Royalawn</li>\r\n							<li>产地：越南</li>\r\n							<li>别称：黑李子、黑布朗</li>\r\n							<li>起源地：美国</li>\r\n<ul>\r\n							<li>英文名：blackbrin</li>\r\n							<li>产地：越南</li>\r\n							<li>别称：黑李子、黑布朗</li>\r\n							<li>起源地：美国</li>\r\n						</ul>', '<ul>\r\n							<li>储藏：冷藏</li>\r\n							<li>作用：药用、食用</li>\r\n							<li>分布区域：美国居多</li>\r\n							<li>口感：香、甜、肉鲜软</li>\r\n						</ul>', './images/blackbrin.png', '', '', '', '', '', '', '', './images/blackbrin.png');
INSERT INTO `goodsdes` VALUES ('000009', '被誉为“水果之王”的猕猴桃，酸甜可口，营养丰富，适合老年人、儿童、体弱多病者', '', '被誉为“水果之王”的猕猴桃，酸甜可口，营养丰富，是老年人、儿童、体弱多病者的滋补果品。', '<ul>\r\n							<li>英文名：kiwifruit</li>\r\n							<li>产地：中国</li>\r\n							<li>别称：奇异果</li>\r\n							<li>起源地：湖南省湘西地区</li>\r\n						</ul>', '<ul>\r\n							<li>储藏：冷藏</li>\r\n							<li>作用：药用、食用</li>\r\n							<li>分布区域：秦岭北麓的陕西</li>\r\n							<li>口感：质地柔软，口感酸甜。</li>\r\n						</ul>', '', '', '', '', '', '', '', '', './images/kiwifruit1.png');
INSERT INTO `goodsdes` VALUES ('000010', '荔枝营养丰富，含葡萄糖、蔗糖、蛋白质、脂肪以及维生素A、B、C等，并含叶酸、精氨酸、色氨酸等各种营养素，对人体健康十分有益', '', '荔枝营养丰富，含葡萄糖、蔗糖、蛋白质、脂肪以及维生素A、B、C等，并含叶酸、精氨酸、色氨酸等各种营养素，对人体健康十分有益', '<ul>\r\n							<li>英文名：litchi</li>\r\n							<li>产地：中国</li>\r\n							<li>别称：离枝</li>\r\n							<li>起源地：中国</li>\r\n						</ul>', '<ul>\r\n							<li>储藏：冷藏</li>\r\n							<li>作用：药用、食用</li>\r\n							<li>分布区域：亚洲东南部、非洲、美洲、大洋洲</li>\r\n							<li>口感：味甘、酸、性温。</li>\r\n						</ul>', '', '', '', '', '', '', '', '', './images/litchi.png');
INSERT INTO `goodsdes` VALUES ('000011', '杨梅既可直接食用，又可加工成杨梅干、酱、蜜饯等，还可酿酒，有止渴、生津、助消化等功能。', '', '杨梅既可直接食用，又可加工成杨梅干、酱、蜜饯等，还可酿酒，有止渴、生津、助消化等功能。', '<ul>\r\n							<li>英文名：waxberry</li>\r\n							<li>产地：中国</li>\r\n							<li>别称：圣生梅、白蒂梅、树梅</li>\r\n							<li>起源地：浙江余姚</li>\r\n						</ul>', '<ul>\r\n							<li>储藏：冷藏</li>\r\n							<li>作用：药用、食用</li>\r\n							<li>分布区域：中国华东和湖南、广东、广西、贵州等地</li>\r\n							<li>食用：生食，可加工成杨梅干、酱、蜜饯。</li>\r\n						</ul>', '', '', '', '', '', '', '', '', './images/waxberry.png');
INSERT INTO `goodsdes` VALUES ('000012', '柚子含有非常丰富的营养价值，它里面含有大量的营养元素，其中包括身体所需的蛋白质和有机酸，', '', '柚子含有非常丰富的营养价值，它里面含有大量的营养元素，其中包括身体所需的蛋白质和有机酸，它里面还含有多种维生素和钙磷镁钠等身体所必需的微量元素。', '<ul>\r\n							<li>英文名：grapefruit</li>\r\n							<li>产地：中国</li>\r\n							<li>别称：柚、文旦、香栾、朱栾、内紫</li>\r\n							<li>起源地：中国</li>\r\n						</ul>', '<ul>\r\n							<li>储藏：冷藏</li>\r\n							<li>作用：药用、食用</li>\r\n							<li>分布区域：中国长江以南及东南亚</li>\r\n							<li>功效：有消食、解酒毒功效。</li>\r\n						</ul>', '', '', '', '', '', '', '', '', './images/grapefruit1.png');
INSERT INTO `goodsdes` VALUES ('000013', '红毛丹以呆皮表面柔毛红中带绿的果实品质最佳。选购时应挑软刺细长新鲜，果体外表无黑斑', '', '红毛丹以呆皮表面柔毛红中带绿的果实品质最佳。选购时应挑软刺细长新鲜，果体外表无黑斑、果粒大且匀称，皮薄而肉厚者便是上品。', '<ul>\r\n							<li>英文名：NepheliumlappaceumL</li>\r\n							<li>产地：马来西亚</li>\r\n							<li>别称：毛荔枝，韶子，红毛果</li>\r\n							<li>起源地：亚洲热带</li>\r\n						</ul>', '<ul>\r\n							<li>储藏：冷藏</li>\r\n							<li>作用：药用、食用</li>\r\n							<li>分布区域：中国广东和台湾</li>\r\n							<li>味道：红毛丹的味道类似于荔枝。</li>\r\n						</ul>', '', '', '', '', '', '', '', '', './images/NepheliumlappaceumL.png');
INSERT INTO `goodsdes` VALUES ('000014', '莲雾的果实中含有蛋白质、脂肪、碳水化合物及钙、磷、钾等矿物质，适合治清热利尿和安神，对咳嗽、哮喘也有效果', '', '木瓜鲜美兼具食疗作用，尤其对女性更有美容功效。木瓜所含的蛋白分解酵素，可以补偿胰和肠道的分泌，补充胃液的不足，有助于分解蛋白质和淀粉。', '<ul>\r\n							<li>英文名：pawpaw</li>\r\n							<li>产地：马来西亚</li>\r\n							<li>别称：番木瓜</li>\r\n							<li>起源地：南美洲</li>\r\n						</ul>', '<ul>\r\n							<li>储藏：冷藏</li>\r\n							<li>作用：药用、食用</li>\r\n							<li>分布区域：山东、陕西、河南（桐柏）、湖北、江西</li>\r\n							<li>食用：果实味涩，水煮或浸渍糖液中供食用。</li>\r\n						</ul>', '', '', '', '', '', '', '', '', './images/pawpaw.png');
INSERT INTO `goodsdes` VALUES ('000015', '莲雾的果实中含有蛋白质、脂肪、碳水化合物及钙、磷、钾等矿物质，适合治清热利尿和安神，对咳嗽、哮喘也有效果。', '', '莲雾的果实中含有蛋白质、脂肪、碳水化合物及钙、磷、钾等矿物质，适合治清热利尿和安神，对咳嗽、哮喘也有效果。中国台湾、福建，广东及广西有栽培，果实可供食用。', '<ul>\r\n							<li>英文名：WaxApple</li>\r\n							<li>产地：马来西亚</li>\r\n							<li>别称：水石榴、天桃、辇雾</li>\r\n							<li>起源地：马来半岛</li>\r\n						</ul>', '<ul>\r\n							<li>储藏：冷藏</li>\r\n							<li>作用：药用、食用</li>\r\n							<li>分布区域：马来半岛，台湾、广东</li>\r\n							<li>口感：果肉呈海绵质，略有苹果香味。</li>\r\n						</ul>', '', '', '', '', '', '', '', '', './images/WaxApple.png');
INSERT INTO `goodsdes` VALUES ('000016', '龙眼含丰富的葡萄糖、蔗糖和蛋白质等，含铁量也比较高，可在提高热能、补充营养的同时促进血红蛋白再生', '', '龙眼含丰富的葡萄糖、蔗糖和蛋白质等，含铁量也比较高，可在提高热能、补充营养的同时促进血红蛋白再生，从而达到补血的效果。', '<ul>\r\n							<li>英文名：longan</li>\r\n							<li>产地：泰国</li>\r\n							<li>别称：桂圆</li>\r\n							<li>起源地：泰国</li>\r\n						</ul>', '<ul>\r\n							<li>储藏：冷藏</li>\r\n							<li>作用：药用、食用</li>\r\n							<li>分布区域：中国的西南部至东南部</li>\r\n							<li>营养：丰富的葡萄糖、蔗糖和蛋白质等。</li>\r\n						</ul>', '', '', '', '', '', '', '', '', './images/longan.png');
INSERT INTO `goodsdes` VALUES ('000017', '人参果果肉清香多汁，腹内无核，风味独特，具有高蛋白、低脂肪、低糖等特点，同时富含蛋白质', '', '人参果果肉清香多汁，腹内无核，风味独特，具有高蛋白、低脂肪、低糖等特点，同时富含蛋白质、氨基酸以及微量元素、维生素与矿物元素，具有保健功效。', '<ul>\r\n							<li>英文名：monorchidherminiumherb</li>\r\n							<li>产地：泰国</li>\r\n							<li>别称：长寿果</li>\r\n							<li>起源地：美洲</li>\r\n						</ul>', '<ul>\r\n							<li>储藏：冷藏</li>\r\n							<li>作用：药用、食用</li>\r\n							<li>分布区域：甘肃、四川、云南、江苏、湖北</li>\r\n							<li>口感：果肉清香多汁，腹内无核。</li>\r\n						</ul>', '', '', '', '', '', '', '', '', './images/monorchidherminiumherb.png');
INSERT INTO `goodsdes` VALUES ('000018', '泰国白蜜柚原产泰国曼谷附近低地一带，外型呈短球形，果肉淡黄，果心小，肉质较白柚柔软多汁', '', '泰国白蜜柚原产泰国曼谷附近低地一带，外型呈短球形，果肉淡黄，果心小，肉质较白柚柔软多汁，糖度高、酸味低，故又称之‘蜜柚’。', '<ul>\r\n							<li>英文名：Whitepomelo</li>\r\n							<li>产地：泰国</li>\r\n							<li>特征：果肉淡黄，果心小</li>\r\n							<li>起源地：泰国曼谷</li>\r\n						</ul>', '<ul>\r\n							<li>储藏：冷藏</li>\r\n							<li>作用：药用、食用</li>\r\n							<li>分布区域：泰国</li>\r\n							<li>作用：能降低血液中的胆固醇。</li>\r\n						</ul>', '', '', '', '', '', '', '', '', './images/Whitepomelo.png');
INSERT INTO `goodsdes` VALUES ('000019', '龙公果外形似微型马铃薯，果肉似微型山竹，气味与龙眼相似剥皮即食，果肉浊白，味道醇美，', '', '龙公果外形似微型马铃薯，果肉似微型山竹，气味与龙眼相似剥皮即食，果肉浊白，味道醇美，甜中微酸，口感有点像荔枝，但果肉更有质感一些，水分更多，酸甜可口，据说是泰国王妃最爱的水果。', '<ul>\r\n							<li>英文名：Dragonfruit</li>\r\n							<li>产地：泰国</li>\r\n							<li>别称：龙宫果、香果、佛头果</li>\r\n							<li>起源地：泰国</li>\r\n						</ul>', '<ul>\r\n							<li>储藏：冷藏</li>\r\n							<li>作用：药用、食用</li>\r\n							<li>分布区域：在泰国南部湿热地区</li>\r\n							<li>口感：味道醇美，甜中微酸。</li>\r\n						</ul>', '', '', '', '', '', '', '', '', './images/Dragonfruit.png');
INSERT INTO `goodsdes` VALUES ('000020', '火龙果营养丰富、功能独特，它含有一般植物少有的植物性白蛋白以及花青素，丰富的维生素和水溶性膳食纤维。', '', '火龙果营养丰富、功能独特，它含有一般植物少有的植物性白蛋白以及花青素，丰富的维生素和水溶性膳食纤维。火龙果属于凉性水果，在自然状态下，果实于夏秋成熟，味甜，多汁。', '<ul>\r\n							<li>英文名：Pitayafruit</li>\r\n							<li>产地：越南</li>\r\n							<li>别称：龙珠果、仙蜜果、玉龙果</li>\r\n							<li>起源地：热带</li>\r\n						</ul>', '<ul>\r\n							<li>储藏：冷藏</li>\r\n							<li>作用：药用、食用</li>\r\n							<li>分布区域：热带、亚热带地区</li>\r\n							<li>口感：味甜，多汁。</li>\r\n						</ul>', '', '', '', '', '', '', '', '', './images/Pitayafruit.png');
INSERT INTO `goodsdes` VALUES ('000021', '蛇果果肉黄白色，肉质脆，质中粗，较脆，果汁多，味甜，可溶性固形物14%，有浓郁的芳香，品质上等。', '', '蛇果果肉黄白色，肉质脆，质中粗，较脆，果汁多，味甜，可溶性固形物14%，有浓郁的芳香，品质上等。具有生津开胃，消痰止咳，退热解毒，补脑养血，安眠养神，润肺悦心，和脾益气，润肠止泻，帮助消化等功效。', '<ul>\r\n							<li>英文名：reddelicious</li>\r\n							<li>产地：越南</li>\r\n							<li>别称：龙珠果、仙蜜果、玉龙果</li>\r\n							<li>起源地：美国的加利福尼亚州</li>\r\n						</ul>', '<ul>\r\n							<li>储藏：冷藏</li>\r\n							<li>作用：药用、食用</li>\r\n							<li>分布区域：甘肃天水高海拔山区</li>\r\n							<li>口感：较脆，果汁多，味甜。</li>\r\n						</ul>', '', '', '', '', '', '', '', '', './images/reddelicious.png');
INSERT INTO `goodsdes` VALUES ('000022', '青柠-保健作用青柠具有强酸性，被认为是治疗疾病的良药。止咳、化痰、生津健脾', '', '青柠-保健作用青柠具有强酸性，被认为是治疗疾病的良药。止咳、化痰、生津健脾，且对于人体的血液循环及钙质吸收均能起到促进作用。', '<ul>\r\n							<li>英文名：lime</li>\r\n							<li>产地：越南</li>\r\n							<li>别称：来檬、绿檬</li>\r\n							<li>起源地：亚热带与热带地区</li>\r\n						</ul>', '<ul>\r\n							<li>储藏：冷藏</li>\r\n							<li>作用：药用、食用</li>\r\n							<li>分布区域：印度、阿根廷、巴西与西班牙</li>\r\n							<li>特征：淡黄绿色的球形、椭球形或倒卵形。</li>\r\n						</ul>', '', '', '', '', '', '', '', '', './images/lime.png');
INSERT INTO `goodsdes` VALUES ('000023', '百香果可直接鲜食，将百香果剖开，用调羹挖出瓤包直接食用，籽可食用，富含高级蛋白，高级脂肪。', '', '百香果可直接鲜食，将百香果剖开，用调羹挖出瓤包直接食用，籽可食用，富含高级蛋白，高级脂肪。', '<ul>\r\n							<li>英文名：Passionfruit</li>\r\n							<li>产地：越南</li>\r\n							<li>别称：鸡蛋果</li>\r\n							<li>起源地：安的列斯群岛</li>\r\n						</ul>', '<ul>\r\n							<li>储藏：冷藏</li>\r\n							<li>作用：药用、食用</li>\r\n							<li>分布区域：热带和亚热带地区</li>\r\n							<li>特征：基部淡绿色，中部紫色，顶部白色。</li>\r\n						</ul>', '', '', '', '', '', '', '', '', './images/Passionfruit.png');

-- ----------------------------
-- Table structure for `list`
-- ----------------------------
DROP TABLE IF EXISTS `list`;
CREATE TABLE `list` (
  `ListNO` int(20) NOT NULL DEFAULT '0',
  `TotalPrice` float(5,0) NOT NULL DEFAULT '0',
  `ListTime` date DEFAULT NULL,
  `PaidTime` date DEFAULT NULL,
  `ReceviedTime` date DEFAULT NULL,
  `FinishedTime` date DEFAULT NULL,
  `ListState` varchar(20) DEFAULT NULL,
  `UserNO` varchar(20) NOT NULL,
  `Operation` char(4) DEFAULT '支出',
  PRIMARY KEY (`ListNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of list
-- ----------------------------
INSERT INTO `list` VALUES ('1000011', '2', '2017-04-07', '2017-04-07', '2017-04-08', '2017-04-08', '已完成', '1', '支出');
INSERT INTO `list` VALUES ('1000012', '15', '2017-04-08', '2017-04-08', '2017-04-15', '2017-04-16', '已完成', '1', '支出');
INSERT INTO `list` VALUES ('1000014', '14', '2017-05-05', '2017-05-05', '2017-05-07', '2017-05-08', '已完成', '1', '支出');
INSERT INTO `list` VALUES ('1000015', '4', '2017-05-07', '2017-05-07', '2017-05-09', '2017-05-09', '已完成', '1', '支出');
INSERT INTO `list` VALUES ('1000016', '3', '2017-05-08', '2017-05-07', '2017-05-08', '2017-06-27', '已完成', '1', '支出');
INSERT INTO `list` VALUES ('1000017', '9', '2017-05-10', '2017-05-10', '2017-05-11', '2017-05-11', '已完成', '1', '支出');
INSERT INTO `list` VALUES ('1000018', '2', '2017-05-12', '2017-05-12', '2017-05-14', '2017-05-15', '已完成', '1', '支出');
INSERT INTO `list` VALUES ('1000019', '6', '2017-05-16', '2017-05-16', '2017-05-17', '2017-05-17', '已完成', '1', '支出');
INSERT INTO `list` VALUES ('1000020', '2', '2017-05-17', '2017-05-17', '2017-05-19', '2017-05-20', '已完成', '1', '支出');
INSERT INTO `list` VALUES ('1000021', '12', '2017-05-19', '2017-05-19', '2017-05-23', '0000-00-00', '待评价', '1', '支出');
INSERT INTO `list` VALUES ('1000022', '13', '2017-05-21', '2017-05-21', '2017-05-24', '0000-00-00', '待评价', '1', '支出');
INSERT INTO `list` VALUES ('1000023', '12', '2017-05-23', '2017-05-23', '2017-05-25', '0000-00-00', '待评价', '1', '支出');
INSERT INTO `list` VALUES ('1000024', '17', '2017-06-02', '2017-06-02', '2017-06-03', '0000-00-00', '待评价', '1', '支出');
INSERT INTO `list` VALUES ('1000025', '18', '2017-06-04', '2017-06-04', '2017-06-06', '0000-00-00', '待评价', '1', '支出');
INSERT INTO `list` VALUES ('1000026', '13', '2017-06-08', '2017-06-08', '2017-06-09', '0000-00-00', '待评价', '1', '支出');
INSERT INTO `list` VALUES ('1000027', '34', '2017-06-10', '2017-06-10', '2017-06-11', '0000-00-00', '待评价', '1', '支出');
INSERT INTO `list` VALUES ('1000028', '12', '2017-06-12', '2016-06-12', '0000-00-00', '0000-00-00', '待收货', '1', '支出');
INSERT INTO `list` VALUES ('1000029', '20', '2017-06-13', '2017-06-13', '0000-00-00', '0000-00-00', '待收货', '1', '支出');
INSERT INTO `list` VALUES ('1000030', '14', '2017-06-15', '2017-06-15', '2017-06-25', '2017-06-27', '已完成', '1', '支出');

-- ----------------------------
-- Table structure for `listinf`
-- ----------------------------
DROP TABLE IF EXISTS `listinf`;
CREATE TABLE `listinf` (
  `ListNO` int(20) NOT NULL DEFAULT '0',
  `GoodsNO` varchar(20) NOT NULL,
  `GoodsNum` int(5) NOT NULL,
  PRIMARY KEY (`ListNO`,`GoodsNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of listinf
-- ----------------------------
INSERT INTO `listinf` VALUES ('1000011', '000001', '2');
INSERT INTO `listinf` VALUES ('1000011', '000002', '1');
INSERT INTO `listinf` VALUES ('1000012', '000001', '3');
INSERT INTO `listinf` VALUES ('1000012', '000003', '1');
INSERT INTO `listinf` VALUES ('1000014', '000001', '3');
INSERT INTO `listinf` VALUES ('1000014', '000013', '1');
INSERT INTO `listinf` VALUES ('1000014', '000015', '2');
INSERT INTO `listinf` VALUES ('1000015', '000001', '3');
INSERT INTO `listinf` VALUES ('1000016', '000004', '2');
INSERT INTO `listinf` VALUES ('1000017', '000001', '1');
INSERT INTO `listinf` VALUES ('1000018', '000009', '4');
INSERT INTO `listinf` VALUES ('1000019', '000003', '2');
INSERT INTO `listinf` VALUES ('1000020', '000002', '1');
INSERT INTO `listinf` VALUES ('1000020', '000007', '3');
INSERT INTO `listinf` VALUES ('1000021', '000005', '2');
INSERT INTO `listinf` VALUES ('1000022', '000007', '2');
INSERT INTO `listinf` VALUES ('1000023', '000020', '1');
INSERT INTO `listinf` VALUES ('1000024', '000003', '3');
INSERT INTO `listinf` VALUES ('1000025', '000014', '7');
INSERT INTO `listinf` VALUES ('1000026', '000016', '1');
INSERT INTO `listinf` VALUES ('1000027', '000004', '1');
INSERT INTO `listinf` VALUES ('1000028', '000018', '1');
INSERT INTO `listinf` VALUES ('1000029', '000007', '2');
INSERT INTO `listinf` VALUES ('1000030', '000001', '2');
INSERT INTO `listinf` VALUES ('1000030', '000003', '1');
INSERT INTO `listinf` VALUES ('1000030', '000005', '3');
INSERT INTO `listinf` VALUES ('1000030', '000007', '3');
INSERT INTO `listinf` VALUES ('1000030', '000018', '3');

-- ----------------------------
-- Table structure for `recharge`
-- ----------------------------
DROP TABLE IF EXISTS `recharge`;
CREATE TABLE `recharge` (
  `RechargeNo` varchar(20) NOT NULL,
  `UserNO` varchar(20) NOT NULL,
  `RechargeAmount` decimal(11,0) DEFAULT NULL,
  `Time` datetime(6) NOT NULL,
  `Operation` char(4) NOT NULL DEFAULT '充值',
  PRIMARY KEY (`RechargeNo`),
  KEY `RechargeUserNO` (`UserNO`),
  CONSTRAINT `RechargeUserNO` FOREIGN KEY (`UserNO`) REFERENCES `account` (`UserNO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recharge
-- ----------------------------
INSERT INTO `recharge` VALUES ('1', '2', '23', '2017-06-01 15:22:41.000000', '充值');
INSERT INTO `recharge` VALUES ('10', '2', '3', '2017-06-24 22:16:37.000000', '充值');
INSERT INTO `recharge` VALUES ('11', '1', '30', '2017-06-27 23:42:36.000000', '充值');
INSERT INTO `recharge` VALUES ('12', '1', '30', '2017-06-27 23:42:47.000000', '充值');
INSERT INTO `recharge` VALUES ('13', '1', '30', '2017-06-27 23:43:16.000000', '充值');
INSERT INTO `recharge` VALUES ('14', '1', '1', '2017-06-27 23:47:30.000000', '充值');
INSERT INTO `recharge` VALUES ('15', '1', '1', '2017-06-27 23:52:36.000000', '充值');
INSERT INTO `recharge` VALUES ('16', '1', '3', '2017-06-27 23:52:48.000000', '充值');
INSERT INTO `recharge` VALUES ('17', '1', '1', '2017-06-29 11:35:01.000000', '充值');
INSERT INTO `recharge` VALUES ('18', '1', '1', '2017-06-29 11:35:04.000000', '充值');
INSERT INTO `recharge` VALUES ('19', '1', '10', '2017-06-29 11:36:29.000000', '充值');
INSERT INTO `recharge` VALUES ('2', '1', '344', '2017-06-05 15:23:05.000000', '充值');
INSERT INTO `recharge` VALUES ('20', '1', '12', '2017-06-29 11:36:33.000000', '充值');
INSERT INTO `recharge` VALUES ('21', '1', '40', '2017-06-29 11:36:40.000000', '充值');
INSERT INTO `recharge` VALUES ('22', '1', '1', '2017-06-29 11:37:12.000000', '充值');
INSERT INTO `recharge` VALUES ('3', '2', '33', '2017-06-02 15:23:29.000000', '充值');
INSERT INTO `recharge` VALUES ('4', '2', '2', '2017-06-19 12:12:09.000000', '充值');
INSERT INTO `recharge` VALUES ('5', '2', '0', '2017-06-19 20:15:40.000000', '充值');
INSERT INTO `recharge` VALUES ('6', '2', '0', '2017-06-19 20:16:31.000000', '充值');
INSERT INTO `recharge` VALUES ('7', '2', '0', '2017-06-19 20:18:10.000000', '充值');
INSERT INTO `recharge` VALUES ('8', '2', '0', '2017-06-19 22:51:08.000000', '充值');
INSERT INTO `recharge` VALUES ('9', '2', '0', '2017-06-19 23:52:53.000000', '充值');

-- ----------------------------
-- Table structure for `sheet1`
-- ----------------------------
DROP TABLE IF EXISTS `sheet1`;
CREATE TABLE `sheet1` (
  `ListNO` varchar(255) DEFAULT NULL,
  `GoodsNO` varchar(255) DEFAULT NULL,
  `GoodsNum` varchar(255) DEFAULT NULL,
  `TotalPrice` varchar(255) DEFAULT NULL,
  `ListTime` date DEFAULT NULL,
  `PaidTime` varchar(255) DEFAULT NULL,
  `ReceviedTime` varchar(255) DEFAULT NULL,
  `FinishedTime` varchar(255) DEFAULT NULL,
  `ListState` varchar(255) DEFAULT NULL,
  `UserNO` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sheet1
-- ----------------------------
INSERT INTO `sheet1` VALUES ('ListNO', 'GoodsNO', 'GoodsNum', 'TotalPrice', '0000-00-00', 'PaidTime', 'ReceviedTime', 'FinishedTime', 'ListState', 'UserNO');
INSERT INTO `sheet1` VALUES ('1000011', '000001', '2', '2.00', '0000-00-00', '4/7/2017', '4/8/2017', '4/8/2017', '已完成', '1');
INSERT INTO `sheet1` VALUES ('1000012', '000003', '5', '15.00', '0000-00-00', '4/13/2017', '4/15/2017', '4/16/2017', '已完成', '1');
INSERT INTO `sheet1` VALUES ('1000013', '000006', '1', '6.00', '0000-00-00', '4/15/2017', '4/18/2017', '4/18/2017', '已完成', '2');
INSERT INTO `sheet1` VALUES ('1000014', '000007', '2', '14.00', '0000-00-00', '5/6/2017', '5/7/2017', '5/8/2017', '已完成', '3');
INSERT INTO `sheet1` VALUES ('1000015', '000004', '1', '4.00', '0000-00-00', '5/7/2017', '5/9/2017', '5/9/2017', '已完成', '3');
INSERT INTO `sheet1` VALUES ('1000016', '000003', '1', '3.00', '0000-00-00', '5/7/2017', '5/10/2017', '5/10/2017', '已完成', '3');
INSERT INTO `sheet1` VALUES ('1000017', '000009', '1', '9.00', '0000-00-00', '5/10/2017', '5/11/2017', '5/11/2017', '已完成', '4');
INSERT INTO `sheet1` VALUES ('1000018', '000002', '1', '2.00', '0000-00-00', '5/12/2017', '5/14/2017', '5/15/2017', '已完成', '3');
INSERT INTO `sheet1` VALUES ('1000019', '000006', '1', '6.00', '0000-00-00', '5/16/2017', '5/17/2017', '5/17/2017', '已完成', '1');
INSERT INTO `sheet1` VALUES ('1000020', '000001', '2', '2.00', '0000-00-00', '5/17/2017', '5/19/2017', '5/20/2017', '已完成', '1');
INSERT INTO `sheet1` VALUES ('1000021', '000012', '1', '12.00', '0000-00-00', '5/19/2017', '5/20/2017', '5/21/2017', '已完成', '4');
INSERT INTO `sheet1` VALUES ('1000022', '000013', '1', '13.00', '0000-00-00', '5/21/2017', '5/23/2017', '5/23/2017', '已完成', '2');
INSERT INTO `sheet1` VALUES ('1000023', '000012', '1', '12.00', '0000-00-00', '5/23/2017', '5/24/2017', '5/25/2017', '已完成', '2');
INSERT INTO `sheet1` VALUES ('1000024', '000017', '1', '17.00', '0000-00-00', '6/2/2017', '6/3/2017', '6/3/2017', '已完成', '2');
INSERT INTO `sheet1` VALUES ('1000025', '000018', '1', '18.00', '0000-00-00', '6/4/2017', '6/6/2017', '6/6/2017', '已完成', '2');
INSERT INTO `sheet1` VALUES ('1000026', '000019', '3', '57.00', '0000-00-00', '6/6/2017', '6/8/2017', '6/9/2017', '已完成', '2');
INSERT INTO `sheet1` VALUES ('1000027', '000015', '1', '15.00', '0000-00-00', '6/11/2017', '6/12/2017', '6/14/2017', '已完成', '4');
INSERT INTO `sheet1` VALUES ('1000028', '000012', '1', '12.00', '0000-00-00', '6/12/2017', '6/15/2017', '', '待评价', '3');
INSERT INTO `sheet1` VALUES ('1000029', '000020', '1', '20.00', '0000-00-00', '6/13/2017', '6/16/2017', '', '待评价', '1');
INSERT INTO `sheet1` VALUES ('1000030', '000014', '1', '14.00', '0000-00-00', '6/15/2017', '0/0/0000', '', '待收货', '3');

-- ----------------------------
-- Table structure for `shoppingcart`
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcart`;
CREATE TABLE `shoppingcart` (
  `UserNO` varchar(20) NOT NULL,
  `GoodsNO` varchar(20) NOT NULL,
  `Number` int(11) DEFAULT NULL,
  `LastSaveTime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`UserNO`,`GoodsNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoppingcart
-- ----------------------------
INSERT INTO `shoppingcart` VALUES ('1', '000001', '3', '2017-06-27 23:41:02');
INSERT INTO `shoppingcart` VALUES ('1', '000021', '1', '2017-06-27 23:54:02');
INSERT INTO `shoppingcart` VALUES ('1', '000023', '2', '2017-06-27 23:35:11');
INSERT INTO `shoppingcart` VALUES ('2', '000021', '1', '2017-06-27 23:35:11');

-- ----------------------------
-- Table structure for `withdrawals`
-- ----------------------------
DROP TABLE IF EXISTS `withdrawals`;
CREATE TABLE `withdrawals` (
  `WithdrawalsNo` varchar(20) NOT NULL,
  `UserNO` varchar(20) NOT NULL,
  `WithdrawalsAmount` decimal(11,0) DEFAULT '0',
  `Time` datetime(6) NOT NULL,
  `Operation` char(4) NOT NULL DEFAULT '提现',
  PRIMARY KEY (`WithdrawalsNo`),
  KEY `UserNO` (`UserNO`),
  CONSTRAINT `UserNO` FOREIGN KEY (`UserNO`) REFERENCES `account` (`UserNO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of withdrawals
-- ----------------------------
INSERT INTO `withdrawals` VALUES ('1', '1', '23', '2017-06-01 13:43:58.000000', '提现');
INSERT INTO `withdrawals` VALUES ('10', '1', '0', '2017-06-29 11:35:33.000000', '提现');
INSERT INTO `withdrawals` VALUES ('11', '1', '2', '2017-06-29 11:36:13.000000', '提现');
INSERT INTO `withdrawals` VALUES ('12', '1', '30', '2017-06-29 11:37:07.000000', '提现');
INSERT INTO `withdrawals` VALUES ('13', '1', '5', '2017-06-29 11:45:21.000000', '提现');
INSERT INTO `withdrawals` VALUES ('2', '2', '34', '2017-05-08 13:44:30.000000', '提现');
INSERT INTO `withdrawals` VALUES ('3', '2', '2', '2017-06-13 13:45:57.000000', '提现');
INSERT INTO `withdrawals` VALUES ('4', '2', '1', '2017-06-14 13:46:56.000000', '提现');
INSERT INTO `withdrawals` VALUES ('5', '2', '0', '2017-06-20 01:23:11.000000', '提现');
INSERT INTO `withdrawals` VALUES ('6', '2', '5', '2017-06-20 01:25:24.000000', '提现');
INSERT INTO `withdrawals` VALUES ('7', '2', '3', '2017-06-24 22:17:10.000000', '提现');
INSERT INTO `withdrawals` VALUES ('8', '2', '3', '2017-06-24 22:18:52.000000', '提现');
INSERT INTO `withdrawals` VALUES ('9', '1', '2', '2017-06-27 23:53:28.000000', '提现');

-- ----------------------------
-- View structure for `balancerecord`
-- ----------------------------
DROP VIEW IF EXISTS `balancerecord`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `balancerecord` AS select `withdrawals`.`Time` AS `Time`,`withdrawals`.`WithdrawalsAmount` AS `Amount`,`withdrawals`.`Operation` AS `Operation`,`withdrawals`.`UserNO` AS `UserNO` from `withdrawals` union select `recharge`.`Time` AS `Time`,`recharge`.`RechargeAmount` AS `Amount`,`recharge`.`Operation` AS `Operation`,`recharge`.`UserNO` AS `UserNO` from `recharge` union select `list`.`PaidTime` AS `Time`,`list`.`TotalPrice` AS `Amount`,`list`.`Operation` AS `Operation`,`list`.`UserNO` AS `UserNO` from `list` order by `Time` ;

-- ----------------------------
-- View structure for `showgoods`
-- ----------------------------
DROP VIEW IF EXISTS `showgoods`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `showgoods` AS select `goods`.`GoodsNO` AS `GoodsNO`,`goods`.`GoodsName` AS `GoodsName`,`goods`.`Thermal` AS `Thermal`,`goods`.`Soursweet` AS `Soursweet`,`goods`.`Area` AS `Area`,`goods`.`Newest` AS `Newest`,`goods`.`hottest` AS `hottest`,`goods`.`OnTime` AS `OnTime`,`goods`.`Stock` AS `Stock`,`goods`.`GoodsWeight` AS `GoodsWeight`,`goods`.`GoodsPrice` AS `GoodsPrice`,`goodsdes`.`Picture9` AS `Picture9`,`goodsdes`.`Des1` AS `Des1` from (`goods` join `goodsdes`) where (`goods`.`GoodsNO` = `goodsdes`.`GoodsNO`) ;

-- ----------------------------
-- View structure for `showlist`
-- ----------------------------
DROP VIEW IF EXISTS `showlist`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `showlist` AS select `list`.`ListNO` AS `ListNO`,`goods`.`GoodsName` AS `GoodsName`,`listinf`.`GoodsNum` AS `GoodsNum`,`goods`.`GoodsPrice` AS `GoodsPrice`,`list`.`TotalPrice` AS `TotalPrice`,`list`.`ListTime` AS `ListTime`,`account`.`LoginAccount` AS `LoginAccount` from (((`list` join `listinf`) join `goods`) join `account`) where ((`list`.`ListNO` = `listinf`.`ListNO`) and (`goods`.`GoodsNO` = `listinf`.`GoodsNO`) and (`list`.`UserNO` = `account`.`UserNO`)) ;
