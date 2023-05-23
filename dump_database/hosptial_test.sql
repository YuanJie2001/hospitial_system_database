-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hospital_information
-- ------------------------------------------------------
-- Server version	8.0.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `charge`
--

DROP TABLE IF EXISTS `charge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `charge` (
  `toll_id` varchar(10) COLLATE utf NOT NULL COMMENT '收费员编号',
  `t_name` varchar(10) COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收费员姓名',
  `patient_id` varchar(20) COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '病人编号',
  `drug_id` varchar(10) COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '药品编号',
  `drug_quantity` int unsigned NOT NULL COMMENT '药品数量',
  `amount` decimal(10,0) NOT NULL COMMENT '金额',
  `is_delete` tinyint NOT NULL DEFAULT '0' COMMENT '0为未删除 1为已删除',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建字段的时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改字段的时间',
  PRIMARY KEY (`toll_id`,`patient_id`,`drug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `charge`
--

LOCK TABLES `charge` WRITE;
/*!40000 ALTER TABLE `charge` DISABLE KEYS */;
INSERT INTO `charge` VALUES ('101','收费员1','411282xxxxxxxx5555','100023',2,80,0,'2021-12-10 19:47:15','2021-12-10 19:47:15'),('101','收费员1','421282xxxxxxxx5554','1000233',1,20,0,'2021-12-10 19:47:16','2021-12-10 19:47:16'),('102','收费员1','251381xxxxxxxx5553','1000229',1,440,0,'2021-12-10 19:47:16','2021-12-10 19:47:16'),('102','收费员1','315213xxxxxxxx5552','1000230',2,1080,0,'2021-12-10 19:47:16','2021-12-10 19:47:16');
/*!40000 ALTER TABLE `charge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `charge_view`
--

DROP TABLE IF EXISTS `charge_view`;
/*!50001 DROP VIEW IF EXISTS `charge_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `charge_view` AS SELECT 
 1 AS `toll_id`,
 1 AS `t_name`,
 1 AS `patient_id`,
 1 AS `drug_id`,
 1 AS `drug_quantity`,
 1 AS `amount`,
 1 AS `is_delete`,
 1 AS `create_time`,
 1 AS `update_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor` (
  `d_octor_id` int unsigned NOT NULL COMMENT '医生编号',
  `d_name` varchar(20) COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '医生姓名',
  `d_sex` varchar(2) COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '医生性别',
  `d_age` tinyint unsigned NOT NULL COMMENT '医生年龄',
  `d_dept` varchar(50) COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '科室',
  `d_tel` varchar(20) COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '电话',
  `is_jobing` tinyint unsigned NOT NULL DEFAULT '1' COMMENT '0为医生不在岗',
  `is_delete` tinyint NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`d_octor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor`
--

LOCK TABLES `doctor` WRITE;
/*!40000 ALTER TABLE `doctor` DISABLE KEYS */;
INSERT INTO `doctor` VALUES (1,'王渊洁','男',30,'牙科','137xxxx321',1,0,'2021-12-10 19:46:01','2021-12-10 19:46:01'),(2,'莫家里昂','男',30,'妇产科','137xxxx111',1,0,'2021-12-10 19:46:01','2021-12-10 19:46:01'),(3,'尘思语','男',30,'肛肠科','137xxxx112',1,0,'2021-12-10 19:46:01','2021-12-10 19:46:01'),(4,'杰瑞哲','男',30,'呼吸道科','137xxxx113',1,0,'2021-12-10 19:46:01','2021-12-10 19:46:01'),(5,'唐三','女',30,'肛肠科','158xxxx113',1,0,'2021-12-10 19:46:01','2021-12-10 19:46:01'),(6,'叶文洁','女',30,'骨科','168xxxx113',1,0,'2021-12-10 19:46:01','2021-12-10 19:46:01'),(7,'罗辑','男',30,'眼科','133xxxx113',1,0,'2021-12-10 19:46:01','2021-12-10 19:46:01'),(8,'尘心','女',30,'心理科','155xxxx113',1,0,'2021-12-10 19:46:01','2021-12-10 19:46:01');
/*!40000 ALTER TABLE `doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `drug_view`
--

DROP TABLE IF EXISTS `drug_view`;
/*!50001 DROP VIEW IF EXISTS `drug_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `drug_view` AS SELECT 
 1 AS `drug_id`,
 1 AS `drug_name`,
 1 AS `drug_price`,
 1 AS `drug_quantity`,
 1 AS `drug_storage`,
 1 AS `drug_date`,
 1 AS `usefull_life`,
 1 AS `is_delete`,
 1 AS `create_time`,
 1 AS `update_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `drugs`
--

DROP TABLE IF EXISTS `drugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drugs` (
  `drug_id` varchar(10) COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '药品编号',
  `drug_name` varchar(50) COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '药品名称',
  `drug_price` decimal(10,0) unsigned NOT NULL COMMENT '药品价格',
  `drug_quantity` bigint unsigned NOT NULL COMMENT '药品数量',
  `drug_storage` varchar(50) COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '存储位置',
  `drug_date` datetime NOT NULL COMMENT '生产日期',
  `usefull_life` datetime NOT NULL COMMENT '有效期',
  `is_delete` tinyint NOT NULL DEFAULT '0' COMMENT '0为未删除 1为已删除',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建字段的时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改字段的时间',
  PRIMARY KEY (`drug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drugs`
--

LOCK TABLES `drugs` WRITE;
/*!40000 ALTER TABLE `drugs` DISABLE KEYS */;
INSERT INTO `drugs` VALUES ('1000210','黄连羊肝丸',23,1021,'A-1-002','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:55','2021-12-10 20:44:37'),('1000211','黄连解毒丸',31,821,'A-1-101','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:55','2021-12-10 19:46:55'),('1000212','黄金波药酒',43,821,'A-1-110','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:55','2021-12-10 19:46:55'),('1000213','黄连上清片',12,821,'A-1-111','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:55','2021-12-10 19:46:55'),('1000214','维C银翘片',8,821,'B-1-102','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:55','2021-12-10 19:46:55'),('1000215','骨筋丸胶囊',37,821,'C-2-302','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:55','2021-12-10 19:46:55'),('1000216','除障泽海甫片',14,821,'D-1-102','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:56','2021-12-10 19:46:56'),('1000217','除脂生发片',36,821,'C-1-102','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:56','2021-12-10 19:46:56'),('1000218','远志糖浆',43,821,'B-2-100','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:56','2021-12-10 19:46:56'),('1000219','还少丹',40,821,'C-3-001','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:56','2021-12-10 19:46:56'),('1000220','当归补血丸',20,821,'A-3-291','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:56','2021-12-10 19:46:56'),('1000221','胃康灵胶囊',50,821,'B-2-231','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:56','2021-12-10 19:46:56'),('1000222','维生素B2注射液',64,821,'C-1-213','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:56','2021-12-10 19:46:56'),('1000223','磺胺甲噁唑',56,821,'B-1-221','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:56','2021-12-10 19:46:56'),('1000224','乙型肝炎病毒表面抗原检测试剂盒(化学发光法)',240,821,'B-2-312','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:56','2021-12-10 19:46:56'),('1000225','多糖止血修复生物胶液（生物多糖冲洗胶液）',140,821,'C-2-011','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:56','2021-12-10 19:46:56'),('1000226','D-二聚体试剂盒',40,819,'C-5-190','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:56','2021-12-10 20:10:03'),('1000227','Pholcodine',340,821,'C-4-302','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:57','2021-12-10 19:46:57'),('1000228','尼可待因',221,821,'C-6-302','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:57','2021-12-10 19:46:57'),('1000229','Ethylmorphine',440,821,'C-4-202','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:57','2021-12-10 19:46:57'),('100023','感冒灵颗粒',40,821,'A-2-302','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:55','2021-12-10 19:46:55'),('1000230','Thiofentanyl',540,821,'C-3-271','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:57','2021-12-10 19:46:57'),('1000231','2-二甲氨基-1-[3,4-(亚甲二氧基)苯基]-1-丙酮',740,821,'C-4-102','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:57','2021-12-10 19:46:57'),('1000232','丹黄祛瘀胶囊',40,821,'B-4-555','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:57','2021-12-10 19:46:57'),('1000233','生血宁片',20,821,'B-2-222','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:57','2021-12-10 19:46:57'),('1000234','乌灵胶囊',10,821,'A-3-231','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:57','2021-12-10 19:46:57'),('1000235','清热止咳颗粒',23,821,'B-7-456','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:57','2021-12-10 19:46:57'),('1000236','杜仲补天素丸',28,821,'A-6-291','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:57','2021-12-10 19:46:57'),('1000237','聪明草',9999,821,'C-8-291','2021-09-01 00:00:00','2022-09-01 00:00:00',1,'2021-12-10 19:51:52','2021-12-10 19:56:08'),('100024','卡左双多巴缓释片',56,821,'C-1-122','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:55','2021-12-10 19:46:55'),('100025','拉莫三嗪片',32,821,'C-2-102','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:55','2021-12-10 19:46:55'),('100026','活血风湿膏',28,821,'D-5-213','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:55','2021-12-10 19:46:55'),('100027','龙穴羯',63,821,'A-2-522','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:55','2021-12-10 19:46:55'),('100028','龙胆泻肝片',43,821,'B-2-302','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:55','2021-12-10 19:46:55'),('100029','黑漆丹',54,821,'B-3-101','2021-09-01 00:00:00','2022-09-01 00:00:00',0,'2021-12-10 19:46:55','2021-12-10 19:46:55');
/*!40000 ALTER TABLE `drugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient` (
  `p_atient_id` varchar(20) COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '病人身份证号',
  `p_name` varchar(20) COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '病人姓名',
  `p_age` tinyint unsigned NOT NULL COMMENT '病人年龄',
  `p_sex` varchar(2) COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '病人性别',
  `p_tel` varchar(20) COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '病人电话',
  `p_inf` varchar(50) COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '病例',
  `is_delete` tinyint NOT NULL DEFAULT '0' COMMENT '0为未删除 1为已删除',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建字段的时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改字段的时间',
  PRIMARY KEY (`p_atient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('251381xxxxxxxx5553','病人3',40,'男','121xxxx532','胃疼腹泻',0,'2021-12-10 19:46:32','2021-12-10 19:46:32'),('315213xxxxxxxx5552','病人4',40,'女','137xxxx532','肺炎',0,'2021-12-10 19:46:32','2021-12-10 19:46:32'),('411282xxxxxxxx5555','病人1',24,'男','141xxxx532','牙疼',0,'2021-12-10 19:46:31','2021-12-10 19:46:31'),('421282xxxxxxxx5554','病人2',24,'女','141xxxx532','生孩子',0,'2021-12-10 19:46:32','2021-12-10 19:46:32');
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `patient_view`
--

DROP TABLE IF EXISTS `patient_view`;
/*!50001 DROP VIEW IF EXISTS `patient_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `patient_view` AS SELECT 
 1 AS `p_atient_id`,
 1 AS `p_name`,
 1 AS `p_age`,
 1 AS `p_sex`,
 1 AS `p_tel`,
 1 AS `p_inf`,
 1 AS `is_delete`,
 1 AS `create_time`,
 1 AS `update_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pay`
--

DROP TABLE IF EXISTS `pay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay` (
  `patient_id` varchar(20) COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '病人编号',
  `t_id` varchar(10) COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收费编号',
  `price` decimal(10,0) NOT NULL COMMENT '价格',
  `is_delete` tinyint NOT NULL DEFAULT '0' COMMENT '0为未删除 1为已删除',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建字段的时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改字段的时间',
  PRIMARY KEY (`patient_id`,`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay`
--

LOCK TABLES `pay` WRITE;
/*!40000 ALTER TABLE `pay` DISABLE KEYS */;
INSERT INTO `pay` VALUES ('251381xxxxxxxx5553','003',440,0,'2021-12-10 19:47:53','2021-12-10 19:47:53'),('315213xxxxxxxx5552','004',1080,0,'2021-12-10 19:47:53','2021-12-10 19:47:53'),('411282xxxxxxxx5555','001',80,0,'2021-12-10 19:47:53','2021-12-10 19:47:53'),('421282xxxxxxxx5554','002',20,0,'2021-12-10 19:47:53','2021-12-10 19:47:53');
/*!40000 ALTER TABLE `pay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pay_view`
--

DROP TABLE IF EXISTS `pay_view`;
/*!50001 DROP VIEW IF EXISTS `pay_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pay_view` AS SELECT 
 1 AS `patient_id`,
 1 AS `t_id`,
 1 AS `price`,
 1 AS `is_delete`,
 1 AS `create_time`,
 1 AS `update_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pgm`
--

DROP TABLE IF EXISTS `pgm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pgm` (
  `t_id` varchar(10) COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '收费编号',
  `drug_id` varchar(10) COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '药品编号',
  `quantity` int unsigned NOT NULL COMMENT '数量',
  `price` decimal(10,0) unsigned NOT NULL COMMENT '价格',
  `is_delete` tinyint NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`t_id`,`drug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pgm`
--

LOCK TABLES `pgm` WRITE;
/*!40000 ALTER TABLE `pgm` DISABLE KEYS */;
INSERT INTO `pgm` VALUES ('001','100023',2,80,0,'2021-12-10 19:47:29','2021-12-10 19:47:29'),('002','1000233',1,20,0,'2021-12-10 19:47:30','2021-12-10 19:47:30'),('003','1000229',1,440,0,'2021-12-10 19:47:30','2021-12-10 19:47:30'),('004','1000230',2,1080,0,'2021-12-10 19:47:30','2021-12-10 19:47:30');
/*!40000 ALTER TABLE `pgm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `pgm_view`
--

DROP TABLE IF EXISTS `pgm_view`;
/*!50001 DROP VIEW IF EXISTS `pgm_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `pgm_view` AS SELECT 
 1 AS `t_id`,
 1 AS `drug_id`,
 1 AS `quantity`,
 1 AS `price`,
 1 AS `is_delete`,
 1 AS `create_time`,
 1 AS `update_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `recipel`
--

DROP TABLE IF EXISTS `recipel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipel` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `count` int unsigned NOT NULL COMMENT '数量',
  `doctor_id` varchar(10) COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '医生编号',
  `drug_id` varchar(10) COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '药品编号',
  `patient_name` varchar(20) COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '病人姓名',
  `is_delete` tinyint NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipel`
--

LOCK TABLES `recipel` WRITE;
/*!40000 ALTER TABLE `recipel` DISABLE KEYS */;
INSERT INTO `recipel` VALUES (1,2,'001','100023','病人1',0,'2021-12-10 19:47:43','2021-12-10 19:47:43'),(2,1,'002','1000233','病人2',0,'2021-12-10 19:47:43','2021-12-10 19:47:43'),(3,1,'003','1000229','病人3',0,'2021-12-10 19:47:43','2021-12-10 19:47:43'),(4,2,'004','1000230','病人4',0,'2021-12-10 19:47:43','2021-12-10 19:47:43'),(5,2,'005','1000226','病人6',0,'2021-12-10 20:10:03','2021-12-10 20:10:03');
/*!40000 ALTER TABLE `recipel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `register` (
  `r_num` int unsigned NOT NULL AUTO_INCREMENT COMMENT '挂号编号',
  `r_patient_id` varchar(20) COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '病人身份证号',
  `r_P_name` varchar(20) COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '病人姓名',
  `r_sex` varchar(2) COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '性别',
  `r_dept` varchar(20) COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '挂号科室',
  `r_name` varchar(10) COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '医生姓名',
  `is_delete` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '0为未删除 1为已删除',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建字段的时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改字段的时间',
  PRIMARY KEY (`r_num`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register`
--

LOCK TABLES `register` WRITE;
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` VALUES (1,'411282xxxxxxx1182','病人1','女','肛肠科','尘思宇',0,'2021-12-10 19:45:21','2021-12-10 19:45:21'),(2,'411282xxxxxxxx5555','病人1','男','牙科','王渊洁',0,'2021-12-10 19:45:40','2021-12-10 19:45:40'),(3,'421282xxxxxxxx5554','病人2','女','妇产科','莫家里昂',0,'2021-12-10 19:45:40','2021-12-10 19:45:40'),(4,'251381xxxxxxxx5553','病人3','男','肛肠科','尘思语',0,'2021-12-10 19:45:40','2021-12-10 19:45:40'),(5,'315213xxxxxxxx5552','病人4','女','呼吸道科','杰瑞哲',0,'2021-12-10 19:45:40','2021-12-10 19:45:40');
/*!40000 ALTER TABLE `register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `register_view`
--

DROP TABLE IF EXISTS `register_view`;
/*!50001 DROP VIEW IF EXISTS `register_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `register_view` AS SELECT 
 1 AS `r_num`,
 1 AS `r_patient_id`,
 1 AS `r_P_name`,
 1 AS `r_sex`,
 1 AS `r_dept`,
 1 AS `r_name`,
 1 AS `is_delete`,
 1 AS `create_time`,
 1 AS `update_time`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `charge_view`
--

/*!50001 DROP VIEW IF EXISTS `charge_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `charge_view` AS select `charge`.`toll_id` AS `toll_id`,`charge`.`t_name` AS `t_name`,`charge`.`patient_id` AS `patient_id`,`charge`.`drug_id` AS `drug_id`,`charge`.`drug_quantity` AS `drug_quantity`,`charge`.`amount` AS `amount`,`charge`.`is_delete` AS `is_delete`,`charge`.`create_time` AS `create_time`,`charge`.`update_time` AS `update_time` from `charge` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `drug_view`
--

/*!50001 DROP VIEW IF EXISTS `drug_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `drug_view` AS select `drugs`.`drug_id` AS `drug_id`,`drugs`.`drug_name` AS `drug_name`,`drugs`.`drug_price` AS `drug_price`,`drugs`.`drug_quantity` AS `drug_quantity`,`drugs`.`drug_storage` AS `drug_storage`,`drugs`.`drug_date` AS `drug_date`,`drugs`.`usefull_life` AS `usefull_life`,`drugs`.`is_delete` AS `is_delete`,`drugs`.`create_time` AS `create_time`,`drugs`.`update_time` AS `update_time` from `drugs` where (`drugs`.`is_delete` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `patient_view`
--

/*!50001 DROP VIEW IF EXISTS `patient_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patient_view` AS select `patient`.`p_atient_id` AS `p_atient_id`,`patient`.`p_name` AS `p_name`,`patient`.`p_age` AS `p_age`,`patient`.`p_sex` AS `p_sex`,`patient`.`p_tel` AS `p_tel`,`patient`.`p_inf` AS `p_inf`,`patient`.`is_delete` AS `is_delete`,`patient`.`create_time` AS `create_time`,`patient`.`update_time` AS `update_time` from `patient` where (`patient`.`is_delete` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pay_view`
--

/*!50001 DROP VIEW IF EXISTS `pay_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pay_view` AS select `pay`.`patient_id` AS `patient_id`,`pay`.`t_id` AS `t_id`,`pay`.`price` AS `price`,`pay`.`is_delete` AS `is_delete`,`pay`.`create_time` AS `create_time`,`pay`.`update_time` AS `update_time` from `pay` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pgm_view`
--

/*!50001 DROP VIEW IF EXISTS `pgm_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pgm_view` AS select `pgm`.`t_id` AS `t_id`,`pgm`.`drug_id` AS `drug_id`,`pgm`.`quantity` AS `quantity`,`pgm`.`price` AS `price`,`pgm`.`is_delete` AS `is_delete`,`pgm`.`create_time` AS `create_time`,`pgm`.`update_time` AS `update_time` from `pgm` where (`pgm`.`is_delete` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `register_view`
--

/*!50001 DROP VIEW IF EXISTS `register_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `register_view` AS select `register`.`r_num` AS `r_num`,`register`.`r_patient_id` AS `r_patient_id`,`register`.`r_P_name` AS `r_P_name`,`register`.`r_sex` AS `r_sex`,`register`.`r_dept` AS `r_dept`,`register`.`r_name` AS `r_name`,`register`.`is_delete` AS `is_delete`,`register`.`create_time` AS `create_time`,`register`.`update_time` AS `update_time` from `register` where (`register`.`is_delete` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-10 20:51:12
