CREATE DATABASE  IF NOT EXISTS `vps-a-c_schemaalert` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `vps-a-c_schemaalert`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: vps-a-c_schemaalert
-- ------------------------------------------------------
-- Server version	5.5.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tblalert28`
--

DROP TABLE IF EXISTS `tblalert28`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblalert28` (
  `alertid` int(11) NOT NULL AUTO_INCREMENT,
  `alerttype` int(11) DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  `alertmemid` int(11) DEFAULT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT '0',
  `alertpublish` datetime DEFAULT NULL,
  `isread` tinyint(1) NOT NULL DEFAULT '0',
  `alertinfo` varchar(45) DEFAULT NULL,
  `isalertold` tinyint(1) DEFAULT '0',
  `alertdateid` int(11) DEFAULT '0',
  `isAlertExecuted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`alertid`),
  KEY `home1` (`memberid`,`isalertold`),
  KEY `alert1` (`alerttype`,`memberid`,`isdeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2812 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblalert28`
--

LOCK TABLES `tblalert28` WRITE;
/*!40000 ALTER TABLE `tblalert28` DISABLE KEYS */;
INSERT INTO `tblalert28` VALUES (2794,35,28,28,0,'2013-08-07 13:48:12',1,NULL,0,136,1),(2795,35,28,30,0,'2013-08-07 13:49:57',1,NULL,0,137,1),(2796,41,28,30,0,'2013-08-07 13:51:01',1,NULL,0,137,1),(2797,42,28,30,0,'2013-08-07 13:51:46',1,NULL,0,524,1),(2798,35,28,30,0,'2013-08-07 14:04:50',1,NULL,0,138,1),(2799,41,28,30,0,'2013-08-07 14:05:51',1,NULL,0,138,1),(2800,42,28,30,0,'2013-08-07 14:06:36',1,NULL,0,525,1),(2801,42,28,30,0,'2013-08-07 14:06:36',1,NULL,0,526,1),(2802,35,28,30,0,'2013-08-07 14:12:17',1,NULL,0,139,1),(2803,41,28,30,0,'2013-08-07 14:13:21',1,NULL,0,139,1),(2804,4,28,30,1,'2013-08-07 14:14:56',1,NULL,0,140,1),(2805,4,28,30,1,'2013-08-07 14:35:58',1,NULL,0,141,1),(2806,35,28,28,0,'2013-08-07 14:37:28',1,NULL,0,141,1),(2807,41,28,30,0,'2013-08-07 14:38:29',1,NULL,0,141,1),(2808,42,28,30,0,'2013-08-07 14:39:14',1,NULL,0,528,1);
/*!40000 ALTER TABLE `tblalert28` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblalert30`
--

DROP TABLE IF EXISTS `tblalert30`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblalert30` (
  `alertid` int(11) NOT NULL AUTO_INCREMENT,
  `alerttype` int(11) DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  `alertmemid` int(11) DEFAULT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT '0',
  `alertpublish` datetime DEFAULT NULL,
  `isread` tinyint(1) NOT NULL DEFAULT '0',
  `alertinfo` varchar(45) DEFAULT NULL,
  `isalertold` tinyint(1) DEFAULT '0',
  `alertdateid` int(11) DEFAULT '0',
  `isAlertExecuted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`alertid`),
  KEY `home1` (`memberid`,`isalertold`),
  KEY `alert1` (`alerttype`,`memberid`,`isdeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2728 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblalert30`
--

LOCK TABLES `tblalert30` WRITE;
/*!40000 ALTER TABLE `tblalert30` DISABLE KEYS */;
INSERT INTO `tblalert30` VALUES (2395,35,30,31,0,'2013-07-28 14:11:08',1,NULL,0,13,1),(2397,32,30,31,0,'2013-07-28 14:11:37',1,NULL,0,13,1),(2460,11,30,28,0,'2013-08-04 15:58:29',1,NULL,0,678,1),(2461,43,30,28,0,'2013-08-04 15:58:41',1,NULL,0,678,1),(2462,2,30,28,0,'2013-08-04 15:58:58',1,NULL,0,0,1),(2463,32,30,28,0,'2013-08-04 15:59:10',1,NULL,0,678,1),(2464,1,30,28,0,'2013-08-04 15:59:25',1,NULL,1,679,1),(2465,1,30,28,0,'2013-08-05 14:28:04',1,NULL,1,680,1),(2466,43,30,28,0,'2013-08-05 14:28:18',1,NULL,0,680,1),(2467,2,30,28,0,'2013-08-05 14:28:38',1,NULL,0,0,1),(2468,32,30,28,0,'2013-08-05 14:28:45',1,NULL,0,680,1),(2469,1,30,28,0,'2013-08-05 14:31:59',1,NULL,1,681,1),(2470,3,30,28,0,'2013-08-05 14:32:12',1,NULL,0,682,1),(2471,1,30,28,0,'2013-08-05 14:32:40',1,NULL,1,683,1),(2472,3,30,28,0,'2013-08-05 17:36:40',1,NULL,1,685,1),(2473,32,30,28,0,'2013-08-05 17:36:51',1,NULL,0,685,1),(2474,1,30,28,0,'2013-08-06 09:12:53',1,NULL,0,686,1),(2475,1,30,28,0,'2013-08-06 09:16:54',1,NULL,0,689,1),(2476,11,30,28,0,'2013-08-06 09:26:28',1,NULL,0,693,1),(2477,32,30,28,0,'2013-08-06 09:26:35',1,NULL,0,693,1),(2478,3,30,28,0,'2013-08-06 09:26:46',1,NULL,0,694,1),(2479,1,30,28,0,'2013-08-06 09:30:17',1,NULL,1,697,1),(2480,32,30,28,0,'2013-08-06 09:30:40',1,NULL,0,697,1),(2481,3,30,28,0,'2013-08-06 09:31:07',1,NULL,1,698,1),(2482,43,30,28,0,'2013-08-06 09:31:54',1,NULL,0,698,1),(2483,32,30,28,0,'2013-08-06 09:33:39',1,NULL,0,698,1),(2484,3,30,28,0,'2013-08-06 09:34:43',1,NULL,1,699,1),(2485,43,30,28,0,'2013-08-06 09:35:30',1,NULL,0,699,1),(2486,42,30,28,0,'2013-08-06 09:38:05',1,NULL,0,501,1),(2487,3,30,28,0,'2013-08-06 09:39:48',1,NULL,1,700,1),(2488,32,30,28,0,'2013-08-06 09:41:18',1,NULL,0,700,1),(2489,3,30,28,0,'2013-08-06 09:41:25',1,NULL,1,701,1),(2490,32,30,28,0,'2013-08-06 09:41:54',1,NULL,0,701,1),(2491,11,30,28,0,'2013-08-06 09:42:53',1,NULL,0,702,1),(2492,32,30,28,0,'2013-08-06 09:45:35',1,NULL,0,702,1),(2493,3,30,28,0,'2013-08-06 09:45:41',1,NULL,1,703,1),(2494,32,30,28,0,'2013-08-06 09:46:29',1,NULL,0,703,1),(2495,3,30,28,0,'2013-08-06 09:46:41',1,NULL,1,704,1),(2496,32,30,28,0,'2013-08-06 09:46:49',1,NULL,0,704,1),(2497,1,30,28,0,'2013-08-06 09:51:06',1,NULL,1,705,1),(2498,32,30,28,0,'2013-08-06 09:51:15',1,NULL,0,705,1),(2499,1,30,28,0,'2013-08-06 09:53:07',1,NULL,1,706,1),(2500,32,30,28,0,'2013-08-06 09:53:13',1,NULL,0,706,1),(2501,3,30,28,0,'2013-08-06 09:53:43',1,NULL,1,707,1),(2502,32,30,28,0,'2013-08-06 09:53:50',1,NULL,0,707,1),(2503,11,30,28,0,'2013-08-06 09:54:42',1,NULL,0,708,1),(2504,32,30,28,0,'2013-08-06 09:54:48',1,NULL,0,708,1),(2505,3,30,28,0,'2013-08-06 10:07:58',1,NULL,1,709,1),(2506,32,30,28,0,'2013-08-06 10:08:07',1,NULL,0,709,1),(2507,1,30,28,0,'2013-08-06 10:18:21',1,NULL,1,710,1),(2508,32,30,28,0,'2013-08-06 10:20:09',1,NULL,0,710,1),(2509,3,30,28,0,'2013-08-06 10:20:18',1,NULL,1,711,1),(2510,32,30,28,0,'2013-08-06 10:20:26',1,NULL,0,711,1),(2511,1,30,28,0,'2013-08-06 10:21:15',1,NULL,1,712,1),(2512,32,30,28,0,'2013-08-06 10:21:23',1,NULL,0,712,1),(2513,3,30,28,0,'2013-08-06 10:23:44',1,NULL,1,713,1),(2514,32,30,28,0,'2013-08-06 10:23:53',1,NULL,0,713,1),(2515,1,30,28,0,'2013-08-06 10:24:46',1,NULL,1,714,1),(2516,32,30,28,0,'2013-08-06 10:24:55',1,NULL,0,714,1),(2517,1,30,28,0,'2013-08-06 10:25:50',1,NULL,1,715,1),(2518,32,30,28,0,'2013-08-06 10:26:24',1,NULL,0,715,1),(2519,3,30,28,0,'2013-08-06 10:27:07',1,NULL,1,716,1),(2520,32,30,28,0,'2013-08-06 10:27:37',1,NULL,0,716,1),(2521,11,30,28,0,'2013-08-06 10:27:44',1,NULL,0,717,1),(2522,32,30,28,0,'2013-08-06 10:28:01',1,NULL,0,717,1),(2523,3,30,28,0,'2013-08-06 10:28:19',1,NULL,1,718,1),(2524,32,30,28,0,'2013-08-06 10:28:26',1,NULL,0,718,1),(2525,3,30,28,0,'2013-08-06 10:30:44',1,NULL,1,719,1),(2526,32,30,28,0,'2013-08-06 10:30:53',1,NULL,0,719,1),(2527,1,30,28,0,'2013-08-06 10:34:02',1,NULL,1,720,1),(2528,32,30,28,0,'2013-08-06 10:34:20',1,NULL,0,720,1),(2529,3,30,28,0,'2013-08-06 10:34:48',1,NULL,1,721,1),(2530,32,30,28,0,'2013-08-06 10:35:05',1,NULL,0,721,1),(2531,3,30,28,0,'2013-08-06 10:35:17',1,NULL,1,722,1),(2532,43,30,28,0,'2013-08-06 10:36:01',1,NULL,0,722,1),(2533,1,30,28,0,'2013-08-06 10:36:30',1,NULL,1,723,1),(2534,43,30,28,0,'2013-08-06 10:37:16',1,NULL,0,723,1),(2535,32,30,28,0,'2013-08-06 10:37:43',1,NULL,0,723,1),(2536,3,30,28,0,'2013-08-06 10:37:58',1,NULL,1,724,1),(2537,32,30,28,0,'2013-08-06 10:38:42',1,NULL,0,724,1),(2538,32,30,28,0,'2013-08-06 10:38:45',1,NULL,0,724,1),(2539,1,30,28,0,'2013-08-06 10:40:00',1,NULL,1,725,1),(2540,43,30,28,0,'2013-08-06 10:40:26',1,NULL,0,725,1),(2541,32,30,28,0,'2013-08-06 10:41:09',1,NULL,0,725,1),(2542,1,30,28,0,'2013-08-06 10:43:04',1,NULL,1,726,1),(2543,43,30,28,0,'2013-08-06 10:43:31',1,NULL,0,726,1),(2544,32,30,28,0,'2013-08-06 10:43:59',1,NULL,0,726,1),(2545,1,30,28,0,'2013-08-06 10:44:19',1,NULL,1,727,1),(2546,43,30,28,0,'2013-08-06 10:44:46',1,NULL,0,727,1),(2547,32,30,28,0,'2013-08-06 10:45:46',1,NULL,0,727,1),(2548,32,30,28,0,'2013-08-06 10:46:06',1,NULL,0,727,1),(2549,11,30,28,0,'2013-08-06 10:57:32',1,NULL,0,728,1),(2550,1,30,31,0,'2013-08-06 10:57:40',1,NULL,1,729,1),(2551,32,30,28,0,'2013-08-06 10:58:20',1,NULL,0,728,1),(2552,1,30,28,0,'2013-08-06 10:58:47',1,NULL,0,730,1),(2553,1,30,28,0,'2013-08-06 11:03:28',1,NULL,0,732,1),(2554,1,30,28,0,'2013-08-06 11:05:41',1,NULL,1,733,1),(2555,1,30,31,0,'2013-08-06 11:05:56',1,NULL,0,734,1),(2556,1,30,31,0,'2013-08-06 11:06:30',1,NULL,0,735,1),(2557,3,30,28,0,'2013-08-06 11:08:43',1,NULL,1,736,1),(2558,32,30,28,0,'2013-08-06 11:10:57',1,NULL,0,736,1),(2559,32,30,28,0,'2013-08-06 11:10:58',1,NULL,0,736,1),(2560,1,30,31,0,'2013-08-06 11:11:04',1,NULL,1,737,1),(2561,43,30,31,0,'2013-08-06 11:16:14',1,NULL,0,737,1),(2562,42,30,31,0,'2013-08-06 11:18:49',1,NULL,0,507,1),(2563,1,30,31,0,'2013-08-06 11:23:43',1,NULL,1,738,1),(2564,32,30,31,0,'2013-08-06 11:26:16',1,NULL,0,738,1),(2565,11,30,31,0,'2013-08-06 11:43:55',1,NULL,0,739,1),(2566,43,30,31,0,'2013-08-06 11:49:00',1,NULL,0,739,1),(2567,42,30,31,0,'2013-08-06 11:51:35',1,NULL,0,508,1),(2568,35,30,30,0,'2013-08-06 12:47:08',0,NULL,0,75,1),(2569,33,30,28,0,'2013-08-06 12:47:17',0,NULL,0,75,1),(2570,35,30,28,0,'2013-08-06 12:52:35',0,NULL,0,76,1),(2571,33,30,28,0,'2013-08-06 12:52:44',0,NULL,0,76,1),(2572,35,30,30,0,'2013-08-06 12:59:16',0,NULL,0,77,1),(2573,33,30,28,0,'2013-08-06 12:59:35',0,NULL,0,77,1),(2574,33,30,28,0,'2013-08-06 12:59:39',0,NULL,0,77,1),(2575,35,30,30,0,'2013-08-06 13:00:41',0,NULL,0,78,1),(2576,35,30,30,0,'2013-08-06 13:04:44',0,NULL,0,79,1),(2577,33,30,28,0,'2013-08-06 13:05:39',0,NULL,0,79,1),(2578,35,30,30,0,'2013-08-06 13:13:27',0,NULL,0,80,1),(2579,41,30,28,0,'2013-08-06 13:14:32',0,NULL,0,80,1),(2580,42,30,28,0,'2013-08-06 13:15:17',0,NULL,0,509,1),(2581,35,30,30,0,'2013-08-06 13:47:46',0,NULL,0,81,1),(2582,41,30,28,0,'2013-08-06 13:48:48',0,NULL,0,81,1),(2583,42,30,28,0,'2013-08-06 13:49:33',0,NULL,0,510,1),(2584,35,30,30,0,'2013-08-06 13:50:34',0,NULL,0,82,1),(2585,35,30,30,0,'2013-08-06 13:51:27',0,NULL,0,83,1),(2586,35,30,30,0,'2013-08-06 13:55:34',0,NULL,0,84,1),(2587,35,30,30,0,'2013-08-06 13:58:36',0,NULL,0,85,1),(2588,35,30,30,0,'2013-08-06 14:00:40',0,NULL,0,86,1),(2589,33,30,28,0,'2013-08-06 14:01:07',0,NULL,0,86,1),(2590,35,30,30,0,'2013-08-06 14:01:33',0,NULL,0,87,1),(2591,35,30,30,0,'2013-08-06 14:07:03',0,NULL,0,88,1),(2592,41,30,28,0,'2013-08-06 14:08:05',0,NULL,0,88,1),(2593,42,30,28,0,'2013-08-06 14:08:50',0,NULL,0,511,1),(2594,35,30,30,0,'2013-08-06 14:13:34',0,NULL,0,90,1),(2595,33,30,28,0,'2013-08-06 14:18:13',0,NULL,0,92,1),(2596,41,30,0,0,'2013-08-06 14:18:27',0,NULL,0,92,1),(2597,41,30,0,0,'2013-08-06 14:18:32',0,NULL,0,92,1),(2598,41,30,0,0,'2013-08-06 14:18:37',0,NULL,0,92,1),(2599,35,30,30,0,'2013-08-06 14:20:26',0,NULL,0,94,1),(2600,35,30,30,0,'2013-08-06 14:21:03',0,NULL,0,95,1),(2601,35,30,30,0,'2013-08-06 14:24:31',0,NULL,0,96,1),(2602,35,30,30,0,'2013-08-06 14:25:08',0,NULL,0,97,1),(2603,33,30,28,0,'2013-08-06 14:25:29',0,NULL,0,97,1),(2604,35,30,30,0,'2013-08-06 14:37:11',0,NULL,0,98,1),(2605,33,30,28,0,'2013-08-06 14:37:35',0,NULL,0,98,1),(2606,35,30,30,0,'2013-08-06 14:38:17',0,NULL,0,99,1),(2607,41,30,28,0,'2013-08-06 14:39:22',0,NULL,0,99,1),(2608,42,30,28,0,'2013-08-06 14:40:07',0,NULL,0,512,1),(2609,35,30,30,0,'2013-08-06 14:45:25',0,NULL,0,100,1),(2610,35,30,30,0,'2013-08-06 14:46:56',0,NULL,0,101,1),(2611,35,30,30,0,'2013-08-06 14:47:48',0,NULL,0,102,1),(2612,31,30,31,0,'2013-08-06 14:47:54',0,NULL,0,102,1),(2613,33,30,28,0,'2013-08-06 14:48:42',0,NULL,0,102,1),(2614,35,30,30,0,'2013-08-06 14:52:59',0,NULL,0,103,1),(2615,33,30,28,0,'2013-08-06 14:53:05',0,NULL,0,103,1),(2616,35,30,30,0,'2013-08-06 14:54:17',0,NULL,0,104,1),(2617,33,30,28,0,'2013-08-06 14:54:24',0,NULL,0,104,1),(2618,35,30,31,0,'2013-08-06 14:55:02',0,NULL,0,105,1),(2619,33,30,28,0,'2013-08-06 14:55:07',0,NULL,0,105,1),(2620,1,30,28,0,'2013-08-06 15:05:16',0,NULL,1,743,1),(2621,32,30,28,0,'2013-08-06 15:05:25',0,NULL,0,743,1),(2622,3,30,28,0,'2013-08-06 15:05:50',0,NULL,1,744,1),(2623,43,30,28,0,'2013-08-06 15:06:22',0,NULL,0,744,1),(2624,32,30,28,0,'2013-08-06 15:06:35',0,NULL,0,744,1),(2625,1,30,28,0,'2013-08-06 15:09:13',0,NULL,1,745,1),(2626,43,30,28,0,'2013-08-06 15:09:42',0,NULL,0,745,1),(2627,2,30,28,0,'2013-08-06 15:10:02',0,NULL,0,0,1),(2628,32,30,28,0,'2013-08-06 15:10:12',0,NULL,0,745,1),(2629,1,30,28,0,'2013-08-06 15:10:31',0,NULL,1,746,1),(2630,3,30,28,0,'2013-08-06 15:56:19',0,NULL,1,747,1),(2631,43,30,28,0,'2013-08-06 15:56:51',0,NULL,0,747,1),(2632,2,30,28,0,'2013-08-06 15:56:56',0,NULL,0,0,1),(2633,32,30,28,0,'2013-08-06 15:57:08',0,NULL,0,747,1),(2634,1,30,28,0,'2013-08-06 16:01:23',0,NULL,1,748,1),(2635,43,30,28,0,'2013-08-06 16:01:51',0,NULL,0,748,1),(2636,2,30,28,0,'2013-08-06 16:02:03',0,NULL,0,0,1),(2637,11,30,28,0,'2013-08-06 16:08:54',0,NULL,0,749,1),(2638,43,30,28,0,'2013-08-06 16:09:21',0,NULL,0,749,1),(2639,3,30,28,0,'2013-08-06 16:10:18',0,NULL,1,750,1),(2640,43,30,28,0,'2013-08-06 16:10:46',0,NULL,0,750,1),(2641,42,30,28,0,'2013-08-06 16:13:21',0,NULL,0,518,1),(2642,32,30,28,0,'2013-08-06 16:21:50',0,NULL,0,750,1),(2643,32,30,28,0,'2013-08-06 16:21:51',0,NULL,0,750,1),(2644,1,30,28,0,'2013-08-06 16:22:29',0,NULL,1,751,1),(2645,43,30,28,0,'2013-08-06 16:23:01',0,NULL,0,751,1),(2646,2,30,28,0,'2013-08-06 16:23:11',0,NULL,0,0,1),(2647,32,30,28,0,'2013-08-06 16:23:30',0,NULL,0,751,1),(2648,35,30,30,0,'2013-08-06 17:26:30',0,NULL,0,112,1),(2649,33,30,28,0,'2013-08-06 17:26:36',0,NULL,0,112,1),(2650,36,30,28,0,'2013-08-06 17:27:14',0,NULL,0,84,1),(2651,36,30,28,0,'2013-08-06 17:43:23',0,NULL,0,86,1),(2652,36,30,28,0,'2013-08-06 18:02:53',0,NULL,0,87,1),(2653,3,30,28,0,'2013-08-06 18:08:57',0,NULL,1,752,1),(2654,43,30,28,0,'2013-08-06 18:09:30',0,NULL,0,752,1),(2655,11,30,28,0,'2013-08-07 09:15:42',0,NULL,0,753,1),(2656,43,30,28,0,'2013-08-07 09:16:11',0,NULL,0,753,1),(2657,2,30,28,0,'2013-08-07 09:16:16',0,NULL,0,0,1),(2658,35,30,30,0,'2013-08-07 11:33:54',0,NULL,0,117,1),(2659,33,30,28,0,'2013-08-07 11:34:07',0,NULL,0,117,1),(2660,4,30,28,0,'2013-08-07 11:34:44',0,NULL,0,118,1),(2661,35,30,30,0,'2013-08-07 11:34:53',0,NULL,0,118,1),(2662,33,30,28,0,'2013-08-07 11:34:58',0,NULL,0,118,1),(2663,4,30,28,0,'2013-08-07 11:35:38',0,NULL,0,119,1),(2664,4,30,28,0,'2013-08-07 11:40:42',0,NULL,0,119,1),(2665,35,30,30,0,'2013-08-07 11:40:45',0,NULL,0,119,1),(2666,33,30,28,0,'2013-08-07 11:40:56',0,NULL,0,119,1),(2667,33,30,28,0,'2013-08-07 11:40:56',0,NULL,0,119,1),(2668,4,30,28,0,'2013-08-07 11:42:30',0,NULL,0,120,1),(2669,35,30,30,0,'2013-08-07 11:42:32',0,NULL,0,120,1),(2670,33,30,28,0,'2013-08-07 11:42:40',0,NULL,0,120,1),(2671,35,30,30,0,'2013-08-07 11:43:20',0,NULL,0,121,1),(2672,33,30,28,0,'2013-08-07 11:43:33',0,NULL,0,121,1),(2673,33,30,28,0,'2013-08-07 11:43:33',0,NULL,0,121,1),(2674,35,30,30,0,'2013-08-07 11:45:22',0,NULL,0,122,1),(2675,33,30,28,0,'2013-08-07 11:45:43',0,NULL,0,122,1),(2676,4,30,28,0,'2013-08-07 11:46:02',0,NULL,0,123,1),(2677,35,30,30,0,'2013-08-07 11:46:06',0,NULL,0,123,1),(2678,33,30,28,0,'2013-08-07 11:48:04',0,NULL,0,123,1),(2679,4,30,28,0,'2013-08-07 11:56:00',0,NULL,0,124,1),(2680,35,30,30,0,'2013-08-07 11:56:03',0,NULL,0,124,1),(2681,33,30,28,0,'2013-08-07 11:56:33',0,NULL,0,124,1),(2682,35,30,30,0,'2013-08-07 11:57:00',0,NULL,0,125,1),(2683,4,30,28,0,'2013-08-07 11:57:38',0,NULL,0,126,1),(2684,35,30,30,0,'2013-08-07 11:57:46',0,NULL,0,126,1),(2685,33,30,28,0,'2013-08-07 12:00:42',0,NULL,0,126,1),(2686,4,30,28,0,'2013-08-07 12:01:00',0,NULL,0,127,1),(2687,35,30,30,0,'2013-08-07 12:01:03',0,NULL,0,127,1),(2688,33,30,28,0,'2013-08-07 12:01:44',0,NULL,0,127,1),(2689,35,30,28,0,'2013-08-07 12:03:40',0,NULL,0,128,1),(2690,32,30,28,0,'2013-08-07 12:04:46',0,NULL,0,128,1),(2691,35,30,28,0,'2013-08-07 12:05:09',0,NULL,0,129,1),(2692,32,30,28,0,'2013-08-07 12:09:08',0,NULL,0,129,1),(2693,4,30,28,0,'2013-08-07 12:09:21',0,NULL,0,130,1),(2694,35,30,30,0,'2013-08-07 12:10:11',0,NULL,0,130,1),(2695,33,30,28,0,'2013-08-07 12:10:57',0,NULL,0,130,1),(2696,4,30,28,0,'2013-08-07 12:11:44',0,NULL,0,131,1),(2697,35,30,30,0,'2013-08-07 12:11:57',0,NULL,0,131,1),(2698,33,30,28,0,'2013-08-07 12:13:30',0,NULL,0,131,1),(2699,33,30,28,0,'2013-08-07 12:13:31',0,NULL,0,131,1),(2700,35,30,30,0,'2013-08-07 12:48:06',0,NULL,0,132,1),(2701,41,30,28,0,'2013-08-07 12:49:07',0,NULL,0,132,1),(2702,42,30,28,0,'2013-08-07 12:49:52',0,NULL,0,522,1),(2703,4,30,28,0,'2013-08-07 12:51:26',0,NULL,0,133,1),(2704,33,30,28,0,'2013-08-07 12:53:27',0,NULL,0,133,1),(2705,4,30,28,0,'2013-08-07 12:53:38',0,NULL,0,134,1),(2706,35,30,30,0,'2013-08-07 12:54:32',0,NULL,0,134,1),(2707,33,30,28,0,'2013-08-07 12:58:31',0,NULL,0,134,1),(2708,4,30,28,0,'2013-08-07 12:58:43',0,NULL,0,135,1),(2709,35,30,30,0,'2013-08-07 12:58:49',0,NULL,0,135,1),(2710,41,30,28,0,'2013-08-07 12:59:52',0,NULL,0,135,1),(2711,42,30,28,0,'2013-08-07 13:00:37',0,NULL,0,523,1),(2712,1,30,28,0,'2013-08-07 13:37:31',0,NULL,0,754,1),(2713,35,30,28,0,'2013-08-07 13:48:12',0,NULL,0,136,1),(2714,32,30,28,0,'2013-08-07 13:48:22',0,NULL,0,136,1),(2715,35,30,30,0,'2013-08-07 13:49:57',0,NULL,0,137,1),(2716,41,30,28,0,'2013-08-07 13:51:00',0,NULL,0,137,1),(2717,42,30,28,0,'2013-08-07 13:51:46',0,NULL,0,524,1),(2718,35,30,30,0,'2013-08-07 14:04:50',0,NULL,0,138,1),(2719,41,30,28,0,'2013-08-07 14:05:51',0,NULL,0,138,1),(2720,42,30,28,0,'2013-08-07 14:06:36',0,NULL,0,525,1),(2721,42,30,28,0,'2013-08-07 14:06:36',0,NULL,0,526,1),(2722,35,30,30,0,'2013-08-07 14:12:17',0,NULL,0,139,1),(2723,41,30,28,0,'2013-08-07 14:13:21',0,NULL,0,139,1),(2724,32,30,28,0,'2013-08-07 14:13:42',0,NULL,0,139,1),(2725,35,30,28,0,'2013-08-07 14:37:28',0,NULL,0,141,1),(2726,41,30,28,0,'2013-08-07 14:38:29',0,NULL,0,141,1),(2727,42,30,28,0,'2013-08-07 14:39:14',0,NULL,0,528,1);
/*!40000 ALTER TABLE `tblalert30` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblalert31`
--

DROP TABLE IF EXISTS `tblalert31`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblalert31` (
  `alertid` int(11) NOT NULL AUTO_INCREMENT,
  `alerttype` int(11) DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  `alertmemid` int(11) DEFAULT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT '0',
  `alertpublish` datetime DEFAULT NULL,
  `isread` tinyint(1) NOT NULL DEFAULT '0',
  `alertinfo` varchar(45) DEFAULT NULL,
  `isalertold` tinyint(1) DEFAULT '0',
  `alertdateid` int(11) DEFAULT '0',
  `isAlertExecuted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`alertid`),
  KEY `home1` (`memberid`,`isalertold`),
  KEY `alert1` (`alerttype`,`memberid`,`isdeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2406 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblalert31`
--

LOCK TABLES `tblalert31` WRITE;
/*!40000 ALTER TABLE `tblalert31` DISABLE KEYS */;
INSERT INTO `tblalert31` VALUES (2294,3,31,28,0,'2013-07-21 16:14:54',0,NULL,1,584,1),(2295,3,31,28,0,'2013-07-21 16:18:02',0,NULL,1,585,1),(2296,43,31,28,0,'2013-07-21 16:18:31',0,NULL,0,585,1),(2297,42,31,28,0,'2013-07-21 16:19:06',0,NULL,0,415,1),(2298,1,31,28,0,'2013-07-21 16:40:10',0,NULL,1,589,1),(2299,43,31,28,0,'2013-07-21 16:40:41',0,NULL,0,589,1),(2300,42,31,28,0,'2013-07-21 16:41:16',0,NULL,0,420,1),(2301,42,31,28,0,'2013-07-21 16:41:16',0,NULL,0,421,1),(2302,1,31,28,0,'2013-07-21 16:53:33',0,NULL,1,590,1),(2303,43,31,28,0,'2013-07-21 16:54:01',0,NULL,0,590,1),(2304,42,31,28,0,'2013-07-21 16:54:36',0,NULL,0,422,1),(2305,1,31,28,0,'2013-07-21 16:55:34',0,NULL,1,591,1),(2306,43,31,28,0,'2013-07-21 16:56:01',0,NULL,0,591,1),(2307,42,31,28,0,'2013-07-21 16:56:36',0,NULL,0,423,1),(2308,1,31,28,0,'2013-07-21 17:01:03',0,NULL,1,592,1),(2309,43,31,28,0,'2013-07-21 17:01:36',0,NULL,0,592,1),(2310,42,31,28,0,'2013-07-21 17:02:11',0,NULL,0,424,1),(2311,42,31,28,0,'2013-07-21 17:02:11',0,NULL,0,425,1),(2312,3,31,28,0,'2013-07-21 17:02:58',0,NULL,1,593,1),(2313,43,31,28,0,'2013-07-21 17:03:26',0,NULL,0,593,1),(2314,42,31,28,0,'2013-07-21 17:04:01',0,NULL,0,426,1),(2315,3,31,28,0,'2013-07-21 17:10:54',0,NULL,1,594,1),(2316,43,31,28,0,'2013-07-21 17:11:21',0,NULL,0,594,1),(2317,42,31,28,0,'2013-07-21 17:11:56',0,NULL,0,427,1),(2318,42,31,28,0,'2013-07-21 17:11:56',0,NULL,0,428,1),(2319,11,31,28,0,'2013-07-21 17:12:10',0,NULL,0,595,1),(2320,43,31,28,0,'2013-07-21 17:12:31',0,NULL,0,595,1),(2321,42,31,28,0,'2013-07-21 17:13:06',0,NULL,0,429,1),(2322,1,31,28,0,'2013-07-21 17:17:09',0,NULL,1,597,1),(2323,43,31,28,0,'2013-07-21 17:17:36',0,NULL,0,597,1),(2324,42,31,28,0,'2013-07-21 17:18:11',0,NULL,0,431,1),(2325,42,31,28,0,'2013-07-21 17:18:12',0,NULL,0,432,1),(2326,11,31,28,0,'2013-07-21 17:44:00',0,NULL,0,598,1),(2327,43,31,28,0,'2013-07-21 17:44:22',0,NULL,0,598,1),(2328,42,31,28,0,'2013-07-21 17:44:57',0,NULL,0,433,1),(2329,1,31,28,0,'2013-07-21 17:47:29',0,NULL,1,599,1),(2330,43,31,28,0,'2013-07-21 17:47:57',0,NULL,0,599,1),(2331,42,31,28,0,'2013-07-21 17:48:32',0,NULL,0,434,1),(2332,42,31,28,0,'2013-07-21 17:48:32',0,NULL,0,435,1),(2333,3,31,28,0,'2013-07-21 17:49:02',0,NULL,1,600,1),(2334,43,31,28,0,'2013-07-21 17:49:27',0,NULL,0,600,1),(2335,42,31,28,0,'2013-07-21 17:50:02',0,NULL,0,436,1),(2336,1,31,28,0,'2013-07-21 17:53:07',0,NULL,1,601,1),(2337,43,31,28,0,'2013-07-21 17:53:32',0,NULL,0,601,1),(2338,42,31,28,0,'2013-07-21 17:54:07',0,NULL,0,437,1),(2339,1,31,28,0,'2013-07-21 17:54:56',0,NULL,1,602,1),(2340,43,31,28,0,'2013-07-21 17:55:12',0,NULL,0,602,1),(2341,42,31,28,0,'2013-07-21 17:55:47',0,NULL,0,438,1),(2342,1,31,28,0,'2013-07-21 17:56:27',0,NULL,1,603,1),(2343,43,31,28,0,'2013-07-21 17:56:42',0,NULL,0,603,1),(2344,42,31,28,0,'2013-07-21 17:57:17',0,NULL,0,439,1),(2345,1,31,28,0,'2013-07-21 17:59:24',0,NULL,1,604,1),(2346,43,31,28,0,'2013-07-21 17:59:42',0,NULL,0,604,1),(2347,42,31,28,0,'2013-07-21 18:00:17',0,NULL,0,440,1),(2348,42,31,28,0,'2013-07-21 18:00:17',0,NULL,0,441,1),(2349,3,31,28,0,'2013-07-21 18:02:12',0,NULL,1,605,1),(2350,43,31,28,0,'2013-07-21 18:02:29',0,NULL,0,605,1),(2351,42,31,28,0,'2013-07-21 18:03:05',0,NULL,0,442,1),(2352,1,31,28,0,'2013-07-21 18:07:05',0,NULL,1,606,1),(2353,43,31,28,0,'2013-07-21 18:07:20',0,NULL,0,606,1),(2354,42,31,28,0,'2013-07-21 18:07:55',0,NULL,0,443,1),(2355,42,31,28,0,'2013-07-21 18:07:55',0,NULL,0,444,1),(2356,1,31,28,0,'2013-07-21 18:08:00',0,NULL,1,607,1),(2357,43,31,28,0,'2013-07-21 18:08:15',0,NULL,0,607,1),(2358,42,31,28,0,'2013-07-21 18:08:50',0,NULL,0,445,1),(2359,3,31,28,0,'2013-07-21 18:09:02',0,NULL,1,608,1),(2360,43,31,28,0,'2013-07-21 18:09:20',0,NULL,0,608,1),(2361,42,31,28,0,'2013-07-21 18:09:55',0,NULL,0,446,1),(2362,1,31,28,0,'2013-07-21 18:10:11',0,NULL,1,609,1),(2363,43,31,28,0,'2013-07-21 18:10:25',0,NULL,0,609,1),(2364,42,31,28,0,'2013-07-21 18:11:00',0,NULL,0,447,1),(2365,1,31,28,0,'2013-07-21 18:13:57',0,NULL,1,610,1),(2366,43,31,28,0,'2013-07-21 18:14:15',0,NULL,0,610,1),(2367,42,31,28,0,'2013-07-21 18:14:50',0,NULL,0,448,1),(2368,42,31,28,0,'2013-07-21 18:14:50',0,NULL,0,449,1),(2369,11,31,28,0,'2013-07-21 18:15:03',0,NULL,0,611,1),(2370,43,31,28,0,'2013-07-21 18:15:15',0,NULL,0,611,1),(2371,42,31,28,0,'2013-07-21 18:15:50',0,NULL,0,450,1),(2372,3,31,28,0,'2013-07-21 18:17:25',0,NULL,1,612,1),(2373,43,31,28,0,'2013-07-21 18:17:40',0,NULL,0,612,1),(2374,42,31,28,0,'2013-07-21 18:18:15',0,NULL,0,451,1),(2375,1,31,28,0,'2013-07-21 18:18:25',0,NULL,1,613,1),(2376,43,31,28,0,'2013-07-21 18:18:45',0,NULL,0,613,1),(2377,42,31,28,0,'2013-07-21 18:19:20',0,NULL,0,452,1),(2378,3,31,28,0,'2013-07-21 18:22:08',0,NULL,1,614,1),(2379,43,31,28,0,'2013-07-21 18:22:25',0,NULL,0,614,1),(2380,42,31,28,0,'2013-07-21 18:23:00',0,NULL,0,453,1),(2381,35,31,31,0,'2013-07-28 14:11:08',0,NULL,0,13,1),(2382,31,31,28,0,'2013-07-28 14:11:24',0,NULL,0,13,1),(2383,33,31,30,0,'2013-07-28 14:11:31',0,NULL,0,13,1),(2384,11,31,30,0,'2013-08-06 11:11:10',0,NULL,0,737,1),(2385,43,31,30,0,'2013-08-06 11:16:14',0,NULL,0,737,1),(2386,42,31,30,0,'2013-08-06 11:18:50',0,NULL,0,507,1),(2387,11,31,30,0,'2013-08-06 11:23:46',0,NULL,0,738,1),(2388,32,31,30,0,'2013-08-06 11:26:13',0,NULL,0,738,1),(2389,1,31,30,0,'2013-08-06 11:43:51',0,NULL,1,739,1),(2390,43,31,30,0,'2013-08-06 11:49:00',0,NULL,0,739,1),(2391,42,31,30,0,'2013-08-06 11:51:35',0,NULL,0,508,1),(2392,1,31,28,0,'2013-08-06 11:54:00',0,NULL,1,740,1),(2393,1,31,28,0,'2013-08-06 12:05:11',0,NULL,1,742,1),(2394,35,31,31,0,'2013-08-06 12:29:47',0,NULL,0,73,1),(2395,33,31,28,0,'2013-08-06 12:30:01',0,NULL,0,73,1),(2396,41,31,0,0,'2013-08-06 12:30:10',0,NULL,0,73,1),(2397,41,31,0,0,'2013-08-06 12:30:15',0,NULL,0,73,1),(2398,35,31,31,0,'2013-08-06 12:45:16',0,NULL,0,74,1),(2399,33,31,28,0,'2013-08-06 12:45:29',0,NULL,0,74,1),(2400,33,31,28,0,'2013-08-06 12:45:36',0,NULL,0,74,1),(2401,35,31,30,0,'2013-08-06 14:47:48',0,NULL,0,102,1),(2402,35,31,31,0,'2013-08-06 14:55:02',0,NULL,0,105,1),(2403,33,31,28,0,'2013-08-06 14:55:08',0,NULL,0,105,1),(2404,4,31,28,0,'2013-08-07 11:34:44',0,NULL,0,118,1),(2405,4,31,28,0,'2013-08-07 11:56:00',0,NULL,0,124,1);
/*!40000 ALTER TABLE `tblalert31` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblalert33`
--

DROP TABLE IF EXISTS `tblalert33`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblalert33` (
  `alertid` int(11) NOT NULL AUTO_INCREMENT,
  `alerttype` int(11) DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  `alertmemid` int(11) DEFAULT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT '0',
  `alertpublish` datetime DEFAULT NULL,
  `isread` tinyint(1) NOT NULL DEFAULT '0',
  `alertinfo` varchar(45) DEFAULT NULL,
  `isalertold` tinyint(1) DEFAULT '0',
  `alertdateid` int(11) DEFAULT '0',
  `isAlertExecuted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`alertid`),
  KEY `home1` (`memberid`,`isalertold`),
  KEY `alert1` (`alerttype`,`memberid`,`isdeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2294 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblalert33`
--

LOCK TABLES `tblalert33` WRITE;
/*!40000 ALTER TABLE `tblalert33` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblalert33` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblalert34`
--

DROP TABLE IF EXISTS `tblalert34`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblalert34` (
  `alertid` int(11) NOT NULL AUTO_INCREMENT,
  `alerttype` int(11) DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  `alertmemid` int(11) DEFAULT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT '0',
  `alertpublish` datetime DEFAULT NULL,
  `isread` tinyint(1) NOT NULL DEFAULT '0',
  `alertinfo` varchar(45) DEFAULT NULL,
  `isalertold` tinyint(1) DEFAULT '0',
  `alertdateid` int(11) DEFAULT '0',
  `isAlertExecuted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`alertid`),
  KEY `home1` (`memberid`,`isalertold`),
  KEY `alert1` (`alerttype`,`memberid`,`isdeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2294 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblalert34`
--

LOCK TABLES `tblalert34` WRITE;
/*!40000 ALTER TABLE `tblalert34` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblalert34` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblalert37`
--

DROP TABLE IF EXISTS `tblalert37`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblalert37` (
  `alertid` int(11) NOT NULL AUTO_INCREMENT,
  `alerttype` int(11) DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  `alertmemid` int(11) DEFAULT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT '0',
  `alertpublish` datetime DEFAULT NULL,
  `isread` tinyint(1) NOT NULL DEFAULT '0',
  `alertinfo` varchar(45) DEFAULT NULL,
  `isalertold` tinyint(1) DEFAULT '0',
  `alertdateid` int(11) DEFAULT '0',
  `isAlertExecuted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`alertid`),
  KEY `home1` (`memberid`,`isalertold`),
  KEY `alert1` (`alerttype`,`memberid`,`isdeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2298 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblalert37`
--

LOCK TABLES `tblalert37` WRITE;
/*!40000 ALTER TABLE `tblalert37` DISABLE KEYS */;
INSERT INTO `tblalert37` VALUES (2294,3,37,28,0,'2013-08-05 14:57:34',0,NULL,1,684,1),(2295,43,37,28,0,'2013-08-05 14:57:48',0,NULL,0,684,1),(2296,2,37,28,0,'2013-08-05 14:58:22',0,NULL,0,0,1),(2297,32,37,28,0,'2013-08-05 14:58:29',0,NULL,0,684,1);
/*!40000 ALTER TABLE `tblalert37` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-07 15:12:31
CREATE DATABASE  IF NOT EXISTS `vps-a-c_schemainbox` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `vps-a-c_schemainbox`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: vps-a-c_schemainbox
-- ------------------------------------------------------
-- Server version	5.5.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `inboxmessages28`
--

DROP TABLE IF EXISTS `inboxmessages28`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inboxmessages28` (
  `messageid` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `messageContent` text,
  `isDeleted` tinyint(1) DEFAULT '0',
  `messagepublish` datetime DEFAULT NULL,
  `isRead` tinyint(1) DEFAULT '0',
  `mymemberid` int(11) DEFAULT NULL,
  `messageheader` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`messageid`),
  KEY `homeGetConversation1` (`memberid`,`mymemberid`,`messagepublish`),
  KEY `homeGetConversation2` (`memberid`,`messageid`,`mymemberid`,`messagepublish`),
  KEY `inboxmain1` (`memberid`,`isDeleted`),
  KEY `inboxmain3` (`isDeleted`,`mymemberid`),
  KEY `inboxmain2` (`memberid`,`mymemberid`,`messagepublish`),
  KEY `inboxmain4` (`messagepublish`),
  KEY `inboxmain5` (`memberid`,`isDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=511 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inboxmessages28`
--

LOCK TABLES `inboxmessages28` WRITE;
/*!40000 ALTER TABLE `inboxmessages28` DISABLE KEYS */;
INSERT INTO `inboxmessages28` VALUES (501,31,'sadsad',0,'2013-08-06 11:45:12',1,28,'sadsad'),(502,28,'asdsad',0,'2013-08-06 11:45:26',1,31,'asdsad'),(503,31,'asdasdas',0,'2013-08-06 11:45:40',1,28,'asdasdas'),(504,31,'dsfsdf',0,'2013-08-06 11:54:46',0,28,'dsfsdf');
/*!40000 ALTER TABLE `inboxmessages28` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inboxmessages30`
--

DROP TABLE IF EXISTS `inboxmessages30`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inboxmessages30` (
  `messageid` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `messageContent` text,
  `isDeleted` tinyint(1) DEFAULT '0',
  `messagepublish` datetime DEFAULT NULL,
  `isRead` tinyint(1) DEFAULT '0',
  `mymemberid` int(11) DEFAULT NULL,
  `messageheader` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`messageid`),
  KEY `homeGetConversation1` (`memberid`,`mymemberid`,`messagepublish`),
  KEY `homeGetConversation2` (`memberid`,`messageid`,`mymemberid`,`messagepublish`),
  KEY `inboxmain1` (`memberid`,`isDeleted`),
  KEY `inboxmain3` (`isDeleted`,`mymemberid`),
  KEY `inboxmain2` (`memberid`,`mymemberid`,`messagepublish`),
  KEY `inboxmain4` (`messagepublish`),
  KEY `inboxmain5` (`memberid`,`isDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=507 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inboxmessages30`
--

LOCK TABLES `inboxmessages30` WRITE;
/*!40000 ALTER TABLE `inboxmessages30` DISABLE KEYS */;
/*!40000 ALTER TABLE `inboxmessages30` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inboxmessages31`
--

DROP TABLE IF EXISTS `inboxmessages31`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inboxmessages31` (
  `messageid` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `messageContent` text,
  `isDeleted` tinyint(1) DEFAULT '0',
  `messagepublish` datetime DEFAULT NULL,
  `isRead` tinyint(1) DEFAULT '0',
  `mymemberid` int(11) DEFAULT NULL,
  `messageheader` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`messageid`),
  KEY `homeGetConversation1` (`memberid`,`mymemberid`,`messagepublish`),
  KEY `homeGetConversation2` (`memberid`,`messageid`,`mymemberid`,`messagepublish`),
  KEY `inboxmain1` (`memberid`,`isDeleted`),
  KEY `inboxmain3` (`isDeleted`,`mymemberid`),
  KEY `inboxmain2` (`memberid`,`mymemberid`,`messagepublish`),
  KEY `inboxmain4` (`messagepublish`),
  KEY `inboxmain5` (`memberid`,`isDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inboxmessages31`
--

LOCK TABLES `inboxmessages31` WRITE;
/*!40000 ALTER TABLE `inboxmessages31` DISABLE KEYS */;
INSERT INTO `inboxmessages31` VALUES (1,31,'sadsad',0,'2013-08-06 11:45:12',1,28,'sadsad'),(2,28,'asdsad',0,'2013-08-06 11:45:26',1,31,'asdsad'),(3,31,'asdasdas',0,'2013-08-06 11:45:40',1,28,'asdasdas'),(4,31,'dsfsdf',0,'2013-08-06 11:54:46',0,28,'dsfsdf');
/*!40000 ALTER TABLE `inboxmessages31` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inboxmessages33`
--

DROP TABLE IF EXISTS `inboxmessages33`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inboxmessages33` (
  `messageid` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `messageContent` text,
  `isDeleted` tinyint(1) DEFAULT '0',
  `messagepublish` datetime DEFAULT NULL,
  `isRead` tinyint(1) DEFAULT '0',
  `mymemberid` int(11) DEFAULT NULL,
  `messageheader` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`messageid`),
  KEY `homeGetConversation1` (`memberid`,`mymemberid`,`messagepublish`),
  KEY `homeGetConversation2` (`memberid`,`messageid`,`mymemberid`,`messagepublish`),
  KEY `inboxmain1` (`memberid`,`isDeleted`),
  KEY `inboxmain3` (`isDeleted`,`mymemberid`),
  KEY `inboxmain2` (`memberid`,`mymemberid`,`messagepublish`),
  KEY `inboxmain4` (`messagepublish`),
  KEY `inboxmain5` (`memberid`,`isDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=474 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inboxmessages33`
--

LOCK TABLES `inboxmessages33` WRITE;
/*!40000 ALTER TABLE `inboxmessages33` DISABLE KEYS */;
/*!40000 ALTER TABLE `inboxmessages33` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inboxmessages34`
--

DROP TABLE IF EXISTS `inboxmessages34`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inboxmessages34` (
  `messageid` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `messageContent` text,
  `isDeleted` tinyint(1) DEFAULT '0',
  `messagepublish` datetime DEFAULT NULL,
  `isRead` tinyint(1) DEFAULT '0',
  `mymemberid` int(11) DEFAULT NULL,
  `messageheader` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`messageid`),
  KEY `homeGetConversation1` (`memberid`,`mymemberid`,`messagepublish`),
  KEY `homeGetConversation2` (`memberid`,`messageid`,`mymemberid`,`messagepublish`),
  KEY `inboxmain1` (`memberid`,`isDeleted`),
  KEY `inboxmain3` (`isDeleted`,`mymemberid`),
  KEY `inboxmain2` (`memberid`,`mymemberid`,`messagepublish`),
  KEY `inboxmain4` (`messagepublish`),
  KEY `inboxmain5` (`memberid`,`isDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=474 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inboxmessages34`
--

LOCK TABLES `inboxmessages34` WRITE;
/*!40000 ALTER TABLE `inboxmessages34` DISABLE KEYS */;
/*!40000 ALTER TABLE `inboxmessages34` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inboxmessages37`
--

DROP TABLE IF EXISTS `inboxmessages37`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inboxmessages37` (
  `messageid` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `messageContent` text,
  `isDeleted` tinyint(1) DEFAULT '0',
  `messagepublish` datetime DEFAULT NULL,
  `isRead` tinyint(1) DEFAULT '0',
  `mymemberid` int(11) DEFAULT NULL,
  `messageheader` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`messageid`),
  KEY `homeGetConversation1` (`memberid`,`mymemberid`,`messagepublish`),
  KEY `homeGetConversation2` (`memberid`,`messageid`,`mymemberid`,`messagepublish`),
  KEY `inboxmain1` (`memberid`,`isDeleted`),
  KEY `inboxmain3` (`isDeleted`,`mymemberid`),
  KEY `inboxmain2` (`memberid`,`mymemberid`,`messagepublish`),
  KEY `inboxmain4` (`messagepublish`),
  KEY `inboxmain5` (`memberid`,`isDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=474 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inboxmessages37`
--

LOCK TABLES `inboxmessages37` WRITE;
/*!40000 ALTER TABLE `inboxmessages37` DISABLE KEYS */;
/*!40000 ALTER TABLE `inboxmessages37` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-07 15:12:32
CREATE DATABASE  IF NOT EXISTS `vps-a-c_schemaimages` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `vps-a-c_schemaimages`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: vps-a-c_schemaimages
-- ------------------------------------------------------
-- Server version	5.5.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `userimages28`
--

DROP TABLE IF EXISTS `userimages28`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userimages28` (
  `iduserimages` int(11) NOT NULL AUTO_INCREMENT,
  `imagelink` varchar(210) DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  `isConfirm` int(2) DEFAULT '0',
  `xvalue` int(11) DEFAULT '0',
  `yvalue` int(11) DEFAULT '0',
  PRIMARY KEY (`iduserimages`),
  KEY `homerandimg` (`iduserimages`,`imagelink`),
  KEY `images1` (`iduserimages`,`memberid`),
  KEY `profile1` (`memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userimages28`
--

LOCK TABLES `userimages28` WRITE;
/*!40000 ALTER TABLE `userimages28` DISABLE KEYS */;
/*!40000 ALTER TABLE `userimages28` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userimages30`
--

DROP TABLE IF EXISTS `userimages30`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userimages30` (
  `iduserimages` int(11) NOT NULL AUTO_INCREMENT,
  `imagelink` varchar(210) DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  `isConfirm` int(2) DEFAULT '0',
  `xvalue` int(11) DEFAULT '0',
  `yvalue` int(11) DEFAULT '0',
  PRIMARY KEY (`iduserimages`),
  KEY `homerandimg` (`iduserimages`,`imagelink`),
  KEY `images1` (`iduserimages`,`memberid`),
  KEY `profile1` (`memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userimages30`
--

LOCK TABLES `userimages30` WRITE;
/*!40000 ALTER TABLE `userimages30` DISABLE KEYS */;
/*!40000 ALTER TABLE `userimages30` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userimages31`
--

DROP TABLE IF EXISTS `userimages31`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userimages31` (
  `iduserimages` int(11) NOT NULL AUTO_INCREMENT,
  `imagelink` varchar(210) DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  `isConfirm` int(2) DEFAULT '0',
  `xvalue` int(11) DEFAULT '0',
  `yvalue` int(11) DEFAULT '0',
  PRIMARY KEY (`iduserimages`),
  KEY `homerandimg` (`iduserimages`,`imagelink`),
  KEY `images1` (`iduserimages`,`memberid`),
  KEY `profile1` (`memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userimages31`
--

LOCK TABLES `userimages31` WRITE;
/*!40000 ALTER TABLE `userimages31` DISABLE KEYS */;
/*!40000 ALTER TABLE `userimages31` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userimages33`
--

DROP TABLE IF EXISTS `userimages33`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userimages33` (
  `iduserimages` int(11) NOT NULL AUTO_INCREMENT,
  `imagelink` varchar(210) DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  `isConfirm` int(2) DEFAULT '0',
  `xvalue` int(11) DEFAULT '0',
  `yvalue` int(11) DEFAULT '0',
  PRIMARY KEY (`iduserimages`),
  KEY `homerandimg` (`iduserimages`,`imagelink`),
  KEY `images1` (`iduserimages`,`memberid`),
  KEY `profile1` (`memberid`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userimages33`
--

LOCK TABLES `userimages33` WRITE;
/*!40000 ALTER TABLE `userimages33` DISABLE KEYS */;
/*!40000 ALTER TABLE `userimages33` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userimages34`
--

DROP TABLE IF EXISTS `userimages34`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userimages34` (
  `iduserimages` int(11) NOT NULL AUTO_INCREMENT,
  `imagelink` varchar(210) DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  `isConfirm` int(2) DEFAULT '0',
  `xvalue` int(11) DEFAULT '0',
  `yvalue` int(11) DEFAULT '0',
  PRIMARY KEY (`iduserimages`),
  KEY `homerandimg` (`iduserimages`,`imagelink`),
  KEY `images1` (`iduserimages`,`memberid`),
  KEY `profile1` (`memberid`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userimages34`
--

LOCK TABLES `userimages34` WRITE;
/*!40000 ALTER TABLE `userimages34` DISABLE KEYS */;
/*!40000 ALTER TABLE `userimages34` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userimages37`
--

DROP TABLE IF EXISTS `userimages37`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userimages37` (
  `iduserimages` int(11) NOT NULL AUTO_INCREMENT,
  `imagelink` varchar(210) DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  `isConfirm` int(2) DEFAULT '0',
  `xvalue` int(11) DEFAULT '0',
  `yvalue` int(11) DEFAULT '0',
  PRIMARY KEY (`iduserimages`),
  KEY `homerandimg` (`iduserimages`,`imagelink`),
  KEY `images1` (`iduserimages`,`memberid`),
  KEY `profile1` (`memberid`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userimages37`
--

LOCK TABLES `userimages37` WRITE;
/*!40000 ALTER TABLE `userimages37` DISABLE KEYS */;
/*!40000 ALTER TABLE `userimages37` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-07 15:12:33
CREATE DATABASE  IF NOT EXISTS `vps-a-c_schemaresults` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `vps-a-c_schemaresults`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: vps-a-c_schemaresults
-- ------------------------------------------------------
-- Server version	5.5.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tblroomresults28`
--

DROP TABLE IF EXISTS `tblroomresults28`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblroomresults28` (
  `tblroomresultsid` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `troommemberid` int(11) DEFAULT NULL,
  `isreported` tinyint(4) DEFAULT '0',
  `isFavourresult` tinyint(4) DEFAULT '0',
  `isfavourited` tinyint(4) DEFAULT '0',
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `isfinished` tinyint(1) DEFAULT '0',
  `roomid` int(11) DEFAULT '0',
  `onlineid` int(11) DEFAULT '0',
  `blindroomid` int(11) DEFAULT '0',
  PRIMARY KEY (`tblroomresultsid`),
  KEY `spinreport1` (`memberid`,`troommemberid`,`roomid`),
  KEY `spinreport2` (`memberid`)
) ENGINE=InnoDB AUTO_INCREMENT=534 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblroomresults28`
--

LOCK TABLES `tblroomresults28` WRITE;
/*!40000 ALTER TABLE `tblroomresults28` DISABLE KEYS */;
INSERT INTO `tblroomresults28` VALUES (442,28,31,0,0,0,'2013-07-21 16:40:42','2013-07-21 16:41:12',1,0,589,0),(443,28,31,0,0,0,'2013-07-21 16:54:02','2013-07-21 16:54:32',1,0,590,0),(444,28,31,0,0,0,'2013-07-21 16:56:02','2013-07-21 16:56:32',1,0,591,0),(445,28,31,0,0,0,'2013-07-21 17:01:38','2013-07-21 17:02:08',1,0,592,0),(446,28,31,0,0,0,'2013-07-21 17:03:27','2013-07-21 17:03:57',1,0,593,0),(447,28,31,0,0,0,'2013-07-21 17:11:23','2013-07-21 17:11:53',1,0,594,0),(448,28,31,0,0,0,'2013-07-21 17:12:32','2013-07-21 17:13:02',1,0,595,0),(450,28,31,0,0,0,'2013-07-21 17:17:38','2013-07-21 17:18:08',1,0,597,0),(451,28,31,0,0,0,'2013-07-21 17:44:22','2013-07-21 17:44:52',1,0,598,0),(452,28,31,0,0,0,'2013-07-21 17:47:58','2013-07-21 17:48:28',1,0,599,0),(453,28,31,0,0,0,'2013-07-21 17:49:28','2013-07-21 17:49:58',1,0,600,0),(454,28,31,0,0,0,'2013-07-21 17:53:32','2013-07-21 17:54:02',1,0,601,0),(455,28,31,0,0,0,'2013-07-21 17:55:12','2013-07-21 17:55:42',1,0,602,0),(456,28,31,0,0,0,'2013-07-21 17:56:42','2013-07-21 17:57:12',1,0,603,0),(457,28,31,0,0,0,'2013-07-21 17:59:43','2013-07-21 18:00:13',1,0,604,0),(458,28,31,0,0,0,'2013-07-21 18:02:31','2013-07-21 18:03:01',1,0,605,0),(459,28,31,0,0,0,'2013-07-21 18:07:21','2013-07-21 18:07:51',1,0,606,0),(460,28,31,0,0,0,'2013-07-21 18:08:15','2013-07-21 18:08:45',1,0,607,0),(461,28,31,0,0,0,'2013-07-21 18:09:21','2013-07-21 18:09:51',1,0,608,0),(462,28,31,0,0,0,'2013-07-21 18:10:25','2013-07-21 18:10:55',1,0,609,0),(463,28,31,0,0,0,'2013-07-21 18:14:16','2013-07-21 18:14:46',1,0,610,0),(464,28,31,0,0,0,'2013-07-21 18:15:16','2013-07-21 18:15:46',1,0,611,0),(465,28,31,0,0,0,'2013-07-21 18:17:41','2013-07-21 18:18:11',1,0,612,0),(466,28,31,0,0,0,'2013-07-21 18:18:45','2013-07-21 18:19:15',1,0,613,0),(467,28,31,0,0,0,'2013-07-21 18:22:25','2013-07-21 18:22:55',1,0,614,0),(505,28,30,0,1,1,'2013-08-04 15:58:42','2013-08-04 15:59:10',1,0,678,0),(506,28,30,0,1,1,'2013-08-05 14:28:19','2013-08-05 14:28:44',1,0,680,0),(507,28,37,0,1,1,'2013-08-05 14:57:49','2013-08-05 14:58:29',1,0,684,0),(508,28,30,0,0,0,'2013-08-06 09:31:55','2013-08-06 09:33:39',1,0,698,0),(509,28,30,0,0,0,'2013-08-06 09:35:30','2013-08-06 09:38:00',1,0,699,0),(510,28,30,0,0,0,'2013-08-06 10:36:02','2013-08-06 10:36:21',1,0,722,0),(511,28,30,0,0,0,'2013-08-06 10:37:17','2013-08-06 10:37:43',1,0,723,0),(512,28,30,0,0,0,'2013-08-06 10:40:27','2013-08-06 10:41:09',1,0,725,0),(513,28,30,1,0,0,'2013-08-06 10:43:32','2013-08-06 10:43:59',1,0,726,0),(514,28,30,0,0,0,'2013-08-06 10:44:47','2013-08-06 10:46:06',1,0,727,0),(515,28,30,0,0,0,'2013-08-06 13:14:34','2013-08-06 13:15:14',1,80,0,0),(516,28,30,0,0,0,'2013-08-06 13:48:48','2013-08-06 13:49:28',1,81,0,0),(517,28,30,0,0,0,'2013-08-06 14:08:05','2013-08-06 14:08:45',1,88,0,0),(518,28,30,0,0,0,'2013-08-06 14:39:23','2013-08-06 14:40:03',1,99,0,0),(519,28,30,1,0,0,'2013-08-06 15:06:23','2013-08-06 15:06:35',1,0,744,0),(520,28,30,0,1,1,'2013-08-06 15:09:44','2013-08-06 15:10:12',1,0,745,0),(521,28,30,0,1,1,'2013-08-06 15:56:51','2013-08-06 15:57:08',1,0,747,0),(522,28,30,0,1,1,'2013-08-06 16:01:52','2013-08-06 16:02:10',1,0,748,0),(523,28,30,0,0,0,'2013-08-06 16:09:22','2013-08-06 16:10:12',1,0,749,0),(524,28,30,0,0,0,'2013-08-06 16:10:47','2013-08-06 16:21:51',1,0,750,0),(525,28,30,0,1,1,'2013-08-06 16:23:01','2013-08-06 16:23:30',1,0,751,0),(526,28,30,0,0,0,'2013-08-06 18:09:31','2013-08-06 18:10:40',1,0,752,0),(527,28,30,0,1,1,'2013-08-07 09:16:12','2013-08-07 09:16:27',1,0,753,0),(528,28,30,0,0,0,'2013-08-07 12:49:08','2013-08-07 12:49:48',1,132,0,0),(529,28,30,0,0,0,'2013-08-07 12:59:53','2013-08-07 13:00:33',1,135,0,0),(530,28,30,0,0,0,'2013-08-07 13:51:01','2013-08-07 13:51:41',1,137,0,0),(531,28,30,0,0,0,'2013-08-07 14:05:51','2013-08-07 14:06:31',1,138,0,0),(532,28,30,0,0,0,'2013-08-07 14:13:21','2013-08-07 14:13:42',1,139,0,0),(533,28,30,0,0,0,'2013-08-07 14:38:29','2013-08-07 14:39:09',1,141,0,0);
/*!40000 ALTER TABLE `tblroomresults28` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblroomresults30`
--

DROP TABLE IF EXISTS `tblroomresults30`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblroomresults30` (
  `tblroomresultsid` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `troommemberid` int(11) DEFAULT NULL,
  `isreported` tinyint(4) DEFAULT '0',
  `isFavourresult` tinyint(4) DEFAULT '0',
  `isfavourited` tinyint(4) DEFAULT '0',
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `isfinished` tinyint(1) DEFAULT '0',
  `roomid` int(11) DEFAULT '0',
  `onlineid` int(11) DEFAULT '0',
  `blindroomid` int(11) DEFAULT '0',
  PRIMARY KEY (`tblroomresultsid`),
  KEY `spinreport1` (`memberid`,`troommemberid`,`roomid`),
  KEY `spinreport2` (`memberid`)
) ENGINE=InnoDB AUTO_INCREMENT=506 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblroomresults30`
--

LOCK TABLES `tblroomresults30` WRITE;
/*!40000 ALTER TABLE `tblroomresults30` DISABLE KEYS */;
INSERT INTO `tblroomresults30` VALUES (476,30,28,0,1,1,'2013-08-04 15:58:42','2013-08-04 15:59:10',1,0,678,0),(477,30,28,0,1,1,'2013-08-05 14:28:19','2013-08-05 14:28:45',1,0,680,0),(478,30,28,0,0,0,'2013-08-06 09:31:56','2013-08-06 09:33:39',1,0,698,0),(479,30,28,0,0,0,'2013-08-06 09:35:30','2013-08-06 09:38:00',1,0,699,0),(480,30,28,0,0,0,'2013-08-06 10:36:02','2013-08-06 10:36:21',1,0,722,0),(481,30,28,0,0,0,'2013-08-06 10:37:17','2013-08-06 10:37:43',1,0,723,0),(482,30,28,0,0,0,'2013-08-06 10:40:27','2013-08-06 10:41:09',1,0,725,0),(483,30,28,0,0,0,'2013-08-06 10:43:32','2013-08-06 10:43:59',1,0,726,0),(484,30,28,0,0,0,'2013-08-06 10:44:47','2013-08-06 10:46:06',1,0,727,0),(485,30,31,0,0,0,'2013-08-06 11:16:15','2013-08-06 11:18:45',1,0,737,0),(486,30,31,0,0,0,'2013-08-06 11:49:00','2013-08-06 11:51:30',1,0,739,0),(487,30,28,0,0,0,'2013-08-06 13:14:33','2013-08-06 13:15:13',1,80,0,0),(488,30,28,0,0,0,'2013-08-06 13:48:48','2013-08-06 13:49:28',1,81,0,0),(489,30,28,0,0,0,'2013-08-06 14:08:05','2013-08-06 14:08:45',1,88,0,0),(490,30,28,0,0,0,'2013-08-06 14:39:23','2013-08-06 14:40:03',1,99,0,0),(491,30,28,0,0,0,'2013-08-06 15:06:23','2013-08-06 15:06:35',1,0,744,0),(492,30,28,0,1,1,'2013-08-06 15:09:43','2013-08-06 15:10:12',1,0,745,0),(493,30,28,0,1,1,'2013-08-06 15:56:51','2013-08-06 15:57:08',1,0,747,0),(494,30,28,0,1,1,'2013-08-06 16:01:52','2013-08-06 16:02:10',1,0,748,0),(495,30,28,0,0,0,'2013-08-06 16:09:21','2013-08-06 16:10:12',1,0,749,0),(496,30,28,0,0,0,'2013-08-06 16:10:46','2013-08-06 16:21:51',1,0,750,0),(497,30,28,0,1,1,'2013-08-06 16:23:02','2013-08-06 16:23:30',1,0,751,0),(498,30,28,1,0,0,'2013-08-06 18:09:31','2013-08-06 18:10:40',1,0,752,0),(499,30,28,0,1,1,'2013-08-07 09:16:12','2013-08-07 09:16:27',1,0,753,0),(500,30,28,0,0,0,'2013-08-07 12:49:08','2013-08-07 12:49:48',1,132,0,0),(501,30,28,0,0,0,'2013-08-07 12:59:53','2013-08-07 13:00:33',1,135,0,0),(502,30,28,0,0,0,'2013-08-07 13:51:01','2013-08-07 13:51:41',1,137,0,0),(503,30,28,0,0,0,'2013-08-07 14:05:51','2013-08-07 14:06:31',1,138,0,0),(504,30,28,0,0,0,'2013-08-07 14:13:22','2013-08-07 14:13:42',1,139,0,0),(505,30,28,0,0,0,'2013-08-07 14:38:29','2013-08-07 14:39:09',1,141,0,0);
/*!40000 ALTER TABLE `tblroomresults30` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblroomresults31`
--

DROP TABLE IF EXISTS `tblroomresults31`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblroomresults31` (
  `tblroomresultsid` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `troommemberid` int(11) DEFAULT NULL,
  `isreported` tinyint(4) DEFAULT '0',
  `isFavourresult` tinyint(4) DEFAULT '0',
  `isfavourited` tinyint(4) DEFAULT '0',
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `isfinished` tinyint(1) DEFAULT '0',
  `roomid` int(11) DEFAULT '0',
  `onlineid` int(11) DEFAULT '0',
  `blindroomid` int(11) DEFAULT '0',
  PRIMARY KEY (`tblroomresultsid`),
  KEY `spinreport1` (`memberid`,`troommemberid`,`roomid`),
  KEY `spinreport2` (`memberid`)
) ENGINE=InnoDB AUTO_INCREMENT=462 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblroomresults31`
--

LOCK TABLES `tblroomresults31` WRITE;
/*!40000 ALTER TABLE `tblroomresults31` DISABLE KEYS */;
INSERT INTO `tblroomresults31` VALUES (435,31,28,0,0,0,'2013-07-21 16:40:42','2013-07-21 16:41:12',1,0,589,0),(436,31,28,0,0,0,'2013-07-21 16:54:02','2013-07-21 16:54:32',1,0,590,0),(437,31,28,0,0,0,'2013-07-21 16:56:02','2013-07-21 16:56:32',1,0,591,0),(438,31,28,0,0,0,'2013-07-21 17:01:38','2013-07-21 17:02:08',1,0,592,0),(439,31,28,0,0,0,'2013-07-21 17:03:27','2013-07-21 17:03:57',1,0,593,0),(440,31,28,0,0,0,'2013-07-21 17:11:23','2013-07-21 17:11:53',1,0,594,0),(441,31,28,0,0,0,'2013-07-21 17:12:32','2013-07-21 17:13:02',1,0,595,0),(442,31,28,0,0,0,'2013-07-21 17:17:38','2013-07-21 17:18:08',1,0,597,0),(443,31,28,0,0,0,'2013-07-21 17:44:23','2013-07-21 17:44:53',1,0,598,0),(444,31,28,0,0,0,'2013-07-21 17:47:58','2013-07-21 17:48:28',1,0,599,0),(445,31,28,0,0,0,'2013-07-21 17:49:27','2013-07-21 17:49:57',1,0,600,0),(446,31,28,0,0,0,'2013-07-21 17:53:32','2013-07-21 17:54:02',1,0,601,0),(447,31,28,0,0,0,'2013-07-21 17:55:12','2013-07-21 17:55:42',1,0,602,0),(448,31,28,0,0,0,'2013-07-21 17:56:42','2013-07-21 17:57:12',1,0,603,0),(449,31,28,0,0,0,'2013-07-21 17:59:43','2013-07-21 18:00:13',1,0,604,0),(450,31,28,0,0,0,'2013-07-21 18:02:31','2013-07-21 18:03:01',1,0,605,0),(451,31,28,0,0,0,'2013-07-21 18:07:21','2013-07-21 18:07:51',1,0,606,0),(452,31,28,0,0,0,'2013-07-21 18:08:15','2013-07-21 18:08:45',1,0,607,0),(453,31,28,0,0,0,'2013-07-21 18:09:21','2013-07-21 18:09:51',1,0,608,0),(454,31,28,0,0,0,'2013-07-21 18:10:25','2013-07-21 18:10:55',1,0,609,0),(455,31,28,0,0,0,'2013-07-21 18:14:16','2013-07-21 18:14:46',1,0,610,0),(456,31,28,0,0,0,'2013-07-21 18:15:16','2013-07-21 18:15:46',1,0,611,0),(457,31,28,0,0,0,'2013-07-21 18:17:41','2013-07-21 18:18:11',1,0,612,0),(458,31,28,0,0,0,'2013-07-21 18:18:45','2013-07-21 18:19:15',1,0,613,0),(459,31,28,0,0,0,'2013-07-21 18:22:25','2013-07-21 18:22:55',1,0,614,0),(460,31,30,0,0,0,'2013-08-06 11:16:16','2013-08-06 11:18:46',1,0,737,0),(461,31,30,0,0,0,'2013-08-06 11:49:00','2013-08-06 11:51:30',1,0,739,0);
/*!40000 ALTER TABLE `tblroomresults31` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblroomresults33`
--

DROP TABLE IF EXISTS `tblroomresults33`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblroomresults33` (
  `tblroomresultsid` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `troommemberid` int(11) DEFAULT NULL,
  `isreported` tinyint(4) DEFAULT '0',
  `isFavourresult` tinyint(4) DEFAULT '0',
  `isfavourited` tinyint(4) DEFAULT '0',
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `isfinished` tinyint(1) DEFAULT '0',
  `roomid` int(11) DEFAULT '0',
  `onlineid` int(11) DEFAULT '0',
  `blindroomid` int(11) DEFAULT '0',
  PRIMARY KEY (`tblroomresultsid`),
  KEY `spinreport1` (`memberid`,`troommemberid`,`roomid`),
  KEY `spinreport2` (`memberid`)
) ENGINE=InnoDB AUTO_INCREMENT=434 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblroomresults33`
--

LOCK TABLES `tblroomresults33` WRITE;
/*!40000 ALTER TABLE `tblroomresults33` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblroomresults33` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblroomresults34`
--

DROP TABLE IF EXISTS `tblroomresults34`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblroomresults34` (
  `tblroomresultsid` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `troommemberid` int(11) DEFAULT NULL,
  `isreported` tinyint(4) DEFAULT '0',
  `isFavourresult` tinyint(4) DEFAULT '0',
  `isfavourited` tinyint(4) DEFAULT '0',
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `isfinished` tinyint(1) DEFAULT '0',
  `roomid` int(11) DEFAULT '0',
  `onlineid` int(11) DEFAULT '0',
  `blindroomid` int(11) DEFAULT '0',
  PRIMARY KEY (`tblroomresultsid`),
  KEY `spinreport1` (`memberid`,`troommemberid`,`roomid`),
  KEY `spinreport2` (`memberid`)
) ENGINE=InnoDB AUTO_INCREMENT=434 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblroomresults34`
--

LOCK TABLES `tblroomresults34` WRITE;
/*!40000 ALTER TABLE `tblroomresults34` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblroomresults34` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblroomresults37`
--

DROP TABLE IF EXISTS `tblroomresults37`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblroomresults37` (
  `tblroomresultsid` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `troommemberid` int(11) DEFAULT NULL,
  `isreported` tinyint(4) DEFAULT '0',
  `isFavourresult` tinyint(4) DEFAULT '0',
  `isfavourited` tinyint(4) DEFAULT '0',
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `isfinished` tinyint(1) DEFAULT '0',
  `roomid` int(11) DEFAULT '0',
  `onlineid` int(11) DEFAULT '0',
  `blindroomid` int(11) DEFAULT '0',
  PRIMARY KEY (`tblroomresultsid`),
  KEY `spinreport1` (`memberid`,`troommemberid`,`roomid`),
  KEY `spinreport2` (`memberid`)
) ENGINE=InnoDB AUTO_INCREMENT=435 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblroomresults37`
--

LOCK TABLES `tblroomresults37` WRITE;
/*!40000 ALTER TABLE `tblroomresults37` DISABLE KEYS */;
INSERT INTO `tblroomresults37` VALUES (434,37,28,0,1,1,'2013-08-05 14:57:48','2013-08-05 14:58:29',1,0,684,0);
/*!40000 ALTER TABLE `tblroomresults37` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-07 15:12:34
CREATE DATABASE  IF NOT EXISTS `vps-a-c_schemachat` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `vps-a-c_schemachat`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: vps-a-c_schemachat
-- ------------------------------------------------------
-- Server version	5.5.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbldatechat28`
--

DROP TABLE IF EXISTS `tbldatechat28`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldatechat28` (
  `idtbldatechat` int(11) NOT NULL AUTO_INCREMENT,
  `chatcontent` text,
  `chatdate` datetime DEFAULT NULL,
  `chatdateid` int(11) DEFAULT '0',
  `datemember1` int(11) DEFAULT NULL,
  `datemember2` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtbldatechat`)
) ENGINE=InnoDB AUTO_INCREMENT=338 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldatechat28`
--

LOCK TABLES `tbldatechat28` WRITE;
/*!40000 ALTER TABLE `tbldatechat28` DISABLE KEYS */;
INSERT INTO `tbldatechat28` VALUES (260,'sdfdsf','2013-07-21 11:31:05',582,28,29),(261,'dsfsdf','2013-07-21 11:31:08',582,29,28),(262,'dsfsdf','2013-07-21 11:31:11',582,29,28),(263,'dfsdf','2013-07-21 11:31:13',582,28,29),(264,'sadsad','2013-07-21 16:18:35',585,31,28),(265,'sadsad','2013-07-21 16:18:41',585,28,31),(266,':D sadadsad','2013-07-21 16:18:46',585,28,31),(267,':])sadasd ','2013-07-21 16:18:51',585,31,28),(268,'sdsad','2013-07-21 16:28:52',587,30,28),(269,'sadasd','2013-07-21 16:28:54',587,28,30),(270,'asdasd','2013-07-21 16:28:58',587,30,28),(271,'asdasd','2013-07-21 16:29:01',587,28,30),(272,'fdgfdg','2013-07-22 09:10:37',621,30,28),(273,'fdgfdg','2013-07-22 09:10:40',621,28,30),(274,'asdsad','2013-07-22 13:22:20',636,30,28),(275,'dsfds','2013-07-22 15:05:30',166780,28,30),(276,'dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddsssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','2013-07-22 15:21:33',637,30,28),(277,'sadasd asdasd asda dsad sda sd asdasdasd asd sa dasdasdasdasdas','2013-07-22 15:21:53',637,30,28),(278,'sdfsdf','2013-07-30 10:33:11',51,30,28),(279,'dsfsdfds','2013-07-30 10:33:14',51,28,30),(280,'dsfsdf','2013-07-30 10:33:18',51,30,28),(281,'dsfdsf dfsfsdf','2013-07-30 10:33:22',51,28,30),(282,'sadasd','2013-07-30 16:49:05',667,30,28),(283,'fsdfsd','2013-07-30 16:52:50',668,28,30),(284,'dsfdsf','2013-07-30 16:52:53',668,30,28),(285,'sdfsdf','2013-07-30 16:54:20',669,28,30),(286,'dsfsdfsdf','2013-07-30 16:54:23',669,30,28),(287,'sdfsdf sdff sdf','2013-07-30 16:54:29',669,28,30),(288,'sadasd','2013-07-31 09:41:55',676,30,28),(289,'asdasd','2013-07-31 09:41:58',676,28,30),(290,'SDFSDFDS','2013-08-04 15:58:49',678,30,28),(291,'SDFSDFDSF','2013-08-04 15:58:52',678,28,30),(292,'dfdsfsd','2013-08-05 14:28:24',680,30,28),(293,'dsfdsfdsf','2013-08-05 14:28:27',680,28,30),(294,'sdfsdfdsf','2013-08-05 14:28:31',680,30,28),(295,'sdfsdf','2013-08-05 14:28:34',680,28,30),(296,'sfdsdfds','2013-08-05 14:57:53',684,37,28),(297,'dfssdfsd','2013-08-05 14:57:56',684,28,37),(298,'dsfsdf','2013-08-05 14:57:59',684,37,28),(299,'dsfsdfsd','2013-08-05 14:58:03',684,28,37),(300,'dsfsdf','2013-08-05 14:58:09',684,37,28),(301,'dsfdsfds','2013-08-05 14:58:14',684,28,37),(302,'sadsad','2013-08-06 10:37:23',723,30,28),(303,'sadsad','2013-08-06 10:37:26',723,28,30),(304,'sadasd','2013-08-06 10:40:37',725,30,28),(305,'sadsad','2013-08-06 10:40:40',725,28,30),(306,'sadasd','2013-08-06 10:40:45',725,30,28),(307,'asdasd','2013-08-06 10:40:48',725,28,30),(308,'^_^','2013-08-06 10:40:56',725,30,28),(309,'sdfsdf','2013-08-06 10:44:55',727,28,30),(310,'dsfsdf','2013-08-06 10:44:58',727,30,28),(311,'sadsad','2013-08-06 15:09:48',745,30,28),(312,'asdsad','2013-08-06 15:09:51',745,28,30),(313,'asdsad','2013-08-06 15:09:57',745,30,28),(314,'dfsdfs','2013-08-06 18:09:35',752,30,28),(315,'dsfsdfsd ','2013-08-06 18:09:38',752,28,30),(316,'dsfds sdf sdfafdas fads fads fa','2013-08-06 18:09:41',752,28,30),(317,'sd fsdf sadf asdf','2013-08-06 18:09:42',752,28,30),(318,'sdf sdf sd','2013-08-06 18:09:43',752,28,30),(319,'s dfsd fsdf','2013-08-06 18:09:45',752,28,30),(320,'dsf sdf sdf ','2013-08-06 18:09:46',752,28,30),(321,'dsfsdfsdf','2013-08-06 18:09:47',752,28,30),(322,'dsfsd fsd fFA f daF','2013-08-06 18:09:52',752,30,28),(323,'d fDF DF','2013-08-06 18:09:53',752,30,28),(324,'S DFsdfdsf dsf','2013-08-06 18:09:54',752,30,28),(325,'sd fsd f','2013-08-06 18:09:56',752,30,28),(326,'s dfsd fsdf','2013-08-06 18:09:57',752,30,28),(327,'sd fsdfsdf','2013-08-06 18:09:58',752,30,28),(328,' sdfsdf sdfsdf','2013-08-06 18:10:00',752,30,28),(329,' sdfsd fafdsdf ','2013-08-06 18:10:02',752,30,28),(330,' sdfsd f','2013-08-06 18:10:03',752,30,28),(331,'s dfdsf','2013-08-06 18:10:06',752,30,28),(332,'sdfsdfsdf','2013-08-06 18:10:10',752,28,30),(333,'dsfsdfadsfsdf','2013-08-06 18:10:15',752,30,28),(334,'dsfsd fsdf ','2013-08-06 18:10:20',752,28,30),(335,'dsfsdfsdf','2013-08-06 18:10:24',752,30,28),(336,'^_^','2013-08-06 18:10:30',752,28,30),(337,'dsfsd fsd f','2013-08-06 18:10:34',752,30,28);
/*!40000 ALTER TABLE `tbldatechat28` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldatechat30`
--

DROP TABLE IF EXISTS `tbldatechat30`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldatechat30` (
  `idtbldatechat` int(11) NOT NULL AUTO_INCREMENT,
  `chatcontent` text,
  `chatdate` datetime DEFAULT NULL,
  `chatdateid` int(11) DEFAULT '0',
  `datemember1` int(11) DEFAULT NULL,
  `datemember2` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtbldatechat`)
) ENGINE=InnoDB AUTO_INCREMENT=324 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldatechat30`
--

LOCK TABLES `tbldatechat30` WRITE;
/*!40000 ALTER TABLE `tbldatechat30` DISABLE KEYS */;
INSERT INTO `tbldatechat30` VALUES (260,'sdsad','2013-07-21 16:28:52',587,30,28),(261,'sadasd','2013-07-21 16:28:54',587,28,30),(262,'asdasd','2013-07-21 16:28:58',587,30,28),(263,'asdasd','2013-07-21 16:29:01',587,28,30),(264,'fdgfdg','2013-07-22 09:10:37',621,30,28),(265,'fdgfdg','2013-07-22 09:10:40',621,28,30),(266,'asdsad','2013-07-22 13:22:20',636,30,28),(267,'dsfds','2013-07-22 15:05:30',166780,28,30),(268,'dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddsssssssssssssssssssssaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','2013-07-22 15:21:33',637,30,28),(269,'sadasd asdasd asda dsad sda sd asdasdasd asd sa dasdasdasdasdas','2013-07-22 15:21:53',637,30,28),(270,'sdfsdf','2013-07-30 10:33:11',51,30,28),(271,'dsfsdfds','2013-07-30 10:33:15',51,28,30),(272,'dsfsdf','2013-07-30 10:33:18',51,30,28),(273,'dsfdsf dfsfsdf','2013-07-30 10:33:22',51,28,30),(274,'sadasd','2013-07-30 16:49:05',667,30,28),(275,'fsdfsd','2013-07-30 16:52:50',668,28,30),(276,'dsfdsf','2013-07-30 16:52:53',668,30,28),(277,'sdfsdf','2013-07-30 16:54:20',669,28,30),(278,'dsfsdfsdf','2013-07-30 16:54:23',669,30,28),(279,'sdfsdf sdff sdf','2013-07-30 16:54:29',669,28,30),(280,'sadasd','2013-07-31 09:41:55',676,30,28),(281,'asdasd','2013-07-31 09:41:58',676,28,30),(282,'SDFSDFDS','2013-08-04 15:58:49',678,30,28),(283,'SDFSDFDSF','2013-08-04 15:58:52',678,28,30),(284,'dfdsfsd','2013-08-05 14:28:24',680,30,28),(285,'dsfdsfdsf','2013-08-05 14:28:27',680,28,30),(286,'sdfsdfdsf','2013-08-05 14:28:31',680,30,28),(287,'sdfsdf','2013-08-05 14:28:34',680,28,30),(288,'sadsad','2013-08-06 10:37:23',723,30,28),(289,'sadsad','2013-08-06 10:37:26',723,28,30),(290,'sadasd','2013-08-06 10:40:37',725,30,28),(291,'sadsad','2013-08-06 10:40:40',725,28,30),(292,'sadasd','2013-08-06 10:40:45',725,30,28),(293,'asdasd','2013-08-06 10:40:48',725,28,30),(294,'^_^','2013-08-06 10:40:56',725,30,28),(295,'sdfsdf','2013-08-06 10:44:55',727,28,30),(296,'dsfsdf','2013-08-06 10:44:58',727,30,28),(297,'sadsad','2013-08-06 15:09:48',745,30,28),(298,'asdsad','2013-08-06 15:09:51',745,28,30),(299,'asdsad','2013-08-06 15:09:57',745,30,28),(300,'dfsdfs','2013-08-06 18:09:35',752,30,28),(301,'dsfsdfsd ','2013-08-06 18:09:38',752,28,30),(302,'dsfds sdf sdfafdas fads fads fa','2013-08-06 18:09:41',752,28,30),(303,'sd fsdf sadf asdf','2013-08-06 18:09:42',752,28,30),(304,'sdf sdf sd','2013-08-06 18:09:43',752,28,30),(305,'s dfsd fsdf','2013-08-06 18:09:45',752,28,30),(306,'dsf sdf sdf ','2013-08-06 18:09:46',752,28,30),(307,'dsfsdfsdf','2013-08-06 18:09:47',752,28,30),(308,'dsfsd fsd fFA f daF','2013-08-06 18:09:52',752,30,28),(309,'d fDF DF','2013-08-06 18:09:53',752,30,28),(310,'S DFsdfdsf dsf','2013-08-06 18:09:54',752,30,28),(311,'sd fsd f','2013-08-06 18:09:56',752,30,28),(312,'s dfsd fsdf','2013-08-06 18:09:57',752,30,28),(313,'sd fsdfsdf','2013-08-06 18:09:58',752,30,28),(314,' sdfsdf sdfsdf','2013-08-06 18:10:00',752,30,28),(315,' sdfsd fafdsdf ','2013-08-06 18:10:02',752,30,28),(316,' sdfsd f','2013-08-06 18:10:03',752,30,28),(317,'s dfdsf','2013-08-06 18:10:06',752,30,28),(318,'sdfsdfsdf','2013-08-06 18:10:10',752,28,30),(319,'dsfsdfadsfsdf','2013-08-06 18:10:15',752,30,28),(320,'dsfsd fsdf ','2013-08-06 18:10:20',752,28,30),(321,'dsfsdfsdf','2013-08-06 18:10:24',752,30,28),(322,'^_^','2013-08-06 18:10:30',752,28,30),(323,'dsfsd fsd f','2013-08-06 18:10:34',752,30,28);
/*!40000 ALTER TABLE `tbldatechat30` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldatechat31`
--

DROP TABLE IF EXISTS `tbldatechat31`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldatechat31` (
  `idtbldatechat` int(11) NOT NULL AUTO_INCREMENT,
  `chatcontent` text,
  `chatdate` datetime DEFAULT NULL,
  `chatdateid` int(11) DEFAULT '0',
  `datemember1` int(11) DEFAULT NULL,
  `datemember2` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtbldatechat`)
) ENGINE=InnoDB AUTO_INCREMENT=264 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldatechat31`
--

LOCK TABLES `tbldatechat31` WRITE;
/*!40000 ALTER TABLE `tbldatechat31` DISABLE KEYS */;
INSERT INTO `tbldatechat31` VALUES (260,'sadsad','2013-07-21 16:18:35',585,31,28),(261,'sadsad','2013-07-21 16:18:41',585,28,31),(262,':D sadadsad','2013-07-21 16:18:46',585,28,31),(263,':])sadasd ','2013-07-21 16:18:51',585,31,28);
/*!40000 ALTER TABLE `tbldatechat31` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldatechat33`
--

DROP TABLE IF EXISTS `tbldatechat33`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldatechat33` (
  `idtbldatechat` int(11) NOT NULL AUTO_INCREMENT,
  `chatcontent` text,
  `chatdate` datetime DEFAULT NULL,
  `chatdateid` int(11) DEFAULT '0',
  `datemember1` int(11) DEFAULT NULL,
  `datemember2` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtbldatechat`)
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldatechat33`
--

LOCK TABLES `tbldatechat33` WRITE;
/*!40000 ALTER TABLE `tbldatechat33` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldatechat33` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldatechat34`
--

DROP TABLE IF EXISTS `tbldatechat34`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldatechat34` (
  `idtbldatechat` int(11) NOT NULL AUTO_INCREMENT,
  `chatcontent` text,
  `chatdate` datetime DEFAULT NULL,
  `chatdateid` int(11) DEFAULT '0',
  `datemember1` int(11) DEFAULT NULL,
  `datemember2` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtbldatechat`)
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldatechat34`
--

LOCK TABLES `tbldatechat34` WRITE;
/*!40000 ALTER TABLE `tbldatechat34` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldatechat34` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldatechat37`
--

DROP TABLE IF EXISTS `tbldatechat37`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldatechat37` (
  `idtbldatechat` int(11) NOT NULL AUTO_INCREMENT,
  `chatcontent` text,
  `chatdate` datetime DEFAULT NULL,
  `chatdateid` int(11) DEFAULT '0',
  `datemember1` int(11) DEFAULT NULL,
  `datemember2` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtbldatechat`)
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldatechat37`
--

LOCK TABLES `tbldatechat37` WRITE;
/*!40000 ALTER TABLE `tbldatechat37` DISABLE KEYS */;
INSERT INTO `tbldatechat37` VALUES (260,'sfdsdfds','2013-08-05 14:57:53',684,37,28),(261,'dfssdfsd','2013-08-05 14:57:56',684,28,37),(262,'dsfsdf','2013-08-05 14:57:59',684,37,28),(263,'dsfsdfsd','2013-08-05 14:58:03',684,28,37),(264,'dsfsdf','2013-08-05 14:58:09',684,37,28),(265,'dsfdsfds','2013-08-05 14:58:14',684,28,37);
/*!40000 ALTER TABLE `tbldatechat37` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-07 15:12:35
CREATE DATABASE  IF NOT EXISTS `spindate` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `spindate`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: spindate
-- ------------------------------------------------------
-- Server version	5.5.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adminmanagers`
--

DROP TABLE IF EXISTS `adminmanagers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminmanagers` (
  `ManID` int(11) NOT NULL AUTO_INCREMENT,
  `ManUN` varchar(210) DEFAULT NULL,
  `ManPass` varchar(20) DEFAULT NULL,
  `SiteID` int(11) DEFAULT NULL,
  `secLevel` int(4) DEFAULT NULL,
  `LastLogin` datetime DEFAULT NULL,
  `manageremail` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ManID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminmanagers`
--

LOCK TABLES `adminmanagers` WRITE;
/*!40000 ALTER TABLE `adminmanagers` DISABLE KEYS */;
INSERT INTO `adminmanagers` VALUES (1,'yossi','y1234',2,4,'2013-05-21 11:43:11','yossi@comstar.co.il'),(3,'omer','o1234',2,4,NULL,NULL),(4,'comstar','1qazxcvb',2,1,'2013-08-04 11:59:03',NULL),(5,'spindate','s1234',2,2,'2013-05-21 11:31:26','');
/*!40000 ALTER TABLE `adminmanagers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminpages`
--

DROP TABLE IF EXISTS `adminpages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminpages` (
  `catID` int(11) NOT NULL AUTO_INCREMENT,
  `catParent` int(11) DEFAULT NULL,
  `catOrder` int(11) DEFAULT NULL,
  `catText` varchar(255) DEFAULT NULL,
  `catLink` varchar(255) DEFAULT NULL,
  `isHeader` int(11) DEFAULT NULL,
  `secLevel` int(11) DEFAULT NULL,
  `delfeild` tinyint(1) DEFAULT '1',
  `catTextEng` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`catID`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminpages`
--

LOCK TABLES `adminpages` WRITE;
/*!40000 ALTER TABLE `adminpages` DISABLE KEYS */;
INSERT INTO `adminpages` VALUES (1,0,4,'ניהול מערכת','AdminHome.aspx?type=4',0,4,0,'spindate system'),(3,88,1,'ניהול דפים כללים','ManageGeneralPage.aspx',0,1,0,'manage general pages'),(4,1,1,'כללי','',1,4,0,'System setting'),(23,88,6,'ניהול פרמטרים','ManageParameters.aspx',0,1,0,'SEO DATA'),(30,0,6,'הגדרות','AdminHome.aspx?type=5',1,4,0,'Setting'),(31,30,1,'הגדרות אתר','EditSite.aspx?id=2',0,4,0,'Site setting'),(39,30,3,'ניהול פרמטרים למתכנת','ManageParameterProgramer.aspx',0,1,0,'programer parameters managing'),(40,30,4,'ניהול מנהלים','ManageSiteManager.aspx',0,4,0,'manage managers'),(41,30,5,'ניהול דפי ניהול','ManageAdminPages.aspx',0,1,0,'manage  manage page'),(43,88,2,'ניהול טקסטים מתכנת','ManageGeneralTextProg.aspx',0,1,0,'programers manage text'),(44,30,6,'ניהול שפות(אתרים)','ManageLang.aspx',0,1,1,'manage langauges (Sites)'),(47,0,3,'ניהול אתר(דף נחיתה)','AdminHome.aspx?type=3',0,4,1,'Spindate site'),(48,47,1,'כללי','',1,4,1,'Site data'),(49,88,1,'ניהול דפים','ManageGeneralSitePage.aspx',0,1,1,'Manage pages'),(50,47,10,'ניהול עזרה','ManageHelpCenter.aspx',0,4,1,'Manage help'),(51,47,11,'manage Blog','ManageEventCenter.aspx',0,4,1,'manage Blog'),(52,68,1,'תירגום דפים','ManageTransletChooseLang.aspx',0,4,1,'Translate Pages'),(53,47,5,'Manage contact subject','ManageContactTypes.aspx',0,4,1,'Manage contact subject'),(54,69,1,'ניהול שדות משתמש','ManageUserFields.aspx',0,4,1,'Dynamic user fields'),(55,67,1,'ניהול שפות','ManageSiteLang.aspx',0,4,1,'manage site language'),(56,68,2,'ניהול רשימות','ManageListData.aspx',0,4,1,'multi selection boxes'),(57,69,2,'ניהול תוכן חדר המתנה','ManageGames.aspx',0,4,1,'Content - Waiting Room'),(58,69,3,'ניהול תוכניות','ManageProgram.aspx',0,4,1,'Plans'),(59,68,4,'ניהול דרופס','ManageBuildDrop.aspx',0,1,1,'Manage Drops'),(60,47,6,'ניהול דפים כללים','ManagePages.aspx',0,4,1,'manage general pages'),(61,69,4,'ניהול קופונים','ManageCoupons.aspx',0,4,1,'Coupons'),(62,4,1,'ניהול פרמטרים מערכת','ManageSystemParam.aspx',0,4,1,'system parameter'),(63,0,5,'ניהול משתמשים','ManageUsers.aspx',0,4,1,'Spindate users'),(64,4,2,'אישור תמונות','manageConfirmImg.aspx',0,4,1,'confirm picture'),(65,0,1,'דף הבית','AdminHome.aspx',0,4,1,'Home'),(66,0,2,'ניהול שפות','AdminHome.aspx?type=2',0,4,1,'Languages'),(67,66,1,'ניהול שפות חדשות','',1,4,1,'Edit Spindate Languages'),(68,66,2,'ניהול מידע','',1,4,1,'Edit Content'),(69,1,2,'ניהול מידע- מערכת','',1,4,1,'System -Data'),(70,4,3,'סטטיסטיקות,','ManageStatic.aspx',0,4,1,'Online Statistics'),(71,47,13,'ניהול הודעות צור קשר','ManageContact.aspx',0,4,1,'Contact message'),(72,69,8,'ניהול תמונות','ManageSiteGift.aspx',0,4,1,'gifts'),(73,69,2,'התראות חדר המתנה','Managewaitalert.aspx',0,4,1,'Alerts -waiting room '),(74,69,2,'התראות חדר צאט','ManageChatalert.aspx',0,4,1,'Alert - Chat room'),(75,69,9,'ניהול מדריך','ManageGuide.aspx',0,4,1,'Guide stages'),(76,47,14,'ניהול טקסט למעלה','ManageTopLine.aspx',0,4,1,'Top line text');
/*!40000 ALTER TABLE `adminpages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adminsites`
--

DROP TABLE IF EXISTS `adminsites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminsites` (
  `siteID` int(11) NOT NULL AUTO_INCREMENT,
  `siteName` varchar(60) DEFAULT NULL,
  `siteURL` varchar(100) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `returnMail` varchar(45) DEFAULT NULL,
  `SMTPServer` varchar(60) DEFAULT NULL,
  `MailUserName` varchar(45) DEFAULT NULL,
  `MailPassword` varchar(45) DEFAULT NULL,
  `SendMail` varchar(45) DEFAULT NULL,
  `MailPort` varchar(45) DEFAULT NULL,
  `IsMailSSL` tinyint(1) DEFAULT NULL,
  `siteDomain` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`siteID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminsites`
--

LOCK TABLES `adminsites` WRITE;
/*!40000 ALTER TABLE `adminsites` DISABLE KEYS */;
INSERT INTO `adminsites` VALUES (2,'Spindate','http://localhost:54093/spindate.co.il','info@lafayetteitaly.com','yossi@comstar.co.il','smtp.gmail.com','yossicomstar@gmail.com','zxcvbnm,.','yossicomstar@gmail.com','587',1,'');
/*!40000 ALTER TABLE `adminsites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blockmembers`
--

DROP TABLE IF EXISTS `blockmembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blockmembers` (
  `blockmemberid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  `isblocked` tinyint(1) DEFAULT '0',
  `isHide` tinyint(1) DEFAULT '0',
  `isUnfavorite` tinyint(1) DEFAULT '0',
  `blockpublish` datetime DEFAULT NULL,
  `reportext` text,
  `isreported` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`blockmemberid`),
  KEY `setting1` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blockmembers`
--

LOCK TABLES `blockmembers` WRITE;
/*!40000 ALTER TABLE `blockmembers` DISABLE KEYS */;
INSERT INTO `blockmembers` VALUES (10,28,31,0,0,1,'2013-08-06 00:00:00','',0);
/*!40000 ALTER TABLE `blockmembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `countryid` int(11) NOT NULL AUTO_INCREMENT,
  `CountryNameeng` varchar(90) DEFAULT NULL,
  `countrycode` varchar(5) DEFAULT NULL,
  `countryshow` tinyint(1) DEFAULT '1',
  `countryflage` varchar(110) DEFAULT NULL,
  `1` varchar(90) DEFAULT NULL,
  `3` varchar(90) DEFAULT NULL,
  `4` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`countryid`),
  KEY `createroom` (`countryshow`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Afghanistan','AF',1,'../images/countries/germany665979_size033f724_size0.jpg','Afghanistan','אפגניסטן','Afghanistan'),(2,'Aland Islands','AX',0,NULL,'Aland Islands','Aland Islands','Aland Islands'),(3,'Albania','AL',0,'','Albania','אלבניה','Albania'),(4,'Algeria','DZ',0,NULL,'Algeria','Algeria','Algeria'),(5,'American Samoa','AS',0,NULL,'American Samoa','American Samoa','American Samoa'),(6,'Andorra','AD',0,'','Andorra','Andorra','Andorra'),(7,'Angola','AO',0,NULL,'Angola','Angola','Angola'),(8,'Anguilla','AI',0,NULL,'Anguilla','Anguilla','Anguilla'),(9,'Antarctica','AQ',0,NULL,'Antarctica','Antarctica','Antarctica'),(10,'Antigua And Barbuda','AG',0,NULL,'Antigua And Barbuda','Antigua And Barbuda','Antigua And Barbuda'),(11,'Argentina','AR',1,NULL,'Argentina','Argentina','Argentina'),(12,'Armenia','AM',0,NULL,'Armenia','Armenia','Armenia'),(13,'Aruba','AW',0,NULL,'Aruba','Aruba','Aruba'),(14,'Australia','AU',1,NULL,'Australia','Australia','Australia'),(15,'Austria','AT',1,NULL,'Austria','Austria','Austria'),(16,'Azerbaijan','AZ',0,NULL,'Azerbaijan','Azerbaijan','Azerbaijan'),(17,'Bahamas','BS',0,NULL,'Bahamas','Bahamas','Bahamas'),(18,'Bahrain','BH',0,NULL,'Bahrain','Bahrain','Bahrain'),(19,'Bangladesh','BD',0,NULL,'Bangladesh','Bangladesh','Bangladesh'),(20,'Barbados','BB',0,NULL,'Barbados','Barbados','Barbados'),(21,'Belarus','BY',0,NULL,'Belarus','Belarus','Belarus'),(22,'Belgium','BE',0,NULL,'Belgium','Belgium','Belgium'),(23,'Belize','BZ',0,NULL,'Belize','Belize','Belize'),(24,'Benin','BJ',0,NULL,'Benin','Benin','Benin'),(25,'Bermuda','BM',0,NULL,'Bermuda','Bermuda','Bermuda'),(26,'Bhutan','BT',0,NULL,'Bhutan','Bhutan','Bhutan'),(27,'Bolivia','BO',0,NULL,'Bolivia','Bolivia','Bolivia'),(28,'Bosnia And Herzegovina','BA',0,NULL,'Bosnia And Herzegovina','Bosnia And Herzegovina','Bosnia And Herzegovina'),(29,'Botswana','BW',0,NULL,'Botswana','Botswana','Botswana'),(30,'Bouvet Island','BV',0,NULL,'Bouvet Island','Bouvet Island','Bouvet Island'),(31,'Brazil','BR',1,NULL,'Brazil','Brazil','Brazil'),(32,'British Indian Ocean Territory','IO',0,NULL,'British Indian Ocean Territory','British Indian Ocean Territory','British Indian Ocean Territory'),(33,'Brunei Darussalam','BN',0,NULL,'Brunei Darussalam','Brunei Darussalam','Brunei Darussalam'),(34,'Bulgaria','BG',0,NULL,'Bulgaria','Bulgaria','Bulgaria'),(35,'Burkina Faso','BF',0,NULL,'Burkina Faso','Burkina Faso','Burkina Faso'),(36,'Burundi','BI',0,NULL,'Burundi','Burundi','Burundi'),(37,'Cambodia','KH',0,NULL,'Cambodia','Cambodia','Cambodia'),(38,'Cameroon','CM',0,NULL,'Cameroon','Cameroon','Cameroon'),(39,'Canada','CA',1,'../images/countries/canada43c6b6_size0.jpg','Canada','Canada','Canada'),(40,'Cape Verde','CV',0,NULL,'Cape Verde','Cape Verde','Cape Verde'),(41,'Cayman Islands','KY',0,NULL,'Cayman Islands','Cayman Islands','Cayman Islands'),(42,'Central African Republic','CF',0,NULL,'Central African Republic','Central African Republic','Central African Republic'),(43,'Chad','TD',0,NULL,'Chad','Chad','Chad'),(44,'Chile','CL',1,NULL,'Chile','Chile','Chile'),(45,'China','CN',1,NULL,'China','China','China'),(46,'Christmas Island','CX',0,NULL,'Christmas Island','Christmas Island','Christmas Island'),(47,'Cocos (Keeling) Islands','CC',0,NULL,'Cocos (Keeling) Islands','Cocos (Keeling) Islands','Cocos (Keeling) Islands'),(48,'Colombia','CO',1,NULL,'Colombia','Colombia','Colombia'),(49,'Comoros','KM',0,NULL,'Comoros','Comoros','Comoros'),(50,'Congo','CG',0,NULL,'Congo','Congo','Congo'),(51,'Congo, The Democratic Republic Of The','CD',0,NULL,'Congo, The Democratic Republic Of The','Congo, The Democratic Republic Of The','Congo, The Democratic Republic Of The'),(52,'Cook Islands','CK',0,NULL,'Cook Islands','Cook Islands','Cook Islands'),(53,'Costa Rica','CR',1,NULL,'Costa Rica','Costa Rica','Costa Rica'),(54,'Cote DIvoire','CI',0,NULL,'Cote DIvoire','Cote DIvoire','Cote DIvoire'),(55,'Croatia','HR',0,NULL,'Croatia','Croatia','Croatia'),(56,'Cuba','CU',1,NULL,'Cuba','Cuba','Cuba'),(57,'Cyprus','CY',1,NULL,'Cyprus','Cyprus','Cyprus'),(58,'Czech Republic','CZ',1,NULL,'Czech Republic','Czech Republic','Czech Republic'),(59,'Denmark','DK',0,NULL,'Denmark','Denmark','Denmark'),(60,'Djibouti','DJ',0,NULL,'Djibouti','Djibouti','Djibouti'),(61,'Dominica','DM',0,NULL,'Dominica','Dominica','Dominica'),(62,'Dominican Republic','DO',1,NULL,'Dominican Republic','Dominican Republic','Dominican Republic'),(63,'Ecuador','EC',0,NULL,'Ecuador','Ecuador','Ecuador'),(64,'Egypt','EG',0,NULL,'Egypt','Egypt','Egypt'),(65,'El Salvador','SV',0,NULL,'El Salvador','El Salvador','El Salvador'),(66,'Equatorial Guinea','GQ',0,NULL,'Equatorial Guinea','Equatorial Guinea','Equatorial Guinea'),(67,'Eritrea','ER',0,NULL,'Eritrea','Eritrea','Eritrea'),(68,'Estonia','EE',0,NULL,'Estonia','Estonia','Estonia'),(69,'Ethiopia','ET',0,NULL,'Ethiopia','Ethiopia','Ethiopia'),(70,'Falkland Islands (Malvinas)','FK',0,NULL,'Falkland Islands (Malvinas)','Falkland Islands (Malvinas)','Falkland Islands (Malvinas)'),(71,'Faroe Islands','FO',0,NULL,'Faroe Islands','Faroe Islands','Faroe Islands'),(72,'Fiji','FJ',0,NULL,'Fiji','Fiji','Fiji'),(73,'Finland','FI',1,NULL,'Finland','Finland','Finland'),(74,'France','FR',1,NULL,'France','France','France'),(75,'French Guiana','GF',0,NULL,'French Guiana','French Guiana','French Guiana'),(76,'French Polynesia','PF',0,NULL,'French Polynesia','French Polynesia','French Polynesia'),(77,'French Southern Territories','TF',0,NULL,'French Southern Territories','French Southern Territories','French Southern Territories'),(78,'Gabon','GA',0,NULL,'Gabon','Gabon','Gabon'),(79,'Gambia','GM',0,NULL,'Gambia','Gambia','Gambia'),(80,'Georgia','GE',0,NULL,'Georgia','Georgia','Georgia'),(81,'Germany','DE',1,'../images/countries/germany665979_size0.jpg','Germany','Germany','Germany'),(82,'Ghana','GH',0,NULL,'Ghana','Ghana','Ghana'),(83,'Gibraltar','GI',0,NULL,'Gibraltar','Gibraltar','Gibraltar'),(84,'Greece','GR',1,NULL,'Greece','Greece','Greece'),(85,'Greenland','GL',0,NULL,'Greenland','Greenland','Greenland'),(86,'Grenada','GD',0,NULL,'Grenada','Grenada','Grenada'),(87,'Guadeloupe','GP',0,NULL,'Guadeloupe','Guadeloupe','Guadeloupe'),(88,'Guam','GU',0,NULL,'Guam','Guam','Guam'),(89,'Guatemala','GT',0,NULL,'Guatemala','Guatemala','Guatemala'),(90,'Guernsey',' GG',0,NULL,'Guernsey','Guernsey','Guernsey'),(91,'Guinea','GN',0,NULL,'Guinea','Guinea','Guinea'),(92,'Guinea-Bissau','GW',0,NULL,'Guinea-Bissau','Guinea-Bissau','Guinea-Bissau'),(93,'Guyana','GY',0,NULL,'Guyana','Guyana','Guyana'),(94,'Haiti','HT',0,NULL,'Haiti','Haiti','Haiti'),(95,'Heard Island And Mcdonald Islands','HM',0,NULL,'Heard Island And Mcdonald Islands','Heard Island And Mcdonald Islands','Heard Island And Mcdonald Islands'),(96,'Holy See (Vatican City State)','VA',0,NULL,'Holy See (Vatican City State)','Holy See (Vatican City State)','Holy See (Vatican City State)'),(97,'Honduras','HN',0,NULL,'Honduras','Honduras','Honduras'),(98,'Hong Kong','HK',1,NULL,'Hong Kong','Hong Kong','Hong Kong'),(99,'Hungary','HU',1,NULL,'Hungary','Hungary','Hungary'),(100,'Iceland','IS',1,NULL,'Iceland','Iceland','Iceland'),(101,'India','IN',1,NULL,'India','India','India'),(102,'Indonesia','ID',0,NULL,'Indonesia','Indonesia','Indonesia'),(103,'Iran, Islamic Republic Of','IR',0,NULL,'Iran, Islamic Republic Of','Iran, Islamic Republic Of','Iran, Islamic Republic Of'),(104,'Iraq','IQ',0,NULL,'Iraq','Iraq','Iraq'),(105,'Ireland','IE',1,NULL,'Ireland','Ireland','Ireland'),(106,'Isle Of Man','IM',0,NULL,'Isle Of Man','Isle Of Man','Isle Of Man'),(107,'Israel','IL',1,'../images/countries/israelce0077_size0.jpg','Israel','ישראל','Israel'),(108,'Italy','IT',1,NULL,'Italy','Italy','Italy'),(109,'Jamaica','JM',1,NULL,'Jamaica','Jamaica','Jamaica'),(110,'Japan','JP',1,NULL,'Japan','Japan','Japan'),(111,'Jersey','JE',0,NULL,'Jersey','Jersey','Jersey'),(112,'Jordan','JO',1,NULL,'Jordan','Jordan','Jordan'),(113,'Kazakhstan','KZ',0,NULL,'Kazakhstan','Kazakhstan','Kazakhstan'),(114,'Kenya','KE',0,NULL,'Kenya','Kenya','Kenya'),(115,'Kiribati','KI',0,NULL,'Kiribati','Kiribati','Kiribati'),(116,'Korea, Democratic PeopleS Republic Of','KP',0,NULL,'Korea, Democratic PeopleS Republic Of','Korea, Democratic PeopleS Republic Of','Korea, Democratic PeopleS Republic Of'),(117,'Korea, Republic Of','KR',0,NULL,'Korea, Republic Of','Korea, Republic Of','Korea, Republic Of'),(118,'Kuwait','KW',0,NULL,'Kuwait','Kuwait','Kuwait'),(119,'Kyrgyzstan','KG',0,NULL,'Kyrgyzstan','Kyrgyzstan','Kyrgyzstan'),(120,'Lao PeopleS Democratic Republic','LA',0,NULL,'Lao PeopleS Democratic Republic','Lao PeopleS Democratic Republic','Lao PeopleS Democratic Republic'),(121,'Latvia','LV',0,NULL,'Latvia','Latvia','Latvia'),(122,'Lebanon','LB',0,NULL,'Lebanon','Lebanon','Lebanon'),(123,'Lesotho','LS',0,NULL,'Lesotho','Lesotho','Lesotho'),(124,'Liberia','LR',0,NULL,'Liberia','Liberia','Liberia'),(125,'Libyan Arab Jamahiriya','LY',0,NULL,'Libyan Arab Jamahiriya','Libyan Arab Jamahiriya','Libyan Arab Jamahiriya'),(126,'Liechtenstein','LI',0,NULL,'Liechtenstein','Liechtenstein','Liechtenstein'),(127,'Lithuania','LT',0,NULL,'Lithuania','Lithuania','Lithuania'),(128,'Luxembourg','LU',1,NULL,'Luxembourg','Luxembourg','Luxembourg'),(129,'Macao','MO',0,NULL,'Macao','Macao','Macao'),(130,'Macedonia, The Former Yugoslav Republic Of','MK',0,NULL,'Macedonia, The Former Yugoslav Republic Of','Macedonia, The Former Yugoslav Republic Of','Macedonia, The Former Yugoslav Republic Of'),(131,'Madagascar','MG',0,NULL,'Madagascar','Madagascar','Madagascar'),(132,'Malawi','MW',0,NULL,'Malawi','Malawi','Malawi'),(133,'Malaysia','MY',0,NULL,'Malaysia','Malaysia','Malaysia'),(134,'Maldives','MV',0,NULL,'Maldives','Maldives','Maldives'),(135,'Mali','ML',0,NULL,'Mali','Mali','Mali'),(136,'Malta','MT',1,NULL,'Malta','Malta','Malta'),(137,'Marshall Islands','MH',0,NULL,'Marshall Islands','Marshall Islands','Marshall Islands'),(138,'Martinique','MQ',0,NULL,'Martinique','Martinique','Martinique'),(139,'Mauritania','MR',0,NULL,'Mauritania','Mauritania','Mauritania'),(140,'Mauritius','MU',0,NULL,'Mauritius','Mauritius','Mauritius'),(141,'Mayotte','YT',0,NULL,'Mayotte','Mayotte','Mayotte'),(142,'Mexico','MX',0,NULL,'Mexico','Mexico','Mexico'),(143,'Micronesia, Federated States Of','FM',0,NULL,'Micronesia, Federated States Of','Micronesia, Federated States Of','Micronesia, Federated States Of'),(144,'Moldova, Republic Of','MD',0,NULL,'Moldova, Republic Of','Moldova, Republic Of','Moldova, Republic Of'),(145,'Monaco','MC',0,NULL,'Monaco','Monaco','Monaco'),(146,'Mongolia','MN',0,NULL,'Mongolia','Mongolia','Mongolia'),(147,'Montserrat','MS',0,NULL,'Montserrat','Montserrat','Montserrat'),(148,'Morocco','MA',1,NULL,'Morocco','Morocco','Morocco'),(149,'Mozambique','MZ',0,NULL,'Mozambique','Mozambique','Mozambique'),(150,'Myanmar','MM',0,NULL,'Myanmar','Myanmar','Myanmar'),(151,'Namibia','NA',0,NULL,'Namibia','Namibia','Namibia'),(152,'Nauru','NR',0,NULL,'Nauru','Nauru','Nauru'),(153,'Nepal','NP',0,NULL,'Nepal','Nepal','Nepal'),(154,'Netherlands','NL',1,NULL,'Netherlands','Netherlands','Netherlands'),(155,'Netherlands Antilles','AN',0,NULL,'Netherlands Antilles','Netherlands Antilles','Netherlands Antilles'),(156,'New Caledonia','NC',0,NULL,'New Caledonia','New Caledonia','New Caledonia'),(157,'New Zealand','NZ',1,NULL,'New Zealand','New Zealand','New Zealand'),(158,'Nicaragua','NI',0,NULL,'Nicaragua','Nicaragua','Nicaragua'),(159,'Niger','NE',0,NULL,'Niger','Niger','Niger'),(160,'Nigeria','NG',0,NULL,'Nigeria','Nigeria','Nigeria'),(161,'Niue','NU',0,NULL,'Niue','Niue','Niue'),(162,'Norfolk Island','NF',0,NULL,'Norfolk Island','Norfolk Island','Norfolk Island'),(163,'Northern Mariana Islands','MP',0,NULL,'Northern Mariana Islands','Northern Mariana Islands','Northern Mariana Islands'),(164,'Norway','NO',1,NULL,'Norway','Norway','Norway'),(165,'Oman','OM',0,NULL,'Oman','Oman','Oman'),(166,'Pakistan','PK',0,NULL,'Pakistan','Pakistan','Pakistan'),(167,'Palau','PW',0,NULL,'Palau','Palau','Palau'),(168,'Palestinian Territory, Occupied','PS',0,NULL,'Palestinian Territory, Occupied','Palestinian Territory, Occupied','Palestinian Territory, Occupied'),(169,'Panama','PA',0,NULL,'Panama','Panama','Panama'),(170,'Papua New Guinea','PG',0,NULL,'Papua New Guinea','Papua New Guinea','Papua New Guinea'),(171,'Paraguay','PY',1,NULL,'Paraguay','Paraguay','Paraguay'),(172,'Peru','PE',1,NULL,'Peru','Peru','Peru'),(173,'Philippines','PH',1,NULL,'Philippines','Philippines','Philippines'),(174,'Pitcairn','PN',0,NULL,'Pitcairn','Pitcairn','Pitcairn'),(175,'Poland','PL',1,NULL,'Poland','Poland','Poland'),(176,'Portugal','PT',1,NULL,'Portugal','Portugal','Portugal'),(177,'Puerto Rico','PR',0,NULL,'Puerto Rico','Puerto Rico','Puerto Rico'),(178,'Qatar','QA',0,NULL,'Qatar','Qatar','Qatar'),(179,'Reunion','RE',0,NULL,'Reunion','Reunion','Reunion'),(180,'Romania','RO',1,NULL,'Romania','Romania','Romania'),(181,'Russian Federation','RU',1,NULL,'Russian Federation','Russian Federation','Russian Federation'),(182,'Rwanda','RW',0,NULL,'Rwanda','Rwanda','Rwanda'),(183,'Saint Helena','SH',0,NULL,'Saint Helena','Saint Helena','Saint Helena'),(184,'Saint Kitts And Nevis','KN',0,NULL,'Saint Kitts And Nevis','Saint Kitts And Nevis','Saint Kitts And Nevis'),(185,'Saint Lucia','LC',0,NULL,'Saint Lucia','Saint Lucia','Saint Lucia'),(186,'Saint Pierre And Miquelon','PM',0,NULL,'Saint Pierre And Miquelon','Saint Pierre And Miquelon','Saint Pierre And Miquelon'),(187,'Saint Vincent And The Grenadines','VC',0,NULL,'Saint Vincent And The Grenadines','Saint Vincent And The Grenadines','Saint Vincent And The Grenadines'),(188,'Samoa','WS',0,NULL,'Samoa','Samoa','Samoa'),(189,'San Marino','SM',0,NULL,'San Marino','San Marino','San Marino'),(190,'Sao Tome And Principe','ST',0,NULL,'Sao Tome And Principe','Sao Tome And Principe','Sao Tome And Principe'),(191,'Saudi Arabia','SA',0,NULL,'Saudi Arabia','Saudi Arabia','Saudi Arabia'),(192,'Senegal','SN',0,NULL,'Senegal','Senegal','Senegal'),(193,'Serbia And Montenegro','CS',0,NULL,'Serbia And Montenegro','Serbia And Montenegro','Serbia And Montenegro'),(194,'Seychelles','SC',0,NULL,'Seychelles','Seychelles','Seychelles'),(195,'Sierra Leone','SL',0,NULL,'Sierra Leone','Sierra Leone','Sierra Leone'),(196,'Singapore','SG',0,NULL,'Singapore','Singapore','Singapore'),(197,'Slovakia','SK',0,NULL,'Slovakia','Slovakia','Slovakia'),(198,'Slovenia','SI',0,NULL,'Slovenia','Slovenia','Slovenia'),(199,'Solomon Islands','SB',0,NULL,'Solomon Islands','Solomon Islands','Solomon Islands'),(200,'Somalia','SO',0,NULL,'Somalia','Somalia','Somalia'),(201,'South Africa','ZA',1,NULL,'South Africa','South Africa','South Africa'),(202,'South Georgia And The South Sandwich Islands','GS',0,NULL,'South Georgia And The South Sandwich Islands','South Georgia And The South Sandwich Islands','South Georgia And The South Sandwich Islands'),(203,'Spain','ES',1,'../images/countries/spain44a2d9_size0.jpg','Spain','Spain','Spain'),(204,'Sri Lanka','LK',0,NULL,'Sri Lanka','Sri Lanka','Sri Lanka'),(205,'Sudan','SD',0,NULL,'Sudan','Sudan','Sudan'),(206,'Suriname','SR',0,NULL,'Suriname','Suriname','Suriname'),(207,'Svalbard And Jan Mayen','SJ',0,NULL,'Svalbard And Jan Mayen','Svalbard And Jan Mayen','Svalbard And Jan Mayen'),(208,'Swaziland','SZ',0,NULL,'Swaziland','Swaziland','Swaziland'),(209,'Sweden','SE',1,NULL,'Sweden','Sweden','Sweden'),(210,'Switzerland','CH',1,NULL,'Switzerland','Switzerland','Switzerland'),(211,'Syrian Arab Republic','SY',0,NULL,'Syrian Arab Republic','Syrian Arab Republic','Syrian Arab Republic'),(212,'Taiwan, Province Of China','TW',0,NULL,'Taiwan, Province Of China','Taiwan, Province Of China','Taiwan, Province Of China'),(213,'Tajikistan','TJ',0,NULL,'Tajikistan','Tajikistan','Tajikistan'),(214,'Tanzania, United Republic Of','TZ',0,NULL,'Tanzania, United Republic Of','Tanzania, United Republic Of','Tanzania, United Republic Of'),(215,'Thailand','TH',1,NULL,'Thailand','Thailand','Thailand'),(216,'Timor-Leste','TL',0,NULL,'Timor-Leste','Timor-Leste','Timor-Leste'),(217,'Togo','TG',0,NULL,'Togo','Togo','Togo'),(218,'Tokelau','TK',0,NULL,'Tokelau','Tokelau','Tokelau'),(219,'Tonga','TO',0,NULL,'Tonga','Tonga','Tonga'),(220,'Trinidad And Tobago','TT',1,NULL,'Trinidad And Tobago','Trinidad And Tobago','Trinidad And Tobago'),(221,'Tunisia','TN',1,NULL,'Tunisia','Tunisia','Tunisia'),(222,'Turkey','TR',1,NULL,'Turkey','Turkey','Turkey'),(223,'Turkmenistan','TM',0,NULL,'Turkmenistan','Turkmenistan','Turkmenistan'),(224,'Turks And Caicos Islands','TC',0,NULL,'Turks And Caicos Islands','Turks And Caicos Islands','Turks And Caicos Islands'),(225,'Tuvalu','TV',0,NULL,'Tuvalu','Tuvalu','Tuvalu'),(226,'Uganda','UG',0,NULL,'Uganda','Uganda','Uganda'),(227,'Ukraine','UA',1,NULL,'Ukraine','Ukraine','Ukraine'),(228,'United Arab Emirates','AE',0,NULL,'United Arab Emirates','United Arab Emirates','United Arab Emirates'),(229,'United Kingdom','GB',1,NULL,'United Kingdom','United Kingdom','United Kingdom'),(230,'United States','US',1,'../images/countries/usa.png','United States','ארצות הברית','United States'),(231,'United States Minor Outlying Islands','UM',0,NULL,'United States Minor Outlying Islands','United States Minor Outlying Islands','United States Minor Outlying Islands'),(232,'Uruguay','UY',1,NULL,'Uruguay','Uruguay','Uruguay'),(233,'Uzbekistan','UZ',0,NULL,'Uzbekistan','Uzbekistan','Uzbekistan'),(234,'Vanuatu','VU',0,NULL,'Vanuatu','Vanuatu','Vanuatu'),(235,'Venezuela','VE',1,NULL,'Venezuela','Venezuela','Venezuela'),(236,'Viet Nam','VN',0,NULL,'Viet Nam','Viet Nam','Viet Nam'),(237,'Virgin Islands, British','VG',0,NULL,'Virgin Islands, British','Virgin Islands, British','Virgin Islands, British'),(238,'Virgin Islands, U.S.','VI',0,NULL,'Virgin Islands, U.S.','Virgin Islands, U.S.','Virgin Islands, U.S.'),(239,'Wallis And Futuna','WF',0,NULL,'Wallis And Futuna','Wallis And Futuna','Wallis And Futuna'),(240,'Western Sahara','EH',0,NULL,'Western Sahara','Western Sahara','Western Sahara'),(241,'Yemen','YE',0,NULL,'Yemen','Yemen','Yemen'),(242,'Zambia','ZM',0,NULL,'Zambia','Zambia','Zambia'),(243,'Zimbabwe','ZW',0,NULL,'Zimbabwe','Zimbabwe','Zimbabwe');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crops`
--

DROP TABLE IF EXISTS `crops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crops` (
  `idcrops` int(11) NOT NULL AUTO_INCREMENT,
  `image1` varchar(210) DEFAULT NULL,
  `image2` varchar(210) DEFAULT NULL,
  `image3` varchar(210) DEFAULT NULL,
  PRIMARY KEY (`idcrops`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crops`
--

LOCK TABLES `crops` WRITE;
/*!40000 ALTER TABLE `crops` DISABLE KEYS */;
INSERT INTO `crops` VALUES (1,'../images/Practiceimg/42294bd0-e0a9-421f-8d7a-bff5eec05a92_c_rop.gif','../images/Practiceimg/e4afeac4-6e00-42ed-a21b-6feafd68a77b_c_rop.jpg','../images/Practiceimg/804583f1-e717-4672-9d05-79747477394d_c_rop.gif');
/*!40000 ALTER TABLE `crops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailnotification`
--

DROP TABLE IF EXISTS `emailnotification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailnotification` (
  `idemailnotification` int(11) NOT NULL AUTO_INCREMENT,
  `whenmembersend` tinyint(1) DEFAULT '1',
  `whenmemberfavorite` tinyint(1) DEFAULT '1',
  `whennewthing` tinyint(1) DEFAULT '1',
  `howmostexpr` tinyint(1) DEFAULT '1',
  `memberid` int(11) DEFAULT NULL,
  PRIMARY KEY (`idemailnotification`),
  KEY `sendmsg` (`whenmembersend`,`memberid`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailnotification`
--

LOCK TABLES `emailnotification` WRITE;
/*!40000 ALTER TABLE `emailnotification` DISABLE KEYS */;
INSERT INTO `emailnotification` VALUES (67,1,1,1,1,28),(69,1,1,1,1,30),(70,1,1,1,1,31),(72,1,1,1,1,33),(73,1,1,1,1,34),(76,1,1,1,1,37);
/*!40000 ALTER TABLE `emailnotification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorites` (
  `idfavorites` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `favoriteid` int(11) DEFAULT NULL,
  `isconfim1` tinyint(1) DEFAULT '0',
  `isconfim2` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idfavorites`),
  KEY `home1` (`isconfim1`,`isconfim2`,`memberid`),
  KEY `profile1` (`memberid`,`favoriteid`,`isconfim1`,`isconfim2`),
  KEY `favor1` (`isconfim1`,`isconfim2`,`memberid`),
  KEY `favor2` (`favoriteid`,`isconfim1`,`isconfim2`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES (61,33,28,1,1),(62,34,28,1,1),(63,37,28,1,1);
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generaltexts`
--

DROP TABLE IF EXISTS `generaltexts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generaltexts` (
  `genID` int(11) NOT NULL AUTO_INCREMENT,
  `genName` varchar(110) DEFAULT NULL,
  `genContent` text,
  `genPage` int(11) DEFAULT NULL,
  `genType` int(4) DEFAULT NULL,
  `lang` varchar(45) DEFAULT NULL,
  `genCode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`genID`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generaltexts`
--

LOCK TABLES `generaltexts` WRITE;
/*!40000 ALTER TABLE `generaltexts` DISABLE KEYS */;
INSERT INTO `generaltexts` VALUES (1,'שדה1','aSAA dsf sadsd sd\nasdasd',1,1,'heb',NULL),(2,'שדה 2','dsfsdfsd asdasd asdasd1111<br />\nsadassaddassadddddddddas<img alt=\"\" src=\"/templatesite.co.il/uploads/images/mickey-mouse-5.jpg\" style=\"width: 428px; height: 561px; \" /><br />\nasdASAs',1,2,'heb',NULL),(3,'שדגלנדשגדש','שדגשדג',2,1,'heb',NULL),(4,'תעלות שם ארוך ','dfgdfgdf',1,3,'heb',NULL),(5,'שדגשדגשד','שדגשדגשדג',1,3,'heb',NULL),(9,'טקסט אלטרנטבי ללוגו','spin date',0,3,'heb','logoalttext'),(10,'כפתור אדום אונליין','Onlines Now!',0,3,'heb','onlinebutton'),(11,'כפתור הרשמה','Subscribe',0,3,'heb','Subscribebtn'),(12,'כפתור התראות','Alerts',0,3,'heb','alertsbtn'),(13,'כפתור INBOX','Inbox',0,3,'heb','Inboxbtn'),(14,'כפתור הגדרות','settings',0,3,'heb','settingbtn'),(15,'כפתור התנתק','logout',0,3,'heb','logoutbtn'),(16,'טקסט מתחת ללוגו','News : Spindate is an online video dating service that sets up users on as many 5-minu as they want',0,2,'heb','topcontent'),(17,'טקסט דף הבית','Home Page',0,3,'heb','homepage'),(18,'הפרופיל שלי','My Profile',0,3,'heb','MyProfile'),(19,'עזרה','Help',0,3,'heb','help'),(20,'הודעת ברכה - שם הנרשם יוחלף עם myname','Welcome myname, you created yourself a profile in Spindate.',17,2,'heb','welcome'),(21,'הודעת הרשמה (מחליף את מייל המשתמש עם mymail)','<br />\n<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px; \">\n	<tbody>\n		<tr>\n			<td style=\"vertical-align: top; \">\n				<img alt=\"\" src=\"/spindate.co.il/uploads/images/ISign.jpg\" style=\"width: 27px; height: 25px; \" /></td>\n			<td>\n				<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 360px; \">\n					<tbody>\n						<tr>\n							<td style=\"text-align: center; vertical-align: top; height: 30px; \">\n								Confirm your email address to access all of Spindate&rsquo;s features.</td>\n						</tr>\n						<tr>\n							<td style=\"text-align: center; \">\n								&nbsp;confirmation message was sent to&nbsp;mymail.</td>\n						</tr>\n					</tbody>\n				</table>\n			</td>\n		</tr>\n	</tbody>\n</table>\n<br />\n<br />\n',17,2,'heb','endregmsg'),(22,'שלח שוב','Resend Email',17,3,'heb','Resend'),(23,'לך ללובי','Go To Lobby',17,3,'heb','GoToLobby'),(24,'טקסט בראש הדף','Please fill the details below to complete registration :',18,2,'heb','topreg2'),(25,'שדה יום הולדת','Birthday :',18,3,'heb','Birthday'),(26,'סטוס','I am',18,3,'heb','status'),(27,'מחפש','Seeking',18,3,'heb','seeking'),(28,'ארצות','Country:',18,3,'heb','Country'),(29,'מדינות','State:',18,3,'heb','State'),(30,'זכר','Male',18,3,'heb','Male'),(31,'נקבה','Female',18,3,'heb','Female'),(32,'צור חשבון','Create Acount',18,3,'heb','CreateAcount'),(33,'טקסט קופון','Insert Coupon (optional)',18,3,'heb','coupon'),(34,'כותרת דף (שם הנשלח יתחלף עם myname)','Suprise myname with a gift ',19,3,'heb','sendgifttitle'),(35,'הוסף הודעה למתנה','Add message to your gift!',19,3,'heb','addmsggift'),(36,'טקסט על כפתור','Continue',19,3,'heb','Continue'),(37,'כותרת דף (שם הנשלח יתחלף עם myname)','Congratulations! you recived a gift from myname!',20,3,'heb','getgifttitle'),(38,'טקסט מעל לתיבת טקסט (שם השולח יוחלף עם myname)','myname’s Message :',20,3,'heb','getgifttext'),(39,'צפה בפרופיל','View Profile',20,3,'heb','viewProfile'),(40,'הזמן לדייט','Invite To Date',20,3,'heb','Invite'),(41,'שלח הודעה','Send Message',20,3,'heb','SendMessage'),(42,'כותרת','Extend your account :',21,3,'heb','Extend'),(43,'כותרת הטבות','Subscriber Benfits :',21,3,'heb','Benfits'),(44,'טקסט לתמונת וידיאו','video',21,3,'heb','videoalt'),(45,'כותרת הטבת וידיאו','Video Technology',21,3,'heb','VideoTec'),(46,'הטבת וידיאו תוכן','Spindate Specializes in video technology',21,1,'heb','videocon'),(47,'טקסט תמונת הטבת פגישות','Unlimited Dates',21,3,'heb','AltUnlimitedDate'),(48,'כותרת הטבת ללא הגבלה','Unlimited Date',21,3,'heb','Unlimiteheader'),(49,'הטבת ללא הגבלה תוכן','Get unlimited dates and make deeper connections',21,1,'heb','unlimitedcont'),(50,'טקסט תמונת שעון','meet People',21,3,'heb','clockimgalt'),(51,'הטבת פגישות מהירות כותרת','Meet People Fast',21,3,'heb','HeaderPeopleFast'),(52,'הטבת פגישות מהירות תוכן','Gets Unlimited date and make deeper connections',21,1,'heb','fastdatecon'),(53,'תת כותרת -בחר תוכנית','Select Plan :',21,3,'heb','selpsheader'),(54,'מחיר לחודש','Per Month',21,3,'heb','PerMonth'),(55,'טקסט על כפתור קנייה','Buy',21,3,'heb','buy'),(56,'כותרת הרשמה','Subscribe NOW to get more features!',21,3,'heb','SubscribeNow'),(57,'כותרת דף','Account Settings',22,3,'heb','AccountSet'),(58,'פרטי החשבון','Account Info',22,3,'heb','AccountInfo'),(59,'התראות דואר','Email Notifications',22,3,'heb','EmailNot'),(60,'סטטוס חשבון','Account Status',22,3,'heb','AccountSt'),(61,'שנה סיסמה','Change Password',22,3,'heb','ChangePass'),(62,'משתמשים חסומים','Blocked Members',22,3,'heb','BlockedMem'),(63,'טקסט מתחת לכותרת פרטי חשבון','Update your account info',22,1,'heb','infocom'),(64,'פרטי החשבון כותרת צד שמאל',' General Info :',22,3,'heb','GeneralInfo'),(65,' 	 פרטי החשבון כותרת צד ימין','About Me :',22,3,'heb','Aboutme'),(66,'תאריך יום הולדת','Birthday :',22,3,'heb','2Birthday '),(67,'מין','Gender :',22,3,'heb','Gender'),(68,'מחפש','Seeking :',22,3,'heb','Seeking2'),(69,'טאב התראות מייל - טקסט מתחת לכותרת','Choose which email notifications you would like to receive',22,1,'heb','emailnotcom'),(70,'טאב התראות מייל - טקסט ','To help you have the best experience, we\'ll send you email notifications on behalf of members who contact you.\r\nWe\'ll also deliver your latest matches and give you free tips on how to meet someone special.',22,1,'heb','emailnottext'),(71,'טאב מצב חשבון- טקסט מתחת לכותרת','Subscribe or extend account.',22,1,'heb','accountstatcom'),(72,'טאב מצב חשבון- מצב חשבון (מחליף סטטוס עם mystatus)','You are a mystatus membership.',22,3,'heb','mystatus'),(73,'טאב מצב חשבון- כפתור היסטוריה','Payment History',22,3,'heb','PaymentHis'),(74,'טאב מצב חשבון- טקסט מספר ימים (מחליף mydays  עם המספר העדכני)','You have mydays   until your membership will expired.',22,3,'heb','mydays'),(75,'טאב שינוי סיסמה- טקסט מתחת לכותרת','Change your password which you use to log in Spindate',22,3,'heb','chgpasscom'),(76,'טאב משתמשים חסומים - טקסט מתחת לכותרת','Manage members you blocked',22,1,'heb','blockmemcom'),(77,'הכנס תאריך יום הולדת','Please Select Your Birthday.',18,3,'heb','selbirth'),(78,'כותרת התראה','The confirmation email was sent to :',23,3,'heb','confirmemail'),(79,'שלח שוב','Resend Email',23,3,'heb','ResendEmail'),(80,'ערוך מייל','Edit Email',23,3,'heb','EditEmail'),(81,'כותרת התראת כניסה לא מאושרת','Oopps, your account is not verified yet.',23,3,'heb','Oopps'),(82,'התראת חשבון לא מאושר טקסט','Confirm your email address to access all of Spindate’s features.',23,3,'heb','Confirmyour'),(83,'בטל','Cancel',23,3,'heb','Cancel'),(84,'אשר','Confirm',23,3,'heb','Confirm'),(85,'מכתב רישום (myname,mylink,mybutton)','<div style=\"direction: ltr;\">\n	HELLO myname<br />\n	<br />\n	please press mybutton to verify your spindate acount&nbsp;<br />\n	if it isn&#39;t working copy the url of the link bellow:<br />\n	mylink<br />\n	<br />\n	good&nbsp;<br />\n	day</div>\n',18,2,'heb','myletter'),(86,'ברכת משתמש (מחליף שם עם myname)','Hello myname, Welcome',-1,3,'heb','Hello'),(87,'הפרופיל שלי','My Profile',-1,3,'heb','MyProfile1'),(88,'ערוך פרופיל','Edit My Profile',-1,3,'heb','EditProfile'),(89,'ערוך תמונות','Edit Picture',-1,3,'heb','EditPicture'),(90,'התראות','Alerts',-1,3,'heb','Alerts'),(91,'כותרת דף','Notifications ',26,3,'heb','MyAlert'),(92,'תיבת מייל','My Inbox',-1,3,'heb','MyInbox'),(93,'שמור הגדרות','Save Setting',22,3,'heb','SaveSetting'),(94,'שם פרטי','First Name :',22,3,'heb','FirstName'),(95,'שם משפחה','Last Name :',22,3,'heb','LastName'),(96,'שדה דואר ','Email Adress :',22,3,'heb','EmailAdress'),(97,'כותרת דף','My Inbox',27,3,'heb','MyInbox2'),(98,'הודעות','messages',27,3,'heb','messages'),(99,'לא נקרא','unread',27,3,'heb','unread'),(100,'Actions','Actions',27,3,'heb','Actions'),(101,'שנים','years',27,3,'heb','years'),(102,'חודשים','months',27,3,'heb','months'),(103,'ימים','days',27,3,'heb','days'),(104,'שעות','hours',27,3,'heb','hours'),(105,'דקות','minutes',27,3,'heb','minutes'),(106,'צור קשר טקסט','Can&rsquo;t find the answer here?<br />\nHave some suggestions for us?<br />\nThere are several ways we can<br />\noffer &nbsp;support :',11,2,'heb','helpcontext'),(107,'תוכן','<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 485px; \">\n	<tbody>\n		<tr>\n			<td>\n				<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 485px; \">\n					<tbody>\n						<tr>\n							<td style=\"text-align: left; width: 165px; \">\n								<img alt=\"\" src=\"/spindate.co.il/uploads/images/spindatelogo.png\" style=\"width: 148px; height: 62px; \" /></td>\n							<td style=\"text-align: left; \">\n								<span style=\"color:#010101;\"><span style=\"font-size: 14px; \"><em><strong>About Spin Date :</strong></em></span></span></td>\n						</tr>\n					</tbody>\n				</table>\n			</td>\n		</tr>\n		<tr>\n			<td style=\"text-align: left; \">\n				<br />\n				<strong>Spindate is the #1 way to jump-start your love life! No more wasting precious time&hellip;</strong><br />\n				Spindate is the #1 way to jump-start your love life! No more wasting precious time&hellip;<br />\n				And no more blind-date blahs! Whether you&#39;re simply looking to have a great time, seeking a serious<br />\n				Spindate is the #1 way to jump-start your love life! No more wasting precious time&hellip;<br />\n				And no more blind-date blahs! Whether you&#39;re simply looking to have a great time, seeking a serious<br />\n				Spindate is the #1 way to jump-start your love life! No more wasting precious time&hellip;<br />\n				And no more blind-date blahs! Whether you&#39;re simply looking to have a great time, seeking a serious<br />\n				Spindate is the #1 way to jump-start your love life! No more wasting precious time&hellip;<br />\n				And no more blind-date blahs! Whether you&#39;re simply looking to have a great time, seeking a serious<br />\n				&nbsp;</td>\n		</tr>\n	</tbody>\n</table>\n<br />\n',12,2,'heb','about'),(108,'content','<h1 style=\"margin: 0px 0px 7px; padding: 0px; border: 0px; font: inherit; font-size: 36px; vertical-align: baseline; color: rgb(51, 51, 51); text-align: left; font-family: Arial, sans-serif; \">\n	A Real Life Example of Regulation</h1>\n<br />\n<img alt=\"\" src=\"/spindate.co.il/uploads/images/helpimage.png\" style=\"width: 300px; height: 162px; float: right; \" />\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	My house is a perfect example of why deregulation does not work.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The characters: four young women in their early twenties, all students at the local university. Three are seniors, reluctantly ready to embark onto the trail of adulthood. The other, a junior, spends her time reveling at the fact that her graduation is more than a year away, compared to the 54 days of her housemates.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The setting: one lovely ranch-style house in Northwest Fort Collins, Colorado. Apparently accustomed to being throttled by students, the house seems to sag under the weight of the unraked leaves in the front yard. The cabinets are beige; the bathroom tiles are beige; the basement walls are beige, with the exception of a single three foot tall square of drywall, the product of an impromptu dance party and a single elbow.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The conflict: can four adult women manage to keep one 1000sq foot home clean for at least 24 hours?</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	In my experience, the answer is no.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	My housemates and I are not controversial. We are stereotypical teenage girls who mutter angrily behind the other&rsquo;s back, but smile and profess feeling of adoration to their face. If something bothers us, we hurry and tell our other roommate; we will not address a problem, but rather, quite literally, run from it.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The house rules are simple: we don&rsquo;t have any. There are no rules regarding who takes out the trash, who unloads the dishwasher or who has the clean up after themselves. Theoretically, we devised the perfect living solution, in which everyone just takes care of his or her own self.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	Each roommate has taken this to mean something else, leaving a perfect spectrum of cleanliness. One will pick up, clean up and take out the trash of everyone else. Another will refuse to even look at the rubbish of another, instead, letting her eyes conveniently glaze over the lone spoon left in the sink. The other two fall somewhere in the middle, cleaner than and not as clean as the two polarized hygiene ideologies.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	In theory, we have devised a perfect plan where it&rsquo;s every girl for herself. However, the issue lies within the common areas: the foyer, the living room, and the kitchen floor. It&rsquo;s impossible to say who tracked that piece of mud in the house; loyal to our rule, nobody touches it. It lies there, festering for months until the next gathering when a stranger&rsquo;s shoe tracks it back out. The foyer tile is stained with scuffed dirt that has accumulated from all of us. Fibers of dried grass and leaves adorn the living room carpet, and the hardwood kitchen floor hardly shines due to the layers of crushed food particles.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	Without house rules and a sense of accountability, we are destined to live in a state of filth.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The environment, as fickle as it may be, is the same way. The Environmental Protection Agency is a controversial matter; it is a bureaucratic organization that, as the name suggests, specializes in protecting the environment. Recently, Congressional Republicans have sought to strip the EPA of the authority to regulate greenhouse gas emissions that have proven dangerous to human life, six days before the EPA launched new regulations on coal-burning power plants. Without these regulations and accountability, it is possible that the environment will end up the same way as my house: crusty and dirty.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	Republicans have made their distaste for the EPA very clear, harkening back to the days of Reagan, who appointed staunch non-environmentalists to the post of administrator. The EPA regulations cause too much harm on businesses, they cried. Deregulation will upswing the market, they wallowed. We hate pandas, they howled (only in my imagination.)</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	However, the environment doesn&rsquo;t seem to care about the market. If coal-burning plants are choking the life out of a forest, Mother Nature will hardly ever look at stock prices.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	I am not a scientist or a politician, but cleanliness is something I know very well. If businesses are allowed to pollute as much as they want with no constraints from the EPA, as my roommates and I have done, then the earth, and our house, will turn into a vapid wasteland of plastic bottles that could have been recycled.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	I realize that there is more to this issue than my 700-word article can ever do justice, but, from experience, I&rsquo;ve learned that, without some sort of regulation, there is nothing to stop spilled soda leaving you stuck to the floor.</p>\n',36,2,'heb','regulationcontent'),(109,'טקסט','<h1 style=\"margin: 0px 0px 7px; padding: 0px; border: 0px; font: inherit; font-size: 36px; vertical-align: baseline; color: rgb(51, 51, 51); text-align: left; font-family: Arial, sans-serif; \">\n	The Site On Maintenance</h1>\n<br />\n<img alt=\"\" src=\"/spindate.co.il/uploads/images/helpimage.png\" style=\"width: 300px; height: 162px; float: right; \" />\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	My house is a perfect example of why deregulation does not work.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The characters: four young women in their early twenties, all students at the local university. Three are seniors, reluctantly ready to embark onto the trail of adulthood. The other, a junior, spends her time reveling at the fact that her graduation is more than a year away, compared to the 54 days of her housemates.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The setting: one lovely ranch-style house in Northwest Fort Collins, Colorado. Apparently accustomed to being throttled by students, the house seems to sag under the weight of the unraked leaves in the front yard. The cabinets are beige; the bathroom tiles are beige; the basement walls are beige, with the exception of a single three foot tall square of drywall, the product of an impromptu dance party and a single elbow.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The conflict: can four adult women manage to keep one 1000sq foot home clean for at least 24 hours?</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	In my experience, the answer is no.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	My housemates and I are not controversial. We are stereotypical teenage girls who mutter angrily behind the other&rsquo;s back, but smile and profess feeling of adoration to their face. If something bothers us, we hurry and tell our other roommate; we will not address a problem, but rather, quite literally, run from it.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The house rules are simple: we don&rsquo;t have any. There are no rules regarding who takes out the trash, who unloads the dishwasher or who has the clean up after themselves. Theoretically, we devised the perfect living solution, in which everyone just takes care of his or her own self.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	Each roommate has taken this to mean something else, leaving a perfect spectrum of cleanliness. One will pick up, clean up and take out the trash of everyone else. Another will refuse to even look at the rubbish of another, instead, letting her eyes conveniently glaze over the lone spoon left in the sink. The other two fall somewhere in the middle, cleaner than and not as clean as the two polarized hygiene ideologies.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	In theory, we have devised a perfect plan where it&rsquo;s every girl for herself. However, the issue lies within the common areas: the foyer, the living room, and the kitchen floor. It&rsquo;s impossible to say who tracked that piece of mud in the house; loyal to our rule, nobody touches it. It lies there, festering for months until the next gathering when a stranger&rsquo;s shoe tracks it back out. The foyer tile is stained with scuffed dirt that has accumulated from all of us. Fibers of dried grass and leaves adorn the living room carpet, and the hardwood kitchen floor hardly shines due to the layers of crushed food particles.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	Without house rules and a sense of accountability, we are destined to live in a state of filth.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The environment, as fickle as it may be, is the same way. The Environmental Protection Agency is a controversial matter; it is a bureaucratic organization that, as the name suggests, specializes in protecting the environment. Recently, Congressional Republicans have sought to strip the EPA of the authority to regulate greenhouse gas emissions that have proven dangerous to human life, six days before the EPA launched new regulations on coal-burning power plants. Without these regulations and accountability, it is possible that the environment will end up the same way as my house: crusty and dirty.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	Republicans have made their distaste for the EPA very clear, harkening back to the days of Reagan, who appointed staunch non-environmentalists to the post of administrator. The EPA regulations cause too much harm on businesses, they cried. Deregulation will upswing the market, they wallowed. We hate pandas, they howled (only in my imagination.)</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	However, the environment doesn&rsquo;t seem to care about the market. If coal-burning plants are choking the life out of a forest, Mother Nature will hardly ever look at stock prices.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	I am not a scientist or a politician, but cleanliness is something I know very well. If businesses are allowed to pollute as much as they want with no constraints from the EPA, as my roommates and I have done, then the earth, and our house, will turn into a vapid wasteland of plastic bottles that could have been recycled.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	I realize that there is more to this issue than my 700-word article can ever do justice, but, from experience, I&rsquo;ve learned that, without some sort of regulation, there is nothing to stop spilled soda leaving you stuck to the floor.</p>\n',37,2,'heb','maintenancecontent'),(110,'terms of service','<h1 style=\"margin: 0px 0px 7px; padding: 0px; border: 0px; font: inherit; font-size: 36px; vertical-align: baseline; color: rgb(51, 51, 51); text-align: left; font-family: Arial, sans-serif; \">\n	Terms of Service</h1>\n<br />\n<img alt=\"\" src=\"/spindate.co.il/uploads/images/helpimage.png\" style=\"width: 300px; height: 162px; float: right; \" />\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	My house is a perfect example of why deregulation does not work.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The characters: four young women in their early twenties, all students at the local university. Three are seniors, reluctantly ready to embark onto the trail of adulthood. The other, a junior, spends her time reveling at the fact that her graduation is more than a year away, compared to the 54 days of her housemates.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The setting: one lovely ranch-style house in Northwest Fort Collins, Colorado. Apparently accustomed to being throttled by students, the house seems to sag under the weight of the unraked leaves in the front yard. The cabinets are beige; the bathroom tiles are beige; the basement walls are beige, with the exception of a single three foot tall square of drywall, the product of an impromptu dance party and a single elbow.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The conflict: can four adult women manage to keep one 1000sq foot home clean for at least 24 hours?</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	In my experience, the answer is no.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	My housemates and I are not controversial. We are stereotypical teenage girls who mutter angrily behind the other&rsquo;s back, but smile and profess feeling of adoration to their face. If something bothers us, we hurry and tell our other roommate; we will not address a problem, but rather, quite literally, run from it.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The house rules are simple: we don&rsquo;t have any. There are no rules regarding who takes out the trash, who unloads the dishwasher or who has the clean up after themselves. Theoretically, we devised the perfect living solution, in which everyone just takes care of his or her own self.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	Each roommate has taken this to mean something else, leaving a perfect spectrum of cleanliness. One will pick up, clean up and take out the trash of everyone else. Another will refuse to even look at the rubbish of another, instead, letting her eyes conveniently glaze over the lone spoon left in the sink. The other two fall somewhere in the middle, cleaner than and not as clean as the two polarized hygiene ideologies.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	In theory, we have devised a perfect plan where it&rsquo;s every girl for herself. However, the issue lies within the common areas: the foyer, the living room, and the kitchen floor. It&rsquo;s impossible to say who tracked that piece of mud in the house; loyal to our rule, nobody touches it. It lies there, festering for months until the next gathering when a stranger&rsquo;s shoe tracks it back out. The foyer tile is stained with scuffed dirt that has accumulated from all of us. Fibers of dried grass and leaves adorn the living room carpet, and the hardwood kitchen floor hardly shines due to the layers of crushed food particles.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	Without house rules and a sense of accountability, we are destined to live in a state of filth.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The environment, as fickle as it may be, is the same way. The Environmental Protection Agency is a controversial matter; it is a bureaucratic organization that, as the name suggests, specializes in protecting the environment. Recently, Congressional Republicans have sought to strip the EPA of the authority to regulate greenhouse gas emissions that have proven dangerous to human life, six days before the EPA launched new regulations on coal-burning power plants. Without these regulations and accountability, it is possible that the environment will end up the same way as my house: crusty and dirty.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	Republicans have made their distaste for the EPA very clear, harkening back to the days of Reagan, who appointed staunch non-environmentalists to the post of administrator. The EPA regulations cause too much harm on businesses, they cried. Deregulation will upswing the market, they wallowed. We hate pandas, they howled (only in my imagination.)</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	However, the environment doesn&rsquo;t seem to care about the market. If coal-burning plants are choking the life out of a forest, Mother Nature will hardly ever look at stock prices.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	I am not a scientist or a politician, but cleanliness is something I know very well. If businesses are allowed to pollute as much as they want with no constraints from the EPA, as my roommates and I have done, then the earth, and our house, will turn into a vapid wasteland of plastic bottles that could have been recycled.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	I realize that there is more to this issue than my 700-word article can ever do justice, but, from experience, I&rsquo;ve learned that, without some sort of regulation, there is nothing to stop spilled soda leaving you stuck to the floor.</p>\n',38,2,'heb','termsofservicecontent'),(111,'טקסט','<br />\n<div style=\"text-align: left;\">\n	<font color=\"#333333\" face=\"Arial, sans-serif\"><span style=\"font-size: 36px;\">Affiliate</span></font></div>\n<img alt=\"\" src=\"/spindate.co.il/uploads/images/helpimage.png\" style=\"width: 300px; height: 162px; float: right; \" />\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	My house is a perfect example of why deregulation does not work.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The characters: four young women in their early twenties, all students at the local university. Three are seniors, reluctantly ready to embark onto the trail of adulthood. The other, a junior, spends her time reveling at the fact that her graduation is more than a year away, compared to the 54 days of her housemates.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The setting: one lovely ranch-style house in Northwest Fort Collins, Colorado. Apparently accustomed to being throttled by students, the house seems to sag under the weight of the unraked leaves in the front yard. The cabinets are beige; the bathroom tiles are beige; the basement walls are beige, with the exception of a single three foot tall square of drywall, the product of an impromptu dance party and a single elbow.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The conflict: can four adult women manage to keep one 1000sq foot home clean for at least 24 hours?</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	In my experience, the answer is no.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	My housemates and I are not controversial. We are stereotypical teenage girls who mutter angrily behind the other&rsquo;s back, but smile and profess feeling of adoration to their face. If something bothers us, we hurry and tell our other roommate; we will not address a problem, but rather, quite literally, run from it.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The house rules are simple: we don&rsquo;t have any. There are no rules regarding who takes out the trash, who unloads the dishwasher or who has the clean up after themselves. Theoretically, we devised the perfect living solution, in which everyone just takes care of his or her own self.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	Each roommate has taken this to mean something else, leaving a perfect spectrum of cleanliness. One will pick up, clean up and take out the trash of everyone else. Another will refuse to even look at the rubbish of another, instead, letting her eyes conveniently glaze over the lone spoon left in the sink. The other two fall somewhere in the middle, cleaner than and not as clean as the two polarized hygiene ideologies.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	In theory, we have devised a perfect plan where it&rsquo;s every girl for herself. However, the issue lies within the common areas: the foyer, the living room, and the kitchen floor. It&rsquo;s impossible to say who tracked that piece of mud in the house; loyal to our rule, nobody touches it. It lies there, festering for months until the next gathering when a stranger&rsquo;s shoe tracks it back out. The foyer tile is stained with scuffed dirt that has accumulated from all of us. Fibers of dried grass and leaves adorn the living room carpet, and the hardwood kitchen floor hardly shines due to the layers of crushed food particles.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	Without house rules and a sense of accountability, we are destined to live in a state of filth.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The environment, as fickle as it may be, is the same way. The Environmental Protection Agency is a controversial matter; it is a bureaucratic organization that, as the name suggests, specializes in protecting the environment. Recently, Congressional Republicans have sought to strip the EPA of the authority to regulate greenhouse gas emissions that have proven dangerous to human life, six days before the EPA launched new regulations on coal-burning power plants. Without these regulations and accountability, it is possible that the environment will end up the same way as my house: crusty and dirty.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	Republicans have made their distaste for the EPA very clear, harkening back to the days of Reagan, who appointed staunch non-environmentalists to the post of administrator. The EPA regulations cause too much harm on businesses, they cried. Deregulation will upswing the market, they wallowed. We hate pandas, they howled (only in my imagination.)</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	However, the environment doesn&rsquo;t seem to care about the market. If coal-burning plants are choking the life out of a forest, Mother Nature will hardly ever look at stock prices.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	I am not a scientist or a politician, but cleanliness is something I know very well. If businesses are allowed to pollute as much as they want with no constraints from the EPA, as my roommates and I have done, then the earth, and our house, will turn into a vapid wasteland of plastic bottles that could have been recycled.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	I realize that there is more to this issue than my 700-word article can ever do justice, but, from experience, I&rsquo;ve learned that, without some sort of regulation, there is nothing to stop spilled soda leaving you stuck to the floor.</p>\n',39,2,'heb','affiliatetext'),(112,'טקסט','<br />\n<div style=\"text-align: left;\">\n	<font color=\"#333333\" face=\"Arial, sans-serif\"><span style=\"font-size: 36px;\">404 Page</span></font></div>\n<img alt=\"\" src=\"/spindate.co.il/uploads/images/helpimage.png\" style=\"width: 300px; height: 162px; float: right; \" />\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	My house is a perfect example of why deregulation does not work.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The characters: four young women in their early twenties, all students at the local university. Three are seniors, reluctantly ready to embark onto the trail of adulthood. The other, a junior, spends her time reveling at the fact that her graduation is more than a year away, compared to the 54 days of her housemates.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The setting: one lovely ranch-style house in Northwest Fort Collins, Colorado. Apparently accustomed to being throttled by students, the house seems to sag under the weight of the unraked leaves in the front yard. The cabinets are beige; the bathroom tiles are beige; the basement walls are beige, with the exception of a single three foot tall square of drywall, the product of an impromptu dance party and a single elbow.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The conflict: can four adult women manage to keep one 1000sq foot home clean for at least 24 hours?</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	In my experience, the answer is no.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	My housemates and I are not controversial. We are stereotypical teenage girls who mutter angrily behind the other&rsquo;s back, but smile and profess feeling of adoration to their face. If something bothers us, we hurry and tell our other roommate; we will not address a problem, but rather, quite literally, run from it.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The house rules are simple: we don&rsquo;t have any. There are no rules regarding who takes out the trash, who unloads the dishwasher or who has the clean up after themselves. Theoretically, we devised the perfect living solution, in which everyone just takes care of his or her own self.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	Each roommate has taken this to mean something else, leaving a perfect spectrum of cleanliness. One will pick up, clean up and take out the trash of everyone else. Another will refuse to even look at the rubbish of another, instead, letting her eyes conveniently glaze over the lone spoon left in the sink. The other two fall somewhere in the middle, cleaner than and not as clean as the two polarized hygiene ideologies.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	In theory, we have devised a perfect plan where it&rsquo;s every girl for herself. However, the issue lies within the common areas: the foyer, the living room, and the kitchen floor. It&rsquo;s impossible to say who tracked that piece of mud in the house; loyal to our rule, nobody touches it. It lies there, festering for months until the next gathering when a stranger&rsquo;s shoe tracks it back out. The foyer tile is stained with scuffed dirt that has accumulated from all of us. Fibers of dried grass and leaves adorn the living room carpet, and the hardwood kitchen floor hardly shines due to the layers of crushed food particles.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	Without house rules and a sense of accountability, we are destined to live in a state of filth.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The environment, as fickle as it may be, is the same way. The Environmental Protection Agency is a controversial matter; it is a bureaucratic organization that, as the name suggests, specializes in protecting the environment. Recently, Congressional Republicans have sought to strip the EPA of the authority to regulate greenhouse gas emissions that have proven dangerous to human life, six days before the EPA launched new regulations on coal-burning power plants. Without these regulations and accountability, it is possible that the environment will end up the same way as my house: crusty and dirty.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	Republicans have made their distaste for the EPA very clear, harkening back to the days of Reagan, who appointed staunch non-environmentalists to the post of administrator. The EPA regulations cause too much harm on businesses, they cried. Deregulation will upswing the market, they wallowed. We hate pandas, they howled (only in my imagination.)</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	However, the environment doesn&rsquo;t seem to care about the market. If coal-burning plants are choking the life out of a forest, Mother Nature will hardly ever look at stock prices.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	I am not a scientist or a politician, but cleanliness is something I know very well. If businesses are allowed to pollute as much as they want with no constraints from the EPA, as my roommates and I have done, then the earth, and our house, will turn into a vapid wasteland of plastic bottles that could have been recycled.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	I realize that there is more to this issue than my 700-word article can ever do justice, but, from experience, I&rsquo;ve learned that, without some sort of regulation, there is nothing to stop spilled soda leaving you stuck to the floor.</p>\n',40,2,'heb','404text'),(113,'טקסט','<br />\n<div style=\"text-align: left;\">\n	<font color=\"#333333\" face=\"Arial, sans-serif\"><span style=\"font-size: 36px;\">Construction</span></font></div>\n<img alt=\"\" src=\"/spindate.co.il/uploads/images/helpimage.png\" style=\"width: 300px; height: 162px; float: right; \" />\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	My house is a perfect example of why deregulation does not work.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The characters: four young women in their early twenties, all students at the local university. Three are seniors, reluctantly ready to embark onto the trail of adulthood. The other, a junior, spends her time reveling at the fact that her graduation is more than a year away, compared to the 54 days of her housemates.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The setting: one lovely ranch-style house in Northwest Fort Collins, Colorado. Apparently accustomed to being throttled by students, the house seems to sag under the weight of the unraked leaves in the front yard. The cabinets are beige; the bathroom tiles are beige; the basement walls are beige, with the exception of a single three foot tall square of drywall, the product of an impromptu dance party and a single elbow.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The conflict: can four adult women manage to keep one 1000sq foot home clean for at least 24 hours?</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	In my experience, the answer is no.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	My housemates and I are not controversial. We are stereotypical teenage girls who mutter angrily behind the other&rsquo;s back, but smile and profess feeling of adoration to their face. If something bothers us, we hurry and tell our other roommate; we will not address a problem, but rather, quite literally, run from it.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The house rules are simple: we don&rsquo;t have any. There are no rules regarding who takes out the trash, who unloads the dishwasher or who has the clean up after themselves. Theoretically, we devised the perfect living solution, in which everyone just takes care of his or her own self.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	Each roommate has taken this to mean something else, leaving a perfect spectrum of cleanliness. One will pick up, clean up and take out the trash of everyone else. Another will refuse to even look at the rubbish of another, instead, letting her eyes conveniently glaze over the lone spoon left in the sink. The other two fall somewhere in the middle, cleaner than and not as clean as the two polarized hygiene ideologies.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	In theory, we have devised a perfect plan where it&rsquo;s every girl for herself. However, the issue lies within the common areas: the foyer, the living room, and the kitchen floor. It&rsquo;s impossible to say who tracked that piece of mud in the house; loyal to our rule, nobody touches it. It lies there, festering for months until the next gathering when a stranger&rsquo;s shoe tracks it back out. The foyer tile is stained with scuffed dirt that has accumulated from all of us. Fibers of dried grass and leaves adorn the living room carpet, and the hardwood kitchen floor hardly shines due to the layers of crushed food particles.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	Without house rules and a sense of accountability, we are destined to live in a state of filth.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The environment, as fickle as it may be, is the same way. The Environmental Protection Agency is a controversial matter; it is a bureaucratic organization that, as the name suggests, specializes in protecting the environment. Recently, Congressional Republicans have sought to strip the EPA of the authority to regulate greenhouse gas emissions that have proven dangerous to human life, six days before the EPA launched new regulations on coal-burning power plants. Without these regulations and accountability, it is possible that the environment will end up the same way as my house: crusty and dirty.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	Republicans have made their distaste for the EPA very clear, harkening back to the days of Reagan, who appointed staunch non-environmentalists to the post of administrator. The EPA regulations cause too much harm on businesses, they cried. Deregulation will upswing the market, they wallowed. We hate pandas, they howled (only in my imagination.)</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	However, the environment doesn&rsquo;t seem to care about the market. If coal-burning plants are choking the life out of a forest, Mother Nature will hardly ever look at stock prices.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	I am not a scientist or a politician, but cleanliness is something I know very well. If businesses are allowed to pollute as much as they want with no constraints from the EPA, as my roommates and I have done, then the earth, and our house, will turn into a vapid wasteland of plastic bottles that could have been recycled.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	I realize that there is more to this issue than my 700-word article can ever do justice, but, from experience, I&rsquo;ve learned that, without some sort of regulation, there is nothing to stop spilled soda leaving you stuck to the floor.</p>\n',41,2,'heb','constructiontext'),(114,'טקסט','<br />\n<div style=\"text-align: left;\">\n	<font color=\"#333333\" face=\"Arial, sans-serif\"><span style=\"font-size: 36px;\">Insructions</span></font></div>\n<img alt=\"\" src=\"/spindate.co.il/uploads/images/helpimage.png\" style=\"width: 300px; height: 162px; float: right; \" />\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	My house is a perfect example of why deregulation does not work.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The characters: four young women in their early twenties, all students at the local university. Three are seniors, reluctantly ready to embark onto the trail of adulthood. The other, a junior, spends her time reveling at the fact that her graduation is more than a year away, compared to the 54 days of her housemates.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The setting: one lovely ranch-style house in Northwest Fort Collins, Colorado. Apparently accustomed to being throttled by students, the house seems to sag under the weight of the unraked leaves in the front yard. The cabinets are beige; the bathroom tiles are beige; the basement walls are beige, with the exception of a single three foot tall square of drywall, the product of an impromptu dance party and a single elbow.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The conflict: can four adult women manage to keep one 1000sq foot home clean for at least 24 hours?</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	In my experience, the answer is no.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	My housemates and I are not controversial. We are stereotypical teenage girls who mutter angrily behind the other&rsquo;s back, but smile and profess feeling of adoration to their face. If something bothers us, we hurry and tell our other roommate; we will not address a problem, but rather, quite literally, run from it.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The house rules are simple: we don&rsquo;t have any. There are no rules regarding who takes out the trash, who unloads the dishwasher or who has the clean up after themselves. Theoretically, we devised the perfect living solution, in which everyone just takes care of his or her own self.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	Each roommate has taken this to mean something else, leaving a perfect spectrum of cleanliness. One will pick up, clean up and take out the trash of everyone else. Another will refuse to even look at the rubbish of another, instead, letting her eyes conveniently glaze over the lone spoon left in the sink. The other two fall somewhere in the middle, cleaner than and not as clean as the two polarized hygiene ideologies.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	In theory, we have devised a perfect plan where it&rsquo;s every girl for herself. However, the issue lies within the common areas: the foyer, the living room, and the kitchen floor. It&rsquo;s impossible to say who tracked that piece of mud in the house; loyal to our rule, nobody touches it. It lies there, festering for months until the next gathering when a stranger&rsquo;s shoe tracks it back out. The foyer tile is stained with scuffed dirt that has accumulated from all of us. Fibers of dried grass and leaves adorn the living room carpet, and the hardwood kitchen floor hardly shines due to the layers of crushed food particles.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	Without house rules and a sense of accountability, we are destined to live in a state of filth.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	The environment, as fickle as it may be, is the same way. The Environmental Protection Agency is a controversial matter; it is a bureaucratic organization that, as the name suggests, specializes in protecting the environment. Recently, Congressional Republicans have sought to strip the EPA of the authority to regulate greenhouse gas emissions that have proven dangerous to human life, six days before the EPA launched new regulations on coal-burning power plants. Without these regulations and accountability, it is possible that the environment will end up the same way as my house: crusty and dirty.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	Republicans have made their distaste for the EPA very clear, harkening back to the days of Reagan, who appointed staunch non-environmentalists to the post of administrator. The EPA regulations cause too much harm on businesses, they cried. Deregulation will upswing the market, they wallowed. We hate pandas, they howled (only in my imagination.)</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	However, the environment doesn&rsquo;t seem to care about the market. If coal-burning plants are choking the life out of a forest, Mother Nature will hardly ever look at stock prices.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	I am not a scientist or a politician, but cleanliness is something I know very well. If businesses are allowed to pollute as much as they want with no constraints from the EPA, as my roommates and I have done, then the earth, and our house, will turn into a vapid wasteland of plastic bottles that could have been recycled.</p>\n<p style=\"margin: 0px 0px 10px; padding: 0px; border: 0px; font: inherit; font-size: 15px; vertical-align: baseline; line-height: 1.4em; color: rgb(51, 51, 51); font-family: Arial, sans-serif; \">\n	I realize that there is more to this issue than my 700-word article can ever do justice, but, from experience, I&rsquo;ve learned that, without some sort of regulation, there is nothing to stop spilled soda leaving you stuck to the floor.</p>\n',42,2,'heb','instructiontext'),(115,'OR','OR',18,3,'heb','regor'),(116,'Upload Your Photo','Upload Your Photo',18,3,'heb','reg2Upload');
/*!40000 ALTER TABLE `generaltexts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genparameters`
--

DROP TABLE IF EXISTS `genparameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genparameters` (
  `ParameterID` int(11) NOT NULL AUTO_INCREMENT,
  `ParameterName` varchar(255) DEFAULT NULL,
  `ParameterValue` longtext,
  PRIMARY KEY (`ParameterID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genparameters`
--

LOCK TABLES `genparameters` WRITE;
/*!40000 ALTER TABLE `genparameters` DISABLE KEYS */;
INSERT INTO `genparameters` VALUES (8,'Code in header (Like meta tag)','<meta> yossi</meta>'),(9,'Code bottom page ( Like analitics )',NULL);
/*!40000 ALTER TABLE `genparameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `giftmessages`
--

DROP TABLE IF EXISTS `giftmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `giftmessages` (
  `messageid` int(11) NOT NULL AUTO_INCREMENT,
  `fromuserid` int(11) DEFAULT NULL,
  `touserid` int(11) DEFAULT NULL,
  `message` text NOT NULL,
  `giftid` int(11) DEFAULT NULL,
  `ispayed` tinyint(1) DEFAULT '0',
  `giftpublish` datetime DEFAULT NULL,
  `giftpayment` double DEFAULT '0',
  `TransactionID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`messageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `giftmessages`
--

LOCK TABLES `giftmessages` WRITE;
/*!40000 ALTER TABLE `giftmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `giftmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gifts`
--

DROP TABLE IF EXISTS `gifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gifts` (
  `giftid` int(11) NOT NULL AUTO_INCREMENT,
  `giftalteng` varchar(45) DEFAULT NULL,
  `giftlink` varchar(110) DEFAULT NULL,
  `giftorder` int(11) DEFAULT NULL,
  `giftnameeng` varchar(45) DEFAULT NULL,
  `giftpayment` double DEFAULT '0',
  `1` varchar(45) DEFAULT NULL,
  `3` varchar(45) DEFAULT NULL,
  `4` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`giftid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gifts`
--

LOCK TABLES `gifts` WRITE;
/*!40000 ALTER TABLE `gifts` DISABLE KEYS */;
INSERT INTO `gifts` VALUES (1,'cake','../images/giftimages/cake.png',1,'cake',4.99,'cake','עוגה','cake'),(2,'drink','../images/giftimages/drink.png',2,'drink',4.99,'drink','משקה','drink'),(3,'flower','../images/giftimages/flower.png',3,'flower',4.99,'flower','פרח','flower'),(4,'giftDubi','../images/giftimages/giftDubi.png',4,'giftDubi',20,'giftDubi','דובי','giftDubi'),(5,'giftKiss','../images/giftimages/giftKiss.png',5,'giftKiss',22,'giftKiss','נשיקה','giftKiss'),(6,'iceCream','../images/giftimages/iceCream.png',6,'iceCream',20,'iceCream','גלידה','iceCream'),(7,'meal','../images/giftimages/meal.png',7,'meal',20,'meal','ארוחה','meal'),(8,'present','../images/giftimages/present.png',8,'present',10,'present','מתנה','present'),(9,'shokolad','../images/giftimages/shokolad.png',9,'shokolad',20,'shokolad','שוקולד','shokolad'),(10,'tut','../images/giftimages/tut.png',10,'tut',20,'tut','תות','tut');
/*!40000 ALTER TABLE `gifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inboxmessages`
--

DROP TABLE IF EXISTS `inboxmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inboxmessages` (
  `messageid` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `messageContent` text,
  `isDeleted` tinyint(1) DEFAULT '0',
  `messagepublish` datetime DEFAULT NULL,
  `isRead` tinyint(1) DEFAULT '0',
  `mymemberid` int(11) DEFAULT NULL,
  `messageheader` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`messageid`),
  KEY `homeGetConversation1` (`memberid`,`mymemberid`,`messagepublish`),
  KEY `homeGetConversation2` (`memberid`,`messageid`,`mymemberid`,`messagepublish`),
  KEY `inboxmain1` (`memberid`,`isDeleted`),
  KEY `inboxmain3` (`isDeleted`,`mymemberid`),
  KEY `inboxmain2` (`memberid`,`mymemberid`,`messagepublish`),
  KEY `inboxmain4` (`messagepublish`),
  KEY `inboxmain5` (`memberid`,`isDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inboxmessages`
--

LOCK TABLES `inboxmessages` WRITE;
/*!40000 ALTER TABLE `inboxmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `inboxmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `langsite`
--

DROP TABLE IF EXISTS `langsite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `langsite` (
  `langid` int(11) NOT NULL AUTO_INCREMENT,
  `langname` varchar(45) DEFAULT NULL,
  `langcode` varchar(45) DEFAULT NULL,
  `langdir` varchar(45) DEFAULT NULL,
  `ISDel` tinyint(1) DEFAULT NULL,
  `showlang` tinyint(1) DEFAULT NULL,
  `langOrder` int(11) DEFAULT NULL,
  PRIMARY KEY (`langid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `langsite`
--

LOCK TABLES `langsite` WRITE;
/*!40000 ALTER TABLE `langsite` DISABLE KEYS */;
INSERT INTO `langsite` VALUES (1,'עברית','heb','RTL',0,1,2),(3,'אנגלית','eng','LTR',0,1,3);
/*!40000 ALTER TABLE `langsite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `langtext`
--

DROP TABLE IF EXISTS `langtext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `langtext` (
  `LangTextID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TextName` varchar(200) DEFAULT NULL,
  `Heb` varchar(500) DEFAULT NULL,
  `Eng` varchar(500) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `PageName` varchar(100) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`LangTextID`)
) ENGINE=InnoDB AUTO_INCREMENT=2092 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `langtext`
--

LOCK TABLES `langtext` WRITE;
/*!40000 ALTER TABLE `langtext` DISABLE KEYS */;
INSERT INTO `langtext` VALUES (2,'Error','אירעה שגיאה. אנא פנה למנהל המערכת לתמיכה. מס\' שגיאה','An Error has occured. Please contact the system administrator for support. Error Number','הודעת שגיאה כללית. אחריה מתקבל מספר','General'),(343,'DirectionRtl','ltr','rtl',NULL,'General'),(431,'DirectionLtr','rtl','ltr',NULL,'General'),(1030,'Delete Selected','מחק נבחרים','Delete Selected',NULL,'general'),(1031,'Are you sure you want to delete all the selected entries?','?האם אתה בטוח שברצונך למחוק את כל המסומנים','Are you sure you want to delete all the selected entries?',NULL,'general'),(1032,'Sum','סכום','Sum',NULL,'general'),(1033,'Select all in this page','בחר הכל בעמוד זה','Select all in this page',NULL,'general'),(1034,'Clear Selection','נקה בחירה','Clear Selection',NULL,'general'),(1035,'To','עד','To',NULL,'general'),(1036,'This Field Can Only Hold Numbers','שדה זה יכול להכיל מספרים בלבד','This Field Can Only Hold Numbers',NULL,'general'),(1037,'This field can only hold dates','שדה זה יכול להכיל תאריך (בפורמט ישראלי) בלבד','This field can only hold dates',NULL,'general'),(1038,'order','סדר','order',NULL,'general'),(1039,'Add Image','Images/BtnAdd-He.gif','Images/BtnAdd-En.gif',NULL,'General'),(1040,'Add','הוסף','Add',NULL,'General'),(1041,'Show','הצג','Show',NULL,'General'),(1042,'Filtering','סינון','Filtering',NULL,'General'),(1043,'Filter','סנן','Filter',NULL,'General'),(1044,'Advanced Filtering','סינון מתקדם','Advanced Filtering',NULL,'General'),(1045,'All the lines in this page were selected','כל השורות בדף זה סומנו','All the lines in this page were selected',NULL,'General'),(1046,'Click Here','לחץ כאן','Click Here',NULL,'General'),(1047,'to select everything in all the pages','לסימון בכל הדפים','to select everything in all the pages',NULL,'General'),(1048,'Out Of','מתוך','Out Of',NULL,'general'),(1049,'Next','הבא','Next',NULL,'general'),(1050,'No results were found','לא קיימות רשומות מתאימות','No results were found',NULL,'general'),(1065,'No','לא','No',NULL,'general'),(1066,'Yes','כן','Yes',NULL,'general'),(1202,'PersonalFieldManagement','ניהול שדות אישיים','Personal Field Management',NULL,'general'),(1485,'All lines have ben selected. To unmark them','השורות בכל הדפים סומנו. לביטול הסימון','All lines have ben selected. To unmark them',NULL,'General'),(1486,'Close','סגור','Close',NULL,'General'),(1487,'General','כללי','General',NULL,'General'),(1488,'Previous','הקודם','Prev',NULL,'General'),(1489,'Page','עמוד','Page',NULL,'General'),(1490,'Loading...','טוען...','Loading...',NULL,'General'),(1564,'images/LeftLIOff.gif','images/RightLIOff.gif','images/LeftLIOff.gif',NULL,'General'),(1565,'images/LeftLIOn.gif','images/RightLIOn.gif','images/LeftLIOn.gif',NULL,'General'),(1566,'images/foundLeft.gif','images/foundRight.gif','images/foundLeft.gif',NULL,'General'),(1567,'images/foundRight.gif','images/foundLeft.gif','images/foundRight.gif',NULL,'General'),(1569,'Button Bwd','images/ButtonFwd.gif','images/ButtonBwd.gif',NULL,'general'),(1570,'Button Fwd','images/ButtonBwd.gif','images/ButtonFwd.gif',NULL,'general'),(1571,'Are you sure you want to delete this entry?','?האם אתה בטוח שברצונך למחוק רשומה זו','Are you sure you want to delete this entry?',NULL,'general'),(1572,'Delete','מחק','Delete',NULL,'general'),(1573,'Edit','ערוך','Edit',NULL,'general'),(1574,'Select','בחר','Select',NULL,'general'),(1575,'Select All','בחר הכל','Select All',NULL,'general'),(1576,'Clear All','נקה הכל','Clear All',NULL,'general'),(1642,'Unnamed Document','Unnamed Document','ללא שם',NULL,'general'),(1737,'The information in this filed is not valid','המידע בשדה זה איננו תקין','The information in this filed is not valid',NULL,'General'),(1738,'Save And Return','שמור וחזור','Save And Return',NULL,'General'),(1739,'Save','שמור','Save',NULL,'General'),(1740,'The Field','השדה','The Field',NULL,'General'),(1741,'Is unique and therefor two lines in the same table cannot have the same value','הינו ייחודי ולכן לא ניתן לאפשר לשתי שורות בטבלה לקבל את אותו הערך','Is unique and therefor two lines in the same table cannot have the same value',NULL,'General'),(1742,'Search','חפש','Search',NULL,'General'),(2084,'טווח','####טווח####','טווח',NULL,'general'),(2085,'Manage Site','אתר מנוהל:','Manage Site',NULL,'General'),(2086,'Manage System','מערכת ניהול','Manage System',NULL,'General'),(2087,'Connected as:','מחובר כ:','Connected as:',NULL,'General'),(2088,'Last Login','כניסה אחרונה','Last Login',NULL,'General'),(2089,'Add New','הוסף חדש','Add New',NULL,'General'),(2090,'contact','####contact####','contact',NULL,'Full Name'),(2091,'contact','####contact####','contact',NULL,'Your E-mail Address');
/*!40000 ALTER TABLE `langtext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `langtext2`
--

DROP TABLE IF EXISTS `langtext2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `langtext2` (
  `LangTextID` int(11) NOT NULL AUTO_INCREMENT,
  `TextName` varchar(50) DEFAULT NULL,
  `PageID` int(11) DEFAULT NULL,
  `TextType` int(11) DEFAULT '1',
  `TextComment` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `1` text,
  `lastUsed` datetime DEFAULT NULL,
  `PageStatus` int(2) DEFAULT '0',
  `3` text,
  `4` text,
  PRIMARY KEY (`LangTextID`)
) ENGINE=InnoDB AUTO_INCREMENT=941 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `langtext2`
--

LOCK TABLES `langtext2` WRITE;
/*!40000 ALTER TABLE `langtext2` DISABLE KEYS */;
INSERT INTO `langtext2` VALUES (3,'New spinner?',2,1,'title signin',NULL,'New spinner?','2013-08-06 12:03:09',0,'ספינר חדש?','New spinner?'),(4,'its free',2,1,'in blue baloon',NULL,'its free','2013-08-06 12:03:09',0,'זה בחינם','its free'),(17,'First Name',2,1,NULL,NULL,'first name','2013-08-06 12:03:08',0,'שם פרטי','first name'),(18,'Enter First Name',2,1,'validation error alert',NULL,'Enter First Name','2013-08-06 12:03:08',0,'הכנס שם פרטי','Enter First Name'),(19,'Last Name',2,1,NULL,NULL,'last name','2013-08-06 12:03:08',0,'שם משפחה','last name'),(20,'Enter Last Name',2,1,'validation error alert',NULL,'Enter Last Name','2013-08-06 12:03:08',0,'הכנס שם משפחה','Enter Last Name'),(21,'looking for',2,1,NULL,NULL,'looking for','2013-08-06 12:03:10',0,'מחפש','looking for'),(22,'Enter Valid Birth Date',2,1,'validation error alert',NULL,'Enter Valid Birth Date','2012-10-28 10:54:11',0,'הכנס תאריך תקין','Enter Valid Birth Date'),(23,'Enter Valid Birthday Date',2,1,'validation error alert',NULL,'Enter Valid Birthday Date','2012-10-28 11:33:09',0,'הכנס תאריך תקין','Enter Valid Birthday Date'),(24,'e-mail',2,1,NULL,NULL,'e-mail','2013-08-06 12:03:08',0,'דואר אלקטרוני','e-mail'),(25,'Enter e-mail',2,1,'validation error alert',NULL,'Enter e-mail','2013-08-06 12:03:08',0,'הכנס דואר אלקטרוני','Enter e-mail'),(26,'Enter Valid e-mail',2,1,'validation error alert',NULL,'Enter Valid e-mail','2013-08-06 12:03:08',0,'הכנס דואר אלקטרוני תקין','Enter Valid e-mail'),(27,'Password',2,1,NULL,NULL,'password','2013-08-06 12:03:08',0,'סיסמה','password'),(28,'Enter Password',2,1,'validation error alert',NULL,'Enter Password','2013-08-06 12:03:08',0,'הכנס סיסמה','Enter Password'),(29,'Enter Valid Password',2,1,'validation error alert',NULL,'Enter Valid Password','2013-08-06 12:03:09',0,'הכנס סיסמה תקפה','Enter Valid Password'),(30,'I’ve read and agree',2,1,NULL,NULL,'I’ve read and agree','2013-08-06 12:03:10',0,'אני קראתי ומסכים','I’ve read and agree'),(31,'Spindate’s terms',2,1,NULL,NULL,'Spindate’s terms','2013-08-06 12:03:10',0,'תנאי ספינדייט','Spindate’s terms'),(32,'and I’m above 18 y/o',2,1,NULL,NULL,'and I’m above 18 y/o','2013-08-06 12:03:10',0,'אני מעל גיל 18','and I’m above 18 y/o'),(33,'Spin me in',2,1,NULL,NULL,'Spin me in','2013-08-06 12:03:08',0,'סובב אותי ','Spin me in'),(34,'Enter Valid Birthday Date',21,1,NULL,NULL,'Enter Valid Birthday Date','2013-04-24 09:07:59',0,'הכנס תאריך יום הולדת','Enter Valid Birthday Date'),(35,'e-mail',21,1,NULL,NULL,'e-mail','2012-11-18 15:14:17',0,'דואר אלקטרוני','e-mail'),(36,'Password',21,1,NULL,NULL,'Password','2012-10-28 17:44:56',0,'סיסמה','Password'),(37,'and I’m above 18 y/o',21,1,NULL,NULL,'and I’m above 18 y/o','2012-12-11 15:21:41',0,'and I’m above 18 y/o','and I’m above 18 y/o'),(39,'help?',14,1,NULL,NULL,'help?','2012-12-02 11:53:14',0,'עזרה?','help?'),(40,'About spindate',14,1,'Page header',NULL,'About spindate','2013-07-28 09:35:56',0,'על ספינדייט','About spindate'),(41,'close',14,1,'Close button text when Hovering above it',NULL,'close','2013-07-28 09:35:56',0,'סגור','close'),(42,'about text',14,3,'Page Content',NULL,'<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 450px; height: 465px; \">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align: middle; text-align: center; \">\r\n				<img alt=\"\" src=\"/spindate.co.il/uploads/images/logoabout.png\" style=\"width: 352px; height: 157px; \" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: left; \">\r\n				<div>\r\n					Lorem ipsum dolor sit amet, consectetur adipiscing elit. In auctor, mauris quis eleifend mollis, felis libero egestas tortor, aliquam vulputate turpis tortor sed zxdsad</div>\r\n				<div>\r\n					sadasdasdas d asa sdas das das das d</div>\r\n				<div>\r\n					&nbsp;sad d asd asd asd</div>\r\n				<div>\r\n					asdasd ads asd asd</div>\r\n				<div>\r\n					as dasd asd</div>\r\n				<div>\r\n					asdasdaas da sdasdtortor.&nbsp;</div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: left; \">\r\n				<div>\r\n					Nunc varius, nisl nec aliquet auctor, metus lorem vulputate nisl, at placerat justo urna eu felis. In non urna vel velit mollis semper id a nunc. Donec vitae elit augue.</div>\r\n				<div>\r\n					Integer nunc metus, posuere pretium placerat lobortis, interdum a massa.&nbsp;</div>\r\n				<div>\r\n					<div>\r\n						Nunc varius, nisl nec aliquet auctor, metus lorem vulputate nisl, at placerat justo urna eu felis. In non urna vel velit mollis semper id a nunc. Donec vitae elit augue.&nbsp;</div>\r\n					<div>\r\n						Integer nunc metus, posuere pretium placerat lobortis, interdum a massa</div>\r\n					<div>\r\n						<div>\r\n							Nunc varius, nisl nec aliquet auctor, metus lorem vulputate nisl, at placerat justo urna eu felis. In non urna vel velit mollis semper id a nunc. Donec vitae elit augue.&nbsp;</div>\r\n						<div>\r\n							Integer nunc metus, posuere pretium placerat lobortis, interdum a massa</div>\r\n					</div>\r\n				</div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: left; \">\r\n				Donec porttitor sem quis quam ullamcorper hendrerit. Cras sapien augue, gravida nec sollicitudin vitae, ornare sed libero. Sed metus mi, venenatis eu sodales cursus, vulputate ut dui. Nulla facilisi. Sed at congue nisi. Maecenas non ligula nisi. Sed magna sapien, consequat sit amet ultricies porttitor, blandit eu libero. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-07-28 09:35:56',0,'<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 450px; height: 465px; \">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align: middle; text-align: center; \">\r\n				<img alt=\"\" src=\"/spindate.co.il/uploads/images/logoabout.png\" style=\"width: 352px; height: 157px; \" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: left; \">\r\n				Lorem ipsum dolor sit amet, consectetur adipiscing elit. In auctor, mauris quis eleifend mollis, felis libero egestas tortor, aliquam vulputate turpis tortor sed tortor.&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: left; \">\r\n				Nunc varius, nisl nec aliquet auctor, metus lorem vulputate nisl, at placerat justo urna eu felis. In non urna vel velit mollis semper id a nunc. Donec vitae elit augue. Integer nunc metus, posuere pretium placerat lobortis, interdum a massa.&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: left; \">\r\n				Donec porttitor sem quis quam ullamcorper hendrerit. Cras sapien augue, gravida nec sollicitudin vitae, ornare sed libero. Sed metus mi, venenatis eu sodales cursus, vulputate ut dui. Nulla facilisi. Sed at congue nisi. Maecenas non ligula nisi. Sed magna sapien, consequat sit amet ultricies porttitor, blandit eu libero. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: left; \">\r\n				<div>\r\n					&nbsp;gravida nec sollicitudin vitae, ornare sed libero. Sed metus mi, venenatis eu sodales cursus, vulputate ut dui. Nulla facilisi. Sed at congue nisi. Maecenas non ligula nisi. Sed magna sapien, consequat sit amet ultricies porttitor, blandit eu libero. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per</div>\r\n				<div>\r\n					sadasd</div>\r\n				<div>\r\n					sadasd</div>\r\n				<div>\r\n					sadasdsad</div>\r\n				<div>\r\n					sadsadasd asdas das dasd ada</div>\r\n				<div>\r\n					asdasd asd</div>\r\n				<div>\r\n					&nbsp;</div>\r\n				<div>\r\n					asdasdas</div>\r\n				<div>\r\n					asd</div>\r\n				<div>\r\n					asdasdasdasd as dasdas dasdasdasd</div>\r\n				<div>\r\n					asd ad adas dasd asd asdinceptos himenaeos.</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div style=\"text-align: left; \">\r\n	&nbsp;</div>\r\n','<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 450px; height: 465px; \">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align: middle; text-align: center; \">\r\n				<img alt=\"\" src=\"/spindate.co.il/uploads/images/logoabout.png\" style=\"width: 352px; height: 157px; \" /></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: left; \">\r\n				<div>\r\n					Lorem ipsum dolor sit amet, consectetur adipiscing elit. In auctor, mauris quis eleifend mollis, felis libero egestas tortor, aliquam vulputate turpis tortor sed zxdsad</div>\r\n				<div>\r\n					sadasdasdas d asa sdas das das das d</div>\r\n				<div>\r\n					&nbsp;sad d asd asd asd</div>\r\n				<div>\r\n					asdasd ads asd asd</div>\r\n				<div>\r\n					as dasd asd</div>\r\n				<div>\r\n					asdasdaas da sdasdtortor.&nbsp;</div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: left; \">\r\n				<div>\r\n					Nunc varius, nisl nec aliquet auctor, metus lorem vulputate nisl, at placerat justo urna eu felis. In non urna vel velit mollis semper id a nunc. Donec vitae elit augue.</div>\r\n				<div>\r\n					Integer nunc metus, posuere pretium placerat lobortis, interdum a massa.&nbsp;</div>\r\n				<div>\r\n					<div>\r\n						Nunc varius, nisl nec aliquet auctor, metus lorem vulputate nisl, at placerat justo urna eu felis. In non urna vel velit mollis semper id a nunc. Donec vitae elit augue.&nbsp;</div>\r\n					<div>\r\n						Integer nunc metus, posuere pretium placerat lobortis, interdum a massa</div>\r\n					<div>\r\n						<div>\r\n							Nunc varius, nisl nec aliquet auctor, metus lorem vulputate nisl, at placerat justo urna eu felis. In non urna vel velit mollis semper id a nunc. Donec vitae elit augue.&nbsp;</div>\r\n						<div>\r\n							Integer nunc metus, posuere pretium placerat lobortis, interdum a massa</div>\r\n					</div>\r\n				</div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: left; \">\r\n				Donec porttitor sem quis quam ullamcorper hendrerit. Cras sapien augue, gravida nec sollicitudin vitae, ornare sed libero. Sed metus mi, venenatis eu sodales cursus, vulputate ut dui. Nulla facilisi. Sed at congue nisi. Maecenas non ligula nisi. Sed magna sapien, consequat sit amet ultricies porttitor, blandit eu libero. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div>\r\n	&nbsp;</div>\r\n'),(43,'term of service',15,3,'Page content',NULL,'<div style=\"text-align: left; \">\r\n	<span style=\"font-family:tahoma,geneva,sans-serif;\"><span style=\"font-size: 22px; \">Lorem Ipsum Dolor</span></span><br />\r\n	&nbsp;</div>\r\n<div style=\"text-align: left; \">\r\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. In auctor, mauris quis eleifend mollis.&nbsp;<br />\r\n	<br />\r\n	<br />\r\n	<div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			Felis libero egestas tortor, aliquam vulputate turpis tortor sed tortor. Nunc varius, nisl nec aliquet auctor, metus lorem vulputate nisl, at placerat justo&nbsp;</div>\r\n		<div>\r\n			urna eu felis. In non urna vel velit mollis semper id a nunc. Donec vitae elit augue. Integer nunc metus, posuere pretium placerat lobortis, interdum a massa.</div>\r\n		<div>\r\n			&nbsp;Donec porttitor sem quis quam ullamcorper hendrerit. Cras sapien augue, gravida nec sollicitudin vitae, ornare sed libero. Sed metus mi,</div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			Venenatis eu sodales!</div>\r\n		<div>\r\n			cursus, vulputate ut dui. Nulla facilisi. Sed at congue nisi. Maecenas non ligula nisi. Sed magna sapien, consequat sit amet ultricies porttitor, blandit eu libero.&nbsp;</div>\r\n		<div>\r\n			Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris id tellus eget sapien fermentum feugiat vel a orci.&nbsp;</div>\r\n		<div>\r\n			Nullam sollicitudin turpis quis purus iaculis volutpat laoreet lorem mattis.<br />\r\n			<br />\r\n			<br />\r\n			<div>\r\n				<div>\r\n					&nbsp;</div>\r\n				<div>\r\n					Felis libero egestas tortor, aliquam vulputate turpis tortor sed tortor. Nunc varius, nisl nec aliquet auctor, metus lorem vulputate nisl, at placerat justo&nbsp;</div>\r\n				<div>\r\n					urna eu felis. In non urna vel velit mollis semper id a nunc. Donec vitae elit augue. Integer nunc metus, posuere pretium placerat lobortis, interdum a massa.</div>\r\n				<div>\r\n					&nbsp;Donec porttitor sem quis quam ullamcorper hendrerit. Cras sapien augue, gravida nec sollicitudin vitae, ornare sed libero. Sed metus mi,</div>\r\n				<div>\r\n					&nbsp;</div>\r\n				<div>\r\n					Venenatis eu sodales!</div>\r\n				<div>\r\n					cursus, vulputate ut dui. Nulla facilisi. Sed at congue nisi. Maecenas non ligula nisi. Sed magna sapien, consequat sit amet ultricies porttitor, blandit eu libero.&nbsp;</div>\r\n				<div>\r\n					Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris id tellus eget sapien fermentum feugiat vel a orci.&nbsp;</div>\r\n				<div>\r\n					Nullam sollicitudin turpis quis purus iaculis volutpat laoreet lorem mattis.<br />\r\n					<br />\r\n					<br />\r\n					<div>\r\n						<div>\r\n							&nbsp;</div>\r\n						<div>\r\n							Felis libero egestas tortor, aliquam vulputate turpis tortor sed tortor. Nunc varius, nisl nec aliquet auctor, metus lorem vulputate nisl, at placerat justo&nbsp;</div>\r\n						<div>\r\n							urna eu felis. In non urna vel velit mollis semper id a nunc. Donec vitae elit augue. Integer nunc metus, posuere pretium placerat lobortis, interdum a massa.</div>\r\n						<div>\r\n							&nbsp;Donec porttitor sem quis quam ullamcorper hendrerit. Cras sapien augue, gravida nec sollicitudin vitae, ornare sed libero. Sed metus mi,</div>\r\n						<div>\r\n							&nbsp;</div>\r\n						<div>\r\n							Venenatis eu sodales!</div>\r\n						<div>\r\n							cursus, vulputate ut dui. Nulla facilisi. Sed at congue nisi. Maecenas non ligula nisi. Sed magna sapien, consequat sit amet ultricies porttitor, blandit eu libero.&nbsp;</div>\r\n						<div>\r\n							Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris id tellus eget sapien fermentum feugiat vel a orci.&nbsp;</div>\r\n						<div>\r\n							Nullam sollicitudin turpis quis purus iaculis volutpat laoreet lorem mattis.</div>\r\n					</div>\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>\r\n<div style=\"text-align: left; \">\r\n	&nbsp;</div>\r\n<div style=\"text-align: left; \">\r\n	Felis libero egestas tortor, aliquam vulputate turpis tortor sed tortor. Nunc varius, nisl nec aliquet auctor, metus lorem vulputate nisl, at placerat justo&nbsp;</div>\r\n<div style=\"text-align: left; \">\r\n	urna eu felis. In non urna vel velit mollis semper id a nunc. Donec vitae elit augue. Integer nunc metus, posuere pretium placerat lobortis, interdum a massa.</div>\r\n<div style=\"text-align: left; \">\r\n	&nbsp;Donec porttitor sem quis quam ullamcorper hendrerit. Cras sapien augue, gravida nec sollicitudin vitae, ornare sed libero. Sed metus mi,</div>\r\n<div style=\"text-align: left; \">\r\n	&nbsp;</div>\r\n<div style=\"text-align: left; \">\r\n	Venenatis eu sodales!</div>\r\n<div style=\"text-align: left; \">\r\n	cursus, vulputate ut dui. Nulla facilisi. Sed at congue nisi. Maecenas non ligula nisi. Sed magna sapien, consequat sit amet ultricies porttitor, blandit eu libero.&nbsp;</div>\r\n<div style=\"text-align: left; \">\r\n	Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris id tellus eget sapien fermentum feugiat vel a orci.&nbsp;</div>\r\n<div style=\"text-align: left; \">\r\n	Nullam sollicitudin turpis quis purus iaculis volutpat laoreet lorem mattis.</div>\r\n','2013-07-31 16:20:05',0,'<div style=\"text-align: left; \">\r\n	<span style=\"font-family:tahoma,geneva,sans-serif;\"><span style=\"font-size: 22px; \">Lorem Ipsum Dolor</span></span><br />\r\n	&nbsp;</div>\r\n<div style=\"text-align: left; \">\r\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. In auctor, mauris quis eleifend mollis.&nbsp;<br />\r\n	<br />\r\n	<br />\r\n	<div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			Felis libero egestas tortor, aliquam vulputate turpis tortor sed tortor. Nunc varius, nisl nec aliquet auctor, metus lorem vulputate nisl, at placerat justo&nbsp;</div>\r\n		<div>\r\n			urna eu felis. In non urna vel velit mollis semper id a nunc. Donec vitae elit augue. Integer nunc metus, posuere pretium placerat lobortis, interdum a massa.</div>\r\n		<div>\r\n			&nbsp;Donec porttitor sem quis quam ullamcorper hendrerit. Cras sapien augue, gravida nec sollicitudin vitae, ornare sed libero. Sed metus mi,</div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			Venenatis eu sodales!</div>\r\n		<div>\r\n			cursus, vulputate ut dui. Nulla facilisi. Sed at congue nisi. Maecenas non ligula nisi. Sed magna sapien, consequat sit amet ultricies porttitor, blandit eu libero.&nbsp;</div>\r\n		<div>\r\n			Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris id tellus eget sapien fermentum feugiat vel a orci.&nbsp;</div>\r\n		<div>\r\n			Nullam sollicitudin turpis quis purus iaculis volutpat laoreet lorem mattis.<br />\r\n			<br />\r\n			<br />\r\n			<div>\r\n				<div>\r\n					&nbsp;</div>\r\n				<div>\r\n					Felis libero egestas tortor, aliquam vulputate turpis tortor sed tortor. Nunc varius, nisl nec aliquet auctor, metus lorem vulputate nisl, at placerat justo&nbsp;</div>\r\n				<div>\r\n					urna eu felis. In non urna vel velit mollis semper id a nunc. Donec vitae elit augue. Integer nunc metus, posuere pretium placerat lobortis, interdum a massa.</div>\r\n				<div>\r\n					&nbsp;Donec porttitor sem quis quam ullamcorper hendrerit. Cras sapien augue, gravida nec sollicitudin vitae, ornare sed libero. Sed metus mi,</div>\r\n				<div>\r\n					&nbsp;</div>\r\n				<div>\r\n					Venenatis eu sodales!</div>\r\n				<div>\r\n					cursus, vulputate ut dui. Nulla facilisi. Sed at congue nisi. Maecenas non ligula nisi. Sed magna sapien, consequat sit amet ultricies porttitor, blandit eu libero.&nbsp;</div>\r\n				<div>\r\n					Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris id tellus eget sapien fermentum feugiat vel a orci.&nbsp;</div>\r\n				<div>\r\n					Nullam sollicitudin turpis quis purus iaculis volutpat laoreet lorem mattis.<br />\r\n					<br />\r\n					<br />\r\n					<div>\r\n						<div>\r\n							&nbsp;</div>\r\n						<div>\r\n							Felis libero egestas tortor, aliquam vulputate turpis tortor sed tortor. Nunc varius, nisl nec aliquet auctor, metus lorem vulputate nisl, at placerat justo&nbsp;</div>\r\n						<div>\r\n							urna eu felis. In non urna vel velit mollis semper id a nunc. Donec vitae elit augue. Integer nunc metus, posuere pretium placerat lobortis, interdum a massa.</div>\r\n						<div>\r\n							&nbsp;Donec porttitor sem quis quam ullamcorper hendrerit. Cras sapien augue, gravida nec sollicitudin vitae, ornare sed libero. Sed metus mi,</div>\r\n						<div>\r\n							&nbsp;</div>\r\n						<div>\r\n							Venenatis eu sodales!</div>\r\n						<div>\r\n							cursus, vulputate ut dui. Nulla facilisi. Sed at congue nisi. Maecenas non ligula nisi. Sed magna sapien, consequat sit amet ultricies porttitor, blandit eu libero.&nbsp;</div>\r\n						<div>\r\n							Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris id tellus eget sapien fermentum feugiat vel a orci.&nbsp;</div>\r\n						<div>\r\n							Nullam sollicitudin turpis quis purus iaculis volutpat laoreet lorem mattis.</div>\r\n					</div>\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>\r\n<div style=\"text-align: left; \">\r\n	&nbsp;</div>\r\n<div style=\"text-align: left; \">\r\n	Felis libero egestas tortor, aliquam vulputate turpis tortor sed tortor. Nunc varius, nisl nec aliquet auctor, metus lorem vulputate nisl, at placerat justo&nbsp;</div>\r\n<div style=\"text-align: left; \">\r\n	urna eu felis. In non urna vel velit mollis semper id a nunc. Donec vitae elit augue. Integer nunc metus, posuere pretium placerat lobortis, interdum a massa.</div>\r\n<div style=\"text-align: left; \">\r\n	&nbsp;Donec porttitor sem quis quam ullamcorper hendrerit. Cras sapien augue, gravida nec sollicitudin vitae, ornare sed libero. Sed metus mi,</div>\r\n<div style=\"text-align: left; \">\r\n	&nbsp;</div>\r\n<div style=\"text-align: left; \">\r\n	Venenatis eu sodales!</div>\r\n<div style=\"text-align: left; \">\r\n	cursus, vulputate ut dui. Nulla facilisi. Sed at congue nisi. Maecenas non ligula nisi. Sed magna sapien, consequat sit amet ultricies porttitor, blandit eu libero.&nbsp;</div>\r\n<div style=\"text-align: left; \">\r\n	Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris id tellus eget sapien fermentum feugiat vel a orci.&nbsp;</div>\r\n<div style=\"text-align: left; \">\r\n	Nullam sollicitudin turpis quis purus iaculis volutpat laoreet lorem mattis.</div>\r\n','<div style=\"text-align: left; \">\r\n	<span style=\"font-family:tahoma,geneva,sans-serif;\"><span style=\"font-size: 22px; \">Lorem Ipsum Dolor</span></span><br />\r\n	&nbsp;</div>\r\n<div style=\"text-align: left; \">\r\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. In auctor, mauris quis eleifend mollis.&nbsp;<br />\r\n	<br />\r\n	<br />\r\n	<div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			Felis libero egestas tortor, aliquam vulputate turpis tortor sed tortor. Nunc varius, nisl nec aliquet auctor, metus lorem vulputate nisl, at placerat justo&nbsp;</div>\r\n		<div>\r\n			urna eu felis. In non urna vel velit mollis semper id a nunc. Donec vitae elit augue. Integer nunc metus, posuere pretium placerat lobortis, interdum a massa.</div>\r\n		<div>\r\n			&nbsp;Donec porttitor sem quis quam ullamcorper hendrerit. Cras sapien augue, gravida nec sollicitudin vitae, ornare sed libero. Sed metus mi,</div>\r\n		<div>\r\n			&nbsp;</div>\r\n		<div>\r\n			Venenatis eu sodales!</div>\r\n		<div>\r\n			cursus, vulputate ut dui. Nulla facilisi. Sed at congue nisi. Maecenas non ligula nisi. Sed magna sapien, consequat sit amet ultricies porttitor, blandit eu libero.&nbsp;</div>\r\n		<div>\r\n			Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris id tellus eget sapien fermentum feugiat vel a orci.&nbsp;</div>\r\n		<div>\r\n			Nullam sollicitudin turpis quis purus iaculis volutpat laoreet lorem mattis.<br />\r\n			<br />\r\n			<br />\r\n			<div>\r\n				<div>\r\n					&nbsp;</div>\r\n				<div>\r\n					Felis libero egestas tortor, aliquam vulputate turpis tortor sed tortor. Nunc varius, nisl nec aliquet auctor, metus lorem vulputate nisl, at placerat justo&nbsp;</div>\r\n				<div>\r\n					urna eu felis. In non urna vel velit mollis semper id a nunc. Donec vitae elit augue. Integer nunc metus, posuere pretium placerat lobortis, interdum a massa.</div>\r\n				<div>\r\n					&nbsp;Donec porttitor sem quis quam ullamcorper hendrerit. Cras sapien augue, gravida nec sollicitudin vitae, ornare sed libero. Sed metus mi,</div>\r\n				<div>\r\n					&nbsp;</div>\r\n				<div>\r\n					Venenatis eu sodales!</div>\r\n				<div>\r\n					cursus, vulputate ut dui. Nulla facilisi. Sed at congue nisi. Maecenas non ligula nisi. Sed magna sapien, consequat sit amet ultricies porttitor, blandit eu libero.&nbsp;</div>\r\n				<div>\r\n					Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris id tellus eget sapien fermentum feugiat vel a orci.&nbsp;</div>\r\n				<div>\r\n					Nullam sollicitudin turpis quis purus iaculis volutpat laoreet lorem mattis.<br />\r\n					<br />\r\n					<br />\r\n					<div>\r\n						<div>\r\n							&nbsp;</div>\r\n						<div>\r\n							Felis libero egestas tortor, aliquam vulputate turpis tortor sed tortor. Nunc varius, nisl nec aliquet auctor, metus lorem vulputate nisl, at placerat justo&nbsp;</div>\r\n						<div>\r\n							urna eu felis. In non urna vel velit mollis semper id a nunc. Donec vitae elit augue. Integer nunc metus, posuere pretium placerat lobortis, interdum a massa.</div>\r\n						<div>\r\n							&nbsp;Donec porttitor sem quis quam ullamcorper hendrerit. Cras sapien augue, gravida nec sollicitudin vitae, ornare sed libero. Sed metus mi,</div>\r\n						<div>\r\n							&nbsp;</div>\r\n						<div>\r\n							Venenatis eu sodales!</div>\r\n						<div>\r\n							cursus, vulputate ut dui. Nulla facilisi. Sed at congue nisi. Maecenas non ligula nisi. Sed magna sapien, consequat sit amet ultricies porttitor, blandit eu libero.&nbsp;</div>\r\n						<div>\r\n							Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris id tellus eget sapien fermentum feugiat vel a orci.&nbsp;</div>\r\n						<div>\r\n							Nullam sollicitudin turpis quis purus iaculis volutpat laoreet lorem mattis.</div>\r\n					</div>\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>\r\n<div style=\"text-align: left; \">\r\n	&nbsp;</div>\r\n<div style=\"text-align: left; \">\r\n	Felis libero egestas tortor, aliquam vulputate turpis tortor sed tortor. Nunc varius, nisl nec aliquet auctor, metus lorem vulputate nisl, at placerat justo&nbsp;</div>\r\n<div style=\"text-align: left; \">\r\n	urna eu felis. In non urna vel velit mollis semper id a nunc. Donec vitae elit augue. Integer nunc metus, posuere pretium placerat lobortis, interdum a massa.</div>\r\n<div style=\"text-align: left; \">\r\n	&nbsp;Donec porttitor sem quis quam ullamcorper hendrerit. Cras sapien augue, gravida nec sollicitudin vitae, ornare sed libero. Sed metus mi,</div>\r\n<div style=\"text-align: left; \">\r\n	&nbsp;</div>\r\n<div style=\"text-align: left; \">\r\n	Venenatis eu sodales!</div>\r\n<div style=\"text-align: left; \">\r\n	cursus, vulputate ut dui. Nulla facilisi. Sed at congue nisi. Maecenas non ligula nisi. Sed magna sapien, consequat sit amet ultricies porttitor, blandit eu libero.&nbsp;</div>\r\n<div style=\"text-align: left; \">\r\n	Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Mauris id tellus eget sapien fermentum feugiat vel a orci.&nbsp;</div>\r\n<div style=\"text-align: left; \">\r\n	Nullam sollicitudin turpis quis purus iaculis volutpat laoreet lorem mattis.</div>\r\n'),(44,'policy',16,3,'Page content',NULL,'<h3 style=\"direction: ltr; color: rgb(0, 0, 0); background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px; font-family: sans-serif; line-height: 19.1875px;\">\r\n	<span class=\"mw-headline\" id=\"Distributive_policies\">Distributive policies</span></h3>\r\n<p style=\"direction: ltr; margin: 0.4em 0px 0.5em; line-height: 19.1875px; color: rgb(0, 0, 0); font-family: sans-serif; font-size: 13px;\">\r\n	Distributive policies extend goods and services to members of an organization, as well as distributing the costs of the goods/services amongst the members of the organization. Examples include government policies that impact spending for&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Welfare_(financial_aid)\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\" title=\"Welfare (financial aid)\">welfare</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Public_education\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\" title=\"Public education\">public education</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Highways\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\" title=\"Highways\">highways</a>, and public safety, or a professional organization&#39;s benefits plan.</p>\r\n<h3 style=\"color: rgb(0, 0, 0); background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px; font-family: sans-serif; line-height: 19.1875px;\">\r\n	<span class=\"editsection\" style=\"-webkit-user-select: none; float: right; font-size: 13px; font-weight: normal; margin-left: 5px;\">[<a href=\"http://en.wikipedia.org/w/index.php?title=Policy&amp;action=edit&amp;section=8\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\" title=\"Edit section: Regulatory policies\">edit</a>]</span></h3>\r\n<div style=\"direction: ltr;\">\r\n	<span class=\"mw-headline\" id=\"Regulatory_policies\">Regulatory policies</span></div>\r\n<div style=\"direction: ltr;\">\r\n	&nbsp;</div>\r\n<div style=\"direction: ltr;\">\r\n	<h3 style=\"direction: ltr; background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"mw-headline\" id=\"Distributive_policies\">Distributive policies</span></span></h3>\r\n	<p style=\"direction: ltr; margin: 0.4em 0px 0.5em; font-size: 13px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\">Distributive policies extend goods and services to members of an organization, as well as distributing the costs of the goods/services amongst the members of the organization. Examples include government policies that impact spending for&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Welfare_(financial_aid)\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Welfare (financial aid)\">welfare</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Public_education\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Public education\">public education</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Highways\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Highways\">highways</a>, and public safety, or a professional organization&#39;s benefits plan.</span></p>\r\n	<h3 style=\"background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"editsection\" style=\"-webkit-user-select: none; float: right; font-size: 13px; font-weight: normal; margin-left: 5px;\">[<a href=\"http://en.wikipedia.org/w/index.php?title=Policy&amp;action=edit&amp;section=8\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Edit section: Regulatory policies\">edit</a>]</span></span></h3>\r\n	<div style=\"direction: ltr;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"mw-headline\" id=\"Regulatory_policies\">Regulatory policies</span></span></div>\r\n	<div style=\"direction: ltr;\">\r\n		&nbsp;</div>\r\n	<div style=\"direction: ltr;\">\r\n		&nbsp;</div>\r\n	<h3 style=\"direction: ltr; background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"mw-headline\" id=\"Distributive_policies\">Distributive policies</span></span></h3>\r\n	<p style=\"direction: ltr; margin: 0.4em 0px 0.5em; font-size: 13px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\">Distributive policies extend goods and services to members of an organization, as well as distributing the costs of the goods/services amongst the members of the organization. Examples include government policies that impact spending for&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Welfare_(financial_aid)\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Welfare (financial aid)\">welfare</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Public_education\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Public education\">public education</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Highways\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Highways\">highways</a>, and public safety, or a professional organization&#39;s benefits plan.</span></p>\r\n	<h3 style=\"background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"editsection\" style=\"-webkit-user-select: none; float: right; font-size: 13px; font-weight: normal; margin-left: 5px;\">[<a href=\"http://en.wikipedia.org/w/index.php?title=Policy&amp;action=edit&amp;section=8\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Edit section: Regulatory policies\">edit</a>]</span></span></h3>\r\n	<div style=\"direction: ltr;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"mw-headline\" id=\"Regulatory_policies\">Regulatory policies</span></span></div>\r\n	<div style=\"direction: ltr;\">\r\n		&nbsp;</div>\r\n	<div style=\"direction: ltr;\">\r\n		&nbsp;</div>\r\n	<h3 style=\"direction: ltr; background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"mw-headline\" id=\"Distributive_policies\">Distributive policies</span></span></h3>\r\n	<p style=\"direction: ltr; margin: 0.4em 0px 0.5em; font-size: 13px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\">Distributive policies extend goods and services to members of an organization, as well as distributing the costs of the goods/services amongst the members of the organization. Examples include government policies that impact spending for&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Welfare_(financial_aid)\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Welfare (financial aid)\">welfare</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Public_education\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Public education\">public education</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Highways\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Highways\">highways</a>, and public safety, or a professional organization&#39;s benefits plan.</span></p>\r\n	<h3 style=\"background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"editsection\" style=\"-webkit-user-select: none; float: right; font-size: 13px; font-weight: normal; margin-left: 5px;\">[<a href=\"http://en.wikipedia.org/w/index.php?title=Policy&amp;action=edit&amp;section=8\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Edit section: Regulatory policies\">edit</a>]</span></span></h3>\r\n	<div style=\"direction: ltr;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"mw-headline\" id=\"Regulatory_policies\">Regulatory policies</span></span></div>\r\n	<div style=\"direction: ltr;\">\r\n		&nbsp;</div>\r\n	<div style=\"direction: ltr;\">\r\n		&nbsp;</div>\r\n	<h3 style=\"direction: ltr; background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"mw-headline\" id=\"Distributive_policies\">Distributive policies</span></span></h3>\r\n	<p style=\"direction: ltr; margin: 0.4em 0px 0.5em; font-size: 13px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\">Distributive policies extend goods and services to members of an organization, as well as distributing the costs of the goods/services amongst the members of the organization. Examples include government policies that impact spending for&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Welfare_(financial_aid)\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Welfare (financial aid)\">welfare</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Public_education\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Public education\">public education</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Highways\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Highways\">highways</a>, and public safety, or a professional organization&#39;s benefits plan.</span></p>\r\n	<h3 style=\"background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"editsection\" style=\"-webkit-user-select: none; float: right; font-size: 13px; font-weight: normal; margin-left: 5px;\">[<a href=\"http://en.wikipedia.org/w/index.php?title=Policy&amp;action=edit&amp;section=8\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Edit section: Regulatory policies\">edit</a>]</span></span></h3>\r\n	<div style=\"direction: ltr;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"mw-headline\" id=\"Regulatory_policies\">Regulatory policies</span></span></div>\r\n	<div style=\"direction: ltr;\">\r\n		&nbsp;</div>\r\n	<div style=\"direction: ltr;\">\r\n		&nbsp;</div>\r\n	<h3 style=\"direction: ltr; background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"mw-headline\" id=\"Distributive_policies\">Distributive policies</span></span></h3>\r\n	<p style=\"direction: ltr; margin: 0.4em 0px 0.5em; font-size: 13px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\">Distributive policies extend goods and services to members of an organization, as well as distributing the costs of the goods/services amongst the members of the organization. Examples include government policies that impact spending for&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Welfare_(financial_aid)\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Welfare (financial aid)\">welfare</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Public_education\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Public education\">public education</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Highways\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Highways\">highways</a>, and public safety, or a professional organization&#39;s benefits plan.</span></p>\r\n	<h3 style=\"background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"editsection\" style=\"-webkit-user-select: none; float: right; font-size: 13px; font-weight: normal; margin-left: 5px;\">[<a href=\"http://en.wikipedia.org/w/index.php?title=Policy&amp;action=edit&amp;section=8\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Edit section: Regulatory policies\">edit</a>]</span></span></h3>\r\n	<div style=\"direction: ltr;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"mw-headline\" id=\"Regulatory_policies\">Regulatory policies</span></span></div>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-07-31 16:20:09',0,'<h3 style=\"direction: ltr; color: rgb(0, 0, 0); background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px; font-family: sans-serif; line-height: 19.1875px;\">\r\n	<span class=\"mw-headline\" id=\"Distributive_policies\">Distributive policies</span></h3>\r\n<p style=\"direction: ltr; margin: 0.4em 0px 0.5em; line-height: 19.1875px; color: rgb(0, 0, 0); font-family: sans-serif; font-size: 13px;\">\r\n	Distributive policies extend goods and services to members of an organization, as well as distributing the costs of the goods/services amongst the members of the organization. Examples include government policies that impact spending for&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Welfare_(financial_aid)\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\" title=\"Welfare (financial aid)\">welfare</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Public_education\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\" title=\"Public education\">public education</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Highways\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\" title=\"Highways\">highways</a>, and public safety, or a professional organization&#39;s benefits plan.</p>\r\n<h3 style=\"color: rgb(0, 0, 0); background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px; font-family: sans-serif; line-height: 19.1875px;\">\r\n	<span class=\"editsection\" style=\"-webkit-user-select: none; float: right; font-size: 13px; font-weight: normal; margin-left: 5px;\">[<a href=\"http://en.wikipedia.org/w/index.php?title=Policy&amp;action=edit&amp;section=8\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\" title=\"Edit section: Regulatory policies\">edit</a>]</span></h3>\r\n<div style=\"direction: ltr;\">\r\n	<span class=\"mw-headline\" id=\"Regulatory_policies\">Regulatory policies</span></div>\r\n<div style=\"direction: ltr;\">\r\n	&nbsp;</div>\r\n<div style=\"direction: ltr;\">\r\n	<h3 style=\"background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"mw-headline\" id=\"Distributive_policies\">Distributive policies</span></span></h3>\r\n	<p style=\"margin: 0.4em 0px 0.5em; font-size: 13px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\">Distributive policies extend goods and services to members of an organization, as well as distributing the costs of the goods/services amongst the members of the organization. Examples include government policies that impact spending for&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Welfare_(financial_aid)\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\" title=\"Welfare (financial aid)\">welfare</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Public_education\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\" title=\"Public education\">public education</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Highways\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\" title=\"Highways\">highways</a>, and public safety, or a professional organization&#39;s benefits plan.</span></p>\r\n	<h3 style=\"background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"editsection\" style=\"-webkit-user-select: none; float: right; font-size: 13px; font-weight: normal; margin-left: 5px;\">[<a href=\"http://en.wikipedia.org/w/index.php?title=Policy&amp;action=edit&amp;section=8\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\" title=\"Edit section: Regulatory policies\">edit</a>]</span><span class=\"mw-headline\" id=\"Regulatory_policies\">Regulatory policies</span></span></h3>\r\n	<div>\r\n		&nbsp;</div>\r\n	<div>\r\n		&nbsp;</div>\r\n	<h3 style=\"background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"mw-headline\" id=\"Distributive_policies\">Distributive policies</span></span></h3>\r\n	<p style=\"margin: 0.4em 0px 0.5em; font-size: 13px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\">Distributive policies extend goods and services to members of an organization, as well as distributing the costs of the goods/services amongst the members of the organization. Examples include government policies that impact spending for&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Welfare_(financial_aid)\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\" title=\"Welfare (financial aid)\">welfare</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Public_education\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\" title=\"Public education\">public education</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Highways\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\" title=\"Highways\">highways</a>, and public safety, or a professional organization&#39;s benefits plan.</span></p>\r\n	<h3 style=\"background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"editsection\" style=\"-webkit-user-select: none; float: right; font-size: 13px; font-weight: normal; margin-left: 5px;\">[<a href=\"http://en.wikipedia.org/w/index.php?title=Policy&amp;action=edit&amp;section=8\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\" title=\"Edit section: Regulatory policies\">edit</a>]</span><span class=\"mw-headline\" id=\"Regulatory_policies\">Regulatory policies</span></span></h3>\r\n	<div>\r\n		&nbsp;</div>\r\n	<h3 style=\"background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"mw-headline\" id=\"Distributive_policies\">Distributive policies</span></span></h3>\r\n	<p style=\"margin: 0.4em 0px 0.5em; font-size: 13px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\">Distributive policies extend goods and services to members of an organization, as well as distributing the costs of the goods/services amongst the members of the organization. Examples include government policies that impact spending for&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Welfare_(financial_aid)\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\" title=\"Welfare (financial aid)\">welfare</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Public_education\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\" title=\"Public education\">public education</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Highways\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\" title=\"Highways\">highways</a>, and public safety, or a professional organization&#39;s benefits plan.</span></p>\r\n	<h3 style=\"background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"editsection\" style=\"-webkit-user-select: none; float: right; font-size: 13px; font-weight: normal; margin-left: 5px;\">[<a href=\"http://en.wikipedia.org/w/index.php?title=Policy&amp;action=edit&amp;section=8\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\" title=\"Edit section: Regulatory policies\">edit</a>]</span><span class=\"mw-headline\" id=\"Regulatory_policies\">Regulatory policies</span>Distributive policies</span></h3>\r\n	<p style=\"margin: 0.4em 0px 0.5em; font-size: 13px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\">Distributive policies extend goods and services to members of an organization, as well as distributing the costs of the goods/services amongst the members of the organization. Examples include government policies that impact spending for&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Welfare_(financial_aid)\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\" title=\"Welfare (financial aid)\">welfare</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Public_education\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\" title=\"Public education\">public education</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Highways\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\" title=\"Highways\">highways</a>, and public safety, or a professional organization&#39;s benefits plan.</span></p>\r\n	<h3 style=\"background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"editsection\" style=\"-webkit-user-select: none; float: right; font-size: 13px; font-weight: normal; margin-left: 5px;\">[<a href=\"http://en.wikipedia.org/w/index.php?title=Policy&amp;action=edit&amp;section=8\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\" title=\"Edit section: Regulatory policies\">edit</a>]</span><span class=\"mw-headline\" id=\"Regulatory_policies\">Regulatory policies</span></span></h3>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','<h3 style=\"direction: ltr; color: rgb(0, 0, 0); background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px; font-family: sans-serif; line-height: 19.1875px;\">\r\n	<span class=\"mw-headline\" id=\"Distributive_policies\">Distributive policies</span></h3>\r\n<p style=\"direction: ltr; margin: 0.4em 0px 0.5em; line-height: 19.1875px; color: rgb(0, 0, 0); font-family: sans-serif; font-size: 13px;\">\r\n	Distributive policies extend goods and services to members of an organization, as well as distributing the costs of the goods/services amongst the members of the organization. Examples include government policies that impact spending for&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Welfare_(financial_aid)\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\" title=\"Welfare (financial aid)\">welfare</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Public_education\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\" title=\"Public education\">public education</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Highways\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\" title=\"Highways\">highways</a>, and public safety, or a professional organization&#39;s benefits plan.</p>\r\n<h3 style=\"color: rgb(0, 0, 0); background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px; font-family: sans-serif; line-height: 19.1875px;\">\r\n	<span class=\"editsection\" style=\"-webkit-user-select: none; float: right; font-size: 13px; font-weight: normal; margin-left: 5px;\">[<a href=\"http://en.wikipedia.org/w/index.php?title=Policy&amp;action=edit&amp;section=8\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none; background-position: initial initial; background-repeat: initial initial;\" title=\"Edit section: Regulatory policies\">edit</a>]</span></h3>\r\n<div style=\"direction: ltr;\">\r\n	<span class=\"mw-headline\" id=\"Regulatory_policies\">Regulatory policies</span></div>\r\n<div style=\"direction: ltr;\">\r\n	&nbsp;</div>\r\n<div style=\"direction: ltr;\">\r\n	<h3 style=\"direction: ltr; background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"mw-headline\" id=\"Distributive_policies\">Distributive policies</span></span></h3>\r\n	<p style=\"direction: ltr; margin: 0.4em 0px 0.5em; font-size: 13px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\">Distributive policies extend goods and services to members of an organization, as well as distributing the costs of the goods/services amongst the members of the organization. Examples include government policies that impact spending for&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Welfare_(financial_aid)\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Welfare (financial aid)\">welfare</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Public_education\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Public education\">public education</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Highways\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Highways\">highways</a>, and public safety, or a professional organization&#39;s benefits plan.</span></p>\r\n	<h3 style=\"background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"editsection\" style=\"-webkit-user-select: none; float: right; font-size: 13px; font-weight: normal; margin-left: 5px;\">[<a href=\"http://en.wikipedia.org/w/index.php?title=Policy&amp;action=edit&amp;section=8\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Edit section: Regulatory policies\">edit</a>]</span></span></h3>\r\n	<div style=\"direction: ltr;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"mw-headline\" id=\"Regulatory_policies\">Regulatory policies</span></span></div>\r\n	<div style=\"direction: ltr;\">\r\n		&nbsp;</div>\r\n	<div style=\"direction: ltr;\">\r\n		&nbsp;</div>\r\n	<h3 style=\"direction: ltr; background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"mw-headline\" id=\"Distributive_policies\">Distributive policies</span></span></h3>\r\n	<p style=\"direction: ltr; margin: 0.4em 0px 0.5em; font-size: 13px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\">Distributive policies extend goods and services to members of an organization, as well as distributing the costs of the goods/services amongst the members of the organization. Examples include government policies that impact spending for&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Welfare_(financial_aid)\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Welfare (financial aid)\">welfare</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Public_education\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Public education\">public education</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Highways\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Highways\">highways</a>, and public safety, or a professional organization&#39;s benefits plan.</span></p>\r\n	<h3 style=\"background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"editsection\" style=\"-webkit-user-select: none; float: right; font-size: 13px; font-weight: normal; margin-left: 5px;\">[<a href=\"http://en.wikipedia.org/w/index.php?title=Policy&amp;action=edit&amp;section=8\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Edit section: Regulatory policies\">edit</a>]</span></span></h3>\r\n	<div style=\"direction: ltr;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"mw-headline\" id=\"Regulatory_policies\">Regulatory policies</span></span></div>\r\n	<div style=\"direction: ltr;\">\r\n		&nbsp;</div>\r\n	<div style=\"direction: ltr;\">\r\n		&nbsp;</div>\r\n	<h3 style=\"direction: ltr; background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"mw-headline\" id=\"Distributive_policies\">Distributive policies</span></span></h3>\r\n	<p style=\"direction: ltr; margin: 0.4em 0px 0.5em; font-size: 13px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\">Distributive policies extend goods and services to members of an organization, as well as distributing the costs of the goods/services amongst the members of the organization. Examples include government policies that impact spending for&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Welfare_(financial_aid)\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Welfare (financial aid)\">welfare</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Public_education\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Public education\">public education</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Highways\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Highways\">highways</a>, and public safety, or a professional organization&#39;s benefits plan.</span></p>\r\n	<h3 style=\"background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"editsection\" style=\"-webkit-user-select: none; float: right; font-size: 13px; font-weight: normal; margin-left: 5px;\">[<a href=\"http://en.wikipedia.org/w/index.php?title=Policy&amp;action=edit&amp;section=8\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Edit section: Regulatory policies\">edit</a>]</span></span></h3>\r\n	<div style=\"direction: ltr;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"mw-headline\" id=\"Regulatory_policies\">Regulatory policies</span></span></div>\r\n	<div style=\"direction: ltr;\">\r\n		&nbsp;</div>\r\n	<div style=\"direction: ltr;\">\r\n		&nbsp;</div>\r\n	<h3 style=\"direction: ltr; background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"mw-headline\" id=\"Distributive_policies\">Distributive policies</span></span></h3>\r\n	<p style=\"direction: ltr; margin: 0.4em 0px 0.5em; font-size: 13px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\">Distributive policies extend goods and services to members of an organization, as well as distributing the costs of the goods/services amongst the members of the organization. Examples include government policies that impact spending for&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Welfare_(financial_aid)\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Welfare (financial aid)\">welfare</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Public_education\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Public education\">public education</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Highways\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Highways\">highways</a>, and public safety, or a professional organization&#39;s benefits plan.</span></p>\r\n	<h3 style=\"background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"editsection\" style=\"-webkit-user-select: none; float: right; font-size: 13px; font-weight: normal; margin-left: 5px;\">[<a href=\"http://en.wikipedia.org/w/index.php?title=Policy&amp;action=edit&amp;section=8\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Edit section: Regulatory policies\">edit</a>]</span></span></h3>\r\n	<div style=\"direction: ltr;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"mw-headline\" id=\"Regulatory_policies\">Regulatory policies</span></span></div>\r\n	<div style=\"direction: ltr;\">\r\n		&nbsp;</div>\r\n	<div style=\"direction: ltr;\">\r\n		&nbsp;</div>\r\n	<h3 style=\"direction: ltr; background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"mw-headline\" id=\"Distributive_policies\">Distributive policies</span></span></h3>\r\n	<p style=\"direction: ltr; margin: 0.4em 0px 0.5em; font-size: 13px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\">Distributive policies extend goods and services to members of an organization, as well as distributing the costs of the goods/services amongst the members of the organization. Examples include government policies that impact spending for&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Welfare_(financial_aid)\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Welfare (financial aid)\">welfare</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Public_education\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Public education\">public education</a>,&nbsp;<a class=\"mw-redirect\" href=\"http://en.wikipedia.org/wiki/Highways\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Highways\">highways</a>, and public safety, or a professional organization&#39;s benefits plan.</span></p>\r\n	<h3 style=\"background-image: none; margin: 0px 0px 0.3em; overflow: hidden; padding-top: 0.5em; padding-bottom: 0.17em; border-bottom-style: none; font-size: 17px;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"editsection\" style=\"-webkit-user-select: none; float: right; font-size: 13px; font-weight: normal; margin-left: 5px;\">[<a href=\"http://en.wikipedia.org/w/index.php?title=Policy&amp;action=edit&amp;section=8\" style=\"text-decoration: none; color: rgb(11, 0, 128); background-image: none;\" title=\"Edit section: Regulatory policies\">edit</a>]</span></span></h3>\r\n	<div style=\"direction: ltr;\">\r\n		<span class=\"mw-headline\" id=\"Regulatory_policies\"><span class=\"mw-headline\" id=\"Regulatory_policies\">Regulatory policies</span></span></div>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n'),(45,'What are you looking for?',17,1,'Search textbox text',NULL,'What are you looking for?','2013-07-31 16:20:10',0,'מה אתה מחפש?','What are you looking for?'),(46,'Search',17,1,'search button',NULL,'Search','2013-07-31 16:20:10',0,'חפש','Search'),(48,'All News',17,1,'show news articles button',NULL,'All News','2013-07-31 16:20:10',0,'כל החדשות','All News'),(50,'All Events',17,1,'show events articles button',NULL,'All Events','2013-07-31 16:20:10',0,'כל האירועים','All Events'),(52,'All Articles',17,1,'show articles button',NULL,'All Articles','2013-07-31 16:20:10',0,'כל המאמרים','All Articles'),(55,'I Need to E-Mail Support',17,1,'open contact page',NULL,'I Need to E-Mail Support','2013-07-31 16:20:10',0,'אני צריך עזרה במייל','I Need to E-Mail Support'),(56,'I Have a Suggetion',17,1,'open contact page',NULL,'I Have a Suggetion','2013-07-31 16:20:10',0,'יש לי עצה','I Have a Suggetion'),(57,'< Back',17,1,'back to previous page',NULL,'< Back','2013-07-18 11:00:47',0,'< חזור','< Back'),(58,'results found for',17,1,'on blog search ,header before results',NULL,'results found for','2013-07-18 11:00:47',0,'תוצאות נמצאו עבור','results found for'),(59,'< Back',18,1,'Back Button - Text',NULL,'< Back','2013-06-13 15:08:29',0,'< חזור','< Back'),(60,'I Need to E-Mail Support',18,1,'Email support Link - Text',NULL,'I Need to E-Mail Support','2013-07-28 10:06:58',0,'אני צריך לשלוח מייל עזרה','I Need to E-Mail Support'),(61,'I Have a Suggetion',18,1,'Suggestion Link - Text',NULL,'I Have a Suggetion','2013-07-28 10:06:58',0,'יש לי הצעה','I Have a Suggetion'),(62,'results found for',18,1,'Help Page - Results Page - Result\'s Amount Header',NULL,'results found for','2013-06-02 17:49:06',0,'נמצאו תוצאות עבור','results found for'),(64,'Feel free to ask for supp',18,3,'',NULL,'Feel free to ask for support, or suggest us whats in your head by our several support ways:','2012-11-04 12:38:53',0,'<div>\r\n	תרגיש חופשי לשאול או לייעץ לנו בכל נושא שעולה לראשך</div>\r\n','Feel free to ask for support, or suggest us whats in your head by our several support ways:'),(66,'its free',19,1,'register page- Header chat bubble \"its free\" text',NULL,'its free!','2013-08-05 14:55:45',0,'זה בחינם','its free!'),(67,'login with',19,1,NULL,NULL,'login with','2013-01-03 14:43:16',0,'התחבר עם','login with'),(68,'Please fill the form',19,3,'Registration page - header long text above form',NULL,'<div style=\"text-align: left; \">\r\n	<span style=\"font-size:18px;\">&nbsp;Please fill the form below to complete registration,</span></div>\r\n<div style=\"text-align: left; \">\r\n	and you&rsquo;ll be able to start spinning today!</div>\r\n<div style=\"text-align: left; \">\r\n	&nbsp;</div>\r\n','2013-08-05 14:55:45',0,'<div style=\"text-align: right; \">\r\n	<span style=\"font-size:18px;\">&nbsp;בבקשה מלא את הטופס למטה והשלם הרשמה ,</span><br />\r\n	ותוכל להתחיל להסתובב היום!</div>\r\n','<div style=\"text-align: left; \">\r\n	<span style=\"font-size:18px;\">&nbsp;Please fill the form below to complete registration,</span></div>\r\n<div style=\"text-align: left; \">\r\n	and you&rsquo;ll be able to start spinning today!</div>\r\n<div style=\"text-align: left; \">\r\n	&nbsp;</div>\r\n'),(69,'Spin me in',19,1,'Register page - spin me in button - Text',NULL,'Spin me in','2013-08-05 14:55:44',0,'סובב אותי','Spin me in'),(70,'Welcome David',19,1,'enter [[name]] for user name',NULL,'Welcome [[name]]!','2013-08-05 14:56:07',2,'ברוך הבא [[name]]!','Welcome [[name]]!'),(72,'Spin into the lobby!',19,1,'Register page 2 - spin into the lobby button - Text',NULL,'Spin into the lobby!','2013-08-05 14:56:07',2,'הסתובב לתוך הלובי','Spin into the lobby!'),(73,'help',19,1,NULL,NULL,'help','2013-04-11 14:45:56',2,'עזרה','help'),(74,'help?',20,1,NULL,NULL,'help?','2012-12-03 13:12:24',0,'עזרה?','help?'),(75,'close',20,1,NULL,NULL,'close','2013-08-06 12:03:06',0,'סגור','close'),(76,'Oopps! your account',20,3,'Account not verified yet window - header & text, <a target=\"blank\" href=\"../registermsg.aspx?status=2\" >view page </a>',NULL,'<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px; \">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle; \">\r\n				<span style=\"font-size:14px;\"><strong>Oopps! your account is not verfied yet.</strong></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle; \">\r\n				Confirm you E-Mail address to access all of Spindate&rsquo;s features.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-07-31 14:00:27',2,'<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px; \">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle; \">\r\n				<span style=\"font-size:14px;\"><strong>אופס. החשבון שלך עדיין לא אושר</strong></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle; \">\r\n				אשר את החשבון ,והשתמש במערכת</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div>\r\n	&nbsp;</div>\r\n','<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px; \">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle; \">\r\n				<span style=\"font-size:14px;\"><strong>Oopps! your account is not verfied yet.</strong></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle; \">\r\n				Confirm you E-Mail address to access all of Spindate&rsquo;s features.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div>\r\n	&nbsp;</div>\r\n'),(77,'Resend Mail',20,1,'Account not verified yet window - resend mail button - Text, <a target=\"blank\" href=\"../registermsg.aspx?status=2\" >view page </a>',NULL,'Resend Mail','2013-07-31 14:00:27',2,'שלח מייל שוב','Resend Mail'),(78,'Edit E-Mail Address',20,1,'Account not verified yet window - edit email button - Text, <a target=\"blank\" href=\"../registermsg.aspx?status=2\" >view page </a>',NULL,'Edit E-Mail Address','2013-07-31 14:00:27',2,'ערוך כתובת מייל','Edit E-Mail Address'),(79,'Confirm',20,1,' <a target=\"blank\" href=\"../registermsg.aspx?status=1\" >view page </a>',NULL,'Confirm','2013-06-13 16:27:00',1,'אשר','Confirm'),(80,'Cancel',20,1,'<a target=\"blank\" href=\"../registermsg.aspx?status=1\" >view page </a>',NULL,'Cancel','2013-07-03 13:06:06',1,'בטל','Cancel'),(81,'A confirmation E-Mai',20,3,'<a target=\"blank\" href=\"../registermsg.aspx?status=3\" >view page </a>',NULL,'<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px; \">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align: middle; text-align: center; \">\r\n				<span style=\"font-size:14px;\"><strong>A confirmation E-Mail was sent to:</strong></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align: middle; text-align: center; \">\r\n				[[email]]</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-06-13 16:44:07',3,'<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px; \">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align: middle; text-align: center; \">\r\n				<span style=\"font-size:14px;\"><strong>מיל אישרוור נשלח אליך למייל</strong></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align: middle; text-align: center; \">\r\n				[[email]]</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div>\r\n	&nbsp;</div>\r\n','<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px; \">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align: middle; text-align: center; \">\r\n				<span style=\"font-size:14px;\"><strong>A confirmation E-Mail was sent to:</strong></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align: middle; text-align: center; \">\r\n				[[email]]</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div>\r\n	&nbsp;</div>\r\n'),(82,'Welcome, [[name]]',21,1,'main page - mini banner left side - \"welcome message\" - [[name]] will be replaced automaticly with the real user.',NULL,'Welcome, [[name]]','2013-08-07 14:34:05',0,'ברוך הבא, [[name]]','Welcome, [[name]]'),(83,'Edit My Profile',21,1,NULL,NULL,'Edit My Profile','2013-08-07 14:34:05',0,'ערוך את הפרופיל','Edit My Profile'),(84,'Change My Picture',21,1,NULL,NULL,'Change My Picture','2013-08-07 14:34:05',0,'ערוך את התמונה שלי','Change My Picture'),(85,'regular user',21,3,NULL,NULL,'<div style=\"text-align: left; \">\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 280px; \">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<span style=\"font-size:18px;\"><span style=\"font-family:lightroborto;\">You are a</span> <span style=\"font-family:roboto;\"><span style=\"color: rgb(61, 100, 143);\">Regular Spinner</span></span></span></td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<div>\r\n						<br />\r\n						<span style=\"font-size:11px;\">become a<span style=\"color: rgb(152, 107, 0); \"> <em>Premium Spinner</em></span> by upgrading your account</span></div>\r\n					<div>\r\n						<span style=\"font-size:11px;\">and enjoy the unlimited features of Spindate!</span></div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-08-07 14:34:05',0,'<div style=\"text-align: left; \">\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 280px; \">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<span style=\"font-size:18px;\">You are a <span style=\"color:#3d648f;\">Regular Spinner</span></span></td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<div>\r\n						<br />\r\n						<span style=\"font-size:11px;\">become a<span style=\"color: rgb(152, 107, 0); \"> Premium Spinner</span> by upgrading your account</span></div>\r\n					<div>\r\n						<span style=\"font-size:11px;\">and enjoy the unlimited features of Spindate!</span></div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<br />\r\n','<div style=\"text-align: left; \">\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 280px; \">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<span style=\"font-size:18px;\"><span style=\"font-family:lightroborto;\">You are a</span> <span style=\"font-family:roboto;\"><span style=\"color: rgb(61, 100, 143);\">Regular Spinner</span></span></span></td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<div>\r\n						<br />\r\n						<span style=\"font-size:11px;\">become a<span style=\"color: rgb(152, 107, 0); \"> <em>Premium Spinner</em></span> by upgrading your account</span></div>\r\n					<div>\r\n						<span style=\"font-size:11px;\">and enjoy the unlimited features of Spindate!</span></div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n'),(86,'Spin Rooms',22,1,NULL,NULL,'Spin Rooms','2013-08-07 14:34:05',0,'חדרי ספין','Spin Rooms'),(87,'Blind Rooms',22,1,NULL,NULL,'Blind Rooms','2013-08-07 14:34:05',0,'חדרי פגישה עיוורת','Blind Rooms'),(88,'online',22,1,NULL,NULL,'Online','2013-08-07 14:34:05',0,'מחובר','online'),(89,'New Room',22,1,NULL,NULL,'New Room','2013-08-07 14:34:47',0,'חדר חדש','New Room'),(90,'\'\'s room',22,1,NULL,NULL,'\'s room','2013-08-07 14:35:52',0,' החדר של','\'\'s room'),(91,'Age:',22,1,NULL,NULL,'Age:','2013-08-07 14:34:47',0,'גיל:','Age:'),(92,'From:',22,1,NULL,NULL,'From:','2013-08-07 14:34:47',0,'מיקום:','From:'),(93,'help?',23,1,NULL,NULL,'help?','2013-03-18 14:59:43',1,'עזרה?','help?'),(95,'I’m looking for:',23,1,'Participents Amount Selector Text - left side near the heart icon, <a target=\"blank\" href=\"../createroom.aspx?status=1\" >View page</a>',NULL,' I would like to date:','2013-08-07 14:35:46',1,'אני רוצה לצאת עם:',' I would like to date:'),(96,'Langauge:',22,1,NULL,NULL,'Langauge:','2013-08-07 14:35:52',0,'שפה:','Langauge:'),(97,'Join',22,1,NULL,NULL,'Join','2013-08-07 13:46:06',0,'הצטרף','Join'),(103,'Back to Inbox',24,1,'Inbox message window - Back to inbox button - Text',NULL,'Back to Inbox','2013-08-06 16:03:53',0,'חזור לתיבת מייל','Back to Inbox'),(104,'Mark as Unread',24,1,'Inbox Actions - Mark as Unread button - Text',NULL,'Mark as Unread','2013-08-07 13:44:18',0,'סמן כלא נקרא','Mark as Unread'),(105,'Mark as Read',24,1,'Inbox Actions - Mark as Read button - Text',NULL,'Mark as Read','2013-08-07 13:44:18',0,'סמן כנקרא','Mark as Read'),(106,'Delete Message',24,1,'Inbox Actions - Delete message button - Text',NULL,'Delete Message','2013-08-07 13:44:19',0,'מחוק הודעה','Delete Message'),(107,'Block Member',24,1,'Inbox Actions - Black Member button - Text',NULL,'Block Member','2013-08-07 13:44:19',0,'חסום משתמש','Block Member'),(108,'Report Abuse',24,1,'Inbox Actions - Report Abuse button - Text',NULL,'Report Abuse','2013-08-07 13:44:19',0,'דווח על משתמש','Report Abuse'),(109,'messages',24,1,'Inbox Header - Messages amount (IE. x MESSAGES,y unread) refer to messages Text',NULL,'messages','2013-08-07 13:44:18',0,'הודעות','messages'),(110,'unread',24,1,'Inbox Header - Messages amount (IE. x messages ,y UNREAD)refer to UNREAD Text',NULL,'unread','2013-08-07 13:44:18',0,'לא נקרא','unread'),(111,'days ago',24,1,'Inbox Messages info- mini message - how many days ago the message recived - Text (days ago)',NULL,'days ago','2013-08-07 13:44:18',0,'ימים עברו','days ago'),(112,'months ago',24,1,'Inbox Messages info - mini message - how many months ago the message recived - Text (months ago)',NULL,'months ago','2013-08-05 15:36:53',0,'חודשים עברו','months ago'),(113,'Conversation with [[name]',24,1,'Inbox - Message window - Conversation with [[name]] ([[name]] will be replaced automatically with the real User name',NULL,'Conversation with [[name]]','2012-11-07 11:37:55',0,'שיחה עם [[name]]','Conversation with [[name]]'),(114,'Selected:',24,1,'Inbox massages list - Selected counter - Text',NULL,'Selected:','2013-08-07 14:36:55',0,'נבחר:','Selected:'),(115,'All',25,1,'[time menu]',NULL,'All','2013-08-07 14:36:54',0,'הכל','All'),(116,'Today',25,1,'[time menu]',NULL,'Today','2013-08-07 14:36:54',0,'היום','Today'),(117,'This Week',25,1,'[time menu]',NULL,'This Week','2013-08-07 14:36:54',0,'השבוע הזה','This Week'),(118,'This Month',25,1,'[time menu]',NULL,'This Month','2013-08-07 14:36:54',0,'החודש הזה','This Month'),(119,'help?',25,1,NULL,NULL,'help?','2013-03-13 16:51:29',0,'עזרה?','help?'),(120,'Delete',25,1,NULL,NULL,'Delete','2013-08-07 14:36:54',0,'מחק','Delete'),(121,'Block Member',25,1,NULL,NULL,'Block Member','2013-08-07 14:36:55',0,'חסום משתמש','Block Member'),(122,'Report Abuse',25,1,NULL,NULL,'Report Abuse','2013-08-07 14:36:55',0,'דווח על משתמש','Report Abuse'),(123,'[[name]] invited you to a',25,1,'Insert [[name]] in the place of the member name sopposed to be.',NULL,'[[name]] invited you to a video chat .','2012-11-07 15:27:07',0,'[[name]] הזמין אותך לשיחה .','[[name]] invited you to a video chat .'),(124,'She waiting for your resp',25,1,NULL,NULL,'She waiting for your response...','2012-11-07 15:02:31',0,'היא מחכה לתגובתך...','She waiting for your response...'),(125,'he waiting for your respo',25,1,NULL,NULL,'he waiting for your response...','2012-11-07 15:27:07',0,'הוא מחכה לתגובתך...','he waiting for your response...'),(126,'[[name]] invited you to h',25,1,'Insert [[name]] in the place of the member name sopposed to be.',NULL,'[[name]] invited you to her Blindate Room','2012-11-07 15:47:40',0,'[[name]] הזמין אותך לחדר פגישה עיוורת','[[name]] invited you to her Blindate Room'),(127,'[[name]] invited you to a video chat .',25,1,'Insert [[name]] in the place of the member name sopposed to be.',NULL,'[[name]] invited you to a video chat .','2013-08-07 14:36:54',0,'[[name]] הזמין אותך לשיחת וידיאו .','[[name]] invited you to a video chat .'),(128,'he waiting for your response...',25,1,NULL,NULL,'he waiting for your response...','2013-08-07 14:36:54',0,'מחכים לעידכון...','he waiting for your response...'),(129,'[[name]] invited you to a chat .',25,1,'Insert [[name]] in the place of the member name sopposed to be.',NULL,'[[name]] invited you to a chat .','2013-08-07 14:36:54',0,'[[name]] מזמין אותך לדייט .','[[name]] invited you to a chat .'),(130,'[[name]] invited you to her    SpinRoom/Blindate R',25,1,'Insert [[name]] in the place of the member name sopposed to be.',NULL,'[[name]] invited you to a    SpinRoom ','2013-08-07 14:36:54',0,'[[name]] מזמינים אותך לספין דייט ','[[name]] invited you to a    SpinRoom '),(131,'[[name]] has added you as a favourite.',25,1,'Insert [[name]] in the place of the member name sopposed to be.',NULL,'[[name]] has added you as a favourite.','2013-08-07 14:36:54',0,'[[name]] הוסיף אותך למחוברים.','[[name]] has added you as a favourite.'),(132,'hours ago',24,1,'Inbox Messages info - mini message - how many hours ago the message recived - Text (months ago)',NULL,'hours ago','2013-08-07 13:44:22',0,'שעות עברו:','hours ago'),(133,'You recived a gift from [[name]]',21,1,'[[name]] will be replaced automaticly with the real user.',NULL,'You recived a gift from [[name]]','2013-02-12 13:55:37',0,'You recived a gift from [[name]]','You recived a gift from [[name]]'),(134,'Are you sure you want to Log Out?',20,3,'logout window - Content, <a target=\"blank\" href=\"../registermsg.aspx?status=7\" >view page </a>',NULL,'<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px; \">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle; \">\r\n				<div>\r\n					Are you sure you want to <strong>Log Out</strong>?</div>\r\n				<div>\r\n					&nbsp;</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-08-06 12:03:06',7,'<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px; \">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle; \">\r\n				אתה בטוח שאתה רוצה להתנתק?</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<br />\r\n','<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px; \">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle; \">\r\n				<div>\r\n					Are you sure you want to <strong>Log Out</strong>?</div>\r\n				<div>\r\n					&nbsp;</div>\r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div>\r\n	&nbsp;</div>\r\n'),(135,'No',20,1,'logout window - no button - Text, <a target=\"blank\" href=\"../registermsg.aspx?status=7\" >view page </a>',NULL,'No','2013-08-06 12:03:06',7,'לא','No'),(136,'Yes',20,1,'logout window - yes button - Text, <a target=\"blank\" href=\"../registermsg.aspx?status=7\" >view page </a>',NULL,'Yes','2013-08-06 12:03:06',7,'כן','Yes'),(137,'Confirm the term of servise',2,1,NULL,NULL,'Confirm the term of servise','2013-08-06 12:03:08',0,'אשר את התנאים','Confirm the term of servise'),(138,'Start spinning ‘till you fall',2,3,NULL,NULL,'<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px; \">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle; \">\r\n				<span style=\"font-family:mediumroborto;\"><span style=\"font-size: 24px;\">The ultimate dating experience&nbsp;</span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: bottom; height: 35px;\">\r\n				<span style=\"font-size:26px;\">is one spin away - Spindate</span></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-08-06 12:03:10',0,'<br />\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px; \">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle; \">\r\n				התחל להסתובב עד</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle; \">\r\n				<span style=\"font-size:28px;\">שתמצא אהבה</span></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<br />\r\n','<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px; \">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle; \">\r\n				<span style=\"font-family:mediumroborto;\"><span style=\"font-size: 24px;\">The ultimate dating experience&nbsp;</span></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: bottom; height: 35px;\">\r\n				<span style=\"font-size:26px;\">is one spin away - Spindate</span></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div>\r\n	&nbsp;</div>\r\n'),(139,'help?',26,1,NULL,NULL,'help?','2012-12-03 13:34:17',0,'עזרה?','help?'),(140,'Account Settings',26,1,'Account settings - Title Text',NULL,'Account Settings','2013-08-07 11:49:08',0,'הגדרות חשבון','Account Settings'),(141,'Account Info',26,1,'Account settings - Tabs - account info - Text',NULL,'Account Info','2013-08-07 11:49:10',0,'מידע חשבון','Account Info'),(142,'Save changes',26,1,'Account settings- save changes button - Text',NULL,'Save changes','2013-08-07 11:49:10',0,'שמור שינויים','Save changes'),(143,'General Info',26,1,'Account settings - accont info - General info header text',NULL,'General Info','2013-08-07 11:49:08',0,'מידע כללי','General Info'),(144,'First Name:',26,1,'Account settings - account info - first name - Text',NULL,'First Name:','2013-08-07 11:49:06',0,'שם פרטי:','First Name:'),(145,'Last Name:',26,1,'Account settings - account info - last name - Text',NULL,'Last Name:','2013-08-07 11:49:06',0,'שם משפחה:','Last Name:'),(146,'Birthday:',26,1,'Account settings - account info - birthday - Text',NULL,'Birthday:','2013-08-07 11:49:08',0,'יום הולדת:','Birthday:'),(147,'Gender:',26,1,'Account settings - account info - gneder - Text',NULL,'Gender:','2013-08-07 11:49:09',0,'מין:','Gender:'),(148,'looking for',26,1,'Account settings - account info - gneder - looking for - Text',NULL,'looking for','2013-08-07 11:49:09',0,'מחפש','looking for'),(149,'About Me',26,1,'Account settings - account info - about me - header  Text',NULL,'About Me','2013-08-07 11:49:09',0,'עליי','About Me'),(150,'My Status:',26,1,NULL,NULL,'My Status:','2012-12-03 13:39:25',0,'המצב שלי:','My Status:'),(151,'Sexuality:',26,1,'account settings - account info - Sexuality - Text',NULL,'Sexuality:','2013-08-07 11:49:07',0,'מניות','Sexuality:'),(152,'Cancel',26,1,'Account settings - Cancel button - Text',NULL,'Cancel','2013-08-07 11:49:10',0,'בטל','Cancel'),(153,'Email Notifications',26,1,'Account settings - Tabs - Email notifications - Text',NULL,'Email Notifications','2013-08-07 11:49:09',0,'התראות מייל','Email Notifications'),(154,'Choose which email notifications you would like to',26,1,'Account settings - Email settings -  1st text line - Text',NULL,'Choose which email notifications you would like to recieve.','2013-08-07 11:49:09',0,'בחר אילו התראות מייל אתה מעוניין לקבל','Choose which email notifications you would like to recieve.'),(155,'To help you have the best experience,',26,3,'Account settings - Email settings - 2nd text line - Text',NULL,'<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 620px;\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<div style=\"text-align: left; \">\r\n					To help you have the best experience, we&rsquo;ll send you emaill notifications on behalf of members who contact you.</div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: left; \">\r\n				We&rsquo;ll also deliver you lastest matches and give you free tips on how to meet someone special.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n','2013-08-07 11:49:09',0,'<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 600px; \">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: right;\">\r\n				<div >\r\n					&nbsp;לעזור לך את החוויה הטובה ביותר, ואנו שולחים לך הודעות emaill מטעם חברים שאיתך קשר .</div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: right;\">\r\n				אנחנו גם מספקים לך גפרורי האחרונה ולתת לך עצות בחינם על איך לפגוש מישהו מיוחד.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div>\r\n	&nbsp;</div>\r\n','<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 620px;\">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<div style=\"text-align: left; \">\r\n					To help you have the best experience, we&rsquo;ll send you emaill notifications on behalf of members who contact you.</div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: left; \">\r\n				We&rsquo;ll also deliver you lastest matches and give you free tips on how to meet someone special.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n'),(156,'Send me email notifications:',26,1,'Account settings - Email settings -  3rd text line - Text',NULL,'Send me email notifications:','2013-08-07 11:49:09',0,'שלח לי התראות מייל','Send me email notifications:'),(157,'Account Status',26,1,'Account settings - Tabs - Account Status - Text',NULL,'Account Status','2013-08-07 11:49:10',0,'מצב חשבון','Account Status'),(158,'Change Password',26,1,'Account settings - Tabs - Change Password - Text',NULL,'Change Password','2013-08-07 11:49:10',0,'שנה סיסמה','Change Password'),(159,'Blocked Members',26,1,'Account settings - Tabs - Blocked Members - Text',NULL,'Blocked Members','2013-08-07 11:49:10',0,'משתמשים חסומים','Blocked Members'),(160,'When a member send me a message',26,1,'Account settings - Email settings - 1st option - Text',NULL,'When a member send me a message','2013-08-07 11:49:05',0,'כאשר חבר שולח לי הודעה','When a member send me a message'),(161,'When a member favourites me',26,1,'Account settings - Email settings -  2nd option - Text',NULL,'When a member favourites me','2013-08-07 11:49:05',0,'כאשר חבר מוסיף אותך למעודפים','When a member favourites me'),(162,'When Spindate offers new features',26,1,'Account settings - Email settings -  3rd option - Text',NULL,'When Spindate offers new features','2013-08-07 11:49:06',0,'כאשר ספינדייט מציע דבר חדש','When Spindate offers new features'),(163,'You have a Free Basic membership.',26,3,'Account settings - Account status - current plan viewer - basic plan content',NULL,'You have a <strong>Free Basic </strong>membership.','2013-08-07 11:49:09',0,'<div>\r\n	.שי לך <strong>חשבון בסיסי</strong></div>\r\n','You have a <strong>Free Basic </strong>membership.'),(164,'Payment history',26,1,NULL,NULL,'Payment history','2013-02-25 12:09:38',0,'היסטוריית תשלומים','Payment history'),(165,'Members who subscribe get Unlimited Features. Subs',26,3,'Account settings - Account status - subscribe now - Text before subscire button',NULL,'<div style=\"text-align: left; \">\r\n	<strong>Members who subscribe get Unlimited Features</strong>. Subscribe now and get:</div>\r\n','2013-08-07 11:49:05',0,'<div>\r\n	<b>חברים שנרשמים מקבלים עכשיו</b>:</div>\r\n','<div style=\"text-align: left; \">\r\n	<strong>Members who subscribe get Unlimited Features</strong>. Subscribe now and get:</div>\r\n'),(166,'Video Technology',26,1,'Account settings - acocunt status - video cube - header',NULL,'Video Technology','2013-08-07 11:49:09',0,'טכנולוגית וידיאו','Video Technology'),(167,'Spindate specialized in video technology',26,1,'Account settings - acocunt status - video cube - content',NULL,'Spindate specialized in video technology','2013-08-07 11:49:09',0,'ספינדייט מתמחה בטכנולוגיית וידיאו','Spindate specialized in video technology'),(168,'Unlimited Dates',26,1,'Account settings - acocunt status - unlimited dates cube - header',NULL,'Unlimited Dates','2013-08-07 11:49:10',0,'פגישות בלי הגבלה','Unlimited Dates'),(169,'Get unlimited dates and make deeper connections',26,1,'Account settings - acocunt status - unlimited dates cube - Content',NULL,'Get unlimited dates and make deeper connections','2013-08-07 11:49:10',0,'קבל פגישות בלי הגבלה וצור קשרים עמוקים','Get unlimited dates and make deeper connections'),(170,'Meet People Fast',26,1,'Account settings - acocunt status - meet people fast cube - header',NULL,'Meet People Fast','2013-08-07 11:49:10',0,'פגוש אנשים מהר','Meet People Fast'),(171,'Subscribe Now',26,1,'Account settings - account status - subscribe now button - Text',NULL,'Subscribe Now','2012-12-24 16:09:59',0,'הרשם עכשיו','Subscribe Now'),(172,'Subcribe',26,1,'account settings - acount status - subscribe button - text',NULL,'Subcribe','2013-08-07 11:49:09',0,'הרשם','Subcribe'),(173,'Extend your account now!',21,1,NULL,NULL,'Extend your account now!','2012-11-11 11:26:40',0,'הרחב את החשבון עכשיו!','Extend your account now!'),(174,'You have a Premium Membership membership.',26,3,'Account settings - Account status - current plan viewer - Premium plan content',NULL,'You have a Premium Membership membership.','2013-03-20 16:31:46',0,'You have a Premium Membership membership.','You have a Premium Membership membership.'),(175,'Extend',26,1,NULL,NULL,'Extend','2013-03-20 16:31:46',0,'הרחב','Extend'),(176,'Payment Date',26,1,NULL,NULL,'Payment Date','2013-02-25 12:08:42',0,'תאריך תשלום','Payment Date'),(177,'Total Payment',26,1,NULL,NULL,'Total Payment','2013-02-25 12:08:42',0,'סכום תשלום','Total Payment'),(178,'Premium Period',26,1,NULL,NULL,'Premium Period','2013-02-25 12:08:42',0,'תקופת פרימיום','Premium Period'),(179,'close',26,1,NULL,NULL,'close','2013-02-25 12:09:38',0,'סגור','close'),(180,'Change the password which you use to log in to Spi',26,1,NULL,NULL,'Change the password which you use to log in to Spindate','2013-08-07 11:49:10',0,'שנה את הסיסמה בה אתה משתמש להכנס','Change the password which you use to log in to Spindate'),(181,',Blocked',26,1,NULL,NULL,'Blocked:','2013-08-07 11:49:08',0,',חסום','Blocked:'),(182,'Days ago',26,1,NULL,NULL,'Days ago','2013-08-07 11:49:08',0,'ימים עברו','Days ago'),(183,'Remove Block',26,1,NULL,NULL,'Unblock','2013-08-07 11:49:08',0,'הסר חסימה','Unblock'),(184,'Block options changed',26,1,NULL,NULL,'Block options changed','2013-08-07 11:49:08',0,'הגדרות חסימה השתנו','Block options changed'),(185,'Age:',26,1,NULL,NULL,'Age:','2013-08-07 11:49:08',0,'גיל:','Age:'),(186,'From:',26,1,NULL,NULL,'From:','2013-08-07 11:49:08',0,'מקום:','From:'),(187,'Block Removed',26,1,NULL,NULL,'Block Removed','2013-08-06 15:57:59',0,'חסימה הוסרה','Block Removed'),(188,'online',27,1,'Mini Window Info - Online Text',NULL,'online','2013-08-07 11:33:15',0,'מחובר','online'),(189,'Age:',27,1,'Mini Window Info - Age Header',NULL,'Age:','2013-08-07 13:37:44',0,'גיל:','Age:'),(190,'From:',27,1,'Mini Window Info - Location Flag Header',NULL,'From:','2013-08-07 13:37:44',0,'מקום:','From:'),(191,'Video',27,1,'Mini Window Info - Video button - Text',NULL,'Video','2013-08-07 14:34:45',0,'וידיאו','Video'),(192,'Chat',27,1,'Mini Window Info - Chat button - Text',NULL,'Chat','2013-08-07 14:34:45',0,'צ\'אט','Chat'),(193,'Message',27,1,'Mini Window Info - More - Send message Text',NULL,'Message','2013-08-07 13:37:45',0,'הודעה','Message'),(194,'Send Message to [[name]]',27,1,'Quick message window - Title ( [Name] will be Replaced with Target Username)',NULL,'Send Message to [[name]]','2013-04-24 17:39:36',0,'של הודעה אל [[name]]','Send Message to [[name]]'),(195,'Write your Message...',27,1,'Quick message window - Message Textbox - text INSIDE when box is empty',NULL,'Write your Message...','2013-04-24 17:39:36',0,'כתוב את הודעתך...','Write your Message...'),(196,'Subject ...',27,1,'Quick message window - Subject Textbox - Text INSIDE when box is empty',NULL,'Subject ...','2013-04-24 17:39:36',0,'נושא ...','Subject ...'),(197,'Cancel',27,1,'Quick message window - Cancel button - Text',NULL,'Cancel','2013-04-24 17:39:36',0,'בטל','Cancel'),(198,'Send',27,1,'Quick message window - Send button - Text',NULL,'Send','2013-04-24 17:39:36',0,'שלח','Send'),(199,'help?',27,1,NULL,NULL,'help?','2012-12-26 15:49:37',0,'עזרה?','help?'),(200,'Subject is Required',27,1,'Quick message window - Subject Validator - Text',NULL,'Subject is Required','2013-04-24 17:39:36',0,'הכנס נושא','Subject is Required'),(201,'Content is Required',27,1,'Quick message window - Content Validator - Text',NULL,'Content is Required','2013-04-24 17:39:36',0,'הכנס תוכן','Content is Required'),(202,'Gift',27,1,'Mini Window Info - More - Send Gift text',NULL,'Gift','2013-08-07 13:37:45',0,'מתנה','Gift'),(203,'Surprise [[name]] with a gift!',28,1,'replace name with [[name]]',NULL,'Surprise [[name]] with a gift!','2013-08-06 11:45:55',0,'הפתע את [[name]] עם מתנה!','Surprise [[name]] with a gift!'),(204,'Close',28,1,'Close button - text when hovering',NULL,'Close','2013-08-06 11:45:55',0,'סגור','Close'),(205,'help?',28,1,NULL,NULL,'help?','2013-04-25 10:50:48',0,'עזרה?','help?'),(206,'Add a lovely message to your gift:',28,1,'Add a Message to your gift - Header Text',NULL,'Add a lovely message to your gift:','2013-08-06 11:45:55',0,'הוסף הודעה למתנה:','Add a lovely message to your gift:'),(207,'Write your message...',28,1,'Gift Message text box - Text inside when user did not write anything',NULL,'Write your message...','2013-08-06 11:45:55',0,'כתוב את ההודעה...','Write your message...'),(208,'Cancel',28,1,'Gift Message window - Cencel button - Text',NULL,'Cancel','2013-08-06 11:45:55',0,'בטל','Cancel'),(209,'Send',28,1,'Send gift window - Button - Text (without the Paypal)',NULL,'Send and continue to ','2013-08-06 11:45:55',0,'שלח מתנה דרך ','Send and continue to '),(210,'Hide from rooms',27,1,'Mini Window Info - More - Hide from rooms - Text',NULL,'Hide from rooms','2013-08-07 13:37:45',0,'הסתר מחדרים','Hide from rooms'),(211,'Unfavourite',27,1,'Mini Window Info - More - Unfavorite Text',NULL,'Unfavourite','2013-08-07 13:37:45',0,'הסר ממועדפים','Unfavourite'),(212,'Report',27,1,'Mini Window Info - More - Report User - Text',NULL,'Report','2013-08-07 13:37:45',0,'דוח','Report'),(213,'You have recived a gift from [[name]]!',28,1,'Text to see when you recived a Gift - ([[name]] will show the user who sent the gift)',NULL,'You have recived a gift from [[name]]!','2013-05-29 10:55:30',0,'יש לך מתנה מ [[name]]!','You have recived a gift from [[name]]!'),(214,'[[name]]\'\'s Message:',28,1,'replace name with [[name]]',NULL,'[[name]]\'s Message:','2013-04-25 11:42:32',0,'ההודעה של [[name]]:','[[name]]\'s Message:'),(215,'>View Profile',28,1,'',NULL,'>View Profile','2012-11-13 14:27:06',0,'>צפה בפרופיל','>View Profile'),(216,'View Profile',28,1,'Gift recieved window - View profile button - Text',NULL,'View Profile','2013-05-29 10:55:30',0,'צפה בפרופיל','View Profile'),(217,'Video',28,1,'Gift recieved window - Video button - Text',NULL,'Video','2013-05-29 10:55:30',0,'וידיאו','Video'),(218,'Chat',28,1,'Gift recieved window - Chat button - Text',NULL,'Chat','2013-05-29 10:55:30',0,'צאט','Chat'),(219,'Message',28,1,'Gift recieved window - Send message button - Text',NULL,'Message','2013-05-29 10:55:30',0,'הודעה','Message'),(220,'online',29,1,'online status - Text',NULL,'Online','2013-08-06 11:44:59',0,'פעיל','Online'),(221,'Age:',29,1,'MyProfile - info - age Text',NULL,'Age:','2013-08-06 11:44:59',0,'גיל:','Age:'),(222,'From:',29,1,'MyProfile - info - From Text',NULL,'From:','2013-08-06 11:44:59',0,'מקום:','From:'),(223,'Looking for:',29,1,'MyProfile - info - looking for - Text',NULL,'Looking for:','2013-08-06 11:45:00',0,'מחפש:','Looking for:'),(224,'Men',29,1,'MyProfile - search for - Men - Text',NULL,'Men','2013-08-06 11:44:59',0,'אנשים','Men'),(225,'Edit My Profile',29,1,'MyProfile - Edit my profile button - Text',NULL,'Edit My Profile','2013-08-06 11:45:00',0,'ערוך את הפרופיל שלי','Edit My Profile'),(226,'Change My Picture',29,1,'MyProfile - Change my picture button - Text',NULL,'Change My Picture','2013-08-06 11:45:00',0,'שנה את התמונה','Change My Picture'),(227,'About',29,1,'Profile page tab - About - Tab Text',NULL,'About','2013-08-06 11:45:00',0,'על','About'),(228,'History',29,1,'Profile page tab - History - Tab Text',NULL,'History','2013-08-06 11:45:00',0,'היסטוריה','History'),(229,'Appearance',29,1,NULL,NULL,'Appearance','2013-01-28 16:21:26',0,'מראה','Appearance'),(230,'Height:',29,1,'Profile window - Height - Text',NULL,'Height:','2013-08-06 11:45:00',0,'גובה:','Height:'),(231,'Body Type:',29,1,'Profile window - Bodyype- Text',NULL,'Body Type:','2012-12-04 16:01:42',0,'סוג גוף:','Body Type:'),(232,'Hair Color:',29,1,'Profile window - Heair color - Text',NULL,'Hair Color:','2012-12-04 16:01:42',0,'צבע שיער:','Hair Color:'),(233,'Eye Color:',29,1,'Profile window - Eye color - Text',NULL,'Eye Color:','2012-12-04 16:01:42',0,'צבע עניים:','Eye Color:'),(234,'Background:',29,1,NULL,NULL,'Background:','2013-01-28 16:21:26',0,'רקע:','Background:'),(235,'Langauges:',29,1,NULL,NULL,'Langauges:','2013-01-28 17:34:53',0,'שפות:','Langauges:'),(236,'My status:',29,1,NULL,NULL,'My status:','2012-12-04 16:01:42',0,'הסטאטוס שלי:','My status:'),(237,'Sexuality:',29,1,'Profile window - Sexuality - Text',NULL,'Sexuality:','2013-08-06 11:45:00',0,'מניות:','Sexuality:'),(238,'Life Style:',29,1,NULL,NULL,'Life Style:','2013-01-28 16:21:26',0,'סגנון חיים:','Life Style:'),(239,'About Me:',29,1,'Profile window - About me - header Text',NULL,'About Me:','2013-08-06 11:45:01',0,'עליי:','About Me:'),(240,'Releationship Status:',29,1,NULL,NULL,'Releationship Status:','2013-07-21 11:32:17',0,'מצב:','Releationship Status:'),(241,'View Profile',29,1,'history window - view profile button - Text',NULL,'View Profile','2013-07-21 11:32:17',0,'הצג פרופיל','View Profile'),(242,'months',29,1,'history info - month - text',NULL,'months','2013-08-06 11:45:00',0,'חודשים','months'),(243,'ago',29,1,'history info - ago - text',NULL,'ago','2013-08-06 11:45:00',0,'עברו','ago'),(244,'days',29,1,'history info - days - text',NULL,'days','2013-08-06 11:45:00',0,'ימים','days'),(245,'My Photo',30,1,'Images Page - My Images - Header Text',NULL,'My Photo','2013-08-06 11:54:58',0,'התמונות שלי','My Photo'),(246,'Profile Picture',30,1,'Images Page - Preview - Image which checked as Profile Image - Text below Image(only for the image which selected already as profile image)',NULL,'Profile Picture','2013-08-06 11:54:59',0,'תמונת פרופיל','Profile Picture'),(247,'Make Profile Picture',30,1,'Images Page - images preview window - Make profile picture button - Text',NULL,'Make Profile Picture','2013-08-06 11:54:58',0,'הגדר תמונת פרופיל','Make Profile Picture'),(248,'help?',30,1,NULL,NULL,'help?','2012-12-26 09:58:37',0,'עזרה?','help?'),(249,'of',30,1,'Images Page - images preview window -  text between Images counter 9 (IE. 1 OF 2, x OF y)',NULL,'of','2013-08-06 11:54:58',0,'מתוך','of'),(250,'Upload photo file',30,1,'Images page - Upload images button - Text',NULL,'Upload','2013-08-06 11:54:58',0,'טען תמונה','Upload'),(252,'Suprise with a gift',29,1,'Profile window - Height - Text',NULL,'Suprise with a gift','2013-08-06 11:45:35',0,'הפתע עם מתנה','Suprise with a gift'),(253,'Conversation with [[name]]',24,1,'Inbox - Message window - Conversation with [[name]] ([[name]] will be replaced automatically with the real User name',NULL,'Conversation with [[name]]','2013-08-06 16:03:53',0,'שיחה עם [[name]]','Conversation with [[name]]'),(254,'Send Message',29,1,'UserProfile page - Send Message button - Text',NULL,'Send Message','2013-08-06 11:45:35',0,'שלח הודעה','Send Message'),(255,'Write [[name]] a message...',29,1,'Insert [[name]] where you want profile name to be',NULL,'Write [[name]] a message...','2013-08-06 11:45:00',0,'כתוב ל- [[name]] הודעה...','Write [[name]] a message...'),(256,'video',29,1,'UserProfile page - Video button - Text',NULL,'Video','2013-08-06 11:45:35',0,'וידיאו','Video'),(257,'chat',29,1,'UserProfile page - Chat button - Text',NULL,'Chat','2013-08-06 11:45:35',0,'צ\'אט','Chat'),(258,'options',29,1,'UserProfile page - Options button - Text',NULL,'Options','2013-08-06 11:45:35',0,'אפשרויות','Options'),(259,'Delete form favourites',29,1,'UserProfile page - actions - delete from favorites button - Text',NULL,'Delete form favourites','2013-08-06 11:45:35',0,'מחק ממעודפים','Delete form favourites'),(260,'Block Member',29,1,'UserProfile page - actions - block member - Text',NULL,'Block Member','2013-08-06 11:45:35',0,'חסום משתמש','Block Member'),(261,'Report Abuse',29,1,'UserProfile page - actions - report abuse - Text',NULL,'Report Abuse','2013-08-06 11:45:35',0,'דווח','Report Abuse'),(262,'Create a new Spindate room',23,1,'window header,<a target=\"blank\" href=\"../createroom.aspx?status=1\" >View page</a>',NULL,'Create a new Spindate room ','2013-08-07 14:35:45',1,'צור חדר ספינדייט חדש','Create a new Spindate room '),(263,'Advenced Filter',22,1,NULL,NULL,'Refine','2013-08-07 14:34:47',0,'סינון מתקדם','Refine'),(264,'My Room',22,1,NULL,NULL,'My Room','2013-08-07 14:35:52',0,'החדר שלי','My Room'),(265,'Cancel',22,1,NULL,NULL,'Cancel','2013-08-07 14:35:52',0,'בטל','Cancel'),(266,'Edit setting',22,1,NULL,NULL,'Edit Settings','2013-08-07 14:35:52',0,'ערוך הגדרות','Edit setting'),(267,'Invite',22,1,NULL,NULL,'Invite','2013-08-07 14:35:52',0,'הזמן','Invite'),(268,'Expel',22,1,NULL,NULL,'Expel','2013-08-07 13:48:10',0,'גרש','Expel'),(269,'Spin in',2,1,NULL,NULL,'Spin in','2013-08-06 12:03:10',0,'הכנס','Spin in'),(270,'Login With Facebook',2,1,NULL,NULL,'Spin in with Facebook','2013-08-06 12:03:10',0,'כניסה בפייסבוק','Spin in with Facebook'),(271,'Email Or Password aren\'\'t currect',2,1,'validation error alert',NULL,'Email Or Password aren\'t currect','2013-08-06 12:03:08',0,'דואר אלקטרוני או סיסמה אינם תקינים','Email Or Password aren\'t currect'),(272,'I forgot my password',2,1,NULL,NULL,'I forgot my password','2013-08-06 12:03:10',0,'שכחתי סיסמה','I forgot my password'),(273,'Email Exists',2,1,'validation error alert',NULL,'Email Exists','2013-08-06 12:03:08',0,'המייל קיים','Email Exists'),(274,'Upload photo file',19,1,'Register page 1 - upload photo button - Text',NULL,'Upload photo','2013-08-05 14:55:45',0,'טען קובץ תמונה','Upload photo'),(275,'You’ve succesfully created a new profile in Spinda',19,1,'Register page 2 - line below welcome \"user\"',NULL,'You’ve succesfully created a new profile in Spindate.','2013-08-05 14:56:07',2,'יצרת בהצלחה חשבון חדש בספין דייט','You’ve succesfully created a new profile in Spindate.'),(277,'Please confirm your E-Mail.',19,3,'enter [[email]] for user email',NULL,'<div>\r\n	Please confirm your E-Mail address to access all of Spindate&rsquo;s features. A confiramation code was sent to [[email]].</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-08-05 14:56:07',2,'<div>\r\n	בבקשה אשר את המייל ותוכל להשתמש במערכת to [[email]].</div>\r\n','<div>\r\n	Please confirm your E-Mail address to access all of Spindate&rsquo;s features. A confiramation code was sent to [[email]].</div>\r\n<div>\r\n	&nbsp;</div>\r\n'),(278,'Do you still have any questions which you couldn’t',18,1,'Bottom - Still have Questions - Header',NULL,'Do you still have any questions which you couldn’t find answers?','2013-07-28 10:06:58',0,'האם עדיין יש לך שאלות ללא מענה?','Do you still have any questions which you couldn’t find answers?'),(279,'Feel free to ask for support, or suggest us whats ',18,3,'Bottom - Still have Questions - Content',NULL,'Feel free to ask for support, or suggest us whats in your head by our several support ways:','2013-07-28 10:06:58',0,'<div>\r\n	תרגיש חופשי לשאול או לייעץ לנו בכל נושא שעולה לראשך</div>\r\n','Feel free to ask for support, or suggest us whats in your head by our several support ways:'),(280,'Use your Facebook Photo',19,1,'Register page 1 - Import from facebook  button - Text',NULL,'Import from Facebook','2013-08-05 14:55:45',0,'השתמש בתמונת פייסבוק','Import from Facebook'),(281,'Resend Mail',19,1,'Register page 2 - Resend mail button - Text',NULL,'Resend Mail','2013-08-05 14:56:07',2,'שלח שוב מייל','Resend Mail'),(282,'Lost Password',20,3,'forgot password message - title  text, <a target=\"blank\"  href=\"../registermsg.aspx?status=4\" >view page </a>',NULL,'<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px; \">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align: middle; text-align: center; \">\r\n				<strong>Lost Password</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align: middle; text-align: center; \">\r\n				Gives us your username or email address</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n','2013-07-03 13:06:06',4,'<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px; \">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align: middle; text-align: center; \">\r\n				<strong>שכחת סיסמה</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align: middle; text-align: center; \">\r\n				הכנס שם משתמש או מייל</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n','<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px; \">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align: middle; text-align: center; \">\r\n				<strong>Lost Password</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align: middle; text-align: center; \">\r\n				Gives us your username or email address</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n'),(283,'Submit',20,1,'Forgot password window - submit button - Text <a target=\"blank\" href=\"../registermsg.aspx?status=4\" >view page </a>',NULL,'Submit','2013-07-03 13:06:06',4,'הכנס','Submit'),(284,'The Details where successfuly sent to the e-mail a',20,3,'mail with cradenthial was sent, <a target=\"blank\" href=\"../registermsg.aspx?status=5\" >view page </a>',NULL,'<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle;\">\r\n				<span style=\"font-size:14px;\">The Details where successfuly sent to the e-mail address</span></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<br />\r\n','2013-06-13 16:45:52',5,'<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle;\">\r\n				בפרטיים נשלחו בהצלחה לחשבון מייל שלך</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<br />\r\n','<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle;\">\r\n				The Details where successfuly sent to the e-mail address</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<br />\r\n'),(285,'The e-mail isn\'\'t exists or there is a problem in ',20,3,'mail doesnt exists content, <a target=\"blank\" href=\"../registermsg.aspx?status=6\" >view page </a>',NULL,'<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle;\">\r\n				<span style=\"font-size:14px;\">The e-mail isn&#39;t exists or there is a problem in the system</span></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-06-13 16:46:54',6,'<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle;\">\r\n				המייל לא קיים או שישנה בעיה במערכת</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div>\r\n	&nbsp;</div>\r\n','<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle;\">\r\n				The e-mail isn&#39;t exists or there is a problem in the system</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div>\r\n	&nbsp;</div>\r\n'),(286,'Sorry! This room is unavailable',23,3,'Room Unavailible - Header text, <a target=\"blank\" href=\"../createroom.aspx?status=5\" >View page</a>',NULL,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<strong>Sorry! This room is unavailable</strong></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<div>\r\n						Thats could be because one of the following reasons:</div>\r\n					<div>\r\n						- You age does not fit to the room</div>\r\n					<div>\r\n						- You age does not fit to the room owner&rsquo;s request</div>\r\n					<div>\r\n						- You age does not fit to</div>\r\n					<div>\r\n						- You age does not fit to the room owner&rsquo;s</div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-08-07 11:33:08',5,'<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px; \">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle; \">\r\n				<strong>סליחה! חדר זה ​​אינו זמין עבורך ...</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle; \">\r\n				ודא שכתובת דואר אלקטרוני כדי לגשת לכל התכונות של Spindate.</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align: middle; text-align: center; \">\r\n				<span style=\"font-size:10px;\">- אתה גיל לא מתאים לחדר</span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align: middle; text-align: center; \">\r\n				<span style=\"font-size:10px;\">- אתה מדינה אינה מתאימה לחדר</span></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div>\r\n	&nbsp;</div>\r\n','<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<strong>Sorry! This room is unavailable</strong></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<div>\r\n						Thats could be because one of the following reasons:</div>\r\n					<div>\r\n						- You age does not fit to the room</div>\r\n					<div>\r\n						- You age does not fit to the room owner&rsquo;s request</div>\r\n					<div>\r\n						- You age does not fit to</div>\r\n					<div>\r\n						- You age does not fit to the room owner&rsquo;s</div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n'),(287,'People',23,1,'People amount selector - TEXT after numbers (1,2,3 \"People\") ,<a target=\"blank\" href=\"../createroom.aspx?status=1\" >View page</a>',NULL,'People','2013-08-07 14:35:45',1,'אנשים','People'),(288,'Gender:',23,1,'Gender Selector Text ,<a target=\"blank\" href=\"../createroom.aspx?status=1\" >View page</a>',NULL,'Gender:','2013-08-07 14:35:45',1,'מין:','Gender:'),(289,'Age Range:',23,1,'Age Range Selector - Text ,<a target=\"blank\" href=\"../createroom.aspx?status=1\" >View page</a>',NULL,'Age Range:','2013-08-07 14:35:45',1,'טווח גיל:','Age Range:'),(290,'to',23,1,'Age Selector \"To\" text- located between age range selectors,  <a target=\"blank\" href=\"../createroom.aspx?status=1\" >View page</a>',NULL,'to','2013-08-07 14:35:46',1,'עבור','to'),(291,'Country:',23,1,'Country Selector - Text, <a target=\"blank\" href=\"../createroom.aspx?status=1\" >View page</a>',NULL,'Country:','2013-08-07 14:35:45',1,'ארץ:','Country:'),(292,'State:',23,1,'State Selector - Text, <a target=\"blank\" href=\"../createroom.aspx?status=1\" >View page</a>',NULL,'State:','2013-08-07 14:35:45',1,'מדינה:','State:'),(293,'+ Add more country',23,1,'Add Cuntry Link - Text, <a target=\"blank\" href=\"../createroom.aspx?status=1\" >View page</a>',NULL,'+ Add more country','2013-08-07 14:35:46',1,'+ הוסף עוד ארץ','+ Add more country'),(294,'- Remove country',23,1,'Remote Country Link - Text, <a target=\"blank\" href=\"../createroom.aspx?status=1\" >View page</a>',NULL,'- Remove country','2013-08-07 14:35:46',1,'- הסר מדינה','- Remove country'),(295,'Room Language:',23,1,'Room Language Selector - Text, <a target=\"blank\" href=\"../createroom.aspx?status=1\" >View page</a>',NULL,'Room Language:','2013-08-07 14:35:45',1,'שפת החדר:','Room Language:'),(296,'+ Add more language',23,1,'Add Language Link - Text, <a target=\"blank\" href=\"../createroom.aspx?status=1\" >View page</a>',NULL,'+ Add more language','2013-08-07 14:35:46',1,'+ הוסף עוד שפה','+ Add more language'),(297,'- Remove language',23,1,'Remove Language Link - Text<a target=\"blank\" href=\"../createroom.aspx?status=1\" >View page</a>',NULL,'- Remove language','2013-08-07 14:35:46',1,'- הסר שפה','- Remove language'),(298,'Where?:',23,1,'Room Location Selector - Text, <a target=\"blank\" href=\"../createroom.aspx?status=1\" >View page</a>',NULL,'Where?:','2013-08-07 14:35:45',1,'איפה?:','Where?:'),(299,'Technology:',23,1,'Date Technology Selector - Text, <a target=\"blank\" href=\"../createroom.aspx?status=1\" >View page</a>',NULL,'Technology:','2013-08-07 14:35:45',1,'טכנולוגיה:','Technology:'),(300,'You have created a new room!',23,3,'Room created alert - bold header, <a target=\"blank\" href=\"../createroom.aspx?status=2\" >View page</a>',NULL,'<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle;\">\r\n				<span style=\"font-size:14px;\"><strong>You have created a new room!</strong></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle; height: 25px;\">\r\n				Your Spindate room will start when it will be filled with people.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n','2013-08-07 14:35:52',2,'<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle;\">\r\n				<span style=\"font-size:14px;\"><strong>יצרת חדר חדש!</strong></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle;\">\r\n				חדר Spindate שלך יתחיל כאשר הוא יהיה מלא באנשים.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div>\r\n	&nbsp;</div>\r\n','<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle;\">\r\n				<span style=\"font-size:14px;\"><strong>You have created a new room!</strong></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle; height: 25px;\">\r\n				Your Spindate room will start when it will be filled with people.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n'),(301,'Invite people to my room',23,1,'invite people to room button - Text, <a target=\"blank\" href=\"../createroom.aspx?status=2\" >View page</a>',NULL,'Invite people to my room','2013-08-07 14:35:52',2,'הזמן אנשים לחדר שלי','Invite people to my room'),(302,'Invite people to your Spindate room',23,3,'friends vier for invitation - topic, <a target=\"blank\" href=\"../createroom.aspx?status=3\" >View page</a>',NULL,'<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle;\">\r\n				<span style=\"font-size:14px;\"><strong>Invite people to your Spindate room</strong></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle;\">\r\n				Your Spindate room will start when it will be filled with people.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n','2013-08-07 14:35:54',3,'<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle;\">\r\n				<span style=\"font-size:14px;\"><strong>להזמין אנשים לחדר Spindate</strong></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle;\">\r\n				חדר Spindate שלך יתחיל כאשר הוא יהיה מלא באנשים.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div>\r\n	&nbsp;</div>\r\n','<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle;\">\r\n				<span style=\"font-size:14px;\"><strong>Invite people to your Spindate room</strong></span></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center; vertical-align: middle;\">\r\n				Your Spindate room will start when it will be filled with people.</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n'),(303,'From:',23,1,'Friend Minibox Info - country flag Text - Text, <a target=\"blank\" href=\"../createroom.aspx?status=3\" >View page</a>',NULL,'From:','2013-08-07 14:35:54',3,'מקום:','From:'),(304,'online',23,1,'Friend Minibox Info - oneline\\offline status - Text, <a target=\"blank\" href=\"../createroom.aspx?status=3\" >View page</a>',NULL,'online','2013-08-07 14:35:54',3,'מחובר','online'),(305,'Age:',23,1,'Friend Minibox Info - Age viewer - Text, <a target=\"blank\" href=\"../createroom.aspx?status=3\" >View page</a>',NULL,'Age:','2013-08-07 14:35:58',3,'גיל:','Age:'),(306,'Invite',23,1,'Friend Minibox Info - Invite button - Text, <a target=\"blank\" href=\"../createroom.aspx?status=3\" >View page</a>',NULL,'Invite','2013-08-07 14:35:54',3,'הזמן','Invite'),(307,'Cancel',23,1,'Form bottom - Cancel button - Text, <a target=\"blank\" href=\"../createroom.aspx?status=3\" >View page</a>',NULL,'Cancel','2013-08-07 14:35:46',3,'בטל','Cancel'),(308,'Confirm',23,1,'Form Bottom - Confirm button - text, <a target=\"blank\" href=\"../createroom.aspx?status=3\" >View page</a>',NULL,'Confirm','2013-08-07 14:35:54',3,'אשר','Confirm'),(309,'Start Now',22,1,NULL,NULL,'Start Now','2013-08-07 14:35:52',0,'התחל עכשיו','Start Now'),(310,'You have joined to a Spindate',23,3,'Joined Room popup - Content Text, <a target=\"blank\" href=\"../createroom.aspx?status=11\" >View page</a>',NULL,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<span style=\"font-size:14px;\"><strong>You have joined to a Spindate room!</strong></span></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					Your Spindate room will start when it will be filled with people.</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-08-06 17:42:13',11,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<strong>שהצטרפת לחדר Spindate!</strong></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					חדר Spindate שלך יתחיל כאשר הוא יהיה מלא באנשים.</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<span style=\"font-size:14px;\"><strong>You have joined to a Spindate room!</strong></span></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					Your Spindate room will start when it will be filled with people.</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n'),(311,'Are you sure you want to start you Spindate room?',23,3,'Join Room popup - text, <a target=\"blank\" href=\"../createroom.aspx?status=6\" >View page</a>',NULL,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<span style=\"font-size:14px;\">Are you sure you want to <strong>start </strong>you Spindate room?</span></td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-08-06 17:30:41',6,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<span style=\"font-size:14px;\">האם אתה בטוח שברצונך <strong>להתחיל </strong>אותך Spindate חדר?</span></td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<span style=\"font-size:14px;\">Are you sure you want to <strong>start </strong>you Spindate room?</span></td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n'),(312,'No, cancel it',23,1,'Join Room popup - cancel button - Text <a target=\"blank\" href=\"../createroom.aspx?status=6\" >View page</a>',NULL,'No, cancel it','2013-08-06 17:30:42',6,'לא,בטל זאת','No, cancel it'),(313,'Start',22,1,NULL,NULL,'Start','2013-04-14 14:12:35',0,'התחל','Start'),(314,'Are you sure you want to cancel you Spindate room?',23,3,'Cancel spindate room popup - Content,<a target=\"blank\" href=\"../createroom.aspx?status=7\" >View page</a>',NULL,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					Are you sure you want to <strong>cancel </strong>you Spindate room?</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n','2013-08-07 14:49:29',7,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					האם אתה בטוח שברצונך <strong>לבטל </strong>את חדר Spindate?</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n','<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					Are you sure you want to <strong>cancel </strong>you Spindate room?</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n'),(316,'No',23,1,'Cancel spindate room popup - no button - Text, <a target=\"blank\" href=\"../createroom.aspx?status=7\" >View page</a>',NULL,'No','2013-08-07 14:49:29',7,'לא','No'),(317,'Yeslobby',21,1,NULL,NULL,'Yeslobby','2012-11-22 13:47:58',0,'Yeslobby','Yeslobby'),(318,'Yes',23,1,'Cancel spindate room popup - yes button - Text, <a target=\"blank\" href=\"../createroom.aspx?status=7\" >View page</a>',NULL,'Yes','2013-08-07 14:49:29',7,'כן','Yes'),(319,'minutes ago',24,1,'Inbox Messages info - mini message - how many minutes ago the message recived - Text (minutes ago)',NULL,'minutes ago','2013-08-07 14:36:54',0,'דקות עברו','minutes ago'),(320,'Do you still have any questions which you couldn’t',17,1,'text on blog bottom',NULL,'Do you still have any questions which you couldn’t find answers?','2013-07-31 16:20:10',0,'האם עדיין יש שאלות שלא נענו?','Do you still have any questions which you couldn’t find answers?'),(321,'Feel free to ask for support, or suggest us whats ',17,3,'text on blog bottom',NULL,'Feel free to ask for support, or suggest us whats in your head by our several support ways:','2013-07-31 16:20:10',0,'<div>\r\n	הרגש חופשי לבקש עזרה, או להציע רעיונות חדשים דרך דרכי העזרה שלנו:</div>\r\n','Feel free to ask for support, or suggest us whats in your head by our several support ways:'),(322,'years old.',31,1,NULL,NULL,'years old.','2013-01-21 14:26:44',0,'שנים עברו.','years old.'),(323,'From:',31,1,'Singles online - mini window - Country from - Text',NULL,'From:','2013-08-07 14:34:45',0,'מקום:','From:'),(324,'Singles Online Now',31,1,'Online Singles Counter Text',NULL,'Singles Online Now','2013-08-07 14:34:03',0,'פנויים מחוברים כעת','Singles Online Now'),(325,'Age:',31,1,'Singles Online - mini window - Age info - Text',NULL,'Age:','2013-08-07 14:34:45',0,'גיל:','Age:'),(326,'online',31,1,'Singles Online - mini window - Online status - Text',NULL,'online','2013-08-07 14:34:03',0,'מחובר','online'),(327,'Google',2,1,NULL,NULL,'Google','2013-08-06 12:03:10',0,'גוגל','Google'),(328,'Lobby',21,1,NULL,NULL,'Lobby','2013-08-07 14:34:03',0,'לובי','Lobby'),(329,'Profile',21,1,NULL,NULL,'Profile','2013-08-07 14:34:03',0,'פרופיל','Profile'),(330,'Favourites',21,1,NULL,NULL,'Favourites','2013-08-07 14:34:03',0,'מועדפים','Favourites'),(331,'FileNotFound',32,3,NULL,NULL,'<div style=\"text-align: left;\">\r\n	<div>\r\n		&nbsp;</div>\r\n	<div>\r\n		&nbsp;</div>\r\n	<div>\r\n		&nbsp;</div>\r\n	<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 500px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<strong><span style=\"font-size:26px;\">This File isn&#39;t Exists</span></strong></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: left; vertical-align: bottom; height: 30px;\">\r\n					please press <strong><a href=\"./\"><span style=\"color:#3300ff;\">here</span></a></strong> to go &nbsp;to home page</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: left; vertical-align: bottom; height: 30px;\">\r\n					please press <a href=\"javascript:window.history.back();\">here</a> to go back</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2012-11-25 14:07:47',0,'<div style=\"text-align: left;\">\r\n	<div>\r\n		&nbsp;</div>\r\n	<div>\r\n		&nbsp;</div>\r\n	<div>\r\n		&nbsp;</div>\r\n	<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 500px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<strong><span style=\"font-size:26px;\">This File isn&#39;t Exists</span></strong></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: left; vertical-align: bottom; height: 30px;\">\r\n					please press <strong><a href=\"./\"><span style=\"color:#3300ff;\">here</span></a></strong> to go &nbsp;to home page</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: left; vertical-align: bottom; height: 30px;\">\r\n					please press <a href=\"javascript:window.history.back();\">here</a> to go back</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n','<div style=\"text-align: left;\">\r\n	<div>\r\n		&nbsp;</div>\r\n	<div>\r\n		&nbsp;</div>\r\n	<div>\r\n		&nbsp;</div>\r\n	<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 500px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<strong><span style=\"font-size:26px;\">This File isn&#39;t Exists</span></strong></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: left; vertical-align: bottom; height: 30px;\">\r\n					please press <strong><a href=\"./\"><span style=\"color:#3300ff;\">here</span></a></strong> to go &nbsp;to home page</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: left; vertical-align: bottom; height: 30px;\">\r\n					please press <a href=\"javascript:window.history.back();\">here</a> to go back</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n'),(332,'FileNotFound',33,3,'File Not Found Error page- Text',NULL,'FileNotFound','2012-11-25 14:10:34',0,'FileNotFound','FileNotFound'),(333,'Error Page',33,3,'General Error Page - Text',NULL,'<div style=\"text-align: left;\">\r\n	<div>\r\n		&nbsp;</div>\r\n	<div>\r\n		&nbsp;</div>\r\n	<div>\r\n		&nbsp;</div>\r\n	<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 500px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<span style=\"font-size: 26px;\"><b>Error Page</b></span></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: left; vertical-align: bottom; height: 30px;\">\r\n					There was a Error in the page</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: left; vertical-align: bottom; height: 30px;\">\r\n					please press <strong><a href=\"./\"><span style=\"color:#3300ff;\">here</span></a></strong> to go &nbsp;to home page</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: left; vertical-align: bottom; height: 30px;\">\r\n					please press <a href=\"javascript:window.history.back();\">here</a> to go back</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-08-04 12:24:31',0,'<div style=\"text-align: left;\">\r\n	<div>\r\n		&nbsp;</div>\r\n	<div>\r\n		&nbsp;</div>\r\n	<div>\r\n		&nbsp;</div>\r\n	<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 500px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<span style=\"font-size: 26px;\"><b>Error Page</b></span></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: left; vertical-align: bottom; height: 30px;\">\r\n					There was a Error in the page</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: left; vertical-align: bottom; height: 30px;\">\r\n					please press <strong><a href=\"./\"><span style=\"color:#3300ff;\">here</span></a></strong> to go &nbsp;to home page</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: left; vertical-align: bottom; height: 30px;\">\r\n					please press <a href=\"javascript:window.history.back();\">here</a> to go back</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n','<div style=\"text-align: left;\">\r\n	<div>\r\n		&nbsp;</div>\r\n	<div>\r\n		&nbsp;</div>\r\n	<div>\r\n		&nbsp;</div>\r\n	<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 500px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<span style=\"font-size: 26px;\"><b>Error Page</b></span></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: left; vertical-align: bottom; height: 30px;\">\r\n					There was a Error in the page</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: left; vertical-align: bottom; height: 30px;\">\r\n					please press <strong><a href=\"./\"><span style=\"color:#3300ff;\">here</span></a></strong> to go &nbsp;to home page</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: left; vertical-align: bottom; height: 30px;\">\r\n					please press <a href=\"javascript:window.history.back();\">here</a> to go back</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n'),(334,'Create Room',23,1,'Create Room Button - Text, <a target=\"blank\" href=\"../createroom.aspx?status=1\" >View page</a>',NULL,'Create Room','2013-08-07 14:35:45',1,'צור חדר','Create Room'),(335,'Save Changes',23,1,'button text for edit room, <a target=\"blank\" href=\"../createroom.aspx?status=1\" >View page</a>',NULL,'Save Changes','2013-08-06 17:29:31',1,'שמור שינויים','Save Changes'),(336,'Are you sure you want to expel?',23,3,'Expel popup - Conten Text, <a target=\"blank\" href=\"../createroom.aspx?status=8\" >View page</a>',NULL,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<div style=\"text-align: center;\">\r\n						<span style=\"font-size:14px;\">Are you sure you want to <strong>expel</strong>?</span></div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-08-06 17:43:21',8,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<div style=\"text-align: center;\">\r\n						האם אתה בטוח שאתה רוצה לגרש?</div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<div style=\"text-align: center;\">\r\n						<span style=\"font-size:14px;\">Are you sure you want to <strong>expel</strong>?</span></div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n'),(337,'Leave',22,1,NULL,NULL,'Leave','2013-08-06 17:42:14',0,'עזוב','Leave'),(338,'Are you sure you want to leave This Room?',23,3,'Leave Room popup - Content Text, <a target=\"blank\" href=\"../createroom.aspx?status=9\" >View page</a>',NULL,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<span style=\"font-size:14px;\">Are you sure you want to <strong>leave </strong>This Room?</span></td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-08-07 14:35:45',9,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<span style=\"font-size:14px;\">האם אתה בטוח שאתה רוצה <strong>לצאת </strong>מהחדר הזה?</span></td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<span style=\"font-size:14px;\">Are you sure you want to <strong>leave </strong>This Room?</span></td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n'),(339,'Blindate room',34,3,NULL,NULL,'<div>\r\n	<strong>Blindate</strong> room</div>\r\n','2013-03-04 11:21:30',0,'Blindate room','<div>\r\n	<strong>Blindate</strong> room</div>\r\n'),(340,'Leave',34,1,'Leave Room Button - Text',NULL,'Leave','2013-08-06 15:02:30',0,'עזוב','Leave'),(342,'You going to whait some time before',35,3,NULL,NULL,'You going to whait some time before','2013-08-07 14:37:29',0,'You going to whait some time before','You going to whait some time before'),(343,'Confirm',35,1,NULL,NULL,'Confirm','2013-08-07 14:37:29',0,'אשר','Confirm'),(344,'Leave room',35,1,NULL,NULL,'Spin Out','2013-08-07 14:37:29',0,'עזוב חדר','Leave room'),(345,'Your 1’st Blindate is about to start...',35,3,NULL,NULL,'<div>\r\n	<div>\r\n		&nbsp;</div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 600px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<strong>Your [[number]]&rsquo;st Blindate is about to start...</strong></td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					Please be patient untill your date is start.</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-07-30 13:39:48',0,'<div>\r\n	<div>\r\n		&nbsp;</div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 600px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<strong>Your [[number]]&rsquo;st Blindate is about to start...</strong></td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					Please be patient untill your date is start.</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','<div>\r\n	<div>\r\n		&nbsp;</div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 600px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<strong>Your [[number]]&rsquo;st Blindate is about to start...</strong></td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					Please be patient untill your date is start.</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n'),(346,'Your date has left',36,1,NULL,NULL,'Your date has left','2013-08-07 14:38:30',0,'הדייט שלך עזב','Your date has left'),(347,'Age:',36,1,NULL,NULL,'Age:','2013-08-07 14:38:29',0,'גיל:','Age:'),(348,'From:',36,1,NULL,NULL,'From:','2013-08-07 14:38:29',0,'מקום:','From:'),(349,'You have 2:00 minutes to decide if you like Emma o',36,1,NULL,NULL,'You have 2:00 minutes to decide if you like Emma or not.','2013-05-05 16:50:45',0,'יש לך שתי דקות להחליט אם אתה מחבב את אמה','You have 2:00 minutes to decide if you like Emma or not.'),(350,'add to favourite',36,1,NULL,NULL,'Favourite [[name]]','2013-08-07 14:38:30',0,'הוסף למועדפים','add to favourite'),(351,'added to favourite',36,1,NULL,NULL,'added to favourite','2013-08-07 14:38:30',0,'התווסף למועדפים','added to favourite'),(352,'Report abuse',36,1,NULL,NULL,'Report abuse','2013-08-07 14:38:31',0,'דווח','Report abuse'),(353,'Leave room',36,1,NULL,NULL,'Leave room','2013-08-07 14:38:31',0,'עזוב חדר','Leave room'),(354,'skip date',36,1,NULL,NULL,'skip date','2013-08-06 16:21:38',0,'דלג ','skip date'),(355,'Age:',37,1,NULL,NULL,'Age:','2013-08-07 14:39:15',0,'גיל:','Age:'),(356,'From:',37,1,NULL,NULL,'From:','2013-08-07 14:39:15',0,'מקום:','From:'),(357,'Great! You and [[name]]liked each other,and you ar',37,1,'message on spin report when both favourite ',NULL,'Great! You and [[name]] liked each other,and you are now favourites.','2013-08-07 09:16:28',0,'נפלא אתה ו [[name]] מחבבים אחד את השני, ועכשיו אתם במעודפים','Great! You and [[name]] liked each other,and you are now favourites.'),(358,'Unfortunately you chose not to favourite Amy.',37,1,'message on spin report when the user didnt favourite  ([[name]] will be replaced automatically with the real username)',NULL,'Unfortunately you chose not to favourite[[name]].','2013-08-07 14:39:15',0,'לצערי בחרת לא להוסיף את [[name]] למועדפים','Unfortunately you chose not to favourite Amy.'),(359,'Add to Favourites',37,1,NULL,NULL,'Add to Favourites','2013-08-07 14:39:15',0,'תוסיף למועדפים','Add to Favourites'),(360,'Added to favourites',37,1,NULL,NULL,'Added to favourites','2013-08-07 14:39:15',0,'התווסף למועדפים','Added to favourites'),(361,'View Profile',37,1,NULL,NULL,'View Profile','2013-08-07 14:39:15',0,'צפה בפרופיל','View Profile'),(362,'block/report',37,1,NULL,NULL,'Block / Report','2013-08-07 14:39:15',0,'חסום / דווח','block/report'),(363,'You have decided to flag [[name]]. You may fill a ',37,1,'message on spin report when the user mark report abused',NULL,'You have decided to flag [[name]]. You may fill a report against her now.','2013-08-07 14:39:15',0,'החלטת לשים דגל ל [[name]]. אתה יכול למלא דיווח נגדו','You have decided to flag [[name]]. You may fill a report against her now.'),(364,'Continue to Lobby',37,1,'Report window - Continue to Lobby button - Text',NULL,'Continue to Lobby','2013-08-07 14:39:16',0,'המשך ללובי','Continue to Lobby'),(365,'Your Spindate Report',37,1,'Report Window - Title Text',NULL,'Your Spindate Report','2013-08-07 14:39:16',0,'דוח הספין דייט שלך','Your Spindate Report'),(366,'Report or/and block a member',37,1,'report or block memeber window - title text',NULL,'Report or/and block a member','2013-08-07 11:33:21',0,'דווח אוו חסום את המשתמש','Report or/and block a member'),(367,'Confirm',37,1,'user report button - Text',NULL,'Confirm','2013-08-07 11:33:21',0,'אשר','Confirm'),(368,'Hide [[name]] from future Spindates',37,1,'[[name]] will be replaced automaticaly with the real username',NULL,'Hide [[name]] from future Spindates','2013-08-07 11:33:21',0,'החבא [[name]] מפגישות בעתיד','Hide [[name]] from future Spindates'),(369,'That means that you and [[name]] will no longer se',37,1,'user report window - option 1 - description',NULL,'That means that you and [[name]] will no longer see each other on Spindate rooms.','2013-08-07 11:33:21',0,'הכוונה שתה ו [[name]] לא תראו אחד את השני בחדרי האתר','That means that you and [[name]] will no longer see each other on Spindate rooms.'),(370,'Unfavorite [[name]]',37,1,'User report window - option 2 (Unfavotire [[name]]) ([[name]] will be replaced automatically with the real username)',NULL,'Unfavorite [[name]]','2013-08-07 11:33:21',0,'הסר ממועדפים [[name]]','Unfavorite [[name]]'),(371,'You and [[name]] will no longer be favourites.',37,1,'user report page - option 2 - description text',NULL,'You and [[name]] will no longer be favourites.','2013-08-07 11:33:21',0,'אתהו [[name]] לא תיהיו יותר מועדפים.','You and [[name]] will no longer be favourites.'),(372,'Block [[name]]',37,1,'User report window - option 4 (block[[name]]) ([[name]] will automatically return the real username)',NULL,'Block [[name]]','2013-08-07 11:33:21',0,'חסום [[name]]','Block [[name]]'),(373,'Report [[name]]',37,1,'User report window - option 4 (Report [[name]]) ([[name]] will automatically return the real username)',NULL,'Report [[name]]','2013-08-07 11:33:21',0,'דווח [[name]]','Report [[name]]'),(374,'Write us what happend...',37,1,'User Report window - free textbox at the bottom - Text inside when no text by user',NULL,'Write us what happend...','2013-08-07 11:33:21',0,'כתוב לנו מה קרה...','Write us what happend...'),(375,'Means that you won’t be able to see or contact eac',37,1,'user report window - option 3 - description text',NULL,'Means that you won’t be able to see or contact each other on Spindate.','2013-08-07 11:33:22',0,'לא תוכל לראות או לצור קשר אחד עם השני.','Means that you won’t be able to see or contact each other on Spindate.'),(376,'Additionally, you may fill a report:',37,1,'User Report window - free textbox at the bottom - header text above it',NULL,'Additionally, you may fill a report:','2013-08-07 11:33:22',0,'בנוסף אתה יכול להוסיף דיווח:','Additionally, you may fill a report:'),(377,'Cancel',37,1,'user report window - cencel button - Text',NULL,'Cancel','2013-08-07 11:33:22',0,'בטל','Cancel'),(378,'YouTube movie Url',2,1,NULL,NULL,'http://www.youtube.com/watch?v=iCkYw3cRwLo','2013-08-06 12:03:10',0,'http://www.youtube.com/watch?v=ZhL3G_TdWts?autoplay=1&loop=1&rel=0&wmode=transparent','http://www.youtube.com/watch?v=iCkYw3cRwLo'),(379,'Contact Us',38,1,'Page Title',NULL,'Contact Us','2013-06-27 11:05:35',0,'צור קשר','Contact Us'),(380,'Full Name',38,1,'Full Name - Textbox - text INSIDE when box is empty',NULL,'Full Name','2013-06-27 11:05:35',0,'שם מלא','Full Name'),(381,'Your E-mail Address',38,1,'Email - Textbox - text INSIDE when box is empty',NULL,'Your E-mail Address','2013-06-27 11:05:35',0,'כתובת המייל שלך','Your E-mail Address'),(382,'Choose a Subject:',38,1,'Subject Selector - header',NULL,'Choose a Subject:','2013-06-27 11:05:35',0,'בחר נושא:','Choose a Subject:'),(383,'Write your content...',38,1,'Comments - Textbox - Text when box is empty',NULL,'Write your content...','2013-06-27 11:05:35',0,'כתוב את ההודעה...','Write your content...'),(384,'Send',38,1,'Send button - Text',NULL,'Send','2013-06-27 11:05:35',0,'שלח','Send'),(385,'Cancel',38,1,'Cancel Button - Text',NULL,'Cancel','2013-06-27 11:05:35',0,'בטל','Cancel'),(386,'Close',38,1,'Close Button - Upper corner - When Hovered',NULL,'Close','2013-06-27 11:05:35',0,'סגור','Close'),(387,'Name is Required',38,1,'Fill name alert',NULL,'Name is Required','2013-06-27 11:05:35',0,'שכחת שם מלא','Name is Required'),(388,'Mail is Required',38,1,'Fill  email alert',NULL,'Mail is Required','2013-06-27 11:05:35',0,'Mail is Required','Mail is Required'),(389,'Mail Not Valid',38,1,'Invalid maiil alert',NULL,'Mail Not Valid','2013-06-27 11:05:35',0,'שכחת מייל','Mail Not Valid'),(390,'Question is Required',38,1,'Fill message alert',NULL,'Question is Required','2013-06-27 11:05:35',0,'שכחת שאלה','Question is Required'),(391,'Mail was sent successfully?',20,3,'message sent window: <a target=\"blank\" href=\"../registermsg.aspx?status=8\" >view</a>',NULL,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					Mail was sent successfully?</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-06-18 16:27:51',8,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					המייל נשלח בהצלחה</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					Mail was sent successfully?</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n'),(392,'Mail wasn\'\'t sent',20,3,'message faile dwindow: <a target=\"blank\" href=\"../registermsg.aspx?status=9\" >view</a>',NULL,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					Mail wasn&#39;t sent</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-06-13 16:49:11',9,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					המייל לא נשלח</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					Mail wasn&#39;t sent</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n'),(393,'First Name is requird',26,1,NULL,NULL,'First Name is requird','2013-08-07 11:49:06',0,'שם פרטי חובה!','First Name is requird'),(394,'Last Name is requird',26,1,NULL,NULL,'Last Name is requird','2013-08-07 11:49:06',0,'שם משפחה חסר','Last Name is requird'),(395,'Email is requird',26,1,NULL,NULL,'Email is requird','2013-08-07 11:49:07',0,'מייל חסר','Email is requird'),(396,'Email is not Valid',26,1,NULL,NULL,'Email is not Valid','2013-08-07 11:49:07',0,'מייל לא תקין','Email is not Valid'),(397,'Country:',26,1,NULL,NULL,'Country:','2013-08-07 11:49:07',0,'ארץ:','Country:'),(398,'State:',26,1,NULL,NULL,'State:','2013-08-07 11:49:07',0,'מדינה','State:'),(399,'Your Language:',26,1,NULL,NULL,'Your Language:','2013-08-07 11:49:07',0,'השפה שלך:','Your Language:'),(400,'Password isn\'\'t correct',26,1,'account settings - change password - password not correct error - Text',NULL,'Password isn\'t correct','2013-08-07 11:49:06',0,'הסיסמה לא נכונה','Password isn\'t correct'),(401,'Old Password:',26,1,'Account settings - change password - old password - Text',NULL,'Old Password:','2013-08-07 11:49:06',0,'סיסמה ישנה:','Old Password:'),(402,'New Password:',26,1,'Account settings - change password - new password - Text',NULL,'New Password:','2013-08-07 11:49:06',0,'סיסמה חדשה','New Password:'),(403,'Confirm:',26,1,'Account settings - change password - confirm  - Text',NULL,'Confirm:','2013-08-07 11:49:06',0,'וידוא:','Confirm:'),(404,'the password confirm text is not valid',26,1,'Account settings - change password - password & confirm is not matching - Error Textt',NULL,'the password confirm text is not valid','2013-08-07 11:49:06',0,'הוידוא סיסמה לא זהה','the password confirm text is not valid'),(405,'Delete',30,1,'Images Page - images preview window - Delete button - Text',NULL,'Delete','2013-08-06 11:54:59',0,'מחק','Delete'),(406,'Close Preview',30,1,'Images Page - images preview window - Close preview button - Text',NULL,'Close Preview','2013-08-06 11:54:59',0,'סגור תצוגה','Close Preview'),(407,'Find Favourite',24,1,'inbox messages list- Find favorites search box - Text inside',NULL,'Find Favourite','2013-08-07 13:44:18',0,'מצא מועדף','Find Favourite'),(408,'Send',24,1,'Inbox Coversation window - Send message button - text',NULL,'Send','2013-08-06 16:03:54',0,'שלח','Send'),(409,'Block Member',21,1,NULL,NULL,'Block Member','2013-08-07 14:34:07',0,'חסום משתמש','Block Member'),(410,'Report Abuse',21,1,NULL,NULL,'Report Abuse','2013-08-07 14:34:07',0,'דווח על משתמש','Report Abuse'),(411,'See Full Conversation',21,1,NULL,NULL,'See Full Conversation','2013-08-07 14:34:06',0,'ראה שיחה מלאה','See Full Conversation'),(412,'Online',21,1,NULL,NULL,'Online','2013-08-07 14:34:06',0,'מחוברים','Online'),(413,'offline',21,1,NULL,NULL,'offline','2013-08-07 14:34:06',0,'מנותקים','offline'),(414,'Remember me',2,1,NULL,NULL,'Remember me','2013-08-06 12:03:09',0,'זכור אותי','Remember me'),(415,'About Us',21,1,'main page - about us link - text',NULL,'About Us','2013-08-07 14:34:06',0,'עלינו','About Us'),(416,'Terms of Service',21,1,'main page - terms of service link - text',NULL,'Terms of Service','2013-08-07 14:34:06',0,'תנאי שימוש','Terms of Service'),(417,'Privacy Policy',21,1,'main page - Privacy Policy link - text',NULL,'Privacy Policy','2013-08-07 14:34:06',0,'מדיניות פרטיות','Privacy Policy'),(418,'Blog',21,1,'main page - Blog link - text',NULL,'Blog','2013-08-07 14:34:06',0,'בלוג','Blog'),(419,'Help & FAQ',21,1,'main page - Help & Faq link - text',NULL,'Help & FAQ','2013-08-07 14:34:06',0,'עזרה','Help & FAQ'),(420,'Contact Us',21,1,'main page -Contact us link - text',NULL,'Contact Us','2013-08-07 14:34:06',0,'צור קשר','Contact Us'),(421,'All rights reserved © 2012 Spindate.com',21,1,'main page - Trademark Text',NULL,'All rights reserved © 2012 Spindate.com','2013-08-07 14:34:06',0,'כל הזכויות שמורות © 2012 Spindate.com','All rights reserved © 2012 Spindate.com'),(424,'Your E-mail Address',20,1,'Forgot password window - text inside TextBox when nothim is written <a target=\"blank\" href=\"../registermsg.aspx?status=4\" >view page </a>',NULL,'Your E-mail Address','2013-07-03 13:06:06',4,'כתובת המייל שלך','Your E-mail Address'),(425,'Spindate: Connection Details',20,1,'forget password window, header  text of mail with details ,<a target=\"blank\" href=\"../registermsg.aspx?status=4\" >view page </a>',NULL,'Spindate: Connection Details','2013-06-13 11:48:58',4,'שלום רב','Spindate: Connection Details'),(426,'here is your account details:',20,3,'forget password window, top text of mail with details ,<a target=\"blank\" href=\"../registermsg.aspx?status=4\" >view page </a>',NULL,'here is your account details:','2013-06-13 11:48:58',4,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 500px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					הנה פרטי החשבון שלך:</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','here is your account details:'),(427,'Spindatesignature',20,3,'forget password window, bottom text of mail with details ,<a target=\"blank\" href=\"../registermsg.aspx?status=4\" >view page </a>',NULL,'Spindatesignature','2013-06-13 11:48:58',4,'<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 500px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					שיהיה המשך יום נפלא ומלא אהבה</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					צוות ספינדייט</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','Spindatesignature'),(428,'Email:',20,1,'forget password window, email text of mail with details ,<a target=\"blank\" href=\"../registermsg.aspx?status=4\" >view page </a>',NULL,'Email:','2013-06-13 11:48:58',4,':דואר אלקטרוני','Email:'),(429,'Password:',20,1,'forget password window, password text of mail with details ,<a target=\"blank\" href=\"../registermsg.aspx?status=4\" >view page </a>',NULL,'Password:','2013-06-13 11:48:58',4,'סיסמה:','Password:'),(430,'Mail is Required',20,1,'<a target=\"blank\" href=\"../registermsg.aspx?status=1\" >view page </a>',NULL,'Mail is Required','2013-06-13 16:27:00',1,'הכנס מייל','Mail is Required'),(431,'Mail Not Valid',20,1,'<a target=\"blank\" href=\"../registermsg.aspx?status=1\" >view page </a>',NULL,'Mail Not Valid','2013-06-13 16:27:00',1,'המייל אינו תקין','Mail Not Valid'),(432,'Day',2,1,NULL,NULL,'Day','2013-08-07 11:49:08',0,'יום','Day'),(433,'Month',2,1,NULL,NULL,'Month','2013-08-07 11:49:08',0,'חודש','Month'),(434,'Year',2,1,NULL,NULL,'Year','2013-08-07 11:49:08',0,'שנה','Year'),(435,'Mail Exists',20,1,'<a target=\"blank\" href=\"../registermsg.aspx?status=1\" >view page </a>',NULL,'Mail Exists','2013-06-13 16:27:00',1,'המייל קיים','Mail Exists'),(437,'All',17,1,'before blog category header',NULL,'All','2013-06-13 15:05:09',0,'כל','All'),(438,'View all',18,1,'View ALL button - text',NULL,'View all','2013-07-28 10:06:58',0,'צפה בכולם','View all'),(439,'All',18,1,'Category page - header - \"All\" BEFORE \"Category name\"',NULL,'All','2013-06-13 15:08:26',0,'כל','All'),(440,'Articles',18,1,'articles amount counter per category - below category',NULL,'Articles','2013-07-28 10:06:58',0,'מאמרים ','Articles'),(441,'Write Replay...',24,1,'write reply button - Text',NULL,'Write Replay...','2013-08-07 13:44:18',0,'כתוב תגובה...','Write Replay...'),(442,'Email Address:',26,1,'Account settings - account info - Email address - Text',NULL,'E-mail: Address:','2013-08-07 11:49:06',0,'כתובת מייל:','E-mail: Address:'),(443,'About Me:',26,1,'Account settings - acocunt info - about me - textbox - header',NULL,'About Me:','2013-08-07 11:49:07',0,'עליי:','About Me:'),(444,'Privacy',26,1,'Account settings - acocunt status - privacy cube - header',NULL,'Privacy','2013-08-07 11:49:10',0,'פרטיות','Privacy'),(445,'offline',29,1,'profile status viewer status - offline - Text',NULL,'offline','2013-08-06 11:45:00',0,'מנותק','offline'),(446,'Favorites',29,1,'history info - friend status - favorites - Text',NULL,'Favorites','2013-08-06 11:45:00',0,'מועדף','Favorites'),(447,'Not Favorites',29,1,'history info - friend status - not favorites - Text',NULL,'Not Favorites','2013-08-06 11:45:00',0,'לא מועדף','Not Favorites'),(448,'lasting :',29,1,'history info  - lasting - Text',NULL,'lasting :','2013-08-06 11:45:00',0,'נמשך','lasting :'),(449,'minutes.',29,1,'history info  - minutes - Text',NULL,'minutes.','2013-08-06 11:45:00',0,'דקות.','minutes.'),(450,'offline',27,1,'Mini Window Info - Offline Text',NULL,'offline','2013-08-07 13:37:44',0,'מנותק','offline'),(451,'help?',40,1,NULL,NULL,'help?','2012-12-26 16:47:10',0,'עזרה?','help?'),(452,'Are you sure you want to Report this person?',40,3,'Report person popup - header Text, <a target=\"blank\" href=\"../windows.aspx?status=1\" >View page</a>',NULL,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"vertical-align: middle; text-align: center;\">\r\n					<span style=\"font-size:14px;\">Are you sure you want to<strong> Report </strong>this person?</span></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<span style=\"color:#993333;\"><strong><span style=\"\">Important:</span></strong></span> Your datewith this person will stop immediately.&nbsp;</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n\r\n','2013-08-06 18:10:38',1,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"vertical-align: middle; text-align: center;\">\r\n					<span style=\"font-size:14px;\">האם אתה בטוח שאתה רוצה<strong> לדווח</strong> על משתמש?</span></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<span style=\"color:#993333;\"><strong><span style=\"\">חשוב:</span></strong></span> בפגישה תסתיים במיידית.&nbsp;</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n','<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"vertical-align: middle; text-align: center;\">\r\n					<span style=\"font-size:14px;\">Are you sure you want to<strong> Report </strong>this person?</span></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<span style=\"color:#993333;\"><strong><span style=\"\">Important:</span></strong></span> Your datewith this person will stop immediately.&nbsp;</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n\r\n'),(453,'No',40,1,NULL,NULL,'No','2013-04-21 15:34:11',0,'לא','No'),(454,'Yes',40,1,NULL,NULL,'Yes','2013-04-21 15:34:11',0,'כן','Yes'),(456,'<span class=\"blueclass\">[[name]]</span> invites yo',40,1,NULL,NULL,'<span class=\"blueclass\">[[name]]</span> invites you to a video chat...','2012-12-26 17:32:44',0,'[[name]] מזמין אותך לוידיאו צאט...','<span class=\"blueclass\">[[name]]</span> invites you to a video chat...'),(457,'Accept',41,1,NULL,NULL,'Accept','2012-12-26 17:27:27',0,'הסכם','Accept'),(458,'Ignore',41,1,NULL,NULL,'Ignore','2012-12-26 17:27:27',0,'התעלם','Ignore'),(459,'Report',41,1,NULL,NULL,'Report','2012-12-26 17:27:27',0,'דווח','Report'),(460,'Accept',40,1,NULL,NULL,'Accept','2013-04-21 17:53:04',0,'הסכם','Accept'),(461,'Ignore',40,1,NULL,NULL,'Ignore','2013-04-21 17:53:04',0,'התעלם','Ignore'),(462,'Report',40,1,NULL,NULL,'Report','2013-07-17 09:16:10',0,'דווח','Report'),(463,'Inviting [[name]] to a video chat...',40,1,'put [[name]] for the user name,([[name]] will be automatically replaced with the real username), <a target=\"blank\" href=\"../windows.aspx?status=2\" >View page</a>',NULL,'Inviting [[name]] to a video chat...','2013-07-22 09:12:25',2,'הזמן את [[name]] לוידיאו לצ\'אט','Inviting [[name]] to a video chat...'),(464,'Cancel',40,1,NULL,NULL,'Cancel','2013-04-21 17:27:44',0,'','Cancel'),(465,'Message sent To [[name]]',40,3,NULL,NULL,'<div style=\"text-align: center;\">\r\n	Message sent To<strong> [[name]]!</strong></div>\r\n<div style=\"text-align: center;\">\r\n	&nbsp;</div>\r\n','2013-04-17 12:11:19',0,'<div style=\"text-align: center;\">\r\n	הודעה נשלחה אל<strong> [[name]]</strong> בהצלחה!</div>\r\n<div>\r\n	&nbsp;</div>\r\n','<div style=\"text-align: center;\">\r\n	Message sent To<strong> [[name]]!</strong></div>\r\n<div style=\"text-align: center;\">\r\n	&nbsp;</div>\r\n'),(466,'(Date Started)',22,1,NULL,NULL,'(Date Started)','2013-08-07 14:35:52',0,'(תאריך התחלה)','(Date Started)'),(467,'SpinDate Title',2,1,'SEOTitlle',NULL,'SpinDate Title','2013-08-06 12:03:09',0,'ספין דייט','SpinDate Title'),(468,'SpinDate Description',2,1,'SEODescrioption',NULL,'SpinDate Description','2013-08-06 12:03:09',0,'ספין דייט','SpinDate Description'),(469,'SpinDate Key Word',2,1,'SEOKeyWord',NULL,'SpinDate Key Word','2013-08-06 12:03:09',0,'ספין דייט','SpinDate Key Word'),(470,'Header Code Site',21,1,NULL,NULL,'<mete id=\"yossi\">  </meta>','2013-04-24 09:08:00',0,'','<mete id=\"yossi\">  </meta>'),(471,'Alt Logo',21,1,NULL,NULL,'Alt Logo','2013-08-07 14:34:03',0,'אלט ךוגו','Alt Logo'),(472,'Alt Logo',21,1,NULL,NULL,'Alt Logo','2013-08-07 14:34:03',0,'אלט לוגו','Alt Logo'),(473,'Header Code System',21,1,NULL,NULL,'','2013-04-24 11:28:53',0,'',''),(474,'Birthday:',2,1,NULL,NULL,'Birthday:','2013-08-06 12:03:10',0,'יום הולדת','Birthday:'),(475,'male',2,1,NULL,NULL,'male','2013-08-06 12:03:08',0,'זכר','male'),(476,'female',2,1,NULL,NULL,'female','2013-08-06 12:03:08',0,'נקבה','female'),(477,'males',2,1,NULL,NULL,'males','2013-01-23 10:28:53',0,'זכרים','males'),(478,'females',2,1,NULL,NULL,'females','2013-01-23 10:28:53',0,'נקבות','females'),(479,'males&females',2,1,NULL,NULL,'males&females','2013-01-23 10:28:53',0,'זכרים ונקבות','males&females'),(480,'Sign Up',19,1,'register page- Header',NULL,'Signup','2013-08-05 14:55:45',0,'הרשם','Signup'),(481,'Country:',19,1,'Register page 1 - country - Text',NULL,'Country:','2013-08-05 14:55:45',0,'ארץ:','Country:'),(482,'State:',19,1,'Register page 1 - state - Text',NULL,'State:','2013-08-05 14:55:45',0,'מדינה:','State:'),(483,'Langauge:',19,1,'Register page 1 - language- Text',NULL,'Langauge:','2013-08-05 14:55:45',0,'שפה:','Langauge:'),(484,'+ add more',19,1,'Register page 1 - language - add more - Text',NULL,'+ add more','2013-08-05 14:55:45',0,'+ הוסף','+ add more'),(485,'Add langauge',19,1,'Register page 1 - language -add more drop down - default text - Text',NULL,'Add langauge','2013-08-05 14:55:45',0,'הוסף שפה','Add langauge'),(486,'- Choose another langauge',19,1,'Register page 1 - language -text after clicking the \"add new\" - Text',NULL,'- Choose another langauge','2013-08-05 14:55:45',0,'- בחר שפה נוספת','- Choose another langauge'),(487,'Coupon:',19,1,'Register page 1 - coupon -text inside textbox when test is empty - Text',NULL,'Coupon','2013-08-05 14:55:45',0,'קופון','Coupon'),(488,'Blog',17,1,'header',NULL,'Blog','2013-07-31 16:20:10',0,'בלוג','Blog'),(489,'Register Title',19,1,'SEOTitle',NULL,'Register Title','2013-08-05 14:55:45',0,'הרשמה המשך','Register Title'),(490,'Register Description',19,1,'SEO Description',NULL,'Register Description','2013-08-05 14:55:45',0,'הרשמה המשך','Register Description'),(491,'Register Key Word',19,1,'SEO Key word',NULL,'Register Key Word','2013-08-05 14:55:45',0,'הרשמה המשך','Register Key Word'),(492,'Blog Title',17,1,'SEO title',NULL,'Blog Title','2013-07-31 16:20:10',0,'בלוג','Blog Title'),(493,'Blog Description',17,1,'SEOdescription',NULL,'Blog Description','2013-07-31 16:20:10',0,'בלוג','Blog Description'),(494,'Blog Key Word',17,1,'SEO keyword',NULL,'Blog Key Word','2013-07-31 16:20:10',0,'בלוג','Blog Key Word'),(495,'years',29,1,'history info - years - Text',NULL,'years','2013-01-06 17:50:17',0,'','years'),(496,'years ago',24,1,'Inbox Messages info- mini message - how many years ago the message recived - Text (years ago)',NULL,'years ago','2013-04-09 14:43:35',0,'שנים עברו','years ago'),(497,'More Information',21,1,'Extend now- more information link - Text',NULL,'More Information','2013-08-07 14:34:05',0,'עוד מידע','More Information'),(498,'Extend Your Account!',42,1,'Extend Window - Title',NULL,'Extend Your Account!','2013-07-29 10:39:41',0,'הרחב את חשבונך','Extend Your Account!'),(499,'Subscribe Now to Get More Features!',42,1,'Account status tab - subscribe Text ',NULL,'Subscribe Now to Get More Features!','2013-08-05 14:03:32',0,'הרשם עכשיו וקבל עוד פיצרים','Subscribe Now to Get More Features!'),(500,'Subscribers benefits:',42,1,NULL,NULL,'Subscribers benefits:','2013-01-07 14:37:28',0,'הטבות נרשם:','Subscribers benefits:'),(501,'Video Technology',42,1,'Video technology - Header',NULL,'Video Technology','2013-08-05 14:03:33',0,'טכנולוגית וידיאו','Video Technology'),(502,'Spindate specialized in video technology',42,1,'Video Technology - Content',NULL,'Spindate specialized in video technology','2013-08-05 14:03:33',0,'ספינדייט מתמחה בטכנולוגיית וידיאו','Spindate specialized in video technology'),(503,'Unlimited Dates',42,1,'Unlimited Dates - Header',NULL,'Unlimited Dates','2013-08-05 14:03:33',0,'אינסוף דייטים','Unlimited Dates'),(504,'Get unlimited dates and make deeper connections',42,1,'Unlimited Dates - content',NULL,'Get unlimited dates and make deeper connections','2013-08-05 14:03:33',0,'הכנס לדייטים רבים להעמקת הקשרים','Get unlimited dates and make deeper connections'),(505,'Meet People Fast',42,1,'Meet People Fast - Header',NULL,'Meet People Fast','2013-08-05 14:03:33',0,'הכר אנשים מהר','Meet People Fast'),(506,'Privacy',42,1,'Privacy - Header',NULL,'Privacy','2013-08-05 14:03:33',0,'פרטיות','Privacy'),(507,'Select Plan:',42,1,'Plans Header text',NULL,'Select Plan:','2013-08-05 14:03:33',0,'בחר תוכנית','Select Plan:'),(508,'Per Month',43,1,NULL,NULL,'Per Month','2013-01-07 17:53:34',0,NULL,'Per Month'),(509,'Per Month',42,1,'Text Below the Price-Per-Month',NULL,'Per Month','2013-08-05 14:03:33',0,'לחודש','Per Month'),(510,'Months-',42,1,'Text right after  the Month Amount number',NULL,'Months-','2013-08-05 14:03:33',0,'חודש -','Months-'),(511,'Upgrade',42,1,'Upgrade Button - Text',NULL,'Upgrade','2013-08-05 14:03:33',0,'שדרג','Upgrade'),(512,'Male',34,1,'Male Icon Text - when HOVERED',NULL,'Male','2013-08-06 17:41:45',0,'גבר','Male'),(513,'Female',34,1,'Female Icon Text - WHen HOVERED',NULL,'Female','2013-08-06 17:41:45',0,'אישה','Female'),(514,'Refine',31,1,'Singles online - Refine button - Text',NULL,'Refine','2013-08-07 14:34:06',0,'חפש','Refine'),(515,'Advanced Filter',44,1,NULL,NULL,'Advanced Filter','2013-03-04 10:16:02',1,NULL,'Advanced Filter'),(516,'Approve',44,1,NULL,NULL,'Approve','2013-03-07 13:01:11',1,NULL,'Approve'),(517,'female',31,1,'Singles online type - Female - Text',NULL,'female','2013-08-07 14:34:03',0,'אישה','female'),(518,'Video',31,1,'Singles online - mini window - video button - Text',NULL,'Video','2013-08-07 14:34:45',0,'וידיאו','Video'),(519,'Chat',31,1,'Singles online - mini window - chat button - Text',NULL,'Chat','2013-08-07 14:34:45',0,'צאט','Chat'),(520,'male',31,1,'Singles online type - Male - text',NULL,'male','2013-08-07 14:34:03',0,'גבר','male'),(521,'Inviting [[name]] to a chat...',40,1,'window to see when inviting someone for a chat, [[name]] will be replaced automaticly to the real username<a target=\"blank\" href=\"../windows.aspx?status=6\" >View page</a>',NULL,'Inviting [[name]] to a chat...','2013-07-15 16:52:43',6,'הזמן את [[name]] לצאט...','Inviting [[name]] to a chat...'),(522,'[[name]] invites you to a chat...',40,1,'window to see when you being invited to chat - Text - [[name]] will be replaced automaticly with the real username, <a target=\"blank\" href=\"../windows.aspx?status=7\" >View page</a>',NULL,'[[name]] invites you to a chat...','2013-07-17 09:16:10',7,'[[name]] מזמין אותך לצאט...','[[name]] invites you to a chat...'),(523,'Login',2,1,NULL,NULL,'Login','2013-08-06 12:03:09',0,'הכנס','Login'),(524,'looking for males',2,1,NULL,NULL,'looking for males','2013-08-06 12:03:08',0,'חיפוש גברים','looking for males'),(525,'looking for females',2,1,NULL,NULL,'looking for females','2013-08-06 12:03:08',0,'חיפוש נשים','looking for females'),(526,'looking for males&females',2,1,NULL,NULL,'looking for males&females','2013-08-06 12:03:08',0,'חפוש נשים וגברים','looking for males&females'),(527,'SignIn',2,1,NULL,NULL,'SignIn','2013-08-06 12:03:08',0,'הרשם','SignIn'),(528,'Play movie',2,1,NULL,NULL,'Play movie','2013-08-06 12:03:10',0,'נגן סרט','Play movie'),(530,'Enter Password at least 6 chars (numbers and engli',2,1,'validation error alert',NULL,'Enter Password at least 6 chars (numbers and english chars)','2013-08-06 12:03:08',0,'הכנס לפחות 6 תווים לסיסמה','Enter Password at least 6 chars (numbers and english chars)'),(531,'Second Language:',26,1,'Account settings - account info - Second language - text',NULL,'Second Language:','2013-08-07 11:49:07',0,'שפה שנייה','Second Language:'),(532,'+ Add more',26,1,'Account settings - account info - add more language - text',NULL,'+ Add more','2013-08-07 11:49:09',0,'+ הוסף עוד','+ Add more'),(533,'- Hide',26,1,'Account settings - account info - hide more language - text',NULL,'- Hide','2013-08-07 11:49:09',0,'- החבא','- Hide'),(534,'Importent Facts',26,1,'Account settings - account info - Important facts - header - text',NULL,'Importent Facts','2013-08-07 11:49:09',0,'עובדות חשובות','Importent Facts'),(535,'Relationship:',26,1,'Account settings - account info - relationship - text',NULL,'Relationship:','2013-08-07 11:49:07',0,'יחסים','Relationship:'),(536,'Hair color:',26,1,'Account settings - account info - hair color - text',NULL,'Hair color:','2013-08-07 11:49:07',0,'צבע שיער','Hair color:'),(537,'Eye color:',26,1,'Account settings - account info - eye color - text',NULL,'Eye color:','2013-08-07 11:49:07',0,'צבע עניים','Eye color:'),(538,'Height(cm):',26,1,'Account settings - account info - height - text',NULL,'Height(cm):','2013-08-07 11:49:07',0,'גובה','Height(cm):'),(539,'Body type:',26,1,'Account settings - account info - body Type - text',NULL,'Body type:','2013-08-07 11:49:07',0,'סוג גוף','Body type:'),(540,'Living :',26,1,'Account settings - account info - living - text',NULL,'Living :','2013-08-07 11:49:07',0,'מגורים','Living :'),(541,'Children :',26,1,'Account settings - account info - children - text',NULL,'Children :','2013-08-07 11:49:07',0,'ילדים','Children :'),(542,'Smoking:',26,1,'Account settings - account info - smoking - text',NULL,'Smoking:','2013-08-07 11:49:07',0,'עישון','Smoking:'),(543,'Do you drink?',26,1,'Account settings - account info - Do you drink - text',NULL,'Do you drink?','2013-08-07 11:49:07',0,'שתייה:','Do you drink?'),(544,'Ethnicity:',26,1,'Account settings - account info - ethnicity - text',NULL,'Ethnicity:','2013-08-07 11:49:07',0,'מוצא','Ethnicity:'),(545,'Education:',26,1,'Account settings - account info - education - text',NULL,'Education:','2013-08-07 11:49:07',0,'חינוך','Education:'),(546,'About your looks',26,1,'Account settings - account info - About your looks - header - text',NULL,'About your looks','2013-08-07 11:49:09',0,'על המראה','About your looks'),(547,'About your background',26,1,'Account settings - account info - About your backgrounds - header - text',NULL,'About your background','2013-08-07 11:49:09',0,'על הרקע','About your background'),(548,'About your lifestyle',26,1,'Account settings - account info - About your lifestyle - header  - text',NULL,'About your lifestyle','2013-08-07 11:49:09',0,'על סגנון חיים','About your lifestyle'),(549,'male',26,1,'Account settings - account info - male icon hovering - Text',NULL,'male','2013-08-07 11:49:08',0,'גבר','male'),(550,'female',26,1,'Account settings - account info - female icon hovering - Text',NULL,'female','2013-08-07 11:49:08',0,'אישה','female'),(551,'male&female',26,1,'Account settings - account info - male and female  icon hovering - Text',NULL,'male&female','2013-08-07 11:49:08',0,'גברים ונשים','male&female'),(552,'Important Facts',29,1,'Profile Viwer - Important facts - header text',NULL,'Important Facts','2013-08-06 11:45:00',0,'עובדות חשובות','Important Facts'),(553,'My Look',29,1,'Profile Viewer - my look - header text',NULL,'My Look','2013-08-06 11:45:00',0,'המראה שלי','My Look'),(554,'My Lifestyle',29,1,'Profile viewer - my lifestyle - header text',NULL,'My Lifestyle','2013-08-06 11:45:01',0,'סגנון חיים','My Lifestyle'),(555,'My Background',29,1,'Profile Viewer - my background - header text',NULL,'My Background','2013-08-06 11:45:01',0,'הרקע שלי','My Background'),(556,'Relationship:',29,1,'important facts - relationship status - Text',NULL,'Relationship:','2013-08-06 11:45:00',0,'יחסים','Relationship:'),(557,'HairColor:',29,1,'Profile window - heir color - Text',NULL,'HairColor:','2013-08-06 11:45:00',0,'צבע שיער','HairColor:'),(558,'Eyecolor:',29,1,'Profile window - eye color - Text',NULL,'Eyecolor:','2013-08-06 11:45:00',0,'צבע עניים','Eyecolor:'),(559,'Bodytype:',29,1,'Profile window - bodytype - Text',NULL,'Bodytype:','2013-08-06 11:45:00',0,'גוף','Bodytype:'),(560,'living:',29,1,'my lifestyle - living status - Text',NULL,'living:','2013-08-06 11:45:01',0,'מגורים','living:'),(561,'Children:',29,1,'Profile window - children - Text',NULL,'Children:','2013-08-06 11:45:01',0,'ילדים','Children:'),(562,'Smoking:',29,1,'Profile window - smoking- Text',NULL,'Smoking:','2013-08-06 11:45:01',0,'עישון','Smoking:'),(563,'Do you drink?',29,1,'Profile window - do you drink - Text',NULL,'Do you drink?','2013-08-06 11:45:01',0,'האם אתה שותה','Do you drink?'),(564,'Ethnicity:',29,1,'Profile window - Ethnicity- Text',NULL,'Ethnicity:','2013-08-06 11:45:01',0,'אתניות','Ethnicity:'),(565,'Education',29,1,'Profile window - education- Text',NULL,'Education','2013-08-06 11:45:01',0,'השכלה','Education'),(566,'Image number',30,1,NULL,NULL,'Image number','2013-08-06 11:54:58',0,'מספר תמונה','Image number'),(567,'Language:',29,1,'Profile window - language- Text',NULL,'Language:','2013-08-06 11:44:59',0,'שפה','Language:'),(568,'Help Title',18,1,'Help Page - Title',NULL,'Help Title','2013-07-28 10:06:58',0,'מרכז עזרה','Help Title'),(569,'Help Description',18,1,'Help Page - Description',NULL,'Help Description','2013-07-28 10:06:58',0,'מרכז עזרה','Help Description'),(570,'Help Key Word',18,1,'Help Page - Keyword',NULL,'Help Key Word','2013-07-28 10:06:58',0,'מרכז עזרה','Help Key Word'),(571,'Support',18,1,'Help  Page - Header',NULL,'Support','2013-07-28 10:06:58',0,'תמיכה','Support'),(572,'contact Title',38,1,'SEOTitle',NULL,'contact Title','2013-06-27 11:05:35',0,'צור קשר','contact Title'),(573,'contact Description',38,1,'SEO Description',NULL,'contact Description','2013-06-27 11:05:35',0,'צור קשר','contact Description'),(574,'contact Key Word',38,1,'SEO KeyWord',NULL,'contact Key Word','2013-06-27 11:05:35',0,'צור קשר','contact Key Word'),(575,'termsofservice Title',15,1,'SEO tilte',NULL,'termsofservice Title','2013-07-31 16:20:05',0,NULL,'termsofservice Title'),(576,'termsofservice Description',15,1,'SEO description',NULL,'termsofservice Description','2013-07-31 16:20:05',0,NULL,'termsofservice Description'),(577,'termsofservice Key Word',15,1,'SEO keyword',NULL,'termsofservice Key Word','2013-07-31 16:20:05',0,NULL,'termsofservice Key Word'),(578,'Advanced Filter',45,1,NULL,NULL,'Advanced Filter','2013-01-30 12:37:04',1,NULL,'Advanced Filter'),(579,'Advenced Filter',34,1,'Advanced Search button - Text',NULL,'Refine','2013-08-06 16:24:56',0,'חיפוש מתקדם','Refine'),(581,'Advanced Filter2',44,1,NULL,NULL,'Advanced Filter2','2013-03-07 13:01:10',1,NULL,'Advanced Filter2'),(582,'Show',31,1,'Singles Type selector Text',NULL,'Show','2013-08-07 14:34:03',0,'הצג','Show'),(583,'male&female',31,1,'Singles online Type - Male and Female - Text',NULL,'male&female','2013-08-07 14:34:03',0,'גבר&אשה','male&female'),(584,'online chat message',36,1,NULL,NULL,'online chat message','2013-04-25 16:33:08',0,'הודעת צאט מחובר','online chat message'),(585,'Leave date',36,1,NULL,NULL,'Leave date','2013-04-25 16:33:08',0,'עזוב פגישה','Leave date'),(586,'Send',36,1,NULL,NULL,'Send','2013-08-07 14:38:31',0,'שלח','Send'),(587,'[[name]] has decline your invitation.',21,1,'[[name will be replaced automaticly with the realu ser',NULL,'[[name]] has decline your invitation.','2013-02-06 14:33:52',0,'[[name]] דחה את ההצעה.','[[name]] has decline your invitation.'),(588,'[[name]] has decline your invitation.',36,1,NULL,NULL,'[[name]] has decline your invitation.','2013-04-21 18:02:45',9,'[[name]] דחה את הזמנתך','[[name]] has decline your invitation.'),(589,'back to lobby',40,1,' window to see when user DECLINE your invitation - back to lobby button - Text, <a target=\"blank\" href=\"../windows.aspx?status=9\" >View page</a>',NULL,'back to lobby','2013-08-06 18:09:00',9,'חזור ללובי','back to lobby'),(590,'favourites',27,1,'Favourites Page - Header',NULL,'Favourites','2013-08-07 13:37:45',0,'מעודפים','Favourites'),(591,'female',36,1,NULL,NULL,'female','2013-08-07 14:38:29',0,'נקבה','female'),(592,'male',36,1,NULL,NULL,'male','2013-08-07 14:38:29',0,'זכר','male'),(593,'Favourites Title',27,1,'Favourites Page - Title',NULL,'Favourites Title','2013-08-07 13:37:45',0,'מעודפים','Favourites Title'),(594,'mail footer',46,3,'text in bottom of letter sent',NULL,'mail footer','2013-08-06 11:45:40',0,NULL,'mail footer'),(595,'mail from [[name]] (spindate favourite)',46,1,'header of mail ',NULL,'mail from [[name]] (spindate favourite)','2013-08-06 11:45:40',0,NULL,'mail from [[name]] (spindate favourite)'),(596,'Video',47,1,NULL,NULL,'Video','2013-04-18 15:24:49',0,NULL,'Video'),(597,'hours',29,1,'profile text - hours',NULL,'hours','2013-08-06 11:45:00',0,'שעות','hours'),(598,'minutes',29,1,'profile page text - minutes',NULL,'minutes','2013-08-05 14:39:19',0,'דקות','minutes'),(599,'Inbox',24,1,'Inbox Page - Header Text',NULL,'Inbox','2013-08-07 13:44:18',0,'תיבת דואר','Inbox'),(600,'FavouInboxrites Title',24,1,'Favotires inbox window - Title',NULL,'FavouInboxrites Title','2013-02-11 16:42:04',0,'','FavouInboxrites Title'),(601,'Inbox Title',24,1,'Inbox Page - Title Text',NULL,'Inbox Title','2013-08-07 13:44:18',0,'תיבת דואר','Inbox Title'),(602,'Accept',25,1,NULL,NULL,'Accept','2013-08-07 14:36:54',0,'קבל','Accept'),(603,'Ignore',25,1,NULL,NULL,'Ignore','2013-08-07 14:36:54',0,'בטל','Ignore'),(604,'View Profile',25,1,NULL,NULL,'View Profile','2013-08-07 14:36:54',0,'הצג פרופיל','View Profile'),(605,'Video',25,1,NULL,NULL,'Video','2013-08-07 14:36:54',0,'וידיאו','Video'),(606,'Chat',25,1,NULL,NULL,'Chat','2013-08-07 14:36:54',0,'צאט','Chat'),(607,'View Gift',25,1,NULL,NULL,'View Gift','2013-06-26 18:30:35',0,'הצג מתנה','View Gift'),(608,'Notifications',25,1,NULL,NULL,'Notifications','2013-08-07 14:36:54',0,'התראות','Notifications'),(609,'You recived a gift from [[name]]',25,1,'Insert [[name]] in the place of the member name sopposed to be.',NULL,'You recived a gift from [[name]]','2013-08-07 14:36:54',0,'[[name]] שלח לך מתנה','You recived a gift from [[name]]'),(610,'Enetr mail please',20,1,'enter mail alert , <a target=\"blank\" href=\"../registermsg.aspx?status=4\" >view page </a>',NULL,'Enetr mail please','2013-07-03 13:06:06',4,'הכנס כתובת דואר אלקטרוני ','Enetr mail please'),(611,'the mail is not valid',20,1,' mail is not valid alert, <a target=\"blank\" href=\"../registermsg.aspx?status=4\" >view page </a>',NULL,'the mail is not valid','2013-07-03 13:06:06',4,'כתובת הדואר אינה תקינה','the mail is not valid'),(612,'Import from Facebook',30,1,'Images Page - Import from facebook button - Text',NULL,'Import from Facebook','2013-08-06 11:54:58',0,'ייבא מפייסבוק','Import from Facebook'),(613,'photos',30,1,'Images Page - bottom mini images - images counter Text (IE. x PHOTOS)',NULL,'photos','2013-08-06 11:54:58',0,'תמונות','photos'),(614,'Sorry! This blinddate room is unavailable',48,3,NULL,NULL,'Sorry! This blinddate room is unavailable','2013-02-14 17:32:27',1,NULL,'Sorry! This blinddate room is unavailable'),(615,'Sorry! This blinddate room is unavailable',23,3,'Unavailable Room popup - header, <a target=\"blank\" href=\"../createroom.aspx?status=14\" >View page</a>',NULL,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<strong>Sorry! This room is unavailable</strong></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<div>\r\n						Thats could be because one of the following reasons:</div>\r\n					<div>\r\n						- You age does not fit to the room</div>\r\n					<div>\r\n						- You age does not fit to the room owner&rsquo;s request</div>\r\n					<div>\r\n						- You age does not fit to</div>\r\n					<div>\r\n						- You age does not fit to the room owner&rsquo;s</div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-08-06 17:32:25',14,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<b>מצטער החדר לא מתאים!</b></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<div>\r\n						Thats could be because one of the following reasons:</div>\r\n					<div>\r\n						- You age does not fit to the room</div>\r\n					<div>\r\n						- You age does not fit to the room owner&rsquo;s request</div>\r\n					<div>\r\n						- You age does not fit to</div>\r\n					<div>\r\n						- You age does not fit to the room owner&rsquo;s</div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<strong>Sorry! This room is unavailable</strong></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<div>\r\n						Thats could be because one of the following reasons:</div>\r\n					<div>\r\n						- You age does not fit to the room</div>\r\n					<div>\r\n						- You age does not fit to the room owner&rsquo;s request</div>\r\n					<div>\r\n						- You age does not fit to</div>\r\n					<div>\r\n						- You age does not fit to the room owner&rsquo;s</div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n'),(616,'You have joined to a blind date',23,3,'Blindroom popup - after joining - topic TEXT, <a target=\"blank\" href=\"../createroom.aspx?status=15\" >View page</a>',NULL,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<span style=\"font-size:14px;\"><strong>You have joined to a Blind room!</strong></span></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					Your blind date room will start when it will be filled with people.</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-08-06 17:32:47',15,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<span style=\"font-size:14px;\"><strong>הצטרפת לחדר בליינד דייט!</strong></span></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					הסיבוב יתחיל כשהחדר יתמלא.</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<span style=\"font-size:14px;\"><strong>You have joined to a Blind room!</strong></span></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					Your blind date room will start when it will be filled with people.</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n'),(617,'Continue to blind rooms',23,1,'spindate button text, <a target=\"blank\" href=\"../createroom.aspx?status=4\" >View page</a>',NULL,'Continue to blind rooms','2013-04-25 18:05:36',4,'המשך לחדרי בליינד דייט','Continue to blind rooms'),(618,'This Coupons is not valid',19,1,'Error message when coupon is not valid - Text',NULL,'This Coupons is not valid','2013-08-05 14:55:45',0,'This Coupons is not valid','This Coupons is not valid'),(619,'premium user',21,3,NULL,NULL,'<div style=\"text-align: left; \">\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 280px; \">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<span style=\"font-size:18px;\"><span style=\"font-family:lightroborto;\">You are a</span> <span style=\"font-family:roboto;\"><span style=\"color: rgb(191, 134, 0);\">Premium Spinner</span></span></span></td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<div>\r\n						&nbsp;</div>\r\n					<div>\r\n						<span style=\"font-size: 11px;\">you have left <u>[[days]] days</u> untill your membership expire.</span></div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-03-20 17:56:49',0,'<div style=\"text-align: left; \">\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 280px; \">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<span style=\"font-size:18px;\"><span style=\"font-family:lightroborto;\">You are a</span> <span style=\"font-family:roboto;\"><span style=\"color: rgb(191, 134, 0);\">Premium Spinner</span></span></span></td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<div>\r\n						&nbsp;</div>\r\n					<div>\r\n						<span style=\"font-size: 11px;\">you have left <u>[[days]] days</u> untill your membership expire.</span></div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','<div style=\"text-align: left; \">\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 280px; \">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<span style=\"font-size:18px;\"><span style=\"font-family:lightroborto;\">You are a</span> <span style=\"font-family:roboto;\"><span style=\"color: rgb(191, 134, 0);\">Premium Spinner</span></span></span></td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<div>\r\n						&nbsp;</div>\r\n					<div>\r\n						<span style=\"font-size: 11px;\">you have left <u>[[days]] days</u> untill your membership expire.</span></div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n'),(620,'Upgrade',21,1,NULL,NULL,'Upgrade','2013-08-07 14:34:05',0,'שידרוג','Upgrade'),(621,'Extend Now',21,1,'main page - Extend now - button text',NULL,'Extend Now','2013-06-24 18:26:57',0,'הרחב עכשיו','Extend Now'),(622,'Guest spinner',21,3,'main page account status Text',NULL,'<div style=\"text-align: left; \">\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 280px; \">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<div>\r\n						<span style=\"font-size:20px;\"><span style=\"font-family:lightroborto;\">you are &nbsp;a</span> <span style=\"font-family:roboto;\"><strong>Guest Spinner</strong></span></span></div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<div>\r\n						&nbsp;</div>\r\n					<div>\r\n						make your self at home and start spinning...</div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-06-06 08:13:00',0,'<div style=\"text-align: left; \">\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 280px; \">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<div>\r\n						<span style=\"font-size:20px;\"><span style=\"font-family:lightroborto;\">you are &nbsp;a</span> <span style=\"font-family:roboto;\"><strong>Guest Spinner</strong></span></span></div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<div>\r\n						&nbsp;</div>\r\n					<div>\r\n						make your self at home and start spinning...</div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','<div style=\"text-align: left; \">\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 280px; \">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<div>\r\n						<span style=\"font-size:20px;\"><span style=\"font-family:lightroborto;\">you are &nbsp;a</span> <span style=\"font-family:roboto;\"><strong>Guest Spinner</strong></span></span></div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<div>\r\n						&nbsp;</div>\r\n					<div>\r\n						make your self at home and start spinning...</div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n'),(623,'Your invitation will expire in 7 days.',21,3,NULL,NULL,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 270px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<div>\r\n						Your invitation will expire in [[days]] days.</div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>','2013-02-21 13:59:36',0,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 270px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<div>\r\n						Your invitation will expire in [[days]] days.</div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n','<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 270px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<div>\r\n						Your invitation will expire in [[days]] days.</div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>'),(624,'Guest spinner2',21,3,NULL,NULL,'<div style=\"text-align: left; \">\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 280px; \">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<div>\r\n						<span style=\"font-size:20px;\"><span style=\"font-family:lightroborto;\">you are &nbsp;a</span> <span style=\"font-family:roboto;\"><strong>Guest Spinner</strong></span></span></div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<div>\r\n						&nbsp;</div>\r\n					<div>\r\n						<span style=\"font-size:11px;\">Make yourself at home and start Spindating...</span></div>\r\n					<div>\r\n						<span style=\"font-size:11px;\">There are<u><strong> [[dates]]&nbsp;Spindate&rsquo;s</strong></u> left to your guest subscription.</span></div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-06-24 18:26:53',0,'<div style=\"text-align: left; \">\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 280px; \">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<div>\r\n						<span style=\"font-size:20px;\"><span style=\"font-family:lightroborto;\">you are &nbsp;a</span> <span style=\"font-family:roboto;\"><strong>Guest Spinner</strong></span></span></div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<div>\r\n						&nbsp;</div>\r\n					<div>\r\n						<span style=\"font-size:11px;\">Make yourself at home and start Spindating...</span></div>\r\n					<div>\r\n						<span style=\"font-size:11px;\">There are<u><strong> [[dates]]&nbsp;Spindate&rsquo;s</strong></u> left to your guest subscription.</span></div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','<div style=\"text-align: left; \">\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 280px; \">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<div>\r\n						<span style=\"font-size:20px;\"><span style=\"font-family:lightroborto;\">you are &nbsp;a</span> <span style=\"font-family:roboto;\"><strong>Guest Spinner</strong></span></span></div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<div>\r\n						&nbsp;</div>\r\n					<div>\r\n						<span style=\"font-size:11px;\">Make yourself at home and start Spindating...</span></div>\r\n					<div>\r\n						<span style=\"font-size:11px;\">There are<u><strong> [[dates]]&nbsp;Spindate&rsquo;s</strong></u> left to your guest subscription.</span></div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n'),(625,'Make sure you join us!',21,3,NULL,NULL,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 270px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<strong>Make sure you join us!</strong></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<div>\r\n						<span style=\"font-size:11px;\">Extend your stay and become a<span style=\"color:#a07826;\"> Premium Spinner</span>.</span></div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-06-24 18:26:57',0,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 270px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<strong>Make sure you join us!</strong></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<div>\r\n						<span style=\"font-size:11px;\">Extend your stay and become a<span style=\"color:#a07826;\"> Premium Spinner</span>.</span></div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 270px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<strong>Make sure you join us!</strong></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<div>\r\n						<span style=\"font-size:11px;\">Extend your stay and become a<span style=\"color:#a07826;\"> Premium Spinner</span>.</span></div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n'),(626,'Awaiting Confirmation',19,1,NULL,NULL,'Awaiting Confirmation','2013-08-05 14:55:45',0,'מחכה לאישור','Awaiting Confirmation'),(627,'Awaiting Confirmation',30,1,NULL,NULL,'Awaiting Confirmation','2013-08-06 11:54:58',0,NULL,'Awaiting Confirmation'),(628,'Confirm Letter [[mylink]],[[myname]],[[mybutton]]',26,3,NULL,NULL,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 800px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					<div>\r\n						<span style=\"font-size:16px;\">Hello &nbsp;,[[myname]]</span></div>\r\n					<div>\r\n						&nbsp;</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					<div>\r\n						<span style=\"font-size:16px;\">please enter here to confirm your new e-mail &nbsp;[[mybutton]]</span></div>\r\n					<div>\r\n						&nbsp;</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					<span style=\"font-size:16px;\">or pass this address to the url :</span></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					<div>\r\n						<span style=\"font-size:16px;\">[&nbsp;[[mylink]]]</span></div>\r\n					<div>\r\n						&nbsp;</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					<div>\r\n						<span style=\"font-size:16px;\">for any problem please contact us in XX-XXXXXXXXXX</span></div>\r\n					<div>\r\n						&nbsp;</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<div style=\"direction: ltr; \">\r\n						<strong><span style=\"font-size:16px;\">spindate team</span></strong></div>\r\n					<div style=\"direction: ltr; \">\r\n						<strong><span style=\"font-size:16px;\">have a spin day</span></strong></div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div style=\"direction: ltr; \">\r\n	&nbsp;</div>\r\n','2013-06-30 18:46:26',0,'','<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 800px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					<div>\r\n						<span style=\"font-size:16px;\">Hello &nbsp;,[[myname]]</span></div>\r\n					<div>\r\n						&nbsp;</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					<div>\r\n						<span style=\"font-size:16px;\">please enter here to confirm your new e-mail &nbsp;[[mybutton]]</span></div>\r\n					<div>\r\n						&nbsp;</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					<span style=\"font-size:16px;\">or pass this address to the url :</span></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					<div>\r\n						<span style=\"font-size:16px;\">[&nbsp;[[mylink]]]</span></div>\r\n					<div>\r\n						&nbsp;</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					<div>\r\n						<span style=\"font-size:16px;\">for any problem please contact us in XX-XXXXXXXXXX</span></div>\r\n					<div>\r\n						&nbsp;</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<div style=\"direction: ltr; \">\r\n						<strong><span style=\"font-size:16px;\">spindate team</span></strong></div>\r\n					<div style=\"direction: ltr; \">\r\n						<strong><span style=\"font-size:16px;\">have a spin day</span></strong></div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div style=\"direction: ltr; \">\r\n	&nbsp;</div>\r\n'),(629,'Varification link was sent to your new email:',20,3,'Enter [[email]] where the user email is,<a target=\"blank\" href=\"../registermsg.aspx?status=10\" >view page </a>',NULL,'<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px; \">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align: middle; text-align: center; \">\r\n				<div>\r\n					<span style=\"font-size:14px;\"><strong>Varification link was sent to your new email:</strong></span></div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align: middle; text-align: center; \">\r\n				<span style=\"font-size:14px;\">[[email]]</span></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-08-05 12:01:16',10,'<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px; \">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align: middle; text-align: center; \">\r\n				<div>\r\n					<span style=\"font-size:14px;\"><strong>קישור אימות נשלח אל המייל שלך:</strong></span></div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align: middle; text-align: center; \">\r\n				<span style=\"font-size:14px;\">[[email]]</span></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div>\r\n	&nbsp;</div>\r\n','<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px; \">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"vertical-align: middle; text-align: center; \">\r\n				<div>\r\n					<span style=\"font-size:14px;\"><strong>Varification link was sent to your new email:</strong></span></div>\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"vertical-align: middle; text-align: center; \">\r\n				<span style=\"font-size:14px;\">[[email]]</span></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<div>\r\n	&nbsp;</div>\r\n'),(630,'Back',20,1,NULL,NULL,'Back','2013-08-05 12:01:16',0,'חזור','Back'),(631,'Your new email is now verified.',20,3,'<a target=\"blank\" href=\"../registermsg.aspx?status=11\" >view page </a>',NULL,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 380px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<span style=\"font-size:14px;\"><strong>Your new email is now verified.</strong></span></td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-06-30 18:47:10',11,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 380px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<span style=\"font-size:14px;\"><strong>הדואר שלך אומת.</strong></span></td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 380px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<span style=\"font-size:14px;\"><strong>Your new email is now verified.</strong></span></td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n'),(632,'Back to lobby',20,1,NULL,NULL,'Back to lobby','2013-06-30 18:47:10',0,'חזור ללובי','Back to lobby'),(633,'Press Here',26,1,NULL,NULL,'Press Here','2013-06-30 18:46:26',0,'','Press Here'),(634,'email confermation, Spindate',26,1,NULL,NULL,'email confermation, Spindate','2013-06-30 18:46:26',0,'','email confermation, Spindate'),(635,'Press Here',19,1,'Registration Email - link to activate account - Text',NULL,'Press Here','2013-08-05 14:56:00',0,'לחץ כאן','Press Here'),(636,'Confirm Letter [[mylink]],[[myname]],[[mybutton]]',19,3,'',NULL,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 800px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					<div>\r\n						<span style=\"font-size:16px;\">Hello &nbsp;,[[myname]]</span></div>\r\n					<div>\r\n						&nbsp;</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					<div>\r\n						<span style=\"font-size:16px;\">please enter here to confirm your new e-mail &nbsp;[[mybutton]]</span></div>\r\n					<div>\r\n						&nbsp;</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					<span style=\"font-size:16px;\">or pass this address to the url :</span></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					<div>\r\n						<span style=\"font-size:16px;\">[&nbsp;[[mylink]]]</span></div>\r\n					<div>\r\n						&nbsp;</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					<div>\r\n						<span style=\"font-size:16px;\">for any problem please contact us in XX-XXXXXXXXXX</span></div>\r\n					<div>\r\n						&nbsp;</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<div style=\"direction: ltr; \">\r\n						<strong><span style=\"font-size:16px;\">spindate team</span></strong></div>\r\n					<div style=\"direction: ltr; \">\r\n						<strong><span style=\"font-size:16px;\">have a spin day</span></strong></div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div style=\"direction: ltr; \">\r\n	&nbsp;</div>\r\n','2013-08-05 14:56:00',0,'','<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 800px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					<div>\r\n						<span style=\"font-size:16px;\">Hello &nbsp;,[[myname]]</span></div>\r\n					<div>\r\n						&nbsp;</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					<div>\r\n						<span style=\"font-size:16px;\">please enter here to confirm your new e-mail &nbsp;[[mybutton]]</span></div>\r\n					<div>\r\n						&nbsp;</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					<span style=\"font-size:16px;\">or pass this address to the url :</span></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					<div>\r\n						<span style=\"font-size:16px;\">[&nbsp;[[mylink]]]</span></div>\r\n					<div>\r\n						&nbsp;</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					<div>\r\n						<span style=\"font-size:16px;\">for any problem please contact us in XX-XXXXXXXXXX</span></div>\r\n					<div>\r\n						&nbsp;</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<div style=\"direction: ltr; \">\r\n						<strong><span style=\"font-size:16px;\">spindate team</span></strong></div>\r\n					<div style=\"direction: ltr; \">\r\n						<strong><span style=\"font-size:16px;\">have a spin day</span></strong></div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div style=\"direction: ltr; \">\r\n	&nbsp;</div>\r\n'),(637,'email confermation, Spindate',19,1,'Register Email - Subject ',NULL,'email confermation, Spindate','2013-08-05 14:56:00',0,'','email confermation, Spindate'),(638,'Press Here',20,1,NULL,NULL,'Press Here','2013-06-23 13:05:28',0,'לחץ כאן','Press Here'),(639,'Confirm Letter [[mylink]],[[myname]],[[mybutton]]',20,3,NULL,NULL,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 800px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					<div>\r\n						<span style=\"font-size:16px;\">Hello &nbsp;,[[myname]]</span></div>\r\n					<div>\r\n						&nbsp;</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					<div>\r\n						<span style=\"font-size:16px;\">please enter here to confirm your new e-mail &nbsp;[[mybutton]]</span></div>\r\n					<div>\r\n						&nbsp;</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					<span style=\"font-size:16px;\">or pass this address to the url :</span></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					<div>\r\n						<span style=\"font-size:16px;\">[&nbsp;[[mylink]]]</span></div>\r\n					<div>\r\n						&nbsp;</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					<div>\r\n						<span style=\"font-size:16px;\">for any problem please contact us in XX-XXXXXXXXXX</span></div>\r\n					<div>\r\n						&nbsp;</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<div style=\"direction: ltr; \">\r\n						<strong><span style=\"font-size:16px;\">spindate team</span></strong></div>\r\n					<div style=\"direction: ltr; \">\r\n						<strong><span style=\"font-size:16px;\">have a spin day</span></strong></div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div style=\"direction: ltr; \">\r\n	&nbsp;</div>\r\n','2013-06-23 13:05:28',0,'','<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 800px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					<div>\r\n						<span style=\"font-size:16px;\">Hello &nbsp;,[[myname]]</span></div>\r\n					<div>\r\n						&nbsp;</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					<div>\r\n						<span style=\"font-size:16px;\">please enter here to confirm your new e-mail &nbsp;[[mybutton]]</span></div>\r\n					<div>\r\n						&nbsp;</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					<span style=\"font-size:16px;\">or pass this address to the url :</span></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					<div>\r\n						<span style=\"font-size:16px;\">[&nbsp;[[mylink]]]</span></div>\r\n					<div>\r\n						&nbsp;</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					<div>\r\n						<span style=\"font-size:16px;\">for any problem please contact us in XX-XXXXXXXXXX</span></div>\r\n					<div>\r\n						&nbsp;</div>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					<div style=\"direction: ltr; \">\r\n						<strong><span style=\"font-size:16px;\">spindate team</span></strong></div>\r\n					<div style=\"direction: ltr; \">\r\n						<strong><span style=\"font-size:16px;\">have a spin day</span></strong></div>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div style=\"direction: ltr; \">\r\n	&nbsp;</div>\r\n'),(640,'email confermation, Spindate',20,1,NULL,NULL,'email confermation, Spindate','2013-06-23 13:05:28',0,'דואר אישור,ספינדייט','email confermation, Spindate'),(641,'about Title',14,1,'SEO Title',NULL,'about Title','2013-07-28 09:35:56',0,'על ספינדייט','about Title'),(642,'about Description',14,1,'SEO Description',NULL,'about Description','2013-07-28 09:35:56',0,'על ספינדייט','about Description'),(643,'about Key Word',14,1,'SEO KeyWord',NULL,'about Key Word','2013-07-28 09:35:56',0,'על ספינדייט','about Key Word'),(644,'Sorry You Donot have dates left for today',23,3,'No Dates Left - popup - Topic Text, <a target=\"blank\" href=\"../createroom.aspx?status=16\" >View page</a>',NULL,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 380px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<span style=\"font-size:14px;\"><strong>Sorry You Do not have dates left for today</strong></span></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					you can check for signig in</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-08-06 17:32:55',16,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 380px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<span style=\"font-size:14px;\"><strong>נגמרו לכם הפגישות להיום</strong></span></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					תבדקו הרשמה ליותר פגישות</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 380px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<span style=\"font-size:14px;\"><strong>Sorry You Do not have dates left for today</strong></span></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					you can check for signig in</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n'),(645,'policy Title',16,1,'SEO title',NULL,'policy Title','2013-07-31 16:20:09',0,'מדיניות','policy Title'),(646,'policy Description',16,1,'SEO description',NULL,'policy Description','2013-07-31 16:20:09',0,'מדיניות','policy Description'),(647,'policy Key Word',16,1,'SEO keyword',NULL,'policy Key Word','2013-07-31 16:20:09',0,'מדיניות','policy Key Word'),(651,'frozen Title',49,1,'SEO title',NULL,'frozen Title','2013-07-21 10:59:49',0,'מוקפא','frozen Title'),(652,'frozen Description',49,1,'SEO Description',NULL,'frozen Description','2013-07-21 10:59:49',0,'מוקפא','frozen Description'),(653,'frozen Key Word',49,1,'SEO Key word',NULL,'frozen Key Word','2013-07-21 10:59:49',0,'מוקפא','frozen Key Word'),(654,'frozen content',49,3,'page content',NULL,'frozen','2013-07-21 10:59:49',0,'<div>\r\n	מוקפא</div>\r\n','frozen'),(655,'[[myname]] is inviting you for a spindate!',23,1,'Room Invitation - friend invited you to room<a target=\"blank\" href=\"../createroom.aspx?status=17&room=0\" >View page</a>',NULL,'[[myname]] is inviting you for a spindate!','2013-08-07 14:35:58',17,'[[myname]] מזמין אותך לספינדייט!','[[myname]] is inviting you for a spindate!'),(656,'[[name]] has just opened a Spinroom,',23,3,'Room Invitation - friend opened a spinroom([[name]] will return the friend name automaticly), <a target=\"blank\" href=\"../createroom.aspx?status=17&room=0\" >View page</a>',NULL,'<div style=\"direction: ltr; \">\r\n	[[name]] has just opened a Spinroom,</div>\r\n<div style=\"direction: ltr; \">\r\n	and it seems like you&rsquo;ve got what [[name]] is looking for!</div>\r\n<div style=\"direction: ltr; \">\r\n	Would you like to join in?</div>\r\n','2013-08-07 14:35:58',17,'','<div style=\"direction: ltr; \">\r\n	[[name]] has just opened a Spinroom,</div>\r\n<div style=\"direction: ltr; \">\r\n	and it seems like you&rsquo;ve got what [[name]] is looking for!</div>\r\n<div style=\"direction: ltr; \">\r\n	Would you like to join in?</div>\r\n'),(657,'Yes, I’m in',23,1,'Room invitation - Yes button = Text, <a target=\"blank\" href=\"../createroom.aspx?status=17&room=0\" >View page</a>',NULL,'Yes, I’m in','2013-08-07 14:35:58',17,'כן,אני בפנים','Yes, I’m in'),(658,'No, thanks',23,1,'Room Invitation - No button - Text, <a target=\"blank\" href=\"../createroom.aspx?status=17&room=0\" >View page</a>',NULL,'No, thanks','2013-08-07 14:35:58',17,'לא,תודה','No, thanks'),(659,'Report',23,1,NULL,NULL,'Report','2013-08-07 14:35:58',0,'דווח','Report'),(660,'Age',34,1,'Room Info - Age Range Header',NULL,'Age:','2013-08-06 17:41:45',0,'גיל','Age:'),(661,'Join',34,1,'Room Join Button - Text',NULL,'Join','2013-08-06 16:34:41',0,'הצטרף','Join'),(662,'From:',34,1,'Room Info - Country Header (From:)',NULL,'From:','2013-08-06 17:41:45',0,'מקום:','From:'),(663,'Spin Rooms',34,1,'Tabs - Spin rooms - Title',NULL,'Spin Rooms','2013-08-06 16:24:56',0,'חדרי ספין','Spin Rooms'),(664,'Blind Rooms',34,1,'Tabs - Blind Rooms - Title',NULL,'Blind Rooms','2013-08-06 16:24:56',0,'חדרי בליינד ','Blind Rooms'),(665,'online',34,1,'Tabs - Online - Title',NULL,'online','2013-08-06 16:24:56',0,'מחובר','online'),(666,'Show',34,1,'Room Type Selector Header',NULL,'Show:','2013-08-06 15:55:52',0,'הצג','Show:'),(667,'male looking to males',34,1,NULL,NULL,'male looking to males','2013-03-07 14:24:41',0,'male looking to males','male looking to males'),(668,'males rooms',34,1,'Male Rooms - Text when HOVERED',NULL,'males rooms','2013-08-06 15:55:52',0,'חדרי גברים','males rooms'),(669,'female rooms',34,1,'Female Rooms - Text when HOVERED',NULL,'female rooms','2013-08-06 15:55:52',0,'חדרי נשים','female rooms'),(670,'male and female rooms',34,1,'Male and Female Rooms - Text when HOVERED',NULL,'male and female rooms','2013-08-06 15:55:52',0,'חדרי נשים גברים','male and female rooms'),(671,'Age:',34,1,'Rooms Age Selector Header',NULL,'Age:','2013-08-06 15:55:52',0,'גיל:','Age:'),(672,'Any',34,1,'Age Selector - \"Any\" age',NULL,'Any','2013-08-06 15:55:52',0,'כל גיל','Any'),(673,'AnyWhere',34,1,'Rooms Country Selector Header',NULL,'AnyWhere','2013-08-06 15:55:52',0,'כל מקום','AnyWhere'),(676,'Header Code System',50,1,NULL,NULL,'Header Code System','2013-03-18 09:01:08',0,NULL,'Header Code System'),(677,'Great! Your BlindDate is about to start soo',35,3,NULL,NULL,'Great! Your BlindDate is about to start soo','2013-03-14 11:29:46',0,'','Great! Your BlindDate is about to start soo'),(678,'You going to whait some time before blindate start',35,3,NULL,NULL,'You going to whait some time before blindate start','2013-07-30 13:39:48',0,'','You going to whait some time before blindate start'),(679,'Date',35,1,NULL,NULL,'Date','2013-07-30 13:39:48',0,'תאריך','Date'),(680,'Select',23,1,'Country & Language - When Adding - Default dropdown value, <a target=\"blank\" href=\"../createroom.aspx?status=1\" >View page</a>',NULL,'Select','2013-08-07 14:35:46',1,'בחר','Select'),(681,'Chat',23,1,'Technology Option - Chat - TEXT, <a target=\"blank\" href=\"../createroom.aspx?status=1\" >View page</a>',NULL,'Chat','2013-08-07 14:35:45',1,'צאט','Chat'),(682,'Chat&Video',23,1,'Technology Option - Chat & Video - TEXT, <a target=\"blank\" href=\"../createroom.aspx?status=1\" >View page</a>',NULL,'Chat&Video','2013-08-07 14:35:45',1,'צאט&וידיאו','Chat&Video'),(683,'Male',23,1,' Gender Selector - Male Option - Text, <a target=\"blank\" href=\"../createroom.aspx?status=1\" >View page</a>',NULL,'Male','2013-08-07 14:35:45',1,'גברים','Male'),(684,'Female',23,1,'Gender Selector - Female Option - Text, <a target=\"blank\" href=\"../createroom.aspx?status=1\" >View page</a>',NULL,'Female','2013-08-07 13:49:39',1,'נשים','Female'),(685,'Male and Female',23,1,'Gender Selector - last Option - Text (male & female), <a target=\"blank\" href=\"../createroom.aspx?status=1\" >View page</a>',NULL,'Male and Female','2013-07-29 14:18:28',1,'נשים וגברים','Male and Female'),(686,'male rooms',22,1,NULL,NULL,'male rooms','2013-08-07 14:34:47',0,'חדרי גברים','male rooms'),(687,'female rooms',22,1,NULL,NULL,'female rooms','2013-08-07 14:34:47',0,'חדרי נשים','female rooms'),(688,'male&female rooms',22,1,NULL,NULL,'male&female rooms','2013-08-07 14:34:47',0,'חדרי נשים&גברים','male&female rooms'),(693,'Advanced Filter',23,1,'room filter header, <a target=\"blank\" href=\"../createroom.aspx?status=10\" >View page</a>',NULL,'Advanced Filter','2013-08-06 17:31:39',10,'חיפוש מתקדם','Advanced Filter'),(694,'Approve',23,1,'Approve button - Text, <a target=\"blank\" href=\"../createroom.aspx?status=10\" >View page</a>',NULL,'Approve','2013-08-06 17:32:08',10,'אישור','Approve'),(695,'Can’t find a spindate room? Join now to a Blindate',22,3,NULL,NULL,'<div>\r\n	<strong>Can&rsquo;t find a spindate room?</strong> Join now to a Blindate room below!</div>\r\n','2013-08-06 17:41:45',0,'לא יכול למצוא חדרי ספינדייט? הצטרף לבלינדדייט','Can’t find a spindate room? Join now to a Blindate room below!'),(696,'Show',22,1,NULL,NULL,'Show:','2013-08-07 14:34:47',0,'הצג','Show:'),(697,'Any',22,1,NULL,NULL,'Any','2013-08-07 14:34:47',0,'כולם','Any'),(698,'AnyWhere',22,1,NULL,NULL,'AnyWhere','2013-08-07 14:34:47',0,'כל מקום','AnyWhere'),(700,'You can\'\'t join to another room while the room yo',23,3,'Error popup - cant join another room while your room is still running - Centent Text, <a target=\"blank\" href=\"../createroom.aspx?status=19\" >View page</a>',NULL,'<div>\r\n	<div>\r\n		&nbsp;</div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<span style=\"font-size:14px;\">Joining <strong>[[name]]&#39;s</strong> room will automatically cancel yours!</span></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					You can&#39;t join to another room while the room your open is still running..</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n','2013-08-07 13:46:07',19,'<div>\r\n	<div>\r\n		&nbsp;</div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<strong>הופס!</strong></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					אינך יכול להצטרף לחדר כאשר יש לך חדר פעיל.</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','<div>\n	<div>		&nbsp;</div>\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\n		<tbody>\n			<tr>\n				<td style=\"text-align: center; vertical-align: middle;\">\n					<strong>Oops!</strong></td>\n			</tr>\n			<tr>\n				<td style=\"text-align: center; vertical-align: middle;\">\n					You Cant join another room while the room you have opened is still running.</td>\n			</tr>\n		</tbody>\n	</table>\n</div>\n'),(701,'Close',23,1,NULL,NULL,'Close','2013-08-07 14:35:58',1,'סגור','Close'),(702,'Continue to lobby',23,1,'Continue to Lobby button - Text, <a target=\"blank\" href=\"../createroom.aspx?status=4\" >View page</a>',NULL,'Continue to lobby','2013-08-07 14:35:52',4,'המשך ללובי','Continue to lobby'),(703,'empty',22,1,NULL,NULL,'empty','2013-08-07 14:35:52',0,'ריק','empty'),(704,'Back to lobby',23,1,'back to Lobby Button - text, <a target=\"blank\" href=\"../createroom.aspx?status=5\" >View page</a>',NULL,'Back to lobby','2013-04-14 17:22:13',5,'חזרה ללובי','Back to lobby'),(705,NULL,NULL,1,'',NULL,NULL,NULL,0,NULL,NULL),(706,'Great! Your first date is about to start',35,3,NULL,NULL,'<div>\r\n	<div>\r\n		&nbsp;</div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 550px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<strong>Great! </strong>Your Spindate with <strong>[[name]]&nbsp;</strong>is about to start soon...</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					&nbsp;</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-08-07 14:37:29',0,'','<div>\r\n	<div>\r\n		&nbsp;</div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 550px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<strong>Great! </strong>Your Spindate with <strong>[[name]]&nbsp;</strong>is about to start soon...</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					&nbsp;</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n'),(709,'Great! Your Spindate with [[number]],[[name]],[[ti',35,3,NULL,NULL,'<div>\r\n	<div>\r\n		&nbsp;</div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 550px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<strong>Great! </strong>Your Spindate with <strong>[[name]]&nbsp;</strong>is about to start soon...</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					But, you are [[number]]&rsquo;nd in the list, that means you have to wait [[time]] minutes untill your date will start</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-08-07 14:37:29',0,'','<div>\r\n	<div>\r\n		&nbsp;</div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 550px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td>\r\n					<strong>Great! </strong>Your Spindate with <strong>[[name]]&nbsp;</strong>is about to start soon...</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					But, you are [[number]]&rsquo;nd in the list, that means you have to wait [[time]] minutes untill your date will start</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n'),(710,'System Notification: One of the participants ha',35,3,NULL,NULL,'<div style=\"direction: ltr; \">\r\n	<strong>System Notification: </strong>One of the participants has just left the date with [[name]], so you can precede your turn in [[diff]] minutes, and instead of waiting [[time]] minutes, you will wait only &nbsp;[[newtime]] minutes.</div>\r\n','2013-08-06 14:47:55',0,'','<div style=\"direction: ltr; \">\r\n	<strong>System Notification: </strong>One of the participants has just left the date with [[name]], so you can precede your turn in [[datetime]] minutes, and instead of waiting [[time]] minutes, you will wait only &nbsp;[[newtime]] minutes.</div>\r\n'),(711,'Unsubscribe me',26,1,'Account Settings - acocunt info - unsubscribe me button - Text',NULL,'Unsubscribe me','2013-08-07 11:49:09',0,'הסר אותי','Unsubscribe me'),(712,'Are you positively sure you want out?',20,3,' <a target=\"blank\" href=\"../registermsg.aspx?status=12\" >view page </a>',NULL,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 480px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<strong><span style=\"font-size:14px;\">Are you positively sure you want out?</span></strong></td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-07-23 11:12:18',12,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 480px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<strong><span style=\"font-size:14px;\">האם אתה בטוח שאתה רוצה לעזוב?</span></strong></td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 480px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<strong><span style=\"font-size:14px;\">Are you positively sure you want out?</span></strong></td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n'),(713,'Pressing YES will permanently delete all your info',20,3,'<a target=\"blank\" href=\"../registermsg.aspx?status=12\" >view page </a>',NULL,'<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	(Pressing <strong>YES </strong>will permanently delete all your info and provide you with no refund!)</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-07-23 11:12:18',12,'<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	(לחיצה על <strong>כן </strong>תמחק את כל הנתונים ואין החזרים!)</div>\r\n<div>\r\n	&nbsp;</div>\r\n','<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	(Pressing <strong>YES </strong>will permanently delete all your info and provide you with no refund!)</div>\r\n<div>\r\n	&nbsp;</div>\r\n'),(714,'Cancel12',20,1,'<a target=\"blank\" href=\"../registermsg.aspx?status=12\" >view page </a>',NULL,'Cancel','2013-07-23 11:12:18',12,'בטל','Cancel'),(715,'Yes12',20,1,'<a target=\"blank\" href=\"../registermsg.aspx?status=12\" >view page </a>',NULL,'Yes','2013-07-23 11:12:18',12,'כן','Yes'),(717,'You have permanently deleted your account on Spind',40,3,'<a target=\"blank\" href=\"../windows.aspx?status=10&isedit=2\" >View page</a>',NULL,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle; height: 30px;\">\r\n					<span style=\"font-size:14px;\">You have permanently deleted your account on Spindate.</span></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<span style=\"font-size:12px;\">Wait a few moments, we&#39;ll send you to our home page.</span></td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-07-21 11:35:39',10,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle; height: 30px;\">\r\n					<span style=\"font-size:14px;\">מחקת את עצמך לצמיתות מספנדייט.</span></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<span style=\"font-size:12px;\">חכה מספר רגעים ותחזור לדף כניסה.</span></td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle; height: 30px;\">\r\n					<span style=\"font-size:14px;\">You have permanently deleted your account on Spindate.</span></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<span style=\"font-size:12px;\">Wait a few moments, we&#39;ll send you to our home page.</span></td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n'),(718,'Register Title2',19,1,'SEO title',NULL,'Register Title2','2013-08-05 14:56:07',2,'','Register Title2'),(719,'Register Description2',19,1,'SEO description',NULL,'Register Description2','2013-08-05 14:56:07',2,'','Register Description2'),(720,'Register Key Word2',19,1,'SEO keyword',NULL,'Register Key Word2','2013-08-05 14:56:07',2,'','Register Key Word2'),(721,'Resend Mail3',20,1,'<a target=\"blank\" href=\"../registermsg.aspx?status=3\" >view page </a>',NULL,'Resend Mail','2013-06-13 16:44:07',3,'שלח שוב','Resend Mail'),(722,'Edit E-Mail Address3',20,1,'<a target=\"blank\" href=\"../registermsg.aspx?status=3\" >view page </a>',NULL,'Edit E-Mail Address','2013-06-13 16:44:07',3,'ערוך אימייל','Edit E-Mail Address'),(723,'Start',23,1,'Join Room popup - Start button - Text, <a target=\"blank\" href=\"../createroom.aspx?status=6\" >View page</a>',NULL,'Start','2013-08-06 17:30:42',6,'התחל','Start'),(724,'No8',23,1,'Expel popup - No button - Text, <a target=\"blank\" href=\"../createroom.aspx?status=8\" >View page</a>',NULL,'No','2013-08-06 17:43:21',8,'לא','No'),(725,'Yes8',23,1,'Expel popup - Yes button - Text, <a target=\"blank\" href=\"../createroom.aspx?status=8\" >View page</a>',NULL,'Yes','2013-08-06 17:43:21',8,'כן','Yes'),(726,'No9',23,1,'Leave Room popup - No button - Text, <a target=\"blank\" href=\"../createroom.aspx?status=9\" >View page</a>',NULL,'No','2013-08-07 13:48:20',9,'לא','No'),(727,'Yes9',23,1,'Leave Room popup - Yes button - Text, <a target=\"blank\" href=\"../createroom.aspx?status=9\" >View page</a>',NULL,'Yes','2013-08-07 13:48:20',9,'כן','Yes'),(728,'Continue to lobby11',23,1,'Joined Room popup - Continue to lobby button - Text, <a target=\"blank\" href=\"../createroom.aspx?status=11\" >View page</a>',NULL,'Continue to lobby','2013-08-06 17:31:58',11,'המשך ללובי','Continue to lobby'),(729,'Advanced Filter12',23,1,'Online Filter - Title text, <a target=\"blank\" href=\"../createroom.aspx?status=12\" >View page</a>',NULL,'Advanced Filter','2013-08-06 17:32:08',12,'סינון מתקדם','Advanced Filter'),(730,'Add Range:',23,1,'Online FIlter - Add age range - Text<a target=\"blank\" href=\"../createroom.aspx?status=12\" >View page</a>',NULL,'Add Range:','2013-08-06 17:32:08',12,'הוסף טווח:','Add Range:'),(731,'Advanced Filter2',23,1,NULL,NULL,'Advanced Filter2','2013-04-14 16:32:39',12,NULL,'Advanced Filter2'),(732,'Advanced Filter13',23,1,' Advanced Filter - Title<a target=\"blank\" href=\"../createroom.aspx?status=13\" >View page</a>',NULL,'Advanced Filter','2013-08-06 17:32:17',13,'סינון מתקדם','Advanced Filter'),(733,'Women',29,1,'profile Tye text - woman',NULL,'Women','2013-08-06 11:44:59',0,'נשים','Women'),(734,'Back to Blind rooms',23,1,'Unavailable Room popup - back to blind rooms button - Text, <a target=\"blank\" href=\"../createroom.aspx?status=14\" >View page</a>',NULL,'Back to Blind rooms','2013-08-06 17:32:25',14,'חזור לפגישות עיוורות','Back to Blind rooms'),(736,'Message sent To [[name]]5',40,3,'mail sent to Contact -  content (put [[name]] to automatically get the recipient\'s name), <a target=\"blank\" href=\"../windows.aspx?status=5\" >View page</a>',NULL,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 380px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle; height: 40px;\">\r\n					<span style=\"font-size:14px;\">Message sent To <strong>[[name]]</strong></span></td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-08-06 11:45:41',5,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 380px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle; height: 40px;\">\r\n					<span style=\"font-size:14px;\">הודעה נשלחה אל &nbsp;<strong>[[name]]</strong></span></td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 380px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle; height: 40px;\">\r\n					<span style=\"font-size:14px;\">Message sent To <strong>[[name]]</strong></span></td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n'),(737,'No1',40,1,'Report person popup - No button - Text, <a target=\"blank\" href=\"../windows.aspx?status=1\" >View page</a>',NULL,'No','2013-08-06 18:10:38',1,'לא','No'),(738,'Yes1',40,1,'Report person popup - Yes button - Text, <a target=\"blank\" href=\"../windows.aspx?status=1\" >View page</a>',NULL,'Yes','2013-08-06 18:10:38',1,'כן','Yes'),(739,NULL,NULL,1,'<a target=\"blank\" href=\"../windows.aspx?status=5\" >View page</a>',NULL,NULL,NULL,0,NULL,NULL),(740,'Cancel2',40,1,'Cancel button Text, <a target=\"blank\" href=\"../windows.aspx?status=2\" >View page</a>',NULL,'Cancel','2013-07-22 09:12:25',2,'בטל','Cancel'),(741,'[[name]] invites you to a video chat...',40,1,'text to show when someone inviting YOU to a video chat, put [[name]] to automatically get the real username.<a target=\"blank\" href=\"../windows.aspx?status=3\" >View page</a>',NULL,'[[name]] invites you to a video chat...','2013-07-17 09:16:51',3,'[[name]] מזמין אותך לוידיאו צאט...','[[name]] invites you to a video chat...'),(742,'Ignore3',40,1,'Ignore button - Text inside button, <a target=\"blank\" href=\"../windows.aspx?status=3\" >View page</a>',NULL,'Ignore','2013-07-17 09:16:51',3,'ההתעלם','Ignore'),(743,'Accept3',40,1,'accept button - Text inside button, <a target=\"blank\" href=\"../windows.aspx?status=3\" >View page</a>',NULL,'Accept','2013-07-17 09:16:51',3,'קבל','Accept'),(744,'Cancel6',40,1,'window to see when inviting someone for a chat - cancel button - Text<a target=\"blank\" href=\"../windows.aspx?status=6\" >View page</a>',NULL,'Cancel','2013-07-15 16:52:43',6,'בטל','Cancel'),(745,'Ignore7',40,1,'window to see when you being invited to chat - ignore button text, <a target=\"blank\" href=\"../windows.aspx?status=7\" >View page</a>',NULL,'Ignore','2013-07-17 09:16:10',7,'התעלם','Ignore'),(746,'Accept7',40,1,'window to see when you being invited to chat - accept button text, <a target=\"blank\" href=\"../windows.aspx?status=7\" >View page</a>',NULL,'Accept','2013-07-17 09:16:10',7,'קבל','Accept'),(747,'[[name]] has decline your invitation.',40,1,' window to see when user DECLINE your invitation Text, [[name]] will be replaced automaticly with the real username. <a target=\"blank\" href=\"../windows.aspx?status=9\" >View page</a>',NULL,'[[name]] has decline your invitation.','2013-07-17 14:20:12',9,' קיבלת דחייה של ההזמנה מ[[name]]','[[name]] has decline your invitation.'),(748,'You can open only 4 chat In parallel',40,3,NULL,NULL,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle; height: 30px;\">\r\n					<span style=\"font-size:14px;\">You can open only <strong>4</strong> chat in parallel.</span></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					&nbsp;</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-07-11 11:00:55',11,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle; height: 30px;\">\r\n					<span style=\"font-size:14px;\">ניתן לפתוח עד <strong>4</strong> שיחות במקביל.</span></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					&nbsp;</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle; height: 30px;\">\r\n					<span style=\"font-size:14px;\">You can open only <strong>4</strong> chat in parallel.</span></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					&nbsp;</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n'),(752,'Profile of -',1,1,NULL,NULL,'Profile of -','2013-08-06 11:44:59',0,'פרופיל של','Profile of -'),(753,'Bottom Code System',1,1,NULL,NULL,'','2013-08-07 14:34:03',0,'',''),(754,'Header Code System',1,1,NULL,NULL,'','2013-08-07 14:34:03',0,'',''),(755,'Age:',21,1,NULL,NULL,'Age:','2013-08-07 14:34:06',0,'גיל:','Age:'),(756,'From:',21,1,NULL,NULL,'From:','2013-08-07 14:34:06',0,'מקום:','From:'),(757,'Bottom Code Site',1,1,NULL,NULL,'','2013-08-06 12:03:09',0,'',''),(758,'Header Code Site',1,3,NULL,NULL,'','2013-08-06 12:03:09',0,'',''),(759,'Alt Logo',1,1,NULL,NULL,'Alt Logo','2013-08-06 12:03:08',0,'ספינדייט','Alt Logo'),(760,'Enter Valid Birthday Date',1,1,NULL,NULL,'Enter Valid Birthday Date','2013-08-06 12:03:08',0,'הכנס תאריך יומהולדת','Enter Valid Birthday Date'),(761,'Write your Message...',46,1,'message watermark',NULL,'Write your Message...','2013-08-06 11:55:45',0,NULL,'Write your Message...'),(762,'Subject ...',46,1,'title header watermark',NULL,'Subject ...','2013-08-06 11:55:45',0,NULL,'Subject ...'),(763,'Cancel',46,1,'Cancel button - Text',NULL,'Cancel','2013-08-06 11:55:45',0,NULL,'Cancel'),(764,'Send',46,1,'Send button - Text',NULL,'Send','2013-08-06 11:55:45',0,NULL,'Send'),(765,'Subject is Required',46,1,'alert missing subject',NULL,'Subject is Required','2013-08-06 11:55:45',0,NULL,'Subject is Required'),(766,'Content is Required',46,1,'alert content missing',NULL,'Content is Required','2013-08-06 11:55:45',0,NULL,'Content is Required'),(767,'Send Message to [[name]]',46,1,'window header',NULL,'Send Message to [[name]]','2013-08-06 11:55:45',0,NULL,'Send Message to [[name]]'),(768,'You  have been favourite by [[name]]',27,1,'message your recive after he/she got Favorited',NULL,'You have been favourited by [[name]]','2013-05-19 10:52:26',0,NULL,'You  have been favourite by [[name]]'),(769,'Favourite content [[name]]',27,3,NULL,NULL,'Favourite content [[name]]','2013-05-19 10:52:26',0,NULL,'Favourite content [[name]]'),(770,'Continue to blind rooms15',23,1,'Blindroom popup - after joining - Continue to blind rooms Button - Text<a target=\"blank\" href=\"../createroom.aspx?status=15\" >View page</a>',NULL,'Continue to blind rooms','2013-08-06 17:32:47',15,'המשך לחדר בליינדדייט','Continue to blind rooms'),(771,'Paypal',28,1,'Send Gift window - Button Text - Charging company (Paypal)',NULL,'Paypal','2013-08-06 11:45:55',0,'פייפל','Paypal'),(772,'Lobby',22,1,NULL,NULL,'Lobby','2013-08-07 14:34:47',0,NULL,NULL),(773,'Your date is left',35,3,NULL,NULL,'Your date is left','2013-05-08 10:09:59',0,'',NULL),(774,'You have [[time]] minutes to decide if you like Em',36,1,NULL,NULL,'You have [[time]] minutes to decide if you like Emma or not.','2013-05-13 10:32:49',0,'יש לך [[time]] דקות להחליט',NULL),(775,'([[number]]’st date of [[from]])',36,1,NULL,NULL,'([[number]]’st date of [[from]])','2013-08-07 14:38:30',0,'([[number]] של פגישות מתוך [[from]])',NULL),(776,'אלט ךוגו',1,1,NULL,NULL,'אלט ךוגו','2013-05-07 10:38:19',0,'אלט ךוגו',NULL),(777,'[[name]] as left the room',51,1,NULL,NULL,'[[name]] as left the room','2013-05-07 17:21:03',0,NULL,NULL),(778,'[[name]] has close the room,take your chance in ot',51,1,NULL,NULL,'[[name]] has close the room,take your chance in other rooms','2013-05-08 18:16:53',0,NULL,NULL),(779,'[[name]] has left the room',51,1,NULL,NULL,'[[name]] has left the room','2013-05-08 18:15:50',0,NULL,NULL),(780,'Cancel',35,1,NULL,NULL,'Cancel','2013-08-07 14:37:29',0,'בטל',NULL),(781,'[[name]] has precede the date',51,3,NULL,NULL,'[[name]] has precede the date','2013-05-08 17:22:15',0,NULL,NULL),(782,'[[name]] has left the room',35,1,NULL,NULL,'[[name]] has left the room [[time]]','2013-08-07 13:48:23',0,'[[name]] עזבו את החדר',NULL),(783,'[[name]] has close the room,take your chance in ot',35,1,NULL,NULL,'[[name]] has close the room,take your chance in other rooms','2013-08-07 11:56:34',0,'[[name]] סגרו את החדר , נשא לבדוק חדרים אחרים',NULL),(784,'[[name]] has precede the date',35,3,NULL,NULL,'[[name]] has precede the date','2013-08-06 14:48:08',0,'',NULL),(785,'You going to whait some time before [[name]] [[tim',35,3,NULL,NULL,'You going to whait some time before [[name]] [[time]]','2013-05-09 10:31:38',0,'',NULL),(786,'[[name]] has left the room [[time]]',35,1,NULL,NULL,'[[name]] has left the room [[time]]','2013-05-09 10:36:27',0,'',NULL),(787,'Are you sure you want to leave the chat?',23,3,'are you sure you want to leave chat - Content',NULL,'<div>\r\n	<br />\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 380px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<span style=\"font-size:14px;\">Are you sure you want to leave the chat?</span></td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-08-07 13:51:27',21,NULL,NULL),(788,'Are you sure you want to skip this chat?',23,3,'Are you sure you want to skip chat - Content',NULL,'<div>\r\n	<br />\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 380px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<span style=\"font-size:14px;\">Are you sure you want to skip this chat?</span></td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-08-06 14:18:44',22,NULL,NULL),(789,'Follow us',1,1,NULL,NULL,'Follow us','2013-06-03 09:51:01',0,'עקוב אחרינו',NULL),(790,'You have [[time]] minutes to decide if you like [[',36,1,NULL,NULL,'You have [[time]] minutes to decide if you like [[name]] or not.','2013-08-07 14:38:29',0,NULL,NULL),(791,'oh! You favour [[name]] but your date didnt add yo',37,1,'message on spin report when the favour the date but the date didnt ',NULL,'oh! You favour [[name]] but your date didnt add you.','2013-07-17 18:31:39',0,'הו הוספת את  [[name]] למועדפים אבל ללא תגובה.',NULL),(792,'[[name]] has cancel the invitation.',40,1,' window to see when user DECLINE your invitation Text, [[name]] will be replaced automaticly with the real username., ',NULL,'[[name]] has cancel the invitation.','2013-07-17 14:20:09',9,NULL,NULL),(793,'Your Online date is about to start',35,3,NULL,NULL,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 550px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"direction: ltr; vertical-align: bottom; height: 40px;\">\r\n					<span style=\"font-size:14px;\">Your<strong> Online</strong> date is about to start</span></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"direction: ltr; \">\r\n					enjoy the date</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-08-06 18:09:00',0,'',NULL),(794,'System notifiation:[[name]] has left the date!',36,3,NULL,NULL,'<div style=\"direction: ltr; \">\r\n	<strong>System notifiation:</strong>[[name]] has left the date!</div>\r\n','2013-08-07 14:38:30',0,NULL,NULL),(795,'You  have been favourite by [[name]]',36,1,NULL,NULL,'You  have been favourite by [[name]]','2013-08-07 09:16:16',0,NULL,NULL),(796,'Favourite content [[name]]',36,3,NULL,NULL,'Favourite content [[name]]','2013-08-07 09:16:16',0,NULL,NULL),(797,'Your next date has left the room',35,1,NULL,NULL,'Your next date has left the room','2013-07-30 13:39:59',0,'',NULL),(798,'Emma is not available right now.',40,3,NULL,NULL,'Emma is not available right now.','2013-05-22 10:32:26',12,NULL,NULL),(799,'[[name]] is not available right now.',40,3,NULL,NULL,'<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"direction: ltr; width: 280px;\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"direction: ltr; \">\r\n				<span style=\"color:#4175af;\">[[name]] </span>is not available right now.</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<span style=\"color:#666666;\"><span style=\"font-size: 12px;\">Try again later...</span></span></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n','2013-08-06 18:09:00',12,NULL,NULL),(800,'You have been favourite by [[name]]',36,1,NULL,NULL,'You have been favourite by [[name]]','2013-06-03 10:35:44',0,NULL,NULL),(801,'Take the SpinTour',21,1,NULL,NULL,'Take the SpinTour','2013-08-07 14:34:05',0,'כך סיור בספידייט',NULL),(802,'Youtube',21,1,NULL,NULL,'Youtube','2013-08-07 14:34:05',0,'ייוטיוב',NULL),(803,'http://www.youtube.com/',21,1,NULL,NULL,'http://www.youtube.com/','2013-08-07 14:34:05',0,'http://www.youtube.com/',NULL),(804,'Twitter',21,1,NULL,NULL,'Twitter','2013-08-07 14:34:05',0,'טוויטר',NULL),(805,'https://twitter.com/',21,1,NULL,NULL,'https://twitter.com/','2013-08-07 14:34:05',0,'https://twitter.com/',NULL),(806,'Facebook',21,1,NULL,NULL,'Facebook','2013-08-07 14:34:05',0,'פייסבוק',NULL),(807,'https://www.facebook.com/',21,1,NULL,NULL,'https://www.facebook.com/','2013-08-07 14:34:05',0,'https://www.facebook.com/',NULL),(808,'online title',31,1,NULL,NULL,'online title','2013-08-07 14:34:03',0,NULL,NULL),(809,'Close',54,1,NULL,NULL,'Close','2013-08-06 11:55:08',0,NULL,NULL),(810,'Photo Cut',54,1,NULL,NULL,'Photo Cut','2013-08-06 11:55:08',0,NULL,NULL),(811,'Save',54,1,NULL,NULL,'Save','2013-08-06 11:55:08',0,NULL,NULL),(812,'Cancel',54,1,NULL,NULL,'Cancel','2013-08-06 11:55:08',0,NULL,NULL),(813,'Edit picture',30,1,NULL,NULL,'Edit picture','2013-08-06 11:54:59',0,NULL,NULL),(814,'Age:',52,1,NULL,NULL,'Age:','2013-08-06 11:44:35',0,NULL,NULL),(815,'From:',52,1,NULL,NULL,'From:','2013-08-06 11:44:35',0,NULL,NULL),(816,'Close',52,1,NULL,NULL,'Close','2013-08-06 11:44:35',0,NULL,NULL),(817,'Video',52,1,NULL,NULL,'Video','2013-08-06 11:44:35',0,NULL,NULL),(818,'Chat',52,1,NULL,NULL,'Chat','2013-08-06 11:44:35',0,NULL,NULL),(819,'About me',52,1,NULL,NULL,'About me','2013-08-06 11:44:35',0,NULL,NULL),(820,'Looking for',52,1,NULL,NULL,'Looking for','2013-08-06 11:44:35',0,NULL,NULL),(821,'Lobby title',22,1,NULL,NULL,'Lobby title','2013-08-07 14:34:47',0,NULL,NULL),(822,'Looking for:',26,1,NULL,NULL,'Looking for:','2013-08-07 11:49:08',0,NULL,NULL),(823,'Go to Start',53,1,NULL,NULL,'Go to Start','2013-07-09 17:19:34',0,NULL,NULL),(824,'Follow us',21,1,NULL,NULL,'Follow us','2013-08-07 14:34:05',0,'עקוב אחרינו',NULL),(825,'Need help?',21,1,NULL,NULL,'Need help?','2013-08-07 14:34:05',0,'צריך עזרה?',NULL),(826,'Get unlimited dates and make deeper connections3',42,1,'meet people text',NULL,'Get unlimited dates and make deeper connections','2013-08-05 14:03:33',0,NULL,NULL),(827,'Get unlimited dates and make deeper connections4',42,1,'privecy text',NULL,'Get unlimited dates and make deeper connections','2013-08-05 14:03:33',0,NULL,NULL),(828,'Don\'\'t forget the gift!!!',28,1,NULL,NULL,'Don\'\'t forget the gift!!!','2013-08-06 11:45:55',0,NULL,NULL),(829,'No online\'\'s match your room, you can change the r',23,3,NULL,NULL,'No online\'\'s match your room, you can change the room setting and try again','2013-08-06 11:25:57',0,NULL,NULL),(830,'Data saved succefully',26,1,NULL,NULL,'Data saved succefully','2013-08-07 11:49:10',0,NULL,NULL),(831,'SignIn by facebook',2,1,NULL,NULL,'SignIn by facebook','2013-08-06 12:03:08',0,NULL,NULL),(832,'SignIn by google',2,1,NULL,NULL,'SignIn by google','2013-08-06 12:03:08',0,NULL,NULL),(833,'Please type your password and confirm our terms an',2,1,NULL,NULL,'Please type your password and confirm our terms and conditions before you start Spindating.','2013-06-30 14:48:53',0,NULL,NULL),(834,'Load facebook profile image',19,1,NULL,NULL,'Load facebook profile image','2013-08-05 14:55:45',0,'טען תמונת פייסבוק',NULL),(835,'My alerts',21,1,NULL,NULL,'My alerts','2013-08-07 14:34:03',0,NULL,NULL),(836,'My inbox',21,1,NULL,NULL,'My inbox','2013-08-07 14:34:03',0,NULL,NULL),(837,'help center',21,1,NULL,NULL,'help center','2013-08-07 14:34:04',0,NULL,NULL),(838,'My setting',21,1,NULL,NULL,'My setting','2013-08-07 14:34:04',0,NULL,NULL),(839,'Logout',21,1,NULL,NULL,'Logout','2013-08-07 14:34:04',0,NULL,NULL),(840,'Letter for unconform image',21,3,NULL,NULL,'Letter for unconform image','2013-06-10 16:55:09',0,NULL,NULL),(841,'email from spindate',21,1,NULL,NULL,'email from spindate','2013-06-10 16:55:09',0,NULL,NULL),(842,'Go To Lobby',21,1,NULL,NULL,'Go To Lobby','2013-08-07 14:34:03',0,NULL,NULL),(843,'Go To Profile',21,1,NULL,NULL,'Go To Profile','2013-08-07 14:34:03',0,NULL,NULL),(844,'Go To Lobby',21,1,NULL,NULL,'Go To Lobby','2013-08-07 14:34:03',0,NULL,NULL),(845,'Go To Favourites',21,1,NULL,NULL,'Go To Favourites','2013-08-07 14:34:03',0,NULL,NULL),(846,'Spindate',21,1,NULL,NULL,'Spindate','2013-08-07 14:34:03',0,NULL,NULL),(847,'Show terms',2,1,NULL,NULL,'Show terms','2013-08-06 12:03:10',0,NULL,NULL),(848,'Go to About Us',21,1,NULL,NULL,'Go to About Us','2013-08-07 14:34:06',0,NULL,NULL),(849,'Go to Terms of Service',21,1,NULL,NULL,'Go to Terms of Service','2013-08-07 14:34:06',0,NULL,NULL),(850,'Go to Privacy Policy',21,1,NULL,NULL,'Go to Privacy Policy','2013-08-07 14:34:06',0,NULL,NULL),(851,'Go to Blog',21,1,NULL,NULL,'Go to Blog','2013-08-07 14:34:06',0,NULL,NULL),(852,'Go to Help & FAQ',21,1,NULL,NULL,'Go to Help & FAQ','2013-08-07 14:34:06',0,NULL,NULL),(853,'Send us message',21,1,NULL,NULL,'Send us message','2013-08-07 14:34:06',0,NULL,NULL),(854,'Get password',2,1,NULL,NULL,'Get password','2013-08-06 12:03:10',0,NULL,NULL),(855,'Submit 4',20,1,NULL,NULL,'Submit 4','2013-07-03 13:06:06',4,NULL,NULL),(856,'Cancel 4',20,1,NULL,NULL,'Cancel 4','2013-07-03 13:06:06',4,NULL,NULL),(857,'Search now',17,1,NULL,NULL,'Search now','2013-07-31 16:20:10',0,NULL,NULL),(858,'Go Tto blog',17,1,NULL,NULL,'Go Tto blog','2013-07-31 16:20:10',0,NULL,NULL),(859,'Watch News',17,1,NULL,NULL,'Watch News','2013-06-13 13:01:24',0,NULL,NULL),(860,'Go to Support main',18,1,NULL,NULL,'Go to Support main','2013-07-28 10:06:58',0,NULL,NULL),(861,'Go to my profile',21,1,NULL,NULL,'Go to my profile','2013-08-07 14:34:05',0,NULL,NULL),(862,'Show room details',22,1,NULL,NULL,'Show room details','2013-08-07 14:35:52',0,NULL,NULL),(863,'Go to blindate',22,1,NULL,NULL,'Go to blindate','2013-08-06 17:41:45',0,NULL,NULL),(864,'Close window',42,1,NULL,NULL,'Close window','2013-08-05 14:03:33',0,NULL,NULL),(865,'go to profile',24,1,NULL,NULL,'go to profile','2013-08-06 16:03:54',0,NULL,NULL),(866,'Add Smilly',24,1,NULL,NULL,'Add Smilly','2013-08-06 16:03:54',0,NULL,NULL),(867,'Select Favourite!!!',24,1,NULL,NULL,'Select Favourite!!!','2013-08-07 13:44:18',0,NULL,NULL),(868,'close',25,1,NULL,NULL,'close','2013-08-07 14:36:54',0,NULL,NULL),(869,'select alert!!!',25,1,NULL,NULL,'select alert!!!','2013-08-07 14:36:54',0,NULL,NULL),(870,'Enter Password at least 6 chars (numbers and engli',26,1,NULL,NULL,'Enter Password at least 6 chars (numbers and english chars)','2013-08-07 11:49:06',0,NULL,NULL),(871,'My Blind Rooms',34,1,NULL,NULL,'My Blind Rooms','2013-08-06 15:55:52',0,NULL,NULL),(872,'A Full list',22,1,NULL,NULL,'A Full list','2013-08-06 17:41:45',0,NULL,NULL),(873,'Join Emma’s room',23,1,NULL,NULL,'Join Emma’s room','2013-06-26 10:18:28',19,NULL,NULL),(874,'Continue to my room',23,1,NULL,NULL,'Continue to my room','2013-08-07 13:46:07',19,NULL,NULL),(875,'Join [[name]]’s room',23,1,NULL,NULL,'Join [[name]]’s room','2013-08-07 13:46:07',19,NULL,NULL),(876,'Twitter',2,1,NULL,NULL,'Twitter','2013-08-06 12:03:10',0,NULL,NULL),(877,'SignIn by twitter',2,1,NULL,NULL,'SignIn by twitter','2013-08-06 12:03:08',0,NULL,NULL),(878,'male',19,1,NULL,NULL,'male','2013-08-05 14:55:44',0,'זכר',NULL),(879,'female',19,1,NULL,NULL,'female','2013-08-05 14:55:44',0,'נקבה',NULL),(880,'looking for males',19,1,NULL,NULL,'looking for males','2013-08-05 14:55:44',0,'מחפש גברים',NULL),(881,'looking for females',19,1,NULL,NULL,'looking for females','2013-08-05 14:55:44',0,'מחפש נשים',NULL),(882,'looking for males&females',19,1,NULL,NULL,'looking for males&females','2013-08-05 14:55:44',0,'מחפש גברים ונשים',NULL),(883,'First Name',19,1,NULL,NULL,'First Name','2013-08-05 14:55:44',0,'שם פרטי',NULL),(884,'Enter First Name',19,1,NULL,NULL,'Enter First Name','2013-08-05 14:55:44',0,'הכנס שם פרטי',NULL),(885,'Last Name',19,1,NULL,NULL,'Last Name','2013-08-05 14:55:44',0,'שם משפחה',NULL),(886,'Enter Last Name',19,1,NULL,NULL,'Enter Last Name','2013-08-05 14:55:44',0,'הכנס שם משפחה',NULL),(887,'e-mail',19,1,NULL,NULL,'e-mail','2013-08-05 14:55:44',0,'דואר אלקטרוני',NULL),(888,'Enter e-mail',19,1,NULL,NULL,'Enter e-mail','2013-08-05 14:55:44',0,'הכנס מייל',NULL),(889,'Enter Valid e-mail',19,1,NULL,NULL,'Enter Valid e-mail','2013-08-05 14:55:44',0,'הכנס מייל תקין',NULL),(890,'Password',19,1,NULL,NULL,'Password','2013-08-05 14:55:44',0,'סיסמה',NULL),(891,'Enter Password',19,1,NULL,NULL,'Enter Password','2013-08-05 14:55:44',0,'הכנס סיסמה',NULL),(892,'Enter Password at least 6 chars (numbers and engli',19,1,NULL,NULL,'Enter Password at least 6 chars (numbers and english chars)','2013-08-05 14:55:44',0,'',NULL),(893,'Confirm the term of servise',19,1,NULL,NULL,'Confirm the term of servise','2013-08-05 14:55:44',0,'',NULL),(894,'Email Exists',19,1,NULL,NULL,'Email Exists','2013-08-05 14:55:44',0,'',NULL),(895,'SignIn',19,1,NULL,NULL,'SignIn','2013-08-05 14:55:44',0,'',NULL),(896,'Day',19,1,NULL,NULL,'Day','2013-08-05 14:55:44',0,'',NULL),(897,'Month',19,1,NULL,NULL,'Month','2013-08-05 14:55:45',0,'',NULL),(898,'Year',19,1,NULL,NULL,'Year','2013-08-05 14:55:45',0,'',NULL),(899,'If You allready have a spindate account please fil',1,1,NULL,NULL,'If You allready have a spindate account please fill your email&password and press on the login button!','2013-07-09 09:41:07',0,NULL,NULL),(900,'If You allready have a spindate account please fil',19,1,NULL,NULL,'If You allready have a spindate account please fill your email & password and press on the login button!','2013-07-18 12:29:35',0,'',NULL),(901,'This account isn\'\'t lissted',19,1,NULL,NULL,'This account isn\'\'t lissted','2013-08-05 14:55:45',0,'',NULL),(902,'Restart',53,1,NULL,NULL,'Restart','2013-08-05 14:56:29',0,NULL,NULL),(903,'Prev',53,1,NULL,NULL,'Prev','2013-08-05 14:56:29',0,NULL,NULL),(904,'Next',53,1,NULL,NULL,'Next','2013-08-05 14:56:29',0,NULL,NULL),(905,'Indulge me',53,1,NULL,NULL,'Indulge me','2013-08-05 14:56:29',0,NULL,NULL),(906,'I can do it',53,1,NULL,NULL,'I can do it','2013-08-05 14:56:30',0,NULL,NULL),(907,'Don’t open this tutorial again, please.',53,1,NULL,NULL,'Don’t open this tutorial again, please.','2013-08-05 14:56:29',0,NULL,NULL),(908,'End tutorial',53,1,NULL,NULL,'End tutorial','2013-08-05 14:56:30',0,NULL,NULL),(909,'Done!',53,1,NULL,NULL,'Done!','2013-08-05 14:56:29',0,NULL,NULL),(910,'Via:',22,1,NULL,NULL,'Via:','2013-08-07 14:34:47',0,NULL,NULL),(911,'Inviting [[name]] to a video chat...',21,1,NULL,NULL,'Inviting [[name]] to a video chat...','2013-08-07 14:34:07',0,NULL,NULL),(912,'Inviting [[name]] to a chat...',21,1,NULL,NULL,'Inviting [[name]] to a chat...','2013-08-07 14:34:07',0,NULL,NULL),(913,'[[name]] invites you to a chat...',21,1,NULL,NULL,'[[name]] invites you to a chat...','2013-08-07 14:34:07',0,NULL,NULL),(914,'[[name]] invites you to a video chat...',21,1,NULL,NULL,'[[name]] invites you to a video chat...','2013-08-07 14:34:07',0,NULL,NULL),(915,'Accept',21,1,NULL,NULL,'Accept','2013-08-07 14:34:07',0,NULL,NULL),(916,'Not Now',21,1,NULL,NULL,'Not Now','2013-08-07 14:34:07',0,NULL,NULL),(917,'Report',21,1,NULL,NULL,'Report','2013-08-07 14:34:07',0,NULL,NULL),(918,'Cancel',21,1,NULL,NULL,'Cancel','2013-08-07 14:34:07',0,NULL,NULL),(919,'By clicking \'\'Not now\'\' the caller see you\'\'re una',21,1,NULL,NULL,'By clicking \'\'Not now\'\' the caller see you\'\'re unavailable.','2013-08-07 14:34:07',0,NULL,NULL),(920,'By clicking \'\'Not now\'\' the caller see you\'\'re una',21,1,NULL,NULL,'By clicking \'\'Not now\'\' the caller see you\'\'re unavailable.','2013-08-07 14:34:07',0,NULL,NULL),(921,'Back to Spin rooms',23,1,NULL,NULL,'Back to Spin rooms','2013-08-07 11:33:08',14,NULL,NULL),(922,'Oops Can join',40,3,NULL,NULL,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 400px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle; height: 30px;\">\r\n					<strong><span style=\"font-size: 14px;\">Oops!</span></strong></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					you cann&#39;t open room with opens invitation or opened rooms</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-08-06 15:12:06',13,NULL,NULL),(923,'No double window',55,3,NULL,NULL,'<div>\r\n	<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 500px;\">\r\n		<tbody>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					<strong>No double window!</strong></td>\r\n			</tr>\r\n			<tr>\r\n				<td style=\"text-align: center; vertical-align: middle;\">\r\n					You can be only in one windows of spindate&nbsp;</td>\r\n			</tr>\r\n			<tr>\r\n				<td>\r\n					&nbsp;</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','2013-08-07 14:28:48',0,NULL,NULL),(924,'Profile',27,1,NULL,NULL,'Profile','2013-08-07 13:37:44',0,NULL,NULL),(925,'Invite your friends to Spindate',21,1,NULL,NULL,'Invite your friends to Spindate','2013-08-07 14:34:05',0,NULL,NULL),(926,'Invite',21,1,NULL,NULL,'Invite','2013-08-07 14:34:05',0,NULL,NULL),(927,'Please enter freind email and Send:',20,3,NULL,NULL,'Please enter freind email and Send:','2013-08-05 13:43:39',13,NULL,NULL),(928,'Share',20,1,NULL,NULL,'Share','2013-08-05 13:43:39',0,NULL,NULL),(929,'Freind name',20,1,NULL,NULL,'Freind name','2013-08-05 12:15:14',13,NULL,NULL),(930,'Freind email',20,1,NULL,NULL,'Freind email','2013-08-05 12:15:14',13,NULL,NULL),(931,'Friend name',20,1,NULL,NULL,'Friend name','2013-08-05 13:43:39',13,NULL,NULL),(932,'Friend email',20,1,NULL,NULL,'Friend email','2013-08-05 13:43:39',13,NULL,NULL),(933,'Send share mail to [[name]]',20,3,NULL,NULL,'Send share mail to [[name]]','2013-08-05 13:43:46',13,NULL,NULL),(934,'Send mail topic to [[name]]',20,1,NULL,NULL,'Send mail topic to [[name]]','2013-08-05 13:43:46',13,NULL,NULL),(935,'Enter name',20,1,NULL,NULL,'Enter name','2013-08-05 13:43:39',13,NULL,NULL),(936,'Enter email',20,1,NULL,NULL,'Enter email','2013-08-05 13:43:39',13,NULL,NULL),(937,'Email is not iscurrect format',20,1,NULL,NULL,'Email is not iscurrect format','2013-08-05 12:33:03',13,NULL,NULL),(938,'Email is not in currect format',20,1,NULL,NULL,'Email is not in currect format','2013-08-05 13:43:39',13,NULL,NULL),(939,'You been expled from the room',23,3,NULL,NULL,'You been expled from the room','2013-08-06 18:05:10',24,NULL,NULL),(940,'Go to lobby',23,1,NULL,NULL,'Go to lobby','2013-08-06 18:05:10',24,NULL,NULL);
/*!40000 ALTER TABLE `langtext2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `LangID` int(11) NOT NULL AUTO_INCREMENT,
  `LangCode` varchar(45) DEFAULT NULL,
  `LangName` varchar(45) DEFAULT NULL,
  `LandDir` varchar(45) DEFAULT 'ltr',
  `LangIcon` varchar(100) DEFAULT NULL,
  `LangCulture` varchar(45) DEFAULT NULL,
  `GoogleClientID` varchar(100) DEFAULT NULL,
  `GoogleSecret` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`LangID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'eng','english','ltr',NULL,'en-US','182289962199-ekjt437q7ud8b6mss7v3446p9nocip9l.apps.googleusercontent.com','e_P6Tyh1qS-44csJKrug2vzf'),(3,NULL,'Hebrew','rtl',NULL,'he-IL','182289962199-9pm52fqkig9ag6kergqf7oh6vrninj50.apps.googleusercontent.com','MQZWQ6HakYob6JimrUv8kMSI'),(4,NULL,'spanish','ltr',NULL,'es-ES',NULL,NULL);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mydropdownvalues`
--

DROP TABLE IF EXISTS `mydropdownvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mydropdownvalues` (
  `idmydropdownvalues` int(11) NOT NULL AUTO_INCREMENT,
  `dropfieldValue` varchar(255) DEFAULT NULL,
  `showfield` tinyint(1) DEFAULT NULL,
  `1` varchar(255) DEFAULT NULL,
  `3` varchar(255) DEFAULT NULL,
  `listid` int(11) DEFAULT NULL,
  `4` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`idmydropdownvalues`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mydropdownvalues`
--

LOCK TABLES `mydropdownvalues` WRITE;
/*!40000 ALTER TABLE `mydropdownvalues` DISABLE KEYS */;
INSERT INTO `mydropdownvalues` VALUES (1,'Single',1,'Single','רווק',1,'Single'),(2,'Currently separated',1,'Currently separated','פרוד',1,'Currently separated'),(3,'Divorced',1,'Divorced','גרוש',1,'Divorced'),(4,'Widow/ widower',1,'Widow/ widower','אלמן/אלמנה',1,'Widow/ widower'),(5,'Straight',1,'Straight','סטרייט',2,'Straight'),(6,'Gay',1,'Gay','הומוסקסואל',2,'Gay'),(7,'Bi-sexual',1,'Bi-sexual','בי-סקסואל',2,'Bi-sexual'),(8,'No answer',1,'No answer','אין תשובה',3,'No answer'),(9,'Black',1,'Black','שחור',3,'Black'),(10,'Blonde',1,'Blonde',NULL,3,'Blonde'),(11,'Light brown',1,'Light brown','חום בהיר',3,'Light brown'),(12,'Dark brown',1,'Dark brown','חום כהה',3,'Dark brown'),(13,'Red',1,'Red',NULL,3,'Red'),(14,'Gray',1,'Gray','אפור',3,'Gray'),(15,'Salt & Pepper',1,'Salt & Pepper',NULL,3,'Salt & Pepper'),(16,'Bald',1,'Bald',NULL,3,'Bald'),(17,'No answer',1,'No answer',NULL,4,'No answer'),(18,'Black',1,'Black',NULL,4,'Black'),(19,'Brown',1,'Brown',NULL,4,'Brown'),(20,'Gray',1,'Gray',NULL,4,'Gray'),(21,'Green',1,'Green',NULL,4,'Green'),(22,'Hazel',1,'Hazel',NULL,4,'Hazel'),(23,'<139',1,'<139',NULL,5,'<139'),(24,'140',1,'140','140',5,'140'),(25,'141',1,'141','141',5,'141'),(26,'142',1,'142','142',5,'142'),(27,'143',1,'143','143',5,'143'),(28,'144',1,'144','144',5,'144'),(29,'145',1,'145','145',5,'145'),(30,'146',1,'146','146',5,'146'),(31,'147',1,'147','147',5,'147'),(32,'148',1,'148','148',5,'148'),(33,'149',1,'149','149',5,'149'),(34,'150',1,'150','150',5,'150'),(35,'151',1,'151','151',5,'151'),(36,'152',1,'152','152',5,'152'),(37,'153',1,'153','153',5,'153'),(38,'154',1,'154','154',5,'154'),(39,'155',1,'155','155',5,'155'),(40,'156',1,'156','156',5,'156'),(41,'157',1,'157','157',5,'157'),(42,'158',1,'158','158',5,'158'),(43,'159',1,'159','159',5,'159'),(44,'160',1,'160','160',5,'160'),(45,'161',1,'161','161',5,'161'),(46,'162',1,'162','162',5,'162'),(47,'163',1,'163','163',5,'163'),(48,'164',1,'164','164',5,'164'),(49,'165',1,'165','165',5,'165'),(50,'166',1,'166','166',5,'166'),(51,'167',1,'167','167',5,'167'),(52,'168',1,'168','168',5,'168'),(53,'169',1,'169','169',5,'169'),(54,'170',1,'170','170',5,'170'),(55,'171',1,'171','171',5,'171'),(56,'172',1,'172','172',5,'172'),(57,'173',1,'173','173',5,'173'),(58,'174',1,'174','174',5,'174'),(59,'175',1,'175','175',5,'175'),(60,'176',1,'176','176',5,'176'),(61,'177',1,'177','177',5,'177'),(62,'178',1,'178','178',5,'178'),(63,'179',1,'179','179',5,'179'),(64,'180',1,'180','180',5,'180'),(65,'181',1,'181','181',5,'181'),(66,'182',1,'182','182',5,'182'),(67,'183',1,'183','183',5,'183'),(68,'184',1,'184','184',5,'184'),(69,'185',1,'185','185',5,'185'),(70,'186',1,'186','186',5,'186'),(71,'187',1,'187','187',5,'187'),(72,'188',1,'188','188',5,'188'),(73,'189',1,'189','189',5,'189'),(74,'190',1,'190','190',5,'190'),(75,'191',1,'191','191',5,'191'),(76,'192',1,'192','192',5,'192'),(77,'193',1,'193','193',5,'193'),(78,'194',1,'194','194',5,'194'),(79,'195',1,'195','195',5,'195'),(80,'196',1,'196','196',5,'196'),(81,'197',1,'197','197',5,'197'),(82,'198',1,'198','198',5,'198'),(83,'199',1,'199','199',5,'199'),(84,'200',1,'200','200',5,'200'),(85,'201',1,'201','201',5,'201'),(86,'202',1,'202','202',5,'202'),(87,'203',1,'203','203',5,'203'),(88,'204',1,'204','204',5,'204'),(89,'205',1,'205','205',5,'205'),(90,'206',1,'206','206',5,'206'),(91,'207',1,'207','207',5,'207'),(92,'208',1,'208','208',5,'208'),(93,'209',1,'209','209',5,'209'),(94,'210',1,'210','210',5,'210'),(95,'211',1,'211','211',5,'211'),(96,'212',1,'212','212',5,'212'),(97,'213',1,'213','213',5,'213'),(98,'214',1,'214','214',5,'214'),(99,'215',1,'215','215',5,'215'),(100,'216',1,'216','216',5,'216'),(101,'217',1,'217','217',5,'217'),(102,'218',1,'218','218',5,'218'),(103,'219',1,'219','219',5,'219'),(104,'No answer',1,'No answer',NULL,6,'No answer'),(105,'Slender',1,'Slender',NULL,6,'Slender'),(106,'Big & Beautiful',1,'Big & Beautiful',NULL,6,'Big & Beautiful'),(107,'Curvy',1,'Curvy',NULL,6,'Curvy'),(108,'About average',1,'About average',NULL,6,'About average'),(109,'Athletic & toned',1,'Athletic & toned',NULL,6,'Athletic & toned'),(110,'Full figured',1,'Full figured',NULL,6,'Full figured'),(111,'Heavy set',1,'Heavy set',NULL,6,'Heavy set'),(112,'A few extra pounds',1,'A few extra pounds',NULL,6,'A few extra pounds'),(113,'Stocky',1,'Stocky',NULL,6,'Stocky'),(114,'With parents',1,'With parents',NULL,7,'With parents'),(115,'With roommate',1,'With roommate',NULL,7,'With roommate'),(116,'Student residence',1,'Student residence',NULL,7,'Student residence'),(117,'With partner',1,'With partner',NULL,7,'With partner'),(118,'Alone',1,'Alone',NULL,7,'Alone'),(119,'No answer',1,'No answer',NULL,8,'No answer'),(120,'No',1,'No',NULL,8,'No'),(121,'Yes, and they stay with me sometimes',1,'Yes, and they stay with me sometimes',NULL,8,'Yes, and they stay with me sometimes'),(122,'Yes, and they live away from home',1,'Yes, and they live away from home',NULL,8,'Yes, and they live away from home'),(123,'Yes, and they live with me',1,'Yes, and they live with me',NULL,8,'Yes, and they live with me'),(124,'No answer',1,'No answer',NULL,9,'No answer'),(125,'No way',1,'No way',NULL,9,'No way'),(126,'Occasionally',1,'Occasionally',NULL,9,'Occasionally'),(127,'Daily',1,'Daily',NULL,9,'Daily'),(128,'Yes, but I’m trying to quit',1,'Yes, but I’m trying to quit',NULL,9,'Yes, but I’m trying to quit'),(129,'Cigar aficionado',1,'Cigar aficionado',NULL,9,'Cigar aficionado'),(130,'No answer',1,'No answer',NULL,10,'No answer'),(131,'Social drinker',1,'Social drinker',NULL,10,'Social drinker'),(132,'Regularly',1,'Regularly',NULL,10,'Regularly'),(133,'Moderately',1,'Moderately',NULL,10,'Moderately'),(134,'No answer',1,'No answer',NULL,11,'No answer'),(135,'Asian',1,'Asian',NULL,11,'Asian'),(136,'Black',1,'Black',NULL,11,'Black'),(137,'Latino/ Hispanic',1,'Latino/ Hispanic',NULL,11,'Latino/ Hispanic'),(138,'Middle eastern',1,'Middle eastern',NULL,11,'Middle eastern'),(139,'Native American',1,'Native American',NULL,11,'Native American'),(140,'Pacific islander',1,'Pacific islander',NULL,11,'Pacific islander'),(141,'White/ Caucasian',1,'White/ Caucasian',NULL,11,'White/ Caucasian'),(142,'Other',1,'Other',NULL,11,'Other'),(143,'No answer',1,'No answer',NULL,12,'No answer'),(144,'High school',1,'High school',NULL,12,'High school'),(145,'Some college',1,'Some college',NULL,12,'Some college'),(146,'Associated degree',1,'Associated degree',NULL,12,'Associated degree'),(147,'Bachelor’s degree',1,'Bachelor’s degree',NULL,12,'Bachelor’s degree'),(148,'Graduate degree',1,'Graduate degree',NULL,12,'Graduate degree'),(149,'PhD/ Post-doctoral',1,'PhD/ Post-doctoral',NULL,12,'PhD/ Post-doctoral');
/*!40000 ALTER TABLE `mydropdownvalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mysitedropdown`
--

DROP TABLE IF EXISTS `mysitedropdown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mysitedropdown` (
  `idmysitedropdown` int(11) NOT NULL AUTO_INCREMENT,
  `dropdownname` varchar(255) DEFAULT NULL,
  `showdropdown` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idmysitedropdown`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mysitedropdown`
--

LOCK TABLES `mysitedropdown` WRITE;
/*!40000 ALTER TABLE `mysitedropdown` DISABLE KEYS */;
INSERT INTO `mysitedropdown` VALUES (1,'relationship ',1),(2,'sexuality',1),(3,'hair color',1),(4,'Eye color',1),(5,'Height(cm)',1),(6,'Body type',1),(7,'Living ',1),(8,'Children ',1),(9,'Smoking',1),(10,'Do you drink?',1),(11,'Ethnicity',1),(12,'Education',1);
/*!40000 ALTER TABLE `mysitedropdown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `PageID` int(11) NOT NULL AUTO_INCREMENT,
  `PageName` varchar(255) DEFAULT NULL,
  `PageURL` varchar(255) DEFAULT NULL,
  `PageTitle` varchar(255) DEFAULT NULL,
  `PageSEODesc` varchar(255) DEFAULT NULL,
  `PageOrder` int(11) DEFAULT NULL,
  `IsPageOnMainMenu` tinyint(1) DEFAULT '0',
  `PageParent` int(11) DEFAULT NULL,
  `PageDescription` longtext,
  `PageHeader` varchar(255) DEFAULT NULL,
  `PageContent` longtext,
  `PageKeyWords` text,
  `PageIsDel` tinyint(1) DEFAULT NULL,
  `IsChild` tinyint(1) DEFAULT NULL,
  `lang` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`PageID`),
  KEY `PageIsDel` (`PageIsDel`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Subscribes','','Subscribes','Subscribes',7,1,0,'<img alt=\"\" src=\"/templatesite.co.il/uploads/images/banner-up.png\" style=\"width: 810px; height: 192px; \" /><br />\r\n','Subscribes','','',0,0,'heb'),(3,'Contact Us','contact.aspx','Contact Us','Contact Us',2,1,1,'דף 2','Contact Us','','',0,0,'heb'),(11,'Support','helpcenter.aspx','Support','Support',8,1,1,NULL,'Support','','',0,0,'heb'),(12,'About Us','about.aspx','About Us','About Us',9,1,1,NULL,'About Us','','',0,0,'heb'),(17,'thanks for subscribing','EndRegister.aspx','thanks for subscribing','thanks for subscribing',10,0,1,NULL,'thanks for subscribing','','',0,0,'heb'),(18,'הרשמה שלב 2','Register2.aspx','הרשמה שלב 2','הרשמה שלב 2',11,0,1,NULL,'הרשמה שלב 2','','',0,0,'heb'),(19,'Send Gift','SendGift.aspx','Send Gift','Send Gift',12,0,1,NULL,'Send Gift','Send Gift','',0,0,'heb'),(20,'get gift','getgift.aspx','get gift','get gift',13,0,1,NULL,'get gift','get gift','',0,0,'heb'),(21,'select plan','selectplane.aspx','select plan','select plan',14,0,1,NULL,'select plan','select plan','',0,0,'heb'),(22,'setting','\"setting.aspx','setting','setting',15,0,1,NULL,'setting','setting','',0,0,'heb'),(23,'mail alert','mailalert.aspx','mail alert','mail alert',16,0,1,NULL,'mail alert','mail alert','',0,0,'heb'),(24,'my profile','myprofile.aspx','my profile','my profile',17,0,1,NULL,'my profile','my profile','my profile',0,0,'heb'),(25,'edit Images','loadimages.aspx','edit Images','edit Images',18,0,1,NULL,'edit Images','','edit Images',0,0,'heb'),(26,'alerts','alerts.aspx','alerts','alerts',19,0,1,NULL,'alerts','','',0,0,'heb'),(27,'Inbox','inbox.aspx','Inbox','Inbox',20,0,1,NULL,'Inbox','','Inbox',0,0,'heb'),(28,'blindate','blindate.aspx','blindate','blindate',21,0,1,NULL,'blindate','','',0,0,'heb'),(29,'Favouites','favourites.aspx','favorites','favorites',22,0,1,NULL,'Favouites','','',0,0,'heb'),(30,'Online','online.aspx','Online','Online',23,0,1,NULL,'Online','','',0,0,'heb'),(33,'Blog','blog.aspx','blog','blog',24,1,1,NULL,'Blog','','blog',0,0,'heb'),(34,'תצוגת תמונות','showinages.aspx','תצוגת תמונות','תצוגת תמונות',25,0,1,NULL,'תצוגת תמונות','','',0,0,'heb'),(35,'lobby','lobby.aspx','דף לובי','דף לובי',26,0,1,NULL,'lobby','','',0,0,'heb'),(36,'Regulations','regulations.aspx','Regulations','Regulations',27,0,1,NULL,'Regulations','','',0,0,'heb'),(37,'maintenance','maintenance.aspx','maintenance','maintenance',28,0,1,NULL,'maintenance','','',0,0,'heb'),(38,'terms of service','termsofservice.aspx','termsofservice','termsofservice',29,0,1,NULL,'terms of service','','',0,0,'heb'),(39,'affiliate','affiliate.aspx','affiliate','affiliate',30,0,1,NULL,'affiliate','','',0,0,'heb'),(40,'page404','page404.aspx','page404','page404',31,0,1,NULL,'page404','','',0,0,'heb'),(41,'construction','construction.aspx','construction','construction',32,0,1,NULL,'construction','','',0,0,'heb'),(42,'instruction','instruction.aspx','instruction','instruction',33,1,1,NULL,'instruction','instruction','',0,0,'heb'),(43,'Sign Up','register.aspx','Sign Up','Sign Up',34,1,1,NULL,'Sign Up','','Sign Up',0,0,'heb');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages2`
--

DROP TABLE IF EXISTS `pages2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages2` (
  `pageid` int(11) NOT NULL AUTO_INCREMENT,
  `pagename` varchar(45) NOT NULL,
  `pagecomment` text,
  PRIMARY KEY (`pageid`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages2`
--

LOCK TABLES `pages2` WRITE;
/*!40000 ALTER TABLE `pages2` DISABLE KEYS */;
INSERT INTO `pages2` VALUES (1,'general',NULL),(2,'default','home page'),(14,'about','about us '),(15,'termsofservice','term of service'),(16,'policy',NULL),(17,'blog','blog\'s pages'),(18,'helpcenter','help & faq pages'),(19,'register','second phase of registeration'),(20,'registermsg','windows/alerts in login,signin '),(21,'master','general text over all page in spin date system'),(22,'lobby',NULL),(23,'createroom','windows/alerts in lobby,blinddate,online '),(24,'inbox',NULL),(25,'alerts',NULL),(26,'setting','all setting '),(27,'favourites',NULL),(28,'gift',NULL),(29,'profile','profile & history'),(30,'images',NULL),(31,'online',NULL),(32,'filenotfound',NULL),(33,'errorpage',NULL),(34,'blindroom',NULL),(35,'waitingwin','waiting room before start spinning'),(36,'chat','video and regular chat(on date)'),(37,'spindatereport','after spindate or blinddate report & and report/block'),(38,'contact',NULL),(40,'windows','windows in spindate system'),(42,'subscribe',NULL),(46,'sendmsg',NULL),(49,'frozen',NULL),(50,'general3',NULL),(52,'onlineshow',NULL),(53,'guide',NULL),(54,'editimage',NULL),(55,'outfromdate',NULL);
/*!40000 ALTER TABLE `pages2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programs`
--

DROP TABLE IF EXISTS `programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programs` (
  `progid` int(11) NOT NULL AUTO_INCREMENT,
  `progName` varchar(110) DEFAULT NULL,
  `progLong` int(11) DEFAULT NULL,
  `progSaveText` varchar(45) DEFAULT NULL,
  `progComment` varchar(255) DEFAULT NULL,
  `progPricePerMonth` double DEFAULT NULL,
  `IsBest` tinyint(1) DEFAULT NULL,
  `1` varchar(255) DEFAULT NULL,
  `comment1` varchar(255) DEFAULT NULL,
  `3` varchar(255) DEFAULT NULL,
  `comment3` varchar(255) DEFAULT NULL,
  `5` varchar(255) DEFAULT NULL,
  `comment5` varchar(255) DEFAULT NULL,
  `7` varchar(255) DEFAULT NULL,
  `comment7` varchar(255) DEFAULT NULL,
  `4` varchar(255) DEFAULT NULL,
  `comment4` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`progid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs`
--

LOCK TABLES `programs` WRITE;
/*!40000 ALTER TABLE `programs` DISABLE KEYS */;
INSERT INTO `programs` VALUES (1,'prog 1',12,'Save 60%','one easy payment of 150 $',24.99,1,'Save 60%','One easy payment of 150$','חסוך 40%','תשלום יחיד של 150$','Save 60%','one easy payment of 150 $','Save 60%','one easy payment of 150 $','Save 60%','one easy payment of 150 $'),(2,'prog 2',6,'Save 60%','one easy payment of 150 $',28.99,0,'30%','One easy payment of 150$','חסוך 40%','תשלום יחיד של 150$','Save 60%','one easy payment of 150 $','Save 60%','one easy payment of 150 $','Save 60%','one easy payment of 150 $'),(3,'prog 3',12,'Save 60%','one easy payment of 150 $',24.99,0,NULL,NULL,NULL,NULL,'Save 60%','one easy payment of 150 $','Save 60%','one easy payment of 150 $','Save 60%','one easy payment of 150 $'),(4,'prog 4',12,'Save 60%','one easy payment of 150 $',24.99,0,'sad as dasd as dasd ','as da da sdas',NULL,NULL,'Save 60%','one easy payment of 150 $','Save 60%','one easy payment of 150 $','Save 60%','one easy payment of 150 $'),(5,'prog 5',9,NULL,NULL,35.99,0,'Save 30%','is a good plan',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `programs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommadations`
--

DROP TABLE IF EXISTS `recommadations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recommadations` (
  `recoid` int(11) NOT NULL AUTO_INCREMENT,
  `recoName` varchar(210) DEFAULT NULL,
  `recoShortText` text,
  `recoContent` text,
  `ShowReco` tinyint(1) DEFAULT NULL,
  `recoOrder` int(11) DEFAULT NULL,
  `recoImage` varchar(210) DEFAULT NULL,
  `recoMovie` varchar(210) DEFAULT NULL,
  `EnlargeImage` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`recoid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommadations`
--

LOCK TABLES `recommadations` WRITE;
/*!40000 ALTER TABLE `recommadations` DISABLE KEYS */;
INSERT INTO `recommadations` VALUES (1,'sadasd sdsadas','asdasd','שלום',1,1,'aSS','AsAS',1),(2,'דגשדג','דשגשדגדש','שדגשדגשדג&nbsp;<br />\r\nשדגשדגשדג<br />\r\nשדגשדגשדג',1,NULL,'../images/RecoImages/e6162ea7-f077-441f-ae19-60195b002c81_tn.jpg','',1);
/*!40000 ALTER TABLE `recommadations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roomenvi`
--

DROP TABLE IF EXISTS `roomenvi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roomenvi` (
  `idroomenvi` int(11) NOT NULL AUTO_INCREMENT,
  `environame` varchar(90) DEFAULT NULL,
  `1` varchar(90) DEFAULT NULL,
  `3` varchar(90) DEFAULT NULL,
  `4` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`idroomenvi`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roomenvi`
--

LOCK TABLES `roomenvi` WRITE;
/*!40000 ALTER TABLE `roomenvi` DISABLE KEYS */;
INSERT INTO `roomenvi` VALUES (1,'Bar','Bar','בר','Bar'),(2,'Beach','Beach','חוף','Beach'),(3,'resturant','resturant','מסעדה','resturant');
/*!40000 ALTER TABLE `roomenvi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitenews`
--

DROP TABLE IF EXISTS `sitenews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitenews` (
  `idsitenews` int(11) NOT NULL AUTO_INCREMENT,
  `newsline` varchar(255) DEFAULT NULL,
  `shownews` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idsitenews`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitenews`
--

LOCK TABLES `sitenews` WRITE;
/*!40000 ALTER TABLE `sitenews` DISABLE KEYS */;
/*!40000 ALTER TABLE `sitenews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sitepages`
--

DROP TABLE IF EXISTS `sitepages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitepages` (
  `PageID` int(11) NOT NULL AUTO_INCREMENT,
  `PageName` varchar(255) DEFAULT NULL,
  `PageURL` varchar(255) DEFAULT NULL,
  `PageTitle` varchar(255) DEFAULT NULL,
  `PageSEODesc` varchar(255) DEFAULT NULL,
  `PageOrder` int(11) DEFAULT NULL,
  `IsPageOnMainMenu` tinyint(1) DEFAULT '0',
  `PageParent` int(11) DEFAULT NULL,
  `PageDescription` longtext,
  `PageHeader` varchar(255) DEFAULT NULL,
  `PageContent` longtext,
  `PageKeyWords` text,
  `PageIsDel` tinyint(1) DEFAULT NULL,
  `IsChild` tinyint(1) DEFAULT NULL,
  `lang` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`PageID`),
  KEY `PageIsDel` (`PageIsDel`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sitepages`
--

LOCK TABLES `sitepages` WRITE;
/*!40000 ALTER TABLE `sitepages` DISABLE KEYS */;
INSERT INTO `sitepages` VALUES (31,'דף הבית','?IntPage=31','דף הבית','דף הבית',1,1,1,NULL,'דף הבית','דף הבית','דף הבית',0,0,'heb'),(32,'אודותינו','about.aspx','אודותינו','אודותינו',2,1,1,NULL,'אודותינו','','אודותינו',0,0,'heb'),(33,'contact','contact.aspx','contact','contact',3,1,1,NULL,'contact','contact','contact',0,0,'heb');
/*!40000 ALTER TABLE `sitepages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `states` (
  `stateid` int(11) NOT NULL AUTO_INCREMENT,
  `stateNameeng` varchar(45) DEFAULT NULL,
  `stateCode` varchar(5) DEFAULT NULL,
  `ShowState` tinyint(1) DEFAULT '1',
  `1` varchar(45) DEFAULT NULL,
  `3` varchar(45) DEFAULT NULL,
  `4` varchar(90) DEFAULT NULL,
  PRIMARY KEY (`stateid`),
  KEY `setting1` (`ShowState`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'Alabama','AL',1,'Alabama','אלבמה','Alabama'),(2,'Alaska','AK',1,'Alaska','אלסקה','Alaska'),(3,'Arizona','AZ',1,'Arizona','אריזונה','Arizona'),(4,'Arkansas','AR',1,'Arkansas','Arkansas','Arkansas'),(5,'California','CA',1,'California','קליפורניה','California'),(6,'Colorado','CO',1,'Colorado','Colorado','Colorado'),(7,'Connecticut','CT',1,'Connecticut','Connecticut','Connecticut'),(8,'DistrictofColumbia','DC',1,'DistrictofColumbia','DistrictofColumbia','DistrictofColumbia'),(9,'Delaware','DE',1,'Delaware','Delaware','Delaware'),(10,'Florida','FL',1,'Florida','Florida','Florida'),(11,'Georgia','GA',1,'Georgia','Georgia','Georgia'),(12,'Hawaii','HI',1,'Hawaii','Hawaii','Hawaii'),(13,'Idaho','ID',1,'Idaho','Idaho','Idaho'),(14,'Illinois','IL',1,'Illinois','Illinois','Illinois'),(15,'Indiana','IN',1,'Indiana','Indiana','Indiana'),(16,'Iowa','IA',1,'Iowa','Iowa','Iowa'),(17,'Kansas','KS',1,'Kansas','Kansas','Kansas'),(18,'Kentucky','KY',1,'Kentucky','Kentucky','Kentucky'),(19,'Louisiana','LA',1,'Louisiana','Louisiana','Louisiana'),(20,'Maine','ME',1,'Maine','Maine','Maine'),(21,'Maryland','MD',1,'Maryland','Maryland','Maryland'),(22,'Massachusetts','MA',1,'Massachusetts','Massachusetts','Massachusetts'),(23,'Michigan','MI',1,'Michigan','Michigan','Michigan'),(24,'Minnesota','MN',1,'Minnesota','Minnesota','Minnesota'),(25,'Mississippi','MS',1,'Mississippi','Mississippi','Mississippi'),(26,'Missouri','MO',1,'Missouri','Missouri','Missouri'),(27,'Montana','MT',1,'Montana','Montana','Montana'),(28,'Nebraska','NE',1,'Nebraska','Nebraska','Nebraska'),(29,'Nevada','NV',1,'Nevada','Nevada','Nevada'),(30,'NewHampshire','NH',1,'NewHampshire','NewHampshire','NewHampshire'),(31,'NewJersey','NJ',1,'NewJersey','NewJersey','NewJersey'),(32,'NewMexico','NM',1,'NewMexico','NewMexico','NewMexico'),(33,'NewYork','NY',1,'NewYork','NewYork','NewYork'),(34,'NorthCarolina','NC',1,'NorthCarolina','NorthCarolina','NorthCarolina'),(35,'NorthDakota','ND',1,'NorthDakota','NorthDakota','NorthDakota'),(36,'Ohio','OH',1,'Ohio','Ohio','Ohio'),(37,'Oklahoma','OK',1,'Oklahoma','Oklahoma','Oklahoma'),(38,'Oregon','OR',1,'Oregon','Oregon','Oregon'),(39,'Pennsylvania','PA',1,'Pennsylvania','Pennsylvania','Pennsylvania'),(40,'RhodeIsland','RI',1,'RhodeIsland','RhodeIsland','RhodeIsland'),(41,'SouthCarolina','SC',1,'SouthCarolina','SouthCarolina','SouthCarolina'),(42,'SouthDakota','SD',1,'SouthDakota','SouthDakota','SouthDakota'),(43,'Tennessee','TN',1,'Tennessee','Tennessee','Tennessee'),(44,'Texas','TX',1,'Texas','Texas','Texas'),(45,'Utah','UT',1,'Utah','Utah','Utah'),(46,'Vermont','VT',1,'Vermont','Vermont','Vermont'),(47,'Virginia','VA',1,'Virginia','Virginia','Virginia'),(48,'Washington','WA',1,'Washington','Washington','Washington'),(49,'WestVirginia','WV',1,'WestVirginia','WestVirginia','WestVirginia'),(50,'Wisconsin','WI',1,'Wisconsin','Wisconsin','Wisconsin'),(51,'Wyoming','WY',1,'Wyoming','Wyoming','Wyoming');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemparam`
--

DROP TABLE IF EXISTS `systemparam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemparam` (
  `idsystemparam` int(11) NOT NULL AUTO_INCREMENT,
  `hasDateFroDay` tinyint(1) DEFAULT '0',
  `DateaDay` int(11) DEFAULT '0',
  `hasConfirmPicture` tinyint(1) DEFAULT '0',
  `blindroomtime` int(11) DEFAULT '3',
  `showbdinLobbyminRooms` int(11) DEFAULT '4',
  `joinroommax` int(11) DEFAULT '3',
  `Minutesbeforestartspin` int(2) DEFAULT '2',
  `Secondsbeforestartspin` int(2) DEFAULT '0',
  `SpinDatetime` int(2) DEFAULT NULL,
  `SpinDatetime2` int(2) DEFAULT NULL,
  `PayPalEmailAddress` varchar(255) DEFAULT NULL,
  `facebookAppID` varchar(45) DEFAULT NULL,
  `FacebookSecretID` varchar(45) DEFAULT NULL,
  `onlinebeforesec` int(2) DEFAULT NULL,
  `onlinebeforemin` int(2) DEFAULT NULL,
  `onlinedatesec` int(2) DEFAULT NULL,
  `onlinedatemin` int(2) DEFAULT NULL,
  `blindbeforesec` int(2) DEFAULT NULL,
  `blindbeforemin` int(2) DEFAULT NULL,
  `blinddatesec` int(2) DEFAULT NULL,
  `blinddatemin` int(2) DEFAULT NULL,
  `favobeforesec` int(2) DEFAULT NULL,
  `favobeforemin` int(2) DEFAULT NULL,
  `favodatesec` int(2) DEFAULT NULL,
  `favodatemin` int(2) DEFAULT NULL,
  `onlineshowleavebtn` int(11) DEFAULT '30',
  `roomshowleavebtn` int(11) DEFAULT '30',
  `blindshowleavebtn` int(11) DEFAULT '30',
  `blindaddmunutetoroom` int(11) DEFAULT '2',
  `onlinecycle` int(11) DEFAULT '90',
  `twittercode` varchar(45) DEFAULT NULL,
  `twittersecret` varchar(45) DEFAULT NULL,
  `idletime` int(11) DEFAULT '30',
  PRIMARY KEY (`idsystemparam`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemparam`
--

LOCK TABLES `systemparam` WRITE;
/*!40000 ALTER TABLE `systemparam` DISABLE KEYS */;
INSERT INTO `systemparam` VALUES (1,0,10,1,2,-1,4,1,0,0,40,'Info@spindate.com','187413421420560','e9feed279ce7e301db02c745040d426e',25,0,30,2,40,0,30,0,0,0,0,1,10,10,30,1,150,'O4pqeNQ2P4DMWu5vtoq89g','XKfNibGkLtBCzPaaT6t3uOWry3GVwXd5RN5QnpGbBOg',59);
/*!40000 ALTER TABLE `systemparam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblaccount`
--

DROP TABLE IF EXISTS `tblaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblaccount` (
  `idtblaccount` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `accountdate` datetime DEFAULT NULL,
  `accountpayment` float DEFAULT NULL,
  `accountperiod` float DEFAULT NULL,
  `transactionid` varchar(45) DEFAULT '',
  `accountPlain` int(11) DEFAULT NULL,
  `ispaid` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`idtblaccount`),
  KEY `setting1` (`ispaid`,`memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblaccount`
--

LOCK TABLES `tblaccount` WRITE;
/*!40000 ALTER TABLE `tblaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblalert`
--

DROP TABLE IF EXISTS `tblalert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblalert` (
  `alertid` int(11) NOT NULL AUTO_INCREMENT,
  `alerttype` int(11) DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  `alertmemid` int(11) DEFAULT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT '0',
  `alertpublish` datetime DEFAULT NULL,
  `isread` tinyint(1) NOT NULL DEFAULT '0',
  `alertinfo` varchar(45) DEFAULT NULL,
  `isalertold` tinyint(1) DEFAULT '0',
  `alertdateid` int(11) DEFAULT '0',
  `isAlertExecuted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`alertid`),
  KEY `home1` (`memberid`,`isalertold`),
  KEY `alert1` (`alerttype`,`memberid`,`isdeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblalert`
--

LOCK TABLES `tblalert` WRITE;
/*!40000 ALTER TABLE `tblalert` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblalert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblblindroommembers`
--

DROP TABLE IF EXISTS `tblblindroommembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblblindroommembers` (
  `roommembersid` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `isExpel` tinyint(1) DEFAULT '0',
  `addToFavourite` tinyint(1) DEFAULT '0',
  `roomid` int(11) DEFAULT NULL,
  `roomreport` tinyint(1) DEFAULT '0',
  `roomside` int(2) DEFAULT NULL,
  `isdeleted` tinyint(4) DEFAULT '0',
  `memberorder` int(2) DEFAULT NULL,
  `isFinish` tinyint(1) DEFAULT '0',
  `dateruntime` datetime DEFAULT NULL,
  `roomdate` int(2) DEFAULT '1',
  PRIMARY KEY (`roommembersid`),
  KEY `idtblrooms_idx` (`roomid`),
  KEY `expelin` (`isExpel`,`roommembersid`),
  KEY `blindroom1` (`memberorder`,`roomside`,`isdeleted`),
  KEY `blindroom2` (`isFinish`),
  KEY `blindroom3` (`memberid`,`roomid`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblblindroommembers`
--

LOCK TABLES `tblblindroommembers` WRITE;
/*!40000 ALTER TABLE `tblblindroommembers` DISABLE KEYS */;
INSERT INTO `tblblindroommembers` VALUES (52,28,0,0,306574,0,2,0,1,0,NULL,1);
/*!40000 ALTER TABLE `tblblindroommembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblblindrooms`
--

DROP TABLE IF EXISTS `tblblindrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblblindrooms` (
  `idtblrooms` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `roomgender` int(11) DEFAULT NULL,
  `roomgender2` int(2) DEFAULT NULL,
  `roomagefrom` int(11) DEFAULT NULL,
  `roomageto` int(11) DEFAULT NULL,
  `roomcountry1` int(11) DEFAULT NULL,
  `roomcountry2` int(11) DEFAULT NULL,
  `roomstate1` int(11) DEFAULT NULL,
  `roomstate2` int(11) DEFAULT NULL,
  `roomtech` int(11) DEFAULT NULL,
  `roomlanguage1` int(11) DEFAULT NULL,
  `roomlanguage2` int(11) DEFAULT NULL,
  `roomstyle` int(11) DEFAULT NULL,
  `roomstatus` int(11) DEFAULT NULL,
  `roompublish` datetime DEFAULT NULL,
  `signmember` int(11) NOT NULL DEFAULT '0',
  `roomnumof` int(2) DEFAULT '3',
  `roomsignin` int(2) DEFAULT '0',
  `roomsignin2` int(2) DEFAULT '0',
  `roomisrunning` tinyint(1) DEFAULT '0',
  `isFinished` tinyint(1) DEFAULT '0',
  `roomtime` datetime DEFAULT NULL,
  PRIMARY KEY (`idtblrooms`),
  UNIQUE KEY `idtblrooms_UNIQUE` (`idtblrooms`),
  KEY `lobby1` (`roomcountry1`,`roomstate1`,`memberid`,`roomcountry2`,`roomstate2`,`roomlanguage2`,`roomlanguage1`,`isFinished`,`roomagefrom`,`roomageto`),
  KEY `blind1` (`isFinished`,`roomisrunning`)
) ENGINE=InnoDB AUTO_INCREMENT=383993 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblblindrooms`
--

LOCK TABLES `tblblindrooms` WRITE;
/*!40000 ALTER TABLE `tblblindrooms` DISABLE KEYS */;
INSERT INTO `tblblindrooms` VALUES (383948,28,0,1,36,40,230,0,1,0,0,1,0,NULL,NULL,'2013-08-07 15:11:43',0,1,0,0,0,0,'2013-08-07 15:11:43'),(383949,28,0,1,36,40,230,0,1,0,1,1,0,NULL,NULL,'2013-08-07 15:11:43',0,1,0,0,0,0,'2013-08-07 15:11:43'),(383950,28,0,1,36,40,230,0,1,0,0,1,0,NULL,NULL,'2013-08-07 15:11:43',0,2,0,0,0,0,'2013-08-07 15:11:43'),(383951,28,0,1,36,40,230,0,1,0,1,1,0,NULL,NULL,'2013-08-07 15:11:44',0,2,0,0,0,0,'2013-08-07 15:11:44'),(383952,28,0,1,36,40,230,0,1,0,0,1,0,NULL,NULL,'2013-08-07 15:11:44',0,3,0,0,0,0,'2013-08-07 15:11:44'),(383953,28,0,1,36,40,230,0,1,0,1,1,0,NULL,NULL,'2013-08-07 15:11:44',0,3,0,0,0,0,'2013-08-07 15:11:44'),(383954,30,1,0,33,37,230,0,1,0,0,1,0,NULL,NULL,'2013-08-07 15:11:44',0,1,0,0,0,0,'2013-08-07 15:11:44'),(383955,30,1,0,33,37,230,0,1,0,1,1,0,NULL,NULL,'2013-08-07 15:11:44',0,1,0,0,0,0,'2013-08-07 15:11:44'),(383956,30,1,0,33,37,230,0,1,0,0,1,0,NULL,NULL,'2013-08-07 15:11:44',0,2,0,0,0,0,'2013-08-07 15:11:44'),(383957,30,1,0,33,37,230,0,1,0,0,1,0,NULL,NULL,'2013-08-07 15:11:44',0,3,0,0,0,0,'2013-08-07 15:11:44'),(383958,30,1,0,33,37,230,0,1,0,1,1,0,NULL,NULL,'2013-08-07 15:11:44',0,2,0,0,0,0,'2013-08-07 15:11:44'),(383959,30,1,0,33,37,230,0,1,0,1,1,0,NULL,NULL,'2013-08-07 15:11:44',0,3,0,0,0,0,'2013-08-07 15:11:44'),(383960,30,1,0,35,39,230,0,1,0,0,1,0,NULL,NULL,'2013-08-07 15:11:44',0,1,0,0,0,0,'2013-08-07 15:11:44'),(383961,30,1,0,35,39,230,0,1,0,0,1,0,NULL,NULL,'2013-08-07 15:11:44',0,2,0,0,0,0,'2013-08-07 15:11:44'),(383962,30,1,0,35,39,230,0,1,0,1,1,0,NULL,NULL,'2013-08-07 15:11:45',0,1,0,0,0,0,'2013-08-07 15:11:45'),(383963,30,1,0,35,39,230,0,1,0,1,1,0,NULL,NULL,'2013-08-07 15:11:45',0,2,0,0,0,0,'2013-08-07 15:11:45'),(383964,30,1,0,35,39,230,0,1,0,0,1,0,NULL,NULL,'2013-08-07 15:11:45',0,3,0,0,0,0,'2013-08-07 15:11:45'),(383965,30,1,0,31,35,230,0,1,0,0,1,0,NULL,NULL,'2013-08-07 15:11:45',0,1,0,0,0,0,'2013-08-07 15:11:45'),(383966,30,1,0,35,39,230,0,1,0,1,1,0,NULL,NULL,'2013-08-07 15:11:45',0,3,0,0,0,0,'2013-08-07 15:11:45'),(383967,30,1,0,31,35,230,0,1,0,1,1,0,NULL,NULL,'2013-08-07 15:11:45',0,1,0,0,0,0,'2013-08-07 15:11:45'),(383968,30,1,0,31,35,230,0,1,0,0,1,0,NULL,NULL,'2013-08-07 15:11:45',0,2,0,0,0,0,'2013-08-07 15:11:45'),(383969,30,1,0,31,35,230,0,1,0,1,1,0,NULL,NULL,'2013-08-07 15:11:45',0,2,0,0,0,0,'2013-08-07 15:11:45'),(383970,30,1,0,31,35,230,0,1,0,0,1,0,NULL,NULL,'2013-08-07 15:11:46',0,3,0,0,0,0,'2013-08-07 15:11:46'),(383971,30,1,0,31,35,230,0,1,0,1,1,0,NULL,NULL,'2013-08-07 15:11:46',0,3,0,0,0,0,'2013-08-07 15:11:46'),(383972,31,1,0,32,36,230,0,1,0,0,1,0,NULL,NULL,'2013-08-07 15:11:46',0,1,0,0,0,0,'2013-08-07 15:11:46'),(383973,31,1,0,32,36,230,0,1,0,0,1,0,NULL,NULL,'2013-08-07 15:11:46',0,2,0,0,0,0,'2013-08-07 15:11:46'),(383974,31,1,0,32,36,230,0,1,0,1,1,0,NULL,NULL,'2013-08-07 15:11:46',0,1,0,0,0,0,'2013-08-07 15:11:46'),(383975,31,1,0,32,36,230,0,1,0,1,1,0,NULL,NULL,'2013-08-07 15:11:46',0,2,0,0,0,0,'2013-08-07 15:11:46'),(383976,31,1,0,32,36,230,0,1,0,1,1,0,NULL,NULL,'2013-08-07 15:11:46',0,3,0,0,0,0,'2013-08-07 15:11:46'),(383977,31,1,0,32,36,230,0,1,0,0,1,0,NULL,NULL,'2013-08-07 15:11:46',0,3,0,0,0,0,'2013-08-07 15:11:46'),(383978,31,1,0,32,36,230,0,1,0,1,1,0,NULL,NULL,'2013-08-07 15:11:46',0,3,0,0,0,0,'2013-08-07 15:11:46'),(383979,31,1,0,34,38,230,0,1,0,0,1,0,NULL,NULL,'2013-08-07 15:11:46',0,1,0,0,0,0,'2013-08-07 15:11:46'),(383980,31,1,0,34,38,230,0,1,0,0,1,0,NULL,NULL,'2013-08-07 15:11:46',0,2,0,0,0,0,'2013-08-07 15:11:46'),(383981,31,1,0,34,38,230,0,1,0,1,1,0,NULL,NULL,'2013-08-07 15:11:46',0,1,0,0,0,0,'2013-08-07 15:11:46'),(383982,31,1,0,34,38,230,0,1,0,0,1,0,NULL,NULL,'2013-08-07 15:11:47',0,3,0,0,0,0,'2013-08-07 15:11:47'),(383983,31,1,0,34,38,230,0,1,0,1,1,0,NULL,NULL,'2013-08-07 15:11:47',0,2,0,0,0,0,'2013-08-07 15:11:47'),(383984,31,1,0,34,38,230,0,1,0,1,1,0,NULL,NULL,'2013-08-07 15:11:47',0,3,0,0,0,0,'2013-08-07 15:11:47'),(383985,31,1,0,30,34,230,0,1,0,1,1,0,NULL,NULL,'2013-08-07 15:11:48',0,1,0,0,0,0,'2013-08-07 15:11:48'),(383986,31,1,0,30,34,230,0,1,0,0,1,0,NULL,NULL,'2013-08-07 15:11:48',0,1,0,0,0,0,'2013-08-07 15:11:48'),(383987,31,1,0,30,34,230,0,1,0,1,1,0,NULL,NULL,'2013-08-07 15:11:48',0,1,0,0,0,0,'2013-08-07 15:11:48'),(383988,31,1,0,30,34,230,0,1,0,1,1,0,NULL,NULL,'2013-08-07 15:11:48',0,2,0,0,0,0,'2013-08-07 15:11:48'),(383989,31,1,0,30,34,230,0,1,0,0,1,0,NULL,NULL,'2013-08-07 15:11:48',0,2,0,0,0,0,'2013-08-07 15:11:48'),(383990,31,1,0,30,34,230,0,1,0,0,1,0,NULL,NULL,'2013-08-07 15:11:48',0,3,0,0,0,0,'2013-08-07 15:11:48'),(383991,31,1,0,30,34,230,0,1,0,1,1,0,NULL,NULL,'2013-08-07 15:11:48',0,3,0,0,0,0,'2013-08-07 15:11:48'),(383992,31,1,0,30,34,230,0,1,0,0,1,0,NULL,NULL,'2013-08-07 15:11:48',0,3,0,0,0,0,'2013-08-07 15:11:48');
/*!40000 ALTER TABLE `tblblindrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblchatalert`
--

DROP TABLE IF EXISTS `tblchatalert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblchatalert` (
  `tblchatalertid` int(11) NOT NULL AUTO_INCREMENT,
  `alertminutes` int(11) DEFAULT '0',
  `alertseconds` int(11) DEFAULT '0',
  `chatalertname` varchar(45) DEFAULT NULL,
  `chatstatus` int(2) DEFAULT NULL,
  `1` text,
  `2` text,
  `3` text,
  `4` text,
  PRIMARY KEY (`tblchatalertid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblchatalert`
--

LOCK TABLES `tblchatalert` WRITE;
/*!40000 ALTER TABLE `tblchatalert` DISABLE KEYS */;
INSERT INTO `tblchatalert` VALUES (1,3,30,'first alert',1,'<div>\r\n	<strong>System:</strong> you left 03:30 minutes to the chat</div>\r\n',NULL,NULL,NULL),(2,1,0,'last minute',2,'<div>\r\n	System: you have 01:00 minutes to the date, think if you want to <span style=\"color:#9b30ff;\">favourite </span>the date</div>\r\n',NULL,NULL,NULL),(3,4,40,'fisrt alert',2,'<div>\r\n	System: date is started!!!</div>\r\n',NULL,NULL,NULL),(4,0,40,'online 40 sec',3,'',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tblchatalert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcontact`
--

DROP TABLE IF EXISTS `tblcontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcontact` (
  `idtblcontact` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`idtblcontact`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcontact`
--

LOCK TABLES `tblcontact` WRITE;
/*!40000 ALTER TABLE `tblcontact` DISABLE KEYS */;
INSERT INTO `tblcontact` VALUES (1,'<p style=margin:0px;padding:0px;>Full Name: <b> ASDASD@SADAS.COM </b></p><p style=margin:0px;padding:0px;>Your E-mail Address: <b> asdas@sadsd.com </b></p><p style=margin:0px;padding:0px;>Choose a Subject:: <b> Will I ever find a real true love? </b></p><p style=margin:0px;padding:0px;>Write your content...: <b> sadas ads sa as d </b></p>','2013-03-13 14:44:12'),(2,'<p style=margin:0px;padding:0px;>Full Name: <b> yossi </b></p><p style=margin:0px;padding:0px;>Your E-mail Address: <b> yossi2@comst.co.l </b></p><p style=margin:0px;padding:0px;>Choose a Subject:: <b> sad sadaD a d </b></p><p style=margin:0px;padding:0px;>Write your content...: <b> aSas AS A Sas  s </b></p>','2013-03-13 14:59:42'),(3,'<p style=margin:0px;padding:0px;>Full Name: <b> asdasd </b></p><p style=margin:0px;padding:0px;>Your E-mail Address: <b> asdsad@sdsd.com </b></p><p style=margin:0px;padding:0px;>Choose a Subject:: <b> help needed </b></p><p style=margin:0px;padding:0px;>Write your content...: <b> sadasdsa </b></p>','2013-03-14 15:43:14'),(4,'<p style=margin:0px;padding:0px;>Full Name: <b> sadsa </b></p><p style=margin:0px;padding:0px;>Your E-mail Address: <b> sadasdasdasd@wewe.com </b></p><p style=margin:0px;padding:0px;>Choose a Subject:: <b> help needed </b></p><p style=margin:0px;padding:0px;>Write your content...: <b> asdasdas </b></p>','2013-03-14 15:52:11'),(5,'<p style=margin:0px;padding:0px;>Full Name: <b> weqwe </b></p><p style=margin:0px;padding:0px;>Your E-mail Address: <b> dasdasd@sdsd.com </b></p><p style=margin:0px;padding:0px;>Choose a Subject:: <b> help needed </b></p><p style=margin:0px;padding:0px;>Write your content...: <b> asdasdasd </b></p>','2013-03-14 16:09:45'),(6,'<p style=margin:0px;padding:0px;>Full Name: <b> dsfsdf </b></p><p style=margin:0px;padding:0px;>Your E-mail Address: <b> dfsdfsd@sdfasd.com </b></p><p style=margin:0px;padding:0px;>Choose a Subject:: <b> sad sadaD a d </b></p><p style=margin:0px;padding:0px;>Write your content...: <b> asdas as das dasdas dasd d  </b></p>','2013-03-14 16:11:40'),(7,'<p style=margin:0px;padding:0px;>Full Name: <b> yossi </b></p><p style=margin:0px;padding:0px;>Your E-mail Address: <b> yossi@comstar.co.il </b></p><p style=margin:0px;padding:0px;>Choose a Subject:: <b> help needed </b></p><p style=margin:0px;padding:0px;>Write your content...: <b> sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss </b></p>','2013-06-13 15:21:53'),(8,'<p style=margin:0px;padding:0px;>Full Name: <b> sdfgdsg </b></p><p style=margin:0px;padding:0px;>Your E-mail Address: <b> fdgfdg@sdfsd.com </b></p><p style=margin:0px;padding:0px;>Choose a Subject:: <b> help needed </b></p><p style=margin:0px;padding:0px;>Write your content...: <b> asdsadas dsad asd sa d </b></p>','2013-06-18 16:27:15'),(9,'<p style=margin:0px;padding:0px;>Full Name: <b> yossi </b></p><p style=margin:0px;padding:0px;>Your E-mail Address: <b> yossi@comstar.co.il </b></p><p style=margin:0px;padding:0px;>Choose a Subject:: <b> type 3 </b></p><p style=margin:0px;padding:0px;>Write your content...: <b> hello </b></p>','2013-06-18 16:31:06'),(10,'<p style=margin:0px;padding:0px;>Full Name: <b> yossi </b></p><p style=margin:0px;padding:0px;>Your E-mail Address: <b> yossi@comstar.co.il </b></p><p style=margin:0px;padding:0px;>Choose a Subject:: <b> type 3 </b></p><p style=margin:0px;padding:0px;>Write your content...: <b> hello </b></p>','2013-06-18 16:34:13');
/*!40000 ALTER TABLE `tblcontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcontacttypes`
--

DROP TABLE IF EXISTS `tblcontacttypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcontacttypes` (
  `idtblcontacttypes` int(11) NOT NULL AUTO_INCREMENT,
  `contactText` varchar(155) DEFAULT NULL,
  `contentorder` int(11) DEFAULT NULL,
  `contactLang` int(11) NOT NULL DEFAULT '1',
  `contactmail` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`idtblcontacttypes`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcontacttypes`
--

LOCK TABLES `tblcontacttypes` WRITE;
/*!40000 ALTER TABLE `tblcontacttypes` DISABLE KEYS */;
INSERT INTO `tblcontacttypes` VALUES (1,'Will I ever find a real true love?',4,1,NULL),(2,'help needed',1,1,'yossi@comstar.co.il'),(3,'type 3',3,1,'dudi@comstar.co.il'),(4,'sad sadaD a d',2,1,NULL),(5,'האם אני אמצע אהבה?',2,3,NULL),(6,'sadasd',1,3,NULL);
/*!40000 ALTER TABLE `tblcontacttypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblcuopons`
--

DROP TABLE IF EXISTS `tblcuopons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblcuopons` (
  `idtblcuppons` int(11) NOT NULL AUTO_INCREMENT,
  `cuoponname` varchar(255) DEFAULT NULL,
  `cuopondate` datetime DEFAULT '2013-01-01 00:00:00',
  `cuopontype` tinyint(1) DEFAULT NULL,
  `cuoponuse` tinyint(1) DEFAULT '0',
  `cuopondays` int(11) DEFAULT NULL,
  `cuopondateaday` int(11) DEFAULT '0',
  `couponcode` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtblcuppons`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblcuopons`
--

LOCK TABLES `tblcuopons` WRITE;
/*!40000 ALTER TABLE `tblcuopons` DISABLE KEYS */;
INSERT INTO `tblcuopons` VALUES (11,'coupon 1 ','2013-06-28 00:00:00',1,0,34,15,'12345'),(12,'qqqqq','2013-02-21 00:00:00',0,1,30,0,'1234'),(13,'sdfasdsad','2013-02-28 00:00:00',0,1,40,0,'213123'),(14,'sdfasdsad-1','2013-02-28 00:00:00',0,0,40,0,'2323'),(15,'sdfasdsad-2','2013-02-28 00:00:00',0,0,40,0,'23233');
/*!40000 ALTER TABLE `tblcuopons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldatechat`
--

DROP TABLE IF EXISTS `tbldatechat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldatechat` (
  `idtbldatechat` int(11) NOT NULL AUTO_INCREMENT,
  `chatcontent` text,
  `chatdate` datetime DEFAULT NULL,
  `chatdateid` int(11) DEFAULT '0',
  `datemember1` int(11) DEFAULT NULL,
  `datemember2` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtbldatechat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldatechat`
--

LOCK TABLES `tbldatechat` WRITE;
/*!40000 ALTER TABLE `tbldatechat` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbldatechat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldates`
--

DROP TABLE IF EXISTS `tbldates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldates` (
  `dateid` int(11) NOT NULL AUTO_INCREMENT,
  `datepablish` datetime DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  `memberdateid` int(11) DEFAULT NULL,
  `relstatus` tinyint(1) DEFAULT '0',
  `datelasting` int(11) DEFAULT '0',
  `roomid` int(11) DEFAULT '0',
  `datetype` tinyint(1) DEFAULT '0',
  `datestatus` int(11) DEFAULT '0',
  `datebg` int(11) DEFAULT NULL,
  `datereport` tinyint(1) DEFAULT '0',
  `datereport2` varchar(45) DEFAULT NULL,
  `dateaddtofavourite` tinyint(1) DEFAULT '0',
  `dateaddtofavourite2` varchar(45) DEFAULT NULL,
  `dateoder` int(2) DEFAULT NULL,
  `numberofdate` int(2) DEFAULT NULL,
  `dateend` datetime DEFAULT NULL,
  `onlineid` int(11) DEFAULT '0',
  `blinddateid` int(11) DEFAULT '0',
  PRIMARY KEY (`dateid`),
  KEY `profile1` (`memberid`)
) ENGINE=InnoDB AUTO_INCREMENT=529 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldates`
--

LOCK TABLES `tbldates` WRITE;
/*!40000 ALTER TABLE `tbldates` DISABLE KEYS */;
INSERT INTO `tbldates` VALUES (496,'2013-08-04 14:52:08',28,30,0,0,0,1,9,1,0,NULL,0,NULL,1,1,'2013-08-04 14:52:15',677,0),(497,'2013-08-04 15:58:42',30,28,0,0,0,0,9,2,0,NULL,0,NULL,1,1,'2013-08-04 15:59:10',678,0),(498,'2013-08-05 14:28:18',28,30,0,0,0,1,9,3,0,NULL,0,NULL,1,1,'2013-08-05 14:28:45',680,0),(499,'2013-08-05 14:57:48',37,28,0,0,0,0,9,1,0,NULL,0,NULL,1,1,'2013-08-05 14:58:29',684,0),(500,'2013-08-06 09:31:55',28,30,0,0,0,0,9,1,0,NULL,0,NULL,1,1,'2013-08-06 09:33:39',698,0),(501,'2013-08-06 09:35:30',28,30,0,0,0,0,9,1,0,NULL,0,NULL,1,1,'2013-08-06 09:38:00',699,0),(502,'2013-08-06 10:36:02',30,28,0,0,0,0,9,2,0,NULL,0,NULL,1,1,'2013-08-06 10:36:21',722,0),(503,'2013-08-06 10:37:16',30,28,0,0,0,1,9,2,0,NULL,0,NULL,1,1,'2013-08-06 10:37:43',723,0),(504,'2013-08-06 10:40:27',28,30,0,0,0,1,9,1,0,NULL,0,NULL,1,1,'2013-08-06 10:41:09',725,0),(505,'2013-08-06 10:43:32',28,30,0,0,0,1,9,3,0,NULL,0,NULL,1,1,'2013-08-06 10:43:59',726,0),(506,'2013-08-06 10:44:47',28,30,0,0,0,1,9,3,0,NULL,0,NULL,1,1,'2013-08-06 10:46:06',727,0),(507,'2013-08-06 11:16:15',30,31,0,0,0,1,9,1,0,NULL,0,NULL,1,1,'2013-08-06 11:18:45',737,0),(508,'2013-08-06 11:49:00',31,30,0,0,0,1,9,2,0,NULL,0,NULL,1,1,'2013-08-06 11:51:30',739,0),(509,'2013-08-06 13:14:33',30,28,0,0,80,1,9,1,0,NULL,0,NULL,1,1,'2013-08-06 13:15:13',0,0),(510,'2013-08-06 13:48:48',28,30,0,0,81,1,9,1,0,NULL,0,NULL,1,1,'2013-08-06 13:49:28',0,0),(511,'2013-08-06 14:08:05',28,30,0,0,88,1,9,1,0,NULL,0,NULL,1,1,'2013-08-06 14:08:45',0,0),(512,'2013-08-06 14:39:23',30,28,0,0,99,1,9,1,0,NULL,0,NULL,1,1,'2013-08-06 14:40:03',0,0),(513,'2013-08-06 15:06:23',30,28,0,0,0,0,9,1,0,NULL,0,NULL,1,1,'2013-08-06 15:06:35',744,0),(514,'2013-08-06 15:09:43',30,28,0,0,0,1,9,3,0,NULL,0,NULL,1,1,'2013-08-06 15:10:12',745,0),(515,'2013-08-06 15:56:51',30,28,0,0,0,0,9,2,0,NULL,0,NULL,1,1,'2013-08-06 15:57:08',747,0),(516,'2013-08-06 16:01:52',30,28,0,0,0,1,9,1,0,NULL,0,NULL,1,1,'2013-08-06 16:02:10',748,0),(517,'2013-08-06 16:09:21',30,28,0,0,0,1,9,1,0,NULL,0,NULL,1,1,'2013-08-06 16:10:12',749,0),(518,'2013-08-06 16:10:46',30,28,0,0,0,0,9,3,0,NULL,0,NULL,1,1,'2013-08-06 16:21:51',750,0),(519,'2013-08-06 16:23:01',28,30,0,0,0,1,9,2,0,NULL,0,NULL,1,1,'2013-08-06 16:23:30',751,0),(520,'2013-08-06 18:09:31',28,30,0,0,0,0,9,2,0,NULL,0,NULL,1,1,'2013-08-06 18:10:40',752,0),(521,'2013-08-07 09:16:12',28,30,0,0,0,1,9,2,0,NULL,0,NULL,1,1,'2013-08-07 09:16:27',753,0),(522,'2013-08-07 12:49:08',30,28,0,0,132,1,9,1,0,NULL,0,NULL,1,1,'2013-08-07 12:49:48',0,0),(523,'2013-08-07 12:59:53',30,28,0,0,135,1,9,1,0,NULL,0,NULL,1,1,'2013-08-07 13:00:33',0,0),(524,'2013-08-07 13:51:01',28,30,0,0,137,1,9,1,0,NULL,0,NULL,1,1,'2013-08-07 13:51:41',0,0),(525,'2013-08-07 14:05:51',30,28,0,0,138,1,9,1,0,NULL,0,NULL,1,1,'2013-08-07 14:06:31',0,0),(526,'2013-08-07 14:05:51',28,30,0,0,138,1,9,1,0,NULL,0,NULL,1,1,'2013-08-07 14:06:31',0,0),(527,'2013-08-07 14:13:21',28,30,0,0,139,1,9,1,0,NULL,0,NULL,1,1,'2013-08-07 14:13:42',0,0),(528,'2013-08-07 14:38:29',30,28,0,0,141,1,9,1,0,NULL,0,NULL,1,1,'2013-08-07 14:39:09',0,0);
/*!40000 ALTER TABLE `tbldates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbldropdown`
--

DROP TABLE IF EXISTS `tbldropdown`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbldropdown` (
  `tblid` int(11) NOT NULL AUTO_INCREMENT,
  `DropName` varchar(60) DEFAULT NULL,
  `DropTable` varchar(60) DEFAULT NULL,
  `dropid` int(11) DEFAULT NULL,
  `dropeditpage` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tblid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldropdown`
--

LOCK TABLES `tbldropdown` WRITE;
/*!40000 ALTER TABLE `tbldropdown` DISABLE KEYS */;
INSERT INTO `tbldropdown` VALUES (1,'countries','countries',NULL,'ManageCountries.aspx'),(2,'states','states',NULL,'ManageStates.aspx'),(3,'languages','tbllang',NULL,'ManageLanguages.aspx'),(4,'enviroment','roomenvi',NULL,'ManageEnvi.aspx');
/*!40000 ALTER TABLE `tbldropdown` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblevents`
--

DROP TABLE IF EXISTS `tblevents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblevents` (
  `idtblhelpcenter` int(11) NOT NULL AUTO_INCREMENT,
  `helpheader` varchar(210) DEFAULT NULL,
  `helpcontent` text,
  `helpTitle` varchar(45) DEFAULT NULL,
  `helpDescription` varchar(45) DEFAULT NULL,
  `helpkeyWord` varchar(45) DEFAULT NULL,
  `helpParent` int(11) DEFAULT NULL,
  `showHelp` tinyint(1) DEFAULT NULL,
  `helpOrder` int(11) DEFAULT NULL,
  `helpimg` varchar(210) DEFAULT NULL,
  `helpShortDesc` text,
  `eventstype` varchar(45) DEFAULT NULL,
  `eventspublish` datetime NOT NULL DEFAULT '2012-01-01 00:00:00',
  `eventLang` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idtblhelpcenter`),
  KEY `blog` (`showHelp`,`eventLang`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblevents`
--

LOCK TABLES `tblevents` WRITE;
/*!40000 ALTER TABLE `tblevents` DISABLE KEYS */;
INSERT INTO `tblevents` VALUES (1,'Spindate News','','Spindate News','Spindate News','Spindate News',0,1,5,'../images/siteuserImages/ca9604c6-6024-47f5-b46b-b198df2ed2ef_icon.png','If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you','News','2012-06-26 00:00:00',1),(2,'Articles',NULL,'Events',NULL,NULL,0,1,6,'../images/siteuserImages/3743a420-b91c-413f-86e9-9ed46e9f5edc_icon.png','If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you','','2012-06-26 00:00:00',1),(3,'Hot Events',NULL,'Events','Events','Events',0,1,7,'../images/siteuserImages/7c0a757c-96c3-4cd4-b8e7-fca54dd89b12_icon.png','If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you','Events','2012-06-26 00:00:00',1),(30,'חדשות ספינדייט','','חדשות ספינדייט','חדשות ספינדייט','חדשות ספינדייט',0,1,5,'../images/siteuserImages/ca9604c6-6024-47f5-b46b-b198df2ed2ef_icon.png','',NULL,'2012-01-01 00:00:00',3),(31,'מאמרים','','asdasd','asdasdsad','asdasdsa',0,1,6,'../images/siteuserImages/ca9604c6-6024-47f5-b46b-b198df2ed2ef_icon.png','',NULL,'2012-01-01 00:00:00',3),(32,'אירועים','','אירועים','אירועים','אירועים',0,1,7,'../images/siteuserImages/7c0a757c-96c3-4cd4-b8e7-fca54dd89b12_icon.png','',NULL,'2012-01-01 00:00:00',3),(34,'news 1','<div>\r\n	sad asdasd&nbsp;</div>\r\n<div>\r\n	asd as dasd dsasd &nbsp;asd fas dfasd fasfdsff af asfa</div>\r\n<div>\r\n	fdasf asfd asdfasf afa</div>\r\n<div>\r\n	dfasdf</div>\r\n<div>\r\n	asf asfddf fdsf dsfsd fsdfsdf sdf sdfsd fsdfsdfsdf sddgdsd sff dgsgdfgsdfgfdsgfdgdf hdfgdfgdfgdfhg df</div>\r\n<div>\r\n	asf asfddf fdsf dsfsd fsdfsdf sdf sdfsd fsdfsdfsdf sddgdsd sff dgsgdfgsdfgfdsgfdgdf hdfgdfgdfgdfhg df</div>\r\n<div>\r\n	asf asfddf fdsf dsfsd fsdfsdf sdf sdfsd fsdfsdfsdf sddgdsd sff dgsgdfgsdfgfdsgfdgdf hdfgdfgdfgdfhg df</div>\r\n<div>\r\n	asf asfddf fdsf dsfsd fsdfsdf sdf sdfsd fsdfsdfsdf sddgdsd sff dgsgdfgsdfgfdsgfdgdf hdfgdfgdfgdfhg df</div>\r\n<div>\r\n	asf asfddf fdsf dsfsd fsdfsdf sdf sdfsd fsdfsdfsdf sddgdsd sff dgsgdfgsdfgfdsgfdgdf hdfgdfgdfgdfhg dfasf asfddf fdsf dsfsd fsdfsdf sdf sdfsd fsdfsdfsdf sddgdsd sff dgsgdfgsdfgfdsgfdgdf hdfgdfgdfgdfhg dfasf asfddf fdsf dsfsd fsdfsdf sdf sdfsd fsdfsdfsdf sddgdsd sff dgsgdfgsdfgfdsgfdgdf hdfgdfgdfgdfhg dfasf asfddf fdsf dsfsd fsdfsdf sdf sdfsd fsdfsdfsdf sddgdsd sff dgsgdfgsdfgfdsgfdgdf hdfgdfgdfgdfhg dfasf asfddf fdsf dsfsd fsdfsdf sdf sdfsd fsdfsdfsdf sddgdsd sff dgsgdfgsdfgfdsgfdgdf hdfgdfgdfgdfhg dfasf asfddf fdsf dsfsd fsdfsdf sdf sdfsd fsdfsdfsdf sddgdsd sff dgsgdfgsdfgfdsgfdgdf hdfgdfgdfgdfhg df</div>\r\n<div>\r\n	asf asfddf fdsf dsfsd fsdfsdf sdf sdfsd fsdfsdfsdf sddgdsd sff dgsgdfgsdfgfdsgfdgdf hdfgdfgdfgdfhg df</div>\r\n<div>\r\n	asf asfddf fdsf dsfsd fsdfsdf sdf sdfsd fsdfsdfsdf sddgdsd sff dgsgdfgsdfgfdsgfdgdf hdfgdfgdfgdfhg dfasf asfddf fdsf dsfsd fsdfsdf sdf sdfsd fsdfsdfsdf sddgdsd sff dgsgdfgsdfgfdsgfdgdf hdfgdfgdfgdfhg dfasf asfddf fdsf dsfsd fsdfsdf sdf sdfsd fsdfsdfsdf sddgdsd sff dgsgdfgsdfgfdsgfdgdf hdfgdfgdfgdfhg df</div>\r\n<div>\r\n	asf asfddf fdsf dsfsd fsdfsdf sdf sdfsd fsdfsdfsdf sddgdsd sff dgsgdfgsdfgfdsgfdgdf hdfgdfgdfgdfhg dfasf asfddf fdsf dsfsd fsdfsdf sdf sdfsd fsdfsdfsdf sddgdsd sff dgsgdfgsdfgfdsgfdgdf hdfgdfgdfgdfhg df</div>\r\n<div>\r\n	vasf asfddf fdsf dsfsd fsdfsdf sdf sdfsd fsdfsdfsdf sddgdsd sff dgsgdfgsdfgfdsgfdgdf hdfgdfgdfgdfhg dfasf asfddf fdsf dsfsd fsdfsdf sdf sdfsd fsdfsdfsdf sddgdsd sff dgsgdfgsdfgfdsgfdgdf hdfgdfgdfgdfhg dfasf asfddf fdsf dsfsd fsdfsdf sdf sdfsd fsdfsdfsdf sddgdsd sff dgsgdfgsdfgfdsgfdgdf hdfgdfgdfgdfhg dfasf asfddf fdsf dsfsd fsdfsdf sdf sdfsd fsdfsdfsdf sddgdsd sff dgsgdfgsdfgfdsgfdgdf hdfgdfgdfgdfhg df</div>\r\n<div>\r\n	asf asfddf fdsf dsfsd fsdfsdf sdf sdfsd fsdfsdfsdf sddgdsd sff dgsgdfgsdfgfdsgfdgdf hdfgdfgdfgdfhg df</div>\r\n<div>\r\n	asf asfddf fdsf dsfsd fsdfsdf sdf sdfsd fsdfsdfsdf sddgdsd sff dgsgdfgsdfgfdsgfdgdf hdfgdfgdfgdfhg dfasf asfddf fdsf dsfsd fsdfsdf sdf sdfsd fsdfsdfsdf sddgdsd sff dgsgdfgsdfgfdsgfdgdf hdfgdfgdfgdfhg dfasf asfddf fdsf dsfsd fsdfsdf sdf sdfsd fsdfsdfsdf sddgdsd sff dgsgdfgsdfgfdsgfdgdf hdfgdfgdfgdfhg df</div>\r\n','news 1','news 1','news 1',1,1,1,NULL,'sad asdas das da das das\r\nads das da d',NULL,'2013-02-12 00:00:00',1),(35,'new 2','<div>\r\n	asda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer r</div>\r\n<div>\r\n	asda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer r</div>\r\n<div>\r\n	asda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer rasda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer rasda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer rasda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer rasda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer rasda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer rasda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer r</div>\r\n<div>\r\n	asda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer r</div>\r\n<div>\r\n	asda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer r</div>\r\n<div>\r\n	asda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer r</div>\r\n<div>\r\n	<div>\r\n		asda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer r</div>\r\n	<div>\r\n		asda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer r</div>\r\n	<div>\r\n		asda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer rasda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer rasda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer rasda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer rasda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer rasda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer rasda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer r</div>\r\n	<div>\r\n		asda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer r</div>\r\n	<div>\r\n		asda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer r</div>\r\n	<div>\r\n		asda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer r</div>\r\n	<div>\r\n		<div>\r\n			asda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer r</div>\r\n		<div>\r\n			asda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer r</div>\r\n		<div>\r\n			asda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer rasda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer rasda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer rasda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer rasda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer rasda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer rasda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer r</div>\r\n		<div>\r\n			asda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer r</div>\r\n		<div>\r\n			asda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer r</div>\r\n		<div>\r\n			asda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer r</div>\r\n		<div>\r\n			<div>\r\n				asda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer r</div>\r\n			<div>\r\n				asda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer r</div>\r\n			<div>\r\n				asda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer rasda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer rasda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer rasda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer rasda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer rasda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer rasda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer r</div>\r\n			<div>\r\n				asda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer r</div>\r\n			<div>\r\n				asda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer r</div>\r\n			<div>\r\n				asda sdasd &nbsp;as das dasd asd asdasdsss sdddwew w q ewq qw ewq rqwerqwe rerer er rer r</div>\r\n			<div>\r\n				&nbsp;</div>\r\n		</div>\r\n	</div>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','new 2','new 2','new 2',1,1,2,NULL,'sa das das ds das d asd asd as dasd \r\nsa d\r\nas\r\nd asd as\r\nd asd\r\n',NULL,'2013-01-15 00:00:00',1),(36,'Events 1','<div>\r\n	Events&nbsp;Events WE SWWEQ EWQ EQW EDQW ERQW Esae rwf we rtwetwetwettwtwesdfsdfsdf sd fsdf sd fsdfEvents&nbsp;Events WE SWWEQ EWQ EQW EDQW ERQW Esae rwf we rtwetwetwettwtwesdfsdfsdf sd fsdf sd fsdfEvents&nbsp;Events WE SWWEQ EWQ EQW EDQW ERQW Esae rwf we rtwetwetwettwtwesdfsdfsdf sd fsdf sd fsdf</div>\r\n<div>\r\n	Events&nbsp;Events WE SWWEQ EWQ EQW EDQW ERQW Esae rwf we rtwetwetwettwtwesdfsdfsdf sd fsdf sd fsdfEvents&nbsp;Events WE SWWEQ EWQ EQW EDQW ERQW Esae rwf we rtwetwetwettwtwesdfsdfsdf sd fsdf sd fsdf</div>\r\n<div>\r\n	Events&nbsp;Events WE SWWEQ EWQ EQW EDQW ERQW Esae rwf we rtwetwetwettwtwesdfsdfsdf sd fsdf sd fsdf</div>\r\n<div>\r\n	Events&nbsp;Events WE SWWEQ EWQ EQW EDQW ERQW Esae rwf we rtwetwetwettwtwesdfsdfsdf sd fsdf sd fsdf</div>\r\n<div>\r\n	Events&nbsp;Events WE SWWEQ EWQ EQW EDQW ERQW Esae rwf we rtwetwetwettwtwesdfsdfsdf sd fsdf sd fsdf</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	Events&nbsp;Events WE SWWEQ EWQ EQW EDQW ERQW Esae rwf we rtwetwetwettwtwesdfsdfsdf sd fsdf sd fsdf</div>\r\n<div>\r\n	Events&nbsp;Events WE SWWEQ EWQ EQW EDQW ERQW Esae rwf we rtwetwetwettwtwesdfsdfsdf sd fsdf sd fsdf</div>\r\n<div>\r\n	Events&nbsp;Events WE SWWEQ EWQ EQW EDQW ERQW Esae rwf we rtwetwetwettwtwesdfsdfsdf sd fsdf sd fsdfEvents&nbsp;Events WE SWWEQ EWQ EQW EDQW ERQW Esae rwf we rtwetwetwettwtwesdfsdfsdf sd fsdf sd fsdfEvents&nbsp;Events WE SWWEQ EWQ EQW EDQW ERQW Esae rwf we rtwetwetwettwtwesdfsdfsdf sd fsdf sd fsdf</div>\r\n<div>\r\n	Events&nbsp;Events WE SWWEQ EWQ EQW EDQW ERQW Esae rwf we rtwetwetwettwtwesdfsdfsdf sd fsdf sd fsdf</div>\r\n<div>\r\n	Events&nbsp;Events WE SWWEQ EWQ EQW EDQW ERQW Esae rwf we rtwetwetwettwtwesdfsdfsdf sd fsdf sd fsdfEvents&nbsp;Events WE SWWEQ EWQ EQW EDQW ERQW Esae rwf we rtwetwetwettwtwesdfsdfsdf sd fsdf sd fsdf</div>\r\n','Events 1','Events 1','Events 1',2,1,1,NULL,'Events 1',NULL,'2013-02-13 00:00:00',1),(37,'event 2','<div>\r\n	event 2 asdas dawe dqw ewqe wq eqw eqwe qw eq dwqedq w dewqdewqe qw eqwe qw eqw eqwe wq</div>\r\n<div>\r\n	event 2 asdas dawe dqw ewqe wq eqw eqwe qw eq dwqedq w dewqdewqe qw eqwe qw eqw eqwe wq</div>\r\n<div>\r\n	event 2 asdas dawe dqw ewqe wq eqw eqwe qw eq dwqedq w dewqdewqe qw eqwe qw eqw eqwe wq</div>\r\n<div>\r\n	event 2 asdas dawe dqw ewqe wq eqw eqwe qw eq dwqedq w dewqdewqe qw eqwe qw eqw eqwe wqevent 2 asdas dawe dqw ewqe wq eqw eqwe qw eq dwqedq w dewqdewqe qw eqwe qw eqw eqwe wqevent 2 asdas dawe dqw ewqe wq eqw eqwe qw eq dwqedq w dewqdewqe qw eqwe qw eqw eqwe wqevent 2 asdas dawe dqw ewqe wq eqw eqwe qw eq dwqedq w dewqdewqe qw eqwe qw eqw eqwe wqevent 2 asdas dawe dqw ewqe wq eqw eqwe qw eq dwqedq w dewqdewqe qw eqwe qw eqw eqwe wqevent 2 asdas dawe dqw ewqe wq eqw eqwe qw eq dwqedq w dewqdewqe qw eqwe qw eqw eqwe wqevent 2 asdas dawe dqw ewqe wq eqw eqwe qw eq dwqedq w dewqdewqe qw eqwe qw eqw eqwe wqevent 2 asdas dawe dqw ewqe wq eqw eqwe qw eq dwqedq w dewqdewqe qw eqwe qw eqw eqwe wqevent 2 asdas dawe dqw ewqe wq eqw eqwe qw eq dwqedq w dewqdewqe qw eqwe qw eqw eqwe wqevent 2 asdas dawe dqw ewqe wq eqw eqwe qw eq dwqedq w dewqdewqe qw eqwe qw eqw eqwe wq</div>\r\n<div>\r\n	event 2 asdas dawe dqw ewqe wq eqw eqwe qw eq dwqedq w dewqdewqe qw eqwe qw eqw eqwe wq</div>\r\n<div>\r\n	event 2 asdas dawe dqw ewqe wq eqw eqwe qw eq dwqedq w dewqdewqe qw eqwe qw eqw eqwe wqevent 2 asdas dawe dqw ewqe wq eqw eqwe qw eq dwqedq w dewqdewqe qw eqwe qw eqw eqwe wqevent 2 asdas dawe dqw ewqe wq eqw eqwe qw eq dwqedq w dewqdewqe qw eqwe qw eqw eqwe wqevent 2 asdas dawe dqw ewqe wq eqw eqwe qw eq dwqedq w dewqdewqe qw eqwe qw eqw eqwe wq</div>\r\n<div>\r\n	event 2 asdas dawe dqw ewqe wq eqw eqwe qw eq dwqedq w dewqdewqe qw eqwe qw eqw eqwe wqevent 2 asdas dawe dqw ewqe wq eqw eqwe qw eq dwqedq w dewqdewqe qw eqwe qw eqw eqwe wqevent 2 asdas dawe dqw ewqe wq eqw eqwe qw eq dwqedq w dewqdewqe qw eqwe qw eqw eqwe wq</div>\r\n<div>\r\n	event 2 asdas dawe dqw ewqe wq eqw eqwe qw eq dwqedq w dewqdewqe qw eqwe qw eqw eqwe wqevent 2 asdas dawe dqw ewqe wq eqw eqwe qw eq dwqedq w dewqdewqe qw eqwe qw eqw eqwe wq</div>\r\n<div>\r\n	event 2 asdas dawe dqw ewqe wq eqw eqwe qw eq dwqedq w dewqdewqe qw eqwe qw eqw eqwe wq</div>\r\n','event 2','event 2','event 2',3,1,3,NULL,'event 2',NULL,'2013-02-12 00:00:00',1),(38,'event 2','<div>\r\n	asdasd asdsad ads adsasdsadasd &nbsp;fadsfasdf dasfsdf s dfdsfsd fsdf sd fd sfsdfsdf sdf&nbsp;</div>\r\n<div>\r\n	sd fsd fas dw sdfsd fsd fs dffg fdg df gfd gds fasfe sd f</div>\r\n<div>\r\n	dsfs df dfdedfgfggfsw &nbsp;defdsf &nbsp;dfdsfed ds fdsfdsfsdf &nbsp;gfdgsdfge sd f</div>\r\n<div>\r\n	<div>\r\n		asdasd asdsad ads adsasdsadasd &nbsp;fadsfasdf dasfsdf s dfdsfsd fsdf sd fd sfsdfsdf sdf&nbsp;</div>\r\n	<div>\r\n		sd fsd fas dw sdfsd fsd fs dffg fdg df gfd gds fasfe sd f</div>\r\n	<div>\r\n		dsfs df dfdedfgfggfsw &nbsp;defdsf &nbsp;dfdsfed ds fdsfdsfsdf &nbsp;gfdgsdfge sd f</div>\r\n	<div>\r\n		<div>\r\n			asdasd asdsad ads adsasdsadasd &nbsp;fadsfasdf dasfsdf s dfdsfsd fsdf sd fd sfsdfsdf sdf&nbsp;</div>\r\n		<div>\r\n			sd fsd fas dw sdfsd fsd fs dffg fdg df gfd gds fasfe sd f</div>\r\n		<div>\r\n			dsfs df dfdedfgfggfsw &nbsp;defdsf &nbsp;dfdsfed ds fdsfdsfsdf &nbsp;gfdgsdfge sd f</div>\r\n		<div>\r\n			<div>\r\n				asdasd asdsad ads adsasdsadasd &nbsp;fadsfasdf dasfsdf s dfdsfsd fsdf sd fd sfsdfsdf sdf&nbsp;</div>\r\n			<div>\r\n				sd fsd fas dw sdfsd fsd fs dffg fdg df gfd gds fasfe sd f</div>\r\n			<div>\r\n				dsfs df dfdedfgfggfsw &nbsp;defdsf &nbsp;dfdsfed ds fdsfdsfsdf &nbsp;gfdgsdfge sd f</div>\r\n			<div>\r\n				<div>\r\n					asdasd asdsad ads adsasdsadasd &nbsp;fadsfasdf dasfsdf s dfdsfsd fsdf sd fd sfsdfsdf sdf&nbsp;</div>\r\n				<div>\r\n					sd fsd fas dw sdfsd fsd fs dffg fdg df gfd gds fasfe sd f</div>\r\n				<div>\r\n					dsfs df dfdedfgfggfsw &nbsp;defdsf &nbsp;dfdsfed ds fdsfdsfsdf &nbsp;gfdgsdfge sd f</div>\r\n				<div>\r\n					<div>\r\n						asdasd asdsad ads adsasdsadasd &nbsp;fadsfasdf dasfsdf s dfdsfsd fsdf sd fd sfsdfsdf sdf&nbsp;</div>\r\n					<div>\r\n						sd fsd fas dw sdfsd fsd fs dffg fdg df gfd gds fasfe sd f</div>\r\n					<div>\r\n						dsfs df dfdedfgfggfsw &nbsp;defdsf &nbsp;dfdsfed ds fdsfdsfsdf &nbsp;gfdgsdfge sd f</div>\r\n					<div>\r\n						<div>\r\n							asdasd asdsad ads adsasdsadasd &nbsp;fadsfasdf dasfsdf s dfdsfsd fsdf sd fd sfsdfsdf sdf&nbsp;</div>\r\n						<div>\r\n							sd fsd fas dw sdfsd fsd fs dffg fdg df gfd gds fasfe sd f</div>\r\n						<div>\r\n							dsfs df dfdedfgfggfsw &nbsp;defdsf &nbsp;dfdsfed ds fdsfdsfsdf &nbsp;gfdgsdfge sd f</div>\r\n						<div>\r\n							<div>\r\n								asdasd asdsad ads adsasdsadasd &nbsp;fadsfasdf dasfsdf s dfdsfsd fsdf sd fd sfsdfsdf sdf&nbsp;</div>\r\n							<div>\r\n								sd fsd fas dw sdfsd fsd fs dffg fdg df gfd gds fasfe sd f</div>\r\n							<div>\r\n								dsfs df dfdedfgfggfsw &nbsp;defdsf &nbsp;dfdsfed ds fdsfdsfsdf &nbsp;gfdgsdfge sd fasdasd asdsad ads adsasdsadasd &nbsp;fadsfasdf dasfsdf s dfdsfsd fsdf sd fd sfsdfsdf sdf&nbsp;</div>\r\n							<div>\r\n								sd fsd fas dw sdfsd fsd fs dffg fdg df gfd gds fasfe sd f</div>\r\n							<div>\r\n								dsfs df dfdedfgfggfsw &nbsp;defdsf &nbsp;dfdsfed ds fdsfdsfsdf &nbsp;gfdgsdfge sd f</div>\r\n							<div>\r\n								<div>\r\n									asdasd asdsad ads adsasdsadasd &nbsp;fadsfasdf dasfsdf s dfdsfsd fsdf sd fd sfsdfsdf sdf&nbsp;</div>\r\n								<div>\r\n									sd fsd fas dw sdfsd fsd fs dffg fdg df gfd gds fasfe sd f</div>\r\n								<div>\r\n									dsfs df dfdedfgfggfsw &nbsp;defdsf &nbsp;dfdsfed ds fdsfdsfsdf &nbsp;gfdgsdfge sd f</div>\r\n							</div>\r\n						</div>\r\n					</div>\r\n				</div>\r\n			</div>\r\n		</div>\r\n	</div>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','event 2','event 2','event 2',3,1,2,NULL,'sasawq  wdw dwd  das da sa\r\nsd adsa sa sas fd dfww ',NULL,'2013-02-13 00:00:00',1),(39,'event 3','<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asdsadsad sad sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asdsadsad sad</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asdsadsad sad</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asdsadsad sad</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asdsadsad sad</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n<div>\r\n	sadsad sad asdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asdsadsad sadasdas dqw qw qw wq ewq ew ew as dasd as das das dsadasdasdasd asd</div>\r\n','event 3','event 3','event 3',3,1,1,NULL,'sda asd as d sad asd asd \r\nasd  asdsad asd ',NULL,'2012-12-11 00:00:00',1),(40,'חדשות 1','<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;שדגש דג שדג שדגשדגשד גשדג שדג שדג שדג שדגשדגשדגש דגשדג ש גשדג שד גשדגכשד &nbsp;ג ג</div>\r\n<div>\r\n	&nbsp;שדגש דג שדג שדגשדגשד גשדג שדג שדג שדג שדגשדגשדגש דגשדג ש גשדג שד גשדגכשד &nbsp;ג ג</div>\r\n<div>\r\n	&nbsp;שדגש דג שדג שדגשדגשד גשדג שדג שדג שדג שדגשדגשדגש דגשדג ש גשדג שד גשדגכשד &nbsp;ג ג</div>\r\n<div>\r\n	&nbsp;שדגש דג שדג שדגשדגשד גשדג שדג שדג שדג שדגשדגשדגש דגשדג ש גשדג שד גשדגכשד &nbsp;ג ג&nbsp;שדגש דג שדג שדגשדגשד גשדג שדג שדג שדג שדגשדגשדגש דגשדג ש גשדג שד גשדגכשד &nbsp;ג ג&nbsp;שדגש דג שדג שדגשדגשד גשדג שדג שדג שדג שדגשדגשדגש דגשדג ש גשדג שד גשדגכשד &nbsp;ג ג</div>\r\n<div>\r\n	&nbsp;שדגש דג שדג שדגשדגשד גשדג שדג שדג שדג שדגשדגשדגש דגשדג ש גשדג שד גשדגכשד &nbsp;ג ג</div>\r\n<div>\r\n	&nbsp;שדגש דג שדג שדגשדגשד גשדג שדג שדג שדג שדגשדגשדגש דגשדג ש גשדג שד גשדגכשד &nbsp;ג ג&nbsp;שדגש דג שדג שדגשדגשד גשדג שדג שדג שדג שדגשדגשדגש דגשדג ש גשדג שד גשדגכשד &nbsp;ג ג&nbsp;שדגש דג שדג שדגשדגשד גשדג שדג שדג שדג שדגשדגשדגש דגשדג ש גשדג שד גשדגכשד &nbsp;ג ג&nbsp;שדגש דג שדג שדגשדגשד גשדג שדג שדג שדג שדגשדגשדגש דגשדג ש גשדג שד גשדגכשד &nbsp;ג ג&nbsp;שדגש דג שדג שדגשדגשד גשדג שדג שדג שדג שדגשדגשדגש דגשדג ש גשדג שד גשדגכשד &nbsp;ג ג&nbsp;שדגש דג שדג שדגשדגשד גשדג שדג שדג שדג שדגשדגשדגש דגשדג ש גשדג שד גשדגכשד &nbsp;ג ג&nbsp;שדגש דג שדג שדגשדגשד גשדג שדג שדג שדג שדגשדגשדגש דגשדג ש גשדג שד גשדגכשד &nbsp;ג ג&nbsp;שדגש דג שדג שדגשדגשד גשדג שדג שדג שדג שדגשדגשדגש דגשדג ש גשדג שד גשדגכשד &nbsp;ג ג&nbsp;שדגש דג שדג שדגשדגשד גשדג שדג שדג שדג שדגשדגשדגש דגשדג ש גשדג שד גשדגכשד &nbsp;ג ג&nbsp;שדגש דג שדג שדגשדגשד גשדג שדג שדג שדג שדגשדגשדגש דגשדג ש גשדג שד גשדגכשד &nbsp;ג ג&nbsp;שדגש דג שדג שדגשדגשד גשדג שדג שדג שדג שדגשדגשדגש דגשדג ש גשדג שד גשדגכשד &nbsp;ג ג&nbsp;שדגש דג שדג שדגשדגשד גשדג שדג שדג שדג שדגשדגשדגש דגשדג ש גשדג שד גשדגכשד &nbsp;ג ג&nbsp;שדגש דג שדג שדגשדגשד גשדג שדג שדג שדג שדגשדגשדגש דגשדג ש גשדג שד גשדגכשד &nbsp;ג ג&nbsp;שדגש דג שדג שדגשדגשד גשדג שדג שדג שדג שדגשדגשדגש דגשדג ש גשדג שד גשדגכשד &nbsp;ג ג&nbsp;שדגש דג שדג שדגשדגשד גשדג שדג שדג שדג שדגשדגשדגש דגשדג ש גשדג שד גשדגכשד &nbsp;ג ג&nbsp;שדגש דג שדג שדגשדגשד גשדג שדג שדג שדג שדגשדגשדגש דגשדג ש גשדג שד גשדגכשד &nbsp;ג ג&nbsp;שדגש דג שדג שדגשדגשד גשדג שדג שדג שדג שדגשדגשדגש דגשדג ש גשדג שד גשדגכשד &nbsp;ג ג&nbsp;שדגש דג שדג שדגשדגשד גשדג שדג שדג שדג שדגשדגשדגש דגשדג ש גשדג שד גשדגכשד &nbsp;ג ג&nbsp;שדגש דג שדג שדגשדגשד גשדג שדג שדג שדג שדגשדגשדגש דגשדג ש גשדג שד גשדגכשד &nbsp;ג ג&nbsp;שדגש דג שדג שדגשדגשד גשדג שדג שדג שדג שדגשדגשדגש דגשדג ש גשדג שד גשדגכשד &nbsp;ג ג</div>\r\n','חדשות 1','חדשות 1','חדשות 1',30,1,2,NULL,'דגדשג שדגשדג שד שדג שדג שדגשד',NULL,'2013-02-05 00:00:00',3),(41,'asdsad','<div>\r\n	sadasd</div>\r\n','asdasd','asdsad','asdsad',30,1,1,NULL,'asdasd',NULL,'2013-02-11 00:00:00',3),(42,'asdasd','<div>\r\n	asdasdas ad a das dasd</div>\r\n<div>\r\n	sadasdasd</div>\r\n<div>\r\n	asd</div>\r\n','asdasdas','asdasd','asdasd',31,1,2,NULL,'asdasdasd',NULL,'2013-02-20 00:00:00',3),(43,'דגכדג כדגכדג כ','<div>\r\n	דגכדגכדגכ</div>\r\n','דגכדגכ','דגכדגכגד','דגכדגכ',31,1,1,NULL,'sdfsdfsdf',NULL,'2013-02-07 00:00:00',3),(44,'שדגשדג','<div>\r\n	שדג שגדדג שד ג גדשג שד גשדג שדג שדג שדג דשג</div>\r\n<div>\r\n	שד גשדג שדג&nbsp;</div>\r\n','דשגשדג','שגדשדג','דשגשדג',32,1,2,NULL,'דשגדשגשד ש גדגד ',NULL,'2013-02-06 00:00:00',3),(45,'גדעכיגיח י','<div>\r\n	כחכעיחכעיח</div>\r\n','כעיכע יכעי ','כי כעי י','ככעי כעיעכ',32,1,1,NULL,'כעיחכעח יחעכג ידכיכע',NULL,'2013-02-14 00:00:00',3),(46,'Spindate News',NULL,NULL,NULL,NULL,0,1,1,'../images/siteuserImages/ca9604c6-6024-47f5-b46b-b198df2ed2ef_icon.png',NULL,NULL,'2012-01-01 00:00:00',4),(47,'Articles',NULL,NULL,NULL,NULL,0,1,2,'../images/siteuserImages/ca9604c6-6024-47f5-b46b-b198df2ed2ef_icon.png',NULL,NULL,'2012-01-01 00:00:00',4),(48,'Events',NULL,NULL,NULL,NULL,0,1,3,'../images/siteuserImages/7c0a757c-96c3-4cd4-b8e7-fca54dd89b12_icon.png',NULL,NULL,'2012-01-01 00:00:00',4);
/*!40000 ALTER TABLE `tblevents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblgames`
--

DROP TABLE IF EXISTS `tblgames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblgames` (
  `idtblgames` int(11) NOT NULL AUTO_INCREMENT,
  `gamelink` varchar(255) DEFAULT NULL,
  `gamename` varchar(100) DEFAULT NULL,
  `showgame` tinyint(1) DEFAULT NULL,
  `gameorder` int(11) DEFAULT NULL,
  `gamecontent` text,
  `gametype` int(11) DEFAULT '1',
  `gamelang` int(11) DEFAULT '1',
  PRIMARY KEY (`idtblgames`),
  KEY `waiting1` (`showgame`,`gametype`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblgames`
--

LOCK TABLES `tblgames` WRITE;
/*!40000 ALTER TABLE `tblgames` DISABLE KEYS */;
INSERT INTO `tblgames` VALUES (1,'http://www.w3schools.com/','w3school',1,1,'<div>\r\n	asdasdasdasd</div>\r\n',4,1),(2,'http://www.ynet.co.il','ynet',1,2,'<div>\r\n	asdfa ddasadasd asd</div>\r\n<div>\r\n	&nbsp;asdas d das dasdas das dasdad</div>\r\n<div>\r\n	&nbsp;asdasd<img alt=\"\" src=\"/spindate.co.il/uploads/images/mickey-mouse-5.jpg\" style=\"width: 100px; height: 131px;\" /></div>\r\n<div>\r\n	kgiguygyug</div>\r\n',2,1),(3,'http://fun.walla.co.il/?w=/2250/2579160','walla',1,3,'<div>\r\n	asdfa ddasadasd asd</div>\r\n<div>\r\n	&nbsp;asdas d das dasdas das dasdad</div>\r\n<div>\r\n	&nbsp;asdasd<img alt=\"\" src=\"/spindate.co.il/uploads/images/mickey-mouse-5.jpg\" style=\"width: 100px; height: 131px;\" /></div>\r\n<div>\r\n	kgiguygyugsdf sfsdfsdf</div>\r\n',1,1),(4,NULL,'Content',1,NULL,'<div>\r\n	sadas asdas dasdasd</div>\r\n<div>\r\n	as dasdasdas</div>\r\n<div>\r\n	a sdasd asda</div>\r\n',3,1),(5,NULL,'asdasdasd',0,NULL,'<div>\r\n	asdas as dsa da d asd</div>\r\n<div>\r\n	asd asd ads&nbsp;</div>\r\n<div>\r\n	as das dad</div>\r\n<div>\r\n	as das</div>\r\n<div>\r\n	das</div>\r\n<div>\r\n	&nbsp;</div>\r\n',2,3),(6,NULL,'walla',1,NULL,'<div>\r\n	SDFSD FSD FSDF</div>\r\n<div>\r\n	SDFSDF</div>\r\n',6,1),(7,NULL,'SDFSDFDSF',1,NULL,'<div>\r\n	SAD AS D D D SAD</div>\r\n',1,1),(8,NULL,'SADASD ASD SAD',0,NULL,'<div>\r\n	ASDAS ASD DS AS DAS</div>\r\n',1,1);
/*!40000 ALTER TABLE `tblgames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblguide`
--

DROP TABLE IF EXISTS `tblguide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblguide` (
  `tblguideid` int(11) NOT NULL AUTO_INCREMENT,
  `guidstageName` varchar(45) DEFAULT NULL,
  `guideimage` varchar(100) DEFAULT NULL,
  `guideorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`tblguideid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblguide`
--

LOCK TABLES `tblguide` WRITE;
/*!40000 ALTER TABLE `tblguide` DISABLE KEYS */;
INSERT INTO `tblguide` VALUES (2,'stage 1','../images/stages/myimage1df38d3_size0.png',2),(3,'stage2','../images/stages/myimage2ef382f_size0.png',3),(4,'stage3','../images/stages/myimage36ef303_size0.png',4),(5,'stage4','../images/stages/myimage4980dac_size0.png',5),(6,'stage 12','../images/stages/myimage12a56228_size0.png',13),(8,'stage 5','../images/stages/myimage5a2809b_size0.png',6),(9,'stage 6','../images/stages/myimage6bb50e2_size0.png',7),(10,'stage 7','../images/stages/myimage7a354b3_size0.png',8),(11,'stage 8 ','../images/stages/myimage8e41c0a_size0.png',9),(12,'stage 9','../images/stages/myimage96987a1_size0.png',10),(13,'stage 10','../images/stages/myimage10595719_size0.png',11),(14,'stage 11','../images/stages/myimage11a71686_size0.png',12),(15,'sdasdsa','../images/stages/searchbox74e4e6_size0.png',1);
/*!40000 ALTER TABLE `tblguide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhelpcenter`
--

DROP TABLE IF EXISTS `tblhelpcenter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblhelpcenter` (
  `idtblhelpcenter` int(11) NOT NULL AUTO_INCREMENT,
  `helpheader` varchar(210) DEFAULT NULL,
  `helpcontent` text,
  `helpTitle` varchar(45) DEFAULT NULL,
  `helpDescription` varchar(45) DEFAULT NULL,
  `helpkeyWord` varchar(45) DEFAULT NULL,
  `helpParent` int(11) DEFAULT NULL,
  `showHelp` tinyint(1) DEFAULT NULL,
  `helpOrder` int(11) DEFAULT NULL,
  `helpimg` varchar(210) DEFAULT NULL,
  `helpShortDesc` text,
  `eventspublish` datetime NOT NULL DEFAULT '2000-03-03 00:00:00',
  `eventLang` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idtblhelpcenter`),
  KEY `helpcenter` (`showHelp`,`eventLang`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhelpcenter`
--

LOCK TABLES `tblhelpcenter` WRITE;
/*!40000 ALTER TABLE `tblhelpcenter` DISABLE KEYS */;
INSERT INTO `tblhelpcenter` VALUES (1,'My Account ','','My Account ','My Account ','My Account ',0,1,10,'../images/siteuserImages/a8633390-19b6-4969-bcd0-359972d46ae5_icon.png','If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you','2000-03-03 00:00:00',1),(2,'Getting Started',NULL,NULL,NULL,NULL,0,1,11,'../images/siteuserImages/d165747f-5b50-49d1-bf41-f11a8f7d89c6_icon.png','If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you','2000-03-03 00:00:00',1),(3,'Premium Member',NULL,NULL,NULL,NULL,0,1,12,'../images/siteuserImages/1127439d-3a9e-4ea9-80d8-cf2b83308e10_icon.png','If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you','2000-03-03 00:00:00',1),(4,'My Account ',NULL,NULL,NULL,NULL,0,1,13,'../images/siteuserImages/0c9df43d-3d7f-46b3-82fc-92bd5e80b688_icon.png','If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you','2000-03-03 00:00:00',1),(5,'How do I create an account?','If you are encountering issues with Spindate such as display or responsiveness issues, we ask that youHow do I create an account?<br />\r\nplease clear your Internet browser&#39;s file cache. Please note, this may cause your account preferences to be<br />\r\nHow do I create an account?<br />\r\nWe have included video tutorials below for the most common.<br />\r\n<br />\r\n<img alt=\"\" src=\"/spindate.co.il/uploads/images/helpimage.png\" style=\"width: 462px; height: 250px; \" /><br />\r\n<br />\r\nIf you are encountering issues with Spindate such as display or responsiveness issues, we ask that youHow do I create an account?<br />\r\nplease clear your Internet browser&#39;s file cache. Please note, this may cause your account preferences to be<br />\r\nHow do I create an account?<br />\r\nWe have included video tutorials below for the most common.<br />\r\n','How do I create an account?','How do I create an account?','',1,1,10,'','If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you\r\nIf you are encountering issues with Spindate such as display or responsiveness issues, we ask that you','2000-03-03 00:00:00',1),(6,'Why should I create an account?','Why should I create an account?','Why should I create an account?','Why should I create an account?','',1,1,15,NULL,'If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you','2000-03-03 00:00:00',1),(7,'Why should I create an account?','Why should I create an account?','Why should I create an account?','Why should I create an account?','',1,1,11,'','If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you','2000-03-03 00:00:00',1),(8,'Why should I create an account?','Why should I create an account?','Why should I create an account?','Why should I create an account?','',1,1,12,NULL,'If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you','2000-03-03 00:00:00',1),(9,'Why should I create an account?','Why should I create an account?','Why should I create an account?','Why should I create an account?','',1,1,13,NULL,'If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you','2000-03-03 00:00:00',1),(10,'Why should I create an account?','Why should I create an account?','Why should I create an account?','Why should I create an account?','',1,1,14,NULL,'If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you','2000-03-03 00:00:00',1),(11,'Why should I create an account?','Why should I create an account?','Why should I create an account?','Why should I create an account?','',2,1,10,NULL,'If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you','2000-03-03 00:00:00',1),(12,'Why should I create an account?','Why should I create an account?','Why should I create an account?','Why should I create an account?','',2,1,11,NULL,'If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you','2000-03-03 00:00:00',1),(13,'Why should I create an account?','Why should I create an account?','Why should I create an account?','Why should I create an account?','',2,1,12,NULL,'If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you','2000-03-03 00:00:00',1),(14,'Why should I create an account?','Why should I create an account?','Why should I create an account?','Why should I create an account?','',2,1,13,NULL,'If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you','2000-03-03 00:00:00',1),(15,'Why should I create an account?','Why should I create an account?','Why should I create an account?','Why should I create an account?','',2,1,14,NULL,'If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you','2000-03-03 00:00:00',1),(17,'Why should I create an account?','Why should I create an account?','Why should I create an account?','Why should I create an account?','',2,1,15,NULL,'If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you','2000-03-03 00:00:00',1),(18,'Why should I create an account?','Why should I create an account?','Why should I create an account?','Why should I create an account?','',2,1,16,NULL,'If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you','2000-03-03 00:00:00',1),(19,'Why should I create an account?','Why should I create an account?','Why should I create an account?','Why should I create an account?','',2,1,17,NULL,'If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you','2000-03-03 00:00:00',1),(20,'Why should I create an account?','Why should I create an account?','Why should I create an account?','Why should I create an account?','',2,1,18,NULL,'If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you','2000-03-03 00:00:00',1),(21,'Why should I create an account?','Why should I create an account?','Why should I create an account?','Why should I create an account?','',3,1,10,NULL,'If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you','2000-03-03 00:00:00',1),(22,'Why should I create an account?','Why should I create an account?','Why should I create an account?','Why should I create an account?','',3,1,11,NULL,'If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you','2000-03-03 00:00:00',1),(23,'Why should I create an account?','Why should I create an account?','Why should I create an account?','Why should I create an account?','',3,1,12,NULL,'If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you','2000-03-03 00:00:00',1),(25,'Why should I create an account?','Why should I create an account?','Why should I create an account?','Why should I create an account?','',3,1,13,NULL,'If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you','2000-03-03 00:00:00',1),(26,'Why should I create an account?','Why should I create an account?','Why should I create an account?','Why should I create an account?','',4,1,10,NULL,'If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you If you are encountering issues with Spindate such as display or responsiveness issues, we ask that you','2000-03-03 00:00:00',1),(27,'asdasd','','sadsad','sadasd','sadasd',0,1,7,'../images/temp/giftDubid12e33_size0.png','','2012-12-02 00:00:00',1),(28,'asdasdas','','sadsad','asdasd',NULL,27,1,6,NULL,'asdasd','2012-12-19 00:00:00',1),(29,'מאמרים','','asdasd','asdasda',NULL,0,1,2,'../images/temp/1127439d-3a9e-4ea9-80d8-cf2b83308e10_icona1fa10_size0.png','','2012-12-17 00:00:00',3),(30,'כתבה','<div>\r\n	שד גשדג שד ג</div>\r\n<div>\r\n	שדג&nbsp;</div>\r\n<div>\r\n	שדג&nbsp;</div>\r\n<div>\r\n	דשגשדג שד גשדג שדג שג שג שדג שדג</div>\r\n<div>\r\n	שדג</div>\r\n<div>\r\n	שדג&nbsp;</div>\r\n<div>\r\n	שדג</div>\r\n<div>\r\n	&nbsp;שדג</div>\r\n<div>\r\n	&nbsp;שדג</div>\r\n<div>\r\n	&nbsp;</div>\r\n','שדגשדגשד','גשדגשדג',NULL,29,1,1,'','דשגד ג דשג דשגדגשד גשדג שדג שדג \r\nשד שדג שדג\r\nשד \r\nשדג ','2012-12-02 00:00:00',3);
/*!40000 ALTER TABLE `tblhelpcenter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbllang`
--

DROP TABLE IF EXISTS `tbllang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbllang` (
  `idtbllang` int(11) NOT NULL AUTO_INCREMENT,
  `langname` varchar(45) DEFAULT NULL,
  `showlang` tinyint(1) DEFAULT NULL,
  `1` varchar(45) DEFAULT NULL,
  `3` varchar(45) DEFAULT NULL,
  `comment5` varchar(255) DEFAULT NULL,
  `7` varchar(255) DEFAULT NULL,
  `comment7` varchar(255) DEFAULT NULL,
  `comment8` varchar(255) DEFAULT NULL,
  `4` varchar(255) DEFAULT NULL,
  `comment4` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idtbllang`),
  KEY `setting1` (`showlang`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbllang`
--

LOCK TABLES `tbllang` WRITE;
/*!40000 ALTER TABLE `tbllang` DISABLE KEYS */;
INSERT INTO `tbllang` VALUES (1,'english',1,'english','אנגלית',NULL,'english',NULL,NULL,'english',NULL),(2,'hebrew',1,'hebrew','עברית',NULL,'hebrew',NULL,NULL,'hebrew',NULL),(6,'spanish',1,'spanish','ספרדית',NULL,'spanish',NULL,NULL,'spanish',NULL),(7,'Chinese',1,'Chinese','סינית',NULL,'Chinese',NULL,NULL,'Chinese',NULL),(8,'Dutch',1,'Dutch','הולנדית',NULL,'Dutch',NULL,NULL,'Dutch',NULL),(9,'French',1,'French','צרפתית',NULL,'French',NULL,NULL,'French',NULL),(10,'German',1,'German','גרמנית',NULL,'German',NULL,NULL,'German',NULL),(11,'Hindi',1,'Hindi','הינדי',NULL,'Hindi',NULL,NULL,'Hindi',NULL),(12,'Italian',1,'Italian','איטלקית',NULL,'Italian',NULL,NULL,'Italian',NULL),(13,'Japanese',1,'Japanese','יפנית',NULL,'Japanese',NULL,NULL,'Japanese',NULL),(14,'Norwegian',1,'Norwegian',NULL,NULL,'Norwegian',NULL,NULL,'Norwegian',NULL),(15,'Portuguese',1,'Portuguese',NULL,NULL,'Portuguese',NULL,NULL,'Portuguese',NULL),(16,'Russian',1,'Russian',NULL,NULL,'Russian',NULL,NULL,'Russian',NULL),(17,'Swedish',1,'Swedish',NULL,NULL,'Swedish',NULL,NULL,'Swedish',NULL),(18,'Arabic',1,'Arabic','ערבית',NULL,'Arabic',NULL,NULL,'Arabic',NULL);
/*!40000 ALTER TABLE `tbllang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblonline`
--

DROP TABLE IF EXISTS `tblonline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblonline` (
  `idtblonline` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtblonline`),
  KEY `alert1` (`memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblonline`
--

LOCK TABLES `tblonline` WRITE;
/*!40000 ALTER TABLE `tblonline` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblonline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblonlineroom`
--

DROP TABLE IF EXISTS `tblonlineroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblonlineroom` (
  `tblonlineroomid` int(11) NOT NULL AUTO_INCREMENT,
  `inviterid` int(11) DEFAULT NULL,
  `reciverid` int(11) DEFAULT NULL,
  `iswaitroom` tinyint(1) DEFAULT '0',
  `datepublished` datetime DEFAULT NULL,
  `datetype` tinyint(4) DEFAULT '1',
  `chatbg` int(4) DEFAULT '1',
  `starttime` datetime DEFAULT NULL,
  `isfavo` int(1) DEFAULT '3',
  PRIMARY KEY (`tblonlineroomid`),
  KEY `online1` (`iswaitroom`,`inviterid`,`starttime`),
  KEY `online2` (`reciverid`,`iswaitroom`,`starttime`),
  KEY `online3` (`inviterid`,`reciverid`,`starttime`,`iswaitroom`),
  KEY `waiting1` (`inviterid`,`iswaitroom`,`starttime`),
  KEY `waiting2` (`reciverid`,`starttime`,`iswaitroom`)
) ENGINE=InnoDB AUTO_INCREMENT=755 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblonlineroom`
--

LOCK TABLES `tblonlineroom` WRITE;
/*!40000 ALTER TABLE `tblonlineroom` DISABLE KEYS */;
INSERT INTO `tblonlineroom` VALUES (677,28,30,1,'2013-08-04 14:51:50',1,1,'2013-08-04 14:52:04',3),(678,30,28,1,'2013-08-04 15:58:26',0,2,'2013-08-04 15:58:38',3),(679,28,30,1,'2013-08-04 15:59:25',1,1,NULL,4),(680,28,30,1,'2013-08-05 14:28:04',1,3,'2013-08-05 14:28:16',3),(681,28,30,1,'2013-08-05 14:31:59',1,1,NULL,3),(682,28,30,1,'2013-08-05 14:32:12',0,1,NULL,3),(683,28,30,1,'2013-08-05 14:32:40',1,2,NULL,3),(684,28,37,1,'2013-08-05 14:57:34',0,1,'2013-08-05 14:57:47',3),(685,28,30,1,'2013-08-05 17:36:40',0,3,'2013-08-05 17:36:53',3),(686,28,30,1,'2013-08-06 09:12:53',1,3,NULL,3),(687,30,28,1,'2013-08-06 09:14:51',1,1,NULL,3),(688,30,28,1,'2013-08-06 09:16:32',1,2,NULL,3),(689,28,30,1,'2013-08-06 09:16:54',1,1,NULL,3),(690,30,28,1,'2013-08-06 09:18:43',1,3,NULL,3),(691,30,28,1,'2013-08-06 09:22:13',1,2,NULL,3),(692,30,28,1,'2013-08-06 09:25:41',0,1,NULL,3),(693,30,28,1,'2013-08-06 09:26:23',0,3,'2013-08-06 09:27:08',3),(694,28,30,1,'2013-08-06 09:26:45',0,1,NULL,3),(695,30,28,1,'2013-08-06 09:27:14',1,3,NULL,3),(696,30,28,1,'2013-08-06 09:28:27',0,2,NULL,3),(697,28,30,1,'2013-08-06 09:30:17',1,1,'2013-08-06 09:31:01',3),(698,28,30,1,'2013-08-06 09:31:06',0,1,'2013-08-06 09:31:49',3),(699,28,30,1,'2013-08-06 09:34:43',0,1,'2013-08-06 09:35:25',3),(700,28,30,1,'2013-08-06 09:39:48',0,1,'2013-08-06 09:40:30',3),(701,28,30,1,'2013-08-06 09:41:25',0,3,'2013-08-06 09:42:09',3),(702,30,28,1,'2013-08-06 09:42:50',0,2,'2013-08-06 09:43:33',3),(703,28,30,1,'2013-08-06 09:45:41',0,1,'2013-08-06 09:46:23',3),(704,28,30,1,'2013-08-06 09:46:41',0,2,'2013-08-06 09:47:24',3),(705,28,30,1,'2013-08-06 09:51:06',1,2,'2013-08-06 09:51:49',3),(706,28,30,1,'2013-08-06 09:53:07',1,3,'2013-08-06 09:53:49',3),(707,28,30,1,'2013-08-06 09:53:43',0,3,'2013-08-06 09:54:25',3),(708,30,28,1,'2013-08-06 09:54:40',1,3,'2013-08-06 09:55:22',3),(709,28,30,1,'2013-08-06 10:07:58',0,2,'2013-08-06 10:08:41',3),(710,28,30,1,'2013-08-06 10:18:21',1,3,'2013-08-06 10:19:10',3),(711,28,30,1,'2013-08-06 10:20:18',0,2,'2013-08-06 10:21:01',3),(712,28,30,1,'2013-08-06 10:21:15',1,1,'2013-08-06 10:21:58',3),(713,28,30,1,'2013-08-06 10:23:44',0,3,'2013-08-06 10:24:27',3),(714,28,30,1,'2013-08-06 10:24:46',1,3,'2013-08-06 10:25:29',3),(715,28,30,1,'2013-08-06 10:25:50',1,2,'2013-08-06 10:26:32',3),(716,28,30,1,'2013-08-06 10:27:07',0,3,'2013-08-06 10:27:49',3),(717,30,28,1,'2013-08-06 10:27:41',1,2,'2013-08-06 10:28:24',3),(718,28,30,1,'2013-08-06 10:28:19',0,3,'2013-08-06 10:29:01',3),(719,28,30,1,'2013-08-06 10:30:43',0,1,'2013-08-06 10:31:25',3),(720,28,30,1,'2013-08-06 10:34:02',1,1,'2013-08-06 10:34:44',3),(721,28,30,1,'2013-08-06 10:34:48',0,2,'2013-08-06 10:35:30',3),(722,28,30,1,'2013-08-06 10:35:17',0,2,'2013-08-06 10:35:59',3),(723,28,30,1,'2013-08-06 10:36:30',1,2,'2013-08-06 10:37:12',3),(724,28,30,1,'2013-08-06 10:37:58',0,3,'2013-08-06 10:38:40',3),(725,28,30,1,'2013-08-06 10:40:00',1,1,'2013-08-06 10:40:22',3),(726,28,30,1,'2013-08-06 10:43:04',1,3,'2013-08-06 10:43:29',3),(727,28,30,1,'2013-08-06 10:44:19',1,3,'2013-08-06 10:44:44',3),(728,30,28,1,'2013-08-06 10:57:29',1,1,'2013-08-06 11:02:32',3),(729,31,30,1,'2013-08-06 10:57:39',1,1,NULL,3),(730,28,30,1,'2013-08-06 10:58:47',1,2,NULL,3),(731,30,28,1,'2013-08-06 10:58:52',1,2,NULL,3),(732,28,30,1,'2013-08-06 11:03:28',1,2,NULL,3),(733,28,30,1,'2013-08-06 11:05:40',1,1,'2013-08-06 11:10:50',3),(734,31,30,1,'2013-08-06 11:05:56',1,3,NULL,3),(735,31,30,1,'2013-08-06 11:06:30',1,3,NULL,3),(736,28,30,1,'2013-08-06 11:08:43',0,3,'2013-08-06 11:13:47',3),(737,31,30,1,'2013-08-06 11:11:04',1,1,'2013-08-06 11:16:10',3),(738,31,30,1,'2013-08-06 11:23:43',1,3,'2013-08-06 11:28:46',3),(739,30,31,1,'2013-08-06 11:43:51',1,2,'2013-08-06 11:48:55',3),(740,28,31,1,'2013-08-06 11:54:00',1,2,NULL,4),(741,30,28,1,'2013-08-06 11:57:43',1,3,NULL,4),(742,28,31,1,'2013-08-06 12:05:11',1,1,NULL,3),(743,28,30,1,'2013-08-06 15:05:16',1,1,'2013-08-06 15:10:18',3),(744,28,30,1,'2013-08-06 15:05:50',0,1,'2013-08-06 15:06:20',3),(745,28,30,1,'2013-08-06 15:09:13',1,3,'2013-08-06 15:09:41',3),(746,28,30,1,'2013-08-06 15:10:31',1,2,NULL,4),(747,28,30,1,'2013-08-06 15:56:19',0,2,'2013-08-06 15:56:46',3),(748,28,30,1,'2013-08-06 16:01:23',1,1,'2013-08-06 16:01:50',3),(749,30,28,1,'2013-08-06 16:08:52',1,1,'2013-08-06 16:09:19',3),(750,28,30,1,'2013-08-06 16:10:18',0,3,'2013-08-06 16:10:45',3),(751,28,30,1,'2013-08-06 16:22:29',1,2,'2013-08-06 16:22:56',3),(752,28,30,1,'2013-08-06 18:08:57',0,2,'2013-08-06 18:09:25',3),(753,30,28,1,'2013-08-07 09:15:40',1,2,'2013-08-07 09:16:07',3),(754,28,30,1,'2013-08-07 13:37:30',1,1,NULL,4);
/*!40000 ALTER TABLE `tblonlineroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblpages`
--

DROP TABLE IF EXISTS `tblpages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblpages` (
  `idtblpages` int(11) NOT NULL AUTO_INCREMENT,
  `pagecontent` text,
  `pageseotitle` varchar(255) DEFAULT NULL,
  `pageseodesc` text,
  `pagekeyword` text,
  `pageinsite` tinyint(1) DEFAULT '0',
  `pagename` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtblpages`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblpages`
--

LOCK TABLES `tblpages` WRITE;
/*!40000 ALTER TABLE `tblpages` DISABLE KEYS */;
INSERT INTO `tblpages` VALUES (1,'<div>\r\n	page 1</div>\r\n<div style=\"direction: ltr; \">\r\n	<h2 class=\"w3b\" itemprop=\"description\" style=\"margin: 0px 0px 4px; padding: 0px; border-style: solid; border-width: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: arial;\">\r\n		מסלול התנגשות עם ההסתדרות? ראש הממשלה אישר את תכנית שר התחבורה ישראל כץ להקמת נמל העתיד - שיופעל באמצעות חברה פרטית שתחזיק בזיכיון למשך 30 שנה</h2>\r\n	<div class=\"tagsContainer\" style=\"margin: 0px 0px 7px; padding: 0px; border-style: solid; border-width: 0px; color: rgb(0, 0, 0); font-family: arial; font-size: 14px;\">\r\n		<span class=\"tagLabel w2\" style=\"margin: 0px; padding: 2px 0px; border-style: solid; border-width: 0px; font-size: 12px; display: inline-block; color: rgb(102, 102, 102);\">תגיות:</span>&nbsp;<a class=\"tag w2\" href=\"http://tags.walla.co.il/%D7%91%D7%A0%D7%99%D7%9E%D7%99%D7%9F_%D7%A0%D7%AA%D7%A0%D7%99%D7%94%D7%95\" style=\"margin: 0px 3px 0px 0px; padding: 2px 0px; border-style: solid; border-width: 0px; font-size: 12px; text-decoration: none; color: rgb(0, 0, 102); height: 10px; line-height: 10px; display: inline-block;\">בנימין נתניהו</a><span class=\"tagLabel\" style=\"margin: 0px; padding: 2px 0px; border-style: solid; border-width: 0px; display: inline-block; color: rgb(102, 102, 102);\">,</span><a class=\"tag w2\" href=\"http://tags.walla.co.il/%D7%A0%D7%9E%D7%9C_%D7%90%D7%A9%D7%93%D7%95%D7%93\" style=\"margin: 0px 3px 0px 0px; padding: 2px 0px; border-style: solid; border-width: 0px; font-size: 12px; text-decoration: none; color: rgb(0, 0, 102); height: 10px; line-height: 10px; display: inline-block;\">נמל אשדוד</a><span class=\"tagLabel\" style=\"margin: 0px; padding: 2px 0px; border-style: solid; border-width: 0px; display: inline-block; color: rgb(102, 102, 102);\">,</span><a class=\"tag w2\" href=\"http://tags.walla.co.il/%D7%A0%D7%9E%D7%9C_%D7%97%D7%99%D7%A4%D7%94\" style=\"margin: 0px 3px 0px 0px; padding: 2px 0px; border-style: solid; border-width: 0px; font-size: 12px; text-decoration: none; color: rgb(0, 0, 102); height: 10px; line-height: 10px; display: inline-block;\">נמל חיפה</a><span class=\"tagLabel\" style=\"margin: 0px; padding: 2px 0px; border-style: solid; border-width: 0px; display: inline-block; color: rgb(102, 102, 102);\">,</span><a class=\"tag w2\" href=\"http://tags.walla.co.il/%D7%94%D7%A4%D7%A8%D7%98%D7%94\" style=\"margin: 0px 3px 0px 0px; padding: 2px 0px; border-style: solid; border-width: 0px; font-size: 12px; text-decoration: none; color: rgb(0, 0, 102); height: 10px; line-height: 10px; display: inline-block;\">הפרטה</a></div>\r\n	<div class=\"pnl248_container\" style=\"margin: 0px 10px 5px 0px; padding: 0px; border-style: solid; border-width: 0px; float: left; width: 250px; display: inline; color: rgb(0, 0, 0); font-family: arial; font-size: 14px;\">\r\n		<div class=\"pnl248 pnlx\" style=\"margin: 0px; padding: 0px; border-style: solid; border-width: 0px; width: 250px; text-align: right;\">\r\n			<img alt=\"הציג אתמול את התכנית. ישראל כץ (צילום: דרור עינב)\" class=\"med248\" src=\"http://msc.wcdn.co.il/w/w-248/1224713-18.jpg\" style=\"margin: 0px; padding: 0px; border: 1px solid rgb(204, 204, 204); display: block; width: 248px;\" />\r\n			<p style=\"margin: 0px; padding: 3px 5px; border-style: solid; border-width: 0px; background-color: rgb(232, 232, 232); line-height: 15px; font-size: 11px; color: rgb(89, 89, 89); background-position: initial initial; background-repeat: initial initial;\">\r\n				הציג אתמול את התכנית. ישראל כץ (צילום: דרור עינב)</p>\r\n		</div>\r\n		<div class=\"line_break\" style=\"margin: 0px; padding: 0px; border-style: solid; border-width: 0px; font-size: 0px; line-height: 1px; height: 30px;\">\r\n			&nbsp;</div>\r\n		<div id=\"frame100\" name=\"frame100\" style=\"margin: 0px; padding: 0px; border-style: solid; border-width: 0px;\">\r\n			&nbsp;</div>\r\n	</div>\r\n	<p style=\"margin: 0px 0px 10px; padding: 0px; border-style: solid; border-width: 0px; color: rgb(0, 0, 0); font-family: arial; font-size: 14px; text-align: justify;\">\r\n		ראש הממשלה בנימין נתניהו אישר את התכנית להפרטת נמל העתיד שיוקם בחיפה או אשדוד.</p>\r\n	<p style=\"margin: 0px 0px 10px; padding: 0px; border-style: solid; border-width: 0px; color: rgb(0, 0, 0); font-family: arial; font-size: 14px; text-align: justify;\">\r\n		התכנית הוצגה לנתניהו אתמול על-ידי שר התחבורה ישראל כץ. במסגרת התכנית יפורסם בקרוב מכרז בינלאומי להפעלת נמל העתיד באמצעות חברה פרטית המתמחה בהפעלת נמלים גדולים. מכרז התפעול מצטרף למכרז ההקמה של נמל העתיד נמצא כיום בשלב המיון המוקדם. המפעיל של נמל העתיד יחזיק בזיכיון להפעלת הנמל לתקופה של 30 שנה.</p>\r\n	<p style=\"margin: 0px 0px 10px; padding: 0px; border-style: solid; border-width: 0px; color: rgb(0, 0, 0); font-family: arial; font-size: 14px; text-align: justify;\">\r\n		מדובר במהלך דרמטי שצפוי להיתקל בהתנגדות קשה מצד ועדי העובדים בחברות נמלי אשדוד וחיפה. בממשלה נערכים לאפשרות השבתה ממושכת של הנמלים. במקביל תפתח הממשלה בימים הקרובים ערוץ הידברות עם ההסתדרות. שר התחבורה ישראל כץ ומזכ&quot;ל ההסתדרות עופר עיני כדי לדון בפרטי התכנית.</p>\r\n	<p style=\"margin: 0px 0px 10px; padding: 0px; border-style: solid; border-width: 0px; color: rgb(0, 0, 0); font-family: arial; font-size: 14px; text-align: justify;\">\r\n		על-פי מידע שהגיע ל&quot;גלובס&quot; בכוונת הממשלה להבטיח לעיני כי עובדי הנמל העתידי יוכלו להתאגד ויהיו מוגנים בהסכם קיבוצי שיבטיח להם זכויות דומות לאלו של עובדי הנמלים הקיימים.</p>\r\n	<p style=\"margin: 0px 0px 10px; padding: 0px; border-style: solid; border-width: 0px; color: rgb(0, 0, 0); font-family: arial; font-size: 14px; text-align: justify;\">\r\n		שרי האוצר והתחבורה צפויים להכריע בקרוב בשאלה האם הנמל יוקם בחיפה או באשדוד - בין הערים כבר מתנהל מאבק סוער בניסיון לזכות בנמל. בפני המדינה עומדת גם האפשרות להחליט על הקמת שני נמלים בשתי הערים בו-זמנית אולם ספק אם יש למדינה יכול לממן את שני הפרויקטים במקביל. ההשקעה התקציבית בכל נמל מוערכת ב-4 מיליארד שקל.</p>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n<div>\r\n	<h2 class=\"w3b\" itemprop=\"description\" style=\"margin: 0px 0px 4px; padding: 0px; border-style: solid; border-width: 0px; font-size: 14px; color: rgb(0, 0, 0); font-family: arial;\">\r\n		מסלול התנגשות עם ההסתדרות? ראש הממשלה אישר את תכנית שר התחבורה ישראל כץ להקמת נמל העתיד - שיופעל באמצעות חברה פרטית שתחזיק בזיכיון למשך 30 שנה</h2>\r\n	<div class=\"tagsContainer\" style=\"margin: 0px 0px 7px; padding: 0px; border-style: solid; border-width: 0px; color: rgb(0, 0, 0); font-family: arial; font-size: 14px;\">\r\n		<span class=\"tagLabel w2\" style=\"margin: 0px; padding: 2px 0px; border-style: solid; border-width: 0px; font-size: 12px; display: inline-block; color: rgb(102, 102, 102);\">תגיות:</span>&nbsp;<a class=\"tag w2\" href=\"http://tags.walla.co.il/%D7%91%D7%A0%D7%99%D7%9E%D7%99%D7%9F_%D7%A0%D7%AA%D7%A0%D7%99%D7%94%D7%95\" style=\"margin: 0px 3px 0px 0px; padding: 2px 0px; border-style: solid; border-width: 0px; font-size: 12px; text-decoration: none; color: rgb(0, 0, 102); height: 10px; line-height: 10px; display: inline-block;\">בנימין נתניהו</a><span class=\"tagLabel\" style=\"margin: 0px; padding: 2px 0px; border-style: solid; border-width: 0px; display: inline-block; color: rgb(102, 102, 102);\">,</span><a class=\"tag w2\" href=\"http://tags.walla.co.il/%D7%A0%D7%9E%D7%9C_%D7%90%D7%A9%D7%93%D7%95%D7%93\" style=\"margin: 0px 3px 0px 0px; padding: 2px 0px; border-style: solid; border-width: 0px; font-size: 12px; text-decoration: none; color: rgb(0, 0, 102); height: 10px; line-height: 10px; display: inline-block;\">נמל אשדוד</a><span class=\"tagLabel\" style=\"margin: 0px; padding: 2px 0px; border-style: solid; border-width: 0px; display: inline-block; color: rgb(102, 102, 102);\">,</span><a class=\"tag w2\" href=\"http://tags.walla.co.il/%D7%A0%D7%9E%D7%9C_%D7%97%D7%99%D7%A4%D7%94\" style=\"margin: 0px 3px 0px 0px; padding: 2px 0px; border-style: solid; border-width: 0px; font-size: 12px; text-decoration: none; color: rgb(0, 0, 102); height: 10px; line-height: 10px; display: inline-block;\">נמל חיפה</a><span class=\"tagLabel\" style=\"margin: 0px; padding: 2px 0px; border-style: solid; border-width: 0px; display: inline-block; color: rgb(102, 102, 102);\">,</span><a class=\"tag w2\" href=\"http://tags.walla.co.il/%D7%94%D7%A4%D7%A8%D7%98%D7%94\" style=\"margin: 0px 3px 0px 0px; padding: 2px 0px; border-style: solid; border-width: 0px; font-size: 12px; text-decoration: none; color: rgb(0, 0, 102); height: 10px; line-height: 10px; display: inline-block;\">הפרטה</a></div>\r\n	<div class=\"pnl248_container\" style=\"margin: 0px 10px 5px 0px; padding: 0px; border-style: solid; border-width: 0px; float: left; width: 250px; display: inline; color: rgb(0, 0, 0); font-family: arial; font-size: 14px;\">\r\n		<div class=\"pnl248 pnlx\" style=\"margin: 0px; padding: 0px; border-style: solid; border-width: 0px; width: 250px; text-align: right;\">\r\n			<img alt=\"הציג אתמול את התכנית. ישראל כץ (צילום: דרור עינב)\" class=\"med248\" src=\"http://msc.wcdn.co.il/w/w-248/1224713-18.jpg\" style=\"margin: 0px; padding: 0px; border: 1px solid rgb(204, 204, 204); display: block; width: 248px;\" /><span class=\"relative block zoom1\" style=\"margin: 0px; padding: 0px; border-style: solid; border-width: 0px; display: block; position: relative; zoom: 1;\"></span>\r\n			<p style=\"margin: 0px; padding: 3px 5px; border-style: solid; border-width: 0px; background-color: rgb(232, 232, 232); line-height: 15px; font-size: 11px; color: rgb(89, 89, 89); background-position: initial initial; background-repeat: initial initial;\">\r\n				הציג אתמול את התכנית. ישראל כץ (צילום: דרור עינב)</p>\r\n		</div>\r\n		<div class=\"line_break\" style=\"margin: 0px; padding: 0px; border-style: solid; border-width: 0px; font-size: 0px; line-height: 1px; height: 30px;\">\r\n			&nbsp;</div>\r\n		<div id=\"frame100\" name=\"frame100\" style=\"margin: 0px; padding: 0px; border-style: solid; border-width: 0px;\">\r\n			&nbsp;</div>\r\n	</div>\r\n	<p style=\"margin: 0px 0px 10px; padding: 0px; border-style: solid; border-width: 0px; color: rgb(0, 0, 0); font-family: arial; font-size: 14px; text-align: justify;\">\r\n		ראש הממשלה בנימין נתניהו אישר את התכנית להפרטת נמל העתיד שיוקם בחיפה או אשדוד.</p>\r\n	<p style=\"margin: 0px 0px 10px; padding: 0px; border-style: solid; border-width: 0px; color: rgb(0, 0, 0); font-family: arial; font-size: 14px; text-align: justify;\">\r\n		התכנית הוצגה לנתניהו אתמול על-ידי שר התחבורה ישראל כץ. במסגרת התכנית יפורסם בקרוב מכרז בינלאומי להפעלת נמל העתיד באמצעות חברה פרטית המתמחה בהפעלת נמלים גדולים. מכרז התפעול מצטרף למכרז ההקמה של נמל העתיד נמצא כיום בשלב המיון המוקדם. המפעיל של נמל העתיד יחזיק בזיכיון להפעלת הנמל לתקופה של 30 שנה.</p>\r\n	<p style=\"margin: 0px 0px 10px; padding: 0px; border-style: solid; border-width: 0px; color: rgb(0, 0, 0); font-family: arial; font-size: 14px; text-align: justify;\">\r\n		מדובר במהלך דרמטי שצפוי להיתקל בהתנגדות קשה מצד ועדי העובדים בחברות נמלי אשדוד וחיפה. בממשלה נערכים לאפשרות השבתה ממושכת של הנמלים. במקביל תפתח הממשלה בימים הקרובים ערוץ הידברות עם ההסתדרות. שר התחבורה ישראל כץ ומזכ&quot;ל ההסתדרות עופר עיני כדי לדון בפרטי התכנית.</p>\r\n	<p style=\"margin: 0px 0px 10px; padding: 0px; border-style: solid; border-width: 0px; color: rgb(0, 0, 0); font-family: arial; font-size: 14px; text-align: justify;\">\r\n		על-פי מידע שהגיע ל&quot;גלובס&quot; בכוונת הממשלה להבטיח לעיני כי עובדי הנמל העתידי יוכלו להתאגד ויהיו מוגנים בהסכם קיבוצי שיבטיח להם זכויות דומות לאלו של עובדי הנמלים הקיימים.</p>\r\n	<p style=\"margin: 0px 0px 10px; padding: 0px; border-style: solid; border-width: 0px; color: rgb(0, 0, 0); font-family: arial; font-size: 14px; text-align: justify;\">\r\n		שרי האוצר והתחבורה צפויים להכריע בקרוב בשאלה האם הנמל יוקם בחיפה או באשדוד - בין הערים כבר מתנהל מאבק סוער בניסיון לזכות בנמל. בפני המדינה עומדת גם האפשרות להחליט על הקמת שני נמלים בשתי הערים בו-זמנית אולם ספק אם יש למדינה יכול לממן את שני הפרויקטים במקביל. ההשקעה התקציבית בכל נמל מוערכת ב-4 מיליארד שקל.</p>\r\n</div>\r\n<div>\r\n	&nbsp;</div>\r\n','article','page 1','page 1',0,'page 1'),(2,'<div>\r\n	&nbsp;</div>\r\n<div>\r\n	&nbsp;asdas as &nbsp;asdas das das das dasd asdasd asd asd asd asd ads sasda sd asd ads</div>\r\n<div>\r\n	&nbsp;asdas as &nbsp;asdas das das das dasd asdasd asd asd asd asd ads sasda sd asd ads</div>\r\n<div>\r\n	&nbsp;asdas as &nbsp;asdas das das das dasd asdasd asd asd asd asd ads sasda sd asd ads</div>\r\n<div>\r\n	&nbsp;asdas as &nbsp;asdas das das das dasd asdasd asd asd asd asd ads sasda sd asd ads</div>\r\n<div>\r\n	&nbsp;asdas as &nbsp;asdas das das das dasd asdasd asd asd asd asd ads sasda sd asd ads</div>\r\n<div>\r\n	&nbsp;asdas as &nbsp;asdas das das das dasd asdasd asd asd asd asd ads sasda sd asd ads&nbsp;asdas as &nbsp;asdas das das das dasd asdasd asd asd asd asd ads sasda sd asd ads</div>\r\n<div>\r\n	&nbsp;asdas as &nbsp;asdas das das das dasd asdasd asd asd asd asd ads sasda sd asd ads</div>\r\n<div>\r\n	&nbsp;asdas as &nbsp;asdas das das das dasd asdasd asd asd asd asd ads sasda sd asd ads&nbsp;asdas as &nbsp;asdas das das das dasd asdasd asd asd asd asd ads sasda sd asd ads&nbsp;asdas as &nbsp;asdas das das das dasd asdasd asd asd asd asd ads sasda sd asd ads</div>\r\n<div>\r\n	&nbsp;asdas as &nbsp;asdas das das das dasd asdasd asd asd asd asd ads sasda sd asd ads&nbsp;asdas as &nbsp;asdas das das das dasd asdasd asd asd asd asd ads sasda sd asd ads&nbsp;asdas as &nbsp;asdas das das das dasd asdasd asd asd asd asd ads sasda sd asd ads&nbsp;asdas as &nbsp;asdas das das das dasd asdasd asd asd asd asd ads sasda sd asd ads&nbsp;asdas as &nbsp;asdas das das das dasd asdasd asd asd asd asd ads sasda sd asd ads&nbsp;asdas as &nbsp;asdas das das das dasd asdasd asd asd asd asd ads sasda sd asd ads&nbsp;asdas as &nbsp;asdas das das das dasd asdasd asd asd asd asd ads sasda sd asd ads&nbsp;asdas as &nbsp;asdas das das das dasd asdasd asd asd asd asd ads sasda sd asd ads&nbsp;asdas as &nbsp;asdas das das das dasd asdasd asd asd asd asd ads sasda sd asd ads&nbsp;asdas as &nbsp;asdas das das das dasd asdasd asd asd asd asd ads sasda sd asd ads&nbsp;asdas as &nbsp;asdas das das das dasd asdasd asd asd asd asd ads sasda sd asd ads&nbsp;asdas as &nbsp;asdas das das das dasd asdasd asd asd asd asd ads sasda sd asd ads&nbsp;asdas as &nbsp;asdas das das das dasd asdasd asd asd asd asd ads sasda sd asd ads&nbsp;asdas as &nbsp;asdas das das das dasd asdasd asd asd asd asd ads sasda sd asd ads&nbsp;asdas as &nbsp;asdas das das das dasd asdasd asd asd asd asd ads sasda sd asd ads</div>\r\n','page 2','page 2','page 2',1,'page 2'),(3,'<div>\r\n	asdasda dasd</div>\r\n<div>\r\n	adas dasd asd&nbsp;</div>\r\n<div>\r\n	dasd asdasd&nbsp;</div>\r\n<div>\r\n	asd asd&nbsp;</div>\r\n<div>\r\n	as d</div>\r\n<div>\r\n	asd&nbsp;</div>\r\n<div>\r\n	as d</div>\r\n','new bla bla','new bla bla','new bla bla',1,'new bla bla'),(4,'<div>\r\n	asdasdasd</div>\r\n','','asdasd','sadasd',0,'sadasd');
/*!40000 ALTER TABLE `tblpages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblreportabuse`
--

DROP TABLE IF EXISTS `tblreportabuse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblreportabuse` (
  `idtblreportabuse` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `memberidreport` int(11) DEFAULT NULL,
  `reportext` text,
  `reportpublished` datetime DEFAULT NULL,
  PRIMARY KEY (`idtblreportabuse`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblreportabuse`
--

LOCK TABLES `tblreportabuse` WRITE;
/*!40000 ALTER TABLE `tblreportabuse` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblreportabuse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblroommembers`
--

DROP TABLE IF EXISTS `tblroommembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblroommembers` (
  `roommembersid` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `isExpel` tinyint(1) DEFAULT '0',
  `addToFavourite` tinyint(1) DEFAULT '0',
  `roomid` int(11) DEFAULT NULL,
  `roomreport` tinyint(1) DEFAULT '0',
  `roomside` int(2) DEFAULT NULL,
  `isdeleted` tinyint(4) DEFAULT '0',
  `memberorder` int(2) DEFAULT NULL,
  `isFinish` tinyint(1) DEFAULT '0',
  `dateruntime` datetime DEFAULT NULL,
  PRIMARY KEY (`roommembersid`),
  KEY `idtblrooms_idx` (`roomid`),
  KEY `expelin` (`isExpel`,`roommembersid`),
  KEY `lobby1` (`isExpel`,`roomid`),
  KEY `lobby2` (`roomid`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblroommembers`
--

LOCK TABLES `tblroommembers` WRITE;
/*!40000 ALTER TABLE `tblroommembers` DISABLE KEYS */;
INSERT INTO `tblroommembers` VALUES (98,30,0,0,127,0,NULL,1,NULL,0,NULL),(100,28,0,0,129,0,NULL,1,NULL,0,NULL),(111,28,0,0,141,0,NULL,0,1,1,'2013-08-07 14:38:28');
/*!40000 ALTER TABLE `tblroommembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblroomresults`
--

DROP TABLE IF EXISTS `tblroomresults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblroomresults` (
  `tblroomresultsid` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `troommemberid` int(11) DEFAULT NULL,
  `isreported` tinyint(4) DEFAULT '0',
  `isfavourited` tinyint(4) DEFAULT '0',
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `isfinished` tinyint(1) DEFAULT '0',
  `roomid` int(11) DEFAULT '0',
  `onlineid` int(11) DEFAULT '0',
  `blindroomid` int(11) DEFAULT '0',
  PRIMARY KEY (`tblroomresultsid`),
  KEY `spinreport1` (`memberid`,`troommemberid`,`roomid`),
  KEY `spinreport2` (`memberid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblroomresults`
--

LOCK TABLES `tblroomresults` WRITE;
/*!40000 ALTER TABLE `tblroomresults` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblroomresults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblrooms`
--

DROP TABLE IF EXISTS `tblrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblrooms` (
  `idtblrooms` int(11) NOT NULL AUTO_INCREMENT,
  `memberid` int(11) DEFAULT NULL,
  `roomgender` int(11) DEFAULT NULL,
  `roomagefrom` int(11) DEFAULT NULL,
  `roomageto` int(11) DEFAULT NULL,
  `roomcountry1` int(11) DEFAULT NULL,
  `roomcountry2` int(11) DEFAULT NULL,
  `roomstate1` int(11) DEFAULT NULL,
  `roomstate2` int(11) DEFAULT NULL,
  `roomlanguage1` int(11) DEFAULT NULL,
  `roomtech` int(11) DEFAULT NULL,
  `roomlanguage2` int(11) DEFAULT NULL,
  `roomstyle` int(11) DEFAULT NULL,
  `roomstatus` int(11) DEFAULT NULL,
  `roompublish` datetime DEFAULT NULL,
  `signmember` int(11) NOT NULL DEFAULT '0',
  `roomnumof` int(2) DEFAULT '3',
  `roomsignin` int(2) DEFAULT '0',
  `roomgender2` int(2) DEFAULT NULL,
  `roomsignin2` int(2) DEFAULT '0',
  `roomisrunning` tinyint(1) DEFAULT '0',
  `isFinished` tinyint(1) DEFAULT '0',
  `roomtime` datetime DEFAULT NULL,
  PRIMARY KEY (`idtblrooms`),
  KEY `mylobby5` (`memberid`,`isFinished`,`roomlanguage1`,`roomlanguage2`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblrooms`
--

LOCK TABLES `tblrooms` WRITE;
/*!40000 ALTER TABLE `tblrooms` DISABLE KEYS */;
INSERT INTO `tblrooms` VALUES (141,30,0,31,39,230,0,1,1,1,1,0,1,1,'2013-08-07 02:35:51',0,1,1,NULL,0,0,1,'2013-08-07 14:37:28');
/*!40000 ALTER TABLE `tblrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblselectage`
--

DROP TABLE IF EXISTS `tblselectage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblselectage` (
  `idtblselectage` int(11) NOT NULL,
  `fromage` int(11) NOT NULL DEFAULT '0',
  `toage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idtblselectage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblselectage`
--

LOCK TABLES `tblselectage` WRITE;
/*!40000 ALTER TABLE `tblselectage` DISABLE KEYS */;
INSERT INTO `tblselectage` VALUES (1,18,24),(2,24,30),(3,30,36),(4,36,42),(5,42,50),(6,50,0);
/*!40000 ALTER TABLE `tblselectage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbluserfield`
--

DROP TABLE IF EXISTS `tbluserfield`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbluserfield` (
  `idtbluserfield` int(11) NOT NULL AUTO_INCREMENT,
  `fieldname` varchar(85) NOT NULL DEFAULT '',
  `fieldtext` varchar(255) NOT NULL DEFAULT '',
  `fieldorder` int(11) DEFAULT NULL,
  `fieldtype` int(11) NOT NULL DEFAULT '1',
  `1` varchar(85) DEFAULT NULL,
  `3` varchar(85) DEFAULT NULL,
  `7` varchar(85) DEFAULT NULL,
  `4` varchar(85) DEFAULT NULL,
  PRIMARY KEY (`idtbluserfield`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbluserfield`
--

LOCK TABLES `tbluserfield` WRITE;
/*!40000 ALTER TABLE `tbluserfield` DISABLE KEYS */;
INSERT INTO `tbluserfield` VALUES (1,'status','',3,3,'status','מצב','status','status'),(2,'Sexuality:','',2,3,'Sexuality:','מיניות:','Sexuality:','Sexuality:'),(3,'Height(cm): ','',4,1,'Height(cm): ','גובה(סמ):','Height(cm): ','Height(cm): '),(4,'Body Type:','',5,1,'Body Type:','גוף:','Body Type:','Body Type:'),(7,'filednew','',1,1,'filednew:',NULL,'filednew','filednew');
/*!40000 ALTER TABLE `tbluserfield` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblusers`
--

DROP TABLE IF EXISTS `tblusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblusers` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `userfirstname` varchar(210) DEFAULT NULL,
  `userlastname` varchar(210) DEFAULT NULL,
  `useremail` varchar(210) DEFAULT NULL,
  `userpassword` varchar(210) DEFAULT NULL,
  `IsPassFirstPage` tinyint(1) DEFAULT '0',
  `userbirthday` datetime NOT NULL,
  `userstatus` int(11) DEFAULT NULL,
  `userseeking` int(11) DEFAULT NULL,
  `usercountry` int(11) DEFAULT NULL,
  `userstate` int(11) DEFAULT NULL,
  `userprofileimage` int(11) DEFAULT NULL,
  `usergendor` tinyint(1) DEFAULT NULL,
  `usercoupon` varchar(45) DEFAULT NULL,
  `confirmcode` varchar(50) DEFAULT NULL,
  `IsPassSecondPage` tinyint(1) DEFAULT '0',
  `userAbout` text,
  `userLang` int(11) DEFAULT '1',
  `userAccount` int(11) NOT NULL DEFAULT '0',
  `userfileddata` text,
  `useremail2` varchar(255) DEFAULT NULL,
  `userLang2` int(11) DEFAULT '0',
  `usersigndate` datetime DEFAULT NULL,
  `userdata1` int(11) DEFAULT '0',
  `userdata2` int(11) DEFAULT '0',
  `userdata3` int(11) DEFAULT '0',
  `userdata4` int(11) DEFAULT '0',
  `userdata5` int(11) DEFAULT '0',
  `userdata6` int(11) DEFAULT '0',
  `userdata7` int(11) DEFAULT '0',
  `userdata8` int(11) DEFAULT '0',
  `userdata9` int(11) DEFAULT '0',
  `userdata10` int(11) DEFAULT '0',
  `userdata11` int(11) DEFAULT '0',
  `userdata12` int(11) DEFAULT '0',
  `userConfirmDate` datetime DEFAULT NULL,
  `userValidDate` datetime DEFAULT NULL,
  `userdateonday` int(11) DEFAULT '0',
  `userdateondaydate` datetime DEFAULT NULL,
  `userCuponValidDate` datetime DEFAULT NULL,
  `usersound` int(1) DEFAULT '1',
  `lookingforcontent` text,
  `twitterid` varchar(255) NOT NULL DEFAULT '0',
  `showguide` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`userid`),
  KEY `homeconfime1` (`confirmcode`,`IsPassSecondPage`),
  KEY `homeuserid` (`userid`),
  KEY `homecradentiial` (`useremail`,`userpassword`),
  KEY `homeemail` (`useremail`),
  KEY `homeconfirmcode` (`confirmcode`),
  KEY `forgetpassword` (`useremail`),
  KEY `setting1` (`userid`,`userpassword`),
  KEY `lobby1` (`confirmcode`,`IsPassSecondPage`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblusers`
--

LOCK TABLES `tblusers` WRITE;
/*!40000 ALTER TABLE `tblusers` DISABLE KEYS */;
INSERT INTO `tblusers` VALUES (28,'yossi','levi','yossi@comstar.co.il','y12345',0,'1977-07-22 00:00:00',NULL,1,230,1,116,0,'','060888ed-964b-4887-95b4-9d93e2d95aef',1,'',1,0,'7[]2[]1[]3[]4[]','yossi@comstar.co.il',0,'2013-07-21 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,'2013-07-21 11:18:20','2013-07-21 00:00:00',-97,'2013-07-21 00:00:00','2013-07-21 00:00:00',1,'','0',0),(30,'anna','montana','anna@comstar.co.il','y12345',0,'1978-05-07 00:00:00',NULL,0,230,1,NULL,1,'','f816b8e0-757c-4e56-b8fd-ab7e62d67c54',1,'',1,0,'7[]2[]1[]3[]4[]','anna@comstar.co.il',0,'2013-07-21 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,'2013-07-21 12:35:15','2013-07-21 12:34:50',-72,NULL,'2013-07-21 00:00:00',1,'','0',0),(31,'dana','fanta','dana@comstar.co.il','y12345',0,'1979-06-07 00:00:00',NULL,0,230,1,NULL,1,'','91070f6a-d5b8-4589-826a-c121035e54e9',1,'',1,0,'7[]2[]1[]3[]4[]','dana@comstar.co.il',0,'2013-07-21 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,'2013-07-21 15:03:59','2013-07-21 15:03:36',-28,NULL,'2013-07-21 00:00:00',1,'','0',0),(33,'david','cohen','david@comstar.co.il','y12345',0,'1978-07-13 00:00:00',NULL,1,230,2,NULL,0,'','b48e8503-2591-4ca8-9515-f38032ebabdd',1,'',2,0,'7[]2[]1[]3[]4[]',NULL,1,'2013-07-31 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,NULL,'2013-07-31 00:00:00',0,'2013-07-31 00:00:00',NULL,1,'','0',0),(34,'ronit','dor','ronit@comstar.co.il','y12345',0,'1977-03-17 00:00:00',NULL,0,230,33,NULL,1,'','6cd034d8-f80f-40c3-9e47-34bcbaf75b4a',1,'',1,0,'',NULL,0,'2013-07-31 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,NULL,'2013-07-31 00:00:00',0,'2013-07-31 00:00:00',NULL,1,'','0',0),(37,'tali','tal','tali@comstar.co.il','y12345',0,'1979-04-18 00:00:00',NULL,0,230,1,117,1,'','78d58669-f8a1-4ea8-a48a-0728b41c2988',1,NULL,1,0,NULL,'tali@comstar.co.il',0,'2013-08-05 00:00:00',0,0,0,0,0,0,0,0,0,0,0,0,'2013-08-05 14:56:29','2013-08-05 14:56:00',-1,NULL,'2013-08-05 00:00:00',1,NULL,'0',0);
/*!40000 ALTER TABLE `tblusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblwaitingroomalert`
--

DROP TABLE IF EXISTS `tblwaitingroomalert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tblwaitingroomalert` (
  `tblwaitingroomalertid` int(11) NOT NULL AUTO_INCREMENT,
  `waitminutes` int(11) DEFAULT '0',
  `waitseconds` int(11) DEFAULT '0',
  `waitingalertname` varchar(45) DEFAULT NULL,
  `waitingstatus` int(2) DEFAULT '1',
  `1` text,
  `2` text,
  `3` text,
  `4` text,
  PRIMARY KEY (`tblwaitingroomalertid`),
  KEY `wiating1` (`waitingstatus`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblwaitingroomalert`
--

LOCK TABLES `tblwaitingroomalert` WRITE;
/*!40000 ALTER TABLE `tblwaitingroomalert` DISABLE KEYS */;
INSERT INTO `tblwaitingroomalert` VALUES (1,13,0,'first alert',1,'<div>\r\n	asdasda dasd asdasdasd</div>\r\n',NULL,'<div>\r\n	דשכגשדגשדג</div>\r\n',NULL),(2,0,10,'second alert',1,'<div>\r\n	asdasdasdasd sdad asd</div>\r\n<div>\r\n	asdasdasd</div>\r\n',NULL,NULL,NULL),(3,1,10,'start online',3,'<div>\r\n	the date is started ,&nbsp;</div>\r\n',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tblwaitingroomalert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temp1`
--

DROP TABLE IF EXISTS `temp1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temp1` (
  `temp1` int(11) NOT NULL AUTO_INCREMENT,
  `field1` text,
  `field2` text,
  PRIMARY KEY (`temp1`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temp1`
--

LOCK TABLES `temp1` WRITE;
/*!40000 ALTER TABLE `temp1` DISABLE KEYS */;
INSERT INTO `temp1` VALUES (1,'asASasaSasdasdas<br />\r\n<hr />\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width: 500px; \">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				&nbsp;</td>\r\n			<td>\r\n				&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<br />\r\n','asasasASA sadasd');
/*!40000 ALTER TABLE `temp1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `toplinemsg`
--

DROP TABLE IF EXISTS `toplinemsg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `toplinemsg` (
  `toplinemsgid` int(11) NOT NULL AUTO_INCREMENT,
  `topMessgaeSite` text,
  `topMessgaeSystem` text,
  `MsgSiteDate` datetime DEFAULT NULL,
  `MsgSystemDate` datetime DEFAULT NULL,
  `toplang` int(11) DEFAULT '1',
  `msgkeysite` varchar(45) DEFAULT NULL,
  `msgkeysystem` varchar(45) DEFAULT NULL,
  `isupadte1` tinyint(4) DEFAULT NULL,
  `isupadte2` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`toplinemsgid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toplinemsg`
--

LOCK TABLES `toplinemsg` WRITE;
/*!40000 ALTER TABLE `toplinemsg` DISABLE KEYS */;
INSERT INTO `toplinemsg` VALUES (5,'<div>\r\n	<div>\r\n		&nbsp;</div>\r\n	<div>\r\n		<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 1000px;\">\r\n			<tbody>\r\n				<tr>\r\n					<td>\r\n						<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"direction: ltr; width: 370px;\">\r\n							<tbody>\r\n								<tr>\r\n									<td>\r\n										<img alt=\"\" src=\"/spindate.co.il/uploads/images/Isign.png\" style=\"width: 17px; height: 17px;\" /></td>\r\n									<td>\r\n										<strong>Information</strong>: Lorem ipsum dolor sit amet, consectetur.</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n	</div>\r\n</div>\r\n<div style=\"direction: ltr;\">\r\n	&nbsp;</div>\r\n','<div>\r\n	<div>\r\n		&nbsp;</div>\r\n	<div>\r\n		<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 1000px;\">\r\n			<tbody>\r\n				<tr>\r\n					<td>\r\n						<table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"direction: ltr; width: 370px;\">\r\n							<tbody>\r\n								<tr>\r\n									<td>\r\n										<img alt=\"\" src=\"/spindate.co.il/uploads/images/Isign.png\" style=\"width: 17px; height: 17px;\" /></td>\r\n									<td>\r\n										<strong>Information</strong>: Lorem ipsum dolor sit amet, consectetur.</td>\r\n								</tr>\r\n							</tbody>\r\n						</table>\r\n					</td>\r\n				</tr>\r\n			</tbody>\r\n		</table>\r\n	</div>\r\n</div>\r\n<div style=\"direction: ltr;\">\r\n	&nbsp;</div>\r\n',NULL,NULL,1,'db09c601-9c8d-4cbe-8c6b-f560c363cc4f','528a8fbb-cf05-4c5a-afdc-b5d728883e80',0,0),(6,'<div>\r\n	<strong>asdasdasdas </strong>dsfsdf sdf sd&nbsp;</div>\r\n','<div>\r\n	dsfsdfsdf</div>\r\n',NULL,NULL,3,'254ce500-2124-4ab3-a892-ad12b5258e54','22498559-64f4-4b4f-89a3-4bf407ebc5e9',0,0);
/*!40000 ALTER TABLE `toplinemsg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userimages`
--

DROP TABLE IF EXISTS `userimages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userimages` (
  `iduserimages` int(11) NOT NULL AUTO_INCREMENT,
  `imagelink` varchar(210) DEFAULT NULL,
  `memberid` int(11) DEFAULT NULL,
  `isConfirm` int(2) DEFAULT '0',
  `xvalue` int(11) DEFAULT '0',
  `yvalue` int(11) DEFAULT '0',
  PRIMARY KEY (`iduserimages`),
  KEY `homerandimg` (`iduserimages`,`imagelink`),
  KEY `images1` (`iduserimages`,`memberid`),
  KEY `profile1` (`memberid`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userimages`
--

LOCK TABLES `userimages` WRITE;
/*!40000 ALTER TABLE `userimages` DISABLE KEYS */;
INSERT INTO `userimages` VALUES (116,'../images/memberimages/brownmalechair6695ec_size0.jpg',28,0,0,197),(117,'../images/memberimages/couplebigc97e05_size0.png',37,0,0,0);
/*!40000 ALTER TABLE `userimages` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-07 15:12:37
