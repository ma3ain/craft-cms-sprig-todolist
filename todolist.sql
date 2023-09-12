-- MySQL dump 10.13  Distrib 8.0.33, for macos13.3 (arm64)
--
-- Host: localhost    Database: todolist
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int NOT NULL,
  `ownerId` int DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sgjvdqmyvnagxikixxczmkkokatnlmneonbu` (`ownerId`),
  CONSTRAINT `fk_kwrkkqvizysdqjiojvtykyptwvxdlrqqeiku` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sgjvdqmyvnagxikixxczmkkokatnlmneonbu` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `pluginId` int DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT '1',
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_vantwipedtnretreduxuqtvjawgigdlizleq` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_nabhqxknrxwnpqeesqmnswkepbneilyhdhgn` (`dateRead`),
  KEY `fk_zzqeyfzkdigoxcankzgzssajekkjjlnmmpox` (`pluginId`),
  CONSTRAINT `fk_rrjhgtdpyaasorkwhnqeddejjduxulvcgwbp` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zzqeyfzkdigoxcankzgzssajekkjjlnmmpox` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexdata` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sessionId` int NOT NULL,
  `volumeId` int NOT NULL,
  `uri` text,
  `size` bigint unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT '0',
  `recordId` int DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT '0',
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zrbonzviwnannfgiartewvfzghzwzeuntuja` (`sessionId`,`volumeId`),
  KEY `idx_cgssxfxwiblgsaqjrueikmrhdwnerbqiwnvm` (`volumeId`),
  CONSTRAINT `fk_sowwbsjdolllarouvavghsxtssdsehldrlyc` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xhekutoetbxcpnevcvbqcecicighrsnzchbv` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assetindexingsessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text,
  `totalEntries` int DEFAULT NULL,
  `processedEntries` int NOT NULL DEFAULT '0',
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT '0',
  `isCli` tinyint(1) DEFAULT '0',
  `actionRequired` tinyint(1) DEFAULT '0',
  `processIfRootEmpty` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `id` int NOT NULL,
  `volumeId` int DEFAULT NULL,
  `folderId` int NOT NULL,
  `uploaderId` int DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text,
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `size` bigint unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_kqtcociabugvxvzplporipnohbtxvbdgexqw` (`filename`,`folderId`),
  KEY `idx_mfbykmwjzqhczuvsoaphysttoxoongsomwnc` (`folderId`),
  KEY `idx_ilqunqqgcmhmqzxvzbltjaenbgkkymzlpnxr` (`volumeId`),
  KEY `fk_ijaomogsbonwckniiikpiqpgctrxhjzymqaz` (`uploaderId`),
  CONSTRAINT `fk_ijaomogsbonwckniiikpiqpgctrxhjzymqaz` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_liiwfacsavekfzfygpheeqxqrjsyscskkzgv` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tkfpztdxhazamzwsyadmswibdsalutrzopux` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vwsxqeqwyrxekrvayfdxttilodamhzfehcjf` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_qqaifnlgwcdpvxdfnqodzxhmazitadjdzsuv` (`groupId`),
  KEY `fk_yakaxqzvilhbjshydhlfnxwtejljwvlggprn` (`parentId`),
  CONSTRAINT `fk_dnpjipawlswvcribgpkmdpnxdpxjocixzinv` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_egrsoicmtfkaxilakedljehvkhdfydsemkmn` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yakaxqzvilhbjshydhlfnxwtejljwvlggprn` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_upuizfbvaxqcwajerjgzczfmflixqjwsbizw` (`name`),
  KEY `idx_zgabmwzoawtplltkizcnosfagdrspetlsxqt` (`handle`),
  KEY `idx_gdaszaeytbuxnqdzguykewqrsrqfphayrizw` (`structureId`),
  KEY `idx_ketdvmeisfxsegolpsmfqvwccaovveqqnloa` (`fieldLayoutId`),
  KEY `idx_ccccblqckppufiuzhsvackzoaskxssunfuun` (`dateDeleted`),
  CONSTRAINT `fk_mcavigsmudxryvhbsypaydpqgvrcutcygnux` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_uzjimrlpktmtmaprxvznlrqsfywxmplosnvo` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorygroups_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_jbjhdxkssjpavvraxmrjxuicemvihadkqpgh` (`groupId`,`siteId`),
  KEY `idx_lvqkcxcbbrnlrxbpvhexphcugzjbljmbpetm` (`siteId`),
  CONSTRAINT `fk_bipbzesczbhtwapqbqubsgbzmqnxivxbzewx` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_gusawpvedswbhepyjcvurqfsyadbyrwgkppr` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedattributes` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_ctuampawgmmojhbhxhkkvyvuwzjzupeipuxw` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_gzspvfzovrhdxfmnuhaejxicthyveyysnyco` (`siteId`),
  KEY `fk_ztlwrailgmcvgcnaqguiseabhieikwosxbvc` (`userId`),
  CONSTRAINT `fk_gzspvfzovrhdxfmnuhaejxicthyveyysnyco` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ivpbeixptxnjjwpwtiogtcfjblefottdsgsr` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ztlwrailgmcvgcnaqguiseabhieikwosxbvc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `changedfields` (
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `fieldId` int NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_xlndlasduhxmgyuulramernmwdxonwshpdqk` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_ggmktmerlmnebbvhumjdpadstxuhfelhjoph` (`siteId`),
  KEY `fk_rrvupqmfwmztcjfccqnmyklbzomojmgwnizn` (`fieldId`),
  KEY `fk_csasplvvbqtdjohzfhvnxpakvkqqsoxjhiqt` (`userId`),
  CONSTRAINT `fk_csasplvvbqtdjohzfhvnxpakvkqqsoxjhiqt` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_ggmktmerlmnebbvhumjdpadstxuhfelhjoph` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rrvupqmfwmztcjfccqnmyklbzomojmgwnizn` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_yoidjwsmmakvezuyqvhdeexisemiphrysryw` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_krcycvkqtiqkgihisoqdcuyfmrxpsllvdtmi` (`elementId`,`siteId`),
  KEY `idx_dhubsfjevxxyjiabfcewlxnswjyqfxeuwxqq` (`siteId`),
  KEY `idx_keikobfqijnonkaxvvwkhdkzuccubkarrogk` (`title`),
  CONSTRAINT `fk_nrfdtcjqfexbtsflvynljopppzzoocdnbqwp` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_vtqrnsxxjebozlwzgfxmynxfdoxwvxbirxdj` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `craftidtokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_twiyzjcqywpovhyheljvzuceudvadsxxjxhu` (`userId`),
  CONSTRAINT `fk_twiyzjcqywpovhyheljvzuceudvadsxxjxhu` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deprecationerrors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint unsigned DEFAULT NULL,
  `message` text,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_bsvwuyncyudhmmmdtepnircnjnhfebabydvo` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drafts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `creatorId` int DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_baooiqcmhfcjgmwiakbeszvbgmqahizzpvii` (`creatorId`,`provisional`),
  KEY `idx_bhvgxvsazdztkhlclvrebvebkggkttiicjzb` (`saved`),
  KEY `fk_zmxsyonbtjbazzntbzghcdwepduhxkfnyuce` (`canonicalId`),
  CONSTRAINT `fk_osafbchpiajzhgsfdodvoyalsczilwquxdcw` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_zmxsyonbtjbazzntbzghcdwepduhxkfnyuce` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementactivity`
--

DROP TABLE IF EXISTS `elementactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elementactivity` (
  `elementId` int NOT NULL,
  `userId` int NOT NULL,
  `siteId` int NOT NULL,
  `draftId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`elementId`,`userId`,`type`),
  KEY `idx_idsjzigwmjbcqwqoukfjghsrzpwrrjzamxaw` (`elementId`,`timestamp`,`userId`),
  KEY `fk_vinbjkueyzsqjdckjnevxuwmwyasnxnfuclv` (`userId`),
  KEY `fk_jeshfwpwkoaiwjeiwqulqbmwuskzevsbznyf` (`siteId`),
  KEY `fk_yfimzrbmhdbscgiqvmtywjjuegolgaowxwnu` (`draftId`),
  CONSTRAINT `fk_jeshfwpwkoaiwjeiwqulqbmwuskzevsbznyf` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vinbjkueyzsqjdckjnevxuwmwyasnxnfuclv` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xhxqdilrmvvvymvlhhmnjlkuovaovfglpduk` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yfimzrbmhdbscgiqvmtywjjuegolgaowxwnu` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int DEFAULT NULL,
  `draftId` int DEFAULT NULL,
  `revisionId` int DEFAULT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jngoxdhydmauupxrwjzzlgwhncjmvwkewxwn` (`dateDeleted`),
  KEY `idx_zdslvrltrmxrahwwjilbgydqbhxjsemplrhp` (`fieldLayoutId`),
  KEY `idx_dbcabczilswvjcemhblbvtugyxwzkqlscdvi` (`type`),
  KEY `idx_suioatsbaqewfhuhhauzlefrmztuyjmxwegi` (`enabled`),
  KEY `idx_hvqsyapdwiljaebtiglmbsjefpzkgeqtygdr` (`canonicalId`),
  KEY `idx_nbqollqklbnbqvgimngfzlmhtsoqnjjouark` (`archived`,`dateCreated`),
  KEY `idx_hntkcnkttdlphgcomlemybadqmjdtiwyndag` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_cwzcfmthmeiccfyhlvsoihyysdryofneredm` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_nexwcljlgmyacmtpxgckxtdtnzxrasvjiqbb` (`draftId`),
  KEY `fk_tteicomaygidffbqpiykwzlsvyzoqtpkazkd` (`revisionId`),
  CONSTRAINT `fk_bkngpaxrxbhsligkyhvbimpkznevditplnpx` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_nexwcljlgmyacmtpxgckxtdtnzxrasvjiqbb` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_psowwrmkghszrcvzbhbpdokjlrcmnooilqvp` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_tteicomaygidffbqpiykwzlsvyzoqtpkazkd` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fistmutrwnsjxghdplqwchmebulynelkyohp` (`elementId`,`siteId`),
  KEY `idx_fslyukgnymelsriruimbowtgpimpodknjqbr` (`siteId`),
  KEY `idx_iqpnkxqwhdwbqlvxdbulxybuwaunkqrurasv` (`slug`,`siteId`),
  KEY `idx_gwcbnyhqmozgdbdgqgdivhqogeojkuctetun` (`enabled`),
  KEY `idx_raxlxpmvhozzectkizioxocxnlkxxxqhqyai` (`uri`,`siteId`),
  CONSTRAINT `fk_gnozulqaztenhprkhtrtacyognhqfklctfns` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_hynyapfynnsiysrhiekzyzfpufeeliorobef` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries` (
  `id` int NOT NULL,
  `sectionId` int NOT NULL,
  `parentId` int DEFAULT NULL,
  `typeId` int NOT NULL,
  `authorId` int DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mlcqxoitfifgxococjqhttbjpbjlvqoamayo` (`postDate`),
  KEY `idx_amzmjvhzqfyfsjsclvnnnhrvgkigfxuyweth` (`expiryDate`),
  KEY `idx_tfujoykevuqfigvqfwnkgkkrecyzpqonqrgn` (`authorId`),
  KEY `idx_zxhzqvcozcgunqeeqaanvownlgxiocuzmdzd` (`sectionId`),
  KEY `idx_ggycxewlqghrcfvqyuwgaoeskauhxixloqto` (`typeId`),
  KEY `fk_yisgkxnzlikjwskgarzexchoevvvcfruioon` (`parentId`),
  CONSTRAINT `fk_dhfcsqkndruawwvgmghzwssxiubseoxxplkm` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_obtljzziwzkfuecywqubdztjbslkqvonbemn` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ofsfgvgsrtjcpygcwgwohrkmkdpzwsicntar` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_scfjmhgffpnvkoybxmnqlqimoajeumsoemvf` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yisgkxnzlikjwskgarzexchoevvvcfruioon` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrytypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `titleFormat` varchar(255) DEFAULT NULL,
  `slugTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `slugTranslationKeyFormat` text,
  `showStatusField` tinyint(1) DEFAULT '1',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_idzdpxcktxvrjcmvgdilnpeoarcwaoyggcso` (`name`,`sectionId`),
  KEY `idx_qphamtzwjarvwkizepvykdluhxuumysaajfa` (`handle`,`sectionId`),
  KEY `idx_ctlaghsrrbeszdoqtbdrcsdhkisrglweqtpt` (`sectionId`),
  KEY `idx_arpjtewehqyyfsxjckykhzcddoipahqhqnml` (`fieldLayoutId`),
  KEY `idx_prnyobzukgatkkliztehekxvehiegsxjrine` (`dateDeleted`),
  CONSTRAINT `fk_izeqrqprtjztaiinpffcxcmhiscvhqlooklr` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nbczlxzcyceutsycyrdlwfrohpjpzwkwheqf` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldgroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nqntnlttivxgpqfryawnekahclqonraizjek` (`name`),
  KEY `idx_hvgkhycvgqfiohrqfvijaqpbjlctjwdulcaf` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `tabId` int NOT NULL,
  `fieldId` int NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wgsyvmusinmijdgcmszilscrcheuvlmuemcb` (`layoutId`,`fieldId`),
  KEY `idx_ykqmscmnwnlusqoejoonjyhjrvgpbqzcymly` (`sortOrder`),
  KEY `idx_bqjqyvcbyuxkizpaiursljodaxqlvoacqimp` (`tabId`),
  KEY `idx_oamcqhjkaqfcniyoqdmhkpzuiwlzpediegbl` (`fieldId`),
  CONSTRAINT `fk_bvllgdoyirtbhxegaowfkwqhrjkhkfcjgmlb` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lwhdyeqpajnchvvvhxdmxkvmzywvcprdgqzc` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xijucyihbcveqzikkcqbhcvshjqeymuzzstr` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=326 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_iduahpaqgzhsmagwridjhysxztamldxwgmcw` (`dateDeleted`),
  KEY `idx_mwdepyoqenvjqhftjcrstviqyylwqnmnfzed` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `layoutId` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `settings` text,
  `elements` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_irafvrguffkpgzxtxgunseknlxddlkouvglc` (`sortOrder`),
  KEY `idx_hrxvlzkzjjdpbhydpdgyyhribcxqqldsovsj` (`layoutId`),
  CONSTRAINT `fk_dbfsglgvmwkxtbolpsmjibgapofpuyzatedr` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zdpbdpxngbnlmvmitzddyphgjxtekqqxzycm` (`handle`,`context`),
  KEY `idx_agafdubdvwvefnxdnenpttglzfnzkqqqrsgk` (`groupId`),
  KEY `idx_ekxyjkvumhwwasehcvgtnhlrjgcsaeyzqxhk` (`context`),
  CONSTRAINT `fk_wsgwdwouciolessprzyitzljemutoegcbrjy` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `globalsets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kcwthqqmhkseymenqrgstfdjlnwxzkjoffcd` (`name`),
  KEY `idx_taxgjzajdwdcwgvbjihwizbnlvkftsdftyex` (`handle`),
  KEY `idx_urqzgcvlxideptsqwrrtlxoiucpijrergisj` (`fieldLayoutId`),
  KEY `idx_rpalvqwgasfsztipmvidaetbnogtsyimzwsg` (`sortOrder`),
  CONSTRAINT `fk_mskfomaymwxgieavowttrrhnedbptntfieeg` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_muesoenmtilmfnyodimvptxwnxksxltzcabe` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqlschemas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gqltokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cmnhwuliokflcykdmczxyrfmlcgixkrtvezn` (`accessToken`),
  UNIQUE KEY `idx_qrxnhzbtiqwhxipxeghjgzonmwdagphwogih` (`name`),
  KEY `fk_yxanjadmrsanuiyjuztxictzfsvrgkkpqhgo` (`schemaId`),
  CONSTRAINT `fk_yxanjadmrsanuiyjuztxictzfsvrgkkpqhgo` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransformindex` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetId` int NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_tmocfeijncoyzcyfnipfnlvhybkjmrjochuz` (`assetId`,`transformString`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagetransforms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int unsigned DEFAULT NULL,
  `height` int unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT '1',
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_antqjiivzbienpyozlyqawalbebtovdvbwcw` (`name`),
  KEY `idx_vsiwpdifmpbnbuuwgtzydfyrnnegezmacvxb` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matrixblocks` (
  `id` int NOT NULL,
  `primaryOwnerId` int NOT NULL,
  `fieldId` int NOT NULL,
  `typeId` int NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_evkcxwzmxnysefoafkuauxuwaefpcntzcuxc` (`primaryOwnerId`),
  KEY `idx_smbsdzbauyqnjscbdzqecibbxztgjjooqntb` (`fieldId`),
  KEY `idx_ntwnncxaksreischcflzbdnllkxxmftiartq` (`typeId`),
  CONSTRAINT `fk_gcyntaplfmjdjbdxlqlhqwilmikeiuoitcmh` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_jtscdzovznthddvelimxktqujxepeedtocxm` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qghyglfzkyjhfuihaueodhdlqkdgkjkckmyn` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sdrenkpsckeoouwmssdcekgvwzzakbdbynsr` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks_owners`
--

DROP TABLE IF EXISTS `matrixblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matrixblocks_owners` (
  `blockId` int NOT NULL,
  `ownerId` int NOT NULL,
  `sortOrder` smallint unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_nbkobzzibiorueghjkaaimfrjrqnomsjeezt` (`ownerId`),
  CONSTRAINT `fk_nbkobzzibiorueghjkaaimfrjrqnomsjeezt` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_szpejzgfqwhjsrcaqevlwhxkfxfhnmofxpee` FOREIGN KEY (`blockId`) REFERENCES `matrixblocks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matrixblocktypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_oqjuckkjwczhwvtiqdbhzkhbnjoccetlvjea` (`name`,`fieldId`),
  KEY `idx_zabolhtnxydfkxodqhzfnxcpgtjcxfisyyim` (`handle`,`fieldId`),
  KEY `idx_vzrsibterxodkkdlktwfmzxdprwpvuppqpfu` (`fieldId`),
  KEY `idx_wqvpranosbenshfmvpxruacnidjwgjhpffcm` (`fieldLayoutId`),
  CONSTRAINT `fk_jfdtlznporhlwhnspmebaveyemqakdahpuur` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_qugcwzcnllrwqlcygcfpgxyyofpbreeirili` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nnkgogpsqpffmcldgycnxussiojgyyrxbcdc` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_hezccaadyqfwkokwriwwsfwmuksvuwdcfzuu` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int NOT NULL,
  `ttr` int NOT NULL,
  `delay` int NOT NULL DEFAULT '0',
  `priority` int unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int DEFAULT NULL,
  `progress` smallint NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text,
  PRIMARY KEY (`id`),
  KEY `idx_vlyephmfnkoyiwatkxgrlppufnhvcsnpwefc` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_nxwgsqitpjffjjxcvlcqqhximpdygdtcnuoo` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=282 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldId` int NOT NULL,
  `sourceId` int NOT NULL,
  `sourceSiteId` int DEFAULT NULL,
  `targetId` int NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ysaqfagvzobqkrcyjlihunsjzaptphtjjglk` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_svswqfzmupnesyxjfgdinvchkbghbjiqjcst` (`sourceId`),
  KEY `idx_mqgjozmmrlyzmzgpojhzjbogvjuyxdezajyp` (`targetId`),
  KEY `idx_dkwaebjnnlskqoaldzubaoztjsbxaqopxkya` (`sourceSiteId`),
  CONSTRAINT `fk_fuejnkxdesfznbsqfqteljrremfrxjnopquv` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_hpxzynfdnkvckcrxsqabiblfiljhcrfkpdcx` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_urealfkddcrzovvsxdjcpiibuenbaqxuaxur` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `canonicalId` int NOT NULL,
  `creatorId` int DEFAULT NULL,
  `num` int NOT NULL,
  `notes` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_iibndfxpdxubdtqrkijaycfokcquabjzieph` (`canonicalId`,`num`),
  KEY `fk_rwqrspvffpxkvnnfaxqevetwacfpufzaievp` (`creatorId`),
  CONSTRAINT `fk_dialcetnxmowjnimzpupjpktwegqqdoxtzwy` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_rwqrspvffpxkvnnfaxqevetwacfpufzaievp` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searchindex` (
  `elementId` int NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int NOT NULL,
  `siteId` int NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_hhhyguglzqljzwaioxbtocniclzhetggakpc` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jacawitpndojsxpyldyhsuinpzvekrrovzkz` (`handle`),
  KEY `idx_vplqxkjzevvcjrlrwabrbsaakoxqkshjesrr` (`name`),
  KEY `idx_nstlwgjqvvelzjwpgmtfszqonayaprrolfvi` (`structureId`),
  KEY `idx_mndrrewqnnegzkallenwansedwfeklzxzqum` (`dateDeleted`),
  CONSTRAINT `fk_ukrjpvwsakagbjyuabwupivqyalrisikyeny` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sections_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `sectionId` int NOT NULL,
  `siteId` int NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mzqdrlnnjeocogrzhnbefsshjeqzgqqprdoi` (`sectionId`,`siteId`),
  KEY `idx_mdhyqijpvavlucybhszjqsxxywixvqdkglme` (`siteId`),
  CONSTRAINT `fk_hrarxtdtzywzseeflslkotvowufrwwouwkjk` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ifrjidskhfqodtnpyktwtwkfrgbmcumjxdkt` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mahprmkrwkemxwzxzyybsukecbnpvjkgtjbh` (`uid`),
  KEY `idx_qqgibrumvunumbkovavvzipckfpbmbhyqbua` (`token`),
  KEY `idx_hgjtegnpexcmgdkmnwnhqnipodydpgkiexrd` (`dateUpdated`),
  KEY `idx_dvxsdzykikrhkqmgnixmfddxdxhedmlrtuvo` (`userId`),
  CONSTRAINT `fk_jnrxcxpxzsdnaklslfgofxqbnfnslwcvbrim` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shunnedmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cxirfkqqsadivpvmodqjjchosmqigxirvxgq` (`userId`,`message`),
  CONSTRAINT `fk_ahxxekohdsrczbahjcpiaupminhpzpjrmauz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sitegroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dcsrlhzvqiaopymotspvbofpoffboboxyfsm` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cksuzxzrbxdsnqqaifjktorluzwjylgefzjl` (`dateDeleted`),
  KEY `idx_docewmvnvlsbkvlshflvtixyzqruxzoozitt` (`handle`),
  KEY `idx_hjdrxucuzrfasazgxreaqpxyfetoymkxnnzb` (`sortOrder`),
  KEY `fk_jisnjelfnfttztqzgsrlhghaycbxakqafvlw` (`groupId`),
  CONSTRAINT `fk_jisnjelfnfttztqzgsrlhghaycbxakqafvlw` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sprig_playgrounds`
--

DROP TABLE IF EXISTS `sprig_playgrounds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sprig_playgrounds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `component` text,
  `variables` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stc_4_cards`
--

DROP TABLE IF EXISTS `stc_4_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stc_4_cards` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_headline` text,
  `field_text` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cvnwnffrrrpqumsvmkxgptrackbnntvsklbz` (`elementId`,`siteId`),
  KEY `fk_pomhpabwpxfsflnlzqjjeymymngtnqsnerba` (`siteId`),
  CONSTRAINT `fk_fqtodsskvvaijbfpbynmmijyymvuugtwwtgg` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pomhpabwpxfsflnlzqjjeymymngtnqsnerba` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stc_7_items`
--

DROP TABLE IF EXISTS `stc_7_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stc_7_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_headline_ulhmxhwm` text,
  `field_text_qwtjrjmx` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qqildeozrjixruqsaupqalxdlovpkmeaifql` (`elementId`,`siteId`),
  KEY `fk_icjukvhxersglqbfcrqmogdnvclmbwwjsnlh` (`siteId`),
  CONSTRAINT `fk_gweqccnqipyakbeguadijskhgibnwjewlwba` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_icjukvhxersglqbfcrqmogdnvclmbwwjsnlh` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stc_8_items`
--

DROP TABLE IF EXISTS `stc_8_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stc_8_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `elementId` int NOT NULL,
  `siteId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_subline_ycwyqdyl` text,
  `field_headline_digfgtnk` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_yolfukigioorlyjzcsfkobbntxnoemishlkl` (`elementId`,`siteId`),
  KEY `fk_ckkwbyevxvpnaqauoevihtfprgprajlmzplh` (`siteId`),
  CONSTRAINT `fk_ckkwbyevxvpnaqauoevihtfprgprajlmzplh` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pyvryarpipwgysazfoogwghemadzujwgktje` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structureelements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structureId` int NOT NULL,
  `elementId` int DEFAULT NULL,
  `root` int unsigned DEFAULT NULL,
  `lft` int unsigned NOT NULL,
  `rgt` int unsigned NOT NULL,
  `level` smallint unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_vshtskmkmwcsalaipszrzqhrvugejxptpbsm` (`structureId`,`elementId`),
  KEY `idx_sdtdurkterpptkqaenaayxaymbpvowqeclyn` (`root`),
  KEY `idx_ytazosvbxtzsrcpttlxvfxtccjuszujumavb` (`lft`),
  KEY `idx_okwppwsvfmkgzenwzhomfknhsppmzuzoqjuc` (`rgt`),
  KEY `idx_ptsuswwyaahppnseelxfhbmsudnwzxmrnvzu` (`level`),
  KEY `idx_mpeodpaeepfmqpkjqwqrlpmdhxnpzppmsxoh` (`elementId`),
  CONSTRAINT `fk_utblowzvqsqnujzdwyiwzfntwivwyvqerkhq` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_demxirkhqxrsyttwaqestchgfgbqruhjegge` (`dateDeleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `systemmessages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tyuzqdfmkomiczcfotlfnguwgybvjfnfsdha` (`key`,`language`),
  KEY `idx_dwolpihxixkbfjnktttkkaxiblpymwfetyjm` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taggroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ahdpjhxxnzobewgznazginbdevaxnmlkjhwr` (`name`),
  KEY `idx_cemufhcmyicyhkxbriyfwbtugwcwkfujetbk` (`handle`),
  KEY `idx_yatlrqbxrnbhjzfknkpmnqrilcpaajhkuylh` (`dateDeleted`),
  KEY `fk_bolkwmhrrfvflensybwbqiwktcszddgtifev` (`fieldLayoutId`),
  CONSTRAINT `fk_bolkwmhrrfvflensybwbqiwktcszddgtifev` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int NOT NULL,
  `groupId` int NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_xblmftnvwmuwbvtepwbtrlvbxfcxyweaapqc` (`groupId`),
  CONSTRAINT `fk_jydubyvdeivothiqfgioaixouambgkkfundi` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wsdxbpkwjphkpmaoinoucafevfllmkepqoej` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint unsigned DEFAULT NULL,
  `usageCount` tinyint unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_oyapeabuutoqukfvbatrjfcvpguruzxefdli` (`token`),
  KEY `idx_eyfbxldqxfzqtunabpycyyfecfwxjprpjnbm` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uvohloermkjpnjuccofamdphyvexvmiqbpsq` (`handle`),
  KEY `idx_gqxtrdihojcsuzsxapcotljaoiylcfhgsjgg` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usergroups_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `groupId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_qrpiipwdlghkxctycbkfatowhxyrpvkvxjqr` (`groupId`,`userId`),
  KEY `idx_wewtxtbzbpeihyzphpbtohbqlugqjkonlvqs` (`userId`),
  CONSTRAINT `fk_npffqapstvjkuyleicovikkqnxiplcgqbjvl` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zhrtiliztrvtqrfsadmsqxfjedgqnpmranel` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usarjlulaveejrrojyuicvaulwrhlkrvllot` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `groupId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xcyxbjkmekzluhvriclhwwkufrcypgsfpqvo` (`permissionId`,`groupId`),
  KEY `idx_kvmnnpukfrdwsocrnzkirnzndfpvgxawsfwz` (`groupId`),
  CONSTRAINT `fk_kynzbsanunlgyewxbyaqkkgjivtdcckhujqg` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vcjvcwcjjfpqbiazinjnbrkigptppxvmiaqv` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=199 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpermissions_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permissionId` int NOT NULL,
  `userId` int NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_voctlsbkrpafkhjwfquwohbpblxzkuyqqfcz` (`permissionId`,`userId`),
  KEY `idx_sdedtdnrjrzifcmmbhccvzthkdbalrrdkbvr` (`userId`),
  CONSTRAINT `fk_atbwecbscleazzwgsanjctgwqrjslogyrgsj` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nasrftvbqnhkpzoqnijxldiuniimagskcsqc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userpreferences` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `preferences` text,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_lzzcccppodtviztrdjljcbvphugmjqudiriw` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL,
  `photoId` int DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_uxscfcxigkwjluhtjmfngpbazzgmavbcqvxp` (`active`),
  KEY `idx_dkwavqqyqvbcohhdjhuuqyxbydqusstocflf` (`locked`),
  KEY `idx_hnqnvwycohpsdnhmajhdrcyszpjuuiykjcks` (`pending`),
  KEY `idx_xtgdtbypbtgbvkcipbqqqenulotdtlqxmfks` (`suspended`),
  KEY `idx_nvdadjckwgelvcfboesuvjpcneklhvpiaffp` (`verificationCode`),
  KEY `idx_hpumocbzixeluusudvoeihdxtripxedmenhf` (`email`),
  KEY `idx_mfoxuffiviyjxackysctlqxplhuixiqwuktv` (`username`),
  KEY `fk_odscgjszoxbnziqvigqzoedflgtfmdbxdkka` (`photoId`),
  CONSTRAINT `fk_nharsfggwqllwlhxwegrwsoyngjcsrtqylgi` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_odscgjszoxbnziqvigqzoedflgtfmdbxdkka` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumefolders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `parentId` int DEFAULT NULL,
  `volumeId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cduqpkpqrjckmkltmpggrbdmzrhpiogpvijm` (`name`,`parentId`,`volumeId`),
  KEY `idx_cglwpvsbiyyqrnthgjqrmywwhxxppnmbhkre` (`parentId`),
  KEY `idx_kgqvmhhjtyampgvrybnykvphzrwpzhespwfc` (`volumeId`),
  CONSTRAINT `fk_yqhitnsctfncunopauijpwgtbixikifczpkp` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zxnfdjxmzxwowlppyafzkorvkpaxbejecnaw` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_fyqeczbatwiwpguzajaiopoiptjjoywwppaj` (`name`),
  KEY `idx_diauuxgxypumlxgfzoahxemcpqboruqeibwd` (`handle`),
  KEY `idx_ybbrhvopzevrouetwwjpteaxwwkoagsotgvf` (`fieldLayoutId`),
  KEY `idx_zcnnrinmlubnsocusqgmlkwcyeqtsejwjkfg` (`dateDeleted`),
  CONSTRAINT `fk_uepkcyncrulggrrmfopuipmtvdmjnfmrltij` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint unsigned DEFAULT NULL,
  `colspan` tinyint DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hegimvgbswrbwgotjwswjvotecrifiquitgj` (`userId`),
  CONSTRAINT `fk_yzymqufboaablllxkuveuwotqywwogbcsmzl` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'todolist'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-12 14:30:31
-- MySQL dump 10.13  Distrib 8.0.33, for macos13.3 (arm64)
--
-- Host: localhost    Database: todolist
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (26,1,'email','2023-09-11 13:34:13',0,26),(26,1,'fullName','2023-09-11 13:34:13',0,26),(26,1,'lastPasswordChangeDate','2023-09-11 13:34:22',0,26),(26,1,'password','2023-09-11 13:34:22',0,26),(28,1,'postDate','2023-08-18 13:09:11',0,26),(28,1,'slug','2023-08-18 13:09:11',0,26),(28,1,'title','2023-08-18 13:09:10',0,26),(28,1,'uri','2023-08-18 13:09:11',0,26),(30,1,'postDate','2023-08-18 13:16:13',0,26),(30,1,'slug','2023-08-18 13:16:14',0,26),(30,1,'title','2023-08-18 13:16:13',0,26),(30,1,'uri','2023-08-18 13:16:14',0,26),(82,1,'enabled','2023-09-12 12:29:18',0,26);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,1,1,'Impressum','2023-08-18 12:47:01','2023-08-18 12:47:02','67456ccc-ac1a-4bf8-881c-8ea2226d06ef'),(2,2,1,'Impressum','2023-08-18 12:47:01','2023-08-18 12:47:01','e609b0df-2a16-4a8c-951b-ae90bdfbc9b4'),(3,3,1,'Impressum','2023-08-18 12:47:01','2023-08-18 12:47:01','6084f6a0-4788-496a-82b5-0a5006661bc7'),(4,4,1,'Datenschutz','2023-08-18 12:47:01','2023-08-18 12:47:02','62c70b4f-e4f4-4814-be19-89fe05084d69'),(5,5,1,'Datenschutz','2023-08-18 12:47:01','2023-08-18 12:47:01','86ee080e-4e2b-4958-8516-f3e810f2a1f0'),(6,6,1,'Datenschutz','2023-08-18 12:47:01','2023-08-18 12:47:01','7af883e8-65e5-4df5-881b-3c82caf9dfa8'),(7,7,1,'Kontakt','2023-08-18 12:47:01','2023-08-18 12:47:02','fe0c005b-1324-4d5a-b9d7-7dc553535082'),(8,8,1,'Kontakt','2023-08-18 12:47:01','2023-08-18 12:47:01','55dfd8f3-01cc-4d13-94d0-e96819df2baf'),(9,9,1,'Kontakt','2023-08-18 12:47:01','2023-08-18 12:47:01','2c7cefc9-f7fb-408b-a2e2-0aaed8f9bd54'),(10,10,1,'Home','2023-08-18 12:47:01','2023-08-18 12:53:53','7cb2f83f-8506-45b3-b018-681a79774771'),(11,11,1,'Home','2023-08-18 12:47:01','2023-08-18 12:47:01','005a934d-1865-433a-9664-5839e8724f7b'),(12,12,1,'Home','2023-08-18 12:47:01','2023-08-18 12:47:01','af64875b-f0b8-4aa6-8350-cfba14ddc0e9'),(13,13,1,'Merkliste','2023-08-18 12:47:01','2023-08-18 12:47:02','dfc6cd2e-aecd-4e8b-948d-e725d1cea085'),(14,14,1,'Merkliste','2023-08-18 12:47:01','2023-08-18 12:47:01','eb1545e3-071f-41c7-8398-c7b03a5c2b2d'),(15,15,1,'Merkliste','2023-08-18 12:47:01','2023-08-18 12:47:01','33cb05ae-46fa-47c1-a6b9-665e69aa05eb'),(16,16,1,'Impressum','2023-08-18 12:47:02','2023-08-18 12:47:02','8bc197ae-fde3-45ff-9999-f9a2e6c6f551'),(17,17,1,'Impressum','2023-08-18 12:47:02','2023-08-18 12:47:02','94c959ca-e307-4c57-a8c2-1f56ae578e6e'),(18,18,1,'Datenschutz','2023-08-18 12:47:02','2023-08-18 12:47:02','22f97788-abd0-4709-b562-a2a5f6770e73'),(19,19,1,'Datenschutz','2023-08-18 12:47:02','2023-08-18 12:47:02','ec366115-a012-4791-9ed3-ffd9c659d90a'),(20,20,1,'Kontakt','2023-08-18 12:47:02','2023-08-18 12:47:02','8e6d0944-214f-4c18-98c0-6f0913555ed0'),(21,21,1,'Kontakt','2023-08-18 12:47:02','2023-08-18 12:47:02','525a6239-7517-4aac-a6b1-8d5c27faa6ba'),(22,22,1,'Home','2023-08-18 12:47:02','2023-08-18 12:47:02','2b5dc9f2-dc59-4dea-925f-3889107a3fe3'),(23,23,1,'Home','2023-08-18 12:47:02','2023-08-18 12:47:02','8f6be98d-34ad-4395-8616-b835ae773b13'),(24,24,1,'Merkliste','2023-08-18 12:47:02','2023-08-18 12:47:02','f4e50df4-fd98-4f9e-b933-a2fd5f57328d'),(25,25,1,'Merkliste','2023-08-18 12:47:02','2023-08-18 12:47:02','67e64411-41d8-4a52-a71a-cef5f8cd69ba'),(26,26,1,NULL,'2023-08-18 12:47:03','2023-09-11 13:34:22','a7f10097-19e1-4055-9b4f-94345bb7e1c0'),(27,27,1,'Home','2023-08-18 12:53:53','2023-08-18 12:53:53','af66c13f-b673-4037-99ee-f0ec8a71b7a8'),(28,28,1,'first vs second','2023-08-18 13:09:03','2023-08-18 13:09:11','8e57a11d-d202-4297-ad63-7f76a8b67c65'),(29,29,1,'first vs second','2023-08-18 13:09:11','2023-08-18 13:09:11','2bc68c69-6a7e-48de-bba3-e8cc20292a29'),(30,30,1,'Cras justo odio, dapibus ac facilisis in, egestas eget quam. vs Nulla vitae elit libero, a pharetra augue.','2023-08-18 13:16:02','2023-08-18 13:16:14','5d18e301-8824-4c5c-acaa-32b048bf6a05'),(31,31,1,'Cras justo odio, dapibus ac facilisis in, egestas eget quam. vs Nulla vitae elit libero, a pharetra augue.','2023-08-18 13:16:14','2023-08-18 13:16:14','18e43bbf-e917-4c18-aafb-d96da23bf017'),(80,80,1,'Take over the world','2023-09-12 12:28:41','2023-09-12 12:28:41','fddbb006-0677-4523-87b9-572bbc627b30'),(81,81,1,'Stack stats','2023-09-12 12:28:58','2023-09-12 12:28:58','fc36c29c-8189-4cb4-9b94-576852bb2cf7'),(82,82,1,'Study bitcoin','2023-09-12 12:29:09','2023-09-12 12:29:18','61d514c5-8cc9-45f5-9216-f010f8aead15');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementactivity`
--

LOCK TABLES `elementactivity` WRITE;
/*!40000 ALTER TABLE `elementactivity` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elementactivity` VALUES (28,26,1,NULL,'view','2023-09-11 11:34:47'),(30,26,1,NULL,'view','2023-09-11 11:34:44');
/*!40000 ALTER TABLE `elementactivity` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,2,'craft\\elements\\Entry',1,0,'2023-08-18 12:47:01','2023-08-18 12:47:02',NULL,'2023-09-11 13:16:45','6e0b7994-06d9-46b5-bb35-af16ac220c8d'),(2,1,NULL,1,2,'craft\\elements\\Entry',1,0,'2023-08-18 12:47:01','2023-08-18 12:47:01',NULL,NULL,'5613772b-6f9b-460d-81e0-860d9888af74'),(3,1,NULL,2,2,'craft\\elements\\Entry',1,0,'2023-08-18 12:47:01','2023-08-18 12:47:01',NULL,NULL,'db3a7e25-1695-4f8c-9910-c158dc274f5b'),(4,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2023-08-18 12:47:01','2023-08-18 12:47:02',NULL,'2023-09-11 13:16:52','6f800676-2d42-4ebe-9d2d-f9a282cb4173'),(5,4,NULL,3,4,'craft\\elements\\Entry',1,0,'2023-08-18 12:47:01','2023-08-18 12:47:01',NULL,NULL,'efdf271b-d109-42da-bca1-b2f8e1ab456e'),(6,4,NULL,4,4,'craft\\elements\\Entry',1,0,'2023-08-18 12:47:01','2023-08-18 12:47:01',NULL,NULL,'bca3edfe-23a3-4be3-9d68-91d6def7b2e6'),(7,NULL,NULL,NULL,5,'craft\\elements\\Entry',1,0,'2023-08-18 12:47:01','2023-08-18 12:47:02',NULL,'2023-08-18 12:49:38','03e29ded-6165-4e7f-9a7d-4bfc1f8a8587'),(8,7,NULL,5,5,'craft\\elements\\Entry',1,0,'2023-08-18 12:47:01','2023-08-18 12:47:01',NULL,NULL,'c3381aa2-09f8-4f7e-bd8d-0e9a5eefbb10'),(9,7,NULL,6,5,'craft\\elements\\Entry',1,0,'2023-08-18 12:47:01','2023-08-18 12:47:01',NULL,NULL,'009538dc-9d18-4472-a6be-02da9e997bcf'),(10,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2023-08-18 12:47:01','2023-08-18 12:53:53',NULL,'2023-09-11 13:16:49','33af25e2-33d1-4138-9b3a-40776c6ed165'),(11,10,NULL,7,6,'craft\\elements\\Entry',1,0,'2023-08-18 12:47:01','2023-08-18 12:47:01',NULL,NULL,'cb813411-8a10-4240-8dba-7da4ce3087a2'),(12,10,NULL,8,6,'craft\\elements\\Entry',1,0,'2023-08-18 12:47:01','2023-08-18 12:47:01',NULL,NULL,'ca079238-f8fa-4a30-b341-3d22ffdd6e7b'),(13,NULL,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2023-08-18 12:47:01','2023-08-18 12:47:02',NULL,'2023-08-18 12:49:53','0cb937aa-0ff0-4463-837e-51d0c488eed8'),(14,13,NULL,9,11,'craft\\elements\\Entry',1,0,'2023-08-18 12:47:01','2023-08-18 12:47:01',NULL,NULL,'575bbc30-2491-4dee-9338-3348e074c977'),(15,13,NULL,10,11,'craft\\elements\\Entry',1,0,'2023-08-18 12:47:01','2023-08-18 12:47:01',NULL,NULL,'1134456e-82b3-438d-874e-f7868169ba9d'),(16,1,NULL,11,2,'craft\\elements\\Entry',1,0,'2023-08-18 12:47:02','2023-08-18 12:47:02',NULL,NULL,'f159d5d5-056d-4844-a68c-b8558548ec41'),(17,1,NULL,12,2,'craft\\elements\\Entry',1,0,'2023-08-18 12:47:02','2023-08-18 12:47:02',NULL,NULL,'cd9472ec-f4a9-469e-8706-fed56d1c53d1'),(18,4,NULL,13,4,'craft\\elements\\Entry',1,0,'2023-08-18 12:47:02','2023-08-18 12:47:02',NULL,NULL,'ea07a967-47a9-4357-adfb-0c3551f3db55'),(19,4,NULL,14,4,'craft\\elements\\Entry',1,0,'2023-08-18 12:47:02','2023-08-18 12:47:02',NULL,NULL,'139387d8-719d-43a6-8c94-b56a0ac2d8bd'),(20,7,NULL,15,5,'craft\\elements\\Entry',1,0,'2023-08-18 12:47:02','2023-08-18 12:47:02',NULL,NULL,'0ce0fe9d-fe5a-4cbb-b912-c3265164120c'),(21,7,NULL,16,5,'craft\\elements\\Entry',1,0,'2023-08-18 12:47:02','2023-08-18 12:47:02',NULL,NULL,'e1d75f14-b687-4319-9018-608b98c3c012'),(22,10,NULL,17,6,'craft\\elements\\Entry',1,0,'2023-08-18 12:47:02','2023-08-18 12:47:02',NULL,NULL,'65b414e8-4321-4811-b2dd-5b1e70d9e887'),(23,10,NULL,18,6,'craft\\elements\\Entry',1,0,'2023-08-18 12:47:02','2023-08-18 12:47:02',NULL,NULL,'f58d86fa-a6b4-44b9-949a-bc0c029783fd'),(24,13,NULL,19,11,'craft\\elements\\Entry',1,0,'2023-08-18 12:47:02','2023-08-18 12:47:02',NULL,NULL,'29bb4c6b-86f0-4370-ad33-48dcc830e3c7'),(25,13,NULL,20,11,'craft\\elements\\Entry',1,0,'2023-08-18 12:47:02','2023-08-18 12:47:02',NULL,NULL,'62f0e95f-95c8-4464-924f-2a8d7b4316dd'),(26,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2023-08-18 12:47:03','2023-09-11 13:34:22',NULL,NULL,'e55a09c8-71f3-45fa-8dbb-adc3c7e63ac9'),(27,10,NULL,21,6,'craft\\elements\\Entry',1,0,'2023-08-18 12:53:53','2023-08-18 12:53:53',NULL,NULL,'a5328f45-4c43-4deb-91b3-93abce644708'),(28,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2023-08-18 13:09:03','2023-08-18 13:09:11',NULL,'2023-09-11 13:16:54','0c68e35e-0cd9-4a97-8f96-0c6f03740e45'),(29,28,NULL,22,7,'craft\\elements\\Entry',1,0,'2023-08-18 13:09:11','2023-08-18 13:09:11',NULL,NULL,'dd9a5c6d-f61d-4d21-b657-1a0761861ca9'),(30,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2023-08-18 13:16:02','2023-08-18 13:16:14',NULL,'2023-09-11 13:16:54','7d967eb4-8341-42cd-997c-bcaf6d1c9cba'),(31,30,NULL,23,7,'craft\\elements\\Entry',1,0,'2023-08-18 13:16:14','2023-08-18 13:16:14',NULL,NULL,'78916b72-83ad-4e28-abbd-ed3e75265521'),(80,NULL,NULL,NULL,22,'craft\\elements\\Entry',1,0,'2023-09-12 12:28:41','2023-09-12 12:28:41',NULL,NULL,'d65f9820-e47d-4d52-94e2-6f470862ecd3'),(81,NULL,NULL,NULL,22,'craft\\elements\\Entry',1,0,'2023-09-12 12:28:58','2023-09-12 12:28:58',NULL,NULL,'13137ecf-0d31-41df-9a87-0524b2e433bb'),(82,NULL,NULL,NULL,22,'craft\\elements\\Entry',0,0,'2023-09-12 12:29:09','2023-09-12 12:29:18',NULL,NULL,'e5cea52c-be80-4784-9e20-5c51341bdae3');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,'impressum','impressum',1,'2023-08-18 12:47:01','2023-08-18 12:47:01','a7e6107d-cd50-4cfb-a0e6-2626dbe487fc'),(2,2,1,'impressum','impressum',1,'2023-08-18 12:47:01','2023-08-18 12:47:01','a8707eb7-20c4-4ca9-b190-0b547b534ab7'),(3,3,1,'impressum','impressum',1,'2023-08-18 12:47:01','2023-08-18 12:47:01','2c7e4664-2892-4e30-8cbc-e406b847813a'),(4,4,1,'datenschutz','datenschutz',1,'2023-08-18 12:47:01','2023-08-18 12:47:01','95335ae9-0512-4bea-a733-69d9ffe9cf98'),(5,5,1,'datenschutz','datenschutz',1,'2023-08-18 12:47:01','2023-08-18 12:47:01','ae4bf477-0f03-4952-9a03-e08666da9d8a'),(6,6,1,'datenschutz','datenschutz',1,'2023-08-18 12:47:01','2023-08-18 12:47:01','15880867-e91f-4f61-8302-23bd419d923c'),(7,7,1,'kontakt','kontakt',1,'2023-08-18 12:47:01','2023-08-18 12:47:01','e18ae132-0b56-4331-9999-7bb6036a86da'),(8,8,1,'kontakt','kontakt',1,'2023-08-18 12:47:01','2023-08-18 12:47:01','bed0c38a-6741-459c-9585-e4de78213926'),(9,9,1,'kontakt','kontakt',1,'2023-08-18 12:47:01','2023-08-18 12:47:01','3f583332-0155-4597-bdfa-fa2c5cb30908'),(10,10,1,'home','__home__',1,'2023-08-18 12:47:01','2023-08-18 12:47:01','5ac60d67-5680-463a-8340-5662e93974a9'),(11,11,1,'home','__home__',1,'2023-08-18 12:47:01','2023-08-18 12:47:01','31332e43-5afd-40df-8e0a-b76010faa3a6'),(12,12,1,'home','__home__',1,'2023-08-18 12:47:01','2023-08-18 12:47:01','f4458d62-73fa-43f5-85f1-22136b83fa99'),(13,13,1,'merkliste','merkliste',1,'2023-08-18 12:47:01','2023-08-18 12:47:01','c13004a8-edcb-4dfa-aba6-6364634c5410'),(14,14,1,'merkliste','merkliste',1,'2023-08-18 12:47:01','2023-08-18 12:47:01','847ada7d-402f-4423-aa2b-a47c0b4b28b7'),(15,15,1,'merkliste','merkliste',1,'2023-08-18 12:47:01','2023-08-18 12:47:01','30702591-b9e2-408a-9a08-1045c5dc981d'),(16,16,1,'impressum','impressum',1,'2023-08-18 12:47:02','2023-08-18 12:47:02','4e7dedc1-9feb-4db6-84fc-24e7d0d9d54c'),(17,17,1,'impressum','impressum',1,'2023-08-18 12:47:02','2023-08-18 12:47:02','4de53c4a-cdb4-467e-b8eb-f2ae1651502e'),(18,18,1,'datenschutz','datenschutz',1,'2023-08-18 12:47:02','2023-08-18 12:47:02','3331293c-0359-4b6e-aeb6-b2b5abd4dac2'),(19,19,1,'datenschutz','datenschutz',1,'2023-08-18 12:47:02','2023-08-18 12:47:02','3e384f1a-c029-41c1-b193-c5ee220da612'),(20,20,1,'kontakt','kontakt',1,'2023-08-18 12:47:02','2023-08-18 12:47:02','40e65e9e-49ea-446f-b55a-66892703282f'),(21,21,1,'kontakt','kontakt',1,'2023-08-18 12:47:02','2023-08-18 12:47:02','a004087c-e4e4-4d3e-8643-50fed607318c'),(22,22,1,'home','__home__',1,'2023-08-18 12:47:02','2023-08-18 12:47:02','2597b0e7-7596-4b67-b780-dc6521f2d613'),(23,23,1,'home','__home__',1,'2023-08-18 12:47:02','2023-08-18 12:47:02','b93e4341-c7b9-4dc2-96c9-01620a922b3f'),(24,24,1,'merkliste','merkliste',1,'2023-08-18 12:47:02','2023-08-18 12:47:02','a04f0846-0add-4957-9d37-f11f581c2771'),(25,25,1,'merkliste','merkliste',1,'2023-08-18 12:47:02','2023-08-18 12:47:02','1468308c-966d-49d0-885b-2f8940deeef4'),(26,26,1,NULL,NULL,1,'2023-08-18 12:47:03','2023-08-18 12:47:03','7a61b3d8-5cd4-4920-9747-04a32194f996'),(27,27,1,'home','__home__',1,'2023-08-18 12:53:53','2023-08-18 12:53:53','1731e368-ce9c-4e89-9b2b-ae2f05a0edf8'),(28,28,1,'first-vs-second','battles/first-vs-second',1,'2023-08-18 13:09:03','2023-08-18 13:09:11','05601d7e-4057-4a52-bc16-6fa0f88f4fe5'),(29,29,1,'first-vs-second','battles/first-vs-second',1,'2023-08-18 13:09:11','2023-08-18 13:09:11','6993f360-2174-424b-aae4-7e259c47d8ed'),(30,30,1,'cras-justo-odio-dapibus-ac-facilisis-in-egestas-eget-quam-vs-nulla-vitae-elit-libero-a-pharetra-augue','battles/cras-justo-odio-dapibus-ac-facilisis-in-egestas-eget-quam-vs-nulla-vitae-elit-libero-a-pharetra-augue',1,'2023-08-18 13:16:02','2023-08-18 13:16:14','569aa7bb-5c66-47d3-b442-dc2e80642473'),(31,31,1,'cras-justo-odio-dapibus-ac-facilisis-in-egestas-eget-quam-vs-nulla-vitae-elit-libero-a-pharetra-augue','battles/cras-justo-odio-dapibus-ac-facilisis-in-egestas-eget-quam-vs-nulla-vitae-elit-libero-a-pharetra-augue',1,'2023-08-18 13:16:14','2023-08-18 13:16:14','bf5917c5-f094-4e32-be5a-479719eeddea'),(80,80,1,'take-over-the-world',NULL,1,'2023-09-12 12:28:41','2023-09-12 12:28:41','e415c485-da8c-4bf6-9555-ecc9f339d431'),(81,81,1,'stack-stats',NULL,1,'2023-09-12 12:28:58','2023-09-12 12:28:58','f2556505-be03-42e4-8550-032096cd9417'),(82,82,1,'study-bitcoin',NULL,1,'2023-09-12 12:29:09','2023-09-12 12:29:09','1a2cb523-5009-4821-a621-7b83ab983df6');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (1,6,NULL,1,NULL,'2023-08-18 12:47:00',NULL,1,'2023-08-18 12:47:01','2023-08-18 12:47:01'),(2,6,NULL,1,NULL,'2023-08-18 12:47:00',NULL,NULL,'2023-08-18 12:47:01','2023-08-18 12:47:01'),(3,6,NULL,1,NULL,'2023-08-18 12:47:00',NULL,NULL,'2023-08-18 12:47:01','2023-08-18 12:47:01'),(4,4,NULL,3,NULL,'2023-08-18 12:47:00',NULL,1,'2023-08-18 12:47:01','2023-08-18 12:47:01'),(5,4,NULL,3,NULL,'2023-08-18 12:47:00',NULL,NULL,'2023-08-18 12:47:01','2023-08-18 12:47:01'),(6,4,NULL,3,NULL,'2023-08-18 12:47:00',NULL,NULL,'2023-08-18 12:47:01','2023-08-18 12:47:01'),(7,11,NULL,4,NULL,'2023-08-18 12:47:00',NULL,1,'2023-08-18 12:47:01','2023-08-18 12:47:01'),(8,11,NULL,4,NULL,'2023-08-18 12:47:00',NULL,NULL,'2023-08-18 12:47:01','2023-08-18 12:47:01'),(9,11,NULL,4,NULL,'2023-08-18 12:47:00',NULL,NULL,'2023-08-18 12:47:01','2023-08-18 12:47:01'),(10,7,NULL,5,NULL,'2023-08-18 12:47:00',NULL,1,'2023-08-18 12:47:01','2023-08-18 12:47:01'),(11,7,NULL,5,NULL,'2023-08-18 12:47:00',NULL,NULL,'2023-08-18 12:47:01','2023-08-18 12:47:01'),(12,7,NULL,5,NULL,'2023-08-18 12:47:00',NULL,NULL,'2023-08-18 12:47:01','2023-08-18 12:47:01'),(13,1,NULL,10,NULL,'2023-08-18 12:47:00',NULL,1,'2023-08-18 12:47:01','2023-08-18 12:47:01'),(14,1,NULL,10,NULL,'2023-08-18 12:47:00',NULL,NULL,'2023-08-18 12:47:01','2023-08-18 12:47:01'),(15,1,NULL,10,NULL,'2023-08-18 12:47:00',NULL,NULL,'2023-08-18 12:47:01','2023-08-18 12:47:01'),(16,6,NULL,1,NULL,'2023-08-18 12:47:00',NULL,NULL,'2023-08-18 12:47:02','2023-08-18 12:47:02'),(17,6,NULL,1,NULL,'2023-08-18 12:47:00',NULL,NULL,'2023-08-18 12:47:02','2023-08-18 12:47:02'),(18,4,NULL,3,NULL,'2023-08-18 12:47:00',NULL,NULL,'2023-08-18 12:47:02','2023-08-18 12:47:02'),(19,4,NULL,3,NULL,'2023-08-18 12:47:00',NULL,NULL,'2023-08-18 12:47:02','2023-08-18 12:47:02'),(20,11,NULL,4,NULL,'2023-08-18 12:47:00',NULL,NULL,'2023-08-18 12:47:02','2023-08-18 12:47:02'),(21,11,NULL,4,NULL,'2023-08-18 12:47:00',NULL,NULL,'2023-08-18 12:47:02','2023-08-18 12:47:02'),(22,7,NULL,5,NULL,'2023-08-18 12:47:00',NULL,NULL,'2023-08-18 12:47:02','2023-08-18 12:47:02'),(23,7,NULL,5,NULL,'2023-08-18 12:47:00',NULL,NULL,'2023-08-18 12:47:02','2023-08-18 12:47:02'),(24,1,NULL,10,NULL,'2023-08-18 12:47:00',NULL,NULL,'2023-08-18 12:47:02','2023-08-18 12:47:02'),(25,1,NULL,10,NULL,'2023-08-18 12:47:00',NULL,NULL,'2023-08-18 12:47:02','2023-08-18 12:47:02'),(27,7,NULL,5,NULL,'2023-08-18 12:47:00',NULL,NULL,'2023-08-18 12:53:53','2023-08-18 12:53:53'),(28,3,NULL,6,26,'2023-08-18 13:09:00',NULL,1,'2023-08-18 13:09:03','2023-08-18 13:09:11'),(29,3,NULL,6,26,'2023-08-18 13:09:00',NULL,NULL,'2023-08-18 13:09:11','2023-08-18 13:09:11'),(30,3,NULL,6,26,'2023-08-18 13:16:00',NULL,1,'2023-08-18 13:16:02','2023-08-18 13:16:13'),(31,3,NULL,6,26,'2023-08-18 13:16:00',NULL,NULL,'2023-08-18 13:16:14','2023-08-18 13:16:14'),(80,12,NULL,12,26,'2023-09-12 12:28:00',NULL,NULL,'2023-09-12 12:28:41','2023-09-12 12:28:41'),(81,12,NULL,12,26,'2023-09-12 12:28:00',NULL,NULL,'2023-09-12 12:28:58','2023-09-12 12:28:58'),(82,12,NULL,12,26,'2023-09-12 12:29:00',NULL,NULL,'2023-09-12 12:29:09','2023-09-12 12:29:09');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,6,2,'Impressum','imprint',0,'site',NULL,'{section.name|raw}','site',NULL,1,1,'2023-08-18 12:47:01','2023-08-18 12:47:01','2023-09-11 13:16:45','8471ef89-8131-43ab-9f21-f8f49a4dda3b'),(2,8,3,'Standard','default',1,'site',NULL,NULL,'site',NULL,1,1,'2023-08-18 12:47:01','2023-08-18 12:47:01','2023-08-18 12:50:10','d2100f3a-dfb4-4534-a819-fc676b70594b'),(3,4,4,'Datenschutz','privacy',0,'site',NULL,'{section.name|raw}','site',NULL,1,1,'2023-08-18 12:47:01','2023-08-18 12:47:01','2023-09-11 13:16:52','5bed4d00-6f1b-4abd-8ccb-e55c42025f9f'),(4,11,5,'Kontakt','contact',0,'site',NULL,'{section.name|raw}','site',NULL,1,1,'2023-08-18 12:47:01','2023-08-18 12:47:01','2023-08-18 12:49:38','6fb2f3c1-fa53-49b5-94ae-76b10d5c3380'),(5,7,6,'Home','home',0,'site',NULL,'Home','site',NULL,1,1,'2023-08-18 12:47:01','2023-08-18 12:47:01','2023-09-11 13:16:49','faa291e4-344c-4482-a847-09ab3f85bee6'),(6,3,7,'Battle','battle',0,'site',NULL,'{first} vs {second}','site',NULL,1,1,'2023-08-18 12:47:01','2023-08-18 12:58:44','2023-09-11 13:16:54','b906ea99-0ff9-42af-949d-23c52e74eafa'),(7,10,8,'Standard','default',1,'site',NULL,NULL,'site',NULL,1,1,'2023-08-18 12:47:01','2023-08-18 12:47:01','2023-08-18 12:50:07','990e33e1-66dc-4958-8a54-a67e697c9707'),(8,2,9,'Default','default',0,'site',NULL,'{author.id}-{relatedArticle.one().title}','site',NULL,1,1,'2023-08-18 12:47:01','2023-08-18 12:47:01','2023-08-18 12:50:15','f78121c0-94dc-4bd1-9ee0-6f7783f3b60b'),(9,5,10,'Standard','default',1,'site',NULL,NULL,'site',NULL,1,1,'2023-08-18 12:47:01','2023-08-18 12:47:01','2023-08-18 12:49:42','43dde57b-fb13-49cd-bf1a-4ee5cf7fbdc5'),(10,1,11,'Merkliste','watchlist',0,'site',NULL,'{section.name|raw}','site',NULL,1,1,'2023-08-18 12:47:01','2023-08-18 12:47:01','2023-08-18 12:49:53','9740ba5d-2610-4022-9746-115633ae34f2'),(11,9,12,'Projekt','project',1,'site',NULL,NULL,'site',NULL,1,1,'2023-08-18 12:47:01','2023-08-18 12:47:01','2023-08-18 12:50:04','0baf2383-579b-4ba6-a068-46c520246fa7'),(12,12,22,'Item','item',1,'site',NULL,NULL,'site',NULL,1,1,'2023-08-18 13:34:38','2023-09-11 13:17:56',NULL,'2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldgroups` VALUES (1,'Builders','2023-08-18 12:47:00','2023-08-18 12:47:00','2023-08-18 12:53:32','d50431c7-2899-4e67-98c4-0edd8caa49ec'),(2,'Common','2023-08-18 12:47:00','2023-08-18 12:47:00',NULL,'84aef975-f98d-44f6-8450-a081ab798069'),(3,'Seo','2023-08-18 12:47:00','2023-08-18 12:47:00','2023-08-18 12:53:27','c885c595-cebb-48a3-8d9a-be401441ce25'),(4,'Projects','2023-08-18 12:47:00','2023-08-18 12:47:00','2023-08-18 12:53:22','dbafd468-7d76-42ea-b186-fc5b0b5b6518'),(5,'Articles','2023-08-18 12:47:00','2023-08-18 12:47:00','2023-08-18 12:53:37','d36af1ae-11b7-4698-9536-88f925536e44');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayoutfields` VALUES (273,19,96,59,0,0,'2023-08-18 12:47:03','2023-08-18 12:47:03','9c52158b-2c81-47c3-990d-05359a4af19a'),(274,19,96,58,1,1,'2023-08-18 12:47:03','2023-08-18 12:47:03','907756c9-36ba-4962-b77a-64475dad4701'),(275,19,96,61,0,2,'2023-08-18 12:47:03','2023-08-18 12:47:03','e0d9ca09-77b4-45ee-aab3-ded1c27888a0'),(276,19,96,60,0,3,'2023-08-18 12:47:03','2023-08-18 12:47:03','204d8566-8f8e-4e2b-a1f3-54ae6fa07175'),(286,20,100,64,1,0,'2023-08-18 12:47:03','2023-08-18 12:47:03','3970d71c-ea5b-4289-9a22-fd53a761d647'),(287,20,100,63,0,1,'2023-08-18 12:47:03','2023-08-18 12:47:03','d0d373e5-d128-4b4f-b0fb-2c847682a007'),(288,20,100,62,1,2,'2023-08-18 12:47:03','2023-08-18 12:47:03','e9415718-beac-400f-8630-069ad3edc481'),(295,21,104,65,1,0,'2023-08-18 12:47:03','2023-08-18 12:47:03','c81c6701-044d-4595-bafc-bcddc5706c25'),(296,21,104,66,1,1,'2023-08-18 12:47:03','2023-08-18 12:47:03','e7acd06d-beba-44e0-9f7b-7713ddf0eeba');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Asset','2023-08-18 12:47:01','2023-08-18 12:47:01','2023-09-11 13:18:12','ca343baa-5519-4ca8-96e6-fdf952332918'),(2,'craft\\elements\\Entry','2023-08-18 12:47:01','2023-08-18 12:47:01','2023-09-11 13:16:45','8cd648aa-e4d6-4f8a-a59f-a197f4c0ca12'),(3,'craft\\elements\\Entry','2023-08-18 12:47:01','2023-08-18 12:47:01','2023-08-18 12:50:10','4462e812-8853-4a6d-ab30-04fc23a42a29'),(4,'craft\\elements\\Entry','2023-08-18 12:47:01','2023-08-18 12:47:01','2023-09-11 13:16:52','aa38bff7-6ec7-44ee-b18d-091feb9312ed'),(5,'craft\\elements\\Entry','2023-08-18 12:47:01','2023-08-18 12:47:01','2023-08-18 12:49:38','a60bb5a8-e4e1-42ed-8264-f3670e28c036'),(6,'craft\\elements\\Entry','2023-08-18 12:47:01','2023-08-18 12:47:01','2023-09-11 13:16:49','dc507b33-5479-436f-b484-4ad0811d8b73'),(7,'craft\\elements\\Entry','2023-08-18 12:47:01','2023-08-18 12:47:01','2023-09-11 13:16:54','dc53b3c7-4da1-4fee-809e-e523183d51ff'),(8,'craft\\elements\\Entry','2023-08-18 12:47:01','2023-08-18 12:47:01','2023-08-18 12:50:07','7520ddd1-8b5f-4188-bf78-ee60e8b70ec6'),(9,'craft\\elements\\Entry','2023-08-18 12:47:01','2023-08-18 12:47:01','2023-08-18 12:50:15','d24ea2b8-4a5d-4e90-9380-bd8d9fb608a9'),(10,'craft\\elements\\Entry','2023-08-18 12:47:01','2023-08-18 12:47:01','2023-08-18 12:49:42','6e8aa724-e599-4f1a-a177-345f1f402d16'),(11,'craft\\elements\\Entry','2023-08-18 12:47:01','2023-08-18 12:47:01','2023-08-18 12:49:53','2aa2224b-7651-4857-8ba5-d5bcfd786231'),(12,'craft\\elements\\Entry','2023-08-18 12:47:01','2023-08-18 12:47:01','2023-08-18 12:50:04','3512a878-0027-4be9-8e46-0e748e94c1f8'),(13,'craft\\elements\\MatrixBlock','2023-08-18 12:47:01','2023-08-18 12:47:01','2023-08-18 12:53:32','b111685d-8bc3-4902-a108-8506645bb1b0'),(14,'craft\\elements\\MatrixBlock','2023-08-18 12:47:01','2023-08-18 12:47:01','2023-08-18 12:53:31','bcb7dc73-5349-4d1d-b1da-4ab4a2bd9cbc'),(15,'craft\\elements\\MatrixBlock','2023-08-18 12:47:01','2023-08-18 12:47:01','2023-08-18 12:53:31','451f84d0-3114-4310-8e6e-68711bee57b6'),(16,'craft\\elements\\MatrixBlock','2023-08-18 12:47:01','2023-08-18 12:47:01','2023-08-18 12:53:32','8e156648-573b-41ac-b013-49716ff3b9c4'),(17,'craft\\elements\\MatrixBlock','2023-08-18 12:47:01','2023-08-18 12:47:01','2023-08-18 12:53:32','f8698e57-9952-4f58-a325-b9f496f5afbf'),(18,'craft\\elements\\MatrixBlock','2023-08-18 12:47:01','2023-08-18 12:47:01','2023-08-18 12:53:31','c624d1db-10a0-41e2-97a3-6344095f5036'),(19,'verbb\\supertable\\elements\\SuperTableBlockElement','2023-08-18 12:47:02','2023-08-18 12:47:02',NULL,'c9d9a027-e844-46e6-84ef-ffd7c014e236'),(20,'verbb\\supertable\\elements\\SuperTableBlockElement','2023-08-18 12:47:02','2023-08-18 12:47:02',NULL,'3087b671-a5de-43b4-a38f-6fe21fb37ad2'),(21,'verbb\\supertable\\elements\\SuperTableBlockElement','2023-08-18 12:47:02','2023-08-18 12:47:02',NULL,'f313bbf3-30ac-4b4f-8115-a75c3f15da7a'),(22,'craft\\elements\\Entry','2023-08-18 13:34:38','2023-08-18 13:34:38',NULL,'800c885d-c47c-4619-9683-d19a76c71667');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouttabs` VALUES (54,1,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"5c5bccad-d784-4161-917f-3b47e9233924\",\"userCondition\":null,\"elementCondition\":null}]',1,'2023-08-18 12:47:02','2023-08-18 12:47:02','7b2d33db-b81b-4f5b-ac55-af3deca6c03b'),(56,2,'Inhalt','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"92dc2f79-43d7-415c-bbe1-7fd8adb1e8a1\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"10f1096f-75e4-4d25-8ea4-53fb8073d7f8\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"c5ea539a-4872-4ae5-8400-61970b907187\"}]',1,'2023-08-18 12:47:02','2023-08-18 12:47:02','ecc27b28-dd5f-4498-8c25-b39ef910d2b9'),(58,3,'Inhalt','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"d9c00d6d-a9b5-4aad-b22c-38bfeaee2ef5\",\"userCondition\":null,\"elementCondition\":null}]',1,'2023-08-18 12:47:02','2023-08-18 12:47:02','a525adcb-506c-4832-b614-976ea45faec1'),(60,4,'Inhalt','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"ecf32b2c-fdcb-41d5-95bf-ff14475f2e48\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"5fd7174d-390f-44e0-8f2f-f59e37909e2a\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"c5ea539a-4872-4ae5-8400-61970b907187\"}]',1,'2023-08-18 12:47:02','2023-08-18 12:47:02','59728f92-ac68-4a5d-bdca-0a95042012bb'),(62,5,'Inhalt','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"0b48bbec-4e52-4928-8dc5-130c0f5fa997\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"cc7bb665-539d-40d6-9bd7-21cb6574d6a1\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"c5ea539a-4872-4ae5-8400-61970b907187\"}]',1,'2023-08-18 12:47:02','2023-08-18 12:47:02','e2a852ed-b0f0-4f16-9c1e-15aa9383d9b9'),(72,8,'Inhalt','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"5da0ea80-b81e-414b-b287-7d4cb03906c2\",\"userCondition\":null,\"elementCondition\":null}]',1,'2023-08-18 12:47:02','2023-08-18 12:47:02','22b8ddce-3956-40b8-be58-926f364c094d'),(74,9,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"89bed2ef-de63-4885-bd68-d2a2d7673714\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"66735cb0-2bc9-4483-bba2-b0c902526ee7\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"ce4742a4-b145-446a-908b-0c85c69d02b5\"}]',1,'2023-08-18 12:47:02','2023-08-18 12:47:02','6a645fc9-8cbe-432f-a130-ac8a2ff12a92'),(76,10,'Inhalt','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"f7d891a6-90a7-4042-a0d1-1c808321fb30\",\"userCondition\":null,\"elementCondition\":null}]',1,'2023-08-18 12:47:02','2023-08-18 12:47:02','edf62126-de72-4c2b-897b-4aeb5d3c68d2'),(78,11,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"c04952f6-7d9b-4271-a2b4-bfccffd82398\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":\"Text, wenn Merkliste leer\",\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"4b2d2077-fc95-4ed4-a963-8677b9db2732\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"c5ea539a-4872-4ae5-8400-61970b907187\"}]',1,'2023-08-18 12:47:02','2023-08-18 12:47:02','7e98cedd-bc17-413d-a0de-a5dd25ff324e'),(80,12,'Inhalt','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"3f19e7bf-6611-44fa-810a-cadb80bf2033\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"668a8dd4-8a7a-4c95-a3c9-1e35b4ac00be\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"50ac9876-f1cf-4528-bde5-2825451162ce\"}]',1,'2023-08-18 12:47:02','2023-08-18 12:47:02','78a8d6b1-40d0-465a-b9ed-5c53dc000aa8'),(82,14,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":50,\"uid\":\"c05e1010-33a4-469e-a7db-b9a0d7f5e9a8\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"f11f58df-29cf-49f0-9ed0-081ae8ba69d7\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":50,\"uid\":\"0cb7360a-9e27-49a3-871e-9c94629d52b9\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"a0463938-2b09-438d-b1f9-b3a248f76bd2\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":25,\"uid\":\"0317cb64-63e0-4814-b7b9-cdfee49d8635\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"1668b158-e45b-46a2-ac31-55a0dcdc0442\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":25,\"uid\":\"01fc91ad-d569-4bb1-9750-5e034652e33a\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"372f3327-0667-4241-b888-72489ae01c1f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":25,\"uid\":\"6a4d96ea-2df1-4df3-9ac0-0f18df57b3af\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"b5a422a4-b55f-4d9e-99dc-aed3bf2f8891\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"8eeba3fb-0203-441b-9165-be9a9646a265\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"832e06b7-23a1-43f1-9195-d9799aeeb7a2\"}]',1,'2023-08-18 12:47:03','2023-08-18 12:47:03','f9e2dc02-aa9c-4e56-a878-86d69833281f'),(84,16,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":50,\"uid\":\"c51f0b15-7264-42f8-90e6-5a4fbb81c9f7\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"5e8c7a9b-5e0e-4f5c-9355-edb1c579962a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":50,\"uid\":\"66b3d179-a50e-46a0-9171-b1b4e34c85ed\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"2ef8e86a-fbe1-442d-8150-9b12d2bd5fb2\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":25,\"uid\":\"1878892e-3dd5-4f98-839d-948f01a87d44\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"cc8e9ed7-637d-4c64-ade4-95810b3f3506\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":25,\"uid\":\"266825be-89b9-437a-be1c-36a17bd4ca58\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"c710574a-c476-40b3-b12a-1a4c8798d82a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"f4766b67-b9f7-469b-9d29-017597e00c3d\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"1a88cee2-a78c-4f53-82d7-7c6e053d737f\"}]',1,'2023-08-18 12:47:03','2023-08-18 12:47:03','8028e47b-45ce-473f-b02b-7778147a02aa'),(86,17,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":50,\"uid\":\"0f3b4a18-0251-470b-ba57-f3d9310c1d6d\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"9f97f379-05d1-4e3f-918d-84ae8a6ae2b4\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":50,\"uid\":\"8aa54def-18cd-4a14-bfba-d560c76b1657\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"16b8830a-1f15-420d-9b20-7c11b8ec7cd2\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":25,\"uid\":\"ced35181-e846-44af-86ba-34609ef125ac\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"08138f73-04b3-4e38-8fa4-90d59cde9756\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":25,\"uid\":\"e32b9929-217f-498e-b303-a0a796d6b533\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"33c9ec15-996b-4e0e-b17f-cfebb1cc5154\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"862735bd-07d2-4da2-b8de-9c07dae735d9\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"ce0863d3-a4a9-4752-834b-133fb279efc0\"}]',1,'2023-08-18 12:47:03','2023-08-18 12:47:03','24053706-2076-476b-be4e-265bdb31e13f'),(88,13,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":50,\"uid\":\"26db7535-9724-4ccc-83af-346af1cc5ab5\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"6731c65d-b5ce-4d92-ad17-30477b60fe63\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":50,\"uid\":\"9061ec44-e71e-4e2c-a999-6391f0c237b3\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"0b1444d2-097c-4d84-9d72-8d2d7b4a78d5\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"f4ed1587-1ec8-4826-84c1-77e970e24947\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"efe98e39-e1cb-435c-98b8-cdf649246b5b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"5668e2d4-5136-484f-a851-01fb372a6497\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"052c2ca0-c8b1-4e66-ad30-f395dfc8b18d\"}]',1,'2023-08-18 12:47:03','2023-08-18 12:47:03','3e9e7e29-20a3-4ca1-aaa4-bfa64ab05dc1'),(90,15,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"1dd1d97d-9fd4-453b-91e9-af70d4d828c5\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"536ad9d9-6bf9-4746-b4ca-a39315a51f69\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":50,\"uid\":\"9f124b2c-f081-47e9-8a6f-102c6ddd13c8\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"700d764c-ae4b-44b5-8d20-d0ca1cefc16d\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"fa51ed1a-83c4-4149-934f-ebb0be86af4b\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"e888f8a2-e5eb-44cf-838d-58a90ac822c8\"}]',1,'2023-08-18 12:47:03','2023-08-18 12:47:03','1d4073da-9b59-4b13-9bb6-a390e2c1a7d4'),(92,18,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":50,\"uid\":\"ebb3cfe8-2281-47b3-af39-f259aa043da6\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"6cd09249-30fc-491b-8a9c-c9b3c6d92ff9\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":50,\"uid\":\"bf6f09f8-4027-4569-b3d9-5a6a4115ae12\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"024ac71e-cff1-4128-bcab-a2a6158ea14a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":25,\"uid\":\"18dcd0ac-31f7-4983-a1f9-a7119c7b45dd\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"b277b49c-f7f4-4907-bf57-f03d9d50fedb\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":25,\"uid\":\"46d31728-2565-4b8e-952c-b8850024f07b\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"719444e1-abae-4379-a974-4ced1dec29be\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"ae0508d8-fd80-4224-a4ec-fd21042152bf\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"75495664-81c9-48dd-b3eb-0f1f2c24fa80\"}]',1,'2023-08-18 12:47:03','2023-08-18 12:47:03','5de3b16b-d127-4f01-8c31-51a0367a25e7'),(96,19,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"1df3c47a-a865-4fa7-ab29-a8ee7f2eef3c\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"5b54e8f6-48f6-47a6-812e-7799a1e2f264\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"be111342-f779-4c51-af3b-d0349528b35b\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"1e3282cf-612c-4d04-b4f6-02ec0ef60e78\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"f22cb133-474d-49ec-b255-33e6d923aa4b\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"d6d68433-69a8-40e3-b902-a9aa2a507b07\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"b0afb400-f0ff-4d8f-b84b-4702b836a44f\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"ce845487-a637-4e39-a2cf-8e7fbdb0b3e2\"}]',1,'2023-08-18 12:47:03','2023-08-18 12:47:03','a2dac253-b10e-4412-b435-46c9e53b46ea'),(100,20,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"2eb41a36-b837-42d3-895c-5038451afe12\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"af5cc8b1-f85a-44ce-a1f4-3bd099bc24a9\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"32e1fb2c-d6d4-4fd5-81a4-d371a64acb87\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"483487fa-d1d2-435a-ad87-6373f9723729\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"07311030-f6fe-4c37-ac4d-3dcc4566087c\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"5f4c36bb-f3d9-4374-a12d-45bccbebd07a\"}]',1,'2023-08-18 12:47:03','2023-08-18 12:47:03','e808b865-18b4-41b7-bd73-5c22309f5eb8'),(104,21,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"32c6b55f-2013-4540-8951-719bf4321700\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"771224a8-9764-4322-a824-3e250b74523d\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"ffbb6456-48e7-4df6-bb80-c206759d617a\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"e76da8b3-d497-4640-b67d-6cb54882b8b4\"}]',1,'2023-08-18 12:47:03','2023-08-18 12:47:03','f5e873ff-e7e7-4f97-bc91-6d5b69e0a6e5'),(107,6,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"16aa8946-f2d1-4850-a767-d3063da7e0b4\",\"userCondition\":null,\"elementCondition\":null}]',1,'2023-08-18 12:53:53','2023-08-18 12:53:53','a7dc373f-041f-4799-bbde-e8f7af3f1ec0'),(109,7,'Inhalt','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":50,\"uid\":\"3e20e2a8-63fa-4538-9ec9-e639a9b4fc08\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":50,\"uid\":\"fa0709f3-0453-40c3-a396-c133b6d73d61\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"420bfb62-f964-4cf3-a091-874f083d8f75\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":50,\"uid\":\"078c6485-5fc7-4621-b2a3-c7198de2227b\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"f9663ac0-2aad-46ab-b35f-f3326adaa6f8\"}]',1,'2023-08-18 12:58:44','2023-08-18 12:58:44','5aa9975f-c4ec-498e-9b63-5e1a36ff082e'),(120,22,'Inhalt','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"9f5a31a4-ffa1-4cca-b1aa-b4ba3e27e6c9\",\"userCondition\":null,\"elementCondition\":null}]',1,'2023-09-12 07:30:57','2023-09-12 07:30:57','5928d877-dad7-455f-b0bf-42635fcc0a2c');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (58,NULL,'Headline','headline','superTableBlockType:9bc49b93-2f26-43c8-8b2b-b131c6e0f76b',NULL,NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-08-18 12:47:02','2023-08-18 12:47:02','1e3282cf-612c-4d04-b4f6-02ec0ef60e78'),(59,NULL,'Image','image','superTableBlockType:9bc49b93-2f26-43c8-8b2b-b131c6e0f76b',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:8ce61d6f-c2a3-4076-bb14-40b900c685cf\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:8ce61d6f-c2a3-4076-bb14-40b900c685cf\",\"restrictedLocationSubpath\":null,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Asset\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"},\"selectionLabel\":null,\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2023-08-18 12:47:02','2023-08-18 12:47:02','5b54e8f6-48f6-47a6-812e-7799a1e2f264'),(60,NULL,'Button','button','superTableBlockType:9bc49b93-2f26-43c8-8b2b-b131c6e0f76b',NULL,NULL,0,'none',NULL,'lenz\\linkfield\\fields\\LinkField','{\"allowCustomText\":true,\"allowTarget\":true,\"autoNoReferrer\":true,\"customTextMaxLength\":0,\"customTextRequired\":false,\"defaultLinkName\":\"entry\",\"defaultText\":\"\",\"enableAllLinkTypes\":false,\"enableAriaLabel\":false,\"enableElementCache\":false,\"enableTitle\":false,\"typeSettings\":{\"asset\":{\"allowCrossSiteLink\":false,\"allowCustomQuery\":false,\"enabled\":true,\"sources\":\"*\"},\"category\":{\"allowCrossSiteLink\":false,\"allowCustomQuery\":false,\"enabled\":false,\"sources\":\"*\"},\"custom\":{\"allowAliases\":false,\"disableValidation\":false,\"enabled\":false},\"email\":{\"allowAliases\":false,\"disableValidation\":false,\"enabled\":true},\"entry\":{\"allowCrossSiteLink\":false,\"allowCustomQuery\":false,\"enabled\":true,\"sources\":\"*\"},\"site\":{\"enabled\":false,\"sites\":\"*\"},\"tel\":{\"allowAliases\":false,\"disableValidation\":false,\"enabled\":true},\"url\":{\"allowAliases\":false,\"disableValidation\":false,\"enabled\":true},\"user\":{\"allowCrossSiteLink\":false,\"allowCustomQuery\":false,\"enabled\":false,\"sources\":\"*\"}}}','2023-08-18 12:47:02','2023-08-18 12:47:02','ce845487-a637-4e39-a2cf-8e7fbdb0b3e2'),(61,NULL,'Text','text','superTableBlockType:9bc49b93-2f26-43c8-8b2b-b131c6e0f76b',NULL,NULL,0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"\",\"availableVolumes\":\"\",\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":null,\"purifyHtml\":true,\"redactorConfig\":\"Simple.json\",\"removeEmptyTags\":false,\"removeInlineStyles\":false,\"removeNbsp\":false,\"showHtmlButtonForNonAdmins\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2023-08-18 12:47:02','2023-08-18 12:47:02','d6d68433-69a8-40e3-b902-a9aa2a507b07'),(62,NULL,'File','file','superTableBlockType:7f025247-4b6d-4d41-9e38-a84b03b86a9e',NULL,NULL,0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"audio\",\"compressed\",\"image\",\"json\",\"pdf\"],\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:8ce61d6f-c2a3-4076-bb14-40b900c685cf\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"full\",\"restrictFiles\":true,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:8ce61d6f-c2a3-4076-bb14-40b900c685cf\",\"restrictedLocationSubpath\":null,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Asset\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"},\"selectionLabel\":null,\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:8ce61d6f-c2a3-4076-bb14-40b900c685cf\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2023-08-18 12:47:02','2023-08-18 12:47:02','5f4c36bb-f3d9-4374-a12d-45bccbebd07a'),(63,NULL,'Subline','subline','superTableBlockType:7f025247-4b6d-4d41-9e38-a84b03b86a9e','ycwyqdyl',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-08-18 12:47:02','2023-08-18 12:47:02','483487fa-d1d2-435a-ad87-6373f9723729'),(64,NULL,'Headline','headline','superTableBlockType:7f025247-4b6d-4d41-9e38-a84b03b86a9e','digfgtnk',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-08-18 12:47:02','2023-08-18 12:47:02','af5cc8b1-f85a-44ce-a1f4-3bd099bc24a9'),(65,NULL,'Headline','headline','superTableBlockType:23d68cad-fe52-4009-b811-2ade64816c1c','ulhmxhwm',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-08-18 12:47:02','2023-08-18 12:47:02','771224a8-9764-4322-a824-3e250b74523d'),(66,NULL,'Content','text','superTableBlockType:23d68cad-fe52-4009-b811-2ade64816c1c','qwtjrjmx',NULL,0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":[\"602d6897-7455-4f99-98e9-52c99f35132c\"],\"availableVolumes\":[\"8ce61d6f-c2a3-4076-bb14-40b900c685cf\"],\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"602d6897-7455-4f99-98e9-52c99f35132c\",\"manualConfig\":\"\",\"purifierConfig\":null,\"purifyHtml\":true,\"redactorConfig\":\"Advanced.json\",\"removeEmptyTags\":true,\"removeInlineStyles\":false,\"removeNbsp\":false,\"showHtmlButtonForNonAdmins\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2023-08-18 12:47:02','2023-08-18 12:47:02','e76da8b3-d497-4640-b67d-6cb54882b8b4');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gqlschemas` VALUES (1,'Public Schema','[\"sites.5a388334-4b50-4126-b1df-67227ce21818:read\"]',1,'2023-08-18 12:47:01','2023-09-12 12:04:05','76d94634-01f8-4535-b4bf-e2870ae8f25d');
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gqltokens` VALUES (1,'Public Token','__PUBLIC__',0,NULL,NULL,NULL,'2023-09-12 12:04:05','2023-09-12 12:04:05','dc943377-5193-4ec8-a388-e3eccd3306fc');
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'4.5.3','4.5.3.0',0,'hhwikkfdhwzr','3@fsugeaoqmz','2023-08-18 12:47:00','2023-09-12 12:05:32','d89db09c-3c3c-47db-bfed-ec5bed5f953b');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks_owners`
--

LOCK TABLES `matrixblocks_owners` WRITE;
/*!40000 ALTER TABLE `matrixblocks_owners` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (4,'plugin:sprig','Install','2023-08-18 12:47:00','2023-08-18 12:47:00','2023-08-18 12:47:00','28905124-b687-4dbf-b764-f7b10b92b69a'),(10,'craft','Install','2023-08-18 12:47:04','2023-08-18 12:47:04','2023-08-18 12:47:04','cd2dee96-08b2-4c8c-aa78-09539170fa93'),(11,'craft','m210121_145800_asset_indexing_changes','2023-08-18 12:47:04','2023-08-18 12:47:04','2023-08-18 12:47:04','c04297ca-e8b6-4407-beb6-0ab96f9f3bc9'),(12,'craft','m210624_222934_drop_deprecated_tables','2023-08-18 12:47:04','2023-08-18 12:47:04','2023-08-18 12:47:04','8fc9aac4-a401-40dd-b998-dbcd6e1467b7'),(13,'craft','m210724_180756_rename_source_cols','2023-08-18 12:47:04','2023-08-18 12:47:04','2023-08-18 12:47:04','5de5879d-de98-4dec-babc-f0110da5e5ed'),(14,'craft','m210809_124211_remove_superfluous_uids','2023-08-18 12:47:04','2023-08-18 12:47:04','2023-08-18 12:47:04','65c65f6f-286a-4b7f-b3a7-91b1164b96f7'),(15,'craft','m210817_014201_universal_users','2023-08-18 12:47:04','2023-08-18 12:47:04','2023-08-18 12:47:04','ccf61ae2-63ff-493d-a9dd-0a899e52d010'),(16,'craft','m210904_132612_store_element_source_settings_in_project_config','2023-08-18 12:47:04','2023-08-18 12:47:04','2023-08-18 12:47:04','0c9bd6ee-59d3-462f-8586-aa5fb88b53c7'),(17,'craft','m211115_135500_image_transformers','2023-08-18 12:47:04','2023-08-18 12:47:04','2023-08-18 12:47:04','8e83951d-5162-4a44-a9f0-eff199903f73'),(18,'craft','m211201_131000_filesystems','2023-08-18 12:47:04','2023-08-18 12:47:04','2023-08-18 12:47:04','90966c40-6582-4c54-a947-acd1984814b0'),(19,'craft','m220103_043103_tab_conditions','2023-08-18 12:47:04','2023-08-18 12:47:04','2023-08-18 12:47:04','8c6d9d11-350b-4463-aa4b-cabae4b0dbd9'),(20,'craft','m220104_003433_asset_alt_text','2023-08-18 12:47:04','2023-08-18 12:47:04','2023-08-18 12:47:04','9eaa30e3-2527-4b5a-b226-a1a70b3b4b8e'),(21,'craft','m220123_213619_update_permissions','2023-08-18 12:47:04','2023-08-18 12:47:04','2023-08-18 12:47:04','23dcf272-fb47-48eb-84d6-23dfc3dfe242'),(22,'craft','m220126_003432_addresses','2023-08-18 12:47:04','2023-08-18 12:47:04','2023-08-18 12:47:04','d84e9d62-44b3-4578-922d-e4596527ed8e'),(23,'craft','m220209_095604_add_indexes','2023-08-18 12:47:04','2023-08-18 12:47:04','2023-08-18 12:47:04','d276ea23-eee3-4dff-a04f-03229c8c4d30'),(24,'craft','m220213_015220_matrixblocks_owners_table','2023-08-18 12:47:04','2023-08-18 12:47:04','2023-08-18 12:47:04','7bc8d045-ce78-4031-818c-c03e701319c6'),(25,'craft','m220214_000000_truncate_sessions','2023-08-18 12:47:04','2023-08-18 12:47:04','2023-08-18 12:47:04','232afdd1-034b-40cb-b281-86f82b235871'),(26,'craft','m220222_122159_full_names','2023-08-18 12:47:04','2023-08-18 12:47:04','2023-08-18 12:47:04','dcfcbe8d-ccee-4c89-ab5a-e79adf822e28'),(27,'craft','m220223_180559_nullable_address_owner','2023-08-18 12:47:04','2023-08-18 12:47:04','2023-08-18 12:47:04','0d5cb4ec-54be-473d-b723-b7c090cf1947'),(28,'craft','m220225_165000_transform_filesystems','2023-08-18 12:47:04','2023-08-18 12:47:04','2023-08-18 12:47:04','8fac21c1-3f89-48a0-9821-6523542c021e'),(29,'craft','m220309_152006_rename_field_layout_elements','2023-08-18 12:47:04','2023-08-18 12:47:04','2023-08-18 12:47:04','7c67da0c-732c-4683-9f63-639505c0a8dc'),(30,'craft','m220314_211928_field_layout_element_uids','2023-08-18 12:47:04','2023-08-18 12:47:04','2023-08-18 12:47:04','c5324f3d-cbfd-4c84-87e5-0eff9473d677'),(31,'craft','m220316_123800_transform_fs_subpath','2023-08-18 12:47:04','2023-08-18 12:47:04','2023-08-18 12:47:04','93a9d9be-54b8-43a8-b039-9c6fc4c7b70c'),(32,'craft','m220317_174250_release_all_jobs','2023-08-18 12:47:04','2023-08-18 12:47:04','2023-08-18 12:47:04','a5ede287-1caf-4ff6-81ab-08a4a8a92686'),(33,'craft','m220330_150000_add_site_gql_schema_components','2023-08-18 12:47:04','2023-08-18 12:47:04','2023-08-18 12:47:04','a459f04c-c83e-4774-9f5a-69cac7eb8f01'),(34,'craft','m220413_024536_site_enabled_string','2023-08-18 12:47:04','2023-08-18 12:47:04','2023-08-18 12:47:04','77f19840-56d1-4175-8040-4a170e0cb3d3'),(35,'craft','m221027_160703_add_image_transform_fill','2023-08-18 12:47:04','2023-08-18 12:47:04','2023-08-18 12:47:04','710a2a4e-566a-40e7-bfd6-f5c09eaed8cb'),(36,'craft','m221028_130548_add_canonical_id_index','2023-08-18 12:47:04','2023-08-18 12:47:04','2023-08-18 12:47:04','e633ff04-3592-4691-954d-deddfe3a2e8e'),(37,'craft','m221118_003031_drop_element_fks','2023-08-18 12:47:04','2023-08-18 12:47:04','2023-08-18 12:47:04','007dfdb0-e34c-4bcd-b7bf-b500e086e29b'),(38,'craft','m230131_120713_asset_indexing_session_new_options','2023-08-18 12:47:04','2023-08-18 12:47:04','2023-08-18 12:47:04','bd90bc24-1ca3-4cce-b8a4-a9902dd5fca3'),(39,'craft','m230226_013114_drop_plugin_license_columns','2023-08-18 12:47:04','2023-08-18 12:47:04','2023-08-18 12:47:04','90b957fc-ab56-4a2f-a1eb-75d789df2f08'),(40,'craft','m230531_123004_add_entry_type_show_status_field','2023-09-05 10:41:40','2023-09-05 10:41:40','2023-09-05 10:41:40','f0580383-317b-43ba-ac34-a19716c09c4e'),(41,'craft','m230607_102049_add_entrytype_slug_translation_columns','2023-09-05 10:41:40','2023-09-05 10:41:40','2023-09-05 10:41:40','92c7d651-5826-4dff-b6b8-1cd69a93b682'),(42,'craft','m230710_162700_element_activity','2023-09-05 10:41:40','2023-09-05 10:41:40','2023-09-05 10:41:40','c1d3c406-e782-4415-8c76-c2665e0a900d'),(43,'craft','m230820_162023_fix_cache_id_type','2023-09-05 10:41:40','2023-09-05 10:41:40','2023-09-05 10:41:40','4f6966a5-1e2e-46c0-8eaf-92183f99721f'),(44,'craft','m230826_094050_fix_session_id_type','2023-09-05 10:41:40','2023-09-05 10:41:40','2023-09-05 10:41:40','39a4141a-335f-4bcc-bf57-0f0bfa3b1d2f');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (2,'dumper','3.0.1','1.0.0','2023-08-18 12:47:00','2023-08-18 12:47:00','2023-08-18 12:47:00','87e22d4b-4b1d-4a03-bff1-511254991c6f'),(11,'sprig','2.6.2','1.0.1','2023-08-18 12:47:00','2023-08-18 12:47:00','2023-08-18 12:47:00','0e925263-8f84-42f5-8ae8-3fd4a18f43bb');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('dateModified','1694520332'),('elementSources.craft\\elements\\Entry.0.defaultSort.0','\"postDate\"'),('elementSources.craft\\elements\\Entry.0.defaultSort.1','\"desc\"'),('elementSources.craft\\elements\\Entry.0.disabled','false'),('elementSources.craft\\elements\\Entry.0.key','\"*\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.0','\"link\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.1','\"section\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.2','\"type\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.3','\"postDate\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.4','\"author\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.5','\"dateUpdated\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.6','\"revisionCreator\"'),('elementSources.craft\\elements\\Entry.0.type','\"native\"'),('elementSources.craft\\elements\\Entry.1.defaultSort.0','\"title\"'),('elementSources.craft\\elements\\Entry.1.defaultSort.1','\"asc\"'),('elementSources.craft\\elements\\Entry.1.disabled','false'),('elementSources.craft\\elements\\Entry.1.key','\"singles\"'),('elementSources.craft\\elements\\Entry.1.tableAttributes.0','\"link\"'),('elementSources.craft\\elements\\Entry.1.tableAttributes.1','\"dateUpdated\"'),('elementSources.craft\\elements\\Entry.1.tableAttributes.2','\"revisionCreator\"'),('elementSources.craft\\elements\\Entry.1.type','\"native\"'),('elementSources.craft\\elements\\Entry.2.defaultSort.0','\"postDate\"'),('elementSources.craft\\elements\\Entry.2.defaultSort.1','\"desc\"'),('elementSources.craft\\elements\\Entry.2.disabled','false'),('elementSources.craft\\elements\\Entry.2.key','\"section:9e78a6d6-4c8a-4a13-ace9-37db731411ed\"'),('elementSources.craft\\elements\\Entry.2.tableAttributes.0','\"author\"'),('elementSources.craft\\elements\\Entry.2.tableAttributes.1','\"link\"'),('elementSources.craft\\elements\\Entry.2.tableAttributes.2','\"dateUpdated\"'),('elementSources.craft\\elements\\Entry.2.tableAttributes.3','\"revisionCreator\"'),('elementSources.craft\\elements\\Entry.2.type','\"native\"'),('elementSources.craft\\elements\\Entry.3.defaultSort.0','\"postDate\"'),('elementSources.craft\\elements\\Entry.3.defaultSort.1','\"desc\"'),('elementSources.craft\\elements\\Entry.3.disabled','false'),('elementSources.craft\\elements\\Entry.3.key','\"section:605954e5-35e4-4427-8ea0-b9d8b64a723e\"'),('elementSources.craft\\elements\\Entry.3.tableAttributes.0','\"postDate\"'),('elementSources.craft\\elements\\Entry.3.tableAttributes.1','\"expiryDate\"'),('elementSources.craft\\elements\\Entry.3.tableAttributes.2','\"author\"'),('elementSources.craft\\elements\\Entry.3.tableAttributes.3','\"link\"'),('elementSources.craft\\elements\\Entry.3.type','\"native\"'),('email.fromEmail','\"$SYSTEM_MAIL\"'),('email.fromName','\"$SITE_NAME\"'),('email.replyToEmail','\"$REPLY_MAIL\"'),('email.template','\"\"'),('email.transportSettings.apiKey','\"$MAILGUN_API_KEY\"'),('email.transportSettings.domain','\"$MAILGUN_DOMAIN\"'),('email.transportSettings.endpoint','\"$MAILGUN_ENDPOINT\"'),('email.transportType','\"craft\\\\mailgun\\\\MailgunAdapter\"'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.fieldLayouts.800c885d-c47c-4619-9683-d19a76c71667.tabs.0.elementCondition','null'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.fieldLayouts.800c885d-c47c-4619-9683-d19a76c71667.tabs.0.elements.0.autocapitalize','true'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.fieldLayouts.800c885d-c47c-4619-9683-d19a76c71667.tabs.0.elements.0.autocomplete','false'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.fieldLayouts.800c885d-c47c-4619-9683-d19a76c71667.tabs.0.elements.0.autocorrect','true'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.fieldLayouts.800c885d-c47c-4619-9683-d19a76c71667.tabs.0.elements.0.class','null'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.fieldLayouts.800c885d-c47c-4619-9683-d19a76c71667.tabs.0.elements.0.disabled','false'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.fieldLayouts.800c885d-c47c-4619-9683-d19a76c71667.tabs.0.elements.0.elementCondition','null'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.fieldLayouts.800c885d-c47c-4619-9683-d19a76c71667.tabs.0.elements.0.id','null'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.fieldLayouts.800c885d-c47c-4619-9683-d19a76c71667.tabs.0.elements.0.instructions','null'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.fieldLayouts.800c885d-c47c-4619-9683-d19a76c71667.tabs.0.elements.0.label','null'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.fieldLayouts.800c885d-c47c-4619-9683-d19a76c71667.tabs.0.elements.0.max','null'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.fieldLayouts.800c885d-c47c-4619-9683-d19a76c71667.tabs.0.elements.0.min','null'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.fieldLayouts.800c885d-c47c-4619-9683-d19a76c71667.tabs.0.elements.0.name','null'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.fieldLayouts.800c885d-c47c-4619-9683-d19a76c71667.tabs.0.elements.0.orientation','null'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.fieldLayouts.800c885d-c47c-4619-9683-d19a76c71667.tabs.0.elements.0.placeholder','null'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.fieldLayouts.800c885d-c47c-4619-9683-d19a76c71667.tabs.0.elements.0.readonly','false'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.fieldLayouts.800c885d-c47c-4619-9683-d19a76c71667.tabs.0.elements.0.requirable','false'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.fieldLayouts.800c885d-c47c-4619-9683-d19a76c71667.tabs.0.elements.0.size','null'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.fieldLayouts.800c885d-c47c-4619-9683-d19a76c71667.tabs.0.elements.0.step','null'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.fieldLayouts.800c885d-c47c-4619-9683-d19a76c71667.tabs.0.elements.0.tip','null'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.fieldLayouts.800c885d-c47c-4619-9683-d19a76c71667.tabs.0.elements.0.title','null'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.fieldLayouts.800c885d-c47c-4619-9683-d19a76c71667.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.fieldLayouts.800c885d-c47c-4619-9683-d19a76c71667.tabs.0.elements.0.uid','\"9f5a31a4-ffa1-4cca-b1aa-b4ba3e27e6c9\"'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.fieldLayouts.800c885d-c47c-4619-9683-d19a76c71667.tabs.0.elements.0.userCondition','null'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.fieldLayouts.800c885d-c47c-4619-9683-d19a76c71667.tabs.0.elements.0.warning','null'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.fieldLayouts.800c885d-c47c-4619-9683-d19a76c71667.tabs.0.elements.0.width','100'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.fieldLayouts.800c885d-c47c-4619-9683-d19a76c71667.tabs.0.name','\"Inhalt\"'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.fieldLayouts.800c885d-c47c-4619-9683-d19a76c71667.tabs.0.uid','\"5928d877-dad7-455f-b0bf-42635fcc0a2c\"'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.fieldLayouts.800c885d-c47c-4619-9683-d19a76c71667.tabs.0.userCondition','null'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.handle','\"item\"'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.hasTitleField','true'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.name','\"Item\"'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.section','\"605954e5-35e4-4427-8ea0-b9d8b64a723e\"'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.showStatusField','true'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.slugTranslationKeyFormat','null'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.slugTranslationMethod','\"site\"'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.sortOrder','1'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.titleFormat','null'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.titleTranslationKeyFormat','null'),('entryTypes.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765.titleTranslationMethod','\"site\"'),('fieldGroups.84aef975-f98d-44f6-8450-a081ab798069.name','\"Common\"'),('graphql.publicToken.enabled','false'),('graphql.publicToken.expiryDate','null'),('graphql.schemas.76d94634-01f8-4535-b4bf-e2870ae8f25d.isPublic','true'),('graphql.schemas.76d94634-01f8-4535-b4bf-e2870ae8f25d.name','\"Public Schema\"'),('graphql.schemas.76d94634-01f8-4535-b4bf-e2870ae8f25d.scope.0','\"sites.5a388334-4b50-4126-b1df-67227ce21818:read\"'),('meta.__names__.1e3282cf-612c-4d04-b4f6-02ec0ef60e78','\"Headline\"'),('meta.__names__.2648ca0e-d79c-46fd-bbfd-cfa0a2bcb765','\"Item\"'),('meta.__names__.4706b3bf-052e-4604-bbf9-0095d00f790a','\"Default\"'),('meta.__names__.483487fa-d1d2-435a-ad87-6373f9723729','\"Subline\"'),('meta.__names__.5a388334-4b50-4126-b1df-67227ce21818','\"$SITE_NAME\"'),('meta.__names__.5b54e8f6-48f6-47a6-812e-7799a1e2f264','\"Image\"'),('meta.__names__.5f4c36bb-f3d9-4374-a12d-45bccbebd07a','\"File\"'),('meta.__names__.605954e5-35e4-4427-8ea0-b9d8b64a723e','\"Items\"'),('meta.__names__.76d94634-01f8-4535-b4bf-e2870ae8f25d','\"Public Schema\"'),('meta.__names__.771224a8-9764-4322-a824-3e250b74523d','\"Headline\"'),('meta.__names__.84aef975-f98d-44f6-8450-a081ab798069','\"Common\"'),('meta.__names__.af5cc8b1-f85a-44ce-a1f4-3bd099bc24a9','\"Headline\"'),('meta.__names__.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2','\"Button\"'),('meta.__names__.d6d68433-69a8-40e3-b902-a9aa2a507b07','\"Text\"'),('meta.__names__.e76da8b3-d497-4640-b67d-6cb54882b8b4','\"Content\"'),('plugins.dumper.edition','\"standard\"'),('plugins.dumper.enabled','true'),('plugins.dumper.schemaVersion','\"1.0.0\"'),('plugins.sprig.edition','\"standard\"'),('plugins.sprig.enabled','true'),('plugins.sprig.schemaVersion','\"1.0.1\"'),('sections.605954e5-35e4-4427-8ea0-b9d8b64a723e.defaultPlacement','\"end\"'),('sections.605954e5-35e4-4427-8ea0-b9d8b64a723e.enableVersioning','false'),('sections.605954e5-35e4-4427-8ea0-b9d8b64a723e.handle','\"items\"'),('sections.605954e5-35e4-4427-8ea0-b9d8b64a723e.name','\"Items\"'),('sections.605954e5-35e4-4427-8ea0-b9d8b64a723e.previewTargets.0.__assoc__.0.0','\"label\"'),('sections.605954e5-35e4-4427-8ea0-b9d8b64a723e.previewTargets.0.__assoc__.0.1','\"Primäre eintrag Seite\"'),('sections.605954e5-35e4-4427-8ea0-b9d8b64a723e.previewTargets.0.__assoc__.1.0','\"urlFormat\"'),('sections.605954e5-35e4-4427-8ea0-b9d8b64a723e.previewTargets.0.__assoc__.1.1','\"{url}\"'),('sections.605954e5-35e4-4427-8ea0-b9d8b64a723e.previewTargets.0.__assoc__.2.0','\"refresh\"'),('sections.605954e5-35e4-4427-8ea0-b9d8b64a723e.previewTargets.0.__assoc__.2.1','\"1\"'),('sections.605954e5-35e4-4427-8ea0-b9d8b64a723e.propagationMethod','\"all\"'),('sections.605954e5-35e4-4427-8ea0-b9d8b64a723e.siteSettings.5a388334-4b50-4126-b1df-67227ce21818.enabledByDefault','true'),('sections.605954e5-35e4-4427-8ea0-b9d8b64a723e.siteSettings.5a388334-4b50-4126-b1df-67227ce21818.hasUrls','false'),('sections.605954e5-35e4-4427-8ea0-b9d8b64a723e.siteSettings.5a388334-4b50-4126-b1df-67227ce21818.template','null'),('sections.605954e5-35e4-4427-8ea0-b9d8b64a723e.siteSettings.5a388334-4b50-4126-b1df-67227ce21818.uriFormat','null'),('sections.605954e5-35e4-4427-8ea0-b9d8b64a723e.type','\"channel\"'),('siteGroups.4706b3bf-052e-4604-bbf9-0095d00f790a.name','\"Default\"'),('sites.5a388334-4b50-4126-b1df-67227ce21818.baseUrl','\"$SITE_URL\"'),('sites.5a388334-4b50-4126-b1df-67227ce21818.enabled','true'),('sites.5a388334-4b50-4126-b1df-67227ce21818.handle','\"de\"'),('sites.5a388334-4b50-4126-b1df-67227ce21818.hasUrls','true'),('sites.5a388334-4b50-4126-b1df-67227ce21818.language','\"de\"'),('sites.5a388334-4b50-4126-b1df-67227ce21818.name','\"$SITE_NAME\"'),('sites.5a388334-4b50-4126-b1df-67227ce21818.primary','true'),('sites.5a388334-4b50-4126-b1df-67227ce21818.siteGroup','\"4706b3bf-052e-4604-bbf9-0095d00f790a\"'),('sites.5a388334-4b50-4126-b1df-67227ce21818.sortOrder','1'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.changedFieldIndicator','280950782'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.field','\"1a88cee2-a78c-4f53-82d7-7c6e053d737f\"'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fieldLayouts.f313bbf3-30ac-4b4f-8115-a75c3f15da7a.tabs.0.elementCondition','null'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fieldLayouts.f313bbf3-30ac-4b4f-8115-a75c3f15da7a.tabs.0.elements.0.elementCondition','null'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fieldLayouts.f313bbf3-30ac-4b4f-8115-a75c3f15da7a.tabs.0.elements.0.fieldUid','\"771224a8-9764-4322-a824-3e250b74523d\"'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fieldLayouts.f313bbf3-30ac-4b4f-8115-a75c3f15da7a.tabs.0.elements.0.instructions','null'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fieldLayouts.f313bbf3-30ac-4b4f-8115-a75c3f15da7a.tabs.0.elements.0.label','null'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fieldLayouts.f313bbf3-30ac-4b4f-8115-a75c3f15da7a.tabs.0.elements.0.required','true'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fieldLayouts.f313bbf3-30ac-4b4f-8115-a75c3f15da7a.tabs.0.elements.0.tip','null'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fieldLayouts.f313bbf3-30ac-4b4f-8115-a75c3f15da7a.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fieldLayouts.f313bbf3-30ac-4b4f-8115-a75c3f15da7a.tabs.0.elements.0.uid','\"32c6b55f-2013-4540-8951-719bf4321700\"'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fieldLayouts.f313bbf3-30ac-4b4f-8115-a75c3f15da7a.tabs.0.elements.0.userCondition','null'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fieldLayouts.f313bbf3-30ac-4b4f-8115-a75c3f15da7a.tabs.0.elements.0.warning','null'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fieldLayouts.f313bbf3-30ac-4b4f-8115-a75c3f15da7a.tabs.0.elements.0.width','100'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fieldLayouts.f313bbf3-30ac-4b4f-8115-a75c3f15da7a.tabs.0.elements.1.elementCondition','null'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fieldLayouts.f313bbf3-30ac-4b4f-8115-a75c3f15da7a.tabs.0.elements.1.fieldUid','\"e76da8b3-d497-4640-b67d-6cb54882b8b4\"'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fieldLayouts.f313bbf3-30ac-4b4f-8115-a75c3f15da7a.tabs.0.elements.1.instructions','null'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fieldLayouts.f313bbf3-30ac-4b4f-8115-a75c3f15da7a.tabs.0.elements.1.label','null'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fieldLayouts.f313bbf3-30ac-4b4f-8115-a75c3f15da7a.tabs.0.elements.1.required','true'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fieldLayouts.f313bbf3-30ac-4b4f-8115-a75c3f15da7a.tabs.0.elements.1.tip','null'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fieldLayouts.f313bbf3-30ac-4b4f-8115-a75c3f15da7a.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fieldLayouts.f313bbf3-30ac-4b4f-8115-a75c3f15da7a.tabs.0.elements.1.uid','\"ffbb6456-48e7-4df6-bb80-c206759d617a\"'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fieldLayouts.f313bbf3-30ac-4b4f-8115-a75c3f15da7a.tabs.0.elements.1.userCondition','null'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fieldLayouts.f313bbf3-30ac-4b4f-8115-a75c3f15da7a.tabs.0.elements.1.warning','null'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fieldLayouts.f313bbf3-30ac-4b4f-8115-a75c3f15da7a.tabs.0.elements.1.width','100'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fieldLayouts.f313bbf3-30ac-4b4f-8115-a75c3f15da7a.tabs.0.name','\"Content\"'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fieldLayouts.f313bbf3-30ac-4b4f-8115-a75c3f15da7a.tabs.0.uid','\"f5e873ff-e7e7-4f97-bc91-6d5b69e0a6e5\"'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fieldLayouts.f313bbf3-30ac-4b4f-8115-a75c3f15da7a.tabs.0.userCondition','null'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.771224a8-9764-4322-a824-3e250b74523d.columnSuffix','\"ulhmxhwm\"'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.771224a8-9764-4322-a824-3e250b74523d.contentColumnType','\"text\"'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.771224a8-9764-4322-a824-3e250b74523d.fieldGroup','null'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.771224a8-9764-4322-a824-3e250b74523d.handle','\"headline\"'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.771224a8-9764-4322-a824-3e250b74523d.instructions','null'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.771224a8-9764-4322-a824-3e250b74523d.name','\"Headline\"'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.771224a8-9764-4322-a824-3e250b74523d.searchable','false'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.771224a8-9764-4322-a824-3e250b74523d.settings.byteLimit','null'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.771224a8-9764-4322-a824-3e250b74523d.settings.charLimit','null'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.771224a8-9764-4322-a824-3e250b74523d.settings.code','false'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.771224a8-9764-4322-a824-3e250b74523d.settings.columnType','null'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.771224a8-9764-4322-a824-3e250b74523d.settings.initialRows','4'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.771224a8-9764-4322-a824-3e250b74523d.settings.multiline','false'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.771224a8-9764-4322-a824-3e250b74523d.settings.placeholder','null'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.771224a8-9764-4322-a824-3e250b74523d.settings.uiMode','\"normal\"'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.771224a8-9764-4322-a824-3e250b74523d.translationKeyFormat','null'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.771224a8-9764-4322-a824-3e250b74523d.translationMethod','\"none\"'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.771224a8-9764-4322-a824-3e250b74523d.type','\"craft\\\\fields\\\\PlainText\"'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.e76da8b3-d497-4640-b67d-6cb54882b8b4.columnSuffix','\"qwtjrjmx\"'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.e76da8b3-d497-4640-b67d-6cb54882b8b4.contentColumnType','\"text\"'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.e76da8b3-d497-4640-b67d-6cb54882b8b4.fieldGroup','null'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.e76da8b3-d497-4640-b67d-6cb54882b8b4.handle','\"text\"'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.e76da8b3-d497-4640-b67d-6cb54882b8b4.instructions','null'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.e76da8b3-d497-4640-b67d-6cb54882b8b4.name','\"Content\"'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.e76da8b3-d497-4640-b67d-6cb54882b8b4.searchable','false'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.e76da8b3-d497-4640-b67d-6cb54882b8b4.settings.availableTransforms.0','\"602d6897-7455-4f99-98e9-52c99f35132c\"'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.e76da8b3-d497-4640-b67d-6cb54882b8b4.settings.availableVolumes.0','\"8ce61d6f-c2a3-4076-bb14-40b900c685cf\"'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.e76da8b3-d497-4640-b67d-6cb54882b8b4.settings.columnType','\"text\"'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.e76da8b3-d497-4640-b67d-6cb54882b8b4.settings.configSelectionMode','\"choose\"'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.e76da8b3-d497-4640-b67d-6cb54882b8b4.settings.defaultTransform','\"602d6897-7455-4f99-98e9-52c99f35132c\"'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.e76da8b3-d497-4640-b67d-6cb54882b8b4.settings.manualConfig','\"\"'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.e76da8b3-d497-4640-b67d-6cb54882b8b4.settings.purifierConfig','null'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.e76da8b3-d497-4640-b67d-6cb54882b8b4.settings.purifyHtml','true'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.e76da8b3-d497-4640-b67d-6cb54882b8b4.settings.redactorConfig','\"Advanced.json\"'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.e76da8b3-d497-4640-b67d-6cb54882b8b4.settings.removeEmptyTags','true'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.e76da8b3-d497-4640-b67d-6cb54882b8b4.settings.removeInlineStyles','false'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.e76da8b3-d497-4640-b67d-6cb54882b8b4.settings.removeNbsp','false'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.e76da8b3-d497-4640-b67d-6cb54882b8b4.settings.showHtmlButtonForNonAdmins','false'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.e76da8b3-d497-4640-b67d-6cb54882b8b4.settings.showUnpermittedFiles','false'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.e76da8b3-d497-4640-b67d-6cb54882b8b4.settings.showUnpermittedVolumes','false'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.e76da8b3-d497-4640-b67d-6cb54882b8b4.settings.uiMode','\"enlarged\"'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.e76da8b3-d497-4640-b67d-6cb54882b8b4.translationKeyFormat','null'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.e76da8b3-d497-4640-b67d-6cb54882b8b4.translationMethod','\"none\"'),('superTableBlockTypes.23d68cad-fe52-4009-b811-2ade64816c1c.fields.e76da8b3-d497-4640-b67d-6cb54882b8b4.type','\"craft\\\\redactor\\\\Field\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.changedFieldIndicator','1591776962'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.field','\"ce0863d3-a4a9-4752-834b-133fb279efc0\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elementCondition','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.0.elementCondition','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.0.fieldUid','\"af5cc8b1-f85a-44ce-a1f4-3bd099bc24a9\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.0.instructions','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.0.label','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.0.required','true'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.0.tip','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.0.uid','\"2eb41a36-b837-42d3-895c-5038451afe12\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.0.userCondition','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.0.warning','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.0.width','100'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.1.elementCondition','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.1.fieldUid','\"483487fa-d1d2-435a-ad87-6373f9723729\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.1.instructions','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.1.label','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.1.required','false'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.1.tip','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.1.uid','\"32e1fb2c-d6d4-4fd5-81a4-d371a64acb87\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.1.userCondition','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.1.warning','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.1.width','100'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.2.elementCondition','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.2.fieldUid','\"5f4c36bb-f3d9-4374-a12d-45bccbebd07a\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.2.instructions','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.2.label','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.2.required','true'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.2.tip','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.2.uid','\"07311030-f6fe-4c37-ac4d-3dcc4566087c\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.2.userCondition','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.2.warning','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.elements.2.width','100'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.name','\"Content\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.uid','\"e808b865-18b4-41b7-bd73-5c22309f5eb8\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fieldLayouts.3087b671-a5de-43b4-a38f-6fe21fb37ad2.tabs.0.userCondition','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.483487fa-d1d2-435a-ad87-6373f9723729.columnSuffix','\"ycwyqdyl\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.483487fa-d1d2-435a-ad87-6373f9723729.contentColumnType','\"text\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.483487fa-d1d2-435a-ad87-6373f9723729.fieldGroup','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.483487fa-d1d2-435a-ad87-6373f9723729.handle','\"subline\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.483487fa-d1d2-435a-ad87-6373f9723729.instructions','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.483487fa-d1d2-435a-ad87-6373f9723729.name','\"Subline\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.483487fa-d1d2-435a-ad87-6373f9723729.searchable','false'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.483487fa-d1d2-435a-ad87-6373f9723729.settings.byteLimit','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.483487fa-d1d2-435a-ad87-6373f9723729.settings.charLimit','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.483487fa-d1d2-435a-ad87-6373f9723729.settings.code','false'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.483487fa-d1d2-435a-ad87-6373f9723729.settings.columnType','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.483487fa-d1d2-435a-ad87-6373f9723729.settings.initialRows','4'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.483487fa-d1d2-435a-ad87-6373f9723729.settings.multiline','false'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.483487fa-d1d2-435a-ad87-6373f9723729.settings.placeholder','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.483487fa-d1d2-435a-ad87-6373f9723729.settings.uiMode','\"normal\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.483487fa-d1d2-435a-ad87-6373f9723729.translationKeyFormat','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.483487fa-d1d2-435a-ad87-6373f9723729.translationMethod','\"none\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.483487fa-d1d2-435a-ad87-6373f9723729.type','\"craft\\\\fields\\\\PlainText\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.columnSuffix','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.contentColumnType','\"string\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.fieldGroup','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.handle','\"file\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.instructions','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.name','\"File\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.searchable','false'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.allowedKinds.0','\"audio\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.allowedKinds.1','\"compressed\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.allowedKinds.2','\"image\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.allowedKinds.3','\"json\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.allowedKinds.4','\"pdf\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.allowSelfRelations','false'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.allowSubfolders','false'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.allowUploads','true'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.branchLimit','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.defaultUploadLocationSource','\"volume:8ce61d6f-c2a3-4076-bb14-40b900c685cf\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.defaultUploadLocationSubpath','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.localizeRelations','false'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.maintainHierarchy','false'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.maxRelations','1'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.minRelations','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.previewMode','\"full\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.restrictedDefaultUploadSubpath','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.restrictedLocationSource','\"volume:8ce61d6f-c2a3-4076-bb14-40b900c685cf\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.restrictedLocationSubpath','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.restrictFiles','true'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.restrictLocation','false'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.selectionCondition.__assoc__.0.0','\"elementType\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.selectionCondition.__assoc__.0.1','\"craft\\\\elements\\\\Asset\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.selectionCondition.__assoc__.1.0','\"fieldContext\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.selectionCondition.__assoc__.1.1','\"global\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.selectionCondition.__assoc__.2.0','\"class\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.selectionCondition.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.selectionLabel','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.showSiteMenu','true'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.showUnpermittedFiles','false'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.showUnpermittedVolumes','false'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.sources.0','\"volume:8ce61d6f-c2a3-4076-bb14-40b900c685cf\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.targetSiteId','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.validateRelatedElements','false'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.settings.viewMode','\"list\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.translationKeyFormat','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.translationMethod','\"site\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.5f4c36bb-f3d9-4374-a12d-45bccbebd07a.type','\"craft\\\\fields\\\\Assets\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.af5cc8b1-f85a-44ce-a1f4-3bd099bc24a9.columnSuffix','\"digfgtnk\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.af5cc8b1-f85a-44ce-a1f4-3bd099bc24a9.contentColumnType','\"text\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.af5cc8b1-f85a-44ce-a1f4-3bd099bc24a9.fieldGroup','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.af5cc8b1-f85a-44ce-a1f4-3bd099bc24a9.handle','\"headline\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.af5cc8b1-f85a-44ce-a1f4-3bd099bc24a9.instructions','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.af5cc8b1-f85a-44ce-a1f4-3bd099bc24a9.name','\"Headline\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.af5cc8b1-f85a-44ce-a1f4-3bd099bc24a9.searchable','false'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.af5cc8b1-f85a-44ce-a1f4-3bd099bc24a9.settings.byteLimit','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.af5cc8b1-f85a-44ce-a1f4-3bd099bc24a9.settings.charLimit','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.af5cc8b1-f85a-44ce-a1f4-3bd099bc24a9.settings.code','false'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.af5cc8b1-f85a-44ce-a1f4-3bd099bc24a9.settings.columnType','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.af5cc8b1-f85a-44ce-a1f4-3bd099bc24a9.settings.initialRows','4'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.af5cc8b1-f85a-44ce-a1f4-3bd099bc24a9.settings.multiline','false'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.af5cc8b1-f85a-44ce-a1f4-3bd099bc24a9.settings.placeholder','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.af5cc8b1-f85a-44ce-a1f4-3bd099bc24a9.settings.uiMode','\"normal\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.af5cc8b1-f85a-44ce-a1f4-3bd099bc24a9.translationKeyFormat','null'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.af5cc8b1-f85a-44ce-a1f4-3bd099bc24a9.translationMethod','\"none\"'),('superTableBlockTypes.7f025247-4b6d-4d41-9e38-a84b03b86a9e.fields.af5cc8b1-f85a-44ce-a1f4-3bd099bc24a9.type','\"craft\\\\fields\\\\PlainText\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.changedFieldIndicator','1886872667'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.field','\"832e06b7-23a1-43f1-9195-d9799aeeb7a2\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elementCondition','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.0.elementCondition','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.0.fieldUid','\"5b54e8f6-48f6-47a6-812e-7799a1e2f264\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.0.instructions','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.0.label','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.0.required','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.0.tip','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.0.uid','\"1df3c47a-a865-4fa7-ab29-a8ee7f2eef3c\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.0.userCondition','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.0.warning','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.0.width','100'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.1.elementCondition','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.1.fieldUid','\"1e3282cf-612c-4d04-b4f6-02ec0ef60e78\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.1.instructions','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.1.label','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.1.required','true'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.1.tip','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.1.uid','\"be111342-f779-4c51-af3b-d0349528b35b\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.1.userCondition','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.1.warning','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.1.width','100'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.2.elementCondition','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.2.fieldUid','\"d6d68433-69a8-40e3-b902-a9aa2a507b07\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.2.instructions','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.2.label','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.2.required','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.2.tip','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.2.uid','\"f22cb133-474d-49ec-b255-33e6d923aa4b\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.2.userCondition','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.2.warning','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.2.width','100'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.3.elementCondition','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.3.fieldUid','\"ce845487-a637-4e39-a2cf-8e7fbdb0b3e2\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.3.instructions','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.3.label','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.3.required','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.3.tip','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.3.uid','\"b0afb400-f0ff-4d8f-b84b-4702b836a44f\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.3.userCondition','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.3.warning','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.elements.3.width','100'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.name','\"Content\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.uid','\"a2dac253-b10e-4412-b435-46c9e53b46ea\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fieldLayouts.c9d9a027-e844-46e6-84ef-ffd7c014e236.tabs.0.userCondition','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.1e3282cf-612c-4d04-b4f6-02ec0ef60e78.columnSuffix','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.1e3282cf-612c-4d04-b4f6-02ec0ef60e78.contentColumnType','\"text\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.1e3282cf-612c-4d04-b4f6-02ec0ef60e78.fieldGroup','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.1e3282cf-612c-4d04-b4f6-02ec0ef60e78.handle','\"headline\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.1e3282cf-612c-4d04-b4f6-02ec0ef60e78.instructions','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.1e3282cf-612c-4d04-b4f6-02ec0ef60e78.name','\"Headline\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.1e3282cf-612c-4d04-b4f6-02ec0ef60e78.searchable','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.1e3282cf-612c-4d04-b4f6-02ec0ef60e78.settings.byteLimit','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.1e3282cf-612c-4d04-b4f6-02ec0ef60e78.settings.charLimit','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.1e3282cf-612c-4d04-b4f6-02ec0ef60e78.settings.code','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.1e3282cf-612c-4d04-b4f6-02ec0ef60e78.settings.columnType','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.1e3282cf-612c-4d04-b4f6-02ec0ef60e78.settings.initialRows','4'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.1e3282cf-612c-4d04-b4f6-02ec0ef60e78.settings.multiline','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.1e3282cf-612c-4d04-b4f6-02ec0ef60e78.settings.placeholder','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.1e3282cf-612c-4d04-b4f6-02ec0ef60e78.settings.uiMode','\"normal\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.1e3282cf-612c-4d04-b4f6-02ec0ef60e78.translationKeyFormat','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.1e3282cf-612c-4d04-b4f6-02ec0ef60e78.translationMethod','\"none\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.1e3282cf-612c-4d04-b4f6-02ec0ef60e78.type','\"craft\\\\fields\\\\PlainText\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.columnSuffix','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.contentColumnType','\"string\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.fieldGroup','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.handle','\"image\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.instructions','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.name','\"Image\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.searchable','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.allowedKinds.0','\"image\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.allowSelfRelations','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.allowSubfolders','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.allowUploads','true'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.branchLimit','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.defaultUploadLocationSource','\"volume:8ce61d6f-c2a3-4076-bb14-40b900c685cf\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.defaultUploadLocationSubpath','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.localizeRelations','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.maintainHierarchy','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.maxRelations','1'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.minRelations','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.previewMode','\"full\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.restrictedDefaultUploadSubpath','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.restrictedLocationSource','\"volume:8ce61d6f-c2a3-4076-bb14-40b900c685cf\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.restrictedLocationSubpath','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.restrictFiles','true'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.restrictLocation','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.selectionCondition.__assoc__.0.0','\"elementType\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.selectionCondition.__assoc__.0.1','\"craft\\\\elements\\\\Asset\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.selectionCondition.__assoc__.1.0','\"fieldContext\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.selectionCondition.__assoc__.1.1','\"global\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.selectionCondition.__assoc__.2.0','\"class\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.selectionCondition.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.selectionLabel','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.showSiteMenu','true'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.showUnpermittedFiles','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.showUnpermittedVolumes','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.sources','\"*\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.targetSiteId','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.validateRelatedElements','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.settings.viewMode','\"list\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.translationKeyFormat','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.translationMethod','\"site\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.5b54e8f6-48f6-47a6-812e-7799a1e2f264.type','\"craft\\\\fields\\\\Assets\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.columnSuffix','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.contentColumnType','\"string\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.fieldGroup','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.handle','\"button\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.instructions','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.name','\"Button\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.searchable','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.allowCustomText','true'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.allowTarget','true'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.autoNoReferrer','true'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.customTextMaxLength','0'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.customTextRequired','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.defaultLinkName','\"entry\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.defaultText','\"\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.enableAllLinkTypes','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.enableAriaLabel','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.enableElementCache','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.enableTitle','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.typeSettings.asset.allowCrossSiteLink','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.typeSettings.asset.allowCustomQuery','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.typeSettings.asset.enabled','true'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.typeSettings.asset.sources','\"*\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.typeSettings.category.allowCrossSiteLink','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.typeSettings.category.allowCustomQuery','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.typeSettings.category.enabled','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.typeSettings.category.sources','\"*\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.typeSettings.custom.allowAliases','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.typeSettings.custom.disableValidation','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.typeSettings.custom.enabled','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.typeSettings.email.allowAliases','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.typeSettings.email.disableValidation','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.typeSettings.email.enabled','true'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.typeSettings.entry.allowCrossSiteLink','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.typeSettings.entry.allowCustomQuery','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.typeSettings.entry.enabled','true'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.typeSettings.entry.sources','\"*\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.typeSettings.site.enabled','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.typeSettings.site.sites','\"*\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.typeSettings.tel.allowAliases','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.typeSettings.tel.disableValidation','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.typeSettings.tel.enabled','true'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.typeSettings.url.allowAliases','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.typeSettings.url.disableValidation','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.typeSettings.url.enabled','true'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.typeSettings.user.allowCrossSiteLink','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.typeSettings.user.allowCustomQuery','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.typeSettings.user.enabled','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.settings.typeSettings.user.sources','\"*\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.translationKeyFormat','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.translationMethod','\"none\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.ce845487-a637-4e39-a2cf-8e7fbdb0b3e2.type','\"lenz\\\\linkfield\\\\fields\\\\LinkField\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.d6d68433-69a8-40e3-b902-a9aa2a507b07.columnSuffix','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.d6d68433-69a8-40e3-b902-a9aa2a507b07.contentColumnType','\"text\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.d6d68433-69a8-40e3-b902-a9aa2a507b07.fieldGroup','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.d6d68433-69a8-40e3-b902-a9aa2a507b07.handle','\"text\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.d6d68433-69a8-40e3-b902-a9aa2a507b07.instructions','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.d6d68433-69a8-40e3-b902-a9aa2a507b07.name','\"Text\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.d6d68433-69a8-40e3-b902-a9aa2a507b07.searchable','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.d6d68433-69a8-40e3-b902-a9aa2a507b07.settings.availableTransforms','\"\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.d6d68433-69a8-40e3-b902-a9aa2a507b07.settings.availableVolumes','\"\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.d6d68433-69a8-40e3-b902-a9aa2a507b07.settings.columnType','\"text\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.d6d68433-69a8-40e3-b902-a9aa2a507b07.settings.configSelectionMode','\"choose\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.d6d68433-69a8-40e3-b902-a9aa2a507b07.settings.defaultTransform','\"\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.d6d68433-69a8-40e3-b902-a9aa2a507b07.settings.manualConfig','\"\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.d6d68433-69a8-40e3-b902-a9aa2a507b07.settings.purifierConfig','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.d6d68433-69a8-40e3-b902-a9aa2a507b07.settings.purifyHtml','true'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.d6d68433-69a8-40e3-b902-a9aa2a507b07.settings.redactorConfig','\"Simple.json\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.d6d68433-69a8-40e3-b902-a9aa2a507b07.settings.removeEmptyTags','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.d6d68433-69a8-40e3-b902-a9aa2a507b07.settings.removeInlineStyles','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.d6d68433-69a8-40e3-b902-a9aa2a507b07.settings.removeNbsp','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.d6d68433-69a8-40e3-b902-a9aa2a507b07.settings.showHtmlButtonForNonAdmins','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.d6d68433-69a8-40e3-b902-a9aa2a507b07.settings.showUnpermittedFiles','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.d6d68433-69a8-40e3-b902-a9aa2a507b07.settings.showUnpermittedVolumes','false'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.d6d68433-69a8-40e3-b902-a9aa2a507b07.settings.uiMode','\"enlarged\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.d6d68433-69a8-40e3-b902-a9aa2a507b07.translationKeyFormat','null'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.d6d68433-69a8-40e3-b902-a9aa2a507b07.translationMethod','\"none\"'),('superTableBlockTypes.9bc49b93-2f26-43c8-8b2b-b131c6e0f76b.fields.d6d68433-69a8-40e3-b902-a9aa2a507b07.type','\"craft\\\\redactor\\\\Field\"'),('system.edition','\"pro\"'),('system.live','true'),('system.name','\"$SITE_NAME\"'),('system.retryDuration','null'),('system.schemaVersion','\"4.5.3.0\"'),('system.timeZone','\"Europe/Berlin\"'),('users.allowPublicRegistration','true'),('users.deactivateByDefault','false'),('users.defaultGroup','\"9cf9bc77-b5c2-4d2e-a0ae-c1b418fa872e\"'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true'),('users.validateOnPublicRegistration','false');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,1,NULL,1,NULL),(2,1,NULL,2,NULL),(3,4,NULL,1,NULL),(4,4,NULL,2,NULL),(5,7,NULL,1,NULL),(6,7,NULL,2,NULL),(7,10,NULL,1,NULL),(8,10,NULL,2,NULL),(9,13,NULL,1,NULL),(10,13,NULL,2,NULL),(11,1,NULL,3,NULL),(12,1,NULL,4,NULL),(13,4,NULL,3,NULL),(14,4,NULL,4,NULL),(15,7,NULL,3,NULL),(16,7,NULL,4,NULL),(17,10,NULL,3,NULL),(18,10,NULL,4,NULL),(19,13,NULL,3,NULL),(20,13,NULL,4,NULL),(21,10,26,5,NULL),(22,28,26,1,''),(23,30,26,1,'');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'field',4,1,''),(1,'slug',0,1,' impressum '),(1,'title',0,1,' impressum '),(4,'field',4,1,''),(4,'slug',0,1,' datenschutz '),(4,'title',0,1,' datenschutz '),(7,'field',4,1,''),(7,'slug',0,1,' kontakt '),(7,'title',0,1,' kontakt '),(10,'slug',0,1,' home '),(10,'title',0,1,' home '),(13,'field',4,1,''),(13,'slug',0,1,' merkliste '),(13,'title',0,1,' merkliste '),(26,'email',0,1,' superuser todolist test '),(26,'firstname',0,1,''),(26,'fullname',0,1,''),(26,'lastname',0,1,''),(26,'slug',0,1,''),(26,'username',0,1,' admin '),(28,'field',67,1,' first '),(28,'field',68,1,' second '),(28,'slug',0,1,' first vs second '),(28,'title',0,1,' first vs second '),(30,'field',67,1,' cras justo odio dapibus ac facilisis in egestas eget quam '),(30,'field',68,1,' nulla vitae elit libero a pharetra augue '),(30,'slug',0,1,' cras justo odio dapibus ac facilisis in egestas eget quam vs nulla vitae elit libero a pharetra augue '),(30,'title',0,1,' cras justo odio dapibus ac facilisis in egestas eget quam vs nulla vitae elit libero a pharetra augue '),(80,'slug',0,1,' take over the world '),(80,'title',0,1,' take over the world '),(81,'slug',0,1,' stack stats '),(81,'title',0,1,' stack stats '),(82,'slug',0,1,' study bitcoin '),(82,'title',0,1,' study bitcoin ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Merkliste','watchlist','single',1,'all','end','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2023-08-18 12:47:01','2023-08-18 12:47:01','2023-08-18 12:49:53','ebcb4d30-fdc2-479e-b7b2-9fc7942764a0'),(2,NULL,'Favoriten','favorites','channel',0,'all','end','[{\"label\":\"Primary entry page\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2023-08-18 12:47:01','2023-08-18 12:47:01','2023-08-18 12:50:15','f8e1bea9-0b81-4a1f-8a72-472a3ae2a730'),(3,NULL,'Battles','battles','channel',1,'all','end','[{\"label\":\"Primäre eintrag Seite\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2023-08-18 12:47:01','2023-08-18 12:50:47','2023-09-11 13:16:54','9e78a6d6-4c8a-4a13-ace9-37db731411ed'),(4,NULL,'Datenschutz','privacy','single',1,'all','end','[{\"label\":\"Primäre eintrag Seite\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2023-08-18 12:47:01','2023-08-18 12:47:01','2023-09-11 13:16:52','00f6a53d-3397-471a-9166-7be712892d40'),(5,NULL,'Materialien','articleMaterials','channel',1,'all','end','[{\"label\":\"Primäre eintrag Seite\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2023-08-18 12:47:01','2023-08-18 12:47:01','2023-08-18 12:49:42','71fe53ec-55f3-40b6-b998-45c3eb68c152'),(6,NULL,'Impressum','imprint','single',1,'all','end','[{\"label\":\"Primäre eintrag Seite\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2023-08-18 12:47:01','2023-08-18 12:47:01','2023-09-11 13:16:45','a9a0256f-eaa0-46c1-a448-3cb2e9e2094d'),(7,NULL,'Home','home','single',1,'all','end',NULL,'2023-08-18 12:47:01','2023-08-18 12:47:01','2023-09-11 13:16:49','24af7e7f-3b66-4f65-b596-3c1c1bc4161f'),(8,NULL,'Prozessschritte','articleSteps','channel',1,'all','end','[{\"label\":\"Primäre eintrag Seite\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2023-08-18 12:47:01','2023-08-18 12:47:01','2023-08-18 12:50:10','b97a5d63-cd57-4795-90f0-c696853b0a2a'),(9,NULL,'Projekte','projects','channel',1,'all','end','[{\"label\":\"Primäre eintrag Seite\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2023-08-18 12:47:01','2023-08-18 12:47:01','2023-08-18 12:50:04','ebc5cd70-5a45-4a98-880d-5321ee91b384'),(10,NULL,'Themen','articleThemes','channel',1,'all','end','[{\"label\":\"Primäre eintrag Seite\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2023-08-18 12:47:01','2023-08-18 12:47:01','2023-08-18 12:50:07','cebc0d70-3dd3-4cf1-b557-d2463956481d'),(11,NULL,'Kontakt','contact','single',1,'all','end','[{\"label\":\"Primäre eintrag Seite\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2023-08-18 12:47:01','2023-08-18 12:47:01','2023-08-18 12:49:38','cab6a5e7-0058-4313-8673-18284e710686'),(12,NULL,'Items','items','channel',0,'all','end','[{\"label\":\"Primäre eintrag Seite\",\"urlFormat\":\"{url}\",\"refresh\":\"1\"}]','2023-08-18 13:34:38','2023-09-11 13:17:43',NULL,'605954e5-35e4-4427-8ea0-b9d8b64a723e');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'merkliste','_entries',1,'2023-08-18 12:47:01','2023-08-18 12:47:01','92ff97b1-f151-4a48-a737-3b29e9c8f439'),(2,2,1,0,NULL,NULL,1,'2023-08-18 12:47:01','2023-08-18 12:47:01','0a24a577-d7b1-4cd9-adc3-46d7507c4ea3'),(3,3,1,1,'battles/{slug}','_entries',1,'2023-08-18 12:47:01','2023-08-18 12:50:47','282de2b7-6566-45fc-95b3-c2493e5a082b'),(4,4,1,1,'datenschutz','_entries',1,'2023-08-18 12:47:01','2023-08-18 12:47:01','3d158efe-772a-436f-9b9d-53d3635a7ced'),(5,5,1,0,NULL,NULL,1,'2023-08-18 12:47:01','2023-08-18 12:47:01','ad99f9ed-5a42-4359-86dc-cbbac16fb06a'),(6,6,1,1,'impressum','_entries',1,'2023-08-18 12:47:01','2023-08-18 12:47:01','29c77e0d-91e8-49ff-91cc-ba410e325ff8'),(7,7,1,1,'__home__','_entries',1,'2023-08-18 12:47:01','2023-08-18 12:47:01','911db305-5a9f-4bc7-9545-e084bb10d859'),(8,8,1,0,NULL,NULL,1,'2023-08-18 12:47:01','2023-08-18 12:47:01','572aa97f-99a0-49a7-bf79-917a761b3fbe'),(9,9,1,1,'projekt/{slug}','_entries',1,'2023-08-18 12:47:01','2023-08-18 12:47:01','c4bcb132-2d07-4398-a754-71fc6f7dfac7'),(10,10,1,0,NULL,NULL,1,'2023-08-18 12:47:01','2023-08-18 12:47:01','7728fd8c-7a0a-4698-bb19-762825bf505f'),(11,11,1,1,'kontakt','_entries',1,'2023-08-18 12:47:01','2023-08-18 12:47:01','4df49b25-322f-40ea-9411-6d29db3fb50f'),(12,12,1,0,NULL,NULL,1,'2023-08-18 13:34:38','2023-08-18 13:34:38','3c44d3cb-2826-4f3d-9d78-180d767f458c');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'Default','2023-08-18 12:47:00','2023-08-18 12:47:00',NULL,'4706b3bf-052e-4604-bbf9-0095d00f790a');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'1','$SITE_NAME','de','de',1,'$SITE_URL',1,'2023-08-18 12:47:00','2023-08-18 12:47:01',NULL,'5a388334-4b50-4126-b1df-67227ce21818');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sprig_playgrounds`
--

LOCK TABLES `sprig_playgrounds` WRITE;
/*!40000 ALTER TABLE `sprig_playgrounds` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sprig_playgrounds` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `stc_4_cards`
--

LOCK TABLES `stc_4_cards` WRITE;
/*!40000 ALTER TABLE `stc_4_cards` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `stc_4_cards` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `stc_7_items`
--

LOCK TABLES `stc_7_items` WRITE;
/*!40000 ALTER TABLE `stc_7_items` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `stc_7_items` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `stc_8_items`
--

LOCK TABLES `stc_8_items` WRITE;
/*!40000 ALTER TABLE `stc_8_items` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `stc_8_items` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpermissions` VALUES (1,'createentries:f8e1bea9-0b81-4a1f-8a72-472a3ae2a730','2023-08-18 12:47:01','2023-08-18 12:47:01','044b9e7a-40a7-4c16-ba67-9d7ae0e1fa43'),(2,'deleteentries:f8e1bea9-0b81-4a1f-8a72-472a3ae2a730','2023-08-18 12:47:01','2023-08-18 12:47:01','2c13913a-e5fc-459b-94fb-85c5e67a8a7f'),(3,'saveentries:f8e1bea9-0b81-4a1f-8a72-472a3ae2a730','2023-08-18 12:47:01','2023-08-18 12:47:01','b8edc961-a670-4665-9713-d96ea90352b1'),(4,'viewentries:f8e1bea9-0b81-4a1f-8a72-472a3ae2a730','2023-08-18 12:47:01','2023-08-18 12:47:01','817abeb9-e362-45b3-97e6-a7ebd49c3010'),(5,'accesscp','2023-08-18 12:47:01','2023-08-18 12:47:01','4d1cb986-642e-4a0a-8913-b2e6390a9227'),(6,'accesscpwhensystemisoff','2023-08-18 12:47:01','2023-08-18 12:47:01','4edd7934-107a-4784-ba43-730146cfb7f0'),(7,'accesssitewhensystemisoff','2023-08-18 12:47:01','2023-08-18 12:47:01','1012210c-e5dd-4cbb-9dd7-9fc0f32c8bcf'),(8,'administrateusers','2023-08-18 12:47:01','2023-08-18 12:47:01','3e54d400-12a8-4505-aead-6e24951a09ec'),(9,'assignusergroup:bd50e2ca-cad3-4a6a-a4a2-c7de1880a3bf','2023-08-18 12:47:01','2023-08-18 12:47:01','1f48fb86-77d6-4e75-be5f-fa150fd26e22'),(10,'createentries:71fe53ec-55f3-40b6-b998-45c3eb68c152','2023-08-18 12:47:01','2023-08-18 12:47:01','30fcb783-69bf-4742-94f1-c74fbf02b12d'),(11,'createentries:9e78a6d6-4c8a-4a13-ace9-37db731411ed','2023-08-18 12:47:01','2023-08-18 12:47:01','98c32db2-dbaf-4e80-939c-83c939b7a098'),(12,'createentries:b97a5d63-cd57-4795-90f0-c696853b0a2a','2023-08-18 12:47:01','2023-08-18 12:47:01','dd622281-c29d-49ee-b93b-0af90879912d'),(13,'createentries:cebc0d70-3dd3-4cf1-b557-d2463956481d','2023-08-18 12:47:01','2023-08-18 12:47:01','324d385c-6aa6-4198-8438-30aa84e0cdcb'),(14,'createentries:ebc5cd70-5a45-4a98-880d-5321ee91b384','2023-08-18 12:47:01','2023-08-18 12:47:01','9902aa46-c189-48d2-9f55-3007f296cf28'),(15,'createfolders:8ce61d6f-c2a3-4076-bb14-40b900c685cf','2023-08-18 12:47:01','2023-08-18 12:47:01','9f69afaa-198d-45df-8079-b2055ed59e90'),(16,'deleteassets:8ce61d6f-c2a3-4076-bb14-40b900c685cf','2023-08-18 12:47:01','2023-08-18 12:47:01','faa019e2-16dd-415f-85bd-a849b506d5f4'),(17,'deleteentries:71fe53ec-55f3-40b6-b998-45c3eb68c152','2023-08-18 12:47:01','2023-08-18 12:47:01','16685186-a75f-4b6e-8590-735a4c44a161'),(18,'deleteentries:9e78a6d6-4c8a-4a13-ace9-37db731411ed','2023-08-18 12:47:01','2023-08-18 12:47:01','c10a10ae-3485-4cf8-a806-ecc6b04d0be9'),(19,'deleteentries:b97a5d63-cd57-4795-90f0-c696853b0a2a','2023-08-18 12:47:01','2023-08-18 12:47:01','0706fedc-6a59-4239-b723-5f2ba29c480d'),(20,'deleteentries:cebc0d70-3dd3-4cf1-b557-d2463956481d','2023-08-18 12:47:01','2023-08-18 12:47:01','d17a1d7f-27d2-43a9-b8e4-8b08b247e90a'),(21,'deleteentries:ebc5cd70-5a45-4a98-880d-5321ee91b384','2023-08-18 12:47:01','2023-08-18 12:47:01','c6caed79-6ad3-4651-a315-d0d291a8afa5'),(22,'deletepeerassets:8ce61d6f-c2a3-4076-bb14-40b900c685cf','2023-08-18 12:47:01','2023-08-18 12:47:01','4419b500-fe58-4770-b30d-09e6a7906360'),(23,'deletepeerentries:71fe53ec-55f3-40b6-b998-45c3eb68c152','2023-08-18 12:47:01','2023-08-18 12:47:01','7dcd30e5-326f-4e7d-a4a2-c1dd5fe260da'),(24,'deletepeerentries:9e78a6d6-4c8a-4a13-ace9-37db731411ed','2023-08-18 12:47:01','2023-08-18 12:47:01','caaa02cc-9a2d-47e6-aa8f-3c360daff4b5'),(25,'deletepeerentries:b97a5d63-cd57-4795-90f0-c696853b0a2a','2023-08-18 12:47:01','2023-08-18 12:47:01','95edb237-461d-4f78-834c-136d6057d2af'),(26,'deletepeerentries:cebc0d70-3dd3-4cf1-b557-d2463956481d','2023-08-18 12:47:01','2023-08-18 12:47:01','3b9986e2-cea1-47f9-b114-28c850681853'),(27,'deletepeerentries:ebc5cd70-5a45-4a98-880d-5321ee91b384','2023-08-18 12:47:01','2023-08-18 12:47:01','90f9835e-1cba-49a0-8b7f-bfd24eae83c1'),(28,'deletepeerentrydrafts:00f6a53d-3397-471a-9166-7be712892d40','2023-08-18 12:47:01','2023-08-18 12:47:01','f8aa0dfc-1e8a-40a9-ad85-5b3cb198a9f0'),(29,'deletepeerentrydrafts:24af7e7f-3b66-4f65-b596-3c1c1bc4161f','2023-08-18 12:47:01','2023-08-18 12:47:01','06221080-5937-4c98-a026-a52984990a44'),(30,'deletepeerentrydrafts:71fe53ec-55f3-40b6-b998-45c3eb68c152','2023-08-18 12:47:01','2023-08-18 12:47:01','18109f5a-45c3-42a1-b9bf-e51fa528fddd'),(31,'deletepeerentrydrafts:9e78a6d6-4c8a-4a13-ace9-37db731411ed','2023-08-18 12:47:01','2023-08-18 12:47:01','bfb34091-c678-4d1c-9f10-524cf50f7dd9'),(32,'deletepeerentrydrafts:a9a0256f-eaa0-46c1-a448-3cb2e9e2094d','2023-08-18 12:47:01','2023-08-18 12:47:01','d5413a27-b3e7-4020-8da5-b4e81b75e053'),(33,'deletepeerentrydrafts:b97a5d63-cd57-4795-90f0-c696853b0a2a','2023-08-18 12:47:01','2023-08-18 12:47:01','a0beeb36-8bfd-48fe-951d-a203b22de353'),(34,'deletepeerentrydrafts:cab6a5e7-0058-4313-8673-18284e710686','2023-08-18 12:47:01','2023-08-18 12:47:01','2f1de9d1-5229-4c43-9991-7fddd4876cbc'),(35,'deletepeerentrydrafts:cebc0d70-3dd3-4cf1-b557-d2463956481d','2023-08-18 12:47:01','2023-08-18 12:47:01','5ed4f379-1050-475d-bb95-f3771b3273ce'),(36,'deletepeerentrydrafts:ebc5cd70-5a45-4a98-880d-5321ee91b384','2023-08-18 12:47:01','2023-08-18 12:47:01','6a392d86-3899-4871-8125-2f637e2651ec'),(37,'deletepeerentrydrafts:ebcb4d30-fdc2-479e-b7b2-9fc7942764a0','2023-08-18 12:47:01','2023-08-18 12:47:01','2bc06955-7382-4fa1-9067-cab324e0ddfc'),(38,'editimages:8ce61d6f-c2a3-4076-bb14-40b900c685cf','2023-08-18 12:47:01','2023-08-18 12:47:01','e9213751-ce40-4504-b601-44ff386f0315'),(39,'editpeerimages:8ce61d6f-c2a3-4076-bb14-40b900c685cf','2023-08-18 12:47:01','2023-08-18 12:47:01','4621963e-9f5b-4cb8-bf8b-d6b9907d0fca'),(40,'editusers','2023-08-18 12:47:01','2023-08-18 12:47:01','2c1a859e-b516-4986-8ce6-2ca568c662b7'),(41,'impersonateusers','2023-08-18 12:47:01','2023-08-18 12:47:01','096e757a-44e5-4927-ac6d-1051ced30b08'),(42,'moderateusers','2023-08-18 12:47:01','2023-08-18 12:47:01','156098be-5e3d-4425-b938-5684ce84820c'),(43,'registerusers','2023-08-18 12:47:01','2023-08-18 12:47:01','2e36ed63-3e84-40ac-988d-20f2f7684650'),(44,'replacefiles:8ce61d6f-c2a3-4076-bb14-40b900c685cf','2023-08-18 12:47:01','2023-08-18 12:47:01','0b8381be-dc64-4f29-ac17-64d73c1b144f'),(45,'replacepeerfiles:8ce61d6f-c2a3-4076-bb14-40b900c685cf','2023-08-18 12:47:01','2023-08-18 12:47:01','a26ebbea-7646-4c06-9f2c-b13189f3182e'),(46,'saveassets:8ce61d6f-c2a3-4076-bb14-40b900c685cf','2023-08-18 12:47:01','2023-08-18 12:47:01','15cf23e5-1cab-459d-bebb-b2b2a2faa00a'),(47,'saveentries:00f6a53d-3397-471a-9166-7be712892d40','2023-08-18 12:47:01','2023-08-18 12:47:01','557b1ac3-b5c0-45b9-a7b8-5ddfacd3b693'),(48,'saveentries:24af7e7f-3b66-4f65-b596-3c1c1bc4161f','2023-08-18 12:47:01','2023-08-18 12:47:01','2ca1e7be-9966-444d-8912-f791c5ede1b3'),(49,'saveentries:71fe53ec-55f3-40b6-b998-45c3eb68c152','2023-08-18 12:47:01','2023-08-18 12:47:01','4991b966-c968-4945-8c6b-cfb0e640fe51'),(50,'saveentries:9e78a6d6-4c8a-4a13-ace9-37db731411ed','2023-08-18 12:47:01','2023-08-18 12:47:01','2afd3abd-1f94-4f67-b0cf-eeb8cd1f1b5a'),(51,'saveentries:a9a0256f-eaa0-46c1-a448-3cb2e9e2094d','2023-08-18 12:47:01','2023-08-18 12:47:01','67351c86-cc0a-4ecd-bbfc-772019eac495'),(52,'saveentries:b97a5d63-cd57-4795-90f0-c696853b0a2a','2023-08-18 12:47:01','2023-08-18 12:47:01','48c352d8-65c3-4920-a957-541a780914c6'),(53,'saveentries:cab6a5e7-0058-4313-8673-18284e710686','2023-08-18 12:47:01','2023-08-18 12:47:01','d6319eb2-d541-4860-8079-814e2e127789'),(54,'saveentries:cebc0d70-3dd3-4cf1-b557-d2463956481d','2023-08-18 12:47:01','2023-08-18 12:47:01','64937b56-db8d-4f8e-99bf-f996aec780cf'),(55,'saveentries:ebc5cd70-5a45-4a98-880d-5321ee91b384','2023-08-18 12:47:01','2023-08-18 12:47:01','8070a1a2-c64b-4923-a67b-1b1885846f06'),(56,'saveentries:ebcb4d30-fdc2-479e-b7b2-9fc7942764a0','2023-08-18 12:47:01','2023-08-18 12:47:01','c1cdfce1-d775-4650-aa9a-532e6728095c'),(57,'savepeerassets:8ce61d6f-c2a3-4076-bb14-40b900c685cf','2023-08-18 12:47:01','2023-08-18 12:47:01','0df538c4-fb28-4114-abee-3ea95cb50276'),(58,'savepeerentries:71fe53ec-55f3-40b6-b998-45c3eb68c152','2023-08-18 12:47:01','2023-08-18 12:47:01','95cb3bfc-ab5c-408b-afac-cc157d0e01c9'),(59,'savepeerentries:9e78a6d6-4c8a-4a13-ace9-37db731411ed','2023-08-18 12:47:01','2023-08-18 12:47:01','5d36931b-c5d5-4022-87a3-bef4c3f63b92'),(60,'savepeerentries:b97a5d63-cd57-4795-90f0-c696853b0a2a','2023-08-18 12:47:01','2023-08-18 12:47:01','e45127d1-209c-4efa-adda-c817e7614a8f'),(61,'savepeerentries:cebc0d70-3dd3-4cf1-b557-d2463956481d','2023-08-18 12:47:01','2023-08-18 12:47:01','5570d3e4-3819-4e92-a30a-fdd7b8fde95e'),(62,'savepeerentries:ebc5cd70-5a45-4a98-880d-5321ee91b384','2023-08-18 12:47:01','2023-08-18 12:47:01','17be0dd0-25f0-41ed-859c-fc1634053baf'),(63,'savepeerentrydrafts:00f6a53d-3397-471a-9166-7be712892d40','2023-08-18 12:47:01','2023-08-18 12:47:01','e6031ce5-484c-43b3-98c5-035fe226de5c'),(64,'savepeerentrydrafts:24af7e7f-3b66-4f65-b596-3c1c1bc4161f','2023-08-18 12:47:01','2023-08-18 12:47:01','75d23cdb-0a7e-4d60-8f9f-c26431feb02e'),(65,'savepeerentrydrafts:71fe53ec-55f3-40b6-b998-45c3eb68c152','2023-08-18 12:47:01','2023-08-18 12:47:01','62ffbdce-a558-41f4-8aa9-5a8197eb1466'),(66,'savepeerentrydrafts:9e78a6d6-4c8a-4a13-ace9-37db731411ed','2023-08-18 12:47:01','2023-08-18 12:47:01','cdb11a5d-499c-4282-8b15-0d3edc11121f'),(67,'savepeerentrydrafts:a9a0256f-eaa0-46c1-a448-3cb2e9e2094d','2023-08-18 12:47:01','2023-08-18 12:47:01','866b2fa8-dbdf-4678-81f3-764c41d76ea6'),(68,'savepeerentrydrafts:b97a5d63-cd57-4795-90f0-c696853b0a2a','2023-08-18 12:47:01','2023-08-18 12:47:01','e6a99dac-8850-4496-a14a-92cf4dd10b11'),(69,'savepeerentrydrafts:cab6a5e7-0058-4313-8673-18284e710686','2023-08-18 12:47:01','2023-08-18 12:47:01','b6e233c0-eff7-4df7-bff1-cb382e9fb5f8'),(70,'savepeerentrydrafts:cebc0d70-3dd3-4cf1-b557-d2463956481d','2023-08-18 12:47:01','2023-08-18 12:47:01','7774f1d0-0843-4ecc-8628-06a477d7ff6d'),(71,'savepeerentrydrafts:ebc5cd70-5a45-4a98-880d-5321ee91b384','2023-08-18 12:47:01','2023-08-18 12:47:01','5c150493-e73f-4556-afbe-de975122b341'),(72,'savepeerentrydrafts:ebcb4d30-fdc2-479e-b7b2-9fc7942764a0','2023-08-18 12:47:01','2023-08-18 12:47:01','dbbcbb44-9914-431f-9ada-5a7347934752'),(73,'viewassets:8ce61d6f-c2a3-4076-bb14-40b900c685cf','2023-08-18 12:47:01','2023-08-18 12:47:01','a8eb894d-30e7-45d7-9fc7-c5a6ad254b35'),(74,'viewentries:00f6a53d-3397-471a-9166-7be712892d40','2023-08-18 12:47:01','2023-08-18 12:47:01','07d86d72-e359-4e1d-aac4-5c51164986cf'),(75,'viewentries:24af7e7f-3b66-4f65-b596-3c1c1bc4161f','2023-08-18 12:47:01','2023-08-18 12:47:01','6eede7fb-c35f-4abe-87c0-121a2a7038b2'),(76,'viewentries:71fe53ec-55f3-40b6-b998-45c3eb68c152','2023-08-18 12:47:01','2023-08-18 12:47:01','19520d05-fef9-47ca-8a9d-d95f2f6f19dd'),(77,'viewentries:9e78a6d6-4c8a-4a13-ace9-37db731411ed','2023-08-18 12:47:01','2023-08-18 12:47:01','fadd3973-e72e-4e74-85a1-eb89d064b3ec'),(78,'viewentries:a9a0256f-eaa0-46c1-a448-3cb2e9e2094d','2023-08-18 12:47:01','2023-08-18 12:47:01','9f1ce9f8-7cda-462f-a234-6df97a0ba3a5'),(79,'viewentries:b97a5d63-cd57-4795-90f0-c696853b0a2a','2023-08-18 12:47:01','2023-08-18 12:47:01','1f4d3761-b9d3-466d-aea7-79b1d39e6eb1'),(80,'viewentries:cab6a5e7-0058-4313-8673-18284e710686','2023-08-18 12:47:01','2023-08-18 12:47:01','38b0a77e-f904-40d4-b464-aad6dac7f493'),(81,'viewentries:cebc0d70-3dd3-4cf1-b557-d2463956481d','2023-08-18 12:47:01','2023-08-18 12:47:01','61591a99-7f94-407f-b4e3-8303540dec25'),(82,'viewentries:ebc5cd70-5a45-4a98-880d-5321ee91b384','2023-08-18 12:47:01','2023-08-18 12:47:01','0ee4b16e-14cb-4050-807b-accc4ef2f406'),(83,'viewentries:ebcb4d30-fdc2-479e-b7b2-9fc7942764a0','2023-08-18 12:47:01','2023-08-18 12:47:01','df524b92-8a35-4f06-9fd3-04fdec9194e2'),(84,'viewpeerassets:8ce61d6f-c2a3-4076-bb14-40b900c685cf','2023-08-18 12:47:01','2023-08-18 12:47:01','b9da3af1-30f9-4616-9c7e-e75deb1c7a4f'),(85,'viewpeerentries:71fe53ec-55f3-40b6-b998-45c3eb68c152','2023-08-18 12:47:01','2023-08-18 12:47:01','7a3b4349-1f8c-48b3-9b5d-2a03889e3b04'),(86,'viewpeerentries:9e78a6d6-4c8a-4a13-ace9-37db731411ed','2023-08-18 12:47:01','2023-08-18 12:47:01','420eba8a-ff6c-407f-97d6-04a07acced07'),(87,'viewpeerentries:b97a5d63-cd57-4795-90f0-c696853b0a2a','2023-08-18 12:47:01','2023-08-18 12:47:01','4bfac31e-5aae-41ae-84fc-21236f18ee97'),(88,'viewpeerentries:cebc0d70-3dd3-4cf1-b557-d2463956481d','2023-08-18 12:47:01','2023-08-18 12:47:01','2795d4d9-2b4e-4e33-b9ae-eea164180ef9'),(89,'viewpeerentries:ebc5cd70-5a45-4a98-880d-5321ee91b384','2023-08-18 12:47:01','2023-08-18 12:47:01','b6728d69-7d50-4184-a4a5-45d69ca332d9'),(90,'viewpeerentrydrafts:00f6a53d-3397-471a-9166-7be712892d40','2023-08-18 12:47:01','2023-08-18 12:47:01','8749a8b2-9170-41c7-931e-901ba0ffd083'),(91,'viewpeerentrydrafts:24af7e7f-3b66-4f65-b596-3c1c1bc4161f','2023-08-18 12:47:01','2023-08-18 12:47:01','f8de64ce-e2f5-4491-ab47-8889ff692c17'),(92,'viewpeerentrydrafts:71fe53ec-55f3-40b6-b998-45c3eb68c152','2023-08-18 12:47:01','2023-08-18 12:47:01','55ab074f-2e20-47e2-8947-3f586bc3e2ea'),(93,'viewpeerentrydrafts:9e78a6d6-4c8a-4a13-ace9-37db731411ed','2023-08-18 12:47:01','2023-08-18 12:47:01','4d5f4c4b-1821-4e7c-9192-da0ad705338a'),(94,'viewpeerentrydrafts:a9a0256f-eaa0-46c1-a448-3cb2e9e2094d','2023-08-18 12:47:01','2023-08-18 12:47:01','0bf0edc6-a043-416e-984a-96a0a0038ecd'),(95,'viewpeerentrydrafts:b97a5d63-cd57-4795-90f0-c696853b0a2a','2023-08-18 12:47:01','2023-08-18 12:47:01','be06a657-c0d8-4c89-bd5a-73908dc4cea1'),(96,'viewpeerentrydrafts:cab6a5e7-0058-4313-8673-18284e710686','2023-08-18 12:47:01','2023-08-18 12:47:01','c4afa7d9-eef1-4a20-a3d9-366aa5bc7aff'),(97,'viewpeerentrydrafts:cebc0d70-3dd3-4cf1-b557-d2463956481d','2023-08-18 12:47:01','2023-08-18 12:47:01','3ddd85b2-ec12-410d-a0fc-1285bfd8245d'),(98,'viewpeerentrydrafts:ebc5cd70-5a45-4a98-880d-5321ee91b384','2023-08-18 12:47:01','2023-08-18 12:47:01','9649f3c2-2096-4263-9e66-2da5dd5a00a5'),(99,'viewpeerentrydrafts:ebcb4d30-fdc2-479e-b7b2-9fc7942764a0','2023-08-18 12:47:01','2023-08-18 12:47:01','e76742af-2e82-4e57-979e-e8215495dce4');
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (26,'{\"language\":\"de\",\"locale\":null,\"weekStartDay\":\"1\",\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false,\"notificationDuration\":\"5000\",\"showFieldHandles\":false,\"enableDebugToolbarForSite\":false,\"enableDebugToolbarForCp\":false,\"showExceptionView\":false,\"profileTemplates\":false}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (26,NULL,1,0,0,0,1,'admin','',NULL,NULL,'superuser@todolist.test','$2y$13$BKY3W76bg4gNvkTLR1AYSuTattwVpiDppoe28Sjky9uubH3VVK.vq','2023-09-12 07:25:03',NULL,NULL,NULL,'2023-09-12 07:24:37',NULL,1,NULL,NULL,NULL,0,'2023-09-11 13:34:22','2023-08-18 12:47:04','2023-09-12 07:25:03');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'Files',NULL,'2023-08-18 12:47:01','2023-08-18 12:47:01','dd4bfb82-e87c-4c98-98b1-63071f52b6dc'),(2,NULL,NULL,'Temporäres Dateisystem',NULL,'2023-08-18 12:49:25','2023-08-18 12:49:25','60f0fccc-36ee-4673-bcfc-4cc47b5699fc'),(3,2,NULL,'user_26','user_26/','2023-08-18 12:49:25','2023-08-18 12:49:25','96289e5a-ecab-43fd-a373-42148fb680bf');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES (1,1,'Files','files','files','files','','site',NULL,2,'2023-08-18 12:47:01','2023-08-18 12:47:01','2023-09-11 13:18:12','8ce61d6f-c2a3-4076-bb14-40b900c685cf');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,26,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2023-08-18 12:47:14','2023-08-18 12:47:14','51c497c2-df15-480e-9215-292441b91eb7'),(2,26,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2023-08-18 12:47:14','2023-08-18 12:47:14','7fd3fbb4-08ed-4746-b3f4-892fd7887436'),(3,26,'craft\\widgets\\Updates',3,NULL,'[]',1,'2023-08-18 12:47:14','2023-08-18 12:47:14','e870c103-67f2-4735-a6b7-470e09d88328'),(4,26,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https:\\/\\/craftcms.com\\/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2023-08-18 12:47:14','2023-08-18 12:47:14','b88af7a3-8457-4fe3-a581-73fb1230524b');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'todolist'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-12 14:30:31
