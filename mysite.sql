-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: mysite
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_abnormal`
--

DROP TABLE IF EXISTS `account_abnormal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account_abnormal` (
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `id_card` varchar(20) NOT NULL,
  `sex` varchar(2) NOT NULL,
  `school` varchar(20) NOT NULL,
  `major` varchar(20) NOT NULL,
  `sclass` varchar(20) NOT NULL,
  `admin_data` date NOT NULL,
  `remark` varchar(500) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_abnormal`
--

LOCK TABLES `account_abnormal` WRITE;
/*!40000 ALTER TABLE `account_abnormal` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_abnormal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_card`
--

DROP TABLE IF EXISTS `account_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account_card` (
  `card_id` varchar(20) NOT NULL,
  `student_id` varchar(20) NOT NULL,
  `photo` varchar(100) NOT NULL,
  PRIMARY KEY (`card_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_card`
--

LOCK TABLES `account_card` WRITE;
/*!40000 ALTER TABLE `account_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_stu_user_view`
--

DROP TABLE IF EXISTS `account_stu_user_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account_stu_user_view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_stu_user_view`
--

LOCK TABLES `account_stu_user_view` WRITE;
/*!40000 ALTER TABLE `account_stu_user_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_stu_user_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_user`
--

DROP TABLE IF EXISTS `account_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account_user` (
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `id_card` varchar(20) NOT NULL,
  `sex` varchar(2) NOT NULL,
  `school` varchar(20) NOT NULL,
  `major` varchar(20) NOT NULL,
  `sclass` varchar(20) NOT NULL,
  `admin_data` date NOT NULL,
  `is_teacher` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_user`
--

LOCK TABLES `account_user` WRITE;
/*!40000 ALTER TABLE `account_user` DISABLE KEYS */;
INSERT INTO `account_user` VALUES (NULL,0,'','','',0,1,'2019-12-18 12:53:05.837667','111001','pbkdf2_sha256$150000$CVXP6p8ODQDC$HyVKi9sP+dT1xhYYw3txnWOD5sYMZW3euHYYEZY2G/4=','张永胜','','','信息科学与工程学院','计算机教学1系','教授','2019-12-18',1),('2019-12-17 13:14:25.644931',0,'','','',0,1,'2019-12-10 08:51:15.314743','111057','pbkdf2_sha256$150000$REZflunltCDv$cV6a7o9GH55x3RJlzlK/pJXV99T7/yxu6dmj8bzslLk=','孙跃鲁','','','信息科学与工程学院','计算机教学1系','副教授','2019-12-10',1),(NULL,0,'','','',0,1,'2019-12-10 09:01:37.056152','111061','pbkdf2_sha256$150000$ucEUUc2p4njj$ru5XNafbkyUqqWO9ncAhcrd6H/E4d7PcpwmZQuAWYQU=','计华','','','信息科学与工程学院','计算机教学1系','副教授','2019-12-10',1),(NULL,0,'','','',0,1,'2019-12-18 12:27:31.500471','111116','pbkdf2_sha256$150000$U5QY1Q4cD3BA$z0DiyZpqkkiND8glo/Z6pbSMkXcrC511FQw02g6iqks=','高保忠','','','信息科学与工程学院','计算机教学1系','讲师','2019-12-18',1),(NULL,0,'','','',0,1,'2019-12-18 06:35:32.898047','201711010101','pbkdf2_sha256$150000$WaElbK9pjSuw$047AbBc4sHKe/Dk228vy1Ee463rDfniYz+TpwoaQPjw=','曹光佩','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),('2019-12-10 08:33:04.331018',0,'','','',0,1,'2019-12-10 08:32:50.565821','201711010102','pbkdf2_sha256$150000$BAgLn1yPo2SB$Avj27zS/fsLjnNshbUE32RhbjT7jsEshLKMAEP+PIXY=','王婉菁','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:30.575092','201711010103','pbkdf2_sha256$150000$xacU2VXRJbSj$uv9cMahHCgih76ZFY12/daThg0W/1SJX1r89NdQMwss=','陈阳','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:33.087097','201711010104','pbkdf2_sha256$150000$NMVcc6mv2cK1$lONo9OrkigJUGQsJdIz8aaFKtTLBwtqdrzXE4hxr30w=','崔健聪','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:33.234109','201711010105','pbkdf2_sha256$150000$3ES3Q8VMFLK4$hCtxOYPQMeegWqWZNjKacr2xsfhU/j8AZnlolgzxrvY=','王冠宇','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:33.399538','201711010106','pbkdf2_sha256$150000$bPcVrnlkPkp0$ZbuzcpiSZhGRMhcLb5OGS4VeQ3z4oKPRvOrS1XYXfKk=','康靖然','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:30.766318','201711010107','pbkdf2_sha256$150000$JNz0xBn7SHRn$iQAa172CE7tPBlfKhiIgRkaHPRplQdpQZluB1CuGT4o=','刘石垒','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:33.568646','201711010108','pbkdf2_sha256$150000$ktFbbidKZWbQ$mZeLRDpTrThmPb2kQT+e+mpE5P7Y7e8Ger+g/FS9LMk=','张子姗','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:33.738535','201711010109','pbkdf2_sha256$150000$NQXtDu2PXNgg$nQmB2owXVQ2Zll0E4NqH4uHDwAA/QNpoYwNbTo/r1c8=','张昊','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:33.953188','201711010110','pbkdf2_sha256$150000$Is4azguXrSja$YBN5pVdSg+qZRJqW5lh6g1qWHIOHBWsD3PCvW1PJmYk=','孟晓龙','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),('2019-12-17 13:12:35.193347',0,'','','',0,1,'2019-12-10 08:35:20.918957','201711010111','pbkdf2_sha256$150000$uU36hmaCrnvY$VIbPSfS5uikg3NgJRGegzHjN5xsM9Bv3ep1o6oYC7/4=','展家慧','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:34.109045','201711010113','pbkdf2_sha256$150000$iyZellKP9irc$XzLibWSuBc1Iphl6SJpnrIyLV9YR/HqCmLG0TNcsfWI=','刘阳','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:34.308081','201711010114','pbkdf2_sha256$150000$vv7DqUDbUHRn$DA2ufMO3CI0qsIqSdx2joeoM1fxzMekZqkQQSvpwD1s=','孙浩然','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:34.513991','201711010117','pbkdf2_sha256$150000$M5EEBJE8B1wA$7sgCa424iOOVya99Yy9Mlo57D4Y8Ak1T4lm4qIaUVv4=','李景品','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:21.109160','201711010118','pbkdf2_sha256$150000$XaMbPEzX1IOJ$bNaVFhel+HGiDR9mTSTL0deG1oBeWxeW0+bMZ4GODBw=','党娜','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:30.952854','201711010119','pbkdf2_sha256$150000$uv9gTnCJnDLC$5VwQtTyOxL+VvhX1N5qsrii4aw6DVnFwmlmP5sf0qu0=','居安','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:21.296189','201711010120','pbkdf2_sha256$150000$SzEkEDNkmgpZ$O5LL+tUHPv5DwkucbUpvHAPHHVAizOmmO9SUx6yppoM=','秦娜','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:31.139475','201711010121','pbkdf2_sha256$150000$6w7NsWmO0TsW$M4CyzcObwzpt0rNHBmrfkQUYhVvJ53SW50pMO5B0WyM=','王峻城','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:34.673424','201711010122','pbkdf2_sha256$150000$0YbjVv6dtFUE$uOMjPWpqdy6yqB48MEiUDkOCoN6u7edjGi3e5ZFaZw8=','任政宇','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:31.326717','201711010123','pbkdf2_sha256$150000$guBc298chQxn$G32nnl3XLAJxwPGtD/RF4RmAbYVu7Qk/6j7IcHU+7Lk=','宋广志','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:31.513911','201711010126','pbkdf2_sha256$150000$i0pV9DgY7QO4$KBUkVjvA+tVqt52sSvgcLDb4vklMmfmyv0ueIO1jprw=','贾一鸣','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:34.825978','201711010127','pbkdf2_sha256$150000$JtH4F8B4Liqh$RL8O2GGoyhsBykrxtmPKZipq0Bm9t4Gqvd/xTpY4xJE=','胡秋琛','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:31.700830','201711010128','pbkdf2_sha256$150000$NCokWnAtQWiS$KY+QqM9MbtYvmEW5ENYGO/R0vo3aMSSJtbjmbRhwrOk=','王福磊','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:35.024003','201711010129','pbkdf2_sha256$150000$FaGl78Pqq1fB$ycr/3Ap02Qkz2pXThludpRbWvoCoQp6XHIElVTSOnKY=','牛志鑫','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:35.171809','201711010130','pbkdf2_sha256$150000$lr1zwdBvnTWW$EyUiAKzzpmxIwTFfcawxcCqGuJ0+jdJc+vrOgpF7qRk=','张雅宁','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:35.323528','201711010131','pbkdf2_sha256$150000$3yjuLN3CvJz4$xutO9vTaCPoCv3eTE+xsJ9M6Tk7KIRZalgvic1P4eOk=','韩延伟','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:35.470128','201711010132','pbkdf2_sha256$150000$7t1HHesyfboU$8FoiRPsTER7kmAzNxaGE89I+pxNe1rhJbylWS4+94sY=','庄慧','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:35.624148','201711010133','pbkdf2_sha256$150000$5aOOeUjUsAQp$IBaGD4pPea+Q9kZiKKyICilHyq37ktXzJr55xJOV1AE=','袁雪灵','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:31.887705','201711010134','pbkdf2_sha256$150000$6qkK8xi70ZAJ$wKWGDhM47J2EvYkUeLEeXfte8ysOFKSXTh0+cHJWdxU=','肖佳良','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:21.484822','201711010136','pbkdf2_sha256$150000$LKeZCIcQQwJS$teVGEdxxR8tB6F1tMkQ834V5gjYAGLo5m/IkYo+F20A=','韩子琪','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:32.074097','201711010137','pbkdf2_sha256$150000$7ACxA6ofQqkb$G4zOuA08LZbKz6cxkFm7L4v79rTTsVdVre06OHiLZc8=','高明悦','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:21.670810','201711010139','pbkdf2_sha256$150000$tKzxlZ8c1YPV$xi5fd+5h9mUyxu7F1N/zR2Cyz2E1TmAX6zCfRafLORw=','宓家聪','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:35.773645','201711010140','pbkdf2_sha256$150000$Wz10OicAJtsN$IHxZmgu5sxjqewaqNuENQlplbBSieryocilIvmWe7Eo=','宫久松','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:35.934526','201711010143','pbkdf2_sha256$150000$WelsZ0w1sJ4F$MzevAMXPZQBitJTht7cPxgTrLPOT2MKSPvnO422q/6A=','杜文汇','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:21.858760','201711010144','pbkdf2_sha256$150000$dlSYUvdJcGHw$VprB99H60u1xUUHDvwMmcounRelFqyKVGVo4hRuBHec=','关忠超','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:36.137280','201711010145','pbkdf2_sha256$150000$wUvxeOZUPBT1$Cs6/oaeAngeT5H69VJ0f2tew3aACdT5LPZNSZf+vE4Q=','李宏阳','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:22.045595','201711010146','pbkdf2_sha256$150000$myaMRomf11MM$CpCTQEwbf4Ho6zhoY0ThLyEfP195KxmcRK+Dim3tI2k=','宋旭阳','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:36.297102','201711010147','pbkdf2_sha256$150000$eHDr0ZXVr3rp$qDLdph6JRAqKQXVLUbd/hLA58RGZsJSzkFFwQszd0u4=','郑屹凡','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:22.232595','201711010148','pbkdf2_sha256$150000$n1MvQ0pV5iwY$9e3NEOMw1g6Y6GDWuOZErHvzbE59x4UrMP9ZZ7ADfMw=','路宽宽','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:22.421514','201711010149','pbkdf2_sha256$150000$XzTBbJX8tWbK$bHs9byN5tKgBNK6VD35zImATcscVc9hbiefqROkGPE4=','王朝国','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:36.453736','201711010150','pbkdf2_sha256$150000$PowVzDi2C0RW$1QLdzKvHMhC1int4Ojgmje4/AvgISFDm9Mt7Axu8X24=','黄钰涵','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:36.606614','201711010153','pbkdf2_sha256$150000$wMPRqkMQQb0K$6SDCBxEryyJDf3k/uwbwqBEK7fKX8jEcUfB88uvNDxM=','马孝丹','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:36.772878','201711010156','pbkdf2_sha256$150000$xhUh5mbtRpJz$QXoVJb0M93kfukIzd61rvl6LN3K/B7SmY+7ZEsWTmz4=','贺华加','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:36.949331','201711010201','pbkdf2_sha256$150000$neqhmaSyL4mZ$RpK4NIDPiIBcuRSXdPMcLLeVPuP9IHI6E4N4G4AJXDg=','王龙耀','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),('2019-12-18 14:06:27.023142',0,'','','',0,1,'2019-12-10 08:35:32.261507','201711010202','pbkdf2_sha256$150000$zcaCD2aC5wGL$YCWBrpoJdeITaQ30vUzvCF8wgpeSl6gDHtoye6GD9FA=','王汝芸','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:32.448513','201711010203','pbkdf2_sha256$150000$hfxUQQSqkZ9t$o3IXlVn+L/ectTRI9dBdJiWceOWFi8Hk682g5QG9zY8=','邱天','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:37.098897','201711010204','pbkdf2_sha256$150000$B3GplbXgnK5j$/Qbr/jT6M6tY5BfbISN6GfhV40ygA/jA5Th6+d93KGM=','李宁','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:37.285295','201711010205','pbkdf2_sha256$150000$dlNUfvNgXfHu$nu7FGpxbkPGieaM/sLDzg0LRY91G+vEngVdSVVYIRnA=','李硕','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:32.634796','201711010206','pbkdf2_sha256$150000$YBgyOaFeTw3B$TkfL0kUGeVIWzE6v4dbO+X0VM58Sx8FeTL9gLNpdHDU=','李言浩','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:22.610191','201711010207','pbkdf2_sha256$150000$OfBwBdMZe73Q$U7qWwu4mnTFE50020g0xwv9DipfK5hMI6lvYkExW7nU=','范光远','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:22.797603','201711010208','pbkdf2_sha256$150000$P5E4f6WJHKqY$Zil1eI63ORPL+rzJWaSmadIgMdpJg/dgAfvDpt/RU5s=','孙威振','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:37.437548','201711010210','pbkdf2_sha256$150000$q4grcmwmlfiy$1jS7AkSK0krGQTHGYW+2otEwzEk17r9hsX2Zuqr92lI=','王辉','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:32.821343','201711010212','pbkdf2_sha256$150000$2CTEOU0pOvs4$WKOu5LLNSXbO+F+EgD5qn80kHxMGX89ZgcXhk8kA4mI=','胡恬雨','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:23.008840','201711010213','pbkdf2_sha256$150000$AtZn8YUlmiGq$O2cxgLpPuL1Sa2kySulL+PSeWdAxZzZdHuGm2P1OJ4k=','王振浩','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:33.008059','201711010216','pbkdf2_sha256$150000$2iMKw5TzDVEb$5Q1ccmqQaspR0Tmf6dpj+gjYC8snH2xqVrEZ/gr+Npg=','代永','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:37.582744','201711010217','pbkdf2_sha256$150000$vwTVStdsu579$b9RSrXN2Y7BMfpLrZuFyoZNOcOPrSBI6jsIoHHWXNGs=','陈亚男','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:37.738928','201711010218','pbkdf2_sha256$150000$or4oRZXrFlnz$kWKlFBDoE1xyqNc07dN/7MTfTh3qRqknN6qnJrNlLQo=','尤胜民','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:33.195247','201711010220','pbkdf2_sha256$150000$lBI5ko820Bys$6dxjI13uyqwwGRn/1y94b0FuEJJI9wuEp2EqHMHSuA0=','汪博文','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:37.887356','201711010221','pbkdf2_sha256$150000$QSi1pkKjgayH$maWKxwcdg3u99kgOCgGEw+uGk0OQTM4IZuZUDEqyWsc=','马逸伦','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:33.382814','201711010222','pbkdf2_sha256$150000$Jcha250QlM2e$r8KhIwVd0/jVjFk4MX4/by/L5/Rh5E5uAGsU9w5v3co=','张宇坤','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:38.032577','201711010223','pbkdf2_sha256$150000$eK2DFk5fJwW7$dvFEwN5j1dYpVSg96qnZ7LQ+G+eO05dhHGZHA8mVYoI=','王耀华','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:38.266622','201711010224','pbkdf2_sha256$150000$6PKXbIzAXZss$mSPsTLKjfhcNNL8Nh+pFlqYBioKrwFAchmZkBZUxVNQ=','郑子希','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:38.425942','201711010225','pbkdf2_sha256$150000$KWshaTP2BSpF$zakaF0vb1vIUnGaqd8xNq3s4qfUlOqXg1n+mHDRRSBk=','李若水','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:23.204953','201711010226','pbkdf2_sha256$150000$62tJbDxclRy8$ugwB2seIC9+ZUPihoVRw/lvmoRiyrTBcQYdC2ImTZUo=','田健','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:33.570726','201711010228','pbkdf2_sha256$150000$EEWroEioQLVF$ZcnYaXxwA+QH20/fh+CMrZ1nTc+tx1ymRLbdzMq/Dow=','刘润轩','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:38.577114','201711010230','pbkdf2_sha256$150000$8lPVFWTtmmqa$TT1/q1QEosotSwayuby/KA0Vtd5B7yW11tNeCT0Xt0o=','王怀山','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:38.721313','201711010231','pbkdf2_sha256$150000$vapuFIHTmC7f$GvEY/T70A8hJatR3EhYxMTimL7nhzGqL5IWDkssAQCI=','孔祥玉','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:38.881667','201711010232','pbkdf2_sha256$150000$34GQdZmeI1mq$WpLMv1JLi5mJMvoExrca1hY/dGAe0OhWDBmcZcxltqQ=','鲍靖韬','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:39.032581','201711010233','pbkdf2_sha256$150000$caHr2jfHcFXH$KFcPM7dMo0QGTewnZrtlNSmNf0MC94RTxF2qMeOanT0=','张怡菲','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:39.184821','201711010234','pbkdf2_sha256$150000$spKU0RAs2Cea$J2NA4JHMWUnxwzg3vDzarm/eNTw7YcPiI6ArjFxceZY=','张继东','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:39.375705','201711010235','pbkdf2_sha256$150000$G5PwHPFfiSSh$Gn1iPJE6UE8ygJD7e0rYP8X6p9PdrlsVJEQ5Ben21T0=','王赫','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:23.393450','201711010241','pbkdf2_sha256$150000$lDAvVEmn0Vyz$Nrby1eyD1d/H5EwjD5QqxNUov4uKPb/HiI9Rx18Gdf8=','郝嘉宁','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:39.528545','201711010242','pbkdf2_sha256$150000$UrcL4ngEjF9l$/SpKAeKWz1fgoaYO+33GQh4l+pct7LLUmm9555KZGyQ=','李子静','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:23.579570','201711010243','pbkdf2_sha256$150000$uYqYw356cfTw$RR0txuLCm/QHLH7lG2i5PbljJJ+uGItSxSw/QV74PKM=','任志慷','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:23.773314','201711010244','pbkdf2_sha256$150000$ng677z70AV2L$4tH06Uj4xNm1Y0nBHiOtfuzO7nBBsaReRhY8KX2n8nQ=','王新杰','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:23.983336','201711010245','pbkdf2_sha256$150000$zHiRmYtUOs1b$z9IHdjjcqQkPpmr+uH+8ASd3LERpmO19T4uONn2JNXc=','吕英杰','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:39.679896','201711010246','pbkdf2_sha256$150000$k4AqxiwAEDav$ryouua0gKoTftDDQjzy8Sz+chREjgZ0pYb6iPrD0/qw=','董金霄','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:24.171972','201711010248','pbkdf2_sha256$150000$sUSJpE3LqdUz$eMZwh2MzW/G4xL/DL1MRkiy1hm6rVAus6ZAt0Zb+fEI=','王建浩','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:39.831869','201711010249','pbkdf2_sha256$150000$eoUNfIyhM7di$67Lys3Mrl9eUX3arPGAFmgaXJQ2qR+/ZlN+o1qaBtHg=','贾贺坤','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:33.757137','201711010250','pbkdf2_sha256$150000$oj95g9JfxZVO$Kba/AK4hvSL3eaDBGLHn+xZzvcjZ+H+bDdeR0l0Vq04=','陈冰','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),('2019-12-18 12:49:17.441757',0,'','','',0,1,'2019-12-18 06:35:39.978325','201711010251','pbkdf2_sha256$150000$VWeI1lYrYdt6$I6o9TM+I2xMA1v9Z4iOWHIhp0O0WSqmXTvGCFRATPwk=','卢雨洁','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:33.942836','201711010252','pbkdf2_sha256$150000$0AhOJWEQciKS$xeJlks+OocTj5n0g5Ofnds4DgB0vRGIZjwdv2u8DxzI=','张飞','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:40.126991','201711010253','pbkdf2_sha256$150000$2JJNQTZJIEBt$HZEnvBNFAXAQYMXhYwLtockqFlZIztAc/8tyJeTndT8=','朱锦媛','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:24.361529','201711010254','pbkdf2_sha256$150000$d2zUxmojwyzM$FEZ3vLKYOzgmNXrKMDn+ZbY/yvIARdpQvFk/66ftT5U=','袁帆','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:24.548466','201711010258','pbkdf2_sha256$150000$asdubYOtOyjK$+8y8URYhFLyVVemXH6gvejGKPh1ErVbdR60Gq+guQG0=','马英梅','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:40.280047','201711010301','pbkdf2_sha256$150000$Px1AlTCIpSO1$zAhG2DAYm/2yDrwQCnG4tvWjI6Iz58zUtlAwof/pXbk=','樊鹏飞','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:40.475506','201711010302','pbkdf2_sha256$150000$Rc7g4CEwPlLU$Xv48J/Acptg/V8orVDtj7vAPzd1AwaymWXedHgxNjJg=','王雪','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:40.671817','201711010303','pbkdf2_sha256$150000$SYk6DOushfrm$udtI90dWpD5ZJBZ/NZ0rPvJXfv3XLG3gPAS6ZnisSyk=','程卫昊','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:34.138436','201711010304','pbkdf2_sha256$150000$L4uzIrIHM7S1$yVPxPXyyIHFFWrLJtunAu3+c2b/jRPgP/aN2SHIYsJQ=','武庆安','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:40.815715','201711010306','pbkdf2_sha256$150000$t71PwFLnJuBM$JIGmreQ8+x3B26hURiBUk2qkF9X0L39NevD57baQr6U=','李宝洋','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:34.322772','201711010307','pbkdf2_sha256$150000$jSBCOQZEau81$Zadm/SqIhBlmNV/oPvElB8poLKlcjCWm9Xke5E7os6k=','王瑜','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:40.995509','201711010308','pbkdf2_sha256$150000$cVQlSUNgJzMh$dOWLyujiQEK2fAHVGH5caVU87dxg8LGytG0c93hzcpQ=','马建伟','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:34.510534','201711010309','pbkdf2_sha256$150000$Nb1VemcKOxjb$6F8o007hpBZxaiwcQmsxAZNxl3ALO9VcAKsrPGBcWVk=','卢宇琪','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:34.698410','201711010310','pbkdf2_sha256$150000$nbg5Hwri5ogg$CW17BrKeFdtZxIdHggkeR3bilidHk1N22rHV5pgL4KI=','王建达','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:41.148627','201711010311','pbkdf2_sha256$150000$2SmWrQlgfVKB$3EzGHGFBZJzyd608qAXnD/Zsl4tvD6vywMH8XCY6sVA=','李婷婷','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:41.300132','201711010312','pbkdf2_sha256$150000$PTwKEfvVsmqC$uQd972IhzsAnOZgZD2spKK1qGnXRZ8JNa2xWXKEFMTo=','刘欣','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:24.734802','201711010314','pbkdf2_sha256$150000$FHBT8TV7VFdK$/PmEoNUCKijS7hliZ9KPZ9uo9K3aOUyCkaAHHs1dRBg=','杨学成','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:34.883481','201711010315','pbkdf2_sha256$150000$pqhDr5pimPYP$KehkxBgcdcQ0ypeavR8GkqShc1E/yrJJIWabTM0jlnM=','王瑜','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:24.922678','201711010317','pbkdf2_sha256$150000$nbOkQm2ghNoH$GQ0IryTlYI9qLehQK6oT24+qANqVtS3VSvnojZ12ve0=','马珊','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:41.503685','201711010318','pbkdf2_sha256$150000$f7dTZlLNyJna$DBd9d4iEyXNhMXZ1b1DN13nUIQGY5WK/Gq++VcddueQ=','乔广通','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:41.649020','201711010320','pbkdf2_sha256$150000$D8Fvp3IJFUai$8Dnejj9m9HmHKgqkdZbVsc+7IBkqkksFThdHA2mZqzU=','马立驹','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:25.116239','201711010322','pbkdf2_sha256$150000$xp93ovyymcXc$Syp5YPaVBbs0xjdYR/4CEYsCWMj8sXoumX/7pMPual4=','王爱玲','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:41.798215','201711010324','pbkdf2_sha256$150000$7Bb9vF4HQ8Xk$GRhr1cdD8ZnO1tlz1x0Gw7uDvNyA9BDlV5CHQM+oDYg=','纪雪娜','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:25.306416','201711010327','pbkdf2_sha256$150000$CoWt8zBlXVPu$+pJJB+Fa0KKvLPCOgbPNdVPJ6GfwXZN05rmA3tj7B+U=','王雪晴','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:41.951790','201711010328','pbkdf2_sha256$150000$VzUueknyAnUr$j8F3LbuLVnIUGW7Cti4W/BPFC4VkA2ypZdVTPbLK2Q8=','樊飞宇','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:35.070429','201711010330','pbkdf2_sha256$150000$rkXhAZ7j7Jr2$917HcDdjn28wV5j+2C+nEoeRkBmU+FCRIORU0dvvvEU=','王鹏飞','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:35.258728','201711010331','pbkdf2_sha256$150000$2Moq7CYb832x$s9a9Syc0GG25suCGDs0iqZLME5jx+NeLQ/TJv8p6kDg=','张盼盼','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:42.101761','201711010332','pbkdf2_sha256$150000$9lJizE0ZyvZE$QNKknsC0C36rT+WkEwMNOHmw+FcdSSq6bZWT/R8WIJc=','陈文诚','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:25.509622','201711010336','pbkdf2_sha256$150000$7G09v4TN6YU1$TpSt4Chrjj7I6TAW7RWMmtKocrqLrZMaAe1LRDKl128=','谭好江','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:42.257667','201711010338','pbkdf2_sha256$150000$DirX91ZTDtYL$7Ko4XJmoy0dUnEqUXgp3MNT6N7eF4sr260OQNHEhzEw=','柳昊宇','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:35.444806','201711010340','pbkdf2_sha256$150000$opYo1B5Nh5k2$9yAZUmhhpcJwkERnoHe60rT0fellFi7vBGb9hwQdaOA=','杨奕帆','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:35.632576','201711010341','pbkdf2_sha256$150000$YInMaDlKvrBm$8ThUTO/79kEIyucjAaXybYdnUKrmrzYdW/rq+kETttw=','刘天阳','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:42.419135','201711010343','pbkdf2_sha256$150000$wWetY1Fx69WP$L08EkVTU423cuXzLp3xHyP2x55LM6jP496B3S6ADrnw=','纪雨欣','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:42.617841','201711010344','pbkdf2_sha256$150000$gLQdBO9odMBV$6peGtmIsznbghUawbTYAQLzPJX6fPsOAwgwG27vMXI4=','王康建','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:42.777000','201711010345','pbkdf2_sha256$150000$7CyooM2sGKXi$sg3nlI2KF+UDL8GH0De3O68S8KV16A5WLeijakOA0W4=','宋振嘉','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:25.702748','201711010347','pbkdf2_sha256$150000$PK872sy1xKsw$74lm5pymQlcvVKidEtQdnCfKjikLIRWbWj0cWAbN/4M=','张为可','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:25.890496','201711010348','pbkdf2_sha256$150000$TlYPCqbVaS6p$vcSdf86Nw2as0HswXNH9MQOeFu/FXpCYpitA+MK9ygU=','张艳秋','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:26.097464','201711010349','pbkdf2_sha256$150000$ldQM3Liitde2$IvVkf8OizQ9bIMidnunGI7zf10Tet3MtEL3D9WGqL/Q=','马惊蜇','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:35.817899','201711010351','pbkdf2_sha256$150000$VWtH2Uo1j8Z2$REes4O9rogTFumUvb48HPQ7vngIZ/9uhFuFQnLxalyU=','丁煜','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:42.925106','201711010352','pbkdf2_sha256$150000$dASBLPXftcL6$lRWDmNd3mPYzpYa/Obv1awCZ4klRNlOHM0Jy4vae39g=','熊紫怡','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:26.338220','201711010353','pbkdf2_sha256$150000$nPiHJBI9g1bA$INxBMIpEaoZUzNBzZXKYPxoEiqmnK55i+drdtZ7Mc70=','祝廷薇','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:43.074344','201711010356','pbkdf2_sha256$150000$WkEFf2ciL5rX$YTphGFqDxBmpT8WhrrTBc2W4vOnesoCcNBD8/DWYYz0=','柴发蓉','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:43.228556','201711010401','pbkdf2_sha256$150000$Wa2yHrKdxsWy$X21LFVp/s2qIBc+4M8w+GfwlWu2AIt3rK0f9j9aVlgo=','白瑞','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:36.007334','201711010402','pbkdf2_sha256$150000$2chxTQs2x3HL$LQGvkAgz2eBxpkrDKWrSlMtqiH0+YP2XtdoOHNlN9n8=','曹炳晨','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:26.574602','201711010404','pbkdf2_sha256$150000$RbWYawRl6zBU$7u3bNpIUplm6FeYmtqVMLSLVwC55EPPITU3Z5v9/+6U=','穆彤晖','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:43.377826','201711010412','pbkdf2_sha256$150000$VarcjUf4ITlF$YKsU1vQ6EVfZmEOLNgP6u3k5QC/BJufmt1hyTXeOHJY=','王希芬','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:43.526495','201711010413','pbkdf2_sha256$150000$yXxYO65iimYy$KFP2mQWgbs/jEVHaV09z2ThnlMUvSl7VnOdF9XjdpfY=','李维新','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:43.713338','201711010416','pbkdf2_sha256$150000$HrHeh1nZaGwD$mW5g3n4ev3eI0T9uWJtoGgpLM9cEwwq53H1NN6CrL7o=','付泽坤','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:43.882368','201711010417','pbkdf2_sha256$150000$5G1TNgfXB0WN$3kBb22+9HUM5j/3JouPJLv2sc5eB+SjCtGyvP6e67Z0=','李晓彤','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:26.782408','201711010420','pbkdf2_sha256$150000$Ik5Boc0PkMqv$bPyxl/WK8S/utVZTW4+QUWsfM4FROtjVSoQHT9BFSGo=','高星霞','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:44.078159','201711010423','pbkdf2_sha256$150000$bnbXI9esKSDc$GnhRDP76i1jtNQJOUDVrB59Tl7gt/QWY2GuRi2yIFKk=','王浩霖','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:36.192105','201711010425','pbkdf2_sha256$150000$6Rks2zxNqXuI$PrgPygYcQj3fg4AmgUpVW+dtpDi11hFHW66Mq5NPoxk=','刘陶然','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:44.231716','201711010426','pbkdf2_sha256$150000$8R3hfRQnE6gG$jEZx1vDdqav7jH0TfBaZuoRUNCGqEEdhGbPC8S/OcVM=','姚明豪','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:36.378277','201711010429','pbkdf2_sha256$150000$aFXx9idHe0G4$t5EIvcdL0L6Fm30uByYN1x9wopbcc4Z9l4dne8cs6u8=','崔文博','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:44.393490','201711010430','pbkdf2_sha256$150000$Ryi1S9qlFGpW$MbrjD1frxvHXj3e2LT+9pTKAMqaO80EUtNCLK/Bgk7Q=','于思敏','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:44.551956','201711010431','pbkdf2_sha256$150000$cgb0IiYUeJYs$MXZhIXT+r9a1jazkpsRyCwfJBhMwX/pNSX3Vg4uduKQ=','杨子歆','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:36.564982','201711010432','pbkdf2_sha256$150000$WuCFHGBEXYb5$iLu9U8SJDIbTFQiKjf4VfTDimZ4S83Sxca0iaumKmU0=','王明璐','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:44.753725','201711010435','pbkdf2_sha256$150000$vPWaL3vveKa9$d0uKyONFrdc4lAVUy7ho5G/Xg1t6LP0R1LshbwTVJ/o=','李志浩','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:36.752067','201711010438','pbkdf2_sha256$150000$d2UFClfv4lSR$hHKKNnPTtA8kDCmvxSHlCwX1YURFjL8ft/bR6EFW7h4=','李敏','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:44.896518','201711010439','pbkdf2_sha256$150000$90nWiJ77ZzIS$CB9m3CQxO0yHUp/V7Te41CYNlfbnm+NPNrb2U0gZdrM=','吴屹霖','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:45.047334','201711010441','pbkdf2_sha256$150000$LRQWJfgFk17X$YY8yG7SuXh2cmGsTXjpKFw+Zhap89RI8q6SMu17a7eY=','王春洋','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:26.985743','201711010442','pbkdf2_sha256$150000$xZK9xUCq7QGD$7Lkja+613KuecNF+P+mhyPFuWFR62KwqgwmLviUb9NQ=','闫昱含','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:45.192690','201711010443','pbkdf2_sha256$150000$BR9yC89ZWlDw$k7oI2hQ1SYh9dtHGUGFsvreVOXe8InIWZ5uBoMDATCM=','陈欣怡','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:36.938687','201711010444','pbkdf2_sha256$150000$2loAiPfRCZSt$UYsqLIS1EEg/clMUvyOpoV8S5fp8bSurNamDYs4DxeY=','骆兴程','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:37.126790','201711010445','pbkdf2_sha256$150000$oCFcUiYLSm8b$1XtW3tFg/YOlks5FL0Zkt9OKZAtCPR2wvoRZJa4DnV8=','魏肖楠','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:45.337440','201711010447','pbkdf2_sha256$150000$F3Amyxltqhzf$CH1j4ceBf6Dpz4uJX9iyjQyyU3vZ3Nl2/d9rGFKTeSc=','刘晋宇','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:27.175289','201711010448','pbkdf2_sha256$150000$3oKI4C57cTCw$bVBuRTst2rGlrymg338ZoyLKU1AFstioWfNQci1uFVI=','张双永','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:45.493387','201711010449','pbkdf2_sha256$150000$0FqVywRWsuNc$vCxuGDmrk02eH5TyHGhzKLOXtBq9TJV9lpeZsprg8Lk=','马瑛瑶','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:45.638051','201711010450','pbkdf2_sha256$150000$od0oFsF8opqF$pg2QjOGtA3Qidy7u+MaaRCkkzHympYw6tB2h3umPC3E=','杨鲁慧','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:45.824848','201711010451','pbkdf2_sha256$150000$j2I81H84NE7r$LWUYxZUNLcr54gCS5Rz7889IuxhNyczO7Pnzbyp1fws=','刘剑','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:27.362963','201711010501','pbkdf2_sha256$150000$XofaUMsSE8Oy$apDXq6wYDcrrD6IbyYNR9hy8QybM9Pbxy8wkOi26gZk=','张晓星','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:27.552136','201711010502','pbkdf2_sha256$150000$fjocNvVr4sLA$/pX09r6yd7iqc24k8dc4hekA6EYNl9qij7mJTCS20Y8=','秦维嘉','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:27.739705','201711010503','pbkdf2_sha256$150000$QULN7GnM2xQc$lCoETuMSWOknn6DTndScp4WkvFQ6HQ4lmCSj0sz+/44=','张学凯','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:45.971758','201711010504','pbkdf2_sha256$150000$rSA4GHrLNFGI$ZRbpBqXwdJdpjFFABtLzPtCdL7IjNg0MCyJcHSJtsRo=','金德虎','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:46.121407','201711010505','pbkdf2_sha256$150000$bumV8fEGcIf9$A/tYMCpwep/mJOwc7j+QeU2n3AySlEsdOJm9oTZwVDw=','张博文','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:27.950739','201711010506','pbkdf2_sha256$150000$gyALlaAUNfd8$CSre0IXBrYynqXLMnhJg88oUryH+PCdzBY7JTSPRoYA=','潘士洁','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:28.159195','201711010507','pbkdf2_sha256$150000$ftIB2nZM5dvY$895m4STiHw2XwUNSlvTMFsRDbwIAON9glWiRCXauyHM=','李文文','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:28.361060','201711010508','pbkdf2_sha256$150000$cyEKdafdAkV8$5JzG+M4oU9u8NNeLCknP4EwxmPZgJaVyK27x4hcvz8s=','柳大壮','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:28.554402','201711010509','pbkdf2_sha256$150000$t2llJ3WIDXs5$nT/8fEYixoxeVhm65qBz5XDD3Uz8e9538ifQKL+hgjQ=','李晨昕','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:46.280031','201711010512','pbkdf2_sha256$150000$8JxxScxNXPjM$IgtqrDb6n2T/OkDh5DeBo1h3RnQs+WaMdntk3dECuuo=','张博','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:28.808187','201711010513','pbkdf2_sha256$150000$iCIA8kc2Fhbf$TCzuLoRjOVPVFVJLaQZvVftq0W95JTTEm+EF9z93R5E=','杨锐卿','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:46.432621','201711010514','pbkdf2_sha256$150000$Rv55lfT8Kon0$u7fMCel+M14gTik0Cz44m9uMuMnYVM81rNvlwEnYKn8=','刘万成','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:46.581996','201711010515','pbkdf2_sha256$150000$jogzu4rQB5A2$Onz5NFAtXbOrjDdR43gwJXl1HqwcGeNaUQn2PqJfEjE=','赵翔宇','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:46.727601','201711010516','pbkdf2_sha256$150000$1cxdeaH2mFel$Yh1KA7llFYDSST1N7ipdyGkhngkYNHP8GhptI+DdZfM=','安歌','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:46.970549','201711010518','pbkdf2_sha256$150000$FidJd0DzjVWT$pTFhFePraf1eP9RJ18n74KTzn8nUOhE5r2bfi4mon1I=','卜德敏','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:37.312588','201711010519','pbkdf2_sha256$150000$9zEY0N4eKWHD$ZANoB1kkXYaYZ3p318d37FTVeNCbErgvjSgYrQIJpIo=','孙宝泉','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:37.501512','201711010521','pbkdf2_sha256$150000$JNOkNRrzMPGM$VgKr0x3E0mHm2I+ZWIg2SYLNSgnp3XFv+0VW1O9JtTk=','吕秋钰','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:28.999970','201711010522','pbkdf2_sha256$150000$ZbtwZXCvUHXm$nWUNQciCb4ElygZnOvhcdvutWohALgdk+lSlDW1+BAk=','姜鑫','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:47.115570','201711010523','pbkdf2_sha256$150000$XD3Dg4zmGeg1$IFgh4EbKRu6RTwCLjexfau/RmpA3Vg4JgcaEJK/SdKk=','王艺博','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:29.189702','201711010525','pbkdf2_sha256$150000$HR3cUvxLAIiP$asv3qclP33a3SXSHCQYSU1pAjPVk4JWEsqJpn7LX03g=','杨金浩','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:37.687815','201711010526','pbkdf2_sha256$150000$5h9OL0ImcGGy$D5f1X3WXa4kDSgna5oxj6qTVpozx1gJojbqDf7IdYgs=','魏国津','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:37.874496','201711010527','pbkdf2_sha256$150000$RHEU63HQaYyT$scG2WL03EwoLz8I06aOkbYupFV0orBVxERih3j3B8xA=','刘家璇','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:38.062249','201711010528','pbkdf2_sha256$150000$sVbo9Hp3j5w6$hfI7rqjbpxURQUVym3TC0QcvTlPddBne/Ij56mNEzqw=','刘增强','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:29.378464','201711010529','pbkdf2_sha256$150000$BKK2bzI9rJ7o$JR5VM4w2Lslt6SJ+zL4gv/4yZ/+lVG3EzcrHE533ccM=','刘振涛','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:47.267027','201711010531','pbkdf2_sha256$150000$Znfcmlt3QoX7$cbNL8AyZi3fGiU3h5o3ERgEcEc5JsSHPf6jYf/7N7rs=','魏馨','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:47.418225','201711010532','pbkdf2_sha256$150000$sYXMXCKW1vpi$H+dMLrZDjs+yPodIvMfzOICjiFLH0ijz0sBvP2ZO9PM=','冯琦','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:47.568714','201711010534','pbkdf2_sha256$150000$ImeZVlN8UNuh$Bcz7Zcf8ylUHy1l8Ai9GDkB40LDLFsLEQk9yI0Uhilg=','韩令锋','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1703','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:38.250906','201711010535','pbkdf2_sha256$150000$eRjYMFmGr1M9$32/DNOHkirZIbxYkCa8EOXdimlWkm9dFDWh7aEH2lvY=','孙雨','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-18 06:35:47.722394','201711010536','pbkdf2_sha256$150000$CaruZxeNGSbB$vTWHO8ob/tsSWUb9kgpZOJ4nVsKjlyJiW1dxUWrT8vo=','范旗轩','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1704','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:29.571774','201711010537','pbkdf2_sha256$150000$Ow9G8BykikKV$irJnY7+MpoIE8xKnOx8P3Amv9GspC9ta6eD2P3NWuAo=','杨力','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:38.439421','201711010538','pbkdf2_sha256$150000$F2Fv5VblS9Rv$7s6dNG3K2sbFpWgoTcaRGcOrabw0GVWRR5y0QzDfesw=','王一企','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:29.766873','201711010539','pbkdf2_sha256$150000$h85mWqGCdfCY$wi4JHo6w9Ei1cCIr4FvAkHg08RaJtfDh2QbK7tXNa6I=','杨保亮','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:38.628601','201711010540','pbkdf2_sha256$150000$gzmoNjasQmVo$nlimt76pKL56sAtPkuwtzIMlqZydAou0mcHEAB1BbLg=','贾智翔','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:38.818962','201711010541','pbkdf2_sha256$150000$ofkrIKnSfLKc$2l9rsdvWbL+T/uGt5+ej/zVLptEAAF+GBOfgg8+LEUw=','杨欣琪','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:29.984110','201711010543','pbkdf2_sha256$150000$5ag5W2p8DPyn$XznRb6iFHUBTM7XVq4bChUZzhexgTW4Ar8TsVlLGpbA=','张鹤瀚','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:39.008761','201711010544','pbkdf2_sha256$150000$duS40DAXsXcV$UiZFHngT+iAe2J+Wsa8cEuMTo7AS8t3j3Bkn4xttrkw=','周芳雨','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:39.208816','201711010548','pbkdf2_sha256$150000$YV8wEZuRdydn$sgijuh/hcjxdMNaAOrYxp2qFl1YcZdPsQ52fTv+AbsE=','杨月清','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:39.405984','201711010550','pbkdf2_sha256$150000$D46yOZOBeWDb$mGw7qLkfb1FKoVU2uj9QlqP77DTs0aqZOJ56y/WLce8=','徐芊卉','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:39.595445','201711010552','pbkdf2_sha256$150000$ovPghwNVUShD$JhYMO4uuqIiWv0sZk+PJzgWY2ZYOaZbR88CKOSF4MYs=','周亚芳','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:30.178898','201711010558','pbkdf2_sha256$150000$0BPogyHJM696$hZ6+QaEVSaJ+LMPDam4vHwJARMK3zNLfZuBawEr5nmg=','杨永娇','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:39.786104','201711030315','pbkdf2_sha256$150000$WGsh8yCmcIUZ$nTWBB58SBU9YW/yj/8y3uPkvIhFS3RHpy27+GDul7Lg=','胡晓文','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:30.374794','201714030133','pbkdf2_sha256$150000$QeJJH6UT1hag$GCNN1h8zZlBW0MLSIgEl9KB3/BlonzcHVxEJr9yB0cE=','周逢玺','','男','信息科学与工程学院','计算机科学与技术（非师范）','计工本1701','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:39.975120','201724010206','pbkdf2_sha256$150000$Kr6BAUkX1edO$dqOA1jDZBWB6eskJLyfn3ay19Hz9IThPaFcXyJ4+eI8=','马驰','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:35:40.164037','201724020236','pbkdf2_sha256$150000$gxGNQz83iOGu$SYMbe/vulmT6N1igWmggkBLrit2sg8VpyYyBPLohp0o=','段佳伟','','女','信息科学与工程学院','计算机科学与技术（非师范）','计工本1702','2017-09-01',0),(NULL,0,'','','',0,1,'2019-12-10 08:51:44.092489','215002','pbkdf2_sha256$150000$wYjkiCCAus49$rjZAF19T+x2Y6rmrF3c41iNg+a29zinzCK/aMkWLego=','段会川','','','信息科学与工程学院','计算机教学1系','副教授','2019-12-10',1),(NULL,0,'','','',0,1,'2019-12-18 12:23:18.064740','614066','pbkdf2_sha256$150000$eFJaAvWBCqzR$Eeqf2I0+fwFBWbWoUfOvII7K+DhNYc24ZcCFKuQdSmE=','吕蕾','','','信息科学与工程学院','计算机教学1系','副教授','2019-12-18',1),('2019-12-17 13:33:01.227885',0,'','','',0,1,'2019-12-17 13:11:49.021345','615056','pbkdf2_sha256$150000$sWA3SzeveNR1$e/GlX/DS5goVfAqsVU38ikfmroR50sksA93zOcmXqD4=','吕晨','','','信息科学与工程学院','计算机教学1系','副教授','2019-12-17',1),(NULL,0,'','','',0,1,'2019-12-13 13:08:51.893932','617074','pbkdf2_sha256$150000$ppfQk9m853Bw$+zm1zgCsMjAZ65uWoYsaIBV5oy3f4Z2Jn64X9qovqxs=','张庆科','','男','信息科学与工程学院','计算机教学1系','讲师','2017-09-01',1),(NULL,0,'','','',0,1,'2019-12-18 12:28:15.854359','617078','pbkdf2_sha256$150000$K31FOFwVJy1W$VqSoCsKAc/F4EbL1NpFnYds0O7grme3cO00HnBLfZvk=','翟仑','','','信息科学与工程学院','计算机教学1系','讲师','2019-12-18',1),(NULL,0,'','','',0,1,'2019-12-18 12:50:55.816080','617080','pbkdf2_sha256$150000$qa0SXxoj0GXn$/Em7aq478EG2ogbZVII6b7JrYnzd74MsquPFIwE40R0=','王琳','','','信息科学与工程学院','通信工程','讲师','2019-12-18',1),('2019-12-13 07:02:23.567938',0,'','','',0,1,'2019-12-10 09:03:34.818889','618140','pbkdf2_sha256$150000$XTKHbp3IQV1Z$YErzFMrpR5olPzBZT4TTpoBb+jHQG9nswowKNgDbVsM=','李晓洁','','','信息科学与工程学院','计算机教学1系','讲师','2019-12-10',1),(NULL,0,'','','',0,1,'2019-12-18 12:23:31.779881','618142','pbkdf2_sha256$150000$8hzkuQxupoJk$wFUsW5X+7etCKVQy8H2uHpJZZ0TurC8cC+n29JZLaZ4=','张凯','','','信息科学与工程学院','计算机教学1系','讲师','2019-12-18',1),(NULL,0,'','','',0,1,'2019-12-18 12:48:48.559305','701031','pbkdf2_sha256$150000$VNrSEez96K3x$W9n4lXzNJY56saB1UKWOSbtvqocT9rjsofJaVYudKOM=','李圣涛','','','信息科学与工程学院','计算机教学2系','讲师','2019-12-18',1),('2019-12-18 14:25:24.905147',1,'','','',1,1,'2019-12-10 07:57:34.483833','admin','pbkdf2_sha256$150000$LDdF9ZzPpREH$/Asmfjd27opIOUkgvALNoRCE3rcRZy9WqtMsHIFELwQ=','','','','','','','2019-12-10',0);
/*!40000 ALTER TABLE `account_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_user_groups`
--

DROP TABLE IF EXISTS `account_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `account_user_groups_user_id_group_id_4d09af3e_uniq` (`user_id`,`group_id`) USING BTREE,
  KEY `account_user_groups_group_id_6c71f749_fk_auth_group_id` (`group_id`) USING BTREE,
  CONSTRAINT `account_user_groups_group_id_6c71f749_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `account_user_groups_user_id_14345e7b_fk_account_user_username` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_user_groups`
--

LOCK TABLES `account_user_groups` WRITE;
/*!40000 ALTER TABLE `account_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_user_user_permissions`
--

DROP TABLE IF EXISTS `account_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `account_user_user_permis_user_id_permission_id_48bdd28b_uniq` (`user_id`,`permission_id`) USING BTREE,
  KEY `account_user_user_pe_permission_id_66c44191_fk_auth_perm` (`permission_id`) USING BTREE,
  CONSTRAINT `account_user_user_pe_permission_id_66c44191_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `account_user_user_pe_user_id_cc42d270_fk_account_u` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_user_user_permissions`
--

LOCK TABLES `account_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `account_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_user_view`
--

DROP TABLE IF EXISTS `account_user_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account_user_view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_user_view`
--

LOCK TABLES `account_user_view` WRITE;
/*!40000 ALTER TABLE `account_user_view` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_user_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`) USING BTREE,
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can view permission',1,'view_permission'),(5,'Can add group',2,'add_group'),(6,'Can change group',2,'change_group'),(7,'Can delete group',2,'delete_group'),(8,'Can view group',2,'view_group'),(9,'Can add content type',3,'add_contenttype'),(10,'Can change content type',3,'change_contenttype'),(11,'Can delete content type',3,'delete_contenttype'),(12,'Can view content type',3,'view_contenttype'),(13,'Can add classroom',4,'add_classroom'),(14,'Can change classroom',4,'change_classroom'),(15,'Can delete classroom',4,'delete_classroom'),(16,'Can view classroom',4,'view_classroom'),(17,'Can add course',5,'add_course'),(18,'Can change course',5,'change_course'),(19,'Can delete course',5,'delete_course'),(20,'Can view course',5,'view_course'),(21,'Can add select course',6,'add_selectcourse'),(22,'Can change select course',6,'change_selectcourse'),(23,'Can delete select course',6,'delete_selectcourse'),(24,'Can view select course',6,'view_selectcourse'),(25,'Can add student select course',7,'add_studentselectcourse'),(26,'Can change student select course',7,'change_studentselectcourse'),(27,'Can delete student select course',7,'delete_studentselectcourse'),(28,'Can view student select course',7,'view_studentselectcourse'),(29,'Can add abnormal',8,'add_abnormal'),(30,'Can change abnormal',8,'change_abnormal'),(31,'Can delete abnormal',8,'delete_abnormal'),(32,'Can view abnormal',8,'view_abnormal'),(33,'Can add card',9,'add_card'),(34,'Can change card',9,'change_card'),(35,'Can delete card',9,'delete_card'),(36,'Can view card',9,'view_card'),(37,'Can add user view',10,'add_userview'),(38,'Can change user view',10,'change_userview'),(39,'Can delete user view',10,'delete_userview'),(40,'Can view user view',10,'view_userview'),(41,'Can add user',11,'add_user'),(42,'Can change user',11,'change_user'),(43,'Can delete user',11,'delete_user'),(44,'Can view user',11,'view_user'),(45,'Can add log entry',12,'add_logentry'),(46,'Can change log entry',12,'change_logentry'),(47,'Can delete log entry',12,'delete_logentry'),(48,'Can view log entry',12,'view_logentry'),(49,'Can add session',13,'add_session'),(50,'Can change session',13,'change_session'),(51,'Can delete session',13,'delete_session'),(52,'Can view session',13,'view_session'),(53,'Can add stu user view',10,'add_stuuserview'),(54,'Can change stu user view',10,'change_stuuserview'),(55,'Can delete stu user view',10,'delete_stuuserview'),(56,'Can view stu user view',10,'view_stuuserview'),(57,'Can add score calculate view',14,'add_scorecalculateview'),(58,'Can change score calculate view',14,'change_scorecalculateview'),(59,'Can delete score calculate view',14,'delete_scorecalculateview'),(60,'Can view score calculate view',14,'view_scorecalculateview');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`) USING BTREE,
  KEY `django_admin_log_user_id_c564eba6_fk_account_user_username` (`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_account_user_username` FOREIGN KEY (`user_id`) REFERENCES `account_user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (8,'account','abnormal'),(9,'account','card'),(14,'account','scorecalculateview'),(10,'account','stuuserview'),(11,'account','user'),(12,'admin','logentry'),(2,'auth','group'),(1,'auth','permission'),(3,'contenttypes','contenttype'),(4,'edu_admin','classroom'),(5,'edu_admin','course'),(6,'edu_admin','selectcourse'),(7,'edu_admin','studentselectcourse'),(13,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-12-10 06:26:39.644597'),(2,'contenttypes','0002_remove_content_type_name','2019-12-10 06:26:39.745328'),(3,'auth','0001_initial','2019-12-10 06:26:39.819130'),(4,'auth','0002_alter_permission_name_max_length','2019-12-10 06:26:40.061482'),(5,'auth','0003_alter_user_email_max_length','2019-12-10 06:26:40.067466'),(6,'auth','0004_alter_user_username_opts','2019-12-10 06:26:40.073450'),(7,'auth','0005_alter_user_last_login_null','2019-12-10 06:26:40.079434'),(8,'auth','0006_require_contenttypes_0002','2019-12-10 06:26:40.082427'),(9,'auth','0007_alter_validators_add_error_messages','2019-12-10 06:26:40.087413'),(10,'auth','0008_alter_user_username_max_length','2019-12-10 06:26:40.093397'),(11,'auth','0009_alter_user_last_name_max_length','2019-12-10 06:26:40.099381'),(12,'auth','0010_alter_group_name_max_length','2019-12-10 06:26:40.113343'),(13,'auth','0011_update_proxy_permissions','2019-12-10 06:26:40.122320'),(14,'account','0001_initial','2019-12-10 06:26:40.299845'),(15,'edu_admin','0001_initial','2019-12-10 06:26:57.267552'),(16,'admin','0001_initial','2019-12-10 06:27:08.891036'),(17,'admin','0002_logentry_remove_auto_add','2019-12-10 06:27:08.999745'),(18,'admin','0003_logentry_add_action_flag_choices','2019-12-10 06:27:09.008750'),(19,'sessions','0001_initial','2019-12-10 06:27:09.036647'),(20,'account','0002_auto_20191211_2213','2019-12-11 14:14:05.934310'),(21,'edu_admin','0002_studentselectcourse_course_id','2019-12-12 01:54:08.754328'),(22,'edu_admin','0003_course_description','2019-12-12 01:56:01.858492'),(23,'account','0003_scorecalculateview','2019-12-12 03:12:52.377596');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  KEY `django_session_expire_date_a5c62663` (`expire_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0pwl9qtor5xiostr0am2fahfjt7labrh','MDYxMWFlYzM0MTI5M2Y5MGI4ZjlkYjQ1OWQ5YTc0NTlkMDUzNTI4NDp7Il9hdXRoX3VzZXJfaWQiOiJhZG1pbiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTA0OGM2OTY1NGM5YWZiMjE0NDc3YzdlOTlhZmVlMTY0MDUzOTljMSIsInVzZXJuYW1lIjoiYWRtaW4iLCJuYW1lIjoiIiwic2Nob29sIjoiIiwibWFqb3IiOiIiLCJzY2xhc3MiOiIifQ==','2019-12-31 13:11:07.403333'),('3oxmoxc4sw1ye8vhpis29r4kzb0t62s8','YzM4ZGY2ZmNhYWU3Y2NmMjdlYTA1NGE1Yjk2ZGJjNGE0ZTM4NWU3Zjp7fQ==','2019-12-31 08:04:55.424963'),('3yxgoviw9un48ujfbgs5jmd0uu5vrx0g','YzM4ZGY2ZmNhYWU3Y2NmMjdlYTA1NGE1Yjk2ZGJjNGE0ZTM4NWU3Zjp7fQ==','2019-12-31 07:06:25.056207'),('7ube438vtlk00ner4cmq3jhhfck94hz4','MTljYjcwYjdlZTNjODQxNjkxNzEwMzA2NTdlZGMyNjk5ZmRiZTQ4YTp7Il9hdXRoX3VzZXJfaWQiOiIyMDE3MTEwMTAyMDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjEzZThhODdmNmY3OGQ5MzY5Njc2YzRjODEyMmE5NTc5ZWUwNjVjMTMiLCJ1c2VybmFtZSI6IjIwMTcxMTAxMDIwMiIsIm5hbWUiOiJcdTczOGJcdTZjNWRcdTgyYjgiLCJzY2hvb2wiOiJcdTRmZTFcdTYwNmZcdTc5ZDFcdTViNjZcdTRlMGVcdTVkZTVcdTdhMGJcdTViNjZcdTk2NjIiLCJtYWpvciI6Ilx1OGJhMVx1N2I5N1x1NjczYVx1NzlkMVx1NWI2Nlx1NGUwZVx1NjI4MFx1NjcyZlx1ZmYwOFx1OTc1ZVx1NWUwOFx1ODMwM1x1ZmYwOSIsInNjbGFzcyI6Ilx1OGJhMVx1NWRlNVx1NjcyYzE3MDIifQ==','2020-01-01 12:00:13.157576'),('bpyq14nucslbste0nyahf7jb7fiqd4jb','MTFhOTI3ZGUyNjU5ODZkNGM2MTE2MDFiZDUxMTYwN2E2ODE0NTAzNTp7Il9hdXRoX3VzZXJfaWQiOiIxMTEwNTciLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImJhNDQ2MGFmMzE3ZTJiN2ZlMGZiMTc0ZDQ4ZjgyZTA0YzA1NWU0YjAiLCJ1c2VybmFtZSI6IjExMTA1NyIsIm5hbWUiOiJcdTViNTlcdThkYzNcdTljODEiLCJzY2hvb2wiOiJcdTRmZTFcdTYwNmZcdTc5ZDFcdTViNjZcdTRlMGVcdTVkZTVcdTdhMGJcdTViNjZcdTk2NjIiLCJtYWpvciI6Ilx1OGJhMVx1N2I5N1x1NjczYVx1NjU1OVx1NWI2NjFcdTdjZmIiLCJzY2xhc3MiOiJcdTUyNmZcdTY1NTlcdTYzODgifQ==','2019-12-31 13:14:25.663850'),('f3jraw1j6u8h11gbluo81ghpvvtw9a7u','MDYxMWFlYzM0MTI5M2Y5MGI4ZjlkYjQ1OWQ5YTc0NTlkMDUzNTI4NDp7Il9hdXRoX3VzZXJfaWQiOiJhZG1pbiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTA0OGM2OTY1NGM5YWZiMjE0NDc3YzdlOTlhZmVlMTY0MDUzOTljMSIsInVzZXJuYW1lIjoiYWRtaW4iLCJuYW1lIjoiIiwic2Nob29sIjoiIiwibWFqb3IiOiIiLCJzY2xhc3MiOiIifQ==','2020-01-01 12:02:54.165671'),('h3h7gojd6kx90f8bzx1m7uybr5rojtgc','NDczODhjMDdjNGE0NjY3NzFhODRlNjYwMmViNTVlNzM1MGJkNTg2Njp7Il9hdXRoX3VzZXJfaWQiOiJhZG1pbiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTAxNmJhZmMwZWE1MjUyMzJlNjdkMTk4NzA0YmZjNDc1NmE2ZDJmMCIsInVzZXJuYW1lIjoiYWRtaW4iLCJuYW1lIjoiIiwic2Nob29sIjoiIiwibWFqb3IiOiIiLCJzY2xhc3MiOiIifQ==','2019-12-27 13:53:57.930826'),('haya1279w8lbh84i0gita4tsi4wm0s92','MDYxMWFlYzM0MTI5M2Y5MGI4ZjlkYjQ1OWQ5YTc0NTlkMDUzNTI4NDp7Il9hdXRoX3VzZXJfaWQiOiJhZG1pbiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTA0OGM2OTY1NGM5YWZiMjE0NDc3YzdlOTlhZmVlMTY0MDUzOTljMSIsInVzZXJuYW1lIjoiYWRtaW4iLCJuYW1lIjoiIiwic2Nob29sIjoiIiwibWFqb3IiOiIiLCJzY2xhc3MiOiIifQ==','2020-01-01 14:25:24.927111'),('ka6yhmkk4f1h4ttp85a0p9cvxjqa1h3n','NDczODhjMDdjNGE0NjY3NzFhODRlNjYwMmViNTVlNzM1MGJkNTg2Njp7Il9hdXRoX3VzZXJfaWQiOiJhZG1pbiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMTAxNmJhZmMwZWE1MjUyMzJlNjdkMTk4NzA0YmZjNDc1NmE2ZDJmMCIsInVzZXJuYW1lIjoiYWRtaW4iLCJuYW1lIjoiIiwic2Nob29sIjoiIiwibWFqb3IiOiIiLCJzY2xhc3MiOiIifQ==','2019-12-26 03:32:28.869174'),('l09k33g75uhqw444upp9lqd13vfchmdo','MTljYjcwYjdlZTNjODQxNjkxNzEwMzA2NTdlZGMyNjk5ZmRiZTQ4YTp7Il9hdXRoX3VzZXJfaWQiOiIyMDE3MTEwMTAyMDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjEzZThhODdmNmY3OGQ5MzY5Njc2YzRjODEyMmE5NTc5ZWUwNjVjMTMiLCJ1c2VybmFtZSI6IjIwMTcxMTAxMDIwMiIsIm5hbWUiOiJcdTczOGJcdTZjNWRcdTgyYjgiLCJzY2hvb2wiOiJcdTRmZTFcdTYwNmZcdTc5ZDFcdTViNjZcdTRlMGVcdTVkZTVcdTdhMGJcdTViNjZcdTk2NjIiLCJtYWpvciI6Ilx1OGJhMVx1N2I5N1x1NjczYVx1NzlkMVx1NWI2Nlx1NGUwZVx1NjI4MFx1NjcyZlx1ZmYwOFx1OTc1ZVx1NWUwOFx1ODMwM1x1ZmYwOSIsInNjbGFzcyI6Ilx1OGJhMVx1NWRlNVx1NjcyYzE3MDIifQ==','2020-01-01 12:57:23.705111'),('ln9fhlhxlczlds3nocvw4qn57cebcb5x','YzM4ZGY2ZmNhYWU3Y2NmMjdlYTA1NGE1Yjk2ZGJjNGE0ZTM4NWU3Zjp7fQ==','2019-12-31 07:22:56.199009'),('n13uh64m77oxpvlq717jz0t61g8hcun8','YzM4ZGY2ZmNhYWU3Y2NmMjdlYTA1NGE1Yjk2ZGJjNGE0ZTM4NWU3Zjp7fQ==','2019-12-31 07:14:51.594677'),('pgn4vglm1iqxvk7sbgggnoc5da4c4xoo','YzM4ZGY2ZmNhYWU3Y2NmMjdlYTA1NGE1Yjk2ZGJjNGE0ZTM4NWU3Zjp7fQ==','2019-12-31 07:18:43.744937'),('pms42cmraqwno172fsrwx4fqjara1ci9','MTljYjcwYjdlZTNjODQxNjkxNzEwMzA2NTdlZGMyNjk5ZmRiZTQ4YTp7Il9hdXRoX3VzZXJfaWQiOiIyMDE3MTEwMTAyMDIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjEzZThhODdmNmY3OGQ5MzY5Njc2YzRjODEyMmE5NTc5ZWUwNjVjMTMiLCJ1c2VybmFtZSI6IjIwMTcxMTAxMDIwMiIsIm5hbWUiOiJcdTczOGJcdTZjNWRcdTgyYjgiLCJzY2hvb2wiOiJcdTRmZTFcdTYwNmZcdTc5ZDFcdTViNjZcdTRlMGVcdTVkZTVcdTdhMGJcdTViNjZcdTk2NjIiLCJtYWpvciI6Ilx1OGJhMVx1N2I5N1x1NjczYVx1NzlkMVx1NWI2Nlx1NGUwZVx1NjI4MFx1NjcyZlx1ZmYwOFx1OTc1ZVx1NWUwOFx1ODMwM1x1ZmYwOSIsInNjbGFzcyI6Ilx1OGJhMVx1NWRlNVx1NjcyYzE3MDIifQ==','2019-12-31 13:28:32.988089'),('xd1h1lochmkfpnlcrpqvp46cqqtx6et1','MDYxMWFlYzM0MTI5M2Y5MGI4ZjlkYjQ1OWQ5YTc0NTlkMDUzNTI4NDp7Il9hdXRoX3VzZXJfaWQiOiJhZG1pbiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTA0OGM2OTY1NGM5YWZiMjE0NDc3YzdlOTlhZmVlMTY0MDUzOTljMSIsInVzZXJuYW1lIjoiYWRtaW4iLCJuYW1lIjoiIiwic2Nob29sIjoiIiwibWFqb3IiOiIiLCJzY2xhc3MiOiIifQ==','2020-01-01 12:09:31.967114'),('zklpxdmhznhhveujv670botfce60cxbg','YzM4ZGY2ZmNhYWU3Y2NmMjdlYTA1NGE1Yjk2ZGJjNGE0ZTM4NWU3Zjp7fQ==','2019-12-31 07:06:39.906712');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_admin_classroom`
--

DROP TABLE IF EXISTS `edu_admin_classroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `edu_admin_classroom` (
  `room_id` varchar(20) NOT NULL,
  `place` varchar(50) NOT NULL,
  `number` int(11) NOT NULL,
  `owner` varchar(20) NOT NULL,
  PRIMARY KEY (`room_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_admin_classroom`
--

LOCK TABLES `edu_admin_classroom` WRITE;
/*!40000 ALTER TABLE `edu_admin_classroom` DISABLE KEYS */;
INSERT INTO `edu_admin_classroom` VALUES ('1-C-127','文渊楼C座127',200,'山师'),('1-C-129','文渊楼C座129',300,'山师'),('1-C-255','文渊楼C座255',200,'山师'),('1-C-333','文渊楼C座333',200,'山师'),('1-C-348','文渊楼C座348',200,'山师'),('1-C-411','文渊楼C座411',200,'山师'),('1-C-569','文渊楼C座569',200,'山师'),('2-1-106','文宗座1-106',200,'山师'),('2-1-109','文宗楼1-109',180,'信工');
/*!40000 ALTER TABLE `edu_admin_classroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_admin_course`
--

DROP TABLE IF EXISTS `edu_admin_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `edu_admin_course` (
  `course_id` varchar(20) NOT NULL,
  `course_name` varchar(20) NOT NULL,
  `course_belong` varchar(50) DEFAULT NULL,
  `credit` int(11) NOT NULL,
  `course_char` varchar(20) NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`course_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_admin_course`
--

LOCK TABLES `edu_admin_course` WRITE;
/*!40000 ALTER TABLE `edu_admin_course` DISABLE KEYS */;
INSERT INTO `edu_admin_course` VALUES ('161130205','计算机网络','专业课',4,'必修',''),('161130206','计算机组成原理','专业课',4,'必修',''),('161130303','软件工程','专业课',4,'必修',''),('161130306','算法分析与设计','专业课',3,'必修',''),('161130308','专业英语','专业课',2,'限选',''),('161130309','人工智能导论','专业课',2,'限选',''),('161130318','计算方法','专业课',4,'限选',''),('161130331','Android平台与开发技术','专业课',3,'限选',''),('161130340','数字图像处理','专业课',3,'限选',''),('161130354','XML技术','专业课',3,'限选',''),('161130355','HTML5技术与应用','专业课',3,'限选','');
/*!40000 ALTER TABLE `edu_admin_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_admin_selectcourse`
--

DROP TABLE IF EXISTS `edu_admin_selectcourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `edu_admin_selectcourse` (
  `select_course_id` varchar(50) NOT NULL,
  `course_num` int(11) NOT NULL,
  `course_remain` int(11) NOT NULL,
  `time` varchar(50) NOT NULL,
  `term` varchar(50) NOT NULL,
  `scclass` varchar(100) DEFAULT NULL,
  `course_id_id` varchar(20) NOT NULL,
  `place_id_id` varchar(20) NOT NULL,
  `teacher_id_id` varchar(20) NOT NULL,
  PRIMARY KEY (`select_course_id`) USING BTREE,
  KEY `edu_admin_selectcour_course_id_id_88a11194_fk_edu_admin` (`course_id_id`) USING BTREE,
  KEY `edu_admin_selectcour_place_id_id_4ace9cb6_fk_edu_admin` (`place_id_id`) USING BTREE,
  KEY `edu_admin_selectcour_teacher_id_id_532e1afa_fk_account_u` (`teacher_id_id`) USING BTREE,
  CONSTRAINT `edu_admin_selectcour_course_id_id_88a11194_fk_edu_admin` FOREIGN KEY (`course_id_id`) REFERENCES `edu_admin_course` (`course_id`),
  CONSTRAINT `edu_admin_selectcour_place_id_id_4ace9cb6_fk_edu_admin` FOREIGN KEY (`place_id_id`) REFERENCES `edu_admin_classroom` (`room_id`),
  CONSTRAINT `edu_admin_selectcour_teacher_id_id_532e1afa_fk_account_u` FOREIGN KEY (`teacher_id_id`) REFERENCES `account_user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_admin_selectcourse`
--

LOCK TABLES `edu_admin_selectcourse` WRITE;
/*!40000 ALTER TABLE `edu_admin_selectcourse` DISABLE KEYS */;
INSERT INTO `edu_admin_selectcourse` VALUES ('(2019-2020-1)-161130205-111057-1',200,198,'周一第1,2节;周三第1,2节{第1-18周}','2019-2020-1','','161130205','2-1-109','111057'),('(2019-2020-1)-161130206-617078-2',200,200,'周一第1,2节;周三第1,2节{第1-18周}','2019-2020-1','[\'计工本1704\', \'计信本1701\']','161130206','2-1-106','617078'),('(2019-2020-1)-161130206-617080-1',200,200,'周一第3,4节;周三第3,4节{第1-18周}','2019-2020-1','[\'计工本1701\', \'计工本1702\']','161130206','1-C-127','617080'),('(2019-2020-1)-161130303-111061-1',200,200,'周四第1,2节;周五第1,2节{第1-18周}','2019-2020-1','[\'计工本1701\', \'计工本1702\', \'计工本1703\', \'计工本1704\', \'计信本1701\']','161130303','1-C-333','111061'),('(2019-2020-1)-161130306-215002-1',300,300,'周二第9,10节;{第1-18周}','2019-2020-1','','161130306','1-C-129','215002'),('(2019-2020-1)-161130308-618140-1',200,200,'周一第7,8节;{第1-18周}','2019-2020-1','[\'计工本1701\', \'计工本1702\', \'计工本1703\', \'计工本1704\', \'计信本1701\', \'计本1701\']','161130308','1-C-411','618140'),('(2019-2020-1)-161130309-618140-1',200,200,'周三第7,8节;{第1-18周}','2019-2020-1','[\'计工本1701\', \'计工本1702\', \'计工本1703\', \'计工本1704\', \'计信本1701\', \'计本1701\']','161130309','1-C-348','618140'),('(2019-2020-1)-161130318-701031-1',200,200,'周二第5,6节;{第1-18周}','2019-2020-1','[\'计工本1703\', \'计工本1704\']','161130318','1-C-255','701031'),('(2019-2020-1)-161130331-111116-1',150,150,'周五第3,4节;{第1-18周}','2019-2020-1','[\'计工本1701\', \'计工本1702\', \'计工本1703\', \'计工本1704\']','161130331','2-1-106','111116'),('(2019-2020-1)-161130340-618142-1',150,150,'周一第9,10节;{第1-18周}','2019-2020-1','[\'计工本1701\', \'计工本1702\', \'计工本1703\', \'计工本1704\', \'计信本1701\']','161130340','2-1-109','618142'),('(2019-2020-1)-161130354-111001-1',200,200,'周二第1,2节;{第1-18周}','2019-2020-1','[\'计工本1701\', \'计工本1702\', \'计工本1703\', \'计工本1704\']','161130354','1-C-569','111001'),('(2019-2020-1)-161130355-614066-1',200,200,'周三第9,10节;{第1-18周}','2019-2020-1','[\'计工本1701\', \'计工本1702\', \'计工本1703\', \'计工本1704\', \'计信本1701\']','161130355','1-C-127','614066');
/*!40000 ALTER TABLE `edu_admin_selectcourse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edu_admin_studentselectcourse`
--

DROP TABLE IF EXISTS `edu_admin_studentselectcourse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `edu_admin_studentselectcourse` (
  `select_id` varchar(50) NOT NULL,
  `score` int(11) DEFAULT NULL,
  `is_reread` tinyint(1) NOT NULL,
  `select_course_id_id` varchar(50) NOT NULL,
  `student_id_id` varchar(20) NOT NULL,
  `course_id_id` varchar(20) NOT NULL,
  PRIMARY KEY (`select_id`) USING BTREE,
  KEY `edu_admin_studentsel_select_course_id_id_e88e04ef_fk_edu_admin` (`select_course_id_id`) USING BTREE,
  KEY `edu_admin_studentsel_student_id_id_83153dd2_fk_account_u` (`student_id_id`) USING BTREE,
  KEY `edu_admin_studentsel_course_id_id_ed741176_fk_edu_admin` (`course_id_id`),
  CONSTRAINT `edu_admin_studentsel_course_id_id_ed741176_fk_edu_admin` FOREIGN KEY (`course_id_id`) REFERENCES `edu_admin_course` (`course_id`),
  CONSTRAINT `edu_admin_studentsel_select_course_id_id_e88e04ef_fk_edu_admin` FOREIGN KEY (`select_course_id_id`) REFERENCES `edu_admin_selectcourse` (`select_course_id`),
  CONSTRAINT `edu_admin_studentsel_student_id_id_83153dd2_fk_account_u` FOREIGN KEY (`student_id_id`) REFERENCES `account_user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edu_admin_studentselectcourse`
--

LOCK TABLES `edu_admin_studentselectcourse` WRITE;
/*!40000 ALTER TABLE `edu_admin_studentselectcourse` DISABLE KEYS */;
/*!40000 ALTER TABLE `edu_admin_studentselectcourse` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Sdu_add_course` BEFORE INSERT ON `edu_admin_studentselectcourse` FOR EACH ROW BEGIN

UPDATE edu_admin_selectcourse

set course_remain=course_remain-1

where  select_course_id=new.select_course_id_id;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Sdu_del_course` AFTER DELETE ON `edu_admin_studentselectcourse` FOR EACH ROW BEGIN

UPDATE edu_admin_selectcourse

set course_remain=course_remain+1

where  select_course_id=old.select_course_id_id;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `score_claculate_view`
--

DROP TABLE IF EXISTS `score_claculate_view`;
/*!50001 DROP VIEW IF EXISTS `score_claculate_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `score_claculate_view` AS SELECT 
 1 AS `score`,
 1 AS `student_id_id`,
 1 AS `select_course_id`,
 1 AS `course_num`,
 1 AS `select_course_id_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `stu_tea_cou_view`
--

DROP TABLE IF EXISTS `stu_tea_cou_view`;
/*!50001 DROP VIEW IF EXISTS `stu_tea_cou_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `stu_tea_cou_view` AS SELECT 
 1 AS `teacher_id_id`,
 1 AS `select_id`,
 1 AS `score`,
 1 AS `is_reread`,
 1 AS `select_course_id_id`,
 1 AS `student_id_id`,
 1 AS `course_id_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `stu_user_view`
--

DROP TABLE IF EXISTS `stu_user_view`;
/*!50001 DROP VIEW IF EXISTS `stu_user_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `stu_user_view` AS SELECT 
 1 AS `username`,
 1 AS `name`,
 1 AS `school`,
 1 AS `major`,
 1 AS `sclass`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `score_claculate_view`
--

/*!50001 DROP VIEW IF EXISTS `score_claculate_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `score_claculate_view` AS select `edu_admin_studentselectcourse`.`score` AS `score`,`edu_admin_studentselectcourse`.`student_id_id` AS `student_id_id`,`edu_admin_selectcourse`.`select_course_id` AS `select_course_id`,`edu_admin_selectcourse`.`course_num` AS `course_num`,`edu_admin_studentselectcourse`.`select_course_id_id` AS `select_course_id_id` from (`edu_admin_studentselectcourse` join `edu_admin_selectcourse` on((`edu_admin_studentselectcourse`.`select_course_id_id` = `edu_admin_selectcourse`.`select_course_id`))) where (`edu_admin_studentselectcourse`.`select_course_id_id` = `edu_admin_selectcourse`.`select_course_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stu_tea_cou_view`
--

/*!50001 DROP VIEW IF EXISTS `stu_tea_cou_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stu_tea_cou_view` AS select `edu_admin_selectcourse`.`teacher_id_id` AS `teacher_id_id`,`edu_admin_studentselectcourse`.`select_id` AS `select_id`,`edu_admin_studentselectcourse`.`score` AS `score`,`edu_admin_studentselectcourse`.`is_reread` AS `is_reread`,`edu_admin_studentselectcourse`.`select_course_id_id` AS `select_course_id_id`,`edu_admin_studentselectcourse`.`student_id_id` AS `student_id_id`,`edu_admin_studentselectcourse`.`course_id_id` AS `course_id_id` from (`edu_admin_studentselectcourse` join `edu_admin_selectcourse` on((`edu_admin_studentselectcourse`.`select_course_id_id` = `edu_admin_selectcourse`.`select_course_id`))) where (`edu_admin_studentselectcourse`.`select_course_id_id` = `edu_admin_selectcourse`.`select_course_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stu_user_view`
--

/*!50001 DROP VIEW IF EXISTS `stu_user_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stu_user_view` AS select `account_user`.`username` AS `username`,`account_user`.`name` AS `name`,`account_user`.`school` AS `school`,`account_user`.`major` AS `major`,`account_user`.`sclass` AS `sclass` from `account_user` where ((`account_user`.`is_teacher` = 0) and (`account_user`.`is_superuser` = 0)) */;
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

-- Dump completed on 2019-12-18 22:28:56
