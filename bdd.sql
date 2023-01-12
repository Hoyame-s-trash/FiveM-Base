-- --------------------------------------------------------
-- Host:                         51.254.34.28
-- Server version:               10.3.31-MariaDB-0+deb10u1 - Debian 10
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for bluestark
CREATE DATABASE IF NOT EXISTS `bluestark` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `bluestark`;

-- Dumping structure for table bluestark.account_info
CREATE TABLE IF NOT EXISTS `account_info` (
  `account_id` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT 'NULL',
  `license` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `steam` varchar(22) COLLATE utf8mb4_bin DEFAULT NULL,
  `xbl` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `discord` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `live` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `fivem` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `ip` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `guid` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL,
  `first_connection` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`account_id`),
  UNIQUE KEY `license` (`license`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.account_info: 74 rows
/*!40000 ALTER TABLE `account_info` DISABLE KEYS */;
REPLACE INTO `account_info` (`account_id`, `license`, `steam`, `xbl`, `discord`, `live`, `fivem`, `name`, `ip`, `guid`, `first_connection`) VALUES
	('User:1976036', 'license:676c7031a7e3c4b1fe6d534ebfbfe1ae4af49d16', '', '', 'discord:924550172514594836', '', 'fivem:5455839', 'User', '92.138.45.107', '148618792389480086', '2022-02-28 21:01:17'),
	('Mathilde:4077161', 'license:01b9eff04a01a7c8323354399d699764c24cb7d7', '', '', 'discord:937117988421763113', 'live:844426058859926', '', 'Mathilde', '88.126.209.105', '148618792123748119', '2022-02-28 21:03:44'),
	('𝗞𝗶𝗿𝗮𝗥𝗼𝗼𝘁:7779215', 'license:222c46fedf9fa74880e63ab731894be3fb57c497', '', '', 'discord:809158312372862977', 'live:1829579117791637', '', '𝗞𝗶𝗿𝗮𝗥𝗼𝗼𝘁', '91.167.250.77', '148618792002650477', '2022-02-28 21:05:28'),
	('jrt:8423938', 'license:043f73f4798aed626c424694b0906308ec92ff57', '', '', 'discord:843458928264478720', '', 'fivem:2569297', 'jrt', '86.237.35.70', '148618792200576258', '2022-02-28 21:06:51'),
	('kamikaz13ttm:6287079', 'license:4d292c606a1a81d2aa4d0b4a9c49672d181b584b', '', '', 'discord:864472361122004992', '', '', 'kamikaz13ttm', '88.125.68.134', '148618792005318618', '2022-02-28 21:13:13'),
	('RTRTRTRTRTR:7138449', 'license:3b812812ad65ece34da9a84c3d7aa2bb1257f2a7', '', '', '', '', 'fivem:3250793', 'RTRTRTRTRTRTR', '85.190.73.79', '148618791998747071', '2022-02-28 23:07:50'),
	('Raphael Maserati:718837', 'license:521045187680e125d6b9fb3f7f8e035bb1c3a1bc', '', '', 'discord:442100275608813580', '', 'fivem:1966824', 'Raphael Maserati', '83.194.156.206', '148618792222098961', '2022-02-28 23:13:24'),
	('Ybraza:607198', 'license:6721de1bfa6ecbee9c42da164dd605ab12a5888b', '', 'xbl:2535449092332833', 'discord:721083771805368533', 'live:844425413813863', 'fivem:1864100', 'Ybraza', '89.158.194.98', '148618792926666508', '2022-03-01 11:54:28'),
	('JUJU9483:976590', 'license:e2de678052207ebcd04958796c64c342b52d881b', '', '', '', '', '', 'JUJU9483', '176.133.239.227', '148618792004951352', '2022-03-01 13:37:57'),
	('Tealer🧸:4038715', 'license:6dc71e62b9efbdfe5ecb14fad5d0a6cf933e4e1e', '', 'xbl:2533274925503009', 'discord:721460771325739028', 'live:1829582128876922', '', 'Tealer🧸', '90.103.233.195', '148618792006633977', '2022-03-01 18:11:25'),
	('ANTON:7658199', 'license:e464bd067da5d5e39ce2a3356afeb1b02c812120', '', '', 'discord:942119604212338698', '', '', 'ANTON', '84.5.27.25', '148618791999933135', '2022-03-01 19:32:21'),
	('mukhrizrayqal1:6660027', 'license:c3ada4696ac66d202eaf399e70c4893be35499a9', '', '', 'discord:869819799646130239', 'live:914798606761936', 'fivem:5088331', 'mukhrizrayqal1', '60.50.182.120', '148618792015354696', '2022-03-02 08:09:32'),
	('Cedric:8497509', 'license:a3d6b1bf1c0c672cc288c0bdc653026fcd651a5a', '', '', 'discord:302797166114635778', '', '', 'Cedric', '81.250.53.116', '148618792144763530', '2022-03-02 11:15:52'),
	('enzofaviez659:8920285', 'license:a01595b8d5df8cd63a664cf9466cd6f2edcd4615', '', '', 'discord:549733366791143435', '', 'fivem:2342655', 'enzofaviez659', '78.212.219.121', '148618792005899227', '2022-03-02 12:31:17'),
	('Mäyrä69:6043243', 'license:ec693edefc4803748e5eb716542535da14cd64ad', '', '', 'discord:683687429059772470', '', 'fivem:2463443', 'Mäyrä69', '85.76.39.239', '148618792236043212', '2022-03-02 14:02:46'),
	('misamigo83:511557', 'license:84bf89ec01ebc2beebd249d27a292d485af7a22d', '', 'xbl:2535451311423898', 'discord:936008058792972368', 'live:985154002939437', 'fivem:5457677', 'misamigo83', '90.119.50.133', '148618792016779696', '2022-03-02 15:25:07'),
	('sihem:9168687', 'license:447dea642a5a99636e9d66ae0607fbf35563d3d2', '', '', '', 'live:985154360431676', '', 'sihem', '82.142.21.135', '148618792002365040', '2022-03-02 15:25:38'),
	('33652:2231563', 'license:4d3d0f2b343cdf45ff0b7089a4859ea99e183cfa', '', 'xbl:2535453450873728', 'discord:916762035302326272', 'live:1055519386681847', 'fivem:6040893', '33652', '78.216.169.223', '148618792003789697', '2022-03-02 16:31:36'),
	('JeSaisPas:242828', 'license:3990e692cecfc4935f9d1af7311017c90e9475d2', '', '', 'discord:434388125071048704', '', '', 'JeSaisPas', '90.62.255.75', '148618792017433384', '2022-03-02 20:29:32'),
	('Mn6:3644257', 'license:4b4fcf49c6967afd572191f73919f593bcf6d4c2', '', '', '', '', '', 'Mn6', '37.120.218.142', '148618791998742915', '2022-03-02 22:50:54'),
	('Tahia Serbia:9267751', 'license:c48b0294f78a28f6f264a7adfa68a5b3f4cdc4f9', '', '', 'discord:431330093059670016', 'live:914798258421006', '', 'Tahia Serbia', '77.152.41.3', '148618792043878869', '2022-03-02 23:34:02'),
	('Kurts:3331105', 'license:d5978481098e92d4daafbbef17620e54dec79196', '', 'xbl:2535440066618504', 'discord:719878867363561543', 'live:844426148419230', '', 'Kurts', '88.121.136.162', '148618791999176423', '2022-03-02 23:34:05'),
	('dike:2942622', 'license:c036013c3d6f5a5e951dfc69633cdbc51ddf4232', '', '', '', '', '', 'dike', '83.141.160.246', '148618792106312634', '2022-03-03 11:59:43'),
	('suuuu89:1610414', 'license:697abf7a9220e04e5568b31ce0a1c2d7c254aef0', '', 'xbl:2535427837142610', '', 'live:985154336533991', '', 'suuuu89', '84.6.120.85', '148618792353570962', '2022-03-03 12:58:57'),
	('_nietoojr:9860769', 'license:840e2bbb73619a49876134911513efcd6e975c6c', '', 'xbl:2535405131403413', 'discord:592456657238229085', 'live:914798153453937', '', '_nietoojr', '79.109.32.121', '148618792360025024', '2022-03-03 13:46:08'),
	('Vabby619:5085134', 'license:d80851eee734ec68d5e68d34fe8cca12157f4b33', '', '', 'discord:531400514961932308', 'live:914801446799804', 'fivem:5891322', 'Vabby619', '36.255.134.24', '148618791998316556', '2022-03-03 17:45:38'),
	('EvAn-2k:6080874', 'license:d6f8dfab3eeed454c6c9e7aac3d9af556e1ace6f', '', 'xbl:2535415014960591', 'discord:907029092992434196', 'live:1055518639013098', 'fivem:6026534', 'EvAn-2k', '178.238.165.128', '148618791998528422', '2022-03-03 20:55:38'),
	('gaming:8130952', 'license:1000023c908f83a689e46797f0b9c91dcb4c30c7', '', 'xbl:2535411512165654', '', 'live:844424988207766', 'fivem:5774932', 'gaming', '31.35.226.19', '148618792098170885', '2022-03-03 22:55:24'),
	('User:9313903', 'license:afaba2ad9bca10e18363adece691fdecbcababee', '', '', '', '', '', 'User', '92.138.45.107', '148618792039715259', '2022-03-04 13:08:32'),
	('thom-vinu:5524933', 'license:2075dd87c93cfae3f8ba1fccd05f16c6ed30a7d1', '', '', 'discord:814063393128316958', '', '', 'thom-vinu', '91.69.177.213', '148618792011017993', '2022-03-04 21:27:29'),
	('Flaaw.N:4693705', 'license:d7b1a029b3e0d095633bb27dc9f31e5ac130ca62', '', 'xbl:2535465957564644', 'discord:443821639688257556', 'live:1055519005688167', '', 'Flaaw.N', '86.194.94.15', '148618792957650524', '2022-03-04 22:44:40'),
	('TR17x:6627841', 'license:23eb122fbc001b121afd443767a90c32ce8d58b2', '', 'xbl:2535464617031862', 'discord:369307661633716225', 'live:985154717120188', 'fivem:1644206', 'TR17x', '193.32.126.156', '148618792003111133', '2022-03-05 00:34:28'),
	('[12] Karl Brown :9783241', 'license:17f2b8a5c19f26e1e136c114dfe204bc708ee87e', '', '', 'discord:743046086603702283', '', '', '[12] Karl Brown ', '5.51.171.188', '148618792027824086', '2022-03-05 00:37:34'),
	('Utilisateur:9818478', 'license:74722e5d83c23057107334ec41dc2c5539369201', '', '', '', '', '', 'Utilisateur', '185.65.134.164', '148618792180517836', '2022-03-05 08:37:03'),
	('oscar:9939098', 'license:1543c0430465cae3b2710706634749fbcfd7c567', '', '', 'discord:481058976491110411', '', '', 'oscar', '90.120.217.47', '148618792562678135', '2022-03-05 10:03:37'),
	('suiiii:4988199', 'license:f5788bac547691e212faa76eb9e71f46da796d50', '', '', 'discord:926270289258639410', '', 'fivem:2861213', 'suiiii', '178.51.106.81', '148618792019759180', '2022-03-05 10:06:24'),
	('Alexis Smith:5284950', 'license:5b545b297e209cdabcc80b0d8644571fd87de093', '', 'xbl:2535405761483185', 'discord:414376587228741634', 'live:914802209641398', '', 'Alexis Smith', '77.57.144.250', '148618792566982071', '2022-03-05 12:07:59'),
	('Bijou:5865031', 'license:d9725f63efe9d0d53a0883c78cb79f14db186780', '', '', '', '', '', 'Bijou', '86.233.147.50', '148618792156970915', '2022-03-05 12:11:31'),
	('Larry Climbton:8448015', 'license:8b2dd308c0f10d32e5a363e13f7d1d016161668f', '', '', 'discord:515550745014304768', '', 'fivem:4770967', 'Larry Climbton', '176.148.43.67', '148618792516474446', '2022-03-05 13:28:44'),
	('MrGlaSiFiK:1473661', 'license:373c22c77f824fb1baaa5b5e440784e783ba5909', '', '', 'discord:776926902455762995', '', '', 'MrGlaSiFiK', '70.80.78.52', '148618791998636728', '2022-03-05 15:29:39'),
	('walid ?!?!?!:4103882', 'license:bbc0fc851bd6325305eb508cbc5cf3baa8c63935', '', 'xbl:2533274998645532', 'discord:786293584218685470', 'live:1829582278455254', '', 'walid ?!?!?!', '88.125.224.145', '148618793069360149', '2022-03-05 15:32:30'),
	('Psyko™:2489457', 'license:c4944ebf815dd739cdc2bfd18688588ab7bb2717', '', 'xbl:2535441534094412', 'discord:538048409274286091', 'live:844425386119915', 'fivem:6232738', 'Psyko™', '78.21.15.171', '148618792059993682', '2022-03-05 15:57:07'),
	('lostboyz16:3396964', 'license:a0e80b30c01ed966e9e9af43980587c7b526bace', '', 'xbl:2535427329686933', 'discord:853155587507617802', 'live:985154477644394', 'fivem:6227664', 'lostboyz16', '75.134.92.230', '148618791998536462', '2022-03-05 18:15:50'),
	('Paul Carlos:6520160', 'license:eedfbe386f9079e33bacfdf58668d25ec7d05d41', '', '', 'discord:772114761323249694', '', '', 'Paul Carlos', '92.167.21.59', '148618792035399634', '2022-03-05 18:57:32'),
	('zizou !:1173729', 'license:d4e9cbeaacc2b0ce1d1c8ce7f53ee71b8183867c', '', 'xbl:2535448260990745', 'discord:789839586838708225', 'live:914802147702681', '', 'zizou !', '2.9.214.30', '148618792027647680', '2022-03-05 19:16:03'),
	('.thomas:1106447', 'license:c72cff57a91b2544ff9f7230c11bc1bf020e68e8', '', '', 'discord:937352994368921691', 'live:1055519430249134', 'fivem:5834540', '.thomas', '176.181.69.200', '148618792003097432', '2022-03-05 19:21:21'),
	('BagouLskuuu:4245362', 'license:efd104ae3a0f12892e88c17f63c0d08cd80f2b49', '', 'xbl:2535419931566788', 'discord:714081227233034260', 'live:1899947292865098', '', 'BagouLskuuu', '86.210.177.60', '148618793222235807', '2022-03-05 19:35:06'),
	('Hyperking:3583114', 'license:17d8f0a88f62475eac0559a09a7a06355ba9b2ec', '', 'xbl:2535455803110746', 'discord:725775310150303854', 'live:1055518819569776', 'fivem:6236408', 'Hyperking', '217.210.239.194', '148618792354276009', '2022-03-05 21:50:47'),
	('alpha:7031670', 'license:6b4fbc2620bf3fe8fe144b88ecde934e50ac49c9', '', '', 'discord:687542304789364747', '', '', 'alpha', '88.170.253.207', '148618792031057868', '2022-03-06 01:00:52'),
	('juanito santacruz:4501956', 'license:44730fcd67e41f528b8916be9fdce29964561530', '', '', 'discord:699317984337854464', '', 'fivem:5344000', 'juanito santacruz', '91.166.194.136', '148618792076160918', '2022-03-06 01:03:32'),
	('kanoc2004:1573565', 'license:7fb7a8c688efa376a4c6158317d714cc887f3181', '', 'xbl:2535411668619538', 'discord:633068987827355670', 'live:985153967194032', '', 'kanoc2004', '109.15.173.26', '148618792942887227', '2022-03-06 01:35:20'),
	('robyy942:1221647', 'license:07091b465a1b387c8a6d6968d6c841dcaeae2d57', '', '', 'discord:749205368516640768', 'live:985154949747544', 'fivem:6176591', 'robyy942', '85.168.57.200', '148618793163724008', '2022-03-06 02:12:40'),
	('Iamtyzed:3940313', 'license:cf5d504aad8457773961dd28b37ce37e16db8923', '', 'xbl:2535455540554527', 'discord:416273017333874699', 'live:1829582761324033', '', 'Iamtyzed', '178.195.71.119', '148618792277980706', '2022-03-06 02:54:43'),
	('4isy4eburek:1030486', 'license:c33553d0860e631beb5586d1947bb3ccdbdb4ce4', '', '', 'discord:502166880203833344', '', 'fivem:6234245', '4isy4eburek', '128.74.18.67', '148618792067232305', '2022-03-06 09:31:41'),
	('великан:6628768', 'license:ca1d88031d0d25bcca2ab217cbe329177c25cff9', '', '', '', '', '', 'великан', '31.8.243.253', '148618792017374915', '2022-03-06 15:49:56'),
	('MIHAWK:6752961', 'license:ebcb087c3a9dd8b82504b773f62d865e9e92a321', '', '', '', 'live:1055519432161704', 'fivem:5702120', 'MIHAWK', '91.182.140.6', '148618792055781557', '2022-03-06 16:12:50'),
	('Dominiel:7170890', 'license:b82e05df15bf479634a9bb215a6f22a4ff04dead', '', '', '', 'live:1829578975043256', '', 'Dominiel', '176.139.104.132', '148618793927834493', '2022-03-06 16:29:41'),
	('HP:6284353', 'license:5203102308639a36633cfce5e4a45ac9bab82a93', '', '', '', '', '', 'HP', '109.122.23.126', '148618794003695105', '2022-03-06 18:11:03'),
	('JeremyLinDeOuf:4708263', 'license:63b7781c2a1bc429c70113ad64f73ae69ce0a789', '', '', 'discord:884907868413894716', '', 'fivem:4153019', 'JeremyLinDeOuf', '37.166.22.105', '148618792461783649', '2022-03-06 20:12:59'),
	('exT:2266740', 'license:5cf86f40a7778e07716873096ada8da67663ce5b', '', 'xbl:2535425135427220', 'discord:844877254865846342', 'live:914798730551930', 'fivem:3621131', 'exT', '86.63.207.126', '148618792541377071', '2022-03-06 20:16:42'),
	('sabri:5010961', 'license:5e6b1e3c9912bca10bbf0a2258cab659480d5e21', '', 'xbl:2535464280591449', '', 'live:914800242668108', 'fivem:6112614', 'sabri', '184.160.37.132', '148618792502379197', '2022-03-06 20:44:44'),
	('Uncle Rooster:8603604', 'license:42514dcf5b5f34d8d249a01f66ccdffec3f74833', '', '', '', '', '', 'Uncle Rooster', '206.172.155.45', '148618792026056645', '2022-03-06 21:54:16'),
	('Abdiii_IchKannNichtMeeehr:5311820', 'license:92862d3cf35ecd4d03e9a118d7dfe1c54d32ccbf', '', 'xbl:2535471170696507', 'discord:400577128732688384', 'live:1055518881472858', 'fivem:4599800', 'Abdiii_IchKannNichtMeeehr', '88.130.152.169', '148618792348884682', '2022-03-06 22:03:19'),
	('aouarx:5616397', 'license:f57cbaffc364f51fc165f2a95dad2b59b43aa3c8', '', '', 'discord:424983682684682240', '', '', 'aouarx', '88.166.50.248', '148618792004825010', '2022-03-07 10:44:57'),
	('❤ 6\'Jeyroz ❤:5713918', 'license:6339c1a2cfbb27bdea9586377d4537d3fbda3e61', '', 'xbl:2535451082382783', 'discord:798974725479989319', 'live:985154917832797', 'fivem:3621964', '❤ 6\'Jeyroz ❤', '89.40.183.222', '148618792003723649', '2022-03-07 13:47:54'),
	('jan:2121773', 'license:33d330aae30191a8ae6fe52c2015d5a6576f3d59', '', '', '', 'live:1055519461170880', 'fivem:4862622', 'jan', '77.189.6.191', '148618792011435542', '2022-03-07 16:24:24'),
	('Xx-jey147-xX:5734705', 'license:08bee9809c7e7f8bfdcd7b840afc08b58279f780', '', '', '', 'live:1055519104466164', '', 'Xx-jey147-xX', '84.192.210.70', '148618792075471899', '2022-03-07 16:38:44'),
	('lunecs:4906031', 'license:5839bd0648b6519bb31d5e395685d41d4b96cf35', '', 'xbl:2535411116459733', 'discord:607608574440636463', 'live:914798038384333', '', 'lunecs', '5.79.176.43', '148618792008524305', '2022-03-07 16:54:08'),
	('Witte1603:7506198', 'license:80019cf46f860351cfd79dc1d174f4e52f234034', '', '', 'discord:543022783131549697', '', '', 'Witte1603', '84.193.80.209', '148618791999505430', '2022-03-07 17:42:27'),
	('loeldqd:6937648', 'license:12374a551ca0dc681bed492fe4cd1fc449f757c7', '', '', 'discord:645329808078929920', 'live:985154410991940', '', 'loeldqd', '88.125.191.13', '148618792073250385', '2022-03-13 21:33:04'),
	('kilanono7500:3320332', 'license:e7b2e663bbf6a24a12b25818893434f812b9c45b', '', '', '', '', '', 'kilanono7500', '195.200.221.138', '148618792031356805', '2022-03-08 01:11:22'),
	('Gautam:4586718', 'license:4108734c231c4d79813c0dba44ad9533d79b2bcc', '', 'xbl:2535437764192385', '', 'live:914798436024728', '', 'Gautam', '49.36.208.213', '148618792170548196', '2022-03-08 08:28:38'),
	('Penka_06:7438206', 'license:4e2da4d529d2cc3f1c508c526e90d3158e921f98', '', 'xbl:2535458600919242', 'discord:837670681432555542', 'live:985153886365786', 'fivem:5585158', 'Penka_06', '188.22.184.183', '148618791998895618', '2022-03-08 13:59:24'),
	('zouho:6937648', 'license:0952c2029a28248d70dc879a193c1b91aa5475fe', '', 'xbl:2535466634479191', 'discord:643225867929124874', 'live:1055518324641171', 'fivem:162857', 'zouho', '192.168.1.128', '148618792099851758', '2022-03-08 21:55:31');
/*!40000 ALTER TABLE `account_info` ENABLE KEYS */;

-- Dumping structure for table bluestark.activity
CREATE TABLE IF NOT EXISTS `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `recolte` varchar(255) NOT NULL,
  `itemrecolte` varchar(255) NOT NULL,
  `traitement` varchar(255) NOT NULL,
  `itemtraitement` varchar(255) NOT NULL,
  `vente` varchar(255) NOT NULL,
  `PrixVente` varchar(255) NOT NULL,
  `illegal` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- Dumping data for table bluestark.activity: ~10 rows (approximately)
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
REPLACE INTO `activity` (`id`, `name`, `recolte`, `itemrecolte`, `traitement`, `itemtraitement`, `vente`, `PrixVente`, `illegal`) VALUES
	(2, 'weed', '{"x":31.27277755737304,"y":-2667.106689453125,"z":12.04505538940429}', 'weedrecolte', '{"x":-1111.37646484375,"y":-1502.091796875,"z":4.66370296478271}', 'weedtraitement', '{"x":-482.4582824707031,"y":-59.58736419677734,"z":39.9942398071289}', '320', 1),
	(3, 'cocaine', '{"x":282.6789855957031,"y":957.7946166992188,"z":211.0804901123047}', 'cocainerecolte', '{"x":209.89527893066407,"y":-167.01527404785157,"z":56.34303665161133}', 'cocainetraitement', '{"x":1243.533935546875,"y":-406.6790466308594,"z":69.07044982910156}', '450', 1),
	(4, 'meth', '{"x":178.45663452148438,"y":306.67047119140627,"z":105.37268829345703}', 'methrecolte', '{"x":-1218.248046875,"y":-1038.2265625,"z":8.30748081207275}', 'methtraitement', '{"x":-584.2725830078125,"y":-1769.221435546875,"z":22.55022621154785}', '500', 1),
	(5, 'opium', '{"x":881.9929809570313,"y":-1049.1971435546876,"z":33.00664138793945}', 'opiumrecolte', '{"x":-172.24,"y":6393.62,"z":31.49}', 'opiumtraitement', '{"x":-2018.26953125,"y":559.4827270507813,"z":108.23575592041016}', '650', 1),
	(6, 'Acier', '{"x":99.9797134399414,"y":-385.5039367675781,"z":41.35879516601562}', 'acierrecolte', '{"x":985.1104125976563,"y":-1921.376220703125,"z":31.13475227355957}', 'aciertraitement', '{"x":1189.2579345703126,"y":-3106.40966796875,"z":5.60704326629638}', '200', 0),
	(9, 'chargeurs', '{"x":-1129.6295166015626,"y":2692.88623046875,"z":18.80039978027343}', 'munition', '{"x":2348.37939453125,"y":3129.73583984375,"z":48.20872497558594}', 'chargeur', '{"x":2579.120361328125,"y":285.478759765625,"z":108.60669708251953}', '650', 1),
	(11, 'Alcool de Contrebande', '{"x":1503.29150390625,"y":-2147.500732421875,"z":77.0833740234375}', 'alcoolbrut', '{"x":2842.4033203125,"y":1456.9300537109376,"z":24.73579788208007}', 'alcooldecontrebande', '{"x":-1112.0010986328126,"y":-1045.4461669921876,"z":2.15035724639892}', '650', 1),
	(18, 'Bois', '{"x":-1576.7823486328126,"y":4507.48876953125,"z":20.56352043151855}', 'bois', '{"x":-507.96954345703127,"y":5270.77880859375,"z":80.61013793945313}', 'papier', '{"x":32.45044708251953,"y":6446.63916015625,"z":31.42530822753906}', '200', 0),
	(19, 'Ketamine', '{"x":5380.74365234375,"y":-5386.08251953125,"z":43.52370834350586}', 'ketaminerecolte', '{"x":5115.94189453125,"y":-5171.02734375,"z":2.24529671669006}', 'ketaminetraitement', '{"x":-2223.023,"y":-365.7759,"z":13.3215}', '1150', 1),
	(20, 'Purple Haze', '{"x":-1163.66748046875,"y":-1565.7431640625,"z":4.42334938049316}', 'purplehazerecolte', '{"x":231.14903259277345,"y":-1752.74267578125,"z":28.98727035522461}', 'purplehazetraitement', '{"x":1695.8330078125,"y":-1517.975830078125,"z":112.93120574951172}', '650', 1);
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;

-- Dumping structure for table bluestark.addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.addon_account: ~63 rows (approximately)
/*!40000 ALTER TABLE `addon_account` DISABLE KEYS */;
REPLACE INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('property_dirtycash', 'Argent Sale Propriété', 0),
	('society_410th', '410 TH', 1),
	('society_667_ekip', '667 EKIP', 1),
	('society_777', '777', 1),
	('society_Bloods', 'bloods', 1),
	('society_CartelDeCali', 'CartelDeCali', 1),
	('society_Cosa Nostra', 'cosanostra', 1),
	('society_Crips', 'Crips', 1),
	('society_Madrazo', 'madrazo', 1),
	('society_ambulance', 'Ambulance', 1),
	('society_atlas', 'Atlas', 1),
	('society_avocat', 'Avocat', 1),
	('society_bahamas', 'Bahamas', 1),
	('society_ballas', 'Ballas', 1),
	('society_ballasg', 'Ballas Gang', 1),
	('society_blackjackets2', 'BlackJackets2', 1),
	('society_blackmarket', 'BlackMarket', 1),
	('society_blc', 'Blanchisseur', 1),
	('society_bloods', 'Bloods', 1),
	('society_bluedragon2', 'Blue Dragon2', 1),
	('society_boatshop', 'Concessionnaire Bateaux', 1),
	('society_camorra', 'Camorra', 1),
	('society_carshop', 'Concessionnaire Voitures', 1),
	('society_carteldesinaloa', 'Cartel de Sinaloa', 1),
	('society_comorra2', 'Comorra', 1),
	('society_cosanostra', 'La Cosa Nostra', 1),
	('society_families', 'Families', 1),
	('society_fbi', 'FBI', 1),
	('society_francsmacons', 'Frans-Maçons', 1),
	('society_hommenoir', 'Homme En Noir', 1),
	('society_hoova', 'Hoova', 1),
	('society_journalist', 'Journaliste', 1),
	('society_lacamorra', 'La Camorra', 1),
	('society_lamainnoir', 'La main Noir', 1),
	('society_lapegre', 'La Pégre', 1),
	('society_lesplagues', 'Les Plagues', 1),
	('society_losespadas', 'Los Espadas', 1),
	('society_lostmc', 'Lost MC', 1),
	('society_lostriples', 'Los Triples', 1),
	('society_marabunta', 'Marabunta', 1),
	('society_maracha', 'Maracha', 1),
	('society_mecano', 'Mécano', 1),
	('society_peakyblinders', 'Peaky Blinders', 1),
	('society_planeshop', 'Concessionnaire Avions', 1),
	('society_police', 'Police', 1),
	('society_punisher', 'punisher', 1),
	('society_punisher2', 'Punisher2', 1),
	('society_realestateagent', 'Agent immobilier', 1),
	('society_sheriff', 'Sheriff', 1),
	('society_southside', 'SouthSide', 1),
	('society_sylvester', 'Sylvester', 1),
	('society_tabac', 'Tabac', 1),
	('society_tata', 'tati', 1),
	('society_taxi', 'Taxi', 1),
	('society_unicorn', 'Unicorn', 1),
	('society_vagos', 'Vagos', 1),
	('society_vendetta2', 'Vendetta2', 1),
	('society_vigne', 'Vigneron', 1),
	('society_wader', 'Wader', 1),
	('society_widowmaker', 'WidowMaker', 1),
	('trunk_dirtycash', 'Argent Sale Coffre Véhicule', 0),
	('tt', 'AZA', 1),
	('yo', 'test', 1);
/*!40000 ALTER TABLE `addon_account` ENABLE KEYS */;

-- Dumping structure for table bluestark.addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `money` double NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_addon_account_data_account_name` (`account_name`(191)) USING BTREE,
  KEY `index_addon_account_data_account_name_owner` (`account_name`(191),`owner`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.addon_account_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `addon_account_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_account_data` ENABLE KEYS */;

-- Dumping structure for table bluestark.addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.addon_inventory: ~77 rows (approximately)
/*!40000 ALTER TABLE `addon_inventory` DISABLE KEYS */;
REPLACE INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('property', 'Propriété', 0),
	('society_410th', '410 TH', 1),
	('society_667_ekip', '667 EKIP', 1),
	('society_777', '777', 1),
	('society_Bloods', 'bloods', 1),
	('society_CJNG', 'cjng', 1),
	('society_Cali', 'Cartel de cali', 1),
	('society_CartelDeCali', 'CartelDeCali', 1),
	('society_Cosa Nostra', 'cosanostra', 1),
	('society_Crips', 'Crips', 1),
	('society_MS13', 'Mafia', 1),
	('society_Madrazo', 'madrazo', 1),
	('society_MerryWeather', 'Mercenaire', 1),
	('society_Opinel13', 'Opinel13', 1),
	('society_Predis', 'predis', 1),
	('society_Sinaloa', 'sinaloa', 1),
	('society_Yakuza', 'yakuza', 1),
	('society_ambulance', 'Ambulance', 1),
	('society_atlas', 'Atlas', 1),
	('society_avocat', 'Avocat', 1),
	('society_bahamas', 'Bahamas', 1),
	('society_bahamas_fridge', 'Bahamas (frigo)', 1),
	('society_ballas', 'Ballas', 1),
	('society_ballasg', 'Ballas Gang', 1),
	('society_blackjackets2', 'BlackJackets2', 1),
	('society_blackmarket', 'BlackMarket', 1),
	('society_blc', 'Blanchisseur', 1),
	('society_bloods', 'Bloods', 1),
	('society_bluedragon2', 'Blue Dragon2', 1),
	('society_boatshop', 'Concessionnaire Bateaux', 1),
	('society_camorra', 'Camorra', 1),
	('society_carshop', 'Concessionnaire Voitures', 1),
	('society_carteldesinaloa', 'Cartel de Sinaloa', 1),
	('society_comorra2', 'Comorra', 1),
	('society_cosanostra', 'La Cosa Nostra', 1),
	('society_families', 'Families', 1),
	('society_fbi', 'FBI', 1),
	('society_francsmacons', 'Frans-Maçons', 1),
	('society_gordo', 'Gordo', 1),
	('society_hommenoir', 'Homme En Noir', 1),
	('society_hoova', 'Hoova', 1),
	('society_journalist', 'Journaliste', 1),
	('society_lacamorra', 'La Camorra', 1),
	('society_lalegion', 'C.I.A', 1),
	('society_lamainnoir', 'La Main Noir', 1),
	('society_lapegre', 'La Pégre', 1),
	('society_lesplagues', 'Les Plagues', 1),
	('society_losespadas', 'Los Espadas', 1),
	('society_lostmc', 'Lost MC', 1),
	('society_lostriples', 'Los Triples', 1),
	('society_marabunta', 'Marabunta', 1),
	('society_maracha', 'Maracha', 1),
	('society_mecano', 'Mécano', 1),
	('society_merryweather', 'Aucun', 1),
	('society_peakyblinders', 'Peaky Blinders', 1),
	('society_planeshop', 'Concessionnaire Avions', 1),
	('society_police', 'Police', 1),
	('society_punisher', 'Punisher', 1),
	('society_punisher2', 'Punisher2', 1),
	('society_realestateagent', 'Agent immobilier', 1),
	('society_sheriff', 'Sheriff', 1),
	('society_southside', 'SouthSide', 1),
	('society_sylvester', 'Sylvester', 1),
	('society_tabac', 'Tabac', 1),
	('society_tata', 'tati', 1),
	('society_taxi', 'Taxi', 1),
	('society_unicorn', 'Unicorn', 1),
	('society_unicorn_fridge', 'Unicorn (frigo)', 1),
	('society_vagos', 'Vagos', 1),
	('society_vendetta2', 'Vendetta2', 1),
	('society_vigne', 'Vigneron', 1),
	('society_wader', 'Wader', 1),
	('society_widowmaker', 'WidowMaker', 1),
	('society_yiddish', 'Yiddish', 1),
	('trunk', 'Coffre Véhicule', 0),
	('tt', 'AZA', 1),
	('yo', 'test', 1);
/*!40000 ALTER TABLE `addon_inventory` ENABLE KEYS */;

-- Dumping structure for table bluestark.addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`) USING BTREE,
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`) USING BTREE,
  KEY `index_addon_inventory_inventory_name` (`inventory_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.addon_inventory_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `addon_inventory_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_inventory_items` ENABLE KEYS */;

-- Dumping structure for table bluestark.astra_luckwheel_paid
CREATE TABLE IF NOT EXISTS `astra_luckwheel_paid` (
  `license` varchar(80) NOT NULL,
  `ammount` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.astra_luckwheel_paid: ~0 rows (approximately)
/*!40000 ALTER TABLE `astra_luckwheel_paid` DISABLE KEYS */;
/*!40000 ALTER TABLE `astra_luckwheel_paid` ENABLE KEYS */;

-- Dumping structure for table bluestark.astra_luckywheel
CREATE TABLE IF NOT EXISTS `astra_luckywheel` (
  `license` varchar(80) NOT NULL,
  `time` int(255) NOT NULL,
  PRIMARY KEY (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.astra_luckywheel: ~0 rows (approximately)
/*!40000 ALTER TABLE `astra_luckywheel` DISABLE KEYS */;
/*!40000 ALTER TABLE `astra_luckywheel` ENABLE KEYS */;

-- Dumping structure for table bluestark.banlist
CREATE TABLE IF NOT EXISTS `banlist` (
  `licenseid` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `playerip` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `targetName` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `sourceName` varchar(32) COLLATE utf8mb4_bin DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `timeat` int(11) NOT NULL,
  `expiration` int(11) NOT NULL,
  `permanent` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`licenseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.banlist: ~0 rows (approximately)
/*!40000 ALTER TABLE `banlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `banlist` ENABLE KEYS */;

-- Dumping structure for table bluestark.banlisthistory
CREATE TABLE IF NOT EXISTS `banlisthistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `licenseid` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `playerip` varchar(25) COLLATE utf8mb4_bin DEFAULT NULL,
  `targetName` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `sourceName` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `timeat` int(11) NOT NULL,
  `expiration` int(11) NOT NULL,
  `permanent` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.banlisthistory: ~0 rows (approximately)
/*!40000 ALTER TABLE `banlisthistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `banlisthistory` ENABLE KEYS */;

-- Dumping structure for table bluestark.billing
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `sender` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `target_type` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_billing_identifier` (`identifier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.billing: ~2 rows (approximately)
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
REPLACE INTO `billing` (`id`, `identifier`, `sender`, `target_type`, `target`, `label`, `amount`) VALUES
	(1, 'license:44730fcd67e41f528b8916be9fdce29964561530', 'license:44730fcd67e41f528b8916be9fdce29964561530', 'society', 'unemployed', 'Excès de vitesse 35KMH', 15000),
	(2, 'license:6b4fbc2620bf3fe8fe144b88ecde934e50ac49c9', 'license:6b4fbc2620bf3fe8fe144b88ecde934e50ac49c9', 'society', 'unemployed', 'Excès de vitesse 114KMH', 15000);
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;

-- Dumping structure for table bluestark.calendrier
CREATE TABLE IF NOT EXISTS `calendrier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) CHARACTER SET armscii8 COLLATE armscii8_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.calendrier: ~0 rows (approximately)
/*!40000 ALTER TABLE `calendrier` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendrier` ENABLE KEYS */;

-- Dumping structure for table bluestark.cardealer_vehicles
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  `society` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT 'carshop',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3432 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.cardealer_vehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `cardealer_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardealer_vehicles` ENABLE KEYS */;

-- Dumping structure for table bluestark.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `dateofbirth` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `sex` varchar(1) COLLATE utf8mb4_bin NOT NULL DEFAULT 'M',
  `height` varchar(128) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_characters_identifier` (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.characters: ~0 rows (approximately)
/*!40000 ALTER TABLE `characters` DISABLE KEYS */;
/*!40000 ALTER TABLE `characters` ENABLE KEYS */;

-- Dumping structure for table bluestark.clothes_player
CREATE TABLE IF NOT EXISTS `clothes_player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `equip` varchar(50) DEFAULT 'n',
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.clothes_player: ~15 rows (approximately)
/*!40000 ALTER TABLE `clothes_player` DISABLE KEYS */;
REPLACE INTO `clothes_player` (`id`, `label`, `skin`, `identifier`, `type`, `equip`) VALUES
	(1, 'zdmolqjzd', '{"arms":4,"decals_1":7,"arms_2":0,"torso_1":18,"torso_2":0,"tshirt_2":0,"shoes_2":5,"shoes_1":26,"tshirt_1":22,"pants_1":23,"pants_2":1}', 'license:01b9eff04a01a7c8323354399d699764c24cb7d7', 'vetement', 'n'),
	(2, 'salut fdp', '{"arms":11,"decals_1":0,"arms_2":0,"torso_1":254,"torso_2":0,"tshirt_1":15,"tshirt_2":0,"shoes_2":0,"shoes_1":20,"pants_1":61,"pants_2":0}', 'license:676c7031a7e3c4b1fe6d534ebfbfe1ae4af49d16', 'vetement', 'n'),
	(3, 'voyou', '{"arms":1,"decals_1":0,"arms_2":0,"torso_1":505,"torso_2":0,"tshirt_1":15,"shoes_2":9,"pants_2":0,"tshirt_2":0,"pants_1":191,"shoes_1":35}', 'license:043f73f4798aed626c424694b0906308ec92ff57', 'vetement', 'n'),
	(4, 'ss', '{"arms":1,"decals_1":0,"arms_2":0,"torso_1":112,"torso_2":0,"tshirt_2":0,"shoes_2":0,"tshirt_1":15,"shoes_1":44,"pants_1":40,"pants_2":0}', 'license:222c46fedf9fa74880e63ab731894be3fb57c497', 'vetement', 'n'),
	(5, 'sac gucci', '{"helmet_1":39,"helmet_2":0}', 'license:676c7031a7e3c4b1fe6d534ebfbfe1ae4af49d16', 'Chapeau', 'n'),
	(6, 'sacoche lv', '{"chain_2":0,"chain_1":28}', 'license:676c7031a7e3c4b1fe6d534ebfbfe1ae4af49d16', 'Chaine', 'n'),
	(7, 'slt fdp', '{"glasses_1":20,"glasses_2":1}', 'license:676c7031a7e3c4b1fe6d534ebfbfe1ae4af49d16', 'Lunette', 'n'),
	(8, 'Casque vert', '{"helmet_1":16,"helmet_2":3}', 'license:222c46fedf9fa74880e63ab731894be3fb57c497', 'Chapeau', 'n'),
	(9, 'lunette moto cr', '{"glasses_1":35,"glasses_2":2}', 'license:222c46fedf9fa74880e63ab731894be3fb57c497', 'Lunette', 'n'),
	(10, 'cagoule', '{"mask_1":28,"mask_2":0}', 'license:222c46fedf9fa74880e63ab731894be3fb57c497', 'Masque', 'n'),
	(11, 'sac nike', '{"bags_1":11,"bags_2":0}', 'license:222c46fedf9fa74880e63ab731894be3fb57c497', 'Sac', 'n'),
	(12, 'crodd', '{"shoes_1":120,"decals_1":0,"tshirt_1":15,"pants_1":162,"tshirt_2":0,"arms_2":0,"pants_2":0,"torso_2":3,"torso_1":326,"shoes_2":0,"arms":17}', 'license:222c46fedf9fa74880e63ab731894be3fb57c497', 'vetement', 'n'),
	(13, 'OUI', '{"decals_1":0,"shoes_1":28,"torso_1":254,"pants_1":61,"pants_2":0,"arms":0,"arms_2":0,"tshirt_2":0,"tshirt_1":25,"torso_2":0,"shoes_2":0}', 'license:23eb122fbc001b121afd443767a90c32ce8d58b2', 'vetement', 'n'),
	(14, 'sltfdp', '{"mask_2":0,"mask_1":28}', 'license:afaba2ad9bca10e18363adece691fdecbcababee', 'Masque', 'n'),
	(15, 'fdpdaad', '{"glasses_2":0,"glasses_1":23}', 'license:afaba2ad9bca10e18363adece691fdecbcababee', 'Lunette', 'n');
/*!40000 ALTER TABLE `clothes_player` ENABLE KEYS */;

-- Dumping structure for table bluestark.datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.datastore: ~74 rows (approximately)
/*!40000 ALTER TABLE `datastore` DISABLE KEYS */;
REPLACE INTO `datastore` (`name`, `label`, `shared`) VALUES
	('property', 'Propriété', 0),
	('society_410th', '410 TH', 1),
	('society_667_ekip', '667 EKIP', 1),
	('society_777', '777', 1),
	('society_Bloods', 'bloods', 1),
	('society_CJNG', 'cjng', 1),
	('society_Cali', 'Cartel de cali', 1),
	('society_CartelDeCali', 'CartelDeCali', 1),
	('society_Cosa Nostra', 'cosanostra', 1),
	('society_Crips', 'Crips', 1),
	('society_MS13', 'Mafia', 1),
	('society_Madrazo', 'madrazo', 1),
	('society_MerryWeather', 'Mercenaire', 1),
	('society_Opinel13', 'Opinel13', 1),
	('society_Predis', 'predis', 1),
	('society_Sinaloa', 'sinaloa', 1),
	('society_Yakuza', 'yakuza', 1),
	('society_ambulance', 'Ambulance', 1),
	('society_atlas', 'Atlas', 1),
	('society_avocat', 'Avocat', 1),
	('society_bahamas', 'Bahamas', 1),
	('society_ballas', 'Ballas', 1),
	('society_ballasg', 'Ballas Gang', 1),
	('society_blackjackets2', 'BlackJackets2', 1),
	('society_blackmarket', 'BlackMarket', 1),
	('society_blc', 'Blanchisseur', 1),
	('society_bloods', 'Bloods', 1),
	('society_bluedragon2', 'Blue Dragon2', 1),
	('society_boatshop', 'Concessionnaire Bateaux', 1),
	('society_camorra', 'Camorra', 1),
	('society_carshop', 'Concessionnaire Voitures', 1),
	('society_carteldesinaloa', 'Cartel de Sinaloa', 1),
	('society_comorra2', 'Comorra', 1),
	('society_cosanostra', 'La Cosa Nostra', 1),
	('society_families', 'Families', 1),
	('society_fbi', 'FBI', 1),
	('society_francsmacons', 'Frans-Maçons', 1),
	('society_gordo', 'Gordo', 1),
	('society_hommenoir', 'Homme En Noir', 1),
	('society_hoova', 'Hoova', 1),
	('society_journalist', 'Journaliste', 1),
	('society_lacamorra', 'La Camorra', 1),
	('society_lalegion', 'C.I.A', 1),
	('society_lamainnoir', 'La Main Noir', 1),
	('society_lapegre', 'La Pégre', 1),
	('society_lesplagues', 'Les Plagues', 1),
	('society_losespadas', 'Los Espadas', 1),
	('society_lostmc', 'Lost MC', 1),
	('society_lostriples', 'Los Triples', 1),
	('society_marabunta', 'Marabunta', 1),
	('society_maracha', 'Maracha', 1),
	('society_mecano', 'Mécano', 1),
	('society_merryweather', 'Aucun', 1),
	('society_peakyblinders', 'Peaky Blinders', 1),
	('society_punisher', 'punisher', 1),
	('society_punisher2', 'Punisher2', 1),
	('society_realestateagent', 'Agent immobilier', 1),
	('society_southside', 'SouthSide', 1),
	('society_sylvester', 'Sylvester', 1),
	('society_tabac', 'Tabac', 1),
	('society_tata', 'tati', 1),
	('society_taxi', 'Taxi', 1),
	('society_unicorn', 'Unicorn', 1),
	('society_vagos', 'Vagos', 1),
	('society_vendetta2', 'Vendetta2', 1),
	('society_vigne', 'Vigneron', 1),
	('society_wader', 'Wader', 1),
	('society_widowmaker', 'WidowMaker', 1),
	('society_yiddish', 'Yiddish', 1),
	('trunk', 'Coffre Véhicule', 0),
	('user_ears', 'Ears', 0),
	('user_glasses', 'Glasses', 0),
	('user_helmet', 'Helmet', 0),
	('user_mask', 'Mask', 0);
/*!40000 ALTER TABLE `datastore` ENABLE KEYS */;

-- Dumping structure for table bluestark.datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `data` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_datastore_data_name` (`name`) USING BTREE,
  KEY `index_datastore_data_name_owner` (`name`,`owner`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.datastore_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `datastore_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `datastore_data` ENABLE KEYS */;

-- Dumping structure for table bluestark.entreprise
CREATE TABLE IF NOT EXISTS `entreprise` (
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `PosVestiaire` varchar(255) DEFAULT NULL,
  `PosCustom` varchar(255) DEFAULT NULL,
  `PosCustom2` varchar(255) DEFAULT NULL,
  `PosCustom3` varchar(255) DEFAULT NULL,
  `PosBoss` varchar(255) DEFAULT NULL,
  `namerecolteitem` varchar(255) DEFAULT NULL,
  `PosRecolte` varchar(255) DEFAULT NULL,
  `nametraitementitem` varchar(255) DEFAULT NULL,
  `PosTraitement` varchar(255) DEFAULT NULL,
  `PosVente` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.entreprise: ~2 rows (approximately)
/*!40000 ALTER TABLE `entreprise` DISABLE KEYS */;
REPLACE INTO `entreprise` (`type`, `name`, `label`, `PosVestiaire`, `PosCustom`, `PosCustom2`, `PosCustom3`, `PosBoss`, `namerecolteitem`, `PosRecolte`, `nametraitementitem`, `PosTraitement`, `PosVente`) VALUES
	('Mécano', 'bennys', 'Benny\'s', '{"x":-209.33348083496095,"y":-1338.330810546875,"z":30.89045524597168}', '{"x":-236.5702667236328,"y":-1319.2784423828126,"z":30.88950538635254}', '{"x":-241.32305908203126,"y":-1334.5064697265626,"z":30.8895034790039}', '{"x":-231.85191345214845,"y":-1334.6397705078126,"z":30.88950157165527}', '{"x":-195.59829711914063,"y":-1336.268310546875,"z":30.89046669006347}', NULL, NULL, NULL, NULL, NULL),
	('Mécano', 'hayesmotor', 'Hayes Motors', '{"x":-1425.0943603515626,"y":-457.43951416015627,"z":35.91015625}', '{"x":-1417.1405029296876,"y":-445.71026611328127,"z":35.90971755981445}', '{"x":-1424.0823974609376,"y":-450.0004577636719,"z":35.90971374511719}', '{"x":-1410.090576171875,"y":-441.6474609375,"z":35.9096565246582}', '{"x":-1427.6824951171876,"y":-458.408203125,"z":35.90971374511719}', NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `entreprise` ENABLE KEYS */;

-- Dumping structure for table bluestark.fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.fine_types: ~60 rows (approximately)
/*!40000 ALTER TABLE `fine_types` DISABLE KEYS */;
REPLACE INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Usage abusif du klaxon', 50, 0),
	(2, 'Franchir une ligne continue', 100, 0),
	(3, 'Circulation à contresens', 150, 0),
	(4, 'Demi-tour non autorisé', 250, 0),
	(5, 'Circulation hors-route', 300, 0),
	(6, 'Non-respect des distances de sécurité', 100, 0),
	(7, 'Arrêt dangereux / interdit', 300, 0),
	(8, 'Stationnement gênant / interdit', 300, 0),
	(9, 'Non respect  de la priorité à droite', 200, 0),
	(10, 'Non-respect à un véhicule prioritaire', 300, 0),
	(11, 'Non-respect d\'un stop', 200, 0),
	(12, 'Non-respect d\'un feu rouge', 400, 0),
	(13, 'Dépassement dangereux', 500, 0),
	(14, 'Véhicule non en état', 600, 0),
	(15, 'Conduite sans permis', 2000, 0),
	(16, 'Délit de fuite', 19680, 0),
	(17, 'Excès de vitesse < 5 kmh', 2450, 0),
	(18, 'Excès de vitesse 5-15 kmh', 4800, 0),
	(19, 'Excès de vitesse 15-30 kmh', 8450, 0),
	(20, 'Excès de vitesse > 30 kmh', 9980, 0),
	(21, 'Entrave de la circulation', 2130, 1),
	(22, 'Dégradation de la voie publique', 1300, 1),
	(23, 'Trouble à l\'ordre publique', 1970, 1),
	(24, 'Entrave opération de police', 15630, 1),
	(25, 'Insulte envers / entre civils', 14300, 1),
	(26, 'Outrage à agent de police', 19600, 1),
	(27, 'Menace verbale ou intimidation evers civils', 9630, 1),
	(28, 'Menace verbale ou intimidation envers policier', 8600, 1),
	(29, 'Manifestation illégale', 4960, 1),
	(30, 'Tentative de corruption', 17800, 1),
	(31, 'Arme blanche sortie en ville', 21500, 2),
	(32, 'Arme léthale sortie en ville', 27830, 2),
	(33, 'Port d\'arme non autorisé (défaut de license)', 24600, 2),
	(34, 'Port d\'arme illégal', 28900, 2),
	(35, 'Pris en flag lockpick', 14600, 2),
	(36, 'Vol de voiture', 13300, 2),
	(37, 'Vente de drogue', 45600, 2),
	(38, 'Fabriquation de drogue', 34650, 2),
	(39, 'Possession de drogue', 39650, 2),
	(40, 'Prise d\'ôtage civil', 75000, 2),
	(41, 'Prise d\'ôtage agent de l\'état', 125000, 2),
	(42, 'Braquage particulier', 86000, 2),
	(43, 'Braquage magasin', 52000, 2),
	(44, 'Braquage de banque', 136000, 2),
	(45, 'Tir sur civil', 56300, 3),
	(46, 'Tir sur agent de l\'état', 65300, 3),
	(47, 'Tentative de meurtre sur civil', 65300, 3),
	(48, 'Tentative de meurtre sur agent de l\'état', 72300, 3),
	(49, 'Meurtre sur civil', 82300, 3),
	(50, 'Meurte sur agent de l\'état', 102300, 3),
	(51, 'Meurtre involontaire', 36000, 3),
	(52, 'Escroquerie à l\'entreprise', 82360, 2),
	(53, 'Vol de Vehicule Aeriens', 62220, 1),
	(54, 'Default de permis Aeriens', 28920, 1),
	(55, 'Default de permis de BATEAU', 22630, 1),
	(56, 'Vol de Vehicule Aquatique', 42560, 1),
	(57, 'Refus d\'obtempérer', 21300, 2),
	(58, 'Usurpation d\'identité', 22300, 2),
	(59, 'Complice du meurtre ', 35600, 2),
	(60, 'Tentative de kidnapping', 36500, 2);
/*!40000 ALTER TABLE `fine_types` ENABLE KEYS */;

-- Dumping structure for table bluestark.gangs
CREATE TABLE IF NOT EXISTS `gangs` (
  `gangname` varchar(255) DEFAULT NULL,
  `posCoffre` varchar(255) DEFAULT NULL,
  `KitArme` int(255) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.gangs: ~8 rows (approximately)
/*!40000 ALTER TABLE `gangs` DISABLE KEYS */;
REPLACE INTO `gangs` (`gangname`, `posCoffre`, `KitArme`) VALUES
	('families', '{"x":-18.26578140258789,"y":-1438.6597900390626,"z":31.10154151916504}', 0),
	('ballas', '{"x":85.93414306640625,"y":-1959.4818115234376,"z":21.12170219421386}', 0),
	('vagos', '{"x":337.9539489746094,"y":-2012.236572265625,"z":22.39477920532226}', 0),
	('lostmc', '{"y":-92.92694091796877,"x":986.7952270507813,"z":74.84590148925781}', 1),
	('Bloods', '{"x":-1556.7838134765626,"y":-374.9554443359375,"z":48.04824447631836}', 0),
	('Crips', '{"z":47.85899353027344,"y":31.03359031677246,"x":-336.7606201171875}', 0),
	('marabunta', '{"x":1437.4803466796876,"y":-1489.6546630859376,"z":66.61935424804688}', 0),
	('loszetas', '{"x":-1858.828125,"y":207.36094665527345,"z":84.29407501220703}', 0);
/*!40000 ALTER TABLE `gangs` ENABLE KEYS */;

-- Dumping structure for table bluestark.garage
CREATE TABLE IF NOT EXISTS `garage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `pos` varchar(255) NOT NULL,
  `SpawnPoint` varchar(255) NOT NULL,
  `DeletePoint` varchar(255) NOT NULL,
  `blip` int(11) DEFAULT 0,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;

-- Dumping data for table bluestark.garage: ~117 rows (approximately)
/*!40000 ALTER TABLE `garage` DISABLE KEYS */;
REPLACE INTO `garage` (`id`, `name`, `pos`, `SpawnPoint`, `DeletePoint`, `blip`, `type`) VALUES
	(27, 'Parking GrooveStreet', '{"x":-6.64520406723022,"y":-1719.4334716796876,"z":29.29779434204101}', '{"x":5.07790946960449,"y":-1715.842529296875,"z":29.29578399658203}', '{"x":-20.64522933959961,"y":-1726.4110107421876,"z":29.31169509887695}', 1, 'car'),
	(28, 'Parking Pillbox', '{"x":-348.7176513671875,"y":-874.8361206054688,"z":31.31008911132812}', '{"x":-328.8158264160156,"y":-877.7062377929688,"z":31.07286643981933}', '{"x":-338.8739013671875,"y":-890.8026733398438,"z":31.07145881652832}', 1, 'car'),
	(29, 'Parking Aguja', '{"x":-1184.1798095703126,"y":-1509.5859375,"z":4.64930391311645}', '{"x":-1196.6605224609376,"y":-1497.6241455078126,"z":4.36310529708862}', '{"x":-1204.666015625,"y":-1484.9302978515626,"z":4.36933183670043}', 1, 'car'),
	(30, 'Parking DelPerro', '{"x":-1206.48193359375,"y":-647.1587524414063,"z":25.90129470825195}', '{"x":-1204.3232421875,"y":-654.3712768554688,"z":25.90130043029785}', '{"x":-1198.201416015625,"y":-662.0109252929688,"z":25.90124893188476}', 1, 'car'),
	(31, 'Garage Aeroport', '{"x":-986.0765380859375,"y":-2707.7080078125,"z":13.83067417144775}', '{"x":-982.9541015625,"y":-2709.1630859375,"z":13.83275890350341}', '{"x":-979.8726806640625,"y":-2709.719970703125,"z":13.84832859039306}', 1, 'car'),
	(32, 'Garage Helico Aeroport', '{"x":-1186.1451416015626,"y":-2841.01806640625,"z":13.94614315032959}', '{"x":-1178.3511962890626,"y":-2845.54150390625,"z":13.94577026367187}', '{"x":-1178.3511962890626,"y":-2845.54150390625,"z":13.94577026367187}', 1, 'aircraft'),
	(33, 'Garage Helico Aeroport Sandy', '{"x":1721.94921875,"y":3274.480712890625,"z":41.14162826538086}', '{"x":1711.4998779296876,"y":3257.18701171875,"z":41.06793212890625}', '{"x":1711.4998779296876,"y":3257.18701171875,"z":41.06806182861328}', 1, 'aircraft'),
	(34, 'Garage Spawn 1', '{"x":-727.908447265625,"y":-68.51436614990235,"z":41.7503662109375}', '{"x":-733.2658081054688,"y":-71.69017028808594,"z":41.74742126464844}', '{"x":-736.9634399414063,"y":-73.4754638671875,"z":41.74746322631836}', 1, 'car'),
	(35, 'Garage Spawn 2', '{"x":-902.19873046875,"y":-159.5089874267578,"z":41.88142013549805}', '{"x":-905.2955322265625,"y":-161.10174560546876,"z":41.8794937133789}', '{"x":-908.4867553710938,"y":-162.69517517089845,"z":41.87744140625}', 1, 'car'),
	(36, 'Garage Casino', '{"x":884.930908203125,"y":-29.61385917663574,"z":78.76412963867188}', '{"x":883.2681274414063,"y":-32.07880401611328,"z":78.76412963867188}', '{"x":881.2848510742188,"y":-35.06534957885742,"z":78.76412963867188}', 1, 'car'),
	(37, 'Garage Hawick', '{"x":527.8548583984375,"y":-146.04014587402345,"z":58.37151718139648}', '{"x":536.7034912109375,"y":-136.29531860351563,"z":59.60051345825195}', '{"x":549.3505249023438,"y":-135.69464111328126,"z":59.40459823608398}', 1, 'car'),
	(38, 'Garage Mirror Park', '{"x":1036.065673828125,"y":-763.7364501953125,"z":57.99287414550781}', '{"x":1041.4403076171876,"y":-782.6431274414063,"z":58.00897216796875}', '{"x":1041.440185546875,"y":-782.6417846679688,"z":58.00897216796875}', 1, 'car'),
	(39, 'Parking jSPfrereejhaut', '{"x":-205.90284729003907,"y":314.6566162109375,"z":96.94556427001953}', '{"x":-209.3042449951172,"y":315.20806884765627,"z":96.94564819335938}', '{"x":-213.23313903808595,"y":315.2898254394531,"z":96.94564819335938}', 1, 'car'),
	(40, 'Parking Derriere Banquez', '{"x":375.0022888183594,"y":283.1969299316406,"z":103.17820739746094}', '{"x":371.1997985839844,"y":284.3172607421875,"z":103.25212860107422}', '{"x":359.6898193359375,"y":290.05877685546877,"z":103.5067138671875}', 1, 'car'),
	(41, 'garagecomicojsp', '{"x":487.39373779296877,"y":-30.59864234924316,"z":77.71842193603516}', '{"x":494.2873840332031,"y":-36.26412200927734,"z":77.71842193603516}', '{"x":491.3607482910156,"y":-23.91872215270996,"z":77.71841430664063}', 1, 'car'),
	(42, 'garagevillariche', '{"x":-71.13211059570313,"y":902.9609985351563,"z":235.60877990722657}', '{"x":-69.99139404296875,"y":900.220703125,"z":235.57833862304688}', '{"x":-69.54499053955078,"y":897.3328857421875,"z":235.55557250976563}', 1, 'car'),
	(44, 'Parking Pacific Bluff', '{"x":-2030.4591064453126,"y":-465.32666015625,"z":11.60397434234619}', '{"x":-2040.1766357421876,"y":-459.18927001953127,"z":11.39603519439697}', '{"x":-2042.4893798828126,"y":-472.03253173828127,"z":11.65456676483154}', 1, 'car'),
	(45, 'Parking Chumash', '{"x":-3148.938720703125,"y":1110.3988037109376,"z":20.85143089294433}', '{"x":-3142.67529296875,"y":1114.0321044921876,"z":20.70245361328125}', '{"x":-3147.799072265625,"y":1103.1033935546876,"z":20.70582008361816}', 1, 'car'),
	(47, 'garage marina', '{"x":-863.4942016601563,"y":-1324.4237060546876,"z":1.60516762733459}', '{"x":-869.7057495117188,"y":-1339.4354248046876,"z":-0.55692946910858}', '{"x":-869.7059326171875,"y":-1339.43603515625,"z":-0.48162171244621}', 1, 'boat'),
	(48, 'Garage Hopital', '{"x":293.5585632324219,"y":-600.371337890625,"z":43.3019790649414}', '{"x":296.0126647949219,"y":-607.655029296875,"z":43.33325576782226}', '{"x":294.3943786621094,"y":-612.7153930664063,"z":43.38309860229492}', 0, 'car'),
	(49, 'Garage Police', '{"x":426.96533203125,"y":-973.6189575195313,"z":25.69979476928711}', '{"x":431.29656982421877,"y":-986.9951782226563,"z":25.6998119354248}', '{"x":435.4156494140625,"y":-975.9085083007813,"z":25.69981575012207}', 0, 'car'),
	(50, 'garagelaoucvide', '{"x":-100.97563171386719,"y":85.44194030761719,"z":71.48909759521485}', '{"x":-97.906982421875,"y":84.43753814697266,"z":71.55401611328125}', '{"x":-94.8561019897461,"y":82.24374389648438,"z":71.5618896484375}', 1, 'car'),
	(52, 'garage families', '{"x":-25.08846473693847,"y":-1444.9637451171876,"z":30.65312385559082}', '{"x":-25.07479858398437,"y":-1445.003662109375,"z":30.65312385559082}', '{"x":-24.5261287689209,"y":-1437.8055419921876,"z":30.65312385559082}', 0, 'car'),
	(53, 'garage ballas', '{"x":84.68270874023438,"y":-1966.88720703125,"z":20.74744606018066}', '{"x":84.76190948486328,"y":-1971.84912109375,"z":20.78665161132812}', '{"x":84.762451171875,"y":-1971.84912109375,"z":20.78797531127929}', 0, 'car'),
	(54, 'Garage Vagos', '{"x":305.59808349609377,"y":-2023.9049072265626,"z":20.31685256958007}', '{"x":329.4019470214844,"y":-2035.5697021484376,"z":20.43703269958496}', '{"x":331.4017333984375,"y":-2044.9215087890626,"z":20.78050994873047}', 0, 'car'),
	(55, 'Garage Prison', '{"x":1857.112060546875,"y":2642.813232421875,"z":45.67185974121094}', '{"x":1857.1156005859376,"y":2643.006103515625,"z":45.67185974121094}', '{"x":1856.654296875,"y":2649.80810546875,"z":45.67185974121094}', 1, 'car'),
	(56, 'garagefrancmacons', '{"x":21.14958953857422,"y":545.4627075195313,"z":176.0275421142578}', '{"x":15.28508853912353,"y":550.9154663085938,"z":176.52346801757813}', '{"x":15.00224494934082,"y":551.0822143554688,"z":176.53677368164063}', 0, 'car'),
	(57, 'garagenordammu', '{"x":1704.603271484375,"y":3764.842529296875,"z":34.3656997680664}', '{"x":1713.6341552734376,"y":3767.510498046875,"z":34.30812072753906}', '{"x":1708.781982421875,"y":3774.81103515625,"z":34.49717712402344}', 1, 'car'),
	(58, 'garage nord', '{"x":115.81245422363281,"y":6599.08837890625,"z":32.00666427612305}', '{"x":125.56177520751953,"y":6598.078125,"z":31.93776130676269}', '{"x":123.90943908691406,"y":6589.69970703125,"z":31.98310852050781}', 1, 'car'),
	(59, 'garage lost', '{"x":958.1754760742188,"y":-124.65983581542969,"z":74.35316467285156}', '{"x":961.40283203125,"y":-130.41415405273438,"z":74.35797882080078}', '{"x":964.8287963867188,"y":-118.24717712402344,"z":74.35303497314453}', 0, 'car'),
	(60, 'garageversunesociety', '{"x":-194.89715576171876,"y":206.5764617919922,"z":86.44784545898438}', '{"x":-200.1585693359375,"y":210.80007934570313,"z":86.57903289794922}', '{"x":-202.9425811767578,"y":205.38619995117188,"z":85.43212127685547}', 1, 'car'),
	(61, 'garage dumousap', '{"x":711.0039672851563,"y":-979.4786376953125,"z":24.11075782775879}', '{"x":710.8052978515625,"y":-986.52734375,"z":24.11464881896972}', '{"x":702.3942260742188,"y":-979.5794067382813,"z":24.14772033691406}', 0, 'car'),
	(63, 'garages Bloods', '{"x":-1550.6170654296876,"y":-420.5035400390625,"z":41.99296188354492}', '{"x":-1546.7259521484376,"y":-417.2001953125,"z":41.99208831787109}', '{"x":-1535.10205078125,"y":-407.9735107421875,"z":41.99106979370117}', 0, 'car'),
	(64, 'blackmarket', '{"x":-1546.640869140625,"y":883.9857788085938,"z":181.30096435546876}', '{"x":-1533.74560546875,"y":884.83935546875,"z":181.72994995117188}', '{"x":-1527.8641357421876,"y":858.9119262695313,"z":181.6069793701172}', 0, 'car'),
	(65, 'Garage Hoova', '{"x":-616.671875,"y":-732.4236450195313,"z":27.85634040832519}', '{"x":-623.83447265625,"y":-734.33154296875,"z":27.63198280334472}', '{"x":-616.9181518554688,"y":-738.8482666015625,"z":27.8178482055664}', 0, 'car'),
	(66, 'garagecamorra', '{"x":-1524.3572998046876,"y":80.8609390258789,"z":56.67130279541015}', '{"x":-1525.4710693359376,"y":86.22917175292969,"z":56.53076934814453}', '{"x":-1533.6693115234376,"y":81.58586883544922,"z":56.77300643920898}', 0, 'car'),
	(67, 'garagelapegre', '{"x":-2666.322509765625,"y":1305.263671875,"z":147.1186065673828}', '{"x":-2659.09619140625,"y":1307.4736328125,"z":147.1186065673828}', '{"x":-2657.59033203125,"y":1307.94140625,"z":147.1186065673828}', 0, 'car'),
	(68, 'garageconcess', '{"x":151.82933044433595,"y":-119.47154235839844,"z":54.82605361938476}', '{"x":146.68807983398438,"y":-124.16055297851563,"z":54.82665634155273}', '{"x":146.19967651367188,"y":-124.59661865234375,"z":54.82668304443359}', 0, 'car'),
	(70, 'garege jsp vers leau', '{"x":-956.4586181640625,"y":-1082.9049072265626,"z":2.15030884742736}', '{"x":-950.8794555664063,"y":-1085.028076171875,"z":2.09453082084655}', '{"x":-953.3974609375,"y":-1080.4720458984376,"z":2.1503140926361}', 0, 'car'),
	(71, 'garage tequilalala ', '{"x":-575.4102172851563,"y":316.6580505371094,"z":84.60321807861328}', '{"x":-573.9805297851563,"y":324.4385986328125,"z":84.58287811279297}', '{"x":-578.6788940429688,"y":323.2974853515625,"z":84.74388885498047}', 0, 'car'),
	(72, 'Parking Central', '{"x":215.69981384277345,"y":-809.6953125,"z":30.73655700683593}', '{"x":231.18972778320313,"y":-798.587646484375,"z":30.5620059967041}', '{"x":222.90281677246095,"y":-761.8401489257813,"z":30.82215499877929}', 1, 'car'),
	(73, 'Garage Crips', '{"x":-354.337646484375,"y":37.56699752807617,"z":47.91953659057617}', '{"x":-360.06298828125,"y":35.20575714111328,"z":48.03091430664062}', '{"x":-357.2810974121094,"y":25.66899299621582,"z":47.70771789550781}', 0, 'car'),
	(74, 'Madrazo', '{"x":1412.5469970703126,"y":1115.4146728515626,"z":114.83792114257813}', '{"x":1409.12939453125,"y":1118.583984375,"z":114.83744812011719}', '{"x":1401.01171875,"y":1114.8226318359376,"z":114.83743286132813}', 0, 'car'),
	(75, 'Garage Vigneron', '{"x":-1918.950927734375,"y":2056.853271484375,"z":140.73580932617188}', '{"x":-1913.7711181640626,"y":2049.658447265625,"z":140.7370147705078}', '{"x":-1921.291259765625,"y":2048.0498046875,"z":140.73526000976563}', 0, 'car'),
	(76, 'Garage SouthSide', '{"x":-1577.01025390625,"y":-241.72381591796876,"z":49.46902465820312}', '{"x":-1578.5924072265626,"y":-243.30975341796876,"z":49.47661209106445}', '{"x":-1574.9481201171876,"y":-237.06344604492188,"z":49.465576171875}', 0, 'car'),
	(77, 'Garage marabunta', '{"x":1423.4210205078126,"y":-1501.7830810546876,"z":60.9447135925293}', '{"x":1419.3775634765626,"y":-1509.4942626953126,"z":60.35546493530273}', '{"x":1415.1192626953126,"y":-1505.08740234375,"z":60.12824249267578}', 0, 'car'),
	(78, 'Garage Peaky Blinders', '{"x":-123.51017761230469,"y":1007.3270874023438,"z":235.7321014404297}', '{"x":-124.08273315429688,"y":1000.266357421875,"z":235.7345428466797}', '{"x":-129.1654052734375,"y":1004.9088745117188,"z":235.73211669921876}', 0, 'car'),
	(79, 'Garage RadiaFarm', '{"x":1537.10400390625,"y":2168.65380859375,"z":78.93047332763672}', '{"x":1529.4400634765626,"y":2175.745849609375,"z":79.51907348632813}', '{"x":1535.768798828125,"y":2163.33154296875,"z":79.1755599975586}', 0, 'car'),
	(80, 'Garage Port', '{"x":1243.4617919921876,"y":-3135.222412109375,"z":5.5282335281372}', '{"x":1251.346435546875,"y":-3137.704345703125,"z":5.82104587554931}', '{"x":1243.7957763671876,"y":-3142.089599609375,"z":5.52547121047973}', 0, 'car'),
	(81, 'Hélico LSPD', '{"x":451.3092956542969,"y":-992.1365966796875,"z":43.69140625}', '{"x":449.7103271484375,"y":-982.1045532226563,"z":43.69139862060547}', '{"x":450.2041015625,"y":-981.7761840820313,"z":43.69139099121094}', 0, 'aircraft'),
	(82, 'Coffee\'Zo', '{"x":1441.7205810546876,"y":1142.132080078125,"z":114.33174896240235}', '{"x":1438.136474609375,"y":1144.292724609375,"z":114.3101806640625}', '{"x":1436.6055908203126,"y":1140.03955078125,"z":114.38661193847656}', 0, 'car'),
	(83, 'Hélico Peaky', '{"x":-37.39634704589844,"y":950.5748291015625,"z":232.17420959472657}', '{"x":-36.06380844116211,"y":941.41455078125,"z":232.17420959472657}', '{"x":-36.33444213867187,"y":941.4901123046875,"z":232.17420959472657}', 0, 'aircraft'),
	(84, 'Voiture Plagues', '{"x":-1310.2666015625,"y":-935.6932373046875,"z":9.73056983947753}', '{"x":-1316.9190673828126,"y":-926.0518188476563,"z":11.20211505889892}', '{"x":-1316.6387939453126,"y":-939.5125122070313,"z":9.73071765899658}', 0, 'car'),
	(85, 'Hélico Plagues', '{"x":-1326.478271484375,"y":-940.8529663085938,"z":18.41143226623535}', '{"x":-1315.2406005859376,"y":-938.67822265625,"z":19.51100921630859}', '{"x":-1315.24560546875,"y":-938.7053833007813,"z":19.51100921630859}', 0, 'aircraft'),
	(86, 'Garage Cigare Shop', '{"x":-41.71504592895508,"y":1883.5150146484376,"z":195.60963439941407}', '{"x":-52.54961395263672,"y":1875.559814453125,"z":196.83908081054688}', '{"x":-52.48242568969726,"y":1875.557861328125,"z":196.83872985839845}', 0, 'car'),
	(87, 'garage branky', '{"x":-101.2129135131836,"y":824.7991943359375,"z":235.7246856689453}', '{"x":-105.19434356689453,"y":825.6970825195313,"z":235.7246856689453}', '{"x":-105.23313903808594,"y":825.8443603515625,"z":235.72467041015626}', 0, 'car'),
	(88, 'garage rico', '{"x":-676.809326171875,"y":902.3563842773438,"z":230.5751495361328}', '{"x":-670.5174560546875,"y":911.302490234375,"z":230.26268005371095}', '{"x":-670.5162353515625,"y":911.3006591796875,"z":230.26292419433595}', 0, 'car'),
	(89, 'Garage Jack Carter', '{"x":-1616.516357421875,"y":-374.1148376464844,"z":43.38721084594726}', '{"x":-1606.196044921875,"y":-383.8558654785156,"z":43.27317428588867}', '{"x":-1606.196044921875,"y":-383.8558654785156,"z":43.27317428588867}', 0, 'car'),
	(90, 'Garage Golf', '{"x":-918.1655883789063,"y":811.9319458007813,"z":184.33636474609376}', '{"x":-917.9888916015625,"y":802.7800903320313,"z":184.3410186767578}', '{"x":-917.9756469726563,"y":802.2298583984375,"z":184.33094787597657}', 0, 'car'),
	(91, 'garage 7', '{"x":-905.1998901367188,"y":780.1005859375,"z":186.42750549316407}', '{"x":-905.6800537109375,"y":786.138671875,"z":185.63516235351563}', '{"x":-905.6800537109375,"y":786.138671875,"z":185.63565063476563}', 0, 'car'),
	(92, 'Hélico Maracha', '{"x":485.4241027832031,"y":-3363.45751953125,"z":6.06991100311279}', '{"x":479.06719970703127,"y":-3369.81591796875,"z":6.06991100311279}', '{"x":479.0692443847656,"y":-3369.81591796875,"z":6.06991100311279}', 0, 'aircraft'),
	(93, 'Bateau Maracha', '{"x":507.9035949707031,"y":-3388.62353515625,"z":6.06991481781005}', '{"x":508.12445068359377,"y":-3406.085693359375,"z":0.31692713499069}', '{"x":508.113525390625,"y":-3406.084228515625,"z":0.10220358520746}', 0, 'boat'),
	(94, 'Voiture Maracha', '{"x":460.8753356933594,"y":-3191.462646484375,"z":6.06956005096435}', '{"x":468.1618957519531,"y":-3191.59814453125,"z":6.06956005096435}', '{"x":468.1618957519531,"y":-3191.59814453125,"z":6.06956005096435}', 0, 'car'),
	(95, 'Sheriff Paleto', '{"x":-469.1423034667969,"y":6039.0068359375,"z":31.34055137634277}', '{"x":-465.5293884277344,"y":6028.89501953125,"z":31.34055137634277}', '{"x":-475.302001953125,"y":6031.26123046875,"z":31.34055137634277}', 0, 'car'),
	(96, 'Sheriff Hélico', '{"x":-467.9013977050781,"y":5997.34814453125,"z":31.26404953002929}', '{"x":-474.89764404296877,"y":5989.03173828125,"z":31.33670997619629}', '{"x":-475.1758728027344,"y":5988.7666015625,"z":31.33670997619629}', 0, 'aircraft'),
	(97, 'garage Airport', '{"x":-953.8087768554688,"y":-2944.23779296875,"z":13.94507217407226}', '{"x":-956.2930908203125,"y":-2939.965576171875,"z":13.94507217407226}', '{"x":-952.5586547851563,"y":-2936.5224609375,"z":13.94507217407226}', 0, 'car'),
	(98, 'Michelin', '{"x":851.6994018554688,"y":-892.604736328125,"z":25.26846313476562}', '{"x":858.6319580078125,"y":-900.0203247070313,"z":25.47750091552734}', '{"x":851.0724487304688,"y":-899.0579833984375,"z":25.25367927551269}', 0, 'car'),
	(99, 'Garage Yiddish', '{"x":-1789.7996826171876,"y":461.9954833984375,"z":128.30816650390626}', '{"x":-1792.41162109375,"y":458.128662109375,"z":128.30816650390626}', '{"x":-1787.34814453125,"y":456.21746826171877,"z":128.30816650390626}', 0, 'car'),
	(100, 'garagemainnoir', '{"x":-107.05844116210938,"y":-2519.474853515625,"z":6.00000095367431}', '{"x":-99.65779113769531,"y":-2522.1171875,"z":6.00000095367431}', '{"x":-109.13153839111328,"y":-2510.498779296875,"z":4.95634222030639}', 0, 'car'),
	(101, 'predisgarage', '{"x":-2780.344970703125,"y":1424.0926513671876,"z":100.9283676147461}', '{"x":-2771.118896484375,"y":1436.0289306640626,"z":100.97425842285156}', '{"x":-2775.743408203125,"y":1430.8707275390626,"z":100.93134307861328}', 0, 'car'),
	(102, 'predisgarage', '{"x":-2780.344970703125,"y":1424.0926513671876,"z":100.9283676147461}', '{"x":-2771.118896484375,"y":1436.0289306640626,"z":100.97425842285156}', '{"x":-2775.743408203125,"y":1430.8707275390626,"z":100.93134307861328}', 0, 'car'),
	(103, 'garagebm', '{"x":159.27828979492188,"y":-3020.56640625,"z":6.00859546661376}', '{"x":170.36514282226563,"y":-3017.126220703125,"z":5.86739540100097}', '{"x":159.88999938964845,"y":-3014.21337890625,"z":5.99797344207763}', 0, 'car'),
	(104, 'Cosa Airport', '{"x":-1541.19,"y":849.4,"z":180.81}', '{"x":-1551.97,"y":845.13,"z":182.66}', '{"x":-1551.97,"y":845.13,"z":182.66}', 0, 'aircraft'),
	(105, 'sinaloa', '{"x":-2986.62451171875,"y":734.3004760742188,"z":28.49677085876465}', '{"x":-2986.468994140625,"y":729.1741333007813,"z":28.49686813354492}', '{"x":-2985.7353515625,"y":726.546875,"z":28.49686813354492}', 0, 'car'),
	(106, 'cjnggarage', '{"x":-823.4727783203125,"y":186.94248962402345,"z":72.13238525390625}', '{"x":-824.7620239257813,"y":179.88516235351563,"z":71.49393463134766}', '{"x":-813.3313598632813,"y":186.1129608154297,"z":72.46292114257813}', 0, 'car'),
	(107, 'Garage Boat lac', '{"x":713.1015625,"y":4093.00244140625,"z":34.72787475585937}', '{"x":714.30078125,"y":4083.3974609375,"z":29.33392906188965}', '{"x":714.2990112304688,"y":4083.249755859375,"z":29.47267150878906}', 0, 'boat'),
	(108, 'garagebunker', '{"x":882.0659790039063,"y":-3239.408447265625,"z":-98.28164672851563}', '{"x":882.0738525390625,"y":-3239.384521484375,"z":-98.2817153930664}', '{"x":890.8949584960938,"y":-3236.13232421875,"z":-98.27668762207031}', 0, 'car'),
	(109, 'garagebunker2', '{"x":1881.9891357421876,"y":295.9247131347656,"z":164.3042449951172}', '{"x":1874.750732421875,"y":284.5708312988281,"z":164.30517578125}', '{"x":1874.73779296875,"y":284.5442199707031,"z":164.30517578125}', 0, 'car'),
	(110, 'garagebunker2helico', '{"x":1886.2545166015626,"y":279.16766357421877,"z":163.6129913330078}', '{"x":1873.163330078125,"y":293.2270202636719,"z":164.27426147460938}', '{"x":1872.671630859375,"y":294.45611572265627,"z":164.27426147460938}', 0, 'aircraft'),
	(111, 'Garage Golf Villa', '{"x":-1050.962890625,"y":224.5198974609375,"z":63.76676177978515}', '{"x":-1047.50146484375,"y":220.77244567871095,"z":63.76631546020508}', '{"x":-1045.3759765625,"y":223.60421752929688,"z":63.76492691040039}', 0, 'car'),
	(112, 'Garage Legion', '{"x":-3197.940673828125,"y":836.5643920898438,"z":8.93494033813476}', '{"x":-3210.599853515625,"y":832.7942504882813,"z":8.93091487884521}', '{"x":-3204.228271484375,"y":842.4568481445313,"z":8.9349250793457}', 0, 'car'),
	(113, 'Garage Blondinet', '{"x":1300.90576171875,"y":4318.90283203125,"z":38.1652717590332}', '{"x":1305.391357421875,"y":4324.52685546875,"z":38.28580856323242}', '{"x":1305.4967041015626,"y":4324.67041015625,"z":38.28269577026367}', 0, 'car'),
	(114, 'HAYESMOTORS', '{"x":-1397.9068603515626,"y":-464.3139343261719,"z":34.47810363769531}', '{"x":-1394.0135498046876,"y":-455.2069396972656,"z":34.48237228393555}', '{"x":-1393.5479736328126,"y":-453.71392822265627,"z":34.48119735717773}', 0, 'car'),
	(115, 'hookacbd', '{"x":-666.4035034179688,"y":5827.7587890625,"z":17.33145141601562}', '{"x":-661.5098876953125,"y":5822.84716796875,"z":17.33131408691406}', '{"x":-661.3742065429688,"y":5822.3974609375,"z":17.33131408691406}', 0, 'car'),
	(116, 'Helico EMS', '{"x":466.7632751464844,"y":-575.9155883789063,"z":28.49977874755859}', '{"x":467.7201843261719,"y":-587.4459838867188,"z":28.49959945678711}', '{"x":467.7201843261719,"y":-587.4459838867188,"z":28.49959945678711}', 0, 'aircraft'),
	(117, 'Garage Yakuza', '{"x":-959.8065795898438,"y":-1493.388427734375,"z":5.00937509536743}', '{"x":-965.2598876953125,"y":-1496.423583984375,"z":5.00786828994751}', '{"x":-959.0473022460938,"y":-1498.125244140625,"z":5.01388597488403}', 0, 'car'),
	(118, 'garage avion cayo', '{"x":4437.1650390625,"y":-4485.85791015625,"z":4.26522016525268}', '{"x":4440.85205078125,"y":-4510.484375,"z":4.18426656723022}', '{"x":4440.85205078125,"y":-4510.484375,"z":4.18426370620727}', 1, 'aircraft'),
	(119, 'garage-concess-moto', '{"x":1165.525634765625,"y":2667.193603515625,"z":37.86428833007812}', '{"x":1165.8016357421876,"y":2672.982421875,"z":38.00545120239258}', '{"x":1165.838134765625,"y":2673.299560546875,"z":37.99337768554687}', 0, 'car'),
	(120, 'Gordo', '{"x":3324.252685546875,"y":5160.42333984375,"z":18.38093376159668}', '{"x":3327.553955078125,"y":5152.3583984375,"z":18.31542205810547}', '{"x":3332.98779296875,"y":5159.6357421875,"z":18.30826568603515}', 0, 'car'),
	(121, 'Bateaux Cayo', '{"x":4930.001953125,"y":-5145.59228515625,"z":2.45517539978027}', '{"x":4921.94580078125,"y":-5142.80908203125,"z":-0.19629479944705}', '{"x":4921.94580078125,"y":-5142.8056640625,"z":-0.26869511604309}', 0, 'boat'),
	(122, 'GaragePDM', '{"x":-40.91489028930664,"y":-1117.5792236328126,"z":26.67027473449707}', '{"x":-48.617431640625,"y":-1113.52734375,"z":26.67027473449707}', '{"x":-50.75679397583008,"y":-1118.51318359375,"z":26.67027282714843}', 0, 'car'),
	(123, 'garagebateauxcayo', '{"x":4929.57373046875,"y":-5174.1591796875,"z":2.46865916252136}', '{"x":4919.912109375,"y":-5159.6123046875,"z":-0.28498044610023}', '{"x":4919.9130859375,"y":-5159.6123046875,"z":-0.28409302234649}', 1, 'boat'),
	(127, 'Fourrière SUD', '{"x":-177.92935180664063,"y":-1165.79248046875,"z":23.04405403137207}', '{"x":-175.43685913085938,"y":-1173.6575927734376,"z":23.04404830932617}', '{"x":-175.43731689453126,"y":-1173.6575927734376,"z":23.04404830932617}', 1, 'car'),
	(128, 'Garage Tijuana', '{"x":-1101.6500244140626,"y":354.0283508300781,"z":68.48860168457031}', '{"x":-1098.09130859375,"y":360.78192138671877,"z":68.54285430908203}', '{"x":-1106.230224609375,"y":351.0182189941406,"z":68.4805679321289}', 0, 'car'),
	(129, 'Garage Benny\'S', '{"x":-189.7569122314453,"y":-1284.271240234375,"z":31.22497940063476}', '{"x":-184.2893829345703,"y":-1288.52197265625,"z":31.29657363891601}', '{"x":-183.10556030273438,"y":-1289.22412109375,"z":31.29610824584961}', 0, 'car'),
	(130, 'Aéroport Grap seed', '{"x":2134.8125,"y":4781.1025390625,"z":40.97028350830078}', '{"x":2123.060791015625,"y":4806.55322265625,"z":41.19596862792969}', '{"x":2114.11865234375,"y":4799.16357421875,"z":41.13943481445312}', 0, 'aircraft'),
	(131, 'Garage grap seed', '{"x":2480.40966796875,"y":4958.11962890625,"z":44.94337463378906}', '{"x":2476.916015625,"y":4948.423828125,"z":45.06750106811523}', '{"x":2488.6884765625,"y":4961.4072265625,"z":44.79451751708984}', 0, 'car'),
	(132, 'Garage MazeBank', '{"x":-222.245361328125,"y":-2071.4130859375,"z":27.62040519714355}', '{"x":-216.82090759277345,"y":-2076.3388671875,"z":27.62040519714355}', '{"x":-224.6685791015625,"y":-2074.89013671875,"z":27.62039184570312}', 1, 'car'),
	(133, 'Garage Petite Villa Vinewood ', '{"x":350.89776611328127,"y":-132.87245178222657,"z":66.00881958007813}', '{"x":351.4874267578125,"y":-129.9586944580078,"z":66.33845520019531}', '{"x":349.0206604003906,"y":-138.78562927246095,"z":65.03604125976563}', 0, 'car'),
	(134, 'Garage Villa Hernandez', '{"x":-749.4475708007813,"y":820.6668090820313,"z":213.34120178222657}', '{"x":-745.1134643554688,"y":818.0662841796875,"z":213.43084716796876}', '{"x":-748.1578369140625,"y":816.0260009765625,"z":213.4565887451172}', 0, 'car'),
	(135, 'Petite maison great chaperall 1', '{"x":-261.1007385253906,"y":2191.615966796875,"z":129.83619689941407}', '{"x":-267.8187255859375,"y":2193.463134765625,"z":129.8363494873047}', '{"x":-270.8846435546875,"y":2195.4248046875,"z":129.84848022460938}', 0, 'car'),
	(136, 'Garage villa montagne 4', '{"x":-461.64007568359377,"y":636.4857788085938,"z":144.18861389160157}', '{"x":-464.14825439453127,"y":643.4541015625,"z":144.18861389160157}', '{"x":-461.2193603515625,"y":640.9851684570313,"z":144.18861389160157}', 0, 'car'),
	(137, 'Motel arriver en ville', '{"x":-795.6173706054688,"y":-1045.1263427734376,"z":12.47293186187744}', '{"x":-795.332275390625,"y":-1045.8076171875,"z":12.44369411468505}', '{"x":-791.0431518554688,"y":-1053.2520751953126,"z":12.0701789855957}', 0, 'car'),
	(138, 'Entreprise Taxi', '{"x":903.23388671875,"y":-166.66709899902345,"z":74.08450317382813}', '{"x":904.6002807617188,"y":-184.39065551757813,"z":73.99452209472656}', '{"x":911.6533203125,"y":-162.7863006591797,"z":74.43630981445313}', 0, 'car'),
	(139, 'Villa RICHMAN', '{"x":-937.8352661132813,"y":207.8012237548828,"z":67.46500396728516}', '{"x":-953.4548950195313,"y":187.91793823242188,"z":66.59412384033203}', '{"x":-935.7950439453125,"y":202.61508178710938,"z":67.46501159667969}', 0, 'car'),
	(140, 'Garage Casino 6', '{"x":851.6445922851563,"y":-562.23876953125,"z":57.70787811279297}', '{"x":854.9696655273438,"y":-565.4107055664063,"z":57.63802719116211}', '{"x":843.854248046875,"y":-566.9520263671875,"z":57.70677947998047}', 0, 'car'),
	(141, 'Garage petite villa  hollywood 6', '{"x":-215.40431213378907,"y":597.194580078125,"z":191.67889404296876}', '{"x":-221.60679626464845,"y":594.85888671875,"z":190.6116180419922}', '{"x":-224.75076293945313,"y":592.0636596679688,"z":190.2126007080078}', 0, 'car'),
	(142, 'Garage de la BMF', '{"x":335.4316101074219,"y":-213.49497985839845,"z":54.0862808227539}', '{"x":325.6765441894531,"y":-210.34121704101563,"z":54.08630752563476}', '{"x":334.33380126953127,"y":-216.69569396972657,"z":54.0862808227539}', 0, 'car'),
	(143, 'Villa Vinewood HILLSS', '{"x":-1270.5501708984376,"y":510.98297119140627,"z":97.40988159179688}', '{"x":-1270.3651123046876,"y":509.540771484375,"z":97.2679214477539}', '{"x":-1265.98828125,"y":509.5085144042969,"z":96.98880767822266}', 0, 'car'),
	(144, 'Garage Carter Orpailleur', '{"x":-1261.6917724609376,"y":-819.8636474609375,"z":17.09916305541992}', '{"x":-1287.1160888671876,"y":-814.16455078125,"z":17.31628227233886}', '{"x":-1281.3929443359376,"y":-829.5138549804688,"z":17.09916496276855}', 1, 'car'),
	(145, 'fg', '{"x":-1286.7193603515626,"y":294.9093322753906,"z":64.8572006225586}', '{"x":-1293.3876953125,"y":295.73358154296877,"z":64.80720520019531}', '{"x":-1300.8206787109376,"y":298.3385009765625,"z":64.84001922607422}', 0, 'car'),
	(146, 'Police 2', '{"x":458.89239501953127,"y":-973.8031616210938,"z":25.69998168945312}', '{"x":451.19256591796877,"y":-976.2589111328125,"z":25.69998168945312}', '{"x":452.210205078125,"y":-975.6787109375,"z":25.69998168945312}', 0, 'car'),
	(147, 'mafiacanios', '{"x":-1806.7098388671876,"y":449.56610107421877,"z":128.50975036621095}', '{"x":-1807.2861328125,"y":456.5853576660156,"z":128.28355407714845}', '{"x":-1797.4669189453126,"y":457.55206298828127,"z":128.30828857421876}', 0, 'car'),
	(148, 'Garage Hélico Madrazo', '{"x":1443.020263671875,"y":1107.1378173828126,"z":114.35675048828125}', '{"x":1459.94873046875,"y":1112.66064453125,"z":114.33393859863281}', '{"x":1459.94873046875,"y":1112.66064453125,"z":114.33393859863281}', 0, 'aircraft'),
	(149, 'RadiaFarm', '{"x":1389.0302734375,"y":2190.1865234375,"z":97.69184875488281}', '{"x":1377.666748046875,"y":2177.028076171875,"z":97.60643005371094}', '{"x":1379.1658935546876,"y":2184.509033203125,"z":97.93583679199219}', 1, 'RadiaFarm'),
	(150, 'garage coté Blue dragon', '{"x":-1578.0517578125,"y":-83.40494537353516,"z":54.13448715209961}', '{"x":-1576.14453125,"y":-85.63247680664063,"z":54.13448715209961}', '{"x":-1586.702880859375,"y":-86.48749542236328,"z":54.33441925048828}', 0, 'car'),
	(151, 'lescanaux', '{"x":-1044.443603515625,"y":-1007.44580078125,"z":2.15019488334655}', '{"x":-1036.593994140625,"y":-1014.9458618164063,"z":2.16075086593627}', '{"x":-1038.2169189453126,"y":-1002.7733764648438,"z":2.15019273757934}', 0, 'car');
/*!40000 ALTER TABLE `garage` ENABLE KEYS */;

-- Dumping structure for table bluestark.instagram_account
CREATE TABLE IF NOT EXISTS `instagram_account` (
  `id` varchar(90) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `verify` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.instagram_account: ~1 rows (approximately)
/*!40000 ALTER TABLE `instagram_account` DISABLE KEYS */;
REPLACE INTO `instagram_account` (`id`, `name`, `phone`, `username`, `password`, `avatar`, `description`, `verify`) VALUES
	('license:3b00bf052be99af33a5a68716228b98ed91b9342', 'fd e', '555948005', 'ewen', 'eeeeeee', 'default.png', NULL, 0);
/*!40000 ALTER TABLE `instagram_account` ENABLE KEYS */;

-- Dumping structure for table bluestark.instagram_followers
CREATE TABLE IF NOT EXISTS `instagram_followers` (
  `username` varchar(50) NOT NULL,
  `followed` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.instagram_followers: ~0 rows (approximately)
/*!40000 ALTER TABLE `instagram_followers` DISABLE KEYS */;
/*!40000 ALTER TABLE `instagram_followers` ENABLE KEYS */;

-- Dumping structure for table bluestark.instagram_posts
CREATE TABLE IF NOT EXISTS `instagram_posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `image` text NOT NULL,
  `description` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `filter` varchar(50) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.instagram_posts: ~0 rows (approximately)
/*!40000 ALTER TABLE `instagram_posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `instagram_posts` ENABLE KEYS */;

-- Dumping structure for table bluestark.instagram_stories
CREATE TABLE IF NOT EXISTS `instagram_stories` (
  `owner` varchar(50) COLLATE armscii8_bin NOT NULL,
  `data` text COLLATE armscii8_bin DEFAULT NULL,
  PRIMARY KEY (`owner`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Dumping data for table bluestark.instagram_stories: ~0 rows (approximately)
/*!40000 ALTER TABLE `instagram_stories` DISABLE KEYS */;
/*!40000 ALTER TABLE `instagram_stories` ENABLE KEYS */;

-- Dumping structure for table bluestark.insta_stories
CREATE TABLE IF NOT EXISTS `insta_stories` (
  `username` varchar(50) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `filter` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.insta_stories: ~0 rows (approximately)
/*!40000 ALTER TABLE `insta_stories` DISABLE KEYS */;
/*!40000 ALTER TABLE `insta_stories` ENABLE KEYS */;

-- Dumping structure for table bluestark.items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `weight` float NOT NULL DEFAULT 1,
  `rare` tinyint(1) NOT NULL DEFAULT 0,
  `can_remove` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.items: ~212 rows (approximately)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
REPLACE INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('GraineCannabis', 'Graine de Cannabis', 0, 0, 1),
	('Mango', 'Mango', 1, 0, 1),
	('Mongolienne', 'Mongolienne', 1, 0, 1),
	('N4H', 'Drogue Traiter', 0, 0, 1),
	('NH4', 'Drogue Brut ', 0, 0, 1),
	('acierrecolte', 'Acier', 0.25, 0, 1),
	('aciertraitement', 'Acier Traité', 0.25, 0, 1),
	('alcoolbrut', 'Alcool Brut', 1, 0, 1),
	('alcooldecontrebande', 'Alcool de Contrebande', 1, 0, 1),
	('aluminium', 'Aluminium', 0.25, 0, 1),
	('ammoniac', 'Ammoniac', 0.25, 0, 1),
	('armor', 'Kevlar', 3, 0, 1),
	('bandage', 'Bandage', 0.2, 0, 1),
	('bankcard', 'Carte d\'accès Banque', 1, 0, 1),
	('bankcard2', 'Carte d\'accès Banque', 1, 0, 1),
	('basic_cuff', 'Menottes Basique', 0.3, 0, 1),
	('basic_key', 'Clefs de Menottes Basique', 0.1, 0, 1),
	('beer', 'Bière', 0.1, 0, 1),
	('blackphone', 'Boitier Darknet', 0, 0, 1),
	('blowpipe', 'Chalumeaux', 1.5, 0, 1),
	('bmx', 'BMX', 1, 0, 1),
	('bois', 'Buche de Bois', 0.25, 0, 1),
	('boissonchihuahua', 'Boisson Chihuahua', 0.2, 0, 1),
	('bread', 'Pain', 0.1, 0, 1),
	('burger', 'Burger', 0.3, 0, 1),
	('burgerchihuahua', 'Burger Chihuahua', 0.2, 0, 1),
	('ca', 'caca', 0, 0, 1),
	('caca', 'caca', 0, 0, 1),
	('cafemoulu', 'Café Moulu', 0.5, 0, 1),
	('cagoule', 'Cagoule', 1, 0, 1),
	('caisse_diamond', 'Caisse Diamond', 0, 0, 1),
	('caisse_fidelite', 'Caisse Fidelite', 0, 0, 1),
	('caisse_gold', 'Caisse Gold', 0, 0, 1),
	('caisse_halloween', 'Caise Halloween', 0, 0, 1),
	('caisse_noel', 'Caisse Noel', 0, 0, 1),
	('caisse_ruby', 'Caisse Ruby', 0, 0, 1),
	('caisse_vehicule', 'Caisse Véhicule', 0, 0, 1),
	('caoutchou', 'Caoutchou', 0.5, 0, 1),
	('carokit', 'Kit carosserie', 3, 0, 1),
	('carotool', 'Outils carosserie', 4, 0, 1),
	('casserole', 'Casserole', 0, 0, 1),
	('cbd', 'CBD', 0.25, 0, 1),
	('champignonavarrie', 'Champignon Avarié', 1, 0, 1),
	('champignonmagique', 'Champignon Magique', 1, 0, 1),
	('chargeur', 'Chargeur', 0.8, 0, 1),
	('chip', 'Jeton', 0, 0, 1),
	('cigare', 'Cigare', 0.5, 0, 1),
	('cigarette', 'Cigarette', 0.1, 0, 1),
	('ciseaux', 'Ciseaux', 1, 0, 1),
	('classic_phone', 'Iphone Classic', -1, 0, 1),
	('cleankit', 'Kit de nétoyage', 1, 0, 1),
	('clip', 'Chargeur', 0.3, 0, 1),
	('coca', 'Coca', 0.1, 0, 1),
	('cocafrais', 'Coca Frais', 0.3, 0, 1),
	('cocainerecolte', 'Cocaïne', 0.25, 0, 1),
	('cocainetraitement', 'Pochon de Cocaïne', 0.25, 0, 1),
	('codeine', 'Codéine', 1, 0, 1),
	('coke', 'Coke', 1, 0, 1),
	('coke_pooch', 'Pochon de coke', 0.25, 0, 1),
	('cola', 'Cola', 0.2, 0, 1),
	('coyote', 'Coyote', 0.2, 0, 1),
	('cuivre', 'Cuivre', 0.5, 0, 1),
	('cuivreetamer', 'Cuivre étamé', 0.5, 0, 1),
	('defibrillateur', 'Défibrillateur', 2, 0, 1),
	('drill', 'Perceuse', 0.25, 0, 1),
	('ecstasy', 'Ecstasy', 1, 0, 1),
	('eewenlpb', 'ewen ets bg', 0, 0, 1),
	('ewenestsft', 'jeclate dylan', 0, 0, 1),
	('fdp', 'Fils de pute', 1, 0, 1),
	('fdppepe', 'fils de puterie', 0, 0, 1),
	('feuille_coca', 'Feuille de coca', 1, 0, 1),
	('firstaidkit', 'Trousse premier secours', 1, 0, 1),
	('fixkit', 'Kit réparation', 1.5, 0, 1),
	('fixtool', 'Outils réparation', 2, 0, 1),
	('fritechihuahua', 'Frite Chihuahua', 0.2, 0, 1),
	('frites', 'Frites', 0.5, 0, 1),
	('fromage', 'Fromage', 0.25, 0, 1),
	('gazbottle', 'Bouteille de gaz', 2, 0, 1),
	('gazoile', 'Gazoile', 1, 0, 1),
	('gitanes', 'Gitanes', 0.1, 0, 1),
	('goldNecklace', 'Gold Necklace', -1, 0, 1),
	('graincafe', 'Grains De Café', 0.5, 0, 1),
	('grainecannabis', 'Graine de Cannabis', 0, 0, 1),
	('grand_cru', 'Grand cru', 0.2, 0, 1),
	('grapperaisin', 'Grappe de raisin', 0.5, 0, 1),
	('handcuff', 'Serre câble ', 0.3, 0, 1),
	('heroinerecolte', 'Héroine pure', 1, 0, 1),
	('hotdog', 'Hot Dog', 0.3, 0, 1),
	('ice', 'Glaçon', 0.1, 0, 1),
	('icerecolte', 'Ice', 1, 0, 1),
	('icetea', 'Ice Tea', 0.3, 0, 1),
	('iphone', 'Iphone 12', 0, 0, 1),
	('jager', 'Jägermeister', 0.5, 0, 1),
	('jagerbomb', 'Jägermeister', 0.5, 0, 1),
	('jagercerbere', 'Jäger Cerbère', 0.5, 0, 1),
	('jetoncustom', 'Jeton Custom', 0, 0, 1),
	('jewels', 'Bijou', 0.2, 0, 1),
	('jumelles', 'Jumelles', 0.25, 0, 1),
	('jus_coca', 'Jus de coca', 0.5, 0, 1),
	('jus_raisin', 'Jus de raisin', 0.5, 0, 1),
	('jusfruit', 'Jus de fruits', 0.5, 0, 1),
	('ketaminerecolte', 'Ketamine', 1, 0, 1),
	('ketaminetraitement', 'Pochon de Kétamine', 1, 0, 1),
	('lampeled', 'Lampe Led', 0, 0, 1),
	('laptop', 'Laptop', -1, 0, 1),
	('limonade', 'Limonade', 0.5, 0, 1),
	('lingotor', 'Lingot d\'or', 0.5, 0, 1),
	('lockpick', 'Pied de Biche', 1, 0, 1),
	('lsd', 'LSD', 1, 0, 1),
	('lsdtraitement', 'Pochon de LSD', 1, 0, 1),
	('malbora', 'Malboro', 0.1, 0, 1),
	('malte', 'Malte', 0, 0, 1),
	('maltetraiter', 'Bière', 0.25, 0, 1),
	('martini', 'Martini blanc', 1, 0, 1),
	('meat', 'Viande', 0.3, 0, 1),
	('medikit', 'Medikit', 2, 0, 1),
	('menthe', 'Feuille de menthe', 1, 0, 1),
	('menuchihuahua', 'Menu Chihuahua', 0.2, 0, 1),
	('meth', 'Meth', 1, 0, 1),
	('meth_pooch', 'Pochon de meth', 0.25, 0, 1),
	('methrecolte', 'Méthamphétamine', 1, 0, 1),
	('methtraitement', 'Pochon de Méthamphétamine', 1, 0, 1),
	('metreshooter', 'Mètre de shooter', 0.1, 0, 1),
	('mineraispetrole', 'Minerais de Petrole', 0.5, 0, 1),
	('mixapero', 'Mix Apéritif', 0.1, 0, 1),
	('mojito', 'Mojito', 0.1, 0, 1),
	('munition', 'Munition', 1, 0, 1),
	('niquetamere', 'niquetonpere', 0, 0, 1),
	('niquetasoeur', 'niquetonvieupere', 0, 0, 1),
	('non', 'non', 0.5, 0, 1),
	('opium', 'Opium', 1, 0, 1),
	('opium_pooch', 'Pochon d\'opium', 0.25, 0, 1),
	('opiumrecolte', 'Opium', 1, 0, 1),
	('opiumtraitement', 'Pochon d\'opium', 1, 0, 1),
	('orange', 'Orange', 0.1, 0, 1),
	('orange_juice', 'Jus d\'orange', 0.3, 0, 1),
	('orangina', 'Orangina', 0.3, 0, 1),
	('oui', 'oui', 0.5, 0, 1),
	('oxygen_mask', 'Masque à Oxygène', 0.6, 0, 1),
	('papier', 'Papier', 0.25, 0, 1),
	('patate', 'Pomme de Terre', 0.25, 0, 1),
	('pelle', 'Pelle', 0.7, 0, 1),
	('pepiteor', 'Pépite d\'or', 0.5, 0, 1),
	('pepperspray', 'Gazeuse', 1, 0, -1),
	('permisconduire', 'Permis de Conduire', -1, 0, 1),
	('peteburger', 'Peteburger', 0.5, 0, 1),
	('petrole', 'Pétrole', 0.5, 0, 1),
	('petroleliquide', 'Pétrole Liquide', 0.5, 0, 1),
	('phone', 'Téléphone', 0.3, 0, 1),
	('piluleoubli', 'GHB', 1, 0, 1),
	('pneu', 'Pneu', 0.5, 0, 1),
	('pochonCBD', 'Pochon de CBD', 0.5, 0, 1),
	('pochoncodeine', 'Pochon de Codéine', 1, 0, 1),
	('pochonice', 'pochon d\'ice', 1, 0, 1),
	('police_cuff', 'Menottes LSPD', 0.3, 0, 1),
	('police_key', 'Clefs de Menottes LSPD', 0.1, 0, 1),
	('pomme', 'Pomme', 0.1, 0, 1),
	('pomme2terre', 'Pomme de Terre', 0.3, 0, 1),
	('purplehazerecolte', 'Purple Haze', 1, 0, 1),
	('purplehazetraitement', 'Pochon De Purple Haze', 1, 0, 1),
	('ra', 'ra', 1, 0, 1),
	('radiateur', 'Radiateur', 1, 0, 1),
	('radio', 'Radio', 0.5, 0, 1),
	('radiobox', 'Enceinte Portative', 0.5, 0, 1),
	('raisin', 'Raisin', 0.5, 0, 1),
	('re', 're', 1, 0, 1),
	('redbull', 'Redbull', 0.3, 0, 1),
	('repairkit', 'Repairkit', 2, 0, 1),
	('rhum', 'Rhum', 0.4, 0, 1),
	('rhumcoca', 'Rhum-Coca', 0.5, 0, 1),
	('rhumfruit', 'Rhum-Jus de fruits', 0.5, 0, 1),
	('ring', 'Ring', -1, 0, 1),
	('rolex', 'Montre Rolex', 0, 0, 1),
	('sacplein', 'Sac de Terre', 0.5, 0, 1),
	('sacvide', 'Sac Vide', 0.3, 0, 1),
	('salade', 'Salade', 0.25, 0, 1),
	('seauplein', 'Seau d\'eau', 0, 0, 1),
	('sim', 'Carte Sim', 0, 0, 1),
	('soda', 'Soda', 0.5, 0, 1),
	('steack', 'Steack', 0.25, 0, 1),
	('tabac', 'Tabac', 0.5, 0, 1),
	('tabacblond', 'Tabac Blond', 0.5, 0, 1),
	('tabacblondsec', 'Tabac Blond Séché', 0.5, 0, 1),
	('tabacbrun', 'Tabac Brun', 0.5, 0, 1),
	('tabacbrunsec', 'Tabac Brun Séché', 0.5, 0, 1),
	('tarte_pomme', 'Tarte aux Pommes', 0.3, 0, 1),
	('teqpaf', 'Teq\'paf', 0.5, 0, 1),
	('tequila', 'Tequila', 0.5, 0, 1),
	('terre', 'Terre', 0.5, 0, 1),
	('terremouiller', 'Terre Mouiller', 0.5, 0, 1),
	('terresec', 'Sac de Terre Sec', 0, 0, 1),
	('test', 'test', 0.5, 0, 1),
	('test2', 'test2', 0.5, 0, 1),
	('tissu', 'Tissu', 0.5, 0, 1),
	('tomate', 'Tomate', 0.25, 0, 1),
	('traitementheroine', 'Pochon d\'héroine', 1, 0, 1),
	('vetement', 'Vêtement', 0, 0, 1),
	('viande', 'Viande', 0.3, 0, 1),
	('vine', 'Vin', 0.5, 0, 1),
	('vittvin', 'Vin Blanc', 0.5, 0, 1),
	('vodka', 'Vodka', 0.3, 0, 1),
	('vodkaenergy', 'Vodka-Energy', 0.4, 0, 1),
	('vodkafruit', 'Vodka-Jus de fruits', 0.3, 0, 1),
	('vodkaredbull', 'Vodka-Redbull', 0.3, 0, 1),
	('water', 'Bouteille d\'eau', 0.1, 0, 1),
	('weed', 'Weed', 1, 0, 1),
	('weed_pooch', 'Pochon de weed', 0.25, 0, 1),
	('weedrecolte', 'Weed', 1, 0, 1),
	('weedtraitement', 'Pochon de Weed', 0.25, 0, 1),
	('whisky', 'Whisky', 0.4, 0, 1),
	('whiskycoca', 'Whisky-coca', 0.5, 0, 1),
	('zetony', 'Jetons', -1, 0, 1);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Dumping structure for table bluestark.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.jobs: ~80 rows (approximately)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
REPLACE INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('667_ekip', '667_ekip', 1),
	('Aucun', 'Aucun', 1),
	('BMF', 'bmf', 1),
	('Bloods', 'bloods', 1),
	('CJNG', 'cjng', 1),
	('Cali', 'Cartel de cali', 1),
	('Crips', 'Crips', 1),
	('LaMainNoir', 'LA MAIN NOIR', 1),
	('Los Zetas', 'loszetas', 1),
	('MS13', 'Mafia', 1),
	('Madrazo', 'madrazo', 1),
	('Medelin', 'Medelin', 1),
	('MerryWeather', 'Mercenaire', 1),
	('Narcomafia', 'Narcomafia', 1),
	('Predis', 'predis', 1),
	('Sinaloa', 'sinaloa', 1),
	('Tijuana', 'Tijuana', 1),
	('Yakuza', 'yakuza', 1),
	('ambulance', 'Ambulance', 1),
	('avocat', 'Avocat', 1),
	('bahamas', 'Bahamas', 1),
	('ballas', 'Ballas', 1),
	('bennys', 'Benny\'s', 1),
	('bikeshop', 'Concessionnaire Moto', 1),
	('blackmarket', 'BlackMarket', 1),
	('bm', 'Black Market', 1),
	('bma', 'bma', 1),
	('boatshop', 'Concessionnaire Bateaux', 1),
	('burger', 'Burger Shoot', 1),
	('carshop', 'Concessionnaire Voitures', 1),
	('carterorpailleur', 'Carter Orpailleur', 1),
	('chihuahua', 'Chihuahua', 0),
	('cigarshop', 'Cigar Shop', 1),
	('coffeezo', 'Coffee\'Zo', 1),
	('cosanostra', 'Cosa Nostra', 1),
	('dumousap', 'DumouSap', 1),
	('ecorp', 'eCorp', 1),
	('families', 'families', 1),
	('fbi', 'FBI', 0),
	('francsmacons', 'Frans-Maçons', 1),
	('garciafarm', 'GarciaFarm', 1),
	('gordo', 'Gordo', 1),
	('hayesmotor', 'Haye\'s Motor\'s', 1),
	('hookah', 'Hookah CBD', 1),
	('hoova', 'Hoova', 1),
	('jeanneymar', 'jeanneymar', 1),
	('journalist', 'Journaliste', 1),
	('lacamorra', 'La Camorra', 1),
	('lalegion', 'C.I.A', 1),
	('lamainnoir', 'La Main Noir', 1),
	('lapegre', 'La Pégre', 1),
	('lescanaux', 'Les Canaux', 1),
	('lesplagues', 'Les Plagues', 1),
	('lostmc', 'Lost MC', 1),
	('loszetas', 'Los Zetas', 1),
	('madrazo', 'madrazo', 1),
	('mafiacanios', 'La Mafia Canios', 1),
	('marabunta', 'Marabunta', 1),
	('maracha', 'Maracha', 1),
	('merryweather', 'Aucun', 1),
	('michelin', 'Michelin', 1),
	('peakyblinders', 'Peaky Blinders', 1),
	('planeshop', 'Concessionnaire Avions', 1),
	('police', '‍L.S.P.D', 1),
	('radiafarm', 'RadiaFarm', 1),
	('realestateagent', 'Agent immobilier', 1),
	('rodriguez', 'Cartel de Cayo', 1),
	('saudiaramco', 'Saudi Aramco', 1),
	('sheriff', 'Sheriff', 1),
	('southside', 'SouthSide', 1),
	('sowsmarketing', 'Sow\'S Martking', 1),
	('taxi', 'Taxi', 1),
	('tequilala', 'Tequi-la-la', 1),
	('test', 'test', 1),
	('unemployed', 'Chomeur', 0),
	('unemployed2', 'Aucune', 1),
	('unicorn', 'Unicorn', 1),
	('vagos', 'Vagos', 1),
	('vigne', 'Vigneron', 1),
	('yiddish', 'Yiddish', 1);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Dumping structure for table bluestark.job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext COLLATE utf8mb4_bin NOT NULL,
  `skin_female` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1346 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.job_grades: ~327 rows (approximately)
/*!40000 ALTER TABLE `job_grades` DISABLE KEYS */;
REPLACE INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'ambulance', 0, 'ambulance', 'Ambulancier', 4000, '{"beard_1":0,"eye_color":0,"makeup_3":0,"blemishes_1":0,"mask_1":0,"glasses_1":0,"bproof_2":0,"lipstick_3":0,"beard_2":0,"torso_1":249,"pants_1":24,"blush_3":0,"torso_2":0,"blush_2":0,"complexion_1":0,"lipstick_2":0,"makeup_2":0,"bproof_1":0,"sun_2":0,"complexion_2":0,"chain_2":0,"sun_1":0,"eyebrows_3":0,"tshirt_1":94,"hair_color_1":0,"eyebrows_2":0,"mask_2":0,"helmet_2":0,"hair_2":0,"beard_3":0,"moles_2":0,"bags_1":0,"arms_2":0,"decals_2":0,"age_1":0,"ears_1":-1,"moles_1":0,"bracelets_2":0,"watches_1":-1,"face":0,"bags_2":0,"pants_2":5,"chest_3":0,"blemishes_2":0,"chest_1":0,"hair_color_2":0,"blush_1":0,"tshirt_2":0,"helmet_1":-1,"hair_1":0,"shoes_2":0,"lipstick_4":0,"eyebrows_4":0,"ears_2":0,"watches_2":0,"bodyb_2":0,"bodyb_1":0,"eyebrows_1":0,"decals_1":57,"makeup_4":0,"glasses_2":0,"age_2":0,"shoes_1":8,"arms":90,"chain_1":126,"bracelets_1":-1,"chest_2":0,"beard_4":0,"makeup_1":0,"lipstick_1":0,"skin":0,"sex":0}', '{"age_1":0,"blush_3":0,"complexion_2":0,"bracelets_2":0,"chain_2":0,"bodyb_1":0,"pants_1":23,"hair_1":4,"lipstick_4":0,"bproof_2":0,"bodyb_2":0,"shoes_2":1,"sun_2":0,"blush_1":0,"shoes_1":4,"decals_1":65,"eyebrows_2":10,"makeup_1":6,"glasses":0,"chest_3":0,"bags_2":0,"arms":105,"watches_1":2,"arms_2":0,"hair_color_1":28,"beard_3":0,"chain_1":96,"chest_1":0,"mask_1":0,"sex":1,"decals_2":0,"bproof_1":0,"hair_color_2":28,"eyebrows_3":61,"makeup_2":8,"helmet_1":-1,"bags_1":0,"lipstick_3":23,"face":45,"bracelets_1":-1,"tshirt_1":29,"beard_4":0,"moles_2":10,"mask_2":0,"helmet_2":0,"makeup_3":25,"skin":10,"beard_2":0,"shoes":1,"blemishes_2":0,"moles_1":0,"pants_2":0,"complexion_1":0,"glasses_2":1,"age_2":0,"ears_1":12,"watches_2":0,"eyebrows_4":0,"eye_color":3,"lipstick_2":4,"glasses_1":11,"eyebrows_1":1,"ears_2":0,"makeup_4":18,"sun_1":0,"blush_2":0,"torso_2":0,"chest_2":0,"hair_2":0,"tshirt_2":0,"torso_1":257,"lipstick_1":1,"blemishes_1":0,"beard_1":0}'),
	(2, 'ambulance', 1, 'doctor', 'Medecin', 7000, '{"beard_1":0,"eye_color":0,"makeup_3":0,"blemishes_1":0,"mask_1":0,"glasses_1":0,"bproof_2":0,"lipstick_3":0,"beard_2":0,"torso_1":249,"pants_1":24,"blush_3":0,"torso_2":0,"blush_2":0,"complexion_1":0,"lipstick_2":0,"makeup_2":0,"bproof_1":0,"sun_2":0,"complexion_2":0,"chain_2":0,"sun_1":0,"eyebrows_3":0,"tshirt_1":94,"hair_color_1":0,"eyebrows_2":0,"mask_2":0,"helmet_2":0,"hair_2":0,"beard_3":0,"moles_2":0,"bags_1":0,"arms_2":0,"decals_2":0,"age_1":0,"ears_1":-1,"moles_1":0,"bracelets_2":0,"watches_1":-1,"face":0,"bags_2":0,"pants_2":5,"chest_3":0,"blemishes_2":0,"chest_1":0,"hair_color_2":0,"blush_1":0,"tshirt_2":0,"helmet_1":-1,"hair_1":0,"shoes_2":0,"lipstick_4":0,"eyebrows_4":0,"ears_2":0,"watches_2":0,"bodyb_2":0,"bodyb_1":0,"eyebrows_1":0,"decals_1":57,"makeup_4":0,"glasses_2":0,"age_2":0,"shoes_1":8,"arms":90,"chain_1":126,"bracelets_1":-1,"chest_2":0,"beard_4":0,"makeup_1":0,"lipstick_1":0,"skin":0,"sex":0}', '{"age_1":0,"blush_3":0,"complexion_2":0,"bracelets_2":0,"chain_2":0,"bodyb_1":0,"pants_1":51,"hair_1":4,"lipstick_4":0,"bproof_2":0,"bodyb_2":0,"shoes_2":7,"sun_2":0,"blush_1":0,"shoes_1":1,"decals_1":66,"eyebrows_2":10,"makeup_1":6,"glasses":0,"chest_3":0,"bags_2":0,"arms":106,"watches_1":2,"arms_2":0,"hair_color_1":28,"beard_3":0,"chain_1":96,"chest_1":0,"mask_1":0,"sex":1,"decals_2":0,"bproof_1":0,"hair_color_2":28,"eyebrows_3":61,"makeup_2":8,"helmet_1":-1,"bags_1":0,"lipstick_3":23,"face":45,"bracelets_1":-1,"tshirt_1":29,"beard_4":0,"moles_2":10,"mask_2":0,"helmet_2":0,"makeup_3":25,"skin":10,"beard_2":0,"shoes":1,"blemishes_2":0,"moles_1":0,"pants_2":0,"complexion_1":0,"glasses_2":1,"age_2":0,"ears_1":12,"watches_2":0,"eyebrows_4":0,"eye_color":3,"lipstick_2":4,"glasses_1":11,"eyebrows_1":1,"ears_2":0,"makeup_4":18,"sun_1":0,"blush_2":0,"torso_2":2,"chest_2":0,"hair_2":0,"tshirt_2":0,"torso_1":9,"lipstick_1":1,"blemishes_1":0,"beard_1":0}'),
	(3, 'ambulance', 2, 'chief_doctor', 'Médecin-Chef', 9000, '{"beard_1":0,"eye_color":0,"makeup_3":0,"blemishes_1":0,"mask_1":0,"glasses_1":0,"bproof_2":0,"lipstick_3":0,"beard_2":0,"torso_1":249,"pants_1":24,"blush_3":0,"torso_2":0,"blush_2":0,"complexion_1":0,"lipstick_2":0,"makeup_2":0,"bproof_1":0,"sun_2":0,"complexion_2":0,"chain_2":0,"sun_1":0,"eyebrows_3":0,"tshirt_1":94,"hair_color_1":0,"eyebrows_2":0,"mask_2":0,"helmet_2":0,"hair_2":0,"beard_3":0,"moles_2":0,"bags_1":0,"arms_2":0,"decals_2":0,"age_1":0,"ears_1":-1,"moles_1":0,"bracelets_2":0,"watches_1":-1,"face":0,"bags_2":0,"pants_2":5,"chest_3":0,"blemishes_2":0,"chest_1":0,"hair_color_2":0,"blush_1":0,"tshirt_2":0,"helmet_1":-1,"hair_1":0,"shoes_2":0,"lipstick_4":0,"eyebrows_4":0,"ears_2":0,"watches_2":0,"bodyb_2":0,"bodyb_1":0,"eyebrows_1":0,"decals_1":57,"makeup_4":0,"glasses_2":0,"age_2":0,"shoes_1":8,"arms":90,"chain_1":126,"bracelets_1":-1,"chest_2":0,"beard_4":0,"makeup_1":0,"lipstick_1":0,"skin":0,"sex":0}', '{"age_1":0,"blush_3":0,"complexion_2":0,"bracelets_2":0,"chain_2":0,"bodyb_1":0,"pants_1":50,"hair_1":4,"lipstick_4":0,"bproof_2":0,"bodyb_2":0,"shoes_2":2,"sun_2":0,"blush_1":0,"shoes_1":4,"decals_1":66,"eyebrows_2":10,"makeup_1":6,"glasses":0,"chest_3":0,"bags_2":0,"arms":96,"watches_1":2,"arms_2":0,"hair_color_1":28,"beard_3":0,"chain_1":96,"chest_1":0,"mask_1":0,"sex":1,"decals_2":0,"bproof_1":0,"hair_color_2":28,"eyebrows_3":61,"makeup_2":8,"helmet_1":-1,"bags_1":0,"lipstick_3":23,"face":45,"bracelets_1":-1,"tshirt_1":29,"beard_4":0,"moles_2":10,"mask_2":0,"helmet_2":0,"makeup_3":25,"skin":10,"beard_2":0,"shoes":1,"blemishes_2":0,"moles_1":0,"pants_2":0,"complexion_1":0,"glasses_2":1,"age_2":0,"ears_1":12,"watches_2":0,"eyebrows_4":0,"eye_color":3,"lipstick_2":4,"glasses_1":11,"eyebrows_1":1,"ears_2":0,"makeup_4":18,"sun_1":0,"blush_2":0,"torso_2":0,"chest_2":0,"hair_2":0,"tshirt_2":0,"torso_1":258,"lipstick_1":1,"blemishes_1":0,"beard_1":0}'),
	(4, 'ambulance', 3, 'boss', 'Directeur', 10000, '{"beard_1":0,"eye_color":0,"makeup_3":0,"blemishes_1":0,"mask_1":0,"glasses_1":0,"bproof_2":0,"lipstick_3":0,"beard_2":0,"torso_1":249,"pants_1":24,"blush_3":0,"torso_2":0,"blush_2":0,"complexion_1":0,"lipstick_2":0,"makeup_2":0,"bproof_1":0,"sun_2":0,"complexion_2":0,"chain_2":0,"sun_1":0,"eyebrows_3":0,"tshirt_1":94,"hair_color_1":0,"eyebrows_2":0,"mask_2":0,"helmet_2":0,"hair_2":0,"beard_3":0,"moles_2":0,"bags_1":0,"arms_2":0,"decals_2":0,"age_1":0,"ears_1":-1,"moles_1":0,"bracelets_2":0,"watches_1":-1,"face":0,"bags_2":0,"pants_2":5,"chest_3":0,"blemishes_2":0,"chest_1":0,"hair_color_2":0,"blush_1":0,"tshirt_2":0,"helmet_1":-1,"hair_1":0,"shoes_2":0,"lipstick_4":0,"eyebrows_4":0,"ears_2":0,"watches_2":0,"bodyb_2":0,"bodyb_1":0,"eyebrows_1":0,"decals_1":57,"makeup_4":0,"glasses_2":0,"age_2":0,"shoes_1":8,"arms":90,"chain_1":126,"bracelets_1":-1,"chest_2":0,"beard_4":0,"makeup_1":0,"lipstick_1":0,"skin":0,"sex":0}', '{"age_1":0,"blush_3":0,"complexion_2":0,"bracelets_2":0,"chain_2":0,"bodyb_1":0,"pants_1":51,"hair_1":4,"lipstick_4":0,"bproof_2":0,"bodyb_2":0,"shoes_2":2,"sun_2":0,"blush_1":0,"shoes_1":81,"decals_1":66,"eyebrows_2":10,"makeup_1":6,"glasses":0,"chest_3":0,"bags_2":0,"arms":96,"watches_1":2,"arms_2":0,"hair_color_1":28,"beard_3":0,"chain_1":96,"chest_1":0,"mask_1":0,"sex":1,"decals_2":0,"bproof_1":0,"hair_color_2":28,"eyebrows_3":61,"makeup_2":8,"helmet_1":-1,"bags_1":0,"lipstick_3":23,"face":45,"bracelets_1":-1,"tshirt_1":29,"beard_4":0,"moles_2":10,"mask_2":0,"helmet_2":0,"makeup_3":25,"skin":10,"beard_2":0,"shoes":1,"blemishes_2":0,"moles_1":0,"pants_2":0,"complexion_1":0,"glasses_2":1,"age_2":0,"ears_1":12,"watches_2":0,"eyebrows_4":0,"eye_color":3,"lipstick_2":4,"glasses_1":11,"eyebrows_1":1,"ears_2":0,"makeup_4":18,"sun_1":0,"blush_2":0,"torso_2":2,"chest_2":0,"hair_2":0,"tshirt_2":0,"torso_1":14,"lipstick_1":1,"blemishes_1":0,"beard_1":0}'),
	(7, 'avocat', 0, 'recruit', 'Recrue', 1, '{"tshirt_1":57,"torso_1":55,"arms":0,"pants_1":35,"glasses":0,"decals_2":0,"hair_color_2":0,"helmet_2":0,"hair_color_1":5,"face":19,"glasses_2":1,"torso_2":0,"shoes":24,"hair_1":2,"skin":34,"sex":0,"glasses_1":0,"pants_2":0,"hair_2":0,"decals_1":0,"tshirt_2":0,"helmet_1":8}', '{"tshirt_1":34,"torso_1":48,"shoes":24,"pants_1":34,"torso_2":0,"decals_2":0,"hair_color_2":0,"glasses":0,"helmet_2":0,"hair_2":3,"face":21,"decals_1":0,"glasses_2":1,"hair_1":11,"skin":34,"sex":1,"glasses_1":5,"pants_2":0,"arms":14,"hair_color_1":10,"tshirt_2":0,"helmet_1":57}'),
	(8, 'avocat', 1, 'boss', 'Patron', 1, '{"tshirt_1":58,"torso_1":55,"shoes":24,"pants_1":35,"pants_2":0,"decals_2":3,"hair_color_2":0,"face":19,"helmet_2":0,"hair_2":0,"arms":41,"torso_2":0,"hair_color_1":5,"hair_1":2,"skin":34,"sex":0,"glasses_1":0,"glasses_2":1,"decals_1":8,"glasses":0,"tshirt_2":0,"helmet_1":11}', '{"tshirt_1":35,"torso_1":48,"arms":44,"pants_1":34,"pants_2":0,"decals_2":3,"hair_color_2":0,"face":21,"helmet_2":0,"hair_2":3,"decals_1":7,"torso_2":0,"hair_color_1":10,"hair_1":11,"skin":34,"sex":1,"glasses_1":5,"glasses_2":1,"shoes":24,"glasses":0,"tshirt_2":0,"helmet_1":57}'),
	(50, 'police', 0, 'recruit', 'Recrue', 1500, '{}', '{}'),
	(51, 'police', 1, 'officer', 'Officier', 2500, '{}', '{}'),
	(52, 'police', 2, 'sergeant', 'Caporal', 3000, '{}', '{}'),
	(53, 'police', 3, 'chef', 'Sergent', 4000, '{}', '{}'),
	(54, 'police', 4, 'lieutenant', 'Lieutenant', 6500, '{}', '{}'),
	(55, 'police', 5, 'intendent', 'Capitaine', 9000, '{}', '{}'),
	(56, 'police', 6, 'boss', 'Chef de police', 10000, '{}', '{}'),
	(66, 'taxi', 0, 'recrue', 'Recrue', 80, '{}', '{}'),
	(67, 'taxi', 1, 'novice', 'Novice', 1000, '{}', '{}'),
	(68, 'taxi', 2, 'experimente', 'Experimente', 1500, '{}', '{}'),
	(69, 'taxi', 3, 'uber', 'Uber', 1700, '{}', '{}'),
	(70, 'taxi', 4, 'boss', 'Patron', 1, '{}', '{}'),
	(74, 'unemployed', 0, 'unemployed', 'RSA', 25, '{}', '{}'),
	(75, 'unicorn', 0, 'barman', 'Barman', 2500, '{}', '{}'),
	(76, 'unicorn', 1, 'dancer', 'Videur', 5000, '{}', '{}'),
	(77, 'unicorn', 2, 'viceboss', 'Co-gérant', 7500, '{}', '{}'),
	(78, 'unicorn', 3, 'boss', 'Gérant', 10000, '{}', '{}'),
	(79, 'vigne', 0, 'recrue', 'Recrue', 1, '{"tshirt_1":59,"tshirt_2":0,"torso_1":12,"torso_2":5,"shoes_1":7,"shoes_2":2,"pants_1":9, "pants_2":7, "arms":1, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}', '{"tshirt_1":0,"tshirt_2":0,"torso_1":56,"torso_2":0,"shoes_1":27,"shoes_2":0,"pants_1":36, "pants_2":0, "arms":63, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}'),
	(80, 'vigne', 1, 'novice', 'Novice', 1, '{"tshirt_1":57,"tshirt_2":0,"torso_1":13,"torso_2":5,"shoes_1":7,"shoes_2":2,"pants_1":9, "pants_2":7, "arms":11, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}', '{"tshirt_1":0,"tshirt_2":0,"torso_1":56,"torso_2":0,"shoes_1":27,"shoes_2":0,"pants_1":36, "pants_2":0, "arms":63, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}'),
	(81, 'vigne', 2, 'cdisenior', 'Chef de Chai', 1, '{"tshirt_1":57,"tshirt_2":0,"torso_1":13,"torso_2":5,"shoes_1":7,"shoes_2":2,"pants_1":9, "pants_2":7, "arms":11, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}', '{"tshirt_1":0,"tshirt_2":0,"torso_1":56,"torso_2":0,"shoes_1":27,"shoes_2":0,"pants_1":36, "pants_2":0, "arms":63, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}'),
	(82, 'vigne', 3, 'boss', 'Patron', 10000, '{"tshirt_1":57,"tshirt_2":0,"torso_1":13,"torso_2":5,"shoes_1":7,"shoes_2":2,"pants_1":9, "pants_2":7, "arms":11, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}', '{"tshirt_1":15,"tshirt_2":0,"torso_1":14,"torso_2":15,"shoes_1":12,"shoes_2":0,"pants_1":9, "pants_2":5, "arms":1, "helmet_1":11, "helmet_2":0,"bags_1":0,"bags_2":0,"ears_1":0,"glasses_1":0,"ears_2":0,"glasses_2":0}'),
	(148, 'realestateagent', 0, 'location', 'Location', 200, '{}', '{}'),
	(149, 'realestateagent', 1, 'vendeur', 'Vendeur', 200, '{}', '{}'),
	(150, 'realestateagent', 2, 'gestion', 'Gestion', 200, '{}', '{}'),
	(151, 'realestateagent', 3, 'boss', 'Patron', 200, '{}', '{}'),
	(157, 'unemployed2', 0, 'unemployed2', 'Citoyen', 0, '{}', '{}'),
	(182, 'journalist', 0, 'stagiaire', 'Stagiaire', 300, '{}', '{}'),
	(183, 'journalist', 1, 'reporter', 'Reporter', 600, '{}', '{}'),
	(184, 'journalist', 2, 'investigator', 'Investigateur', 1000, '{}', '{}'),
	(185, 'journalist', 3, 'boss', 'Directeur', 3000, '{}', '{}'),
	(462, 'carshop', 0, 'novice', 'Novice', 1500, '{}', '{}'),
	(463, 'carshop', 1, 'sergeant', 'Intermediaire', 2000, '{}', '{}'),
	(464, 'carshop', 2, 'experienced', 'Experimente', 2500, '{}', '{}'),
	(465, 'carshop', 3, 'boss', 'Patron', 5000, '{}', '{}'),
	(466, 'planeshop', 3, 'boss', 'Patron', 200, '{}', '{}'),
	(467, 'planeshop', 2, 'experienced', 'Experimente', 200, '{}', '{}'),
	(468, 'planeshop', 1, 'sergeant', 'Intermediaire', 200, '{}', '{}'),
	(469, 'planeshop', 0, 'novice', 'Novice', 200, '{}', '{}'),
	(470, 'boatshop', 3, 'boss', 'Patron', 200, '{}', '{}'),
	(471, 'boatshop', 2, 'experienced', 'Experimente', 200, '{}', '{}'),
	(472, 'boatshop', 1, 'sergeant', 'Intermediaire', 100, '{}', '{}'),
	(473, 'boatshop', 0, 'novice', 'Novice', 100, '{}', '{}'),
	(800, 'families', 0, 'rookie', 'Associé', 0, '{}', '{}'),
	(801, 'families', 1, 'member', 'Soldat', 0, '{}', '{}'),
	(802, 'families', 2, 'elite', 'Elite', 0, '{}', '{}'),
	(803, 'families', 3, 'lieutenant', 'Lieutenant', 0, '{}', '{}'),
	(804, 'families', 4, 'viceboss', 'Bras Droit', 0, '{}', '{}'),
	(805, 'families', 5, 'boss', 'Patron', 0, '{}', '{}'),
	(860, 'bahamas', 0, 'barman', 'Barman', 1, '{}', '{}'),
	(861, 'bahamas', 1, 'dancer', 'Videur', 1, '{}', '{}'),
	(862, 'bahamas', 2, 'viceboss', 'Co-gérant', 1, '{}', '{}'),
	(863, 'bahamas', 3, 'boss', 'Gérant', 1, '{}', '{}'),
	(1047, 'fbi', 0, 'recruit', 'Recrue', 20, '{}', '{}'),
	(1048, 'fbi', 1, 'officer', 'Officier', 40, '{}', '{}'),
	(1049, 'fbi', 2, 'sergeant', 'Colonel', 60, '{}', '{}'),
	(1050, 'fbi', 3, 'lieutenant', 'Capitaine', 85, '{}', '{}'),
	(1051, 'fbi', 4, 'boss', 'Commandant', 100, '{}', '{}'),
	(1052, 'bennys', 2, 'boss', 'PDG', 5000, '{}', '{}'),
	(1053, 'bennys', 1, 'responsable', 'Responsable', 2500, '{}', '{}'),
	(1054, 'bennys', 0, 'employer', 'Employer', 2500, '{}', '{}'),
	(1058, 'hayesmotor', 2, 'boss', 'PDG', 5000, '{}', '{}'),
	(1059, 'hayesmotor', 1, 'responsable', 'Responsable', 2500, '{}', '{}'),
	(1060, 'hayesmotor', 0, 'employer', 'Employer', 2500, '{}', '{}'),
	(1061, 'dumousap', 2, 'boss', 'PDG', 5000, '{}', '{}'),
	(1062, 'dumousap', 1, 'responsable', 'Responsable', 2500, '{}', '{}'),
	(1063, 'dumousap', 0, 'employer', 'Employer', 2500, '{}', '{}'),
	(1068, 'ballas', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1069, 'ballas', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1070, 'ballas', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1071, 'ballas', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1072, 'vagos', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1073, 'vagos', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1074, 'vagos', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1075, 'vagos', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1076, 'francsmacons', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1077, 'francsmacons', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1078, 'francsmacons', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1079, 'francsmacons', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1080, 'saudiaramco', 1, 'responsable', 'Responsable', 2500, '{}', '{}'),
	(1081, 'saudiaramco', 0, 'employer', 'Employer', 2500, '{}', '{}'),
	(1082, 'saudiaramco', 2, 'boss', 'PDG', 5000, '{}', '{}'),
	(1083, 'lostmc', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1084, 'lostmc', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1085, 'lostmc', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1086, 'lostmc', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1087, 'sowsmarketing', 2, 'boss', 'PDG', 5000, '{}', '{}'),
	(1088, 'sowsmarketing', 1, 'responsable', 'Responsable', 2500, '{}', '{}'),
	(1089, 'sowsmarketing', 0, 'employer', 'Employer', 2500, '{}', '{}'),
	(1090, 'Bloods', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1091, 'Bloods', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1092, 'Bloods', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1093, 'Bloods', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1094, 'blackmarket', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1095, 'blackmarket', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1096, 'blackmarket', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1097, 'blackmarket', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1098, 'hoova', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1099, 'hoova', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1100, 'hoova', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1101, 'hoova', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1102, 'garciafarm', 2, 'boss', 'PDG', 5000, '{}', '{}'),
	(1103, 'garciafarm', 1, 'responsable', 'Responsable', 2500, '{}', '{}'),
	(1104, 'garciafarm', 0, 'employer', 'Employer', 2500, '{}', '{}'),
	(1105, 'tequilala', 2, 'boss', 'PDG', 5000, '{}', '{}'),
	(1106, 'tequilala', 1, 'responsable', 'Responsable', 2500, '{}', '{}'),
	(1107, 'tequilala', 0, 'employer', 'Employer', 2500, '{}', '{}'),
	(1108, 'lacamorra', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1109, 'lacamorra', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1110, 'lacamorra', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1111, 'lacamorra', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1112, 'lapegre', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1113, 'lapegre', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1114, 'lapegre', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1115, 'lapegre', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1116, 'Crips', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1117, 'Crips', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1118, 'Crips', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1119, 'Crips', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1124, 'Madrazo', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1125, 'Madrazo', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1126, 'Madrazo', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1127, 'Madrazo', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1128, 'cosanostra', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1129, 'cosanostra', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1130, 'cosanostra', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1131, 'cosanostra', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1132, 'southside', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1133, 'southside', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1134, 'southside', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1135, 'southside', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1136, 'radiafarm', 2, 'boss', 'PDG', 5000, '{}', '{}'),
	(1137, 'radiafarm', 0, 'employer', 'Employer', 2500, '{}', '{}'),
	(1138, 'radiafarm', 1, 'responsable', 'Responsable', 2500, '{}', '{}'),
	(1154, 'test', 2, 'boss', 'PDG', 5000, '{}', '{}'),
	(1155, 'test', 1, 'responsable', 'Responsable', 2500, '{}', '{}'),
	(1156, 'test', 0, 'employer', 'Employer', 2500, '{}', '{}'),
	(1157, 'peakyblinders', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1158, 'peakyblinders', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1159, 'peakyblinders', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1160, 'peakyblinders', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1161, 'marabunta', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1162, 'marabunta', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1163, 'marabunta', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1164, 'marabunta', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1165, 'coffeezo', 2, 'boss', 'PDG', 5000, '{}', '{}'),
	(1166, 'coffeezo', 1, 'responsable', 'Responsable', 2500, '{}', '{}'),
	(1167, 'coffeezo', 0, 'employer', 'Employer', 2500, '{}', '{}'),
	(1168, 'lesplagues', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1169, 'lesplagues', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1170, 'lesplagues', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1171, 'lesplagues', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1172, 'cigarshop', 2, 'boss', 'PDG', 5000, '{}', '{}'),
	(1173, 'cigarshop', 1, 'responsable', 'Responsable', 2500, '{}', '{}'),
	(1174, 'cigarshop', 0, 'employer', 'Employer', 2500, '{}', '{}'),
	(1175, 'michelin', 2, 'boss', 'PDG', 5000, '{}', '{}'),
	(1176, 'michelin', 1, 'responsable', 'Responsable', 2500, '{}', '{}'),
	(1177, 'michelin', 0, 'employer', 'Employer', 2500, '{}', '{}'),
	(1178, 'maracha', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1179, 'maracha', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1180, 'maracha', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1181, 'maracha', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1182, 'sheriff', 0, 'recruit', 'Recrue', 1500, '{}', '{}'),
	(1183, 'sheriff', 1, 'officer', 'Officier', 2500, '{}', '{}'),
	(1184, 'sheriff', 2, 'sergeant', 'Caporal', 3000, '{}', '{}'),
	(1185, 'sheriff', 3, 'chef', 'Sergent', 4000, '{}', '{}'),
	(1186, 'sheriff', 4, 'lieutenant', 'Lieutenant', 6500, '{}', '{}'),
	(1187, 'sheriff', 5, 'intendent', 'Capitaine', 8000, '{}', '{}'),
	(1188, 'sheriff', 6, 'boss', 'Sheriff', 10000, '{}', '{}'),
	(1189, 'bma', 1, 'responsable', 'Responsable', 2500, '{}', '{}'),
	(1190, 'bma', 2, 'boss', 'PDG', 5000, '{}', '{}'),
	(1191, 'bma', 0, 'employer', 'Employer', 2500, '{}', '{}'),
	(1192, 'burger', 0, 'burger', 'Apprenti Cuisinier', 2500, '{}', '{}'),
	(1193, 'burger', 1, 'burger', 'Cuisinier', 4000, '{}', '{}'),
	(1194, 'burger', 2, 'burger', 'Chef de Brigade', 5000, '{}', '{}'),
	(1195, 'burger', 3, 'boss', 'Patron', 7000, '{}', '{}'),
	(1196, 'yiddish', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1197, 'yiddish', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1198, 'yiddish', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1199, 'yiddish', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1200, 'carterorpailleur', 2, 'boss', 'PDG', 5000, '{}', '{}'),
	(1201, 'carterorpailleur', 1, 'responsable', 'Responsable', 2500, '{}', '{}'),
	(1202, 'carterorpailleur', 0, 'employer', 'Employer', 2500, '{}', '{}'),
	(1203, 'lamainnoir', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1204, 'lamainnoir', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1205, 'lamainnoir', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1206, 'lamainnoir', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1207, 'MerryWeather', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1208, 'MerryWeather', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1209, 'MerryWeather', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1210, 'MerryWeather', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1211, 'merryweather', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1212, 'merryweather', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1213, 'merryweather', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1214, 'merryweather', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1215, 'Predis', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1216, 'Predis', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1217, 'Predis', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1218, 'Predis', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1219, 'Yakuza', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1220, 'Yakuza', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1221, 'Yakuza', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1222, 'Yakuza', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1223, 'Sinaloa', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1224, 'Sinaloa', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1225, 'Sinaloa', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1226, 'Sinaloa', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1227, 'CJNG', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1228, 'CJNG', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1229, 'CJNG', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1230, 'CJNG', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1231, 'MS13', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1232, 'MS13', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1233, 'MS13', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1234, 'MS13', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1235, 'hookah', 2, 'boss', 'PDG', 5000, '{}', '{}'),
	(1236, 'hookah', 1, 'responsable', 'Responsable', 2500, '{}', '{}'),
	(1237, 'hookah', 0, 'employer', 'Employer', 2500, '{}', '{}'),
	(1238, 'lalegion', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1239, 'lalegion', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1240, 'lalegion', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1241, 'lalegion', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1242, 'hayesmotor', 2, 'boss', 'PDG', 5000, '{}', '{}'),
	(1243, 'hayesmotor', 1, 'responsable', 'Responsable', 2500, '{}', '{}'),
	(1244, 'hayesmotor', 0, 'employer', 'Employer', 2500, '{}', '{}'),
	(1245, 'bikeshop', 0, 'novice', 'Novice', 1, '{}', '{}'),
	(1246, 'bikeshop', 1, 'sergeant', 'Intermediaire', 1, '{}', '{}'),
	(1247, 'bikeshop', 2, 'experienced', 'Experimente', 1, '{}', '{}'),
	(1248, 'bikeshop', 3, 'boss', 'Patron', 10000, '{}', '{}'),
	(1249, 'gordo', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1250, 'gordo', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1251, 'gordo', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1252, 'gordo', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1253, 'bennys', 3, 'caca$', 'caca$', 2500, '[]', '[]'),
	(1254, 'bennys', 4, 'test', 'test', 2500, '[]', '[]'),
	(1255, 'Cali', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1256, 'Cali', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1257, 'Cali', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1258, 'Cali', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1259, 'ecorp', 2, 'boss', 'PDG', 5000, '{}', '{}'),
	(1260, 'ecorp', 1, 'responsable', 'Responsable', 2500, '{}', '{}'),
	(1261, 'ecorp', 0, 'employer', 'Employer', 2500, '{}', '{}'),
	(1262, 'BMF', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1263, 'BMF', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1264, 'BMF', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1265, 'BMF', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1270, 'Tijuana', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1271, 'Tijuana', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1272, 'Tijuana', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1273, 'Tijuana', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1274, 'Los Zetas', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1275, 'Los Zetas', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1276, 'Los Zetas', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1277, 'Los Zetas', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1278, 'loszetas', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1279, 'loszetas', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1280, 'loszetas', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1281, 'loszetas', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1282, 'bm', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1283, 'bm', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1284, 'bm', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1285, 'bm', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1286, 'madrazo', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1287, 'madrazo', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1288, 'madrazo', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1289, 'madrazo', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1290, 'Narcomafia', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1291, 'Narcomafia', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1292, 'Narcomafia', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1293, 'Narcomafia', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1294, 'Medelin', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1295, 'Medelin', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1296, 'Medelin', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1297, 'Medelin', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1298, 'mafiacanios', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1299, 'mafiacanios', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1300, 'mafiacanios', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1301, 'mafiacanios', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1302, 'chihuahua', 1, 'recrue', 'Recrue', 500, '{}', '{}'),
	(1303, 'chihuahua', 2, 'employer', 'Employer', 500, '{}', '{}'),
	(1304, 'chihuahua', 3, 'copdg', 'Co-Patron', 500, '{}', '{}'),
	(1305, 'chihuahua', 4, 'boss', 'Patron', 500, '{}', '{}'),
	(1306, 'rodriguez', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1307, 'rodriguez', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1308, 'rodriguez', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1309, 'rodriguez', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1310, 'LaMainNoir', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1311, 'LaMainNoir', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1312, 'LaMainNoir', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1313, 'LaMainNoir', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1314, '667_ekip', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1315, '667_ekip', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1316, '667_ekip', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1317, '667_ekip', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1318, 'lescanaux', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1319, 'lescanaux', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1320, 'lescanaux', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1321, 'lescanaux', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1322, 'Aucun', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1323, 'Aucun', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1324, 'Aucun', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1325, 'Aucun', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1326, 'Aucun', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1327, 'Aucun', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1328, 'Aucun', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1329, 'Aucun', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1330, 'Aucun', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1331, 'Aucun', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1332, 'Aucun', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1333, 'Aucun', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1334, 'Aucun', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1335, 'Aucun', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1336, 'Aucun', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1337, 'Aucun', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1338, 'Aucun', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1339, 'Aucun', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1340, 'Aucun', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1341, 'Aucun', 0, 'recrue', 'Recrue', 0, '{}', '{}'),
	(1342, 'jeanneymar', 3, 'boss', 'Boss', 0, '{}', '{}'),
	(1343, 'jeanneymar', 2, 'gerant', 'Gérant', 0, '{}', '{}'),
	(1344, 'jeanneymar', 1, 'membre', 'Membre', 0, '{}', '{}'),
	(1345, 'jeanneymar', 0, 'recrue', 'Recrue', 0, '{}', '{}');
/*!40000 ALTER TABLE `job_grades` ENABLE KEYS */;

-- Dumping structure for table bluestark.leboncoin
CREATE TABLE IF NOT EXISTS `leboncoin` (
  `id` int(11) DEFAULT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `price` int(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `vehicle` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.leboncoin: ~0 rows (approximately)
/*!40000 ALTER TABLE `leboncoin` DISABLE KEYS */;
/*!40000 ALTER TABLE `leboncoin` ENABLE KEYS */;

-- Dumping structure for table bluestark.licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.licenses: ~6 rows (approximately)
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
REPLACE INTO `licenses` (`type`, `label`) VALUES
	('dmv', 'Code de la route'),
	('drive', 'Permis de conduire'),
	('drive_bike', 'Permis moto'),
	('drive_truck', 'Permis camion'),
	('weapon', 'PPA 1'),
	('weapon2', 'PPA 2');
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;

-- Dumping structure for table bluestark.owned_properties
CREATE TABLE IF NOT EXISTS `owned_properties` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `price` double NOT NULL,
  `rented` int(11) NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_owned_properties_owner` (`owner`) USING BTREE,
  KEY `index_owned_properties_rented` (`rented`) USING BTREE,
  KEY `index_owned_properties_owner_name` (`owner`,`name`(191)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.owned_properties: ~0 rows (approximately)
/*!40000 ALTER TABLE `owned_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_properties` ENABLE KEYS */;

-- Dumping structure for table bluestark.owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `vehicle` longtext COLLATE utf8mb4_bin NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_bin NOT NULL DEFAULT 'car',
  `state` tinyint(1) NOT NULL DEFAULT 0,
  `boutique` tinyint(1) NOT NULL DEFAULT 0,
  `garage` longtext COLLATE utf8mb4_bin DEFAULT 'Parking Central',
  PRIMARY KEY (`plate`) USING BTREE,
  KEY `index_owned_vehicles_owner` (`owner`) USING BTREE,
  KEY `index_owned_vehicles_owner_plate` (`owner`,`plate`) USING BTREE,
  KEY `index_owned_vehicles_owner_type` (`owner`,`type`) USING BTREE,
  KEY `index_owned_vehicles_owner_type_state` (`owner`,`type`,`state`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.owned_vehicles: ~60 rows (approximately)
/*!40000 ALTER TABLE `owned_vehicles` DISABLE KEYS */;
REPLACE INTO `owned_vehicles` (`owner`, `plate`, `label`, `vehicle`, `type`, `state`, `boutique`, `garage`) VALUES
	('license:33d330aae30191a8ae6fe52c2015d5a6576f3d59', '29ENV626', NULL, '{"model":-1403128555,"modSpoilers":-1,"modAirFilter":-1,"modArchCover":-1,"modSpeakers":-1,"modAerials":-1,"modEngineBlock":-1,"color2":41,"wheels":7,"modGrille":-1,"engineHealth":1000.0,"modVanityPlate":-1,"modTransmission":-1,"modSeats":-1,"pearlescentColor":7,"tyreSmokeColor":[255,255,255],"neonColor":[255,0,255],"modPlateHolder":-1,"extras":[],"modLivery":-1,"dirtLevel":0.0,"modDial":-1,"bodyHealth":1000.0,"modDoorSpeaker":-1,"modTrunk":-1,"modSideSkirt":-1,"modDashboard":-1,"modTrimB":-1,"windowTint":-1,"modExhaust":-1,"modEngine":-1,"neonEnabled":[false,false,false,false],"wheelColor":156,"modFrame":-1,"modHydrolic":-1,"modSmokeEnabled":false,"modTrimA":-1,"modAPlate":-1,"modSteeringWheel":-1,"plate":"29ENV626","xenonColor":255,"modXenon":false,"modRightFender":-1,"modRearBumper":-1,"modHood":-1,"modFrontWheels":-1,"modTurbo":false,"modWindows":-1,"modStruts":-1,"modShifterLeavers":-1,"modFrontBumper":-1,"modArmor":-1,"modHorns":-1,"modOrnaments":-1,"modFender":-1,"modBackWheels":-1,"modBrakes":-1,"modSuspension":-1,"fuelLevel":65.0,"modTank":-1,"modRoof":-1,"plateIndex":0,"color1":1}', 'car', 0, 0, 'Parking Central'),
	('license:c036013c3d6f5a5e951dfc69633cdbc51ddf4232', 'AJKI971', 'Panto de Bienvenue', '{"plate":"AJKI971","model":-431692672}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:4d292c606a1a81d2aa4d0b4a9c49672d181b584b', 'AOYX572', 'Panto de Bienvenue', '{"model":-431692672,"plate":"AOYX572"}', 'car', 0, 0, 'Motel arriver en ville'),
	('license:5839bd0648b6519bb31d5e395685d41d4b96cf35', 'ARMA964', 'Panto de Bienvenue', '{"model":-431692672,"plate":"ARMA964"}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:4e2da4d529d2cc3f1c508c526e90d3158e921f98', 'AURM895', 'Panto de Bienvenue', '{"model":-431692672,"plate":"AURM895"}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:84bf89ec01ebc2beebd249d27a292d485af7a22d', 'BEPD239', 'Panto de Bienvenue', '{"plate":"BEPD239","model":-431692672}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:e7b2e663bbf6a24a12b25818893434f812b9c45b', 'BNAZ962', 'Panto de Bienvenue', '{"model":-431692672,"plate":"BNAZ962"}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:01b9eff04a01a7c8323354399d699764c24cb7d7', 'BRNJ277', 'Panto de Bienvenue', '{"model":-431692672,"plate":"BRNJ277"}', 'car', 0, 0, 'Motel arriver en ville'),
	('license:42514dcf5b5f34d8d249a01f66ccdffec3f74833', 'CEQQ939', 'Panto de Bienvenue', '{"model":-431692672,"plate":"CEQQ939"}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:12374a551ca0dc681bed492fe4cd1fc449f757c7', 'DCYV589', 'Panto de Bienvenue', '{"model":-431692672,"plate":"DCYV589"}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:afaba2ad9bca10e18363adece691fdecbcababee', 'DNBQ474', 'Panto de Bienvenue', '{"plate":"DNBQ474","model":-431692672}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:0952c2029a28248d70dc879a193c1b91aa5475fe', 'DVYX216', 'Panto de Bienvenue', '{"model":-431692672,"plate":"DVYX216"}', 'car', 0, 0, 'Motel arriver en ville'),
	('license:043f73f4798aed626c424694b0906308ec92ff57', 'DXYU323', 'Panto de Bienvenue', '{"model":-431692672,"plate":"DXYU323"}', 'car', 0, 0, 'Motel arriver en ville'),
	('license:222c46fedf9fa74880e63ab731894be3fb57c497', 'DZOS616', 'Panto de Bienvenue', '{"plate":"DZOS616","model":-431692672}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:5b545b297e209cdabcc80b0d8644571fd87de093', 'FGFD497', 'Panto de Bienvenue', '{"model":-431692672,"plate":"FGFD497"}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:44730fcd67e41f528b8916be9fdce29964561530', 'FHGJ934', 'Panto de Bienvenue', '{"model":-431692672,"plate":"FHGJ934"}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:222c46fedf9fa74880e63ab731894be3fb57c497', 'GBTO178', 'Panto de Bienvenue', '{"plate":"GBTO178","model":-431692672}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:f57cbaffc364f51fc165f2a95dad2b59b43aa3c8', 'GCQM129', 'Panto de Bienvenue', '{"model":-431692672,"plate":"GCQM129"}', 'car', 0, 0, 'Motel arriver en ville'),
	('license:447dea642a5a99636e9d66ae0607fbf35563d3d2', 'GSRC779', 'Panto de Bienvenue', '{"plate":"GSRC779","model":-431692672}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:3b812812ad65ece34da9a84c3d7aa2bb1257f2a7', 'HQEB618', 'Panto de Bienvenue', '{"model":-431692672,"plate":"HQEB618"}', 'car', 0, 0, 'Motel arriver en ville'),
	('license:d7b1a029b3e0d095633bb27dc9f31e5ac130ca62', 'HZOW847', 'Panto de Bienvenue', '{"plate":"HZOW847","model":-431692672}', 'car', 0, 0, 'Motel arriver en ville'),
	('license:3990e692cecfc4935f9d1af7311017c90e9475d2', 'ICFO883', 'Panto de Bienvenue', '{"plate":"ICFO883","model":-431692672}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:17d8f0a88f62475eac0559a09a7a06355ba9b2ec', 'ICQP889', 'Panto de Bienvenue', '{"model":-431692672,"plate":"ICQP889"}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:74722e5d83c23057107334ec41dc2c5539369201', 'IEDI347', 'Panto de Bienvenue', '{"plate":"IEDI347","model":-431692672}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:5839bd0648b6519bb31d5e395685d41d4b96cf35', 'IVQW399', 'Panto de Bienvenue', '{"model":-431692672,"plate":"IVQW399"}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:697abf7a9220e04e5568b31ce0a1c2d7c254aef0', 'IXVT949', 'Panto de Bienvenue', '{"plate":"IXVT949","model":-431692672}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:afaba2ad9bca10e18363adece691fdecbcababee', 'JJYJ474', 'Panto de Bienvenue', '{"model":-431692672,"plate":"JJYJ474"}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:08bee9809c7e7f8bfdcd7b840afc08b58279f780', 'JRET726', 'Panto de Bienvenue', '{"model":-431692672,"plate":"JRET726"}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:07091b465a1b387c8a6d6968d6c841dcaeae2d57', 'JYFI418', 'Panto de Bienvenue', '{"model":-431692672,"plate":"JYFI418"}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:4b4fcf49c6967afd572191f73919f593bcf6d4c2', 'JZUQ996', 'Panto de Bienvenue', '{"plate":"JZUQ996","model":-431692672}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:63b7781c2a1bc429c70113ad64f73ae69ce0a789', 'KLHN874', 'Panto de Bienvenue', '{"model":-431692672,"plate":"KLHN874"}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:d5978481098e92d4daafbbef17620e54dec79196', 'LHKH729', 'Panto de Bienvenue', '{"plate":"LHKH729","model":-431692672}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:23eb122fbc001b121afd443767a90c32ce8d58b2', 'LMTG282', 'Panto de Bienvenue', '{"xenonColor":255,"modDial":-1,"modFrame":-1,"extras":{"2":true,"1":true,"4":true,"3":true,"5":true},"windowTint":-1,"modHorns":-1,"modVanityPlate":-1,"modLivery":-1,"modHydrolic":-1,"modFrontWheels":-1,"modStruts":-1,"pearlescentColor":0,"modTrimB":-1,"modEngineBlock":-1,"modWindows":-1,"modRightFender":-1,"tyreSmokeColor":[255,255,255],"modSpoilers":-1,"neonColor":[255,0,255],"plateIndex":3,"modAirFilter":-1,"modAPlate":-1,"modTransmission":-1,"modTank":-1,"modSuspension":4,"modExhaust":4,"bodyHealth":1000.0,"modAerials":-1,"modHood":-1,"modTrunk":-1,"modOrnaments":-1,"modGrille":-1,"modArmor":4,"modArchCover":-1,"modEngine":-1,"modBackWheels":-1,"dirtLevel":5.1,"neonEnabled":[false,false,false,false],"model":-431692672,"modSmokeEnabled":false,"modRearBumper":-1,"color2":3,"modDashboard":-1,"modFrontBumper":-1,"modSeats":-1,"modTurbo":1,"color1":3,"wheels":5,"modSpeakers":-1,"modXenon":false,"modTrimA":-1,"modFender":-1,"modPlateHolder":-1,"modBrakes":-1,"plate":"LMTG282","modRoof":-1,"modSteeringWheel":-1,"fuelLevel":65.0,"modShifterLeavers":-1,"wheelColor":156,"engineHealth":1000.0,"modSideSkirt":2,"modDoorSpeaker":-1}', 'car', 0, 0, 'Motel arriver en ville'),
	('license:d4e9cbeaacc2b0ce1d1c8ce7f53ee71b8183867c', 'LROA579', 'Panto de Bienvenue', '{"model":-431692672,"plate":"LROA579"}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:d9725f63efe9d0d53a0883c78cb79f14db186780', 'LXUL922', 'Panto de Bienvenue', '{"model":-431692672,"plate":"LXUL922"}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:33d330aae30191a8ae6fe52c2015d5a6576f3d59', 'MBOW633', 'Panto de Bienvenue', '{"modDoorSpeaker":-1,"windowTint":-1,"modFrontWheels":-1,"wheels":5,"modVanityPlate":-1,"modTransmission":-1,"engineHealth":1000.0,"modArmor":-1,"tyreSmokeColor":[255,255,255],"modArchCover":-1,"modFrontBumper":-1,"modAerials":-1,"modWindows":-1,"modDial":-1,"fuelLevel":65.0,"modPlateHolder":-1,"plateIndex":3,"modSideSkirt":-1,"modEngine":-1,"modSpeakers":-1,"modHorns":-1,"modSeats":-1,"modAirFilter":-1,"modShifterLeavers":-1,"modTrimA":-1,"modRightFender":-1,"modHydrolic":-1,"modRearBumper":-1,"dirtLevel":3.5,"modExhaust":-1,"modRoof":-1,"extras":{"5":true,"4":true,"3":true,"2":true,"1":true},"modTurbo":false,"model":-431692672,"modOrnaments":-1,"modSteeringWheel":-1,"modGrille":-1,"modStruts":-1,"modHood":-1,"pearlescentColor":0,"modTank":-1,"modFender":-1,"modTrimB":-1,"modBrakes":-1,"neonColor":[255,0,255],"modSmokeEnabled":false,"modXenon":false,"modFrame":-1,"modEngineBlock":-1,"modTrunk":-1,"neonEnabled":[false,false,false,false],"xenonColor":255,"wheelColor":156,"modSuspension":-1,"modAPlate":-1,"bodyHealth":945.0,"modSpoilers":-1,"color2":3,"plate":"MBOW633","modDashboard":-1,"modBackWheels":-1,"color1":3,"modLivery":-1}', 'car', 1, 0, 'GaragePDM'),
	('license:676c7031a7e3c4b1fe6d534ebfbfe1ae4af49d16', 'MJBJ115', 'Panto de Bienvenue', '{"plate":"MJBJ115","model":-431692672}', 'car', 0, 0, 'Motel arriver en ville'),
	('license:08bee9809c7e7f8bfdcd7b840afc08b58279f780', 'NPIU856', 'Panto de Bienvenue', '{"model":-431692672,"plate":"NPIU856"}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:e8a849c4ebb701efb4f651c6bf596d80252cad42', 'NSWO652', 'Panto de Bienvenue', '{"model":-431692672,"plate":"NSWO652"}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:4d3d0f2b343cdf45ff0b7089a4859ea99e183cfa', 'NWHZ816', 'Panto de Bienvenue', '{"plate":"NWHZ816","model":-431692672}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:521045187680e125d6b9fb3f7f8e035bb1c3a1bc', 'OCSZ497', 'Panto de Bienvenue', '{"model":-431692672,"plate":"OCSZ497"}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:f5788bac547691e212faa76eb9e71f46da796d50', 'ODRI768', 'Panto de Bienvenue', '{"plate":"ODRI768","model":-431692672}', 'car', 0, 0, 'Motel arriver en ville'),
	('license:ca1d88031d0d25bcca2ab217cbe329177c25cff9', 'PDED281', 'Panto de Bienvenue', '{"model":-431692672,"plate":"PDED281"}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:5839bd0648b6519bb31d5e395685d41d4b96cf35', 'QMKY681', 'Panto de Bienvenue', '{"model":-431692672,"plate":"QMKY681"}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:17f2b8a5c19f26e1e136c114dfe204bc708ee87e', 'QRGW871', 'Panto de Bienvenue', '{"plate":"QRGW871","model":-431692672}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:222c46fedf9fa74880e63ab731894be3fb57c497', 'QRIS368', 'Panto de Bienvenue', '{"model":-431692672,"plate":"QRIS368"}', 'car', 0, 0, 'Motel arriver en ville'),
	('license:4d3d0f2b343cdf45ff0b7089a4859ea99e183cfa', 'QTIL286', 'Panto de Bienvenue', '{"plate":"QTIL286","model":-431692672}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:8b2dd308c0f10d32e5a363e13f7d1d016161668f', 'SRKA843', 'Panto de Bienvenue', '{"model":-431692672,"plate":"SRKA843"}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:6b4fbc2620bf3fe8fe144b88ecde934e50ac49c9', 'SRPM263', 'Panto de Bienvenue', '{"model":-431692672,"plate":"SRPM263"}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:676c7031a7e3c4b1fe6d534ebfbfe1ae4af49d16', 'THRX733', 'Panto de Bienvenue', '{"plate":"THRX733","model":-431692672}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:5839bd0648b6519bb31d5e395685d41d4b96cf35', 'UPDU748', 'Panto de Bienvenue', '{"model":-431692672,"plate":"UPDU748"}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:676c7031a7e3c4b1fe6d534ebfbfe1ae4af49d16', 'UQVE287', 'Panto de Bienvenue', '{"model":-431692672,"plate":"UQVE287"}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:c48b0294f78a28f6f264a7adfa68a5b3f4cdc4f9', 'VHRH339', 'Panto de Bienvenue', '{"plate":"VHRH339","model":-431692672}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:8b2dd308c0f10d32e5a363e13f7d1d016161668f', 'VJOB452', 'Panto de Bienvenue', '{"model":-431692672,"plate":"VJOB452"}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:222c46fedf9fa74880e63ab731894be3fb57c497', 'VWII655', 'Panto de Bienvenue', '{"model":-431692672,"plate":"VWII655"}', 'car', 0, 0, 'Motel arriver en ville'),
	('license:3b812812ad65ece34da9a84c3d7aa2bb1257f2a7', 'XCZP847', 'Panto de Bienvenue', '{"model":-431692672,"plate":"XCZP847"}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:cf5d504aad8457773961dd28b37ce37e16db8923', 'XMFB435', 'Panto de Bienvenue', '{"model":-431692672,"plate":"XMFB435"}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:5e6b1e3c9912bca10bbf0a2258cab659480d5e21', 'ZRAH977', 'Panto de Bienvenue', '{"model":-431692672,"plate":"ZRAH977"}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:17d8f0a88f62475eac0559a09a7a06355ba9b2ec', 'ZRSP481', 'Panto de Bienvenue', '{"model":-431692672,"plate":"ZRSP481"}', 'car', 1, 0, 'Motel arriver en ville'),
	('license:4d3d0f2b343cdf45ff0b7089a4859ea99e183cfa', 'ZZPQ174', 'Panto de Bienvenue', '{"plate":"ZZPQ174","model":-431692672}', 'car', 1, 0, 'Motel arriver en ville');
/*!40000 ALTER TABLE `owned_vehicles` ENABLE KEYS */;

-- Dumping structure for table bluestark.phone_accounts
CREATE TABLE IF NOT EXISTS `phone_accounts` (
  `app` varchar(50) NOT NULL,
  `id` varchar(80) NOT NULL,
  `name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `birthdate` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `interested` text NOT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.phone_accounts: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_accounts` ENABLE KEYS */;

-- Dumping structure for table bluestark.phone_app_chat
CREATE TABLE IF NOT EXISTS `phone_app_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) CHARACTER SET utf8 NOT NULL,
  `message` varchar(255) CHARACTER SET utf8 NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_phone_app_chat_channel` (`channel`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.phone_app_chat: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_app_chat` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_app_chat` ENABLE KEYS */;

-- Dumping structure for table bluestark.phone_calls
CREATE TABLE IF NOT EXISTS `phone_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(10) COLLATE utf8mb4_bin NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) COLLATE utf8mb4_bin NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_phone_calls_owner` (`owner`) USING BTREE,
  KEY `index_phone_calls_owner_num` (`owner`,`num`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.phone_calls: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_calls` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_calls` ENABLE KEYS */;

-- Dumping structure for table bluestark.phone_chats
CREATE TABLE IF NOT EXISTS `phone_chats` (
  `app` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `created` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.phone_chats: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_chats` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_chats` ENABLE KEYS */;

-- Dumping structure for table bluestark.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) DEFAULT NULL,
  `number` varchar(50) NOT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `messages` text NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `read` int(11) DEFAULT NULL,
  `created` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.phone_messages: ~1 rows (approximately)
/*!40000 ALTER TABLE `phone_messages` DISABLE KEYS */;
REPLACE INTO `phone_messages` (`id`, `phone`, `number`, `owner`, `messages`, `type`, `read`, `created`) VALUES
	(23, '555717828', '555364100', NULL, '[{"read":0,"owner":"555717828","type":"message","created":"2022-03-04 21:38:55","message":"https://media.discordapp.net/attachments/947364707772284929/949420705227886602/screenshot.jpg"},{"read":0,"owner":"555717828","type":"location","created":"2022-03-04 21:39:12","message":"{\\"y\\":-1049.2962646484376,\\"x\\":-796.66552734375}"},{"read":0,"owner":"555717828","type":"message","created":"2022-03-04 21:39:15","message":"vien fdp"},{"read":0,"owner":"555717828","type":"message","created":"2022-03-04 21:39:19","message":"jte baise ta mere"},{"read":0,"owner":"555717828","type":"message","created":"2022-03-04 21:39:34","message":"vien si ta des couilles morpion"},{"read":0,"owner":"555717828","type":"message","created":"2022-03-04 22:27:18","message":"https://media.discordapp.net/attachments/947364707772284929/949432879778242570/screenshot.jpg"}]', NULL, NULL, '2022-03-04 22:27:18');
/*!40000 ALTER TABLE `phone_messages` ENABLE KEYS */;

-- Dumping structure for table bluestark.phone_notifies
CREATE TABLE IF NOT EXISTS `phone_notifies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL,
  `msg_content` text NOT NULL,
  `msg_head` varchar(50) NOT NULL DEFAULT '',
  `app_name` text NOT NULL,
  `msg_time` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.phone_notifies: ~0 rows (approximately)
/*!40000 ALTER TABLE `phone_notifies` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_notifies` ENABLE KEYS */;

-- Dumping structure for table bluestark.phone_users_contacts
CREATE TABLE IF NOT EXISTS `phone_users_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `number` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `display` varchar(64) COLLATE utf8mb4_bin NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `index_phone_users_contacts_identifier` (`identifier`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.phone_users_contacts: 0 rows
/*!40000 ALTER TABLE `phone_users_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_users_contacts` ENABLE KEYS */;

-- Dumping structure for table bluestark.playerstattoos
CREATE TABLE IF NOT EXISTS `playerstattoos` (
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `tattoos` longtext COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.playerstattoos: ~1 rows (approximately)
/*!40000 ALTER TABLE `playerstattoos` DISABLE KEYS */;
REPLACE INTO `playerstattoos` (`identifier`, `tattoos`) VALUES
	('license:afaba2ad9bca10e18363adece691fdecbcababee', '[{"name":-504012739,"cat":-975527441}]');
/*!40000 ALTER TABLE `playerstattoos` ENABLE KEYS */;

-- Dumping structure for table bluestark.players_sims
CREATE TABLE IF NOT EXISTS `players_sims` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) NOT NULL DEFAULT '0',
  `sim_list` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.players_sims: ~0 rows (approximately)
/*!40000 ALTER TABLE `players_sims` DISABLE KEYS */;
/*!40000 ALTER TABLE `players_sims` ENABLE KEYS */;

-- Dumping structure for table bluestark.player_contacts
CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0',
  `display` varchar(50) DEFAULT NULL,
  `note` text NOT NULL,
  `pp` text NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `identifier` (`identifier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.player_contacts: ~0 rows (approximately)
/*!40000 ALTER TABLE `player_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_contacts` ENABLE KEYS */;

-- Dumping structure for table bluestark.player_gallery
CREATE TABLE IF NOT EXISTS `player_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` text NOT NULL,
  `resim` text NOT NULL,
  `data` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.player_gallery: ~0 rows (approximately)
/*!40000 ALTER TABLE `player_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_gallery` ENABLE KEYS */;

-- Dumping structure for table bluestark.player_mails
CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) NOT NULL,
  `sender` varchar(50) NOT NULL,
  `subject` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `identifier` (`identifier`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.player_mails: ~0 rows (approximately)
/*!40000 ALTER TABLE `player_mails` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_mails` ENABLE KEYS */;

-- Dumping structure for table bluestark.player_notes
CREATE TABLE IF NOT EXISTS `player_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` text NOT NULL,
  `baslik` text NOT NULL,
  `aciklama` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.player_notes: ~2 rows (approximately)
/*!40000 ALTER TABLE `player_notes` DISABLE KEYS */;
REPLACE INTO `player_notes` (`id`, `identifier`, `baslik`, `aciklama`) VALUES
	(1, 'license:222c46fedf9fa74880e63ab731894be3fb57c497', '', 'La description...'),
	(2, 'license:afaba2ad9bca10e18363adece691fdecbcababee', 'eeeee', 'eee');
/*!40000 ALTER TABLE `player_notes` ENABLE KEYS */;

-- Dumping structure for table bluestark.properties_list
CREATE TABLE IF NOT EXISTS `properties_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `isBuy` varchar(255) DEFAULT '0',
  `owner` text DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `parms` longtext DEFAULT NULL,
  `immeuble` varchar(50) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=303 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.properties_list: ~268 rows (approximately)
/*!40000 ALTER TABLE `properties_list` DISABLE KEYS */;
REPLACE INTO `properties_list` (`id`, `name`, `info`, `price`, `coords`, `isBuy`, `owner`, `data`, `parms`, `immeuble`) VALUES
	(3, '3668_maison', '{"name":"3668_maison","label":"3668 maison","poids":3000}', '130000', '{"EXIT":{"x":119.92054748535156,"y":494.32421875,"z":147.34291076660157},"COFFRE":{"x":-623.0919189453125,"y":54.69309997558594,"z":96.59940338134766},"ENTER":{"x":-612.1599731445313,"y":59.06000137329101,"z":97.19999694824219}}', '1', 'license:c8aaab24f2a78a03b3ad2c0614d8c808e0f03260', '{"item":[],"accounts":{"dirtycash":500,"cash":500},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(4, 'entrepot', '{"poids":200000,"label":"Entrepot","name":"entrepot"}', '800000', '{"EXIT":{"x":94.2906723022461,"y":-2694.380126953125,"z":6.00023508071899},"COFFRE":{"x":999.58251953125,"y":-3096.294677734375,"z":-39.99980163574219},"ENTER":{"x":1026.505615234375,"y":-3099.83203125,"z":-38.99980163574219}}', '1', 'loszetas', '{"item":[],"accounts":{"cash":0,"dirtycash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":{"Boss":true,"Recrue":true,"Gérant":true,"Membre":true}}', '0'),
	(6, 'maison_gs', '{"poids":2500,"label":"Maison GS","name":"maison_gs"}', '60000', '{"EXIT":{"x":126.77969360351563,"y":-1930.051025390625,"z":21.38243675231933},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:561ddb77ecc374bc600b67f059d9e93aa511ead1', '{"item":[],"weapons":{"681978":{"label":"Mini smg","name":"WEAPON_MINISMG","ammo":0},"542666":{"label":"Mini smg","name":"WEAPON_MINISMG","ammo":190}},"accounts":{"cash":10000,"dirtycash":4832961}}', '{"PeopleAlloweds":[{"identifier":"license:282af042151034d6fda5abe2cf84a31a2269544f","name":"Pxrple<3"}],"GradesAlloweds":[]}', '0'),
	(7, 'maison_gs2', '{"poids":2500,"label":"Maison GS2","name":"maison_gs2"}', '60000', '{"EXIT":{"x":118.35969543457031,"y":-1920.9464111328126,"z":21.3234806060791},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:282af042151034d6fda5abe2cf84a31a2269544f', '{"accounts":{"cash":0,"dirtycash":1469037},"weapons":{"943448":{"label":"Pistolet calibre 50","ammo":244,"name":"WEAPON_PISTOL50"},"148663":{"label":"Smg","ammo":0,"name":"WEAPON_SMG"}},"item":{"alcoolbrut":{"label":"Alcool Brut","count":1,"name":"alcoolbrut"},"ecstasy":{"label":"Ecstasy","count":2,"name":"ecstasy"},"jusfruit":{"label":"Jus de fruits","count":1,"name":"jusfruit"},"drill":{"label":"Perceuse","count":2,"name":"drill"},"bankcard":{"label":"Carte d\'accès Banque","count":3,"name":"bankcard"}}}', '{"PeopleAlloweds":[{"name":"Louane44","identifier":"license:561ddb77ecc374bc600b67f059d9e93aa511ead1"}],"GradesAlloweds":[]}', '0'),
	(8, 'maison_gs3', '{"poids":2500,"label":"Maison GS3","name":"maison_gs3"}', '60000', '{"EXIT":{"x":100.78573608398438,"y":-1912.1259765625,"z":21.40752029418945},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:2e1026f2aa217c0c63c2d3961cfd18287e9cfe08', '{"accounts":{"cash":0,"dirtycash":0},"weapons":{"740891":{"ammo":0,"name":"WEAPON_CROWBAR","label":"Pied de biche"},"993057":{"ammo":0,"name":"WEAPON_KNUCKLE","label":"Poing américain"}},"item":{"pelle":{"name":"pelle","count":1,"label":"Pelle"},"whisky":{"name":"whisky","count":8,"label":"Whisky"},"vodka":{"name":"vodka","count":8,"label":"Vodka"},"alcooldecontrebande":{"name":"alcooldecontrebande","count":1,"label":"Alcool de Contrebande"},"jewels":{"name":"jewels","count":739,"label":"Bijou"},"rhum":{"name":"rhum","count":6,"label":"Rhum"},"radio":{"name":"radio","count":1,"label":"Radio"},"weedtraitement":{"name":"weedtraitement","count":102,"label":"Pochon de Weed"},"purplehazerecolte":{"name":"purplehazerecolte","count":1,"label":"Purple Haze"},"heroinerecolte":{"name":"heroinerecolte","count":12,"label":"Héroine pure"},"acierrecolte":{"name":"acierrecolte","count":21,"label":"Acier"}}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(9, 'gs', '{"poids":2500,"label":"GS","name":"gs"}', '60000', '{"EXIT":{"x":92.16691589355469,"y":-1891.57958984375,"z":24.11055183410644},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:e998554b3f26c630ca16141a5e5b18294538cd28', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(12, 'pete_wola', '{"poids":2500,"label":"PETE WOLA","name":"pete_wola"}', '60000', '{"EXIT":{"x":125.18701171875,"y":-1956.722412109375,"z":20.73476409912109},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:50dc547c8aa9e72664a8149107f877d097cbaecb', '{"item":[],"accounts":{"dirtycash":14000,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(14, 'shag', '{"poids":2500,"label":"Shag","name":"shag"}', '60000', '{"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":72.38465118408203,"y":-1939.070068359375,"z":21.36906623840332}}', '1', 'license:420716c5861e174d528b2f47f4d7abfedce92586', '{"item":{"weedtraitement":{"label":"Pochon de Weed","name":"weedtraitement","count":150}},"accounts":{"dirtycash":0,"cash":0},"weapons":{"638035":{"ammo":0,"name":"WEAPON_MINISMG","label":"Mini smg"}}}', '{"GradesAlloweds":[],"PeopleAlloweds":[]}', '0'),
	(15, 'hotel_68_1', '{"poids":1000,"label":"Hotel 68 1","name":"hotel_68_1"}', '60000', '{"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711},"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0},"EXIT":{"x":1142.38623046875,"y":2654.832275390625,"z":38.15132522583008}}', '1', 'coffeezo', '{"item":{"phone":{"count":1,"name":"phone","label":"Téléphone"},"methrecolte":{"count":277,"name":"methrecolte","label":"Méthamphétamine"},"cocainetraitement":{"count":125,"name":"cocainetraitement","label":"Pochon de Cocaïne"},"chargeur":{"count":6,"name":"chargeur","label":"Chargeur"},"cocainerecolte":{"count":33,"name":"cocainerecolte","label":"Cocaïne"},"jager":{"count":4,"name":"jager","label":"Jägermeister"},"methtraitement":{"count":13,"name":"methtraitement","label":"Pochon de Méthamphétamine"},"weedtraitement":{"count":2,"name":"weedtraitement","label":"Pochon de Weed"}},"accounts":{"dirtycash":0,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(16, 'oe', '{"poids":1000,"label":"oe","name":"oe"}', '60000', '{"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711},"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0},"EXIT":{"x":4165.43896484375,"y":943.6828002929688,"z":-46.77050018310547}}', '1', 'license:50dc547c8aa9e72664a8149107f877d097cbaecb', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(17, 'hotel_68_2', '{"poids":1000,"label":"Hotel 68 2","name":"hotel_68_2"}', '60000', '{"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711},"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0},"EXIT":{"x":1142.1156005859376,"y":2651.16162109375,"z":38.1408576965332}}', '1', 'license:ee5744c7af05da622c4b8e66dccb6c6320dad0b4', '{"item":{"chargeur":{"count":20,"name":"chargeur","label":"Chargeur"}},"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(18, 'vnw', '{"poids":3000,"label":"VNW","name":"vnw"}', '1300000', '{"ENTER":{"x":-612.1599731445313,"y":59.06000137329101,"z":97.19999694824219},"COFFRE":{"x":-623.0919189453125,"y":54.69309997558594,"z":96.59940338134766},"EXIT":{"x":-704.2678833007813,"y":588.4144897460938,"z":142.28268432617188}}', '1', 'license:ee5744c7af05da622c4b8e66dccb6c6320dad0b4', '{"accounts":{"dirtycash":0,"cash":0},"item":[],"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(19, 'vinewood_hills', '{"poids":4000,"label":"Vinewood Hills","name":"vinewood_hills"}', '3500000', '{"ENTER":{"x":-1459.1700439453126,"y":-520.5800170898438,"z":54.92900085449219},"COFFRE":{"x":-1456.83740234375,"y":-531.0899047851563,"z":55.9369010925293},"EXIT":{"x":-167.98526000976563,"y":916.2569580078125,"z":235.6554412841797}}', '1', 'license:23c66a535937500eee94e25a100247846cc0f23a', '{"item":{"vodka":{"count":3,"name":"vodka","label":"Vodka"},"phone":{"count":1,"name":"phone","label":"Téléphone"}},"accounts":{"dirtycash":0,"cash":150000},"weapons":{"718583":{"label":"Fusil avancé","name":"WEAPON_ADVANCEDRIFLE","ammo":100},"516219":{"label":"Pistolet de combat","name":"WEAPON_COMBATPISTOL","ammo":0},"87699":{"label":"Lampe torche","name":"WEAPON_FLASHLIGHT","ammo":0},"319977":{"label":"Pistolet calibre 50","name":"WEAPON_PISTOL50","ammo":246},"712986":{"label":"Fusil à pompe","name":"WEAPON_PUMPSHOTGUN","ammo":100}}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(20, 'riche_2', '{"poids":3500,"label":"rIche 2","name":"riche_2"}', '5000000', '{"ENTER":{"x":-785.1300048828125,"y":315.7900085449219,"z":187.91000366210938},"COFFRE":{"x":-795.7161254882813,"y":326.81500244140627,"z":186.31289672851563},"EXIT":{"x":-85.93480682373047,"y":834.817626953125,"z":235.92005920410157}}', '1', 'peakyblinders', '{"accounts":{"dirtycash":0,"cash":0},"weapons":{},"item":{"cocainetraitement":{"name":"cocainetraitement","count":9,"label":"Pochon de Cocaïne"},"pelle":{"name":"pelle","label":"Pelle","count":1}}}', '{"GradesAlloweds":[],"PeopleAlloweds":[]}', '0'),
	(21, 'entrepot_petit', '{"poids":75000,"label":"Entrepot Petit","name":"entrepot_petit"}', '100000', '{"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"EXIT":{"x":717.138916015625,"y":-654.2357177734375,"z":27.80059051513672}}', '1', 'cigarshop', '{"item":{"cigare":{"count":5,"name":"cigare","label":"Cigare"},"opiumrecolte":{"count":2,"name":"opiumrecolte","label":"Opium"}},"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(23, 'moyen_entrepot', '{"poids":100000,"label":"Moyen Entrepot","name":"moyen_entrepot"}', '500000', '{"ENTER":{"x":1048.5067138671876,"y":-3097.081787109375,"z":-38.99990081787109},"COFFRE":{"x":1070.829345703125,"y":-3098.585205078125,"z":-39.99990081787109},"EXIT":{"x":876.2446899414063,"y":-2328.37353515625,"z":30.34582901000976}}', '1', 'license:7a4b715cf5123e1a0754960af64d67c9d177f115', '{"weapons":{"285616":{"ammo":250,"label":"Micro smg","name":"WEAPON_MICROSMG"},"163442":{"ammo":250,"label":"Revolver","name":"WEAPON_REVOLVER"},"303319":{"ammo":250,"label":"Revolver","name":"WEAPON_REVOLVER"},"596597":{"ammo":250,"label":"Revolver","name":"WEAPON_REVOLVER"},"535807":{"ammo":250,"label":"Smg","name":"WEAPON_SMG"}},"item":[],"accounts":{"cash":0,"dirtycash":47934}}', '{"PeopleAlloweds":[{"name":"azime","identifier":"license:9a799f9773c9e7b17b0116dc39584468beb8d106"},{"name":"ELIAS BRABUS I le guépard","identifier":"license:7a4b715cf5123e1a0754960af64d67c9d177f115"},{"name":"moham","identifier":"license:750655e71ad70cacffcd094fe6c0ecf43ffab7d2"}],"GradesAlloweds":[]}', '0'),
	(24, 'entrepot_gambino', '{"poids":100000,"label":"Entrepot Gambino","name":"entrepot_gambino"}', '500000', '{"EXIT":{"x":-1572.2435302734376,"y":772.58984375,"z":189.1944122314453},"COFFRE":{"x":1070.829345703125,"y":-3098.585205078125,"z":-39.99990081787109},"ENTER":{"x":1048.5067138671876,"y":-3097.081787109375,"z":-38.99990081787109}}', '1', 'license:1f32cd6cd7da4a53f3702c4d0d5bdac888de993b', '{"item":[],"weapons":{"333550":{"label":"Pistolet calibre 50","name":"WEAPON_PISTOL50","ammo":0},"782182":{"label":"Pistolet sns","name":"WEAPON_SNSPISTOL","ammo":0},"850081":{"label":"Mini smg","name":"WEAPON_MINISMG","ammo":250},"264260":{"label":"Pistolet sns","name":"WEAPON_SNSPISTOL","ammo":0},"889450":{"label":"Micro smg","name":"WEAPON_MICROSMG","ammo":250},"203526":{"label":"Pistolet calibre 50","name":"WEAPON_PISTOL50","ammo":0},"175859":{"label":"Revolver","name":"WEAPON_REVOLVER","ammo":250},"676291":{"label":"Mini smg","name":"WEAPON_MINISMG","ammo":0},"375918":{"label":"Pistolet","name":"WEAPON_PISTOL","ammo":250},"818587":{"label":"Smg","name":"WEAPON_SMG","ammo":250},"893316":{"label":"Pistolet","name":"WEAPON_PISTOL","ammo":250},"254242":{"label":"Pistolet","name":"WEAPON_PISTOL","ammo":25},"154888":{"label":"Pistolet calibre 50","name":"WEAPON_PISTOL50","ammo":0},"593133":{"label":"Pistolet sns","name":"WEAPON_SNSPISTOL","ammo":0},"585301":{"label":"Pistolet calibre 50","name":"WEAPON_PISTOL50","ammo":0},"558593":{"label":"Pistolet lourd","name":"WEAPON_HEAVYPISTOL","ammo":250},"326875":{"label":"Pistolet sns","name":"WEAPON_SNSPISTOL","ammo":0},"604864":{"label":"Mini smg","name":"WEAPON_MINISMG","ammo":250},"666020":{"label":"Mini smg","name":"WEAPON_MINISMG","ammo":250},"93083":{"label":"Pistolet lourd","name":"WEAPON_HEAVYPISTOL","ammo":250},"272970":{"label":"Revolver","name":"WEAPON_REVOLVER","ammo":250},"987027":{"label":"Pistolet sns","name":"WEAPON_SNSPISTOL","ammo":0},"701924":{"label":"Smg","name":"WEAPON_SMG","ammo":250},"971377":{"label":"Pistolet","name":"WEAPON_PISTOL","ammo":250},"600034":{"label":"Pistolet","name":"WEAPON_PISTOL","ammo":250},"150383":{"label":"Smg","name":"WEAPON_SMG","ammo":250},"821273":{"label":"Pistolet","name":"WEAPON_PISTOL","ammo":250}},"accounts":{"cash":0,"dirtycash":0}}', '{"PeopleAlloweds":[{"identifier":"license:6980912d38af164487200de5870f669efce0eb3c","name":"Narek"},{"identifier":"license:a4ed91e6cf31bdd2054bc1a653cbe1849f1e8819","name":"Theo Solo"},{"identifier":"license:ee5744c7af05da622c4b8e66dccb6c6320dad0b4","name":"Mathilde"}],"GradesAlloweds":[]}', '0'),
	(25, 'mais_jsp_1', '{"poids":2500,"label":"mais jsp 1","name":"mais_jsp_1"}', '60000', '{"EXIT":{"x":251.9937744140625,"y":358.5341796875,"z":105.94160461425781},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:9f3e769c4665305caf706b6b868dcbedb56e79b6', '{"item":{"methrecolte":{"count":165,"name":"methrecolte","label":"Méthamphétamine"}},"accounts":{"dirtycash":0,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(26, 'villa_jsp_1', '{"poids":4000,"label":"villa jsp 1","name":"villa_jsp_1"}', '3500000', '{"EXIT":{"x":37.71105194091797,"y":365.63372802734377,"z":116.02938079833985},"COFFRE":{"x":-1456.83740234375,"y":-531.0899047851563,"z":55.9369010925293},"ENTER":{"x":-1459.1700439453126,"y":-520.5800170898438,"z":54.92900085449219}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(27, 'entrepot_jose_pablo', '{"poids":200000,"label":"Entrepot Jose Pablo","name":"entrepot_jose_pablo"}', '800000', '{"EXIT":{"x":800.5247802734375,"y":-961.8522338867188,"z":25.93009185791015},"COFFRE":{"x":999.58251953125,"y":-3096.294677734375,"z":-39.99980163574219},"ENTER":{"x":1026.505615234375,"y":-3099.83203125,"z":-38.99980163574219}}', '1', 'license:9f3e769c4665305caf706b6b868dcbedb56e79b6', '{"item":{"cocainetraitement":{"count":55,"name":"cocainetraitement","label":"Pochon de Cocaïne"},"cagoule":{"count":1,"name":"cagoule","label":"Cagoule"},"chargeur":{"count":17,"name":"chargeur","label":"Chargeur"},"opiumtraitement":{"count":74,"name":"opiumtraitement","label":"Pochon d\'opium"},"methtraitement":{"count":55,"name":"methtraitement","label":"Pochon de Méthamphétamine"},"weedtraitement":{"count":45,"name":"weedtraitement","label":"Pochon de Weed"}},"accounts":{"dirtycash":195500,"cash":0},"weapons":{"499652":{"label":"Smg","name":"WEAPON_SMG","ammo":244},"998997":{"label":"Smg","name":"WEAPON_SMG","ammo":249},"250619":{"label":"Pistolet","name":"WEAPON_PISTOL","ammo":25},"674149":{"label":"Queue de billard","name":"WEAPON_POOLCUE","ammo":0},"326393":{"label":"Pistolet sns","name":"WEAPON_SNSPISTOL","ammo":0}}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(28, 'maison_monkey_joseph', '{"poids":2500,"label":"Maison Monkey Joseph","name":"maison_monkey_joseph"}', '60000', '{"EXIT":{"x":315.31976318359377,"y":-711.1676635742188,"z":29.31678962707519},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:3abf19fc7b7dacf101c8df407973d01520516855', '{"accounts":{"dirtycash":0,"cash":0},"weapons":[],"item":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(29, 'maison_pablo_garcia', '{"poids":2500,"label":"Maison Pablo Garcia","name":"maison_pablo_garcia"}', '60000', '{"EXIT":{"x":3.58832311630249,"y":36.4202995300293,"z":71.53044891357422},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'rodriguez', '{"item":{"opiumrecolte":{"label":"Opium","count":67,"name":"opiumrecolte"},"methtraitement":{"label":"Pochon de Méthamphétamine","count":1,"name":"methtraitement"}},"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":{"Gérant":true,"Recrue":true,"Membre":true,"Boss":true}}', '0'),
	(30, 'entrepot_narek', '{"poids":75000,"label":"Entrepot Narek","name":"entrepot_narek"}', '100000', '{"EXIT":{"x":569.32666015625,"y":2796.576171875,"z":42.01830291748047},"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164}}', '1', 'license:6980912d38af164487200de5870f669efce0eb3c', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(31, 'hotel_68_4', '{"poids":1000,"label":"Hotel 68 4","name":"hotel_68_4"}', '60000', '{"EXIT":{"x":1142.2113037109376,"y":2643.498046875,"z":38.14370346069336},"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711},"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0}}', '1', 'license:b14de8c02720c405191619a55dde2b618a9c8e8e', '{"item":{"chargeur":{"count":4,"name":"chargeur","label":"Chargeur"},"cocainetraitement":{"count":2,"name":"cocainetraitement","label":"Pochon de Cocaïne"},"opiumtraitement":{"count":43,"name":"opiumtraitement","label":"Pochon d\'opium"},"cocainerecolte":{"count":15,"name":"cocainerecolte","label":"Cocaïne"}},"accounts":{"dirtycash":205500,"cash":58500},"weapons":{"376480":{"label":"Pistolet calibre 50","name":"WEAPON_PISTOL50","ammo":250}}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(32, 'chambre_5_68', '{"poids":1000,"label":"Chambre 5 68","name":"chambre_5_68"}', '60000', '{"EXIT":{"x":1136.4002685546876,"y":2641.85400390625,"z":38.14375686645508},"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711},"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0}}', '1', 'license:b96c4b642e9609f3476adb23a7278074748eb332', '{"item":{"cocainetraitement":{"count":10,"name":"cocainetraitement","label":"Pochon de Cocaïne"},"opiumtraitement":{"count":148,"name":"opiumtraitement","label":"Pochon d\'opium"},"heroinerecolte":{"count":31,"name":"heroinerecolte","label":"Héroine pure"},"bandage":{"count":3,"name":"bandage","label":"Bandage"},"pelle":{"count":4,"name":"pelle","label":"Pelle"},"methtraitement":{"count":59,"name":"methtraitement","label":"Pochon de Méthamphétamine"},"weedtraitement":{"count":9,"name":"weedtraitement","label":"Pochon de Weed"}},"accounts":{"dirtycash":619327,"cash":0},"weapons":{"902702":{"label":"Lampe torche","name":"WEAPON_FLASHLIGHT","ammo":0}}}', '{"PeopleAlloweds":[{"identifier":"license:d098e6ff86f9b6d069e47908d282832a7f7b9ece","name":"Emillio Quavo"}],"GradesAlloweds":[]}', '0'),
	(33, 'chambre_6_68', '{"poids":1000,"label":"Chambre 6 68","name":"chambre_6_68"}', '60000', '{"EXIT":{"x":1132.8013916015626,"y":2641.75732421875,"z":38.14375686645508},"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711},"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0}}', '1', 'hayesmotor', '{"item":{"pelle":{"count":1,"name":"pelle","label":"Pelle"}},"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(34, 'chambre_7_68', '{"poids":1000,"label":"Chambre 7 68","name":"chambre_7_68"}', '60000', '{"EXIT":{"x":1125.30615234375,"y":2642.08544921875,"z":38.14373016357422},"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711},"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0}}', '1', 'license:846bd2b11b30dbe0df9a2144682f448e33ff56dc', '{"item":[],"accounts":{"dirtycash":157000,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(35, 'chambre_8_68', '{"poids":1000,"label":"Chambre 8 68","name":"chambre_8_68"}', '60000', '{"EXIT":{"x":1121.35009765625,"y":2641.85693359375,"z":38.14373016357422},"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711},"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0}}', '1', 'license:ddee917113328737a68e92c32136da8f8d8e1680', '{"item":[],"accounts":{"dirtycash":86582,"cash":0},"weapons":{"728963":{"label":"Smg","name":"WEAPON_SMG","ammo":0},"879648":{"label":"Smg","name":"WEAPON_SMG","ammo":0},"583473":{"label":"Mini smg","name":"WEAPON_MINISMG","ammo":0},"389436":{"label":"Mini smg","name":"WEAPON_MINISMG","ammo":0},"813375":{"label":"Mini smg","name":"WEAPON_MINISMG","ammo":250},"418854":{"label":"Smg","name":"WEAPON_SMG","ammo":250},"710777":{"label":"Smg","name":"WEAPON_SMG","ammo":0},"498565":{"label":"Pistolet lourd","name":"WEAPON_HEAVYPISTOL","ammo":250},"64211":{"label":"Mini smg","name":"WEAPON_MINISMG","ammo":0},"800025":{"label":"Mini smg","name":"WEAPON_MINISMG","ammo":250},"617921":{"label":"Pistolet lourd","name":"WEAPON_HEAVYPISTOL","ammo":250},"351749":{"label":"Smg","name":"WEAPON_SMG","ammo":0},"505880":{"label":"Smg","name":"WEAPON_SMG","ammo":0},"562649":{"label":"Pistolet lourd","name":"WEAPON_HEAVYPISTOL","ammo":250},"234255":{"label":"Couteau","name":"WEAPON_KNIFE","ammo":0},"913648":{"label":"Pistolet lourd","name":"WEAPON_HEAVYPISTOL","ammo":0},"551508":{"label":"Pistolet calibre 50","name":"WEAPON_PISTOL50","ammo":0},"726082":{"label":"Mini smg","name":"WEAPON_MINISMG","ammo":0}}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(36, 'chambre_9_68', '{"poids":1000,"label":"Chambre 9 68","name":"chambre_9_68"}', '60000', '{"EXIT":{"x":1114.8316650390626,"y":2641.73583984375,"z":38.14373016357422},"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711},"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0}}', '1', 'license:7a06622facc898bf1314eae04b59dd37e3715b82', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(37, 'chambre_10_68', '{"poids":1000,"label":"Chambre 10 68","name":"chambre_10_68"}', '60000', '{"EXIT":{"x":1107.219482421875,"y":2641.982666015625,"z":38.14375686645508},"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711},"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0}}', '1', 'license:743211c70863e1550f2cf33c436455d94d01e030', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(38, 'chambre_11_68', '{"poids":1000,"label":"Chambre 11 68","name":"chambre_11_68"}', '60000', '{"EXIT":{"x":1106.4864501953126,"y":2649.23828125,"z":38.14093780517578},"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711},"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0}}', '1', 'license:9f3e769c4665305caf706b6b868dcbedb56e79b6', '{"item":{"radio":{"count":1,"name":"radio","label":"Radio"}},"accounts":{"dirtycash":0,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[{"identifier":"license:ec9e8b810a8e32b699bd8b5dda8111702c47a740","name":"foxy"}],"GradesAlloweds":[]}', '0'),
	(39, 'chambre_12_68', '{"poids":1000,"label":"Chambre 12 68","name":"chambre_12_68"}', '60000', '{"EXIT":{"x":1106.3223876953126,"y":2652.745361328125,"z":38.14092254638672},"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711},"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0}}', '1', 'license:a2b7f7bfbc58aedcd8d7d20ea66044dde818dec7', '{"item":{},"accounts":{"dirtycash":0,"cash":0},"weapons":{"500045":{"label":"Mini smg","name":"WEAPON_MINISMG","ammo":0},"287078":{"label":"Smg","name":"WEAPON_SMG","ammo":250}}}', '{"PeopleAlloweds":[{"identifier":"license:0bea9b56247df54d733df626d0c9d8e8408138b8","name":"donv440"},{"identifier":"license:796c073fd5dcf8d8f86102d68310167944790034","name":"Boldy Ryg | Nxyako"},{"identifier":"license:796c073fd5dcf8d8f86102d68310167944790034","name":"Boldy Ryg | Nxyako"},{"identifier":"license:be5d7be853b4150fe0feb87f9c2ccadb208cc79c","name":"Rayan"},{"identifier":"license:be5d7be853b4150fe0feb87f9c2ccadb208cc79c","name":"Rayan"},{"identifier":"license:796c073fd5dcf8d8f86102d68310167944790034","name":"Boldy Ryg | Nxyako"}],"GradesAlloweds":[]}', '0'),
	(40, 'la_maison_de_riche_3565', '{"poids":2500,"name":"la_maison_de_riche_3565","label":"la maison de riche 3565"}', '60000', '{"EXIT":{"x":-516.5264892578125,"y":433.4960632324219,"z":97.79531860351563},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:5e80a146b9a9c55f641a529ce1385042ff9fe87c', '{"item":{"acierrecolte":{"count":7,"name":"acierrecolte","label":"Acier"},"opiumtraitement":{"count":2,"name":"opiumtraitement","label":"Pochon d\'opium"},"cocainetraitement":{"count":1,"name":"cocainetraitement","label":"Pochon de Cocaïne"}},"accounts":{"dirtycash":22174,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[{"identifier":"license:107fd3c5df4a4604179df9b2f91195d96a0d8641","name":"FAHI"}],"GradesAlloweds":[]}', '0'),
	(41, 'la_petite_maison_villa', '{"poids":3000,"name":"la_petite_maison_villa","label":"la petite maison villa"}', '1300000', '{"EXIT":{"x":-536.645751953125,"y":477.2901916503906,"z":103.1916732788086},"COFFRE":{"x":-623.0919189453125,"y":54.69309997558594,"z":96.59940338134766},"ENTER":{"x":-612.1599731445313,"y":59.06000137329101,"z":97.19999694824219}}', '1', 'license:23c66a535937500eee94e25a100247846cc0f23a', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(42, 'la_maison_villa_wtf2', '{"poids":3000,"name":"la_maison_villa_wtf2","label":"la maison villa wtf2"}', '1300000', '{"EXIT":{"x":-580.5076293945313,"y":491.64288330078127,"z":108.90301513671875},"COFFRE":{"x":-623.0919189453125,"y":54.69309997558594,"z":96.59940338134766},"ENTER":{"x":-612.1599731445313,"y":59.06000137329101,"z":97.19999694824219}}', '1', 'hookah', '{"item":{"opiumtraitement":{"count":23,"name":"opiumtraitement","label":"Pochon d\'opium"},"opiumrecolte":{"count":14,"name":"opiumrecolte","label":"Opium"},"ammoniac":{"count":13,"name":"ammoniac","label":"Ammoniac"},"jewels":{"count":6,"name":"jewels","label":"Bijou"},"cocainetraitement":{"count":62,"name":"cocainetraitement","label":"Pochon de Cocaïne"},"weedtraitement":{"count":17,"name":"weedtraitement","label":"Pochon de Weed"}},"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":{"Employer":false,"Responsable":true,"PDG":true}}', '0'),
	(43, 'la_maison_wtf3', '{"poids":3000,"name":"la_maison_wtf3","label":"la maison wtf3"}', '1300000', '{"EXIT":{"x":-595.5332641601563,"y":530.333251953125,"z":107.75455474853516},"COFFRE":{"x":-623.0919189453125,"y":54.69309997558594,"z":96.59940338134766},"ENTER":{"x":-612.1599731445313,"y":59.06000137329101,"z":97.19999694824219}}', '1', 'license:ef3b4effc66a53022e19be35cc9e05ba2a526c36', '{"item":{},"accounts":{"dirtycash":0,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[{"identifier":"license:5c1ba5ea8c8665a4e4e9f227c5fefec1618fce9f","name":"Morgane Foster"},{"identifier":"license:075fbf1c2eef781531c2e5b1f183371deea9fb9e","name":"Léaa"}],"GradesAlloweds":[]}', '0'),
	(44, 'la_maison_grande_wtf3', '{"poids":3000,"name":"la_maison_grande_wtf3","label":"la maison grande wtf3"}', '1300000', '{"EXIT":{"x":-622.9070434570313,"y":488.859130859375,"z":108.87708282470703},"COFFRE":{"x":-623.0919189453125,"y":54.69309997558594,"z":96.59940338134766},"ENTER":{"x":-612.1599731445313,"y":59.06000137329101,"z":97.19999694824219}}', '0', NULL, '{"weapons":[],"item":[],"accounts":{"dirtycash":0,"cash":0}}', '{"PeopleAlloweds":[{"name":"Alexgame44c","identifier":"license:671d775eb357da102aaa878a1b6185d4b0fde67a"},{"name":"Alexgame44c","identifier":"license:671d775eb357da102aaa878a1b6185d4b0fde67a"},{"name":"Arkanoii","identifier":"license:368355b49de2d8fb45a76236ba49ca8319ebf522"},{"name":"Hernandez Walker","identifier":"license:91f203df56b10bb964ef4e87882c28a2602d6afb"},{"name":"Jonhson Hopes","identifier":"license:0f6b72da2358e4907c6c3522b3e08320bf34e334"},{"name":"Zef_59","identifier":"license:dbe2862c00d0a9365b13708f424a632a066161d2"},{"name":"Raphaël","identifier":"license:7a1d5cf0c90e2f9df74c6e4a53bae69f8975f646"}],"GradesAlloweds":[]}', '0'),
	(45, '2842', '{"poids":3000,"name":"2842","label":"2842"}', '1300000', '{"EXIT":{"x":-640.9065551757813,"y":520.5450439453125,"z":109.8825454711914},"COFFRE":{"x":-623.0919189453125,"y":54.69309997558594,"z":96.59940338134766},"ENTER":{"x":-612.1599731445313,"y":59.06000137329101,"z":97.19999694824219}}', '1', 'license:f1ff7aa47f696374b34b5dfbcd6ca65abd74f911', '{"item":{"methrecolte":{"count":4,"name":"methrecolte","label":"Méthamphétamine"},"cocainetraitement":{"count":17,"name":"cocainetraitement","label":"Pochon de Cocaïne"},"codeine":{"count":25,"name":"codeine","label":"Codéine"},"opiumtraitement":{"count":34,"name":"opiumtraitement","label":"Pochon d\'opium"},"methtraitement":{"count":41,"name":"methtraitement","label":"Pochon de Méthamphétamine"},"weedtraitement":{"count":21,"name":"weedtraitement","label":"Pochon de Weed"}},"accounts":{"dirtycash":309902,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(46, '18948498', '{"poids":3000,"name":"18948498","label":"18948498"}', '1300000', '{"EXIT":{"x":-667.1510009765625,"y":471.4707946777344,"z":114.13648223876953},"COFFRE":{"x":-623.0919189453125,"y":54.69309997558594,"z":96.59940338134766},"ENTER":{"x":-612.1599731445313,"y":59.06000137329101,"z":97.19999694824219}}', '1', 'license:f1fb70d6bef866b0df700a0e488d87c1ddbe522f', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(47, 'maison_grande_wtf_lol', '{"poids":3000,"name":"maison_grande_wtf_lol","label":"maison grande wtf lol"}', '1300000', '{"EXIT":{"x":-678.8681030273438,"y":512.1074829101563,"z":113.52609252929688},"COFFRE":{"x":-623.0919189453125,"y":54.69309997558594,"z":96.59940338134766},"ENTER":{"x":-612.1599731445313,"y":59.06000137329101,"z":97.19999694824219}}', '1', 'Predis', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":{"Boss":true,"Recrue":true,"Gérant":true,"Membre":true}}', '0'),
	(48, '2893', '{"poids":3000,"name":"2893","label":"2893"}', '1300000', '{"EXIT":{"x":-717.7902221679688,"y":448.64044189453127,"z":106.90911102294922},"COFFRE":{"x":-623.0919189453125,"y":54.69309997558594,"z":96.59940338134766},"ENTER":{"x":-612.1599731445313,"y":59.06000137329101,"z":97.19999694824219}}', '1', 'license:7a1d5cf0c90e2f9df74c6e4a53bae69f8975f646', '{"weapons":[],"item":{"weedtraitement":{"count":2,"label":"Pochon de Weed","name":"weedtraitement"},"cafemoulu":{"count":10,"label":"Café Moulu","name":"cafemoulu"},"cocainetraitement":{"count":10,"label":"Pochon de Cocaïne","name":"cocainetraitement"},"opiumtraitement":{"count":1,"label":"Pochon d\'opium","name":"opiumtraitement"},"methtraitement":{"count":1,"label":"Pochon de Méthamphétamine","name":"methtraitement"}},"accounts":{"cash":0,"dirtycash":0}}', '{"PeopleAlloweds":[{"name":"Batoanbadlo du 13","identifier":"license:86827dee90f49105d505615595c5c6b523f43f22"}],"GradesAlloweds":[]}', '0'),
	(49, 'maison_grande_wtf_lol4', '{"poids":3000,"name":"maison_grande_wtf_lol4","label":"maison grande wtf lol4"}', '1300000', '{"EXIT":{"x":-762.13427734375,"y":430.9089050292969,"z":100.19683074951172},"COFFRE":{"x":-623.0919189453125,"y":54.69309997558594,"z":96.59940338134766},"ENTER":{"x":-612.1599731445313,"y":59.06000137329101,"z":97.19999694824219}}', '1', 'license:306ba7bc8392d02e979509019f5aaef62027bb48', '{"item":{"ammoniac":{"count":30,"name":"ammoniac","label":"Ammoniac"},"ecstasy":{"count":10,"name":"ecstasy","label":"Ecstasy"}},"accounts":{"dirtycash":861692,"cash":0},"weapons":{"200346":{"label":"Pistolet calibre 50","name":"WEAPON_PISTOL50","ammo":249}}}', '{"PeopleAlloweds":[{"identifier":"license:0eb5dd59f784f4b39b787001a1ed31e489c5627f","name":"EnzoClix"}],"GradesAlloweds":[]}', '0'),
	(50, '2836', '{"poids":3500,"name":"2836","label":"2836"}', '5000000', '{"EXIT":{"x":-784.364013671875,"y":459.42694091796877,"z":100.17903137207031},"COFFRE":{"x":-795.7161254882813,"y":326.81500244140627,"z":186.31289672851563},"ENTER":{"x":-785.1300048828125,"y":315.7900085449219,"z":187.91000366210938}}', '1', 'vigne', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(52, 'maison_2837', '{"poids":3500,"name":"maison_2837","label":"maison 2837"}', '5000000', '{"EXIT":{"x":-842.8220825195313,"y":466.8560791015625,"z":87.59654998779297},"COFFRE":{"x":-795.7161254882813,"y":326.81500244140627,"z":186.31289672851563},"ENTER":{"x":-785.1300048828125,"y":315.7900085449219,"z":187.91000366210938}}', '1', 'license:282af042151034d6fda5abe2cf84a31a2269544f', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[{"identifier":"license:561ddb77ecc374bc600b67f059d9e93aa511ead1","name":"Louane44"}],"GradesAlloweds":[]}', '0'),
	(53, '2117', '{"poids":3000,"name":"2117","label":"2117"}', '1300000', '{"EXIT":{"x":-866.435302734375,"y":457.73687744140627,"z":88.28108215332031},"COFFRE":{"x":-623.0919189453125,"y":54.69309997558594,"z":96.59940338134766},"ENTER":{"x":-612.1599731445313,"y":59.06000137329101,"z":97.19999694824219}}', '1', 'license:23c66a535937500eee94e25a100247846cc0f23a', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(54, 'entrepot_ewen_le_gros', '{"poids":75000,"name":"entrepot_ewen_le_gros","label":"entrepot ewen le gros"}', '100000', '{"EXIT":{"x":15.81519699096679,"y":-1032.261962890625,"z":29.44968795776367},"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164}}', '1', 'license:c8aaab24f2a78a03b3ad2c0614d8c808e0f03260', '{"item":{"water":{"count":1,"name":"water","label":"Bouteille d\'eau"}},"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(55, 'piercegins_entrepot', '{"label":"piercegins entrepot","name":"piercegins_entrepot","poids":75000}', '100000', '{"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"EXIT":{"x":-1196.88134765625,"y":-1501.1492919921876,"z":4.33107137680053}}', '1', 'police', '{"item":{"methrecolte":{"count":18,"name":"methrecolte","label":"Méthamphétamine"},"cocainetraitement":{"count":181,"name":"cocainetraitement","label":"Pochon de Cocaïne"},"opiumrecolte":{"count":11,"name":"opiumrecolte","label":"Opium"},"ammoniac":{"count":12,"name":"ammoniac","label":"Ammoniac"},"methtraitement":{"count":125,"name":"methtraitement","label":"Pochon de Méthamphétamine"},"opiumtraitement":{"count":87,"name":"opiumtraitement","label":"Pochon d\'opium"}},"accounts":{"dirtycash":0,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(56, 'entrepot_fashion_star', '{"label":"entrepot fashion star","name":"entrepot_fashion_star","poids":75000}', '100000', '{"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"EXIT":{"x":-1204.42626953125,"y":-1489.786376953125,"z":4.34627151489257}}', '1', 'license:4674d08924a6f359d4003b2492f870afc1bf90ec', '{"item":{"weedtraitement":{"count":1261,"name":"weedtraitement","label":"Pochon de Weed"}},"accounts":{"dirtycash":0,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(57, 'entrepot_pierciengs_2', '{"label":"entrepot pierciengs 2","name":"entrepot_pierciengs_2","poids":75000}', '100000', '{"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"EXIT":{"x":-1201.511962890625,"y":-1474.1903076171876,"z":4.34711265563964}}', '1', 'license:9c994cbf762626cffba6e4b609e58686a5cb21c9', '{"item":[],"accounts":{"dirtycash":2183094,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(59, 'azk_la_pute', '{"label":"azk la pute","name":"azk_la_pute","poids":2500}', '60000', '{"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"EXIT":{"x":1265.8358154296876,"y":-457.9317932128906,"z":70.51161193847656}}', '1', 'license:c8aaab24f2a78a03b3ad2c0614d8c808e0f03260', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(60, 'entrepot_canno', '{"name":"entrepot_canno","poids":200000,"label":"Entrepot Canno"}', '800000', '{"EXIT":{"x":808.7864990234375,"y":-1049.8341064453126,"z":28.19679641723632},"COFFRE":{"x":999.58251953125,"y":-3096.294677734375,"z":-39.99980163574219},"ENTER":{"x":1026.505615234375,"y":-3099.83203125,"z":-38.99980163574219}}', '1', 'Bloods', '{"accounts":{"dirtycash":0,"cash":0},"weapons":[],"item":{"cocainerecolte":{"label":"Cocaïne","name":"cocainerecolte","count":1},"aciertraitement":{"label":"Acier Traité","name":"aciertraitement","count":121},"munition":{"label":"Munition","name":"munition","count":8},"methrecolte":{"label":"Méthamphétamine","name":"methrecolte","count":10},"water":{"label":"Bouteille d\'eau","name":"water","count":10},"traitementheroine":{"label":"Pochon d\'héroine","name":"traitementheroine","count":711},"weedrecolte":{"label":"Weed","name":"weedrecolte","count":30},"phone":{"label":"Téléphone","name":"phone","count":1},"pochonice":{"label":"pochon d\'ice","name":"pochonice","count":23}}}', '{"GradesAlloweds":{"Recrue":true,"Gérant":true,"Membre":true,"Boss":true},"PeopleAlloweds":[]}', '0'),
	(61, 'petite_maison_pc', '{"name":"petite_maison_pc","poids":2500,"label":"Petite Maison PC"}', '60000', '{"EXIT":{"x":291.8253479003906,"y":-1078.873046875,"z":29.40435791015625},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:c2177f72d561678da5023fec79eb75331a80baf1', '{"item":{"bandage":{"label":"Bandage","count":2,"name":"bandage"},"opiumtraitement":{"label":"Pochon d\'opium","count":39,"name":"opiumtraitement"},"Mongolienne":{"label":"Mongolienne","count":9,"name":"Mongolienne"},"cocainetraitement":{"label":"Pochon de Cocaïne","count":106,"name":"cocainetraitement"},"jewels":{"label":"Bijou","count":27,"name":"jewels"},"hotdog":{"label":"Hot Dog","count":6,"name":"hotdog"},"medikit":{"label":"Medikit","count":6,"name":"medikit"},"malte":{"label":"Malte","count":1,"name":"malte"},"pochoncodeine":{"label":"Pochon de Codéine","count":5,"name":"pochoncodeine"},"gazoile":{"label":"Gazoile","count":8,"name":"gazoile"},"ecstasy":{"label":"Ecstasy","count":70,"name":"ecstasy"},"methtraitement":{"label":"Pochon de Méthamphétamine","count":54,"name":"methtraitement"},"ketaminetraitement":{"label":"Pochon de Kétamine","count":35,"name":"ketaminetraitement"},"heroinerecolte":{"label":"Héroine pure","count":2,"name":"heroinerecolte"},"opiumrecolte":{"label":"Opium","count":132,"name":"opiumrecolte"},"weedtraitement":{"label":"Pochon de Weed","count":37,"name":"weedtraitement"},"methrecolte":{"label":"Méthamphétamine","count":7,"name":"methrecolte"},"icetea":{"label":"Ice Tea","count":29,"name":"icetea"},"pepiteor":{"label":"Pépite d\'or","count":33,"name":"pepiteor"},"water":{"label":"Bouteille d\'eau","count":9,"name":"water"},"ammoniac":{"label":"Ammoniac","count":10,"name":"ammoniac"},"pochonice":{"label":"pochon d\'ice","count":3,"name":"pochonice"}},"weapons":{"992040":{"label":"Smg","ammo":232,"name":"WEAPON_SMG"},"754824":{"label":"Mini smg","ammo":118,"name":"WEAPON_MINISMG"}},"accounts":{"dirtycash":749233,"cash":0}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(62, 'entrepot_kalash', '{"name":"entrepot_kalash","poids":200000,"label":"Entrepot Kalash"}', '800000', '{"EXIT":{"x":-26.52677917480468,"y":-190.71800231933595,"z":52.35823822021484},"COFFRE":{"x":999.58251953125,"y":-3096.294677734375,"z":-39.99980163574219},"ENTER":{"x":1026.505615234375,"y":-3099.83203125,"z":-38.99980163574219}}', '1', 'license:b7ad1ee3719b181d40026bb2b1956f28b0bdc184', '{"item":{"hotdog":{"count":1,"name":"hotdog","label":"Hot Dog"},"jewels":{"count":425,"name":"jewels","label":"Bijou"},"methtraitement":{"count":25,"name":"methtraitement","label":"Pochon de Méthamphétamine"},"weedtraitement":{"count":24,"name":"weedtraitement","label":"Pochon de Weed"},"munition":{"count":92,"name":"munition","label":"Munition"},"opiumtraitement":{"count":25,"name":"opiumtraitement","label":"Pochon d\'opium"},"opiumrecolte":{"count":1069,"name":"opiumrecolte","label":"Opium"},"cocainerecolte":{"count":70,"name":"cocainerecolte","label":"Cocaïne"},"water":{"count":1,"name":"water","label":"Bouteille d\'eau"},"aluminium":{"count":82,"name":"aluminium","label":"Aluminium"},"cocainetraitement":{"count":145,"name":"cocainetraitement","label":"Pochon de Cocaïne"}},"accounts":{"dirtycash":0,"cash":20000},"weapons":[]}', '{"PeopleAlloweds":[{"identifier":"license:05efc5ba7e81e6720633c521bbf82315b3a51945","name":"acer"}],"GradesAlloweds":[]}', '0'),
	(63, 'entrepôt_nerh_1', '{"name":"entrepôt_nerh_1","poids":200000,"label":"Entrepôt Nerh 1"}', '800000', '{"EXIT":{"x":1490.571533203125,"y":-1910.5059814453126,"z":71.51750183105469},"COFFRE":{"x":999.58251953125,"y":-3096.294677734375,"z":-39.99980163574219},"ENTER":{"x":1026.505615234375,"y":-3099.83203125,"z":-38.99980163574219}}', '1', 'license:a89dcac0be6253bfda5acb050ca6d884fa11cc48', '{"item":{"medikit":{"count":863,"name":"medikit","label":"Medikit"},"opiumrecolte":{"count":22,"name":"opiumrecolte","label":"Opium"},"cocainerecolte":{"count":16,"name":"cocainerecolte","label":"Cocaïne"},"ammoniac":{"count":4,"name":"ammoniac","label":"Ammoniac"},"methtraitement":{"count":9,"name":"methtraitement","label":"Pochon de Méthamphétamine"},"weedtraitement":{"count":216,"name":"weedtraitement","label":"Pochon de Weed"}},"accounts":{"dirtycash":0,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(64, 'entrepôt_nerh_2', '{"name":"entrepôt_nerh_2","poids":100000,"label":"Entrepôt Nerh 2"}', '500000', '{"EXIT":{"x":1223.9310302734376,"y":-482.0670166015625,"z":66.40383911132813},"COFFRE":{"x":1070.829345703125,"y":-3098.585205078125,"z":-39.99990081787109},"ENTER":{"x":1048.5067138671876,"y":-3097.081787109375,"z":-38.99990081787109}}', '1', 'license:23c66a535937500eee94e25a100247846cc0f23a', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(65, 'villa_adam', '{"name":"villa_adam","poids":3500,"label":"Villa Adam"}', '5000000', '{"EXIT":{"x":-2587.85205078125,"y":1911.00439453125,"z":167.49887084960938},"COFFRE":{"x":-795.7161254882813,"y":326.81500244140627,"z":186.31289672851563},"ENTER":{"x":-785.1300048828125,"y":315.7900085449219,"z":187.91000366210938}}', '1', 'license:23c66a535937500eee94e25a100247846cc0f23a', '{"item":{"cocainerecolte":{"count":11,"name":"cocainerecolte","label":"Cocaïne"}},"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(66, 'entrepot_dixon_1', '{"name":"entrepot_dixon_1","poids":200000,"label":"Entrepot Dixon 1"}', '800000', '{"EXIT":{"x":453.0809326171875,"y":-1305.382568359375,"z":30.12087249755859},"COFFRE":{"x":999.58251953125,"y":-3096.294677734375,"z":-39.99980163574219},"ENTER":{"x":1026.505615234375,"y":-3099.83203125,"z":-38.99980163574219}}', '1', 'license:5effe65abbb11faac4376e547811481ce5656b1f', '{"item":{"police_cuff":{"count":2,"name":"police_cuff","label":"Menottes LSPD"},"methrecolte":{"count":1,"name":"methrecolte","label":"Méthamphétamine"},"ammoniac":{"count":6,"name":"ammoniac","label":"Ammoniac"},"ecstasy":{"count":3,"name":"ecstasy","label":"Ecstasy"},"methtraitement":{"count":305,"name":"methtraitement","label":"Pochon de Méthamphétamine"},"weedtraitement":{"count":52,"name":"weedtraitement","label":"Pochon de Weed"},"chargeur":{"count":25,"name":"chargeur","label":"Chargeur"},"opiumtraitement":{"count":107,"name":"opiumtraitement","label":"Pochon d\'opium"},"cocainetraitement":{"count":90,"name":"cocainetraitement","label":"Pochon de Cocaïne"},"opiumrecolte":{"count":2,"name":"opiumrecolte","label":"Opium"},"cocainerecolte":{"count":1,"name":"cocainerecolte","label":"Cocaïne"},"medikit":{"count":772,"name":"medikit","label":"Medikit"},"bandage":{"count":292,"name":"bandage","label":"Bandage"},"weedrecolte":{"count":3,"name":"weedrecolte","label":"Weed"}},"accounts":{"dirtycash":5959021,"cash":0},"weapons":{"121514":{"label":"Pistolet","name":"WEAPON_PISTOL","ammo":250},"787092":{"label":"Pistolet","name":"WEAPON_PISTOL","ammo":250}}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(67, 'villa_marco_lopez_', '{"name":"villa_marco_lopez_","poids":3000,"label":"Villa Marco Lopez "}', '1300000', '{"EXIT":{"x":-596.9658813476563,"y":851.6021118164063,"z":211.463623046875},"COFFRE":{"x":-623.0919189453125,"y":54.69309997558594,"z":96.59940338134766},"ENTER":{"x":-612.1599731445313,"y":59.06000137329101,"z":97.19999694824219}}', '1', 'ambulance', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(68, 'petit_entrepôt_marco_lopez', '{"name":"petit_entrepôt_marco_lopez","poids":75000,"label":"Petit Entrepôt Marco Lopez"}', '100000', '{"EXIT":{"x":-1210.365234375,"y":-1075.7086181640626,"z":8.34456825256347},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109}}', '1', 'license:743211c70863e1550f2cf33c436455d94d01e030', '{"item":{"phone":{"label":"Téléphone","name":"phone","count":1}},"accounts":{"cash":0,"dirtycash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(69, 'villa_daryl_dixson', '{"name":"villa_daryl_dixson","poids":3000,"label":"Villa Daryl Dixson"}', '1300000', '{"EXIT":{"x":-949.3851318359375,"y":196.64105224609376,"z":67.39026641845703},"COFFRE":{"x":-623.0919189453125,"y":54.69309997558594,"z":96.59940338134766},"ENTER":{"x":-612.1599731445313,"y":59.06000137329101,"z":97.19999694824219}}', '1', 'license:1c063a7911948eb9853745f56b24f17bad3c5f6c', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[{"identifier":"license:7a4b715cf5123e1a0754960af64d67c9d177f115","name":"ELIAS BRABUS I le guépard"},{"identifier":"license:9a799f9773c9e7b17b0116dc39584468beb8d106","name":"azime"},{"identifier":"license:9a799f9773c9e7b17b0116dc39584468beb8d106","name":"azime"},{"identifier":"license:bcf486dfe5ecfbf5196ec7b26f1291e7b8a95052","name":"DRIING"}],"GradesAlloweds":[]}', '0'),
	(70, 'villa_rico_escobar', '{"name":"villa_rico_escobar","poids":4000,"label":"Villa Rico Escobar"}', '3500000', '{"EXIT":{"x":-658.5637817382813,"y":886.4711303710938,"z":229.24911499023438},"COFFRE":{"x":-1456.83740234375,"y":-531.0899047851563,"z":55.9369010925293},"ENTER":{"x":-1459.1700439453126,"y":-520.5800170898438,"z":54.92900085449219}}', '1', 'license:cf86606cf70fa4144c05c385623df32ddf07b4b0', '{"item":[],"accounts":{"dirtycash":0,"cash":1500000},"weapons":[]}', '{"PeopleAlloweds":[{"identifier":"license:94e7cabac3259a2efb1ec36ce62b3c08dca29526","name":"CCG_Ardoks"}],"GradesAlloweds":[]}', '0'),
	(71, 'entrepot_shawn_dixson', '{"name":"entrepot_shawn_dixson","poids":100000,"label":"Entrepot Shawn Dixson"}', '500000', '{"EXIT":{"x":-438.438232421875,"y":-2184.053955078125,"z":10.49061489105224},"COFFRE":{"x":1070.829345703125,"y":-3098.585205078125,"z":-39.99990081787109},"ENTER":{"x":1048.5067138671876,"y":-3097.081787109375,"z":-38.99990081787109}}', '1', 'license:5effe65abbb11faac4376e547811481ce5656b1f', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(72, 'fdp_entrepot_ewen', '{"poids":100000,"name":"fdp_entrepot_ewen","label":"fdp entrepot ewen"}', '500000', '{"EXIT":{"x":794.2941284179688,"y":-102.76004028320313,"z":82.0313949584961},"COFFRE":{"x":1070.829345703125,"y":-3098.585205078125,"z":-39.99990081787109},"ENTER":{"x":1048.5067138671876,"y":-3097.081787109375,"z":-38.99990081787109}}', '1', 'license:c8aaab24f2a78a03b3ad2c0614d8c808e0f03260', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(74, 'motel_georges', '{"poids":1000,"name":"motel_georges","label":"Motel Georges"}', '60000', '{"EXIT":{"x":845.7734375,"y":-1050.6116943359376,"z":28.13507461547851},"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0},"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711}}', '1', 'license:33d198dbaed706e1e8a919251027f35e206be10e', '{"item":{"jewels":{"count":4,"name":"jewels","label":"Bijou"},"opiumrecolte":{"count":70,"name":"opiumrecolte","label":"Opium"}},"accounts":{"dirtycash":2357218,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[{"identifier":"license:a01a3950a17eb137d84e33ff047248b04d64d1ea","name":"DozahDoBrazil"}],"GradesAlloweds":[]}', '0'),
	(75, 'appart_vespu', '{"poids":2500,"name":"appart_vespu","label":"Appart Vespu"}', '60000', '{"EXIT":{"x":-1308.548583984375,"y":-1227.93359375,"z":4.90435743331909},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:1393fb99d6c72cf17a9095b704c871b93c656aab', '{"item":{"chargeur":{"count":5,"name":"chargeur","label":"Chargeur"},"medikit":{"count":12,"name":"medikit","label":"Medikit"},"cagoule":{"count":1,"name":"cagoule","label":"Cagoule"}},"accounts":{"dirtycash":1460000,"cash":0},"weapons":{"994670":{"label":"Micro smg","name":"WEAPON_MICROSMG","ammo":250},"959567":{"label":"Revolver","name":"WEAPON_REVOLVER","ammo":250},"739901":{"label":"Pistolet","name":"WEAPON_PISTOL","ammo":0}}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(76, 'fd_azdazdaz', '{"poids":200000,"name":"fd_azdazdaz","label":"FD AZDAZDAZ"}', '800000', '{"COFFRE":{"x":999.58251953125,"y":-3096.294677734375,"z":-39.99980163574219},"ENTER":{"x":1026.505615234375,"y":-3099.83203125,"z":-38.99980163574219},"EXIT":{"x":-326.55126953125,"y":-1300.5709228515626,"z":31.35156631469726}}', '1', 'license:c8aaab24f2a78a03b3ad2c0614d8c808e0f03260', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(77, 'villa_tiger_woods', '{"poids":3500,"name":"villa_tiger_woods","label":"Villa Tiger Woods"}', '5000000', '{"EXIT":{"x":-931.7607421875,"y":808.8812866210938,"z":184.78085327148438},"COFFRE":{"x":-795.7161254882813,"y":326.81500244140627,"z":186.31289672851563},"ENTER":{"x":-785.1300048828125,"y":315.7900085449219,"z":187.91000366210938}}', '1', 'hoova', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(78, 'villa_hernandez', '{"poids":3000,"name":"villa_hernandez","label":"Villa Hernandez"}', '1300000', '{"EXIT":{"x":-747.1331787109375,"y":808.3280029296875,"z":215.0302734375},"COFFRE":{"x":-623.0919189453125,"y":54.69309997558594,"z":96.59940338134766},"ENTER":{"x":-612.1599731445313,"y":59.06000137329101,"z":97.19999694824219}}', '1', 'license:f1f05d1bcad9a7926b327fc2653aa10f9ced36cd', '{"item":{},"accounts":{"dirtycash":21450,"cash":0},"weapons":{"670972":{"label":"Queue de billard","name":"WEAPON_POOLCUE","ammo":0}}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(79, 'villa_vinewood_12', '{"poids":3000,"name":"villa_vinewood_12","label":"Villa Vinewood 12"}', '1300000', '{"EXIT":{"x":-1673.14599609375,"y":385.8460388183594,"z":89.34829711914063},"COFFRE":{"x":-623.0919189453125,"y":54.69309997558594,"z":96.59940338134766},"ENTER":{"x":-612.1599731445313,"y":59.06000137329101,"z":97.19999694824219}}', '1', 'license:a4ed91e6cf31bdd2054bc1a653cbe1849f1e8819', '{"item":{"methrecolte":{"count":11,"name":"methrecolte","label":"Méthamphétamine"},"ammoniac":{"count":23,"name":"ammoniac","label":"Ammoniac"},"icerecolte":{"count":8,"name":"icerecolte","label":"Ice"},"methtraitement":{"count":116,"name":"methtraitement","label":"Pochon de Méthamphétamine"},"weedtraitement":{"count":61,"name":"weedtraitement","label":"Pochon de Weed"},"phone":{"count":2,"name":"phone","label":"Téléphone"},"opiumtraitement":{"count":51,"name":"opiumtraitement","label":"Pochon d\'opium"},"opiumrecolte":{"count":6,"name":"opiumrecolte","label":"Opium"},"cocainerecolte":{"count":3,"name":"cocainerecolte","label":"Cocaïne"},"pochonice":{"count":1,"name":"pochonice","label":"pochon d\'ice"},"ecstasy":{"count":3,"name":"ecstasy","label":"Ecstasy"}},"accounts":{"dirtycash":0,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(80, 'maison_jack_carter', '{"poids":2500,"name":"maison_jack_carter","label":"Maison Jack Carter"}', '60000', '{"EXIT":{"x":-1622.8763427734376,"y":-379.84356689453127,"z":43.71578979492187},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:16a6ceebb918f978b2b43f8694a9fb024cec1454', '{"item":{"methrecolte":{"count":27,"name":"methrecolte","label":"Méthamphétamine"},"acierrecolte":{"count":20,"name":"acierrecolte","label":"Acier"},"lsd":{"count":8,"name":"lsd","label":"LSD"},"ammoniac":{"count":48,"name":"ammoniac","label":"Ammoniac"},"piluleoubli":{"count":1,"name":"piluleoubli","label":"GHB"},"methtraitement":{"count":29,"name":"methtraitement","label":"Pochon de Méthamphétamine"},"weedtraitement":{"count":334,"name":"weedtraitement","label":"Pochon de Weed"},"graincafe":{"count":15,"name":"graincafe","label":"Grains De Café"},"maltetraiter":{"count":6,"name":"maltetraiter","label":"Bière"},"cocainetraitement":{"count":290,"name":"cocainetraitement","label":"Pochon de Cocaïne"},"opiumrecolte":{"count":2,"name":"opiumrecolte","label":"Opium"},"phone":{"count":1,"name":"phone","label":"Téléphone"},"opiumtraitement":{"count":57,"name":"opiumtraitement","label":"Pochon d\'opium"},"pelle":{"count":2,"name":"pelle","label":"Pelle"},"radio":{"count":1,"name":"radio","label":"Radio"}},"accounts":{"dirtycash":1016300,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[{"identifier":"license:48a9212214cfeca3174b4bdc158c7ce9d9596359","name":"nespolo.pro"}],"GradesAlloweds":[]}', '0'),
	(82, 'maison_dixson_planquée', '{"poids":2500,"name":"maison_dixson_planquée","label":"Maison Dixson Planquée"}', '60000', '{"EXIT":{"x":907.2952880859375,"y":-1691.97314453125,"z":43.11153793334961},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:5effe65abbb11faac4376e547811481ce5656b1f', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(83, 'villa_golfeur_wish', '{"poids":3500,"name":"villa_golfeur_wish","label":"Villa Golfeur wish"}', '5000000', '{"EXIT":{"x":-939.43212890625,"y":814.55908203125,"z":184.78102111816407},"COFFRE":{"x":-795.7161254882813,"y":326.81500244140627,"z":186.31289672851563},"ENTER":{"x":-785.1300048828125,"y":315.7900085449219,"z":187.91000366210938}}', '1', 'blackmarket', '{"item":[],"accounts":{"dirtycash":236464,"cash":0},"weapons":{"721619":{"label":"Pistolet","name":"WEAPON_PISTOL","ammo":144}}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(84, 'maison_88', '{"poids":4000,"name":"maison_88","label":"Maison 88"}', '3500000', '{"EXIT":{"x":-912.1980590820313,"y":777.2437744140625,"z":187.01060485839845},"COFFRE":{"x":-1456.83740234375,"y":-531.0899047851563,"z":55.9369010925293},"ENTER":{"x":-1459.1700439453126,"y":-520.5800170898438,"z":54.92900085449219}}', '1', 'license:ba90402080c34636e0da37a02a5e1ce07fff9fc8', '{"item":{"cocainetraitement":{"count":25,"name":"cocainetraitement","label":"Pochon de Cocaïne"},"opiumtraitement":{"count":47,"name":"opiumtraitement","label":"Pochon d\'opium"},"chargeur":{"count":2,"name":"chargeur","label":"Chargeur"},"Mongolienne":{"count":18,"name":"Mongolienne","label":"Mongolienne"},"methtraitement":{"count":20,"name":"methtraitement","label":"Pochon de Méthamphétamine"},"weedtraitement":{"count":25,"name":"weedtraitement","label":"Pochon de Weed"}},"accounts":{"dirtycash":34,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(85, 'maison_neeeeerhhh', '{"poids":2500,"name":"maison_neeeeerhhh","label":"Maison NEEEEERHHH"}', '60000', '{"EXIT":{"x":915.30078125,"y":-1690.3953857421876,"z":43.1470832824707},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:a89dcac0be6253bfda5acb050ca6d884fa11cc48', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(86, 'motel_10', '{"poids":1000,"name":"motel_10","label":"Motel 10"}', '60000', '{"EXIT":{"x":-1309.158447265625,"y":-930.94580078125,"z":16.35705184936523},"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0},"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711}}', '1', 'license:420716c5861e174d528b2f47f4d7abfedce92586', '{"item":{"weedtraitement":{"count":12,"name":"weedtraitement","label":"Pochon de Weed"}},"accounts":{"dirtycash":0,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(87, 'motel_11', '{"poids":1000,"name":"motel_11","label":"Motel 11"}', '60000', '{"EXIT":{"x":-1310.997802734375,"y":-931.978515625,"z":16.35735893249511},"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0},"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711}}', '1', 'license:eb1af440c8cd57fd995dd662c56cfa8f2cd7890b', '{"item":{"phone":{"count":1,"name":"phone","label":"Téléphone"},"alcoolbrut":{"count":2,"name":"alcoolbrut","label":"Alcool Brut"},"cocainerecolte":{"count":190,"name":"cocainerecolte","label":"Cocaïne"},"ammoniac":{"count":28,"name":"ammoniac","label":"Ammoniac"},"radio":{"count":1,"name":"radio","label":"Radio"}},"accounts":{"dirtycash":136398,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(88, 'motel_12', '{"poids":1000,"name":"motel_12","label":"Motel 12"}', '60000', '{"EXIT":{"x":-1317.9012451171876,"y":-934.4912109375,"z":16.3582649230957},"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0},"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711}}', '1', 'license:5d3c8e583e0222a24d02e8ba84c3faca79958862', '{"item":{},"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(89, 'maison_grady', '{"poids":2500,"name":"maison_grady","label":"Maison Grady"}', '60000', '{"EXIT":{"x":76.47724151611328,"y":-1948.211669921875,"z":21.17423057556152},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:a9538ea1f478954e5a894c44886151146569dbbd', '{"item":{"opiumtraitement":{"count":8,"name":"opiumtraitement","label":"Pochon d\'opium"},"opiumrecolte":{"count":1,"name":"opiumrecolte","label":"Opium"},"ammoniac":{"count":27,"name":"ammoniac","label":"Ammoniac"},"cocainetraitement":{"count":4,"name":"cocainetraitement","label":"Pochon de Cocaïne"},"martini":{"count":2,"name":"martini","label":"Martini blanc"},"weedtraitement":{"count":5,"name":"weedtraitement","label":"Pochon de Weed"}},"accounts":{"dirtycash":0,"cash":0},"weapons":{"531136":{"label":"Couteau","name":"WEAPON_KNIFE","ammo":0},"148232":{"label":"Matraque","name":"WEAPON_NIGHTSTICK","ammo":0},"76602":{"label":"Pistolet sns","name":"WEAPON_SNSPISTOL","ammo":249}}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(91, 'villa_12', '{"poids":3000,"name":"villa_12","label":"Villa 12"}', '1300000', '{"COFFRE":{"x":-623.0919189453125,"y":54.69309997558594,"z":96.59940338134766},"ENTER":{"x":-612.1599731445313,"y":59.06000137329101,"z":97.19999694824219},"EXIT":{"x":-823.7958984375,"y":806.1577758789063,"z":202.784423828125}}', '1', 'license:84e370239082ccc846acafe02508210fd242df16', '{"item":{"methrecolte":{"count":1,"name":"methrecolte","label":"Méthamphétamine"},"cocainetraitement":{"count":24,"name":"cocainetraitement","label":"Pochon de Cocaïne"},"opiumtraitement":{"count":25,"name":"opiumtraitement","label":"Pochon d\'opium"},"weed_pooch":{"count":3,"name":"weed_pooch","label":"Pochon de weed"},"methtraitement":{"count":36,"name":"methtraitement","label":"Pochon de Méthamphétamine"},"weedtraitement":{"count":8,"name":"weedtraitement","label":"Pochon de Weed"}},"accounts":{"dirtycash":1374544,"cash":3464},"weapons":[]}', '{"PeopleAlloweds":[{"identifier":"license:c643027fa965870feae052d1f38119fc87833d12","name":"Flora"}],"GradesAlloweds":[]}', '0'),
	(93, 'maison_forum_1', '{"name":"maison_forum_1","poids":2500,"label":"Maison Forum 1"}', '60000', '{"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":16.69439506530761,"y":-1444.0213623046876,"z":30.94916343688965}}', '1', 'license:80e7a93446597ba5d3594b7cd80f7d2a21bfe637', '{"item":{"hotdog":{"count":1,"name":"hotdog","label":"Hot Dog"},"methrecolte":{"count":4,"name":"methrecolte","label":"Méthamphétamine"},"cocainetraitement":{"count":47,"name":"cocainetraitement","label":"Pochon de Cocaïne"},"codeine":{"count":1,"name":"codeine","label":"Codéine"},"acierrecolte":{"count":2,"name":"acierrecolte","label":"Acier"},"pepiteor":{"count":10,"name":"pepiteor","label":"Pépite d\'or"},"methtraitement":{"count":60,"name":"methtraitement","label":"Pochon de Méthamphétamine"},"pelle":{"count":1,"name":"pelle","label":"Pelle"}},"accounts":{"dirtycash":0,"cash":1},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(94, 'maison_forum_2', '{"name":"maison_forum_2","poids":2500,"label":"Maison Forum 2"}', '60000', '{"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":-1.91467893123626,"y":-1442.3299560546876,"z":30.96307945251465}}', '1', 'families', '{"item":{"medikit":{"count":22,"name":"medikit","label":"Medikit"},"chargeur":{"count":41,"name":"chargeur","label":"Chargeur"},"icerecolte":{"count":10,"name":"icerecolte","label":"Ice"},"opiumtraitement":{"count":63,"name":"opiumtraitement","label":"Pochon d\'opium"},"opiumrecolte":{"count":131,"name":"opiumrecolte","label":"Opium"},"hotdog":{"count":2,"name":"hotdog","label":"Hot Dog"},"acierrecolte":{"count":38,"name":"acierrecolte","label":"Acier"},"aciertraitement":{"count":2,"name":"aciertraitement","label":"Acier Traité"},"cocainetraitement":{"count":25,"name":"cocainetraitement","label":"Pochon de Cocaïne"},"cagoule":{"count":8,"name":"cagoule","label":"Cagoule"},"weedrecolte":{"count":19,"name":"weedrecolte","label":"Weed"},"lsd":{"count":18,"name":"lsd","label":"LSD"},"alcoolbrut":{"count":3,"name":"alcoolbrut","label":"Alcool Brut"},"water":{"count":16,"name":"water","label":"Bouteille d\'eau"},"bread":{"count":15,"name":"bread","label":"Pain"},"jusfruit":{"count":3,"name":"jusfruit","label":"Jus de fruits"},"rhum":{"count":1,"name":"rhum","label":"Rhum"},"jager":{"count":3,"name":"jager","label":"Jägermeister"},"ammoniac":{"count":79,"name":"ammoniac","label":"Ammoniac"},"whisky":{"count":3,"name":"whisky","label":"Whisky"},"bankcard":{"count":11,"name":"bankcard","label":"Carte d\'accès Banque"},"pochonCBD":{"count":130,"name":"pochonCBD","label":"Pochon de CBD"},"Mongolienne":{"count":1,"name":"Mongolienne","label":"Mongolienne"},"weedtraitement":{"count":361,"name":"weedtraitement","label":"Pochon de Weed"},"methrecolte":{"count":554,"name":"methrecolte","label":"Méthamphétamine"},"vetement":{"count":1,"name":"vetement","label":"Vêtement"},"heroinerecolte":{"count":9,"name":"heroinerecolte","label":"Héroine pure"},"phone":{"count":4,"name":"phone","label":"Téléphone"},"drill":{"count":14,"name":"drill","label":"Perceuse"},"methtraitement":{"count":200,"name":"methtraitement","label":"Pochon de Méthamphétamine"},"pochoncodeine":{"count":1,"name":"pochoncodeine","label":"Pochon de Codéine"},"munition":{"count":13,"name":"munition","label":"Munition"},"bandage":{"count":1,"name":"bandage","label":"Bandage"},"radio":{"count":11,"name":"radio","label":"Radio"},"traitementheroine":{"count":2,"name":"traitementheroine","label":"Pochon d\'héroine"},"petrole":{"count":70,"name":"petrole","label":"Pétrole"},"tabac":{"count":7,"name":"tabac","label":"Tabac"},"pelle":{"count":1,"name":"pelle","label":"Pelle"},"martini":{"count":4,"name":"martini","label":"Martini blanc"}},"accounts":{"cash":0,"dirtycash":0},"weapons":{"537756":{"label":"Pied de biche","name":"WEAPON_CROWBAR","ammo":0}}}', '{"PeopleAlloweds":[],"GradesAlloweds":{"Bras Droit":false,"Patron":false,"Associé":false,"Elite":false,"Soldat":false,"Lieutenant":false}}', '0'),
	(95, 'maison_forum_3', '{"name":"maison_forum_3","poids":2500,"label":"Maison Forum 3"}', '60000', '{"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":-32.39564514160156,"y":-1446.3826904296876,"z":31.89142990112304}}', '1', 'license:5effe65abbb11faac4376e547811481ce5656b1f', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(96, 'maison_forum_4', '{"name":"maison_forum_4","poids":2500,"label":"Maison Forum 4"}', '60000', '{"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":-45.63248443603515,"y":-1445.4334716796876,"z":32.42959976196289}}', '1', 'license:a31b89b8edcc1f34c6b820c969fffb4bcfb833af', '{"item":{"medikit":{"count":3,"name":"medikit","label":"Medikit"},"maltetraiter":{"count":4,"name":"maltetraiter","label":"Bière"},"bandage":{"count":1,"name":"bandage","label":"Bandage"},"ecstasy":{"count":4,"name":"ecstasy","label":"Ecstasy"},"phone":{"count":2,"name":"phone","label":"Téléphone"},"tabac":{"count":1,"name":"tabac","label":"Tabac"},"pelle":{"count":1,"name":"pelle","label":"Pelle"},"weedtraitement":{"count":3,"name":"weedtraitement","label":"Pochon de Weed"}},"accounts":{"dirtycash":38262,"cash":1099150},"weapons":{"741473":{"label":"Pistolet sns","name":"WEAPON_SNSPISTOL","ammo":245},"550380":{"label":"Micro smg","name":"WEAPON_MICROSMG","ammo":250},"276803":{"label":"Queue de billard","name":"WEAPON_POOLCUE","ammo":0},"696729":{"label":"Pistolet","name":"WEAPON_PISTOL","ammo":0},"960072":{"label":"Pistolet","name":"WEAPON_PISTOL","ammo":245},"458776":{"label":"Pistolet","name":"WEAPON_PISTOL","ammo":250},"502354":{"label":"Batte","name":"WEAPON_BAT","ammo":0}}}', '{"PeopleAlloweds":[{"identifier":"license:86827dee90f49105d505615595c5c6b523f43f22","name":"Batoanbadlo du 13"},{"identifier":"license:a33b256af85e9fdb51c094ce21690c7d431e02a0","name":"Utilisateur"},{"identifier":"license:a33b256af85e9fdb51c094ce21690c7d431e02a0","name":"Utilisateur"},{"identifier":"license:a33b256af85e9fdb51c094ce21690c7d431e02a0","name":"Utilisateur"},{"identifier":"license:c306e5badd061a5502a8ed3b4463b32c3d556a63","name":"Maldo"},{"identifier":"license:c306e5badd061a5502a8ed3b4463b32c3d556a63","name":"Maldo"},{"identifier":"license:c306e5badd061a5502a8ed3b4463b32c3d556a63","name":"Maldo"},{"identifier":"license:c306e5badd061a5502a8ed3b4463b32c3d556a63","name":"Maldo"},{"identifier":"license:c306e5badd061a5502a8ed3b4463b32c3d556a63","name":"Maldo"},{"identifier":"license:c306e5badd061a5502a8ed3b4463b32c3d556a63","name":"Maldo"},{"identifier":"license:c306e5badd061a5502a8ed3b4463b32c3d556a63","name":"Maldo"},{"identifier":"license:c306e5badd061a5502a8ed3b4463b32c3d556a63","name":"Maldo"},{"identifier":"license:c306e5badd061a5502a8ed3b4463b32c3d556a63","name":"Maldo"},{"identifier":"license:c306e5badd061a5502a8ed3b4463b32c3d556a63","name":"Maldo"},{"identifier":"license:c306e5badd061a5502a8ed3b4463b32c3d556a63","name":"Maldo"},{"identifier":"license:17c5b32c5cf54f58b2ee40dce89bd135a86776f3","name":"Zéokun.org"}],"GradesAlloweds":[]}', '0'),
	(97, 'maison_forum_5', '{"name":"maison_forum_5","poids":2500,"label":"Maison Forum 5"}', '60000', '{"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":-64.46704864501953,"y":-1449.697265625,"z":32.52491760253906}}', '1', 'license:5ea438260748a9db0c8122dfa4a09bc80537ee77', '{"item":{},"accounts":{"dirtycash":0,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(98, 'motel_forum_1', '{"name":"motel_forum_1","poids":1000,"label":"Motel Forum 1"}', '60000', '{"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711},"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0},"EXIT":{"x":-80.24978637695313,"y":-1607.7724609375,"z":34.68913650512695}}', '1', 'license:a9ca4686086fa2055e2cdd68353a21e5a4c37b78', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":{"661888":{"label":"Micro smg","name":"WEAPON_MICROSMG","ammo":228},"74481":{"label":"Pied de biche","name":"WEAPON_CROWBAR","ammo":0},"758458":{"label":"Revolver","name":"WEAPON_REVOLVER","ammo":239},"117535":{"label":"Pistolet","name":"WEAPON_PISTOL","ammo":250}}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(99, 'motel_forum_2', '{"name":"motel_forum_2","poids":1000,"label":"Motel Forum 2"}', '60000', '{"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711},"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0},"EXIT":{"x":-87.84416961669922,"y":-1601.6031494140626,"z":35.48923873901367}}', '1', 'license:80cf6ceb879ff25c02f43fcb992061bb8bbf9f78', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(100, 'motel_forum_3', '{"name":"motel_forum_3","poids":1000,"label":"Motel Forum 3"}', '60000', '{"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711},"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0},"EXIT":{"x":-93.511474609375,"y":-1607.2052001953126,"z":35.48923873901367}}', '1', 'license:86827dee90f49105d505615595c5c6b523f43f22', '{"item":{"hotdog":{"count":5,"name":"hotdog","label":"Hot Dog"},"acierrecolte":{"count":36,"name":"acierrecolte","label":"Acier"},"water":{"count":1,"name":"water","label":"Bouteille d\'eau"},"methtraitement":{"count":16,"name":"methtraitement","label":"Pochon de Méthamphétamine"},"weedtraitement":{"count":47,"name":"weedtraitement","label":"Pochon de Weed"},"opiumtraitement":{"count":27,"name":"opiumtraitement","label":"Pochon d\'opium"},"viande":{"count":1,"name":"viande","label":"Viande"},"pelle":{"count":2,"name":"pelle","label":"Pelle"},"cocainetraitement":{"count":10,"name":"cocainetraitement","label":"Pochon de Cocaïne"},"pochonice":{"count":10,"name":"pochonice","label":"pochon d\'ice"},"Mongolienne":{"count":1,"name":"Mongolienne","label":"Mongolienne"}},"accounts":{"dirtycash":795,"cash":0},"weapons":{"135648":{"label":"Pistolet calibre 50","name":"WEAPON_PISTOL50","ammo":250}}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(101, 'motel_forum_4', '{"name":"motel_forum_4","poids":1000,"label":"Motel Forum 4"}', '60000', '{"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711},"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0},"EXIT":{"x":-97.86267852783203,"y":-1612.2452392578126,"z":35.48923873901367}}', '1', 'license:83a64ab13eeed0fd8574861d96160e2f732f07f8', '{"item":[],"accounts":{"dirtycash":1,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(102, 'motel_forum_5', '{"name":"motel_forum_5","poids":1000,"label":"Motel Forum 5"}', '60000', '{"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711},"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0},"EXIT":{"x":-140.34117126464845,"y":-1599.612060546875,"z":38.21256256103515}}', '1', 'license:00d968fa28e4072d0df67547350487cd7228aec5', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(103, 'entrepot_peaky', '{"name":"entrepot_peaky","poids":75000,"label":"Entrepot Peaky"}', '100000', '{"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"EXIT":{"x":-131.8580780029297,"y":1007.9732055664063,"z":235.73208618164063}}', '1', 'license:7a06622facc898bf1314eae04b59dd37e3715b82', '{"weapons":[],"item":{"chargeur":{"count":900,"label":"Chargeur","name":"chargeur"},"bandage":{"count":3,"label":"Bandage","name":"bandage"},"medikit":{"count":199,"label":"Medikit","name":"medikit"}},"accounts":{"cash":0,"dirtycash":16024181}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(107, 'entrepot_saisie_lspd', '{"label":"entrepot saisie lspd","name":"entrepot_saisie_lspd","poids":200000}', '800000', '{"ENTER":{"x":1026.505615234375,"y":-3099.83203125,"z":-38.99980163574219},"EXIT":{"x":472.9359130859375,"y":-997.2880249023438,"z":26.27326965332031},"COFFRE":{"x":999.58251953125,"y":-3096.294677734375,"z":-39.99980163574219}}', '1', 'unemployed2', '{"accounts":{"cash":0,"dirtycash":0},"item":{"lingotor":{"count":5,"label":"Lingot d\'or","name":"lingotor"},"acierrecolte":{"count":19,"label":"Acier","name":"acierrecolte"},"methtraitement":{"count":1041,"label":"Pochon de Méthamphétamine","name":"methtraitement"},"traitementheroine":{"count":14,"label":"Pochon d\'héroine","name":"traitementheroine"},"lsdtraitement":{"count":195,"label":"Pochon de LSD","name":"lsdtraitement"},"codeine":{"count":8,"label":"Codéine","name":"codeine"},"pochoncodeine":{"count":1,"label":"Pochon de Codéine","name":"pochoncodeine"},"weedrecolte":{"count":48,"label":"Weed","name":"weedrecolte"},"phone":{"count":19,"label":"Téléphone","name":"phone"},"chargeur":{"count":46,"label":"Chargeur","name":"chargeur"},"lsd":{"count":114,"label":"LSD","name":"lsd"},"cocainetraitement":{"count":1681,"label":"Pochon de Cocaïne","name":"cocainetraitement"},"pelle":{"count":6,"label":"Pelle","name":"pelle"},"munition":{"count":901,"label":"Munition","name":"munition"},"ketaminetraitement":{"count":29,"label":"Pochon de Kétamine","name":"ketaminetraitement"},"methrecolte":{"count":1920,"label":"Méthamphétamine","name":"methrecolte"},"coke_pooch":{"count":86,"label":"Pochon de coke","name":"coke_pooch"},"aluminium":{"count":10,"label":"Aluminium","name":"aluminium"},"cocainerecolte":{"count":5605,"label":"Cocaïne","name":"cocainerecolte"},"tequila":{"count":5,"label":"Tequila","name":"tequila"},"radio":{"count":19,"label":"Radio","name":"radio"},"weedtraitement":{"count":1315,"label":"Pochon de Weed","name":"weedtraitement"},"maltetraiter":{"count":6,"label":"Bière","name":"maltetraiter"},"icerecolte":{"count":13,"label":"Ice","name":"icerecolte"},"malte":{"count":29,"label":"Malte","name":"malte"},"ketaminerecolte":{"count":17,"label":"Ketamine","name":"ketaminerecolte"},"jewels":{"count":1191,"label":"Bijou","name":"jewels"},"bankcard":{"count":1,"label":"Carte d\'accès Banque","name":"bankcard"},"alcooldecontrebande":{"count":10,"label":"Alcool de Contrebande","name":"alcooldecontrebande"},"drill":{"count":1,"label":"Perceuse","name":"drill"},"pochonCBD":{"count":47,"label":"Pochon de CBD","name":"pochonCBD"},"Mango":{"count":9,"label":"Mango","name":"Mango"},"ammoniac":{"count":2643,"label":"Ammoniac","name":"ammoniac"},"alcoolbrut":{"count":31,"label":"Alcool Brut","name":"alcoolbrut"},"pochonice":{"count":52,"label":"pochon d\'ice","name":"pochonice"},"heroinerecolte":{"count":70,"label":"Héroine pure","name":"heroinerecolte"},"vodka":{"count":1,"label":"Vodka","name":"vodka"},"weed":{"count":55,"label":"Weed","name":"weed"},"cagoule":{"count":1,"label":"Cagoule","name":"cagoule"},"opiumrecolte":{"count":2671,"label":"Opium","name":"opiumrecolte"},"opiumtraitement":{"count":881,"label":"Pochon d\'opium","name":"opiumtraitement"},"aciertraitement":{"count":122,"label":"Acier Traité","name":"aciertraitement"},"pepiteor":{"count":20,"label":"Pépite d\'or","name":"pepiteor"},"purplehazerecolte":{"count":2,"label":"Purple Haze","name":"purplehazerecolte"},"water":{"count":1,"label":"Bouteille d\'eau","name":"water"},"limonade":{"count":1,"label":"Limonade","name":"limonade"},"rhum":{"count":1,"label":"Rhum","name":"rhum"},"ecstasy":{"count":609,"label":"Ecstasy","name":"ecstasy"},"Mongolienne":{"count":10,"label":"Mongolienne","name":"Mongolienne"}},"weapons":{"610133":{"label":"Pied de biche","ammo":0,"name":"WEAPON_CROWBAR"},"631512":{"label":"Pistolet de combat","ammo":0,"name":"WEAPON_COMBATPISTOL"},"613291":{"label":"Matraque","ammo":0,"name":"WEAPON_NIGHTSTICK"},"280092":{"label":"Fusil avancé","ammo":86,"name":"WEAPON_ADVANCEDRIFLE"},"121421":{"label":"Carabine d\'assaut","ammo":250,"name":"WEAPON_CARBINERIFLE"},"472798":{"label":"Matraque","ammo":0,"name":"WEAPON_NIGHTSTICK"},"959397":{"label":"Pistolet de combat","ammo":250,"name":"WEAPON_COMBATPISTOL"},"285218":{"label":"Pied de biche","ammo":0,"name":"WEAPON_CROWBAR"},"838119":{"label":"Matraque","ammo":0,"name":"WEAPON_NIGHTSTICK"},"357512":{"label":"Queue de billard","ammo":0,"name":"WEAPON_POOLCUE"},"434066":{"label":"Queue de billard","ammo":0,"name":"WEAPON_POOLCUE"},"508067":{"label":"Carabine d\'assaut","ammo":250,"name":"WEAPON_CARBINERIFLE"},"576015":{"label":"Pistolet calibre 50","ammo":0,"name":"WEAPON_PISTOL50"},"488439":{"label":"Fusil avancé","ammo":250,"name":"WEAPON_ADVANCEDRIFLE"},"502551":{"label":"Queue de billard","ammo":0,"name":"WEAPON_POOLCUE"},"285049":{"label":"Lampe torche","ammo":0,"name":"WEAPON_FLASHLIGHT"},"978858":{"label":"Clé","ammo":0,"name":"WEAPON_WRENCH"},"821298":{"label":"Pistolet","ammo":250,"name":"WEAPON_PISTOL"},"12896":{"label":"Carabine d\'assaut","ammo":250,"name":"WEAPON_CARBINERIFLE"},"830450":{"label":"Carabine d\'assaut","ammo":250,"name":"WEAPON_CARBINERIFLE"},"403466":{"label":"Poing américain","ammo":0,"name":"WEAPON_KNUCKLE"},"896925":{"label":"Queue de billard","ammo":0,"name":"WEAPON_POOLCUE"},"26691":{"label":"Carabine d\'assaut","ammo":250,"name":"WEAPON_CARBINERIFLE"},"310433":{"label":"Carabine d\'assaut","ammo":250,"name":"WEAPON_CARBINERIFLE"},"817015":{"label":"Carabine d\'assaut","ammo":250,"name":"WEAPON_CARBINERIFLE"},"323725":{"label":"Pistolet","ammo":250,"name":"WEAPON_PISTOL"},"686726":{"label":"Queue de billard","ammo":0,"name":"WEAPON_POOLCUE"},"616644":{"label":"Carabine d\'assaut","ammo":250,"name":"WEAPON_CARBINERIFLE"},"880935":{"label":"Micro smg","ammo":250,"name":"WEAPON_MICROSMG"},"217528":{"label":"Carabine d\'assaut","ammo":250,"name":"WEAPON_CARBINERIFLE"},"576791":{"label":"Smg","ammo":250,"name":"WEAPON_SMG"},"303443":{"label":"Lampe torche","ammo":0,"name":"WEAPON_FLASHLIGHT"},"927872":{"label":"Revolver","ammo":250,"name":"WEAPON_REVOLVER"},"342794":{"label":"Pistolet","ammo":233,"name":"WEAPON_PISTOL"},"849638":{"label":"Matraque","ammo":0,"name":"WEAPON_NIGHTSTICK"},"365649":{"label":"Pistolet de combat","ammo":218,"name":"WEAPON_COMBATPISTOL"},"196849":{"label":"Carabine d\'assaut","ammo":250,"name":"WEAPON_CARBINERIFLE"},"954167":{"label":"Carabine d\'assaut","ammo":250,"name":"WEAPON_CARBINERIFLE"},"230555":{"label":"Queue de billard","ammo":0,"name":"WEAPON_POOLCUE"},"772638":{"label":"Carabine d\'assaut","ammo":250,"name":"WEAPON_CARBINERIFLE"},"485715":{"label":"Poing américain","ammo":0,"name":"WEAPON_KNUCKLE"},"595309":{"label":"Carabine d\'assaut","ammo":250,"name":"WEAPON_CARBINERIFLE"},"199834":{"label":"Carabine d\'assaut","ammo":250,"name":"WEAPON_CARBINERIFLE"},"414773":{"label":"Clé","ammo":0,"name":"WEAPON_WRENCH"},"440118":{"label":"Queue de billard","ammo":0,"name":"WEAPON_POOLCUE"},"292527":{"label":"Pistolet","ammo":250,"name":"WEAPON_PISTOL"},"584175":{"label":"Queue de billard","ammo":0,"name":"WEAPON_POOLCUE"},"418488":{"label":"Queue de billard","ammo":0,"name":"WEAPON_POOLCUE"},"281483":{"label":"Lampe torche","ammo":0,"name":"WEAPON_FLASHLIGHT"},"647575":{"label":"Pied de biche","ammo":0,"name":"WEAPON_CROWBAR"},"847184":{"label":"Fusil avancé","ammo":92,"name":"WEAPON_ADVANCEDRIFLE"},"387606":{"label":"Pistolet","ammo":250,"name":"WEAPON_PISTOL"},"792926":{"label":"Carabine d\'assaut","ammo":250,"name":"WEAPON_CARBINERIFLE"},"47739":{"label":"Poing américain","ammo":0,"name":"WEAPON_KNUCKLE"},"451592":{"label":"Fusil avancé","ammo":0,"name":"WEAPON_ADVANCEDRIFLE"},"436420":{"label":"Carabine d\'assaut","ammo":250,"name":"WEAPON_CARBINERIFLE"},"975507":{"label":"Poing américain","ammo":0,"name":"WEAPON_KNUCKLE"},"614059":{"label":"Carabine d\'assaut","ammo":250,"name":"WEAPON_CARBINERIFLE"},"865147":{"label":"Fusil avancé","ammo":0,"name":"WEAPON_ADVANCEDRIFLE"},"94273":{"label":"Lampe torche","ammo":0,"name":"WEAPON_FLASHLIGHT"},"595996":{"label":"Carabine d\'assaut","ammo":250,"name":"WEAPON_CARBINERIFLE"}}}', '{"GradesAlloweds":{"Citoyen":true},"PeopleAlloweds":[]}', '0'),
	(111, 'grand_entrepot_tonton_jack', '{"name":"grand_entrepot_tonton_jack","label":"grand entrepot tonton jack","poids":200000}', '800000', '{"ENTER":{"x":1026.505615234375,"y":-3099.83203125,"z":-38.99980163574219},"EXIT":{"x":-1305.3515625,"y":-803.0526123046875,"z":17.57641983032226},"COFFRE":{"x":999.58251953125,"y":-3096.294677734375,"z":-39.99980163574219}}', '1', 'unemployed2', '{"item":{},"accounts":{"dirtycash":0,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":{"Employer":true,"Responsable":true,"PDG":true}}', '0'),
	(112, 'entrepot_cjnj_bg', '{"name":"entrepot_cjnj_bg","label":"entrepot cjnj bg","poids":200000}', '800000', '{"ENTER":{"x":1026.505615234375,"y":-3099.83203125,"z":-38.99980163574219},"EXIT":{"x":-1270.806884765625,"y":-808.201904296875,"z":17.12454414367675},"COFFRE":{"x":999.58251953125,"y":-3096.294677734375,"z":-39.99980163574219}}', '1', 'lesplagues', '{"item":{"medikit":{"count":3,"name":"medikit","label":"Medikit"},"opiumtraitement":{"count":1,"name":"opiumtraitement","label":"Pochon d\'opium"},"opiumrecolte":{"count":14,"name":"opiumrecolte","label":"Opium"}},"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(113, 'blackmarketentrepot', '{"label":"blackmarketEntrepot","poids":200000,"name":"blackmarketentrepot"}', '800000', '{"ENTER":{"x":1026.505615234375,"y":-3099.83203125,"z":-38.99980163574219},"EXIT":{"x":155.62120056152345,"y":-3038.8212890625,"z":7.03173971176147},"COFFRE":{"x":999.58251953125,"y":-3096.294677734375,"z":-39.99980163574219}}', '1', 'blackmarket', '{"item":{},"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(114, 'villa_de_spencer', '{"name":"villa_de_spencer","poids":4000,"label":"Villa de Spencer"}', '3500000', '{"COFFRE":{"x":-1456.83740234375,"y":-531.0899047851563,"z":55.9369010925293},"EXIT":{"x":-820.3904418945313,"y":268.08062744140627,"z":86.2855453491211},"ENTER":{"x":-1459.1700439453126,"y":-520.5800170898438,"z":54.92900085449219}}', '1', 'lapegre', '{"item":[],"accounts":{"cash":0,"dirtycash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":{"Boss":true,"Recrue":true,"Gérant":true,"Membre":true}}', '0'),
	(115, 'villa_de_shawn', '{"name":"villa_de_shawn","poids":3500,"label":"Villa de Shawn"}', '5000000', '{"COFFRE":{"x":-795.7161254882813,"y":326.81500244140627,"z":186.31289672851563},"EXIT":{"x":-293.5283203125,"y":600.8041381835938,"z":181.5756378173828},"ENTER":{"x":-785.1300048828125,"y":315.7900085449219,"z":187.91000366210938}}', '1', 'license:ef3b4effc66a53022e19be35cc9e05ba2a526c36', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[{"identifier":"license:075fbf1c2eef781531c2e5b1f183371deea9fb9e","name":"Léaa"}],"GradesAlloweds":[]}', '0'),
	(116, 'beatifull', '{"name":"beatifull","poids":200000,"label":"Beatifull"}', '800000', '{"ENTER":{"x":1026.505615234375,"y":-3099.83203125,"z":-38.99980163574219},"EXIT":{"x":288.56744384765627,"y":-1095.0411376953126,"z":29.41966438293457},"COFFRE":{"x":999.58251953125,"y":-3096.294677734375,"z":-39.99980163574219}}', '1', 'license:083092d1491417943de9585abb324dd268267a48', '{"item":[],"accounts":{"dirtycash":2164424,"cash":0},"weapons":{"655163":{"label":"Fusil avancé","name":"WEAPON_ADVANCEDRIFLE","ammo":246},"282895":{"label":"Pistolet de combat","name":"WEAPON_COMBATPISTOL","ammo":250},"972202":{"label":"Matraque","name":"WEAPON_NIGHTSTICK","ammo":0}}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(117, 'sous_marin_-_mickey', '{"poids":200000,"label":"Sous Marin - Mickey","name":"sous_marin_-_mickey"}', '50000000', '{"EXIT":{"x":-3282.038818359375,"y":958.5478515625,"z":8.34716129302978},"ENTER":{"x":514.1951293945313,"y":4843.91015625,"z":-62.5890007019043},"COFFRE":{"x":514.038330078125,"y":4832.59619140625,"z":-65.18599700927735}}', '1', 'license:61ca0a2c8796295f10db04933ba6493137a4f5f2', '{"item":{"police_cuff":{"count":2,"name":"police_cuff","label":"Menottes LSPD"},"methtraitement":{"count":14,"name":"methtraitement","label":"Pochon de Méthamphétamine"},"weedtraitement":{"count":57,"name":"weedtraitement","label":"Pochon de Weed"},"munition":{"count":5,"name":"munition","label":"Munition"},"opiumtraitement":{"count":14,"name":"opiumtraitement","label":"Pochon d\'opium"},"cagoule":{"count":1,"name":"cagoule","label":"Cagoule"},"ecstasy":{"count":11,"name":"ecstasy","label":"Ecstasy"},"police_key":{"count":2,"name":"police_key","label":"Clefs de Menottes LSPD"},"cocainetraitement":{"count":7,"name":"cocainetraitement","label":"Pochon de Cocaïne"},"weedrecolte":{"count":5,"name":"weedrecolte","label":"Weed"}},"accounts":{"dirtycash":0,"cash":0},"weapons":{"833577":{"label":"Pistolet de combat","name":"WEAPON_COMBATPISTOL","ammo":233},"655665":{"label":"Tazer","name":"WEAPON_STUNGUN","ammo":100},"81454":{"label":"Lampe torche","name":"WEAPON_FLASHLIGHT","ammo":0},"320678":{"label":"Matraque","name":"WEAPON_NIGHTSTICK","ammo":0},"673902":{"label":"Pistolet","name":"WEAPON_PISTOL","ammo":250},"882522":{"label":"Pistolet","name":"WEAPON_PISTOL","ammo":250},"711740":{"label":"Fusil avancé","name":"WEAPON_ADVANCEDRIFLE","ammo":249},"502993":{"label":"Pistolet","name":"WEAPON_PISTOL","ammo":0},"808230":{"label":"Micro smg","name":"WEAPON_MICROSMG","ammo":250}}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(118, 'entrepot_sina_loa', '{"name":"entrepot_sina_loa","poids":200000,"label":"Entrepot Sina Loa"}', '800000', '{"ENTER":{"x":1026.505615234375,"y":-3099.83203125,"z":-38.99980163574219},"EXIT":{"x":118.4050521850586,"y":-3128.017333984375,"z":6.0198974609375},"COFFRE":{"x":999.58251953125,"y":-3096.294677734375,"z":-39.99980163574219}}', '1', 'Sinaloa', '{"item":{"meth_pooch":{"count":3465,"name":"meth_pooch","label":"Pochon de meth"},"ketaminetraitement":{"count":12,"name":"ketaminetraitement","label":"Pochon de Kétamine"},"coke_pooch":{"count":3500,"name":"coke_pooch","label":"Pochon de coke"},"opium_pooch":{"count":6000,"name":"opium_pooch","label":"Pochon d\'opium"},"ketaminerecolte":{"count":71,"name":"ketaminerecolte","label":"Ketamine"},"weed_pooch":{"count":6000,"name":"weed_pooch","label":"Pochon de weed"}},"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":{"Boss":true}}', '0'),
	(119, 'maison_lac', '{"name":"maison_lac","poids":2500,"label":"Maison Lac"}', '60000', '{"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":711.0010375976563,"y":4185.44189453125,"z":41.08264541625976}}', '1', 'license:cc3d202d3e7f53be6ebc71b1bcd86ba0c6a0d8e0', '{"item":{},"accounts":{"dirtycash":632,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(120, 'maison_lac_2_', '{"name":"maison_lac_2_","poids":2500,"label":"Maison Lac 2 "}', '60000', '{"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":741.8191528320313,"y":4170.8134765625,"z":41.08784866333008}}', '1', 'license:4046f31f06a2ca60b7acb3667de0598fc14d6e57', '{"item":{"hotdog":{"count":17,"name":"hotdog","label":"Hot Dog"},"maltetraiter":{"count":66,"name":"maltetraiter","label":"Bière"},"chargeur":{"count":1,"name":"chargeur","label":"Chargeur"},"water":{"count":18,"name":"water","label":"Bouteille d\'eau"},"methtraitement":{"count":9,"name":"methtraitement","label":"Pochon de Méthamphétamine"},"weedtraitement":{"count":12,"name":"weedtraitement","label":"Pochon de Weed"},"ketaminerecolte":{"count":18,"name":"ketaminerecolte","label":"Ketamine"},"ketaminetraitement":{"count":20,"name":"ketaminetraitement","label":"Pochon de Kétamine"},"opiumtraitement":{"count":8,"name":"opiumtraitement","label":"Pochon d\'opium"},"cocainetraitement":{"count":7,"name":"cocainetraitement","label":"Pochon de Cocaïne"},"whisky":{"count":1,"name":"whisky","label":"Whisky"},"malte":{"count":1513,"name":"malte","label":"Malte"},"pelle":{"count":3,"name":"pelle","label":"Pelle"},"bandage":{"count":2,"name":"bandage","label":"Bandage"}},"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[{"identifier":"license:21f0fe1da09e59131758e1975e68443fdd92b205","name":"Rubyelax"}],"GradesAlloweds":[]}', '0'),
	(122, 'villa_golf', '{"poids":3500,"name":"villa_golf","label":"Villa Golf"}', '5000000', '{"COFFRE":{"x":-795.7161254882813,"y":326.81500244140627,"z":186.31289672851563},"ENTER":{"x":-785.1300048828125,"y":315.7900085449219,"z":187.91000366210938},"EXIT":{"x":-1038.1883544921876,"y":222.39468383789063,"z":64.37567901611328}}', '1', 'license:86827dee90f49105d505615595c5c6b523f43f22', '{"item":{"medikit":{"count":10,"name":"medikit","label":"Medikit"},"frites":{"count":10,"name":"frites","label":"Frites"},"hotdog":{"count":8,"name":"hotdog","label":"Hot Dog"}},"accounts":{"dirtycash":0,"cash":0},"weapons":{"33935":{"label":"Smg","name":"WEAPON_SMG","ammo":250},"394167":{"label":"Smg","name":"WEAPON_SMG","ammo":250},"913737":{"label":"Clé","name":"WEAPON_WRENCH","ammo":0},"513362":{"label":"Revolver","name":"WEAPON_REVOLVER","ammo":0},"171044":{"label":"Smg","name":"WEAPON_SMG","ammo":250}}}', '{"PeopleAlloweds":[{"identifier":"license:4e337c8716a8c5afa90067706180a264ec648e16","name":"gwotwousanfon"}],"GradesAlloweds":[]}', '0'),
	(123, 'villa_lancelot', '{"poids":3000,"name":"villa_lancelot","label":"Villa lancelot"}', '1300000', '{"COFFRE":{"x":-623.0919189453125,"y":54.69309997558594,"z":96.59940338134766},"ENTER":{"x":-612.1599731445313,"y":59.06000137329101,"z":97.19999694824219},"EXIT":{"x":-842.1118774414063,"y":-25.07401657104492,"z":40.39838790893555}}', '1', 'license:23c66a535937500eee94e25a100247846cc0f23a', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(124, 'lg', '{"name":"lg","label":"lg","poids":200000}', '800000', '{"ENTER":{"x":1026.505615234375,"y":-3099.83203125,"z":-38.99980163574219},"EXIT":{"x":-3108.938232421875,"y":752.067138671875,"z":24.70188903808593},"COFFRE":{"x":999.58251953125,"y":-3096.294677734375,"z":-39.99980163574219}}', '1', 'lalegion', '{"item":[],"accounts":{"dirtycash":1331435,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(125, 'location', '{"name":"location","label":"Location","poids":2500}', '60000', '{"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":790.0177612304688,"y":4183.787109375,"z":41.5638198852539},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:9a5eb3a8cdd3946c02ef9c9dc6896c1efca10ab9', '{"item":{"pelle":{"count":1,"name":"pelle","label":"Pelle"}},"accounts":{"dirtycash":51000,"cash":0},"weapons":{"69116":{"label":"Pistolet lourd","name":"WEAPON_HEAVYPISTOL","ammo":244}}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(126, 'entrepot1', '{"name":"entrepot1","label":"entrepot1","poids":200000}', '800000', '{"COFFRE":{"x":999.58251953125,"y":-3096.294677734375,"z":-39.99980163574219},"EXIT":{"x":1383.535888671875,"y":4305.49658203125,"z":36.66110229492187},"ENTER":{"x":1026.505615234375,"y":-3099.83203125,"z":-38.99980163574219}}', '1', 'Sinaloa', '{"item":{"meth_pooch":{"count":2500,"name":"meth_pooch","label":"Pochon de meth"},"ketaminetraitement":{"count":72,"name":"ketaminetraitement","label":"Pochon de Kétamine"},"maltetraiter":{"count":100,"name":"maltetraiter","label":"Bière"},"coke_pooch":{"count":1800,"name":"coke_pooch","label":"Pochon de coke"}},"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(127, 'appartement', '{"name":"appartement","label":"Appartement","poids":2500}', '60000', '{"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":1381.775390625,"y":4381.974609375,"z":45.19005584716797},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:2feb5ade335c493ff56ef143246aa0d6147ad3a0', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(128, 'apparement2', '{"name":"apparement2","label":"Apparement2","poids":2500}', '60000', '{"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":1374.18115234375,"y":4381.072265625,"z":45.10912322998047},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:c9543a66a115e4f21fe3dd66d3b473a22ed09865', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(129, 'appartement1', '{"name":"appartement1","label":"Appartement1","poids":2500}', '60000', '{"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":1365.9019775390626,"y":4358.01318359375,"z":44.50061798095703},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:d1026f5a2f70651339e82dea52d6589291953365', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(130, 'appartement3', '{"name":"appartement3","label":"Appartement3","poids":2500}', '60000', '{"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":1338.3179931640626,"y":4359.54638671875,"z":44.36733245849609},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:b9345b9c03648cc63007eec01e53e1f72635e226', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(131, 'apparement5', '{"name":"apparement5","label":"Apparement5","poids":2500}', '60000', '{"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":1429.6473388671876,"y":4377.5537109375,"z":44.59926605224609},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:62ac3368b5d408ad6fdc8f90b3910dbde63c3b92', '{"item":{"medikit":{"count":1,"name":"medikit","label":"Medikit"},"codeine":{"count":11,"name":"codeine","label":"Codéine"},"radio":{"count":1,"name":"radio","label":"Radio"},"frites":{"count":10,"name":"frites","label":"Frites"},"icetea":{"count":3,"name":"icetea","label":"Ice Tea"},"cocafrais":{"count":3,"name":"cocafrais","label":"Coca Frais"},"orangina":{"count":3,"name":"orangina","label":"Orangina"},"burger":{"count":10,"name":"burger","label":"Burger"},"bandage":{"count":1,"name":"bandage","label":"Bandage"}},"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[{"identifier":"license:3a92a45da839283e0e45d1b2be242121efe74d2e","name":"Carlos Lapointe"}],"GradesAlloweds":[]}', '0'),
	(132, 'appart', '{"name":"appart","label":"Appart","poids":2500}', '60000', '{"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":722.4796142578125,"y":4189.69482421875,"z":41.0928726196289},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:5f0bbdb09134ac6c7e86e05ae2d2c82acac87598', '{"item":{"chargeur":{"count":8,"name":"chargeur","label":"Chargeur"},"opiumrecolte":{"count":1,"name":"opiumrecolte","label":"Opium"}},"accounts":{"dirtycash":0,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(133, 'apparte', '{"name":"apparte","label":"Apparte","poids":2500}', '60000', '{"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":749.9116821289063,"y":4184.28662109375,"z":41.08782577514648},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:b9a8e740b60519ede73d8b735160653122c8bf2c', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(134, 'entrepot_hayes_motors', '{"poids":200000,"name":"entrepot_hayes_motors","label":"ENTREPOT HAYES MOTORS"}', '800000', '{"COFFRE":{"x":999.58251953125,"y":-3096.294677734375,"z":-39.99980163574219},"ENTER":{"x":1026.505615234375,"y":-3099.83203125,"z":-38.99980163574219},"EXIT":{"x":-1410.652587890625,"y":-456.785400390625,"z":34.48413467407226}}', '1', 'license:ac6fdb4058c375e5e1b77544dc936153243836e9', '{"item":{"jewels":{"count":255,"name":"jewels","label":"Bijou"}},"accounts":{"dirtycash":0,"cash":0},"weapons":{"910258":{"label":"Mini smg","name":"WEAPON_MINISMG","ammo":0}}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(135, 'petit_entrepot_vagos', '{"poids":75000,"label":"Petit entrepot Vagos","name":"petit_entrepot_vagos"}', '100000', '{"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"EXIT":{"x":415.1866149902344,"y":-2072.4287109375,"z":21.48126220703125}}', '1', 'license:6894740169b384cfb2660ebcf4740f7d8696dc69', '{"accounts":{"cash":0,"dirtycash":841739},"weapons":{"606273":{"label":"Queue de billard","name":"WEAPON_POOLCUE","ammo":0},"854120":{"label":"Poing américain","name":"WEAPON_KNUCKLE","ammo":0},"409187":{"label":"Smg","name":"WEAPON_SMG","ammo":250}},"item":{"maltetraiter":{"count":8,"label":"Bière","name":"maltetraiter"}}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(136, 'motel_vagos_1', '{"poids":1000,"label":"Motel Vagos 1","name":"motel_vagos_1"}', '60000', '{"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0},"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711},"EXIT":{"x":364.92333984375,"y":-2064.681396484375,"z":21.74453735351562}}', '1', 'license:42a1b1577af9e597cd8a42523f2b9a1ab8c3c7c6', '{"item":{"cocainetraitement":{"count":25,"name":"cocainetraitement","label":"Pochon de Cocaïne"},"jewels":{"count":15,"name":"jewels","label":"Bijou"}},"accounts":{"dirtycash":0,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(137, 'motel_vagos_2', '{"poids":1000,"label":"Motel Vagos 2","name":"motel_vagos_2"}', '60000', '{"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0},"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711},"EXIT":{"x":334.69354248046877,"y":-2058.0234375,"z":20.93643951416015}}', '1', 'license:86827dee90f49105d505615595c5c6b523f43f22', '{"item":{"pochonice":{"count":10,"name":"pochonice","label":"pochon d\'ice"},"phone":{"count":1,"name":"phone","label":"Téléphone"}},"accounts":{"dirtycash":0,"cash":0},"weapons":{"285488":{"label":"Queue de billard","name":"WEAPON_POOLCUE","ammo":0}}}', '{"PeopleAlloweds":[{"identifier":"license:4e337c8716a8c5afa90067706180a264ec648e16","name":"Tom"}],"GradesAlloweds":[]}', '0'),
	(138, 'motel_vagos_3', '{"poids":1000,"label":"Motel Vagos 3","name":"motel_vagos_3"}', '60000', '{"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0},"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711},"EXIT":{"x":345.4850769042969,"y":-2067.241943359375,"z":20.93635749816894}}', '1', 'license:86827dee90f49105d505615595c5c6b523f43f22', '{"item":{"alcoolbrut":{"count":2,"name":"alcoolbrut","label":"Alcool Brut"},"pomme2terre":{"count":15,"name":"pomme2terre","label":"Pomme de Terre"},"cocainetraitement":{"count":5,"name":"cocainetraitement","label":"Pochon de Cocaïne"}},"accounts":{"dirtycash":0,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(139, 'motel_vagos_4', '{"poids":1000,"label":"Motel Vagos 4","name":"motel_vagos_4"}', '60000', '{"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0},"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711},"EXIT":{"x":372.386962890625,"y":-2056.03173828125,"z":21.74456214904785}}', '1', 'license:86827dee90f49105d505615595c5c6b523f43f22', '{"item":{"alcoolbrut":{"count":13,"name":"alcoolbrut","label":"Alcool Brut"},"methtraitement":{"count":30,"name":"methtraitement","label":"Pochon de Méthamphétamine"},"pochonice":{"count":1,"name":"pochonice","label":"pochon d\'ice"},"opiumrecolte":{"count":2,"name":"opiumrecolte","label":"Opium"},"ammoniac":{"count":38,"name":"ammoniac","label":"Ammoniac"},"water":{"count":44,"name":"water","label":"Bouteille d\'eau"},"bread":{"count":1,"name":"bread","label":"Pain"},"weedtraitement":{"count":50,"name":"weedtraitement","label":"Pochon de Weed"}},"accounts":{"dirtycash":0,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(140, 'motel_vagos_5', '{"poids":1000,"label":"Motel Vagos 5","name":"motel_vagos_5"}', '60000', '{"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0},"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711},"EXIT":{"x":321.7856140136719,"y":-2100.087890625,"z":18.2440013885498}}', '1', 'license:38715ca4d742cd09ec82bfa1af25cfd454f88a91', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(141, 'motel_vagos_6', '{"poids":1000,"label":"Motel Vagos 6","name":"motel_vagos_6"}', '60000', '{"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0},"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711},"EXIT":{"x":312.374755859375,"y":-2054.011474609375,"z":20.93877029418945}}', '1', 'license:86827dee90f49105d505615595c5c6b523f43f22', '{"weapons":[],"item":[],"accounts":{"cash":0,"dirtycash":0}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(142, 'entrepot_cayo', '{"name":"entrepot_cayo","label":"Entrepot Cayo","poids":100000}', '500000', '{"ENTER":{"x":1048.5067138671876,"y":-3097.081787109375,"z":-38.99990081787109},"COFFRE":{"x":1070.829345703125,"y":-3098.585205078125,"z":-39.99990081787109},"EXIT":{"x":5009.69970703125,"y":-5201.8828125,"z":2.51500606536865}}', '1', 'Sinaloa', '{"item":{"medikit":{"count":42,"name":"medikit","label":"Medikit"},"chargeur":{"count":28,"name":"chargeur","label":"Chargeur"},"icerecolte":{"count":1,"name":"icerecolte","label":"Ice"},"ecstasy":{"count":15,"name":"ecstasy","label":"Ecstasy"},"bandage":{"count":27,"name":"bandage","label":"Bandage"},"malte":{"count":11,"name":"malte","label":"Malte"},"ketaminetraitement":{"count":4174,"name":"ketaminetraitement","label":"Pochon de Kétamine"},"frites":{"count":1,"name":"frites","label":"Frites"},"opiumrecolte":{"count":17,"name":"opiumrecolte","label":"Opium"},"hotdog":{"count":6,"name":"hotdog","label":"Hot Dog"},"maltetraiter":{"count":389,"name":"maltetraiter","label":"Bière"},"acierrecolte":{"count":44,"name":"acierrecolte","label":"Acier"},"codeine":{"count":5,"name":"codeine","label":"Codéine"},"ketaminerecolte":{"count":52,"name":"ketaminerecolte","label":"Ketamine"},"cocainetraitement":{"count":8,"name":"cocainetraitement","label":"Pochon de Cocaïne"},"weedtraitement":{"count":5,"name":"weedtraitement","label":"Pochon de Weed"},"water":{"count":2,"name":"water","label":"Bouteille d\'eau"},"opiumtraitement":{"count":10,"name":"opiumtraitement","label":"Pochon d\'opium"}},"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(143, 'maison_grapseed', '{"name":"maison_grapseed","label":"Maison Grapseed","poids":2500}', '60000', '{"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":1682.769775390625,"y":4855.046875,"z":42.06224822998047}}', '1', 'license:21f0fe1da09e59131758e1975e68443fdd92b205', '{"item":{"maltetraiter":{"count":68,"name":"maltetraiter","label":"Bière"}},"accounts":{"dirtycash":0,"cash":0},"weapons":{"205092":{"label":"Pistolet lourd","name":"WEAPON_HEAVYPISTOL","ammo":240},"55886":{"label":"Pistolet","name":"WEAPON_PISTOL","ammo":0},"335263":{"label":"Smg","name":"WEAPON_SMG","ammo":250}}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(144, 'maison_grapseed_2', '{"name":"maison_grapseed_2","label":"Maison Grapseed 2","poids":2500}', '60000', '{"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":1682.4833984375,"y":4840.935546875,"z":42.04078674316406}}', '1', 'license:ddd01a6849c8f0a09e7a7739a3badd2fdfd724f4', '{"item":{"maltetraiter":{"count":24,"name":"maltetraiter","label":"Bière"}},"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(145, 'maison_grapseed_3', '{"name":"maison_grapseed_3","label":"Maison Grapseed 3","poids":2500}', '60000', '{"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":1658.125244140625,"y":4839.17333984375,"z":42.0301399230957}}', '1', 'license:1393fb99d6c72cf17a9095b704c871b93c656aab', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(146, 'maison_grapseed_4', '{"name":"maison_grapseed_4","label":"Maison Grapseed 4","poids":2500}', '60000', '{"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":1657.0042724609376,"y":4851.62451171875,"z":41.98677062988281}}', '1', 'license:85f35c6ac32b39ad89c88187e04e82bd128de730', '{"item":{"lingotor":{"count":1,"name":"lingotor","label":"Lingot d\'or"}},"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(147, 'maison_grapseed_5', '{"name":"maison_grapseed_5","label":"Maison Grapseed 5","poids":2500}', '60000', '{"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":1655.30419921875,"y":4862.19189453125,"z":41.99838638305664}}', '1', 'license:4046f31f06a2ca60b7acb3667de0598fc14d6e57', '{"item":[],"accounts":{"dirtycash":999990,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(148, 'bunker51564498', '{"label":"Bunker-51564498","name":"bunker51564498","poids":200000}', '50000000', '{"EXIT":{"x":1867.26806640625,"y":272.5616760253906,"z":164.30506896972657},"ENTER":{"x":895.93017578125,"y":-3245.821044921875,"z":-98.24700164794922},"COFFRE":{"x":907.951416015625,"y":-3203.548095703125,"z":-96.18789672851563}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[{"identifier":"license:61ca0a2c8796295f10db04933ba6493137a4f5f2","name":"Eazio "},{"identifier":"license:25ba61fef887dea62128a0b3b1ad5a262b5562e6","name":"Sweaty"}],"GradesAlloweds":[]}', '0'),
	(151, 'lewis_gordon_', '{"poids":75000,"name":"lewis_gordon_","label":"Lewis Gordon "}', '100000', '{"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"EXIT":{"x":-21.90486907958984,"y":-214.61441040039063,"z":46.29379653930664},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164}}', '1', 'license:80b5a6c8747356ac8d9127c92bc34457831c9d44', '{"item":{"icerecolte":{"name":"icerecolte","label":"Ice","count":1},"methtraitement":{"name":"methtraitement","label":"Pochon de Méthamphétamine","count":9},"hotdog":{"name":"hotdog","label":"Hot Dog","count":26},"cigare":{"name":"cigare","label":"Cigare","count":1},"heroinerecolte":{"name":"heroinerecolte","label":"Héroine pure","count":5},"icetea":{"name":"icetea","label":"Ice Tea","count":13},"opiumtraitement":{"name":"opiumtraitement","label":"Pochon d\'opium","count":1},"vodka":{"name":"vodka","label":"Vodka","count":1},"lingotor":{"name":"lingotor","label":"Lingot d\'or","count":1},"cocainetraitement":{"name":"cocainetraitement","label":"Pochon de Cocaïne","count":11},"water":{"name":"water","label":"Bouteille d\'eau","count":3},"frites":{"name":"frites","label":"Frites","count":44},"radio":{"name":"radio","label":"Radio","count":2},"pochonice":{"name":"pochonice","label":"pochon d\'ice","count":16},"caoutchou":{"name":"caoutchou","label":"Caoutchou","count":6},"burger":{"name":"burger","label":"Burger","count":38},"metreshooter":{"name":"metreshooter","label":"Mètre de shooter","count":1},"cagoule":{"name":"cagoule","label":"Cagoule","count":1},"chargeur":{"name":"chargeur","label":"Chargeur","count":201},"jewels":{"name":"jewels","label":"Bijou","count":14},"methrecolte":{"name":"methrecolte","label":"Méthamphétamine","count":26},"ketaminerecolte":{"name":"ketaminerecolte","label":"Ketamine","count":25},"phone":{"name":"phone","label":"Téléphone","count":2},"opiumrecolte":{"name":"opiumrecolte","label":"Opium","count":3},"medikit":{"name":"medikit","label":"Medikit","count":3},"cocafrais":{"name":"cocafrais","label":"Coca Frais","count":5},"acierrecolte":{"name":"acierrecolte","label":"Acier","count":72}},"weapons":{"908639":{"ammo":250,"name":"WEAPON_SNSPISTOL","label":"Pistolet sns"},"74178":{"ammo":250,"name":"WEAPON_SMG","label":"Smg"},"782854":{"ammo":250,"name":"WEAPON_PISTOL50","label":"Pistolet calibre 50"},"100904":{"ammo":250,"name":"WEAPON_PISTOL","label":"Pistolet"},"148921":{"ammo":250,"name":"WEAPON_HEAVYPISTOL","label":"Pistolet lourd"},"290332":{"ammo":0,"name":"WEAPON_MICROSMG","label":"Micro smg"},"448548":{"ammo":250,"name":"WEAPON_SMG","label":"Smg"},"896599":{"ammo":250,"name":"WEAPON_PISTOL","label":"Pistolet"}},"accounts":{"dirtycash":0,"cash":0}}', '{"PeopleAlloweds":[{"name":"zoulou","identifier":"license:80cf6ceb879ff25c02f43fcb992061bb8bbf9f78"},{"name":"zoulou","identifier":"license:80cf6ceb879ff25c02f43fcb992061bb8bbf9f78"},{"name":"rayan","identifier":"license:80cf6ceb879ff25c02f43fcb992061bb8bbf9f78"},{"name":"rayan","identifier":"license:80cf6ceb879ff25c02f43fcb992061bb8bbf9f78"},{"name":"rayan","identifier":"license:80cf6ceb879ff25c02f43fcb992061bb8bbf9f78"},{"name":"rayan","identifier":"license:80cf6ceb879ff25c02f43fcb992061bb8bbf9f78"},{"name":"rayan","identifier":"license:80cf6ceb879ff25c02f43fcb992061bb8bbf9f78"},{"name":"rayan","identifier":"license:80cf6ceb879ff25c02f43fcb992061bb8bbf9f78"}],"GradesAlloweds":[]}', '0'),
	(152, 'jojo_krustanov_', '{"name":"jojo_krustanov_","label":"Jojo Krustanov ","poids":200000}', '800000', '{"EXIT":{"x":179.1314697265625,"y":-1269.4927978515626,"z":29.1984691619873},"COFFRE":{"x":999.58251953125,"y":-3096.294677734375,"z":-39.99980163574219},"ENTER":{"x":1026.505615234375,"y":-3099.83203125,"z":-38.99980163574219}}', '1', 'license:86827dee90f49105d505615595c5c6b523f43f22', '{"item":{"methrecolte":{"count":3,"name":"methrecolte","label":"Méthamphétamine"},"acierrecolte":{"count":1,"name":"acierrecolte","label":"Acier"},"alcooldecontrebande":{"count":5,"name":"alcooldecontrebande","label":"Alcool de Contrebande"},"weedtraitement":{"count":1,"name":"weedtraitement","label":"Pochon de Weed"},"munition":{"count":2,"name":"munition","label":"Munition"},"ketaminerecolte":{"count":1,"name":"ketaminerecolte","label":"Ketamine"},"opiumrecolte":{"count":4,"name":"opiumrecolte","label":"Opium"},"icerecolte":{"count":2,"name":"icerecolte","label":"Ice"},"orangina":{"count":9,"name":"orangina","label":"Orangina"},"pochonice":{"count":8,"name":"pochonice","label":"pochon d\'ice"},"weedrecolte":{"count":12,"name":"weedrecolte","label":"Weed"}},"accounts":{"dirtycash":4624000,"cash":0},"weapons":{"204011":{"label":"Smg","name":"WEAPON_SMG","ammo":250},"329700":{"label":"Fusil compact","name":"WEAPON_COMPACTRIFLE","ammo":250},"577620":{"label":"Pistolet","name":"WEAPON_PISTOL","ammo":250},"319239":{"label":"Fusil compact","name":"WEAPON_COMPACTRIFLE","ammo":250},"717749":{"label":"Smg","name":"WEAPON_SMG","ammo":250},"835909":{"label":"Smg","name":"WEAPON_SMG","ammo":250},"426520":{"label":"Pistolet","name":"WEAPON_PISTOL","ammo":0},"119645":{"label":"Fusil avancé","name":"WEAPON_ADVANCEDRIFLE","ammo":124}}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(155, 'lewis_gordon', '{"name":"lewis_gordon","label":"Lewis Gordon","poids":75000}', '100000', '{"EXIT":{"x":-25.91073417663574,"y":-225.75936889648438,"z":46.29342651367187},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109}}', '1', 'license:80cf6ceb879ff25c02f43fcb992061bb8bbf9f78', '{"accounts":{"cash":0,"dirtycash":0},"item":{"opiumrecolte":{"count":35,"label":"Opium","name":"opiumrecolte"},"aciertraitement":{"count":13,"label":"Acier Traité","name":"aciertraitement"},"chargeur":{"count":15,"label":"Chargeur","name":"chargeur"},"cagoule":{"count":1,"label":"Cagoule","name":"cagoule"},"lsdtraitement":{"count":12,"label":"Pochon de LSD","name":"lsdtraitement"}},"weapons":{}}', '{"PeopleAlloweds":[{"name":"zykoooo","identifier":"license:80b5a6c8747356ac8d9127c92bc34457831c9d44"}],"GradesAlloweds":[]}', '0'),
	(156, 'jones_anderson', '{"name":"jones_anderson","label":"Jones anderson","poids":4000}', '3500000', '{"EXIT":{"x":-1465.041015625,"y":-34.41318893432617,"z":55.05038833618164},"COFFRE":{"x":-1456.83740234375,"y":-531.0899047851563,"z":55.9369010925293},"ENTER":{"x":-1459.1700439453126,"y":-520.5800170898438,"z":54.92900085449219}}', '1', 'license:277c05af3fb9a587f985b57d00162cab843400b6', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[{"identifier":"license:671d775eb357da102aaa878a1b6185d4b0fde67a","name":"Alexgame44c"}],"GradesAlloweds":[]}', '0'),
	(157, 'daryl_dixson', '{"name":"daryl_dixson","label":"Daryl Dixson","poids":2500}', '60000', '{"EXIT":{"x":1386.2376708984376,"y":-593.460693359375,"z":74.48135375976563},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:450830446b9e5569be368ff252929cabe27096a3', '{"item":{"chargeur":{"count":26,"name":"chargeur","label":"Chargeur"},"opiumtraitement":{"count":22,"name":"opiumtraitement","label":"Pochon d\'opium"},"cocainetraitement":{"count":29,"name":"cocainetraitement","label":"Pochon de Cocaïne"},"weed":{"count":7,"name":"weed","label":"Weed"},"cocainerecolte":{"count":65,"name":"cocainerecolte","label":"Cocaïne"},"icerecolte":{"count":6,"name":"icerecolte","label":"Ice"},"pelle":{"count":1,"name":"pelle","label":"Pelle"},"weedtraitement":{"count":12,"name":"weedtraitement","label":"Pochon de Weed"}},"accounts":{"dirtycash":250000,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(158, 'daryl_dixson_', '{"name":"daryl_dixson_","label":"Daryl Dixson ","poids":2500}', '60000', '{"EXIT":{"x":1388.991943359375,"y":-569.4847412109375,"z":74.49654388427735},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:edbb320097ef87afb8848a0a4b85bcd36a623f88', '{"item":[],"accounts":{"dirtycash":253733,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(160, 'juan_flores', '{"label":"Juan Flores","name":"juan_flores","poids":2500}', '60000', '{"EXIT":{"x":-599.5927734375,"y":806.9159545898438,"z":191.12745666503907},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:2b6c8be0f50b5665517855a9493d3775b78cbc97', '{"item":{"jewels":{"count":270,"name":"jewels","label":"Bijou"},"aciertraitement":{"count":8,"name":"aciertraitement","label":"Acier Traité"}},"accounts":{"dirtycash":1479347,"cash":0},"weapons":{"661752":{"label":"Revolver","name":"WEAPON_REVOLVER","ammo":236},"276175":{"label":"Micro smg","name":"WEAPON_MICROSMG","ammo":234}}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(161, 'rypzn__bunker', '{"name":"rypzn__bunker","label":"Rypzn_ Bunker","poids":200000}', '50000000', '{"ENTER":{"x":895.93017578125,"y":-3245.821044921875,"z":-98.24700164794922},"EXIT":{"x":-1155.0611572265626,"y":-1468.8935546875,"z":4.37892389297485},"COFFRE":{"x":907.951416015625,"y":-3203.548095703125,"z":-96.18789672851563}}', '0', NULL, '{"item":{"weedtraitement":{"count":25,"name":"weedtraitement","label":"Pochon de Weed"}},"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(162, 'ecorp', '{"name":"ecorp","label":"ecorp","poids":200000}', '800000', '{"COFFRE":{"x":999.58251953125,"y":-3096.294677734375,"z":-39.99980163574219},"EXIT":{"x":2880.18994140625,"y":4418.88134765625,"z":49.62688064575195},"ENTER":{"x":1026.505615234375,"y":-3099.83203125,"z":-38.99980163574219}}', '1', 'ecorp', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(163, 'jonhson_hopes', '{"name":"jonhson_hopes","label":"Jonhson Hopes","poids":75000}', '100000', '{"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"EXIT":{"x":-28.90845489501953,"y":-234.12310791015626,"z":46.29322814941406}}', '1', 'license:ba90402080c34636e0da37a02a5e1ce07fff9fc8', '{"weapons":[]}', '{"PeopleAlloweds":[{"identifier":"license:80cf6ceb879ff25c02f43fcb992061bb8bbf9f78","name":"zoulou"},{"identifier":"license:80b5a6c8747356ac8d9127c92bc34457831c9d44","name":"la chic"}],"GradesAlloweds":[]}', '0'),
	(164, 'daryl_dixson_sheriff', '{"name":"daryl_dixson_sheriff","poids":3000,"label":"Daryl dixson sheriff"}', '1300000', '{"COFFRE":{"x":-623.0919189453125,"y":54.69309997558594,"z":96.59940338134766},"ENTER":{"x":-612.1599731445313,"y":59.06000137329101,"z":97.19999694824219},"EXIT":{"x":-229.5975341796875,"y":6445.5048828125,"z":31.19744110107422}}', '1', 'license:ba90402080c34636e0da37a02a5e1ce07fff9fc8', '{"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(165, 'entrepot_loly', '{"label":"Entrepot Loly","name":"entrepot_loly","poids":75000}', '100000', '{"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"EXIT":{"x":83.37179565429688,"y":-235.07969665527345,"z":51.39948272705078},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164}}', '1', 'license:3e36806cd2f3f7aca3c32d89f629ab73bae3ae91', '{"item":[],"accounts":{"dirtycash":110119,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(166, 'entrepot_de_marco', '{"poids":75000,"name":"entrepot_de_marco","label":"Entrepot de Marco"}', '100000', '{"EXIT":{"x":420.6977844238281,"y":-2057.939453125,"z":22.27512168884277},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109}}', '1', 'license:00d968fa28e4072d0df67547350487cd7228aec5', '{"item":{"tissu":{"count":599,"name":"tissu","label":"Tissu"}},"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(167, 'entrepôt_cali', '{"poids":200000,"name":"entrepôt_cali","label":"Entrepôt Cali"}', '800000', '{"COFFRE":{"x":999.58251953125,"y":-3096.294677734375,"z":-39.99980163574219},"EXIT":{"x":-1541.121826171875,"y":92.11653900146485,"z":53.89736938476562},"ENTER":{"x":1026.505615234375,"y":-3099.83203125,"z":-38.99980163574219}}', '1', 'Cali', '{"accounts":{"cash":0,"dirtycash":0},"weapons":{},"item":{"icerecolte":{"name":"icerecolte","count":24,"label":"Ice"},"ammoniac":{"name":"ammoniac","count":1014,"label":"Ammoniac"},"methtraitement":{"name":"methtraitement","count":300,"label":"Pochon de Méthamphétamine"},"weedrecolte":{"name":"weedrecolte","count":5,"label":"Weed"},"ecstasy":{"name":"ecstasy","count":46,"label":"Ecstasy"},"Mongolienne":{"name":"Mongolienne","count":12,"label":"Mongolienne"},"heroinerecolte":{"name":"heroinerecolte","count":34,"label":"Héroine pure"},"frites":{"name":"frites","count":78,"label":"Frites"},"opiumtraitement":{"name":"opiumtraitement","count":50,"label":"Pochon d\'opium"},"bandage":{"name":"bandage","count":5,"label":"Bandage"},"cagoule":{"name":"cagoule","count":25,"label":"Cagoule"},"methrecolte":{"name":"methrecolte","count":145,"label":"Méthamphétamine"},"cocainetraitement":{"name":"cocainetraitement","count":87,"label":"Pochon de Cocaïne"},"pelle":{"name":"pelle","count":1,"label":"Pelle"},"alcoolbrut":{"name":"alcoolbrut","count":15,"label":"Alcool Brut"},"pochonice":{"name":"pochonice","count":1,"label":"pochon d\'ice"},"tabac":{"name":"tabac","count":1,"label":"Tabac"},"burger":{"name":"burger","count":37,"label":"Burger"},"lsdtraitement":{"name":"lsdtraitement","count":12,"label":"Pochon de LSD"},"alcooldecontrebande":{"name":"alcooldecontrebande","count":20,"label":"Alcool de Contrebande"},"weedtraitement":{"name":"weedtraitement","count":121,"label":"Pochon de Weed"},"jewels":{"name":"jewels","count":679,"label":"Bijou"},"cocainerecolte":{"name":"cocainerecolte","count":15,"label":"Cocaïne"},"ketaminerecolte":{"name":"ketaminerecolte","count":1,"label":"Ketamine"},"ketaminetraitement":{"name":"ketaminetraitement","count":54,"label":"Pochon de Kétamine"},"opiumrecolte":{"name":"opiumrecolte","count":1014,"label":"Opium"},"medikit":{"name":"medikit","count":3,"label":"Medikit"},"cocafrais":{"name":"cocafrais","count":77,"label":"Coca Frais"},"chargeur":{"name":"chargeur","count":37,"label":"Chargeur"}}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(168, 'burak_hernandez_', '{"poids":75000,"name":"burak_hernandez_","label":"Burak hernandez "}', '100000', '{"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"EXIT":{"x":295.2275390625,"y":-2067.650390625,"z":17.64954948425293},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164}}', '1', 'license:37cd8645b124ca7cda95824339f8ac0df517b204', '{"item":{"opiumtraitement":{"count":20,"name":"opiumtraitement","label":"Pochon d\'opium"},"heroinerecolte":{"count":3,"name":"heroinerecolte","label":"Héroine pure"},"lsdtraitement":{"count":2,"name":"lsdtraitement","label":"Pochon de LSD"},"aluminium":{"count":3001,"name":"aluminium","label":"Aluminium"},"methtraitement":{"count":4,"name":"methtraitement","label":"Pochon de Méthamphétamine"},"Mongolienne":{"count":4,"name":"Mongolienne","label":"Mongolienne"}},"accounts":{"dirtycash":0,"cash":0},"weapons":{"600631":{"label":"Clé","name":"WEAPON_WRENCH","ammo":0},"817635":{"label":"Poing américain","name":"WEAPON_KNUCKLE","ammo":0}}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(169, 'dimitri_wasielewski', '{"name":"dimitri_wasielewski","poids":3500,"label":"Dimitri Wasielewski"}', '5000000', '{"COFFRE":{"x":-795.7161254882813,"y":326.81500244140627,"z":186.31289672851563},"EXIT":{"x":167.4609832763672,"y":473.78729248046877,"z":142.51324462890626},"ENTER":{"x":-785.1300048828125,"y":315.7900085449219,"z":187.91000366210938}}', '1', 'license:cf86606cf70fa4144c05c385623df32ddf07b4b0', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(170, 'noa_slayz', '{"name":"noa_slayz","poids":3000,"label":"Noa Slayz"}', '1300000', '{"COFFRE":{"x":-623.0919189453125,"y":54.69309997558594,"z":96.59940338134766},"EXIT":{"x":-455.0232238769531,"y":6197.169921875,"z":29.55284118652343},"ENTER":{"x":-612.1599731445313,"y":59.06000137329101,"z":97.19999694824219}}', '1', 'license:86827dee90f49105d505615595c5c6b523f43f22', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(171, 'chambre_mathieu', '{"name":"chambre_mathieu","poids":1000,"label":"Chambre Mathieu"}', '60000', '{"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0},"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711},"EXIT":{"x":-1482.8502197265626,"y":-49.21757125854492,"z":54.63923263549805}}', '1', 'license:23c66a535937500eee94e25a100247846cc0f23a', '{"item":{"cocainerecolte":{"count":231,"name":"cocainerecolte","label":"Cocaïne"},"water":{"count":11,"name":"water","label":"Bouteille d\'eau"},"hotdog":{"count":11,"name":"hotdog","label":"Hot Dog"}},"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(172, 'chambre_morgane', '{"name":"chambre_morgane","poids":1000,"label":"Chambre Morgane"}', '60000', '{"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0},"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711},"EXIT":{"x":-1473.22998046875,"y":-58.25695419311523,"z":54.63890838623047}}', '1', 'license:23c66a535937500eee94e25a100247846cc0f23a', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(173, 'bunker_bm', '{"name":"bunker_bm","poids":200000,"label":"Bunker BM"}', '50000000', '{"COFFRE":{"x":907.951416015625,"y":-3203.548095703125,"z":-96.18789672851563},"ENTER":{"x":895.93017578125,"y":-3245.821044921875,"z":-98.24700164794922},"EXIT":{"x":993.9300537109375,"y":-1558.2244873046876,"z":30.84195518493652}}', '1', 'blackmarket', '{"item":{},"accounts":{"dirtycash":0,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(174, 'w.cooper', '{"name":"w.cooper","poids":200000,"label":"W.Cooper"}', '800000', '{"COFFRE":{"x":999.58251953125,"y":-3096.294677734375,"z":-39.99980163574219},"ENTER":{"x":1026.505615234375,"y":-3099.83203125,"z":-38.99980163574219},"EXIT":{"x":43.96619033813476,"y":6303.69775390625,"z":31.22022438049316}}', '1', 'license:a89dcac0be6253bfda5acb050ca6d884fa11cc48', '{"accounts":{"dirtycash":5414242,"cash":2000000},"item":{"chargeur":{"count":45,"label":"Chargeur","name":"chargeur"},"opiumrecolte":{"count":1,"label":"Opium","name":"opiumrecolte"},"methtraitement":{"count":12,"label":"Pochon de Méthamphétamine","name":"methtraitement"},"medikit":{"count":6,"label":"Medikit","name":"medikit"},"police_cuff":{"label":"Menottes LSPD","count":3,"name":"police_cuff"},"ecstasy":{"count":1,"label":"Ecstasy","name":"ecstasy"},"piluleoubli":{"count":2,"label":"GHB","name":"piluleoubli"},"police_key":{"label":"Clefs de Menottes LSPD","count":1,"name":"police_key"}},"weapons":{"659555":{"label":"Poing américain","ammo":0,"name":"WEAPON_KNUCKLE"},"480109":{"label":"Lance fusée de détresse","ammo":20,"name":"WEAPON_FLAREGUN"},"756216":{"label":"Matraque","ammo":0,"name":"WEAPON_NIGHTSTICK"},"879273":{"label":"Pistolet calibre 50","ammo":0,"name":"WEAPON_PISTOL50"},"293947":{"label":"Couteau","ammo":0,"name":"WEAPON_KNIFE"},"33254":{"label":"Pistolet calibre 50","ammo":0,"name":"WEAPON_PISTOL50"},"205414":{"label":"Pistolet lourd","ammo":0,"name":"WEAPON_HEAVYPISTOL"},"428445":{"label":"Pistolet lourd","ammo":0,"name":"WEAPON_HEAVYPISTOL"},"435833":{"label":"Pistolet de combat","ammo":0,"name":"WEAPON_COMBATPISTOL"},"253232":{"label":"Lampe torche","ammo":0,"name":"WEAPON_FLASHLIGHT"},"715628":{"label":"Pistolet de combat","ammo":0,"name":"WEAPON_COMBATPISTOL"},"580854":{"label":"Revolver","ammo":250,"name":"WEAPON_REVOLVER"},"357793":{"label":"Pistolet","ammo":250,"name":"WEAPON_PISTOL"},"958612":{"label":"Pistolet","ammo":250,"name":"WEAPON_PISTOL"},"259682":{"label":"Pistolet calibre 50","ammo":0,"name":"WEAPON_PISTOL50"},"528238":{"label":"Revolver","ammo":0,"name":"WEAPON_REVOLVER"}}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(175, 'entrepot_sweaty', '{"label":"Entrepot Sweaty","poids":75000,"name":"entrepot_sweaty"}', '100000', '{"EXIT":{"x":2461.181640625,"y":1589.2203369140626,"z":33.04554748535156},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109}}', '1', 'license:25ba61fef887dea62128a0b3b1ad5a262b5562e6', '{"item":{"acierrecolte":{"count":22,"name":"acierrecolte","label":"Acier"}},"accounts":{"dirtycash":0,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(176, 'maison_morgane', '{"label":"Maison Morgane","name":"maison_morgane","poids":3000}', '1300000', '{"ENTER":{"x":-612.1599731445313,"y":59.06000137329101,"z":97.19999694824219},"EXIT":{"x":-1190.1070556640626,"y":292.3857116699219,"z":69.89249420166016},"COFFRE":{"x":-623.0919189453125,"y":54.69309997558594,"z":96.59940338134766}}', '1', 'license:5c1ba5ea8c8665a4e4e9f227c5fefec1618fce9f', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[{"identifier":"license:38b7100f86800c951fd94fe75ab5d81e04bcc9a3","name":"Vyrox_ the Baguette (R.Moreau)"}],"GradesAlloweds":[]}', '0'),
	(177, 'sheriff', '{"label":"Sheriff","name":"sheriff","poids":200000}', '800000', '{"EXIT":{"x":-453.55145263671877,"y":5997.67822265625,"z":36.99568557739258},"COFFRE":{"x":999.58251953125,"y":-3096.294677734375,"z":-39.99980163574219},"ENTER":{"x":1026.505615234375,"y":-3099.83203125,"z":-38.99980163574219}}', '1', 'sheriff', '{"item":{"methtraitement":{"count":55,"name":"methtraitement","label":"Pochon de Méthamphétamine"},"cocainetraitement":{"count":44,"name":"cocainetraitement","label":"Pochon de Cocaïne"},"opiumtraitement":{"count":17,"name":"opiumtraitement","label":"Pochon d\'opium"},"weedtraitement":{"count":32,"name":"weedtraitement","label":"Pochon de Weed"}},"accounts":{"dirtycash":3268,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":{"Lieutenant":true,"Caporal":true,"Capitaine":true,"Officier":true,"Sergent":true,"Sheriff":true,"Recrue":true}}', '0'),
	(178, 'entrepot_sanchez', '{"label":"Entrepot Sanchez","name":"entrepot_sanchez","poids":200000}', '800000', '{"ENTER":{"x":1026.505615234375,"y":-3099.83203125,"z":-38.99980163574219},"COFFRE":{"x":999.58251953125,"y":-3096.294677734375,"z":-39.99980163574219},"EXIT":{"x":-1284.658203125,"y":-792.090576171875,"z":17.5933895111084}}', '1', 'license:ba90402080c34636e0da37a02a5e1ce07fff9fc8', '{"item":{"methtraitement":{"name":"methtraitement","label":"Pochon de Méthamphétamine","count":96},"hotdog":{"name":"hotdog","label":"Hot Dog","count":3},"cbd":{"name":"cbd","label":"CBD","count":9},"heroinerecolte":{"name":"heroinerecolte","label":"Héroine pure","count":1},"munition":{"name":"munition","label":"Munition","count":10},"acierrecolte":{"name":"acierrecolte","label":"Acier","count":50},"bandage":{"name":"bandage","label":"Bandage","count":29},"cocainetraitement":{"name":"cocainetraitement","label":"Pochon de Cocaïne","count":106},"burger":{"name":"burger","label":"Burger","count":26},"weedtraitement":{"name":"weedtraitement","label":"Pochon de Weed","count":225},"cocainerecolte":{"name":"cocainerecolte","label":"Cocaïne","count":86},"chargeur":{"name":"chargeur","label":"Chargeur","count":16},"ketaminetraitement":{"name":"ketaminetraitement","label":"Pochon de Kétamine","count":11},"opiumrecolte":{"name":"opiumrecolte","label":"Opium","count":42},"medikit":{"name":"medikit","label":"Medikit","count":50},"opiumtraitement":{"name":"opiumtraitement","label":"Pochon d\'opium","count":41},"jusfruit":{"name":"jusfruit","label":"Jus de fruits","count":2}},"weapons":{"3973":{"ammo":0,"name":"WEAPON_PISTOL","label":"Pistolet"},"94506":{"ammo":250,"name":"WEAPON_MICROSMG","label":"Micro smg"},"860279":{"ammo":0,"name":"WEAPON_PISTOL50","label":"Pistolet calibre 50"},"89354":{"ammo":236,"name":"WEAPON_HEAVYPISTOL","label":"Pistolet lourd"},"549456":{"ammo":0,"name":"WEAPON_PISTOL50","label":"Pistolet calibre 50"},"625314":{"ammo":0,"name":"WEAPON_POOLCUE","label":"Queue de billard"},"915966":{"ammo":0,"name":"WEAPON_PISTOL50","label":"Pistolet calibre 50"},"806280":{"ammo":0,"name":"WEAPON_WRENCH","label":"Clé"},"555400":{"ammo":250,"name":"WEAPON_COMBATPISTOL","label":"Pistolet de combat"},"974695":{"ammo":0,"name":"WEAPON_HEAVYPISTOL","label":"Pistolet lourd"},"355164":{"ammo":0,"name":"WEAPON_NIGHTSTICK","label":"Matraque"},"371209":{"ammo":0,"name":"WEAPON_HEAVYPISTOL","label":"Pistolet lourd"},"941744":{"ammo":0,"name":"WEAPON_MINISMG","label":"Mini smg"},"982458":{"ammo":0,"name":"WEAPON_PISTOL","label":"Pistolet"},"504103":{"ammo":0,"name":"WEAPON_MINISMG","label":"Mini smg"},"542896":{"ammo":0,"name":"WEAPON_MINISMG","label":"Mini smg"},"268569":{"ammo":0,"name":"WEAPON_PISTOL50","label":"Pistolet calibre 50"},"653654":{"ammo":250,"name":"WEAPON_HEAVYPISTOL","label":"Pistolet lourd"},"889483":{"ammo":0,"name":"WEAPON_PISTOL","label":"Pistolet"},"65481":{"ammo":0,"name":"WEAPON_KNUCKLE","label":"Poing américain"},"382274":{"ammo":0,"name":"WEAPON_PISTOL","label":"Pistolet"},"576471":{"ammo":0,"name":"WEAPON_CROWBAR","label":"Pied de biche"}},"accounts":{"dirtycash":394199,"cash":0}}', '{"PeopleAlloweds":[{"identifier":"license:be5d7be853b4150fe0feb87f9c2ccadb208cc79c","name":"Rayan"},{"identifier":"license:796c073fd5dcf8d8f86102d68310167944790034","name":"Boldy Ryg | Nxyako"}],"GradesAlloweds":[]}', '0'),
	(179, 'entrepôt_vendetta', '{"label":"Entrepôt Vendetta","name":"entrepôt_vendetta","poids":75000}', '100000', '{"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"EXIT":{"x":1233.376220703125,"y":-3235.510986328125,"z":5.52874755859375}}', '1', 'license:b183fb7c40652ee85064ecf2ddb3a318e05af4d8', '{"item":[],"weapons":{},"accounts":{"dirtycash":0,"cash":0}}', '{"PeopleAlloweds":[{"identifier":"license:516bd5147920646693662122b406cc30214ae432","name":"RS4GrisNardo"},{"identifier":"license:075fbf1c2eef781531c2e5b1f183371deea9fb9e","name":"Léaa"}],"GradesAlloweds":[]}', '0'),
	(180, 'villa', '{"label":"Villa","name":"villa","poids":3000}', '1300000', '{"ENTER":{"x":-612.1599731445313,"y":59.06000137329101,"z":97.19999694824219},"EXIT":{"x":-721.855224609375,"y":490.44171142578127,"z":109.62337493896485},"COFFRE":{"x":-623.0919189453125,"y":54.69309997558594,"z":96.59940338134766}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(181, 'entrepot_1410', '{"label":"entrepot 1410","name":"entrepot_1410","poids":75000}', '100000', '{"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"EXIT":{"x":1218.4002685546876,"y":-3235.552734375,"z":5.52874946594238},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164}}', '1', 'license:a89dcac0be6253bfda5acb050ca6d884fa11cc48', '{"item":[],"accounts":{"dirtycash":4957,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(182, 'entrepot_swt', '{"label":"Entrepot SWT","name":"entrepot_swt","poids":75000}', '100000', '{"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"EXIT":{"x":-675.8906860351563,"y":-885.0634765625,"z":24.45547485351562}}', '1', 'loszetas', '{"item":{"metreshooter":{"name":"metreshooter","label":"Mètre de shooter","count":1},"alcooldecontrebande":{"name":"alcooldecontrebande","label":"Alcool de Contrebande","count":3},"ammoniac":{"name":"ammoniac","label":"Ammoniac","count":10},"cigare":{"name":"cigare","label":"Cigare","count":4},"methtraitement":{"name":"methtraitement","label":"Pochon de Méthamphétamine","count":5},"alcoolbrut":{"name":"alcoolbrut","label":"Alcool Brut","count":4},"methrecolte":{"name":"methrecolte","label":"Méthamphétamine","count":2},"jager":{"name":"jager","label":"Jägermeister","count":39}},"accounts":{"dirtycash":0,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":{"Boss":true,"Recrue":true,"Membre":true,"Gérant":true}}', '0'),
	(183, 'entrepot_ali', '{"label":"Entrepot Ali","name":"entrepot_ali","poids":75000}', '100000', '{"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"EXIT":{"x":939.7544555664063,"y":-1490.0042724609376,"z":30.22783279418945}}', '1', 'license:86827dee90f49105d505615595c5c6b523f43f22', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(184, 'casa_rambo', '{"poids":2500,"label":"Casa Rambo","name":"casa_rambo"}', '60000', '{"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":352.774169921875,"y":-142.60086059570313,"z":66.68832397460938}}', '1', 'license:50d9433938c7a277cf7861f122cb97e312339b42', '{"weapons":{"271928":{"ammo":250,"name":"WEAPON_REVOLVER","label":"Revolver"},"438594":{"ammo":0,"name":"WEAPON_FLASHLIGHT","label":"Lampe torche"},"860108":{"ammo":100,"name":"WEAPON_STUNGUN","label":"Tazer"},"956206":{"ammo":100,"name":"WEAPON_STUNGUN","label":"Tazer"},"599023":{"ammo":111,"name":"WEAPON_ADVANCEDRIFLE","label":"Fusil avancé"},"492810":{"ammo":250,"name":"WEAPON_REVOLVER","label":"Revolver"},"598584":{"ammo":0,"name":"WEAPON_FLASHLIGHT","label":"Lampe torche"},"704324":{"ammo":242,"name":"WEAPON_REVOLVER","label":"Revolver"},"126745":{"ammo":250,"name":"WEAPON_COMBATPISTOL","label":"Pistolet de combat"},"266998":{"ammo":0,"name":"WEAPON_PISTOL","label":"Pistolet"},"686405":{"ammo":0,"name":"WEAPON_FLASHLIGHT","label":"Lampe torche"},"707021":{"ammo":0,"name":"WEAPON_CARBINERIFLE","label":"Carabine d\'assaut"},"501094":{"ammo":250,"name":"WEAPON_COMBATPISTOL","label":"Pistolet de combat"},"779116":{"ammo":250,"name":"WEAPON_REVOLVER","label":"Revolver"},"458257":{"ammo":200,"name":"WEAPON_STUNGUN","label":"Tazer"},"151195":{"ammo":250,"name":"WEAPON_MINISMG","label":"Mini smg"},"949526":{"ammo":250,"name":"WEAPON_PISTOL","label":"Pistolet"},"730756":{"ammo":0,"name":"WEAPON_POOLCUE","label":"Queue de billard"},"684462":{"ammo":250,"name":"WEAPON_COMBATPISTOL","label":"Pistolet de combat"},"387084":{"ammo":250,"name":"WEAPON_CARBINERIFLE","label":"Carabine d\'assaut"},"19832":{"ammo":250,"name":"WEAPON_MACHINEPISTOL","label":"Pistolet mitrailleur"},"391378":{"ammo":100,"name":"WEAPON_STUNGUN","label":"Tazer"},"925942":{"ammo":250,"name":"WEAPON_COMPACTRIFLE","label":"Fusil compact"},"961170":{"ammo":250,"name":"WEAPON_MINISMG","label":"Mini smg"},"941719":{"ammo":250,"name":"WEAPON_PISTOL","label":"Pistolet"},"288856":{"ammo":0,"name":"WEAPON_NIGHTSTICK","label":"Matraque"},"400987":{"ammo":250,"name":"WEAPON_SMG","label":"Smg"},"169868":{"ammo":250,"name":"WEAPON_COMBATPISTOL","label":"Pistolet de combat"},"289622":{"ammo":250,"name":"WEAPON_MICROSMG","label":"Micro smg"},"575301":{"ammo":140,"name":"WEAPON_ADVANCEDRIFLE","label":"Fusil avancé"},"656729":{"ammo":0,"name":"WEAPON_ADVANCEDRIFLE","label":"Fusil avancé"},"781437":{"ammo":0,"name":"WEAPON_COMBATPISTOL","label":"Pistolet de combat"},"856973":{"ammo":0,"name":"WEAPON_FLASHLIGHT","label":"Lampe torche"},"75927":{"ammo":0,"name":"WEAPON_WRENCH","label":"Clé"},"833021":{"ammo":0,"name":"WEAPON_FLASHLIGHT","label":"Lampe torche"}},"item":{"icetea":{"name":"icetea","label":"Ice Tea","count":9},"hotdog":{"name":"hotdog","label":"Hot Dog","count":8},"ecstasy":{"name":"ecstasy","label":"Ecstasy","count":664},"heroinerecolte":{"name":"heroinerecolte","label":"Héroine pure","count":723},"acierrecolte":{"name":"acierrecolte","label":"Acier","count":1},"purplehazerecolte":{"name":"purplehazerecolte","label":"Purple Haze","count":1},"cocainetraitement":{"name":"cocainetraitement","label":"Pochon de Cocaïne","count":120},"water":{"name":"water","label":"Bouteille d\'eau","count":7},"frites":{"name":"frites","label":"Frites","count":10},"whisky":{"name":"whisky","label":"Whisky","count":5},"burger":{"name":"burger","label":"Burger","count":15},"chargeur":{"name":"chargeur","label":"Chargeur","count":7},"alcoolbrut":{"name":"alcoolbrut","label":"Alcool Brut","count":4},"cocafrais":{"name":"cocafrais","label":"Coca Frais","count":17},"ammoniac":{"name":"ammoniac","label":"Ammoniac","count":22},"pochoncodeine":{"name":"pochoncodeine","label":"Pochon de Codéine","count":1966},"police_cuff":{"name":"police_cuff","label":"Menottes LSPD","count":1},"aciertraitement":{"name":"aciertraitement","label":"Acier Traité","count":79},"orangina":{"name":"orangina","label":"Orangina","count":6},"cigare":{"name":"cigare","label":"Cigare","count":1},"bandage":{"name":"bandage","label":"Bandage","count":27},"methrecolte":{"name":"methrecolte","label":"Méthamphétamine","count":253},"pomme2terre":{"name":"pomme2terre","label":"Pomme de Terre","count":2},"pelle":{"name":"pelle","label":"Pelle","count":2},"viande":{"name":"viande","label":"Viande","count":10},"pochonice":{"name":"pochonice","label":"pochon d\'ice","count":15},"jager":{"name":"jager","label":"Jägermeister","count":10},"vodka":{"name":"vodka","label":"Vodka","count":8},"weed":{"name":"weed","label":"Weed","count":1},"police_key":{"name":"police_key","label":"Clefs de Menottes LSPD","count":1},"weedtraitement":{"name":"weedtraitement","label":"Pochon de Weed","count":130},"rhum":{"name":"rhum","label":"Rhum","count":6},"opiumtraitement":{"name":"opiumtraitement","label":"Pochon d\'opium","count":108},"methtraitement":{"name":"methtraitement","label":"Pochon de Méthamphétamine","count":150},"bread":{"name":"bread","label":"Pain","count":11},"opiumrecolte":{"name":"opiumrecolte","label":"Opium","count":38},"medikit":{"name":"medikit","label":"Medikit","count":63},"tequila":{"name":"tequila","label":"Tequila","count":5},"maltetraiter":{"name":"maltetraiter","label":"Bière","count":9}},"accounts":{"dirtycash":27587500,"cash":15872103}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(185, 'entrepôt_du_port', '{"poids":75000,"label":"Entrepôt du Port","name":"entrepôt_du_port"}', '100000', '{"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"EXIT":{"x":-252.62693786621095,"y":-2585.976806640625,"z":6.00063323974609}}', '1', 'peakyblinders', '{"item":{"chargeur":{"count":16,"name":"chargeur","label":"Chargeur"},"Mongolienne":{"count":1,"name":"Mongolienne","label":"Mongolienne"},"bois":{"count":2,"name":"bois","label":"Buche de Bois"}},"accounts":{"cash":0,"dirtycash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":{"Membre":true,"Recrue":true,"Gérant":true,"Boss":true}}', '0'),
	(186, 'entrepôt_', '{"poids":75000,"label":"Entrepôt ","name":"entrepôt_"}', '100000', '{"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"EXIT":{"x":-1286.985107421875,"y":-277.9396667480469,"z":38.59173965454101}}', '1', 'license:f48ff9552b5d7a894eade79591099980ee07bb8e', '{"item":{"methtraitement":{"count":51,"name":"methtraitement","label":"Pochon de Méthamphétamine"},"jewels":{"count":1,"name":"jewels","label":"Bijou"},"opiumtraitement":{"count":17,"name":"opiumtraitement","label":"Pochon d\'opium"},"weedtraitement":{"count":11,"name":"weedtraitement","label":"Pochon de Weed"}},"accounts":{"dirtycash":0,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(187, 'entrepôt', '{"poids":75000,"label":"Entrepôt","name":"entrepôt"}', '100000', '{"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"EXIT":{"x":999.0949096679688,"y":-52.91793823242187,"z":74.95425415039063}}', '1', 'loszetas', '{"item":[],"accounts":{"cash":0,"dirtycash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":{"Boss":true,"Recrue":true,"Gérant":true,"Membre":true}}', '0'),
	(188, 'villa_hopes', '{"poids":3500,"label":"Villa Hopes","name":"villa_hopes"}', '5000000', '{"ENTER":{"x":-785.1300048828125,"y":315.7900085449219,"z":187.91000366210938},"COFFRE":{"x":-795.7161254882813,"y":326.81500244140627,"z":186.31289672851563},"EXIT":{"x":-1873.2470703125,"y":201.8549346923828,"z":84.29449462890625}}', '1', 'license:c855ffac725e206052a5a416e1ef1f764e5ae735', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(189, 'entrepôt_2', '{"poids":200000,"label":"Entrepôt 2","name":"entrepôt_2"}', '800000', '{"ENTER":{"x":1026.505615234375,"y":-3099.83203125,"z":-38.99980163574219},"COFFRE":{"x":999.58251953125,"y":-3096.294677734375,"z":-39.99980163574219},"EXIT":{"x":92.79711151123047,"y":188.31155395507813,"z":105.26549530029297}}', '1', 'license:be5d7be853b4150fe0feb87f9c2ccadb208cc79c', '{"item":{"maltetraiter":{"count":2,"name":"maltetraiter","label":"Bière"},"acierrecolte":{"count":1,"name":"acierrecolte","label":"Acier"},"ammoniac":{"count":1,"name":"ammoniac","label":"Ammoniac"},"jewels":{"count":1435,"name":"jewels","label":"Bijou"},"weedtraitement":{"count":7,"name":"weedtraitement","label":"Pochon de Weed"},"frites":{"count":20,"name":"frites","label":"Frites"},"cagoule":{"count":8,"name":"cagoule","label":"Cagoule"},"pochoncodeine":{"count":7,"name":"pochoncodeine","label":"Pochon de Codéine"},"opiumrecolte":{"count":1,"name":"opiumrecolte","label":"Opium"},"burger":{"count":40,"name":"burger","label":"Burger"},"Mongolienne":{"count":2,"name":"Mongolienne","label":"Mongolienne"}},"accounts":{"dirtycash":0,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(190, 'maison_hill', '{"poids":2500,"label":"Maison Hill","name":"maison_hill"}', '60000', '{"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":56.59564590454101,"y":-1922.75390625,"z":21.91137504577636}}', '1', 'license:11032baab5b33e15f7a3484f97d6e34f051800d3', '{"item":{"chargeur":{"count":5,"name":"chargeur","label":"Chargeur"},"weedtraitement":{"label":"Pochon de Weed","name":"weedtraitement","count":673},"coyote":{"label":"833790671022194718","name":"coyote","count":1},"weedrecolte":{"label":"Weed","name":"weedrecolte","count":156}},"weapons":{"808376":{"label":"Smg","name":"WEAPON_SMG","ammo":0},"798858":{"label":"Poing américain","name":"WEAPON_KNUCKLE","ammo":0}},"accounts":{"cash":0,"dirtycash":266000}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(191, 'entrepôt_3', '{"poids":75000,"label":"Entrepôt 3","name":"entrepôt_3"}', '100000', '{"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"EXIT":{"x":70.96180725097656,"y":187.93165588378907,"z":104.93624877929688},"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109}}', '1', 'license:ddee917113328737a68e92c32136da8f8d8e1680', '{"item":{"medikit":{"count":4,"name":"medikit","label":"Medikit"},"methrecolte":{"count":52,"name":"methrecolte","label":"Méthamphétamine"},"cocafrais":{"count":37,"name":"cocafrais","label":"Coca Frais"},"ammoniac":{"count":30,"name":"ammoniac","label":"Ammoniac"},"jewels":{"count":72,"name":"jewels","label":"Bijou"},"icetea":{"count":133,"name":"icetea","label":"Ice Tea"},"icerecolte":{"count":313,"name":"icerecolte","label":"Ice"},"phone":{"count":1,"name":"phone","label":"Téléphone"},"codeine":{"count":34,"name":"codeine","label":"Codéine"},"frites":{"count":18,"name":"frites","label":"Frites"},"opiumrecolte":{"count":3,"name":"opiumrecolte","label":"Opium"},"cocainerecolte":{"count":42,"name":"cocainerecolte","label":"Cocaïne"},"tequila":{"count":3,"name":"tequila","label":"Tequila"},"burger":{"count":199,"name":"burger","label":"Burger"},"Mongolienne":{"count":4,"name":"Mongolienne","label":"Mongolienne"}},"accounts":{"dirtycash":0,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[{"identifier":"license:a2b7f7bfbc58aedcd8d7d20ea66044dde818dec7","name":"sebastien | truite-cosmique"}],"GradesAlloweds":[]}', '0'),
	(192, 'petite_villa_', '{"name":"petite_villa_","poids":3000,"label":"Petite villa "}', '1300000', '{"EXIT":{"x":-476.7166442871094,"y":647.4461669921875,"z":144.38682556152345},"COFFRE":{"x":-623.0919189453125,"y":54.69309997558594,"z":96.59940338134766},"ENTER":{"x":-612.1599731445313,"y":59.06000137329101,"z":97.19999694824219}}', '1', 'license:cd2e537271dd4b83353821c6f9b8c56e442c3359', '{"item":{},"weapons":{},"accounts":{"dirtycash":0,"cash":0}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(193, 'entrepot_grand_oneil', '{"label":"Entrepot grand oneil","poids":200000,"name":"entrepot_grand_oneil"}', '800000', '{"ENTER":{"x":1026.505615234375,"y":-3099.83203125,"z":-38.99980163574219},"EXIT":{"x":2434.572509765625,"y":5011.3740234375,"z":46.82772445678711},"COFFRE":{"x":999.58251953125,"y":-3096.294677734375,"z":-39.99980163574219}}', '1', 'license:5ea438260748a9db0c8122dfa4a09bc80537ee77', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":{"642075":{"name":"WEAPON_COMPACTRIFLE","ammo":200,"label":"Fusil compact"},"590500":{"name":"WEAPON_COMPACTRIFLE","ammo":200,"label":"Fusil compact"},"702387":{"name":"WEAPON_COMPACTRIFLE","ammo":200,"label":"Fusil compact"},"337276":{"name":"WEAPON_COMPACTRIFLE","ammo":200,"label":"Fusil compact"}}}', '{"PeopleAlloweds":[{"identifier":"license:61ca0a2c8796295f10db04933ba6493137a4f5f2","name":"Eaziiio"},{"identifier":"license:a89dcac0be6253bfda5acb050ca6d884fa11cc48","name":"SALOPE"},{"identifier":"license:a89dcac0be6253bfda5acb050ca6d884fa11cc48","name":"SALOPE"},{"identifier":"license:a89dcac0be6253bfda5acb050ca6d884fa11cc48","name":"SALOPE"},{"identifier":"license:a89dcac0be6253bfda5acb050ca6d884fa11cc48","name":"SALOPE"},{"identifier":"license:a89dcac0be6253bfda5acb050ca6d884fa11cc48","name":"SALOPE"},{"identifier":"license:a89dcac0be6253bfda5acb050ca6d884fa11cc48","name":"SALOPE"},{"identifier":"license:a89dcac0be6253bfda5acb050ca6d884fa11cc48","name":"SALOPE"},{"identifier":"license:a89dcac0be6253bfda5acb050ca6d884fa11cc48","name":"SALOPE"},{"identifier":"license:a89dcac0be6253bfda5acb050ca6d884fa11cc48","name":"SALOPE"}],"GradesAlloweds":[]}', '0'),
	(194, 'petite_villa', '{"label":"Petite Villa","name":"petite_villa","poids":2500}', '60000', '{"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"EXIT":{"x":250.1377410888672,"y":-1730.723388671875,"z":29.66891098022461}}', '1', 'license:90e7d6337e8b4cc65aa03a78ac543076368afc0d', '{"item":{"acierrecolte":{"count":50,"name":"acierrecolte","label":"Acier"}},"accounts":{"dirtycash":11817,"cash":7975},"weapons":{"735310":{"label":"Queue de billard","name":"WEAPON_POOLCUE","ammo":0},"102550":{"label":"Pied de biche","name":"WEAPON_CROWBAR","ammo":0},"932113":{"label":"Poing américain","name":"WEAPON_KNUCKLE","ammo":0}}}', '{"PeopleAlloweds":[{"identifier":"license:8888d8ef444308b5bace74a5eb00b3293ead485b","name":"Badger 1.0"}],"GradesAlloweds":[]}', '0'),
	(195, 'entrepôt_vinewood', '{"name":"entrepôt_vinewood","poids":75000,"label":"Entrepôt Vinewood"}', '100000', '{"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"EXIT":{"x":-42.53231430053711,"y":-61.95937347412109,"z":59.61554336547851}}', '1', 'license:8f7c47d2b9be0a6d44eec2e2d8850aeb4fbf231e', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(196, 'petite_maison_great_chaperall_1', '{"name":"petite_maison_great_chaperall_1","poids":2500,"label":"Petite maison Great Chaperall 1"}', '60000', '{"EXIT":{"x":-264.05364990234377,"y":2196.48974609375,"z":130.39883422851563},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672}}', '1', 'license:9a799f9773c9e7b17b0116dc39584468beb8d106', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[{"identifier":"license:750655e71ad70cacffcd094fe6c0ecf43ffab7d2","name":"moham"}],"GradesAlloweds":[]}', '0'),
	(197, 'entrepôt_1', '{"name":"entrepôt_1","poids":75000,"label":"Entrepôt 1"}', '100000', '{"EXIT":{"x":1480.7236328125,"y":-1915.373291015625,"z":71.46829223632813},"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164}}', '1', 'license:a89dcac0be6253bfda5acb050ca6d884fa11cc48', '{"item":[],"accounts":{"dirtycash":0,"cash":650000},"weapons":[]}', '{"PeopleAlloweds":[{"identifier":"license:61ca0a2c8796295f10db04933ba6493137a4f5f2","name":"Eaziiio"},{"identifier":"license:5ea438260748a9db0c8122dfa4a09bc80537ee77","name":"Rypzn_"}],"GradesAlloweds":[]}', '0'),
	(198, 'petite_maison_casino_1', '{"name":"petite_maison_casino_1","poids":2500,"label":"Petite Maison Casino 1"}', '60000', '{"EXIT":{"x":960.283935546875,"y":-669.7166748046875,"z":58.45092010498047},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672}}', '1', 'license:fad05443d5fb380958255e55d5b51dc0455e07ce', '{"item":[],"accounts":{"dirtycash":801476,"cash":0},"weapons":{"385970":{"label":"Pistolet lourd","name":"WEAPON_HEAVYPISTOL","ammo":0},"778566":{"label":"Pistolet calibre 50","name":"WEAPON_PISTOL50","ammo":242},"728230":{"label":"Pistolet lourd","name":"WEAPON_HEAVYPISTOL","ammo":0},"776333":{"label":"Pistolet sns","name":"WEAPON_SNSPISTOL","ammo":0},"135311":{"label":"Smg","name":"WEAPON_SMG","ammo":250},"538323":{"label":"Revolver","name":"WEAPON_REVOLVER","ammo":0}}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(199, 'entrepôt_vinewood_1', '{"name":"entrepôt_vinewood_1","poids":75000,"label":"Entrepôt Vinewood 1"}', '100000', '{"EXIT":{"x":40.36514282226562,"y":-94.91712188720703,"z":56.86159133911133},"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164}}', '1', 'license:3d4d02ffb13182dd12d76ba3dd07d09d662bda78', '{"item":{"aluminium":{"count":5,"name":"aluminium","label":"Aluminium"},"opiumtraitement":{"count":3,"name":"opiumtraitement","label":"Pochon d\'opium"},"weedtraitement":{"count":10,"name":"weedtraitement","label":"Pochon de Weed"}},"accounts":{"dirtycash":93,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(200, 'entrepôt_vinewood_2', '{"name":"entrepôt_vinewood_2","poids":75000,"label":"Entrepôt Vinewood 2"}', '100000', '{"EXIT":{"x":44.04172134399414,"y":-106.72068786621094,"z":56.07431030273437},"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164}}', '1', 'license:505f941ac7c169daa8dd6dd7d2fc0fd4dea24249', '{"item":{"opiumtraitement":{"count":7,"name":"opiumtraitement","label":"Pochon d\'opium"},"clip":{"count":1,"name":"clip","label":"Chargeur"},"cocainetraitement":{"count":18,"name":"cocainetraitement","label":"Pochon de Cocaïne"},"Mongolienne":{"count":4,"name":"Mongolienne","label":"Mongolienne"},"jewels":{"count":25,"name":"jewels","label":"Bijou"},"methtraitement":{"count":23,"name":"methtraitement","label":"Pochon de Méthamphétamine"},"weedtraitement":{"count":17,"name":"weedtraitement","label":"Pochon de Weed"}},"accounts":{"dirtycash":0,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(201, 'hangar_east_los_santos_1', '{"name":"hangar_east_los_santos_1","poids":75000,"label":"Hangar east los santos 1"}', '100000', '{"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"EXIT":{"x":951.9702758789063,"y":-1059.5849609375,"z":37.06413650512695}}', '1', 'license:05efc5ba7e81e6720633c521bbf82315b3a51945', '{"item":{"heroinerecolte":{"label":"Héroine pure","name":"heroinerecolte","count":3},"chargeur":{"count":13,"name":"chargeur","label":"Chargeur"},"drill":{"count":1,"name":"drill","label":"Perceuse"},"methtraitement":{"label":"Pochon de Méthamphétamine","name":"methtraitement","count":6},"ketaminerecolte":{"count":19,"name":"ketaminerecolte","label":"Ketamine"},"ketaminetraitement":{"label":"Pochon de Kétamine","name":"ketaminetraitement","count":6},"opiumtraitement":{"label":"Pochon d\'opium","name":"opiumtraitement","count":6},"cagoule":{"label":"Cagoule","name":"cagoule","count":2},"whisky":{"count":4,"name":"whisky","label":"Whisky"},"bankcard":{"count":1,"name":"bankcard","label":"Carte d\'accès Banque"},"aluminium":{"label":"Aluminium","name":"aluminium","count":3},"Mongolienne":{"label":"Mongolienne","name":"Mongolienne","count":2}},"accounts":{"cash":0,"dirtycash":0},"weapons":{"533477":{"label":"Revolver","name":"WEAPON_REVOLVER","ammo":0},"555124":{"label":"Pistolet","name":"WEAPON_PISTOL","ammo":0},"563986":{"label":"Pistolet","name":"WEAPON_PISTOL","ammo":0}}}', '{"PeopleAlloweds":[{"identifier":"license:157a2a5b1fc140e19c8e95c754448b1fd144777e","name":"giova"},{"identifier":"license:157a2a5b1fc140e19c8e95c754448b1fd144777e","name":"giova"}],"GradesAlloweds":[]}', '0'),
	(202, 'entrepot_o\'neil_2', '{"name":"entrepot_o\'neil_2","poids":100000,"label":"Entrepot O\'Neil 2"}', '500000', '{"ENTER":{"x":1048.5067138671876,"y":-3097.081787109375,"z":-38.99990081787109},"COFFRE":{"x":1070.829345703125,"y":-3098.585205078125,"z":-39.99990081787109},"EXIT":{"x":2335.87744140625,"y":4859.57861328125,"z":41.80826187133789}}', '1', 'Cali', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":{"Boss":true,"Recrue":true,"Gérant":true,"Membre":true}}', '0'),
	(203, 'entrepôt_sud_los_santos', '{"label":"Entrepôt SUD Los Santos","poids":75000,"name":"entrepôt_sud_los_santos"}', '100000', '{"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"EXIT":{"x":244.5667266845703,"y":-1999.6531982421876,"z":20.08787727355957}}', '1', 'license:3d4d02ffb13182dd12d76ba3dd07d09d662bda78', '{"item":{"medikit":{"count":55,"name":"medikit","label":"Medikit"},"cafemoulu":{"count":12,"name":"cafemoulu","label":"Café Moulu"},"ammoniac":{"count":68,"name":"ammoniac","label":"Ammoniac"},"ecstasy":{"count":24,"name":"ecstasy","label":"Ecstasy"},"weedtraitement":{"count":2,"name":"weedtraitement","label":"Pochon de Weed"},"ketaminetraitement":{"count":4,"name":"ketaminetraitement","label":"Pochon de Kétamine"},"opiumrecolte":{"count":29,"name":"opiumrecolte","label":"Opium"},"hotdog":{"count":45,"name":"hotdog","label":"Hot Dog"},"Mango":{"count":20,"name":"Mango","label":"Mango"},"acierrecolte":{"count":119,"name":"acierrecolte","label":"Acier"},"heroinerecolte":{"count":1,"name":"heroinerecolte","label":"Héroine pure"},"jewels":{"count":754,"name":"jewels","label":"Bijou"},"chargeur":{"count":22,"name":"chargeur","label":"Chargeur"},"cocainetraitement":{"count":200,"name":"cocainetraitement","label":"Pochon de Cocaïne"},"lsd":{"count":1,"name":"lsd","label":"LSD"},"cocainerecolte":{"count":1,"name":"cocainerecolte","label":"Cocaïne"},"pochonCBD":{"count":2,"name":"pochonCBD","label":"Pochon de CBD"},"pochonice":{"count":1,"name":"pochonice","label":"pochon d\'ice"},"radiateur":{"count":10,"name":"radiateur","label":"Radiateur"}},"accounts":{"dirtycash":0,"cash":0},"weapons":{"906110":{"label":"Mini smg","name":"WEAPON_MINISMG","ammo":0},"312066":{"label":"Pistolet sns","name":"WEAPON_SNSPISTOL","ammo":250}}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(204, 'petit_entrepöt_vinewood', '{"label":"Petit entrepöt Vinewood","poids":75000,"name":"petit_entrepöt_vinewood"}', '100000', '{"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"EXIT":{"x":-170.125732421875,"y":-28.27165603637695,"z":52.25209808349609}}', '1', 'license:86827dee90f49105d505615595c5c6b523f43f22', '{"weapons":[],"item":[],"accounts":{"cash":0,"dirtycash":0}}', '{"PeopleAlloweds":[{"name":"Amzepekk","identifier":"license:e0f33d9aa8c1a1cd7d790f358d5bad7f8c9b7de2"},{"name":"ILIES SARSSARI","identifier":"license:c0a68b8e3d5c72b8e5a0702e35cbbc8f7badd317"}],"GradesAlloweds":[]}', '0'),
	(205, 'entrepot_paleto_1', '{"label":"Entrepot Paleto 1","poids":75000,"name":"entrepot_paleto_1"}', '100000', '{"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"EXIT":{"x":1417.095947265625,"y":6339.17333984375,"z":24.39838218688965}}', '0', NULL, '{"weapons":[],"accounts":{"dirtycash":0,"cash":0},"item":[]}', '{"PeopleAlloweds":[{"identifier":"license:91f203df56b10bb964ef4e87882c28a2602d6afb","name":"Hernandez Walker"}],"GradesAlloweds":[]}', '0'),
	(206, 'maison_gsballas', '{"label":"Maison GsBallas","poids":2500,"name":"maison_gsballas"}', '60000', '{"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"EXIT":{"x":38.97134399414062,"y":-1911.4820556640626,"z":21.95354080200195}}', '1', 'license:e58f7f91b1ed8c2b7905bf34cbf6c50f53207b0d', '{"item":{"cocainetraitement":{"count":39,"name":"cocainetraitement","label":"Pochon de Cocaïne"},"opiumtraitement":{"count":1,"name":"opiumtraitement","label":"Pochon d\'opium"},"opiumrecolte":{"count":10,"name":"opiumrecolte","label":"Opium"}},"accounts":{"dirtycash":254658,"cash":0},"weapons":{"232477":{"label":"Pistolet sns","name":"WEAPON_SNSPISTOL","ammo":250},"852770":{"label":"Pistolet mitrailleur","name":"WEAPON_MACHINEPISTOL","ammo":250}}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(207, 'petite_maison_forum_drive_6_', '{"name":"petite_maison_forum_drive_6_","label":"Petite maison forum drive 6 ","poids":2500}', '60000', '{"EXIT":{"x":-142.01522827148438,"y":-1693.35107421875,"z":36.16724014282226},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672}}', '1', 'families', '{"item":{},"accounts":{"cash":0,"dirtycash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":{"Bras Droit":true,"Patron":true,"Associé":true,"Elite":true,"Soldat":true,"Lieutenant":true}}', '0'),
	(208, 'petite_maison_casino_2', '{"poids":2500,"label":"Petite maison casino 2","name":"petite_maison_casino_2"}', '60000', '{"EXIT":{"x":906.626708984375,"y":-490.09088134765627,"z":59.43623733520508},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:1393fb99d6c72cf17a9095b704c871b93c656aab', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(209, 'entrepot_paleto_3', '{"poids":75000,"name":"entrepot_paleto_3","label":"Entrepot Paleto 3"}', '100000', '{"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"EXIT":{"x":-247.12155151367188,"y":6068.2373046875,"z":32.34454727172851},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164}}', '1', 'license:ba90402080c34636e0da37a02a5e1ce07fff9fc8', '{"item":{"ammoniac":{"label":"Ammoniac","name":"ammoniac","count":870}},"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(210, 'petit_entrepôt_paleto_7', '{"label":"Petit entrepôt Paleto 7","poids":75000,"name":"petit_entrepôt_paleto_7"}', '100000', '{"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"EXIT":{"x":-237.69032287597657,"y":6229.00537109375,"z":31.50142097473144}}', '1', 'license:750655e71ad70cacffcd094fe6c0ecf43ffab7d2', '{"accounts":{"cash":0,"dirtycash":0},"item":{},"weapons":{"352049":{"label":"Pistolet lourd","ammo":250,"name":"WEAPON_HEAVYPISTOL"},"164203":{"label":"Revolver","ammo":250,"name":"WEAPON_REVOLVER"},"472167":{"label":"Smg","ammo":250,"name":"WEAPON_SMG"},"956168":{"label":"Micro smg","ammo":250,"name":"WEAPON_MICROSMG"},"410965":{"label":"Revolver","ammo":250,"name":"WEAPON_REVOLVER"},"970407":{"label":"Pistolet lourd","ammo":250,"name":"WEAPON_HEAVYPISTOL"},"368651":{"label":"Pistolet calibre 50","ammo":250,"name":"WEAPON_PISTOL50"},"507340":{"label":"Revolver","ammo":250,"name":"WEAPON_REVOLVER"},"125069":{"label":"Pistolet calibre 50","ammo":250,"name":"WEAPON_PISTOL50"},"913615":{"label":"Pistolet calibre 50","ammo":250,"name":"WEAPON_PISTOL50"},"771125":{"label":"Pistolet lourd","ammo":250,"name":"WEAPON_HEAVYPISTOL"},"915217":{"label":"Revolver","ammo":250,"name":"WEAPON_REVOLVER"},"200530":{"label":"Pistolet lourd","ammo":250,"name":"WEAPON_HEAVYPISTOL"},"398547":{"label":"Pistolet lourd","ammo":250,"name":"WEAPON_HEAVYPISTOL"},"187262":{"label":"Pistolet lourd","ammo":250,"name":"WEAPON_HEAVYPISTOL"},"201685":{"label":"Micro smg","ammo":250,"name":"WEAPON_MICROSMG"},"155510":{"label":"Revolver","ammo":250,"name":"WEAPON_REVOLVER"},"302807":{"label":"Smg","ammo":250,"name":"WEAPON_SMG"},"39672":{"label":"Pistolet calibre 50","ammo":250,"name":"WEAPON_PISTOL50"},"469177":{"label":"Micro smg","ammo":250,"name":"WEAPON_MICROSMG"},"375834":{"label":"Revolver","ammo":250,"name":"WEAPON_REVOLVER"},"825303":{"label":"Pistolet lourd","ammo":250,"name":"WEAPON_HEAVYPISTOL"},"422684":{"label":"Pistolet lourd","ammo":250,"name":"WEAPON_HEAVYPISTOL"},"435453":{"label":"Micro smg","ammo":250,"name":"WEAPON_MICROSMG"},"937374":{"label":"Pistolet lourd","ammo":250,"name":"WEAPON_HEAVYPISTOL"},"569735":{"label":"Micro smg","ammo":250,"name":"WEAPON_MICROSMG"}}}', '{"GradesAlloweds":[],"PeopleAlloweds":[{"name":"azime","identifier":"license:9a799f9773c9e7b17b0116dc39584468beb8d106"},{"identifier":"license:c0a68b8e3d5c72b8e5a0702e35cbbc8f7badd317","name":"ILIES SARSSARI"},{"identifier":"license:98a34f7b5cc494b24c2112739654ca7d82fa1bee","name":"JL gab"},{"identifier":"license:8644c914da5f1c43490dba33e1af482ce75aed18","name":"furiotom6"}]}', '0'),
	(211, 'maison_forum_drive_2', '{"name":"maison_forum_drive_2","label":"Maison Forum drive 2","poids":2500}', '60000', '{"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":-142.068603515625,"y":-1693.1712646484376,"z":32.87252044677734}}', '1', 'license:86827dee90f49105d505615595c5c6b523f43f22', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(212, 'maison_forum_drive_3', '{"name":"maison_forum_drive_3","label":"Maison forum drive 3","poids":2500}', '60000', '{"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":-157.9113311767578,"y":-1679.848876953125,"z":33.83283233642578}}', '1', 'license:4dd73628b4a1f615689b8a3623661ca68ebeb777', '{"accounts":{"dirtycash":371173,"cash":0},"weapons":[],"item":[]}', '{"GradesAlloweds":[],"PeopleAlloweds":[{"name":"bree","identifier":"license:fe025ffbdc88f2f63f342842b4d3a4b11e6e474d"}]}', '0'),
	(213, 'maison_forum_drive_4', '{"name":"maison_forum_drive_4","label":"Maison forum drive 4","poids":2500}', '60000', '{"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":-147.0983428955078,"y":-1688.7130126953126,"z":36.166748046875}}', '1', 'license:4674d08924a6f359d4003b2492f870afc1bf90ec', '{"item":{"phone":{"count":4,"name":"phone","label":"Téléphone"},"opiumtraitement":{"count":11,"name":"opiumtraitement","label":"Pochon d\'opium"},"police_key":{"count":28,"name":"police_key","label":"Clefs de Menottes LSPD"},"police_cuff":{"count":29,"name":"police_cuff","label":"Menottes LSPD"},"jewels":{"count":233,"name":"jewels","label":"Bijou"},"ecstasy":{"count":2,"name":"ecstasy","label":"Ecstasy"},"radio":{"count":2,"name":"radio","label":"Radio"}},"accounts":{"dirtycash":275758,"cash":0},"weapons":{"613311":{"label":"Pistolet","name":"WEAPON_PISTOL","ammo":0},"354171":{"label":"Smg","name":"WEAPON_SMG","ammo":0},"474841":{"label":"Tazer","name":"WEAPON_STUNGUN","ammo":250},"935473":{"label":"Pistolet de combat","name":"WEAPON_COMBATPISTOL","ammo":0},"725751":{"label":"Fusil avancé","name":"WEAPON_ADVANCEDRIFLE","ammo":0},"943513":{"label":"Fusil compact","name":"WEAPON_COMPACTRIFLE","ammo":240},"759720":{"label":"Pistolet lourd","name":"WEAPON_HEAVYPISTOL","ammo":0},"229798":{"label":"Pistolet calibre 50","name":"WEAPON_PISTOL50","ammo":0},"885045":{"label":"Pistolet de combat","name":"WEAPON_COMBATPISTOL","ammo":233},"412874":{"label":"Pistolet calibre 50","name":"WEAPON_PISTOL50","ammo":0},"10961":{"label":"Smg","name":"WEAPON_SMG","ammo":250},"637405":{"label":"Pistolet de combat","name":"WEAPON_COMBATPISTOL","ammo":0}}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(214, 'maison_forum_drive_6', '{"name":"maison_forum_drive_6","label":"Maison forum drive 6","poids":2500}', '60000', '{"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":-148.36988830566407,"y":-1688.16748046875,"z":32.87252807617187}}', '1', 'license:86827dee90f49105d505615595c5c6b523f43f22', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(215, 'entrepot_forum_drive_1', '{"name":"entrepot_forum_drive_1","label":"Entrepot forum drive 1","poids":75000}', '100000', '{"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"EXIT":{"x":-197.9884796142578,"y":-1699.6185302734376,"z":33.47401809692383}}', '1', 'families', '{"accounts":{"cash":0,"dirtycash":0},"weapons":{},"item":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":{"Elite":true,"Patron":true,"Lieutenant":true,"Soldat":true,"Associé":true,"Bras Droit":true}}', '0'),
	(216, 'petite_maison_casino_5', '{"name":"petite_maison_casino_5","label":"Petite maison casino 5","poids":2500}', '60000', '{"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":943.9175415039063,"y":-463.6856689453125,"z":61.39577484130859}}', '1', 'license:cfb7b86a36c2368fead48a310295cf1004a9079c', '{"item":{"chargeur":{"count":7,"name":"chargeur","label":"Chargeur"}},"accounts":{"dirtycash":0,"cash":0},"weapons":{"17715":{"label":"Micro smg","name":"WEAPON_MICROSMG","ammo":243}}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(217, 'petit_entrepôt_barillo_3', '{"poids":75000,"name":"petit_entrepôt_barillo_3","label":"Petit entrepôt Barillo 3"}', '100000', '{"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"EXIT":{"x":415.03271484375,"y":-2052.445068359375,"z":22.20562362670898},"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109}}', '1', 'license:3d4d02ffb13182dd12d76ba3dd07d09d662bda78', '{"item":[],"accounts":{"dirtycash":15000,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(218, 'petite_maison_barillo_3', '{"poids":2500,"name":"petite_maison_barillo_3","label":"Petite maison barillo 3"}', '60000', '{"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":279.8193359375,"y":-1993.630859375,"z":20.80378150939941},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:3d4d02ffb13182dd12d76ba3dd07d09d662bda78', '{"item":{"ecstasy":{"count":4,"name":"ecstasy","label":"Ecstasy"},"caoutchou":{"count":6,"name":"caoutchou","label":"Caoutchou"}},"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(219, 'petite_maison_casino_6', '{"name":"petite_maison_casino_6","poids":2500,"label":"Petite maison Casino 6"}', '60000', '{"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":844.1627807617188,"y":-563.1532592773438,"z":57.83550643920898},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:1393fb99d6c72cf17a9095b704c871b93c656aab', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(220, 'petite_maison_sandy_shores_4', '{"name":"petite_maison_sandy_shores_4","poids":2500,"label":"Petite maison sandy shores 4"}', '60000', '{"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":1400.9189453125,"y":2169.947021484375,"z":97.86479187011719},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:c22bafbf85696cdc21a13742d0b4bb630623a26f', '{"item":{"phone":{"name":"phone","label":"Téléphone","count":1},"alcoolbrut":{"name":"alcoolbrut","label":"Alcool Brut","count":4}},"weapons":[],"accounts":{"cash":98,"dirtycash":27692}}', '{"PeopleAlloweds":[{"name":"nathan","identifier":"license:2872c3e86270c3516660ddf2b82f2f0c12384beb"}],"GradesAlloweds":[]}', '0'),
	(221, 'sous_terrain', '{"name":"sous_terrain","poids":200000,"label":"Sous terrain"}', '800000', '{"EXIT":{"x":190.6449737548828,"y":-607.5230102539063,"z":29.57145500183105},"COFFRE":{"x":999.58251953125,"y":-3096.294677734375,"z":-39.99980163574219},"ENTER":{"x":1026.505615234375,"y":-3099.83203125,"z":-38.99980163574219}}', '1', 'license:86827dee90f49105d505615595c5c6b523f43f22', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(222, 'petite_maison_casino_8', '{"label":"Petite maison casino 8","poids":2500,"name":"petite_maison_casino_8"}', '60000', '{"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"EXIT":{"x":886.7886352539063,"y":-608.138916015625,"z":58.44597625732422},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672}}', '1', 'license:450830446b9e5569be368ff252929cabe27096a3', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(223, 'petite_villa_hollywood_2', '{"label":"Petite villa hollywood 2","poids":3000,"name":"petite_villa_hollywood_2"}', '1300000', '{"ENTER":{"x":-612.1599731445313,"y":59.06000137329101,"z":97.19999694824219},"EXIT":{"x":-232.65065002441407,"y":588.131103515625,"z":190.53627014160157},"COFFRE":{"x":-623.0919189453125,"y":54.69309997558594,"z":96.59940338134766}}', '1', 'license:51ac2d81b3e6738d365b9c91cfb931c4f4235495', '{"item":[],"weapons":[],"accounts":{"dirtycash":0,"cash":0}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(224, 'entrepôt_madrazo', '{"name":"entrepôt_madrazo","poids":75000,"label":"Entrepôt Madrazo"}', '100000', '{"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"EXIT":{"x":1486.36474609375,"y":1131.271728515625,"z":114.33670806884766}}', '1', 'Madrazo', '{"accounts":{"cash":0,"dirtycash":0},"weapons":{"341513":{"label":"Pied de biche","ammo":0,"name":"WEAPON_CROWBAR"}},"item":{"cocainerecolte":{"count":107,"label":"Cocaïne","name":"cocainerecolte"},"hotdog":{"count":1,"label":"Hot Dog","name":"hotdog"},"medikit":{"count":169,"label":"Medikit","name":"medikit"},"chargeur":{"count":166,"label":"Chargeur","name":"chargeur"},"cocainetraitement":{"count":3,"label":"Pochon de Cocaïne","name":"cocainetraitement"},"jewels":{"count":155,"label":"Bijou","name":"jewels"}}}', '{"GradesAlloweds":[],"PeopleAlloweds":[]}', '0'),
	(225, 'petite_maison_forum_drive_9', '{"poids":2500,"label":"Petite maison forum drive 9","name":"petite_maison_forum_drive_9"}', '60000', '{"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":-174.86044311523438,"y":-1528.966064453125,"z":37.5350227355957}}', '1', 'ambulance', '{"accounts":{"dirtycash":0,"cash":0},"weapons":[],"item":[]}', '{"GradesAlloweds":{"Medecin":true,"Directeur":true,"Médecin-Chef":true,"Ambulancier":true},"PeopleAlloweds":[]}', '0'),
	(226, 'entrepot_barillo_2', '{"poids":75000,"label":"Entrepot barillo 2","name":"entrepot_barillo_2"}', '100000', '{"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"EXIT":{"x":396.42559814453127,"y":-1935.4251708984376,"z":24.57419776916504}}', '1', 'license:644f3a8a33c02c0346dab6b24a15edc79e45277e', '{"item":[],"accounts":{"cash":0,"dirtycash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(227, 'petite_maison_autoroute_est_1', '{"poids":2500,"label":"Petite maison autoroute est 1","name":"petite_maison_autoroute_est_1"}', '60000', '{"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":-2997.496337890625,"y":722.9873657226563,"z":28.49690246582031}}', '1', 'license:ec84baa2be53d56627f363a55aec286ad07ec47b', '{"item":[],"accounts":{"dirtycash":982,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(228, 'maison_f4l', '{"name":"maison_f4l","poids":2500,"label":"Maison F4L"}', '60000', '{"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":-120.14147186279297,"y":-1574.7218017578126,"z":34.17657852172851},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:86827dee90f49105d505615595c5c6b523f43f22', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(229, 'entrepot_aku_f4l', '{"name":"entrepot_aku_f4l","poids":200000,"label":"Entrepot Aku F4L"}', '800000', '{"COFFRE":{"x":999.58251953125,"y":-3096.294677734375,"z":-39.99980163574219},"EXIT":{"x":887.3775634765625,"y":-953.8353881835938,"z":39.21319198608398},"ENTER":{"x":1026.505615234375,"y":-3099.83203125,"z":-38.99980163574219}}', '1', 'license:49c11f4cd12047d44334bf63413292613478e9e9', '{"accounts":{"cash":0,"dirtycash":0},"weapons":{"410197":{"ammo":250,"name":"WEAPON_SMG","label":"Smg"},"826213":{"ammo":250,"name":"WEAPON_MACHINEPISTOL","label":"Pistolet mitrailleur"},"877571":{"ammo":250,"name":"WEAPON_COMPACTRIFLE","label":"Fusil compact"}},"item":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(230, 'motel_bmf_1', '{"name":"motel_bmf_1","poids":1000,"label":"Motel BMF 1"}', '60000', '{"EXIT":{"x":312.91815185546877,"y":-218.8732147216797,"z":54.22177505493164},"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0},"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711}}', '1', 'BMF', '{"weapons":{},"item":{},"accounts":{"cash":0,"dirtycash":0}}', '{"PeopleAlloweds":[],"GradesAlloweds":{"Boss":true,"Membre":true,"Recrue":true,"Gérant":true}}', '0'),
	(231, 'motel_bmf_2', '{"name":"motel_bmf_2","poids":1000,"label":"Motel BMF 2"}', '60000', '{"EXIT":{"x":310.8054504394531,"y":-218.06683349609376,"z":54.22177505493164},"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0},"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711}}', '1', 'license:af7d6fe360866a28a43fca0554d3d253bad5db9a', '{"item":[],"accounts":{"cash":0,"dirtycash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(232, 'motel_bmf_entrepot', '{"name":"motel_bmf_entrepot","poids":200000,"label":"Motel BMF Entrepot"}', '800000', '{"COFFRE":{"x":999.58251953125,"y":-3096.294677734375,"z":-39.99980163574219},"EXIT":{"x":321.3956298828125,"y":-196.96739196777345,"z":54.2264404296875},"ENTER":{"x":1026.505615234375,"y":-3099.83203125,"z":-38.99980163574219}}', '1', 'license:dc4e6990af26175a7c7f9c62546d58697b7db86a', '{"item":{"chargeur":{"count":18,"name":"chargeur","label":"Chargeur"}},"accounts":{"dirtycash":0,"cash":0},"weapons":{}}', '{"PeopleAlloweds":[{"identifier":"license:4667bd0430d0f8ac2b3c4f52be08939b8b512776","name":"Lasernexus / Alexandro"}],"GradesAlloweds":[]}', '0'),
	(233, 'motel_bmf_21', '{"name":"motel_bmf_21","poids":1000,"label":"Motel BMF 21"}', '60000', '{"EXIT":{"x":329.2394714355469,"y":-225.14503479003907,"z":54.22176742553711},"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0},"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711}}', '1', 'license:6ce29d000d8e69c4347333e066b660eb02a318fa', '{"item":{"acierrecolte":{"count":1,"name":"acierrecolte","label":"Acier"}},"accounts":{"dirtycash":0,"cash":0},"weapons":{"707877":{"ammo":250,"name":"WEAPON_REVOLVER","label":"Revolver"}}}', '{"GradesAlloweds":[],"PeopleAlloweds":[]}', '0'),
	(234, 'motel_bmf_23', '{"name":"motel_bmf_23","poids":1000,"label":"Motel BMF 23"}', '60000', '{"EXIT":{"x":335.0034484863281,"y":-227.34495544433595,"z":54.22176742553711},"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0},"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711}}', '1', 'license:86827dee90f49105d505615595c5c6b523f43f22', '{"item":[],"weapons":[],"accounts":{"cash":0,"dirtycash":0}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(235, 'motel_bmf_25', '{"name":"motel_bmf_25","poids":1000,"label":"Motel BMF 25"}', '60000', '{"EXIT":{"x":339.1011047363281,"y":-219.67477416992188,"z":54.22176742553711},"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0},"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711}}', '1', 'rodriguez', '{"item":{},"accounts":{"cash":0,"dirtycash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":{"Gérant":true,"Recrue":true,"Membre":true,"Boss":true}}', '0'),
	(236, 'motel_bmf_27_', '{"name":"motel_bmf_27_","poids":1000,"label":"Motel BMF 27 "}', '60000', '{"EXIT":{"x":342.9477844238281,"y":-209.68234252929688,"z":54.2218017578125},"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0},"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711}}', '1', 'license:24fea42e37205cbf2d9b0519faf2baff98665ef6', '{"weapons":{},"item":{},"accounts":{"cash":11800,"dirtycash":0}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(237, 'villa_vinewood_hills', '{"name":"villa_vinewood_hills","label":"Villa Vinewood Hills","poids":4000}', '3500000', '{"COFFRE":{"x":-1456.83740234375,"y":-531.0899047851563,"z":55.9369010925293},"EXIT":{"x":-1277.9796142578126,"y":497.0139465332031,"z":97.89039611816406},"ENTER":{"x":-1459.1700439453126,"y":-520.5800170898438,"z":54.92900085449219}}', '1', 'license:95e874f91c2327a21820c565cb0bb995ee26a66c', '{"item":{"traitementheroine":{"count":2,"name":"traitementheroine","label":"Pochon d\'héroine"},"ketaminetraitement":{"count":25,"name":"ketaminetraitement","label":"Pochon de Kétamine"},"opiumrecolte":{"count":1,"name":"opiumrecolte","label":"Opium"},"icerecolte":{"count":2,"name":"icerecolte","label":"Ice"},"pochoncodeine":{"count":2,"name":"pochoncodeine","label":"Pochon de Codéine"}},"accounts":{"cash":0,"dirtycash":0},"weapons":{"716172":{"label":"Pistolet lourd","name":"WEAPON_HEAVYPISTOL","ammo":0}}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(238, 'entrepot_madrazo', '{"name":"entrepot_madrazo","poids":75000,"label":"Entrepot Madrazo"}', '100000', '{"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"EXIT":{"x":1443.9481201171876,"y":1132.404052734375,"z":114.33390808105469},"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109}}', '1', 'Madrazo', '{"accounts":{"cash":0,"dirtycash":0},"weapons":{"341513":{"label":"Pied de biche","ammo":0,"name":"WEAPON_CROWBAR"}},"item":{"cocainerecolte":{"count":107,"label":"Cocaïne","name":"cocainerecolte"},"hotdog":{"count":1,"label":"Hot Dog","name":"hotdog"},"medikit":{"count":169,"label":"Medikit","name":"medikit"},"chargeur":{"count":166,"label":"Chargeur","name":"chargeur"},"cocainetraitement":{"count":3,"label":"Pochon de Cocaïne","name":"cocainetraitement"},"jewels":{"count":155,"label":"Bijou","name":"jewels"}}}', '{"GradesAlloweds":[],"PeopleAlloweds":[]}', '0'),
	(239, 'entrepot_madracouille', '{"name":"entrepot_madracouille","poids":75000,"label":"Entrepot Madracouille"}', '100000', '{"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"EXIT":{"x":1450.7596435546876,"y":1145.304443359375,"z":114.33403778076172}}', '1', 'license:b99c74e62f845f53e37cb98017cfbe6bafab2ca4', '{"item":{"jewels":{"name":"jewels","label":"Bijou","count":155},"purplehazerecolte":{"name":"purplehazerecolte","label":"Purple Haze","count":2}},"weapons":[],"accounts":{"cash":32562,"dirtycash":693400}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(240, 'motel_bmf_3', '{"name":"motel_bmf_3","poids":1000,"label":"Motel BMF 3"}', '60000', '{"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711},"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0},"EXIT":{"x":341.0046081542969,"y":-214.79542541503907,"z":54.22178649902344}}', '1', 'license:dbe2862c00d0a9365b13708f424a632a066161d2', '{"accounts":{"dirtycash":1,"cash":0},"weapons":{"981149":{"label":"Micro smg","name":"WEAPON_MICROSMG","ammo":250}},"item":{"burger":{"label":"Burger","name":"burger","count":7},"acierrecolte":{"label":"Acier","name":"acierrecolte","count":10},"drill":{"label":"Perceuse","name":"drill","count":1},"pochoncodeine":{"label":"Pochon de Codéine","name":"pochoncodeine","count":1},"jager":{"label":"Jägermeister","name":"jager","count":9},"medikit":{"label":"Medikit","name":"medikit","count":5},"chargeur":{"label":"Chargeur","name":"chargeur","count":5},"bandage":{"label":"Bandage","name":"bandage","count":16}}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(241, 'motel_bmf_5', '{"name":"motel_bmf_5","poids":1000,"label":"Motel  BMF 5"}', '60000', '{"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711},"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0},"EXIT":{"x":344.59857177734377,"y":-204.92755126953126,"z":58.01924896240234}}', '1', 'license:86827dee90f49105d505615595c5c6b523f43f22', '{"item":[],"weapons":{},"accounts":{"cash":0,"dirtycash":0}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(242, 'entrepot_bmf_motel_2', '{"label":"Entrepot BMF Motel 2","poids":75000,"name":"entrepot_bmf_motel_2"}', '100000', '{"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"EXIT":{"x":332.8183898925781,"y":-180.65733337402345,"z":58.18899154663086},"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109}}', '1', 'BMF', '{"item":{"chargeur":{"count":215,"name":"chargeur","label":"Chargeur"},"drill":{"count":1,"name":"drill","label":"Perceuse"},"medikit":{"count":18,"name":"medikit","label":"Medikit"}},"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":{"Membre":true,"Recrue":true,"Gérant":true,"Boss":true}}', '0'),
	(243, 'motel_30_bmf', '{"label":"Motel 30 BMF","poids":2500,"name":"motel_30_bmf"}', '60000', '{"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"EXIT":{"x":329.37457275390627,"y":-225.1074676513672,"z":58.01924133300781},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:86827dee90f49105d505615595c5c6b523f43f22', '{"item":{},"weapons":{},"accounts":{"cash":0,"dirtycash":0}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(244, 'mario_entrepot', '{"label":"Mario entrepot","poids":75000,"name":"mario_entrepot"}', '100000', '{"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"EXIT":{"x":1532.086181640625,"y":1728.30078125,"z":109.91765594482422},"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109}}', '1', 'license:df6d4fd9b3d55b02bc0968c67f78aec8a1e8b0dc', '{"accounts":{"cash":0,"dirtycash":1991892},"item":{"medikit":{"count":39,"label":"Medikit","name":"medikit"},"jewels":{"count":291,"label":"Bijou","name":"jewels"}},"weapons":{"12257":{"label":"Mini smg","ammo":250,"name":"WEAPON_MINISMG"},"363604":{"label":"Mini smg","ammo":250,"name":"WEAPON_MINISMG"},"272131":{"label":"Revolver","ammo":249,"name":"WEAPON_REVOLVER"},"41635":{"label":"Pistolet","ammo":25,"name":"WEAPON_PISTOL"},"951034":{"label":"Revolver","ammo":44,"name":"WEAPON_REVOLVER"},"537674":{"label":"Revolver","ammo":250,"name":"WEAPON_REVOLVER"},"247198":{"label":"Pistolet","ammo":25,"name":"WEAPON_PISTOL"},"72492":{"label":"Pistolet","ammo":25,"name":"WEAPON_PISTOL"},"2547":{"label":"Pistolet","ammo":250,"name":"WEAPON_PISTOL"},"384294":{"label":"Revolver","ammo":246,"name":"WEAPON_REVOLVER"},"875202":{"label":"Micro smg","ammo":250,"name":"WEAPON_MICROSMG"},"918591":{"label":"Pistolet","ammo":25,"name":"WEAPON_PISTOL"},"594125":{"label":"Micro smg","ammo":250,"name":"WEAPON_MICROSMG"},"854825":{"label":"Revolver","ammo":250,"name":"WEAPON_REVOLVER"},"809778":{"label":"Pistolet","ammo":25,"name":"WEAPON_PISTOL"},"159726":{"label":"Micro smg","ammo":250,"name":"WEAPON_MICROSMG"},"928778":{"label":"Revolver","ammo":250,"name":"WEAPON_REVOLVER"},"110493":{"label":"Pistolet","ammo":25,"name":"WEAPON_PISTOL"},"320821":{"label":"Micro smg","ammo":250,"name":"WEAPON_MICROSMG"},"526608":{"label":"Revolver","ammo":44,"name":"WEAPON_REVOLVER"},"241588":{"label":"Micro smg","ammo":250,"name":"WEAPON_MICROSMG"},"628172":{"label":"Micro smg","ammo":250,"name":"WEAPON_MICROSMG"},"375289":{"label":"Pistolet","ammo":25,"name":"WEAPON_PISTOL"},"91480":{"label":"Pistolet","ammo":25,"name":"WEAPON_PISTOL"},"58283":{"label":"Pistolet","ammo":25,"name":"WEAPON_PISTOL"},"16055":{"label":"Micro smg","ammo":250,"name":"WEAPON_MICROSMG"}}}', '{"GradesAlloweds":[],"PeopleAlloweds":[]}', '0'),
	(245, 'belle_maison_plage_', '{"label":"Belle Maison Plage ","name":"belle_maison_plage_","poids":2500}', '60000', '{"EXIT":{"x":-1247.0247802734376,"y":-1358.4581298828126,"z":7.82043981552124},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672}}', '1', 'license:a9e9dea313ab2ed331c0d3a6fc53313344157f64', '{"item":{"hotdog":{"count":2,"name":"hotdog","label":"Hot Dog"},"water":{"count":2,"name":"water","label":"Bouteille d\'eau"},"chargeur":{"count":1,"name":"chargeur","label":"Chargeur"},"tissu":{"count":13,"name":"tissu","label":"Tissu"}},"weapons":[],"accounts":{"dirtycash":0,"cash":0}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(246, 'bella', '{"poids":3500,"name":"bella","label":"bella"}', '5000000', '{"COFFRE":{"x":-795.7161254882813,"y":326.81500244140627,"z":186.31289672851563},"ENTER":{"x":-785.1300048828125,"y":315.7900085449219,"z":187.91000366210938},"EXIT":{"x":-1995.2734375,"y":300.9098205566406,"z":91.96466064453125}}', '1', 'license:98a34f7b5cc494b24c2112739654ca7d82fa1bee', '{"accounts":{"cash":0,"dirtycash":0},"weapons":[],"item":[]}', '{"GradesAlloweds":[],"PeopleAlloweds":[{"identifier":"license:c0a68b8e3d5c72b8e5a0702e35cbbc8f7badd317","name":"ILIES SARSSARI"},{"identifier":"license:750655e71ad70cacffcd094fe6c0ecf43ffab7d2","name":"momo"},{"identifier":"license:8644c914da5f1c43490dba33e1af482ce75aed18","name":"furiotom6"}]}', '0'),
	(247, 'testewenbg', '{"label":"testewenbg","name":"testewenbg","poids":2500}', '60000', '{"EXIT":{"x":100.98452758789063,"y":-868.1791381835938,"z":137.95401000976563},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328}}', '1', 'license:61ca0a2c8796295f10db04933ba6493137a4f5f2', '{"item":[],"weapons":[],"accounts":{"cash":0,"dirtycash":0}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(251, 'ap1im1', '{"label":"ap1im1","poids":3000,"name":"ap1im1"}', '1300000', '{"COFFRE":{"y":54.69309997558594,"z":96.59940338134766,"x":-623.0919189453125},"ENTER":{"y":59.06000137329101,"z":97.1999969482422,"x":-612.1599731445313},"EXIT":{"x":-773.5578002929688,"y":311.4858093261719,"z":85.6980972290039}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '1'),
	(252, 'ap2im1', '{"poids":3500,"label":"ap2im1","name":"ap2im1"}', '5000000', '{"COFFRE":{"y":326.8150024414063,"z":186.31289672851566,"x":-795.7161254882813},"ENTER":{"y":315.7900085449219,"z":187.91000366210936,"x":-785.1300048828125},"EXIT":{"x":-773.5578002929688,"y":311.4858093261719,"z":85.6980972290039}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '1'),
	(253, 'ap3im1', '{"name":"ap3im1","label":"ap3im1","poids":4000}', '3500000', '{"COFFRE":{"y":-531.0899047851563,"z":55.9369010925293,"x":-1456.83740234375},"ENTER":{"y":-520.5800170898438,"z":54.92900085449219,"x":-1459.1700439453126},"EXIT":{"x":-773.5578002929688,"y":311.4858093261719,"z":85.6980972290039}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '1'),
	(254, 'ap4im1', '{"name":"ap4im1","poids":3500,"label":"ap4im1"}', '5000000', '{"COFFRE":{"y":326.8150024414063,"z":186.31289672851566,"x":-795.7161254882813},"ENTER":{"y":315.7900085449219,"z":187.91000366210936,"x":-785.1300048828125},"EXIT":{"x":-773.5578002929688,"y":311.4858093261719,"z":85.6980972290039}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '1'),
	(255, 'ap5im1', '{"label":"ap5im1","name":"ap5im1","poids":4000}', '3500000', '{"COFFRE":{"y":-531.0899047851563,"z":55.9369010925293,"x":-1456.83740234375},"ENTER":{"y":-520.5800170898438,"z":54.92900085449219,"x":-1459.1700439453126},"EXIT":{"x":-773.5578002929688,"y":311.4858093261719,"z":85.6980972290039}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '1'),
	(256, 'ap6im1', '{"name":"ap6im1","poids":4000,"label":"ap6im1"}', '3500000', '{"COFFRE":{"y":-531.0899047851563,"z":55.9369010925293,"x":-1456.83740234375},"ENTER":{"y":-520.5800170898438,"z":54.92900085449219,"x":-1459.1700439453126},"EXIT":{"x":-773.5578002929688,"y":311.4858093261719,"z":85.6980972290039}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '1'),
	(257, 'ap7im1', '{"label":"ap7im1","poids":3000,"name":"ap7im1"}', '1300000', '{"COFFRE":{"y":54.69309997558594,"z":96.59940338134766,"x":-623.0919189453125},"ENTER":{"y":59.06000137329101,"z":97.1999969482422,"x":-612.1599731445313},"EXIT":{"x":-773.5578002929688,"y":311.4858093261719,"z":85.6980972290039}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '1'),
	(258, 'ap8im1', '{"poids":3000,"name":"ap8im1","label":"ap8im1"}', '1300000', '{"COFFRE":{"y":54.69309997558594,"z":96.59940338134766,"x":-623.0919189453125},"ENTER":{"y":59.06000137329101,"z":97.1999969482422,"x":-612.1599731445313},"EXIT":{"x":-773.5578002929688,"y":311.4858093261719,"z":85.6980972290039}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '1'),
	(259, 'ap9im1', '{"label":"ap9im1","name":"ap9im1","poids":3000}', '1300000', '{"COFFRE":{"y":54.69309997558594,"z":96.59940338134766,"x":-623.0919189453125},"ENTER":{"y":59.06000137329101,"z":97.1999969482422,"x":-612.1599731445313},"EXIT":{"x":-773.5578002929688,"y":311.4858093261719,"z":85.6980972290039}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '1'),
	(260, 'ap10im1', '{"label":"ap10im1","poids":3500,"name":"ap10im1"}', '5000000', '{"COFFRE":{"y":326.8150024414063,"z":186.31289672851566,"x":-795.7161254882813},"ENTER":{"y":315.7900085449219,"z":187.91000366210936,"x":-785.1300048828125},"EXIT":{"x":-773.5578002929688,"y":311.4858093261719,"z":85.6980972290039}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '1'),
	(262, 'ap11im1', '{"label":"ap11im1","name":"ap11im1","poids":3500}', '5000000', '{"COFFRE":{"y":326.8150024414063,"z":186.31289672851566,"x":-795.7161254882813},"ENTER":{"y":315.7900085449219,"z":187.91000366210936,"x":-785.1300048828125},"EXIT":{"x":-773.5578002929688,"y":311.4858093261719,"z":85.6980972290039}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '1'),
	(263, 'ap12im1', '{"label":"ap12im1","name":"ap12im1","poids":3000}', '1300000', '{"COFFRE":{"y":54.69309997558594,"z":96.59940338134766,"x":-623.0919189453125},"ENTER":{"y":59.06000137329101,"z":97.1999969482422,"x":-612.1599731445313},"EXIT":{"x":-773.5578002929688,"y":311.4858093261719,"z":85.6980972290039}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '1'),
	(264, 'ap13im1', '{"name":"ap13im1","label":"ap13im1","poids":4000}', '3500000', '{"COFFRE":{"y":-531.0899047851563,"z":55.9369010925293,"x":-1456.83740234375},"ENTER":{"y":-520.5800170898438,"z":54.92900085449219,"x":-1459.1700439453126},"EXIT":{"x":-773.5578002929688,"y":311.4858093261719,"z":85.6980972290039}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '1'),
	(265, 'ap14im1', '{"label":"ap14im1","name":"ap14im1","poids":3500}', '5000000', '{"COFFRE":{"y":326.8150024414063,"z":186.31289672851566,"x":-795.7161254882813},"ENTER":{"y":315.7900085449219,"z":187.91000366210936,"x":-785.1300048828125},"EXIT":{"x":-773.5578002929688,"y":311.4858093261719,"z":85.6980972290039}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '1'),
	(266, 'ap15im1', '{"label":"ap15im1","name":"ap15im1","poids":3500}', '5000000', '{"COFFRE":{"y":326.8150024414063,"z":186.31289672851566,"x":-795.7161254882813},"ENTER":{"y":315.7900085449219,"z":187.91000366210936,"x":-785.1300048828125},"EXIT":{"x":-773.5578002929688,"y":311.4858093261719,"z":85.6980972290039}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '1'),
	(267, 'ap16im1', '{"poids":3500,"label":"ap16im1","name":"ap16im1"}', '5000000', '{"COFFRE":{"y":326.8150024414063,"z":186.31289672851566,"x":-795.7161254882813},"ENTER":{"y":315.7900085449219,"z":187.91000366210936,"x":-785.1300048828125},"EXIT":{"x":-773.5578002929688,"y":311.4858093261719,"z":85.6980972290039}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '1'),
	(268, 'ap17im1', '{"label":"ap17im1","poids":3500,"name":"ap17im1"}', '5000000', '{"COFFRE":{"y":326.8150024414063,"z":186.31289672851566,"x":-795.7161254882813},"ENTER":{"y":315.7900085449219,"z":187.91000366210936,"x":-785.1300048828125},"EXIT":{"x":-773.5578002929688,"y":311.4858093261719,"z":85.6980972290039}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '1'),
	(269, 'ap18im1', '{"label":"ap18im1","poids":3500,"name":"ap18im1"}', '5000000', '{"COFFRE":{"y":326.8150024414063,"z":186.31289672851566,"x":-795.7161254882813},"ENTER":{"y":315.7900085449219,"z":187.91000366210936,"x":-785.1300048828125},"EXIT":{"x":-773.5578002929688,"y":311.4858093261719,"z":85.6980972290039}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '1'),
	(270, 'ap19im1', '{"poids":3500,"label":"ap19im1","name":"ap19im1"}', '5000000', '{"COFFRE":{"y":326.8150024414063,"z":186.31289672851566,"x":-795.7161254882813},"ENTER":{"y":315.7900085449219,"z":187.91000366210936,"x":-785.1300048828125},"EXIT":{"x":-773.5578002929688,"y":311.4858093261719,"z":85.6980972290039}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '1'),
	(272, 'ap1im5', '{"poids":3500,"name":"ap1im5","label":"ap1im5"}', '5000000', '{"COFFRE":{"x":-795.7161254882813,"y":326.81500244140627,"z":186.31289672851563},"ENTER":{"x":-785.1300048828125,"y":315.7900085449219,"z":187.91000366210938},"EXIT":{"x":-66.08767700195313,"y":-801.2213745117188,"z":44.22727966308594}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '5'),
	(273, 'ap2im5', '{"poids":3000,"name":"ap2im5","label":"ap2im5"}', '1300000', '{"COFFRE":{"x":-623.0919189453125,"y":54.69309997558594,"z":96.59940338134766},"ENTER":{"x":-612.1599731445313,"y":59.06000137329101,"z":97.19999694824219},"EXIT":{"x":-66.08767700195313,"y":-801.2213745117188,"z":44.22727966308594}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '5'),
	(274, 'ap3im5', '{"poids":3500,"name":"ap3im5","label":"ap3im5"}', '5000000', '{"COFFRE":{"x":-795.7161254882813,"y":326.81500244140627,"z":186.31289672851563},"ENTER":{"x":-785.1300048828125,"y":315.7900085449219,"z":187.91000366210938},"EXIT":{"x":-66.08767700195313,"y":-801.2213745117188,"z":44.22727966308594}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '5'),
	(275, 'ap4im5', '{"poids":3000,"name":"ap4im5","label":"ap4im5"}', '1300000', '{"COFFRE":{"x":-623.0919189453125,"y":54.69309997558594,"z":96.59940338134766},"ENTER":{"x":-612.1599731445313,"y":59.06000137329101,"z":97.19999694824219},"EXIT":{"x":-66.08767700195313,"y":-801.2213745117188,"z":44.22727966308594}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '5'),
	(276, 'ap5im5', '{"poids":4000,"name":"ap5im5","label":"ap5im5"}', '3500000', '{"COFFRE":{"x":-1456.83740234375,"y":-531.0899047851563,"z":55.9369010925293},"ENTER":{"x":-1459.1700439453126,"y":-520.5800170898438,"z":54.92900085449219},"EXIT":{"x":-66.08767700195313,"y":-801.2213745117188,"z":44.22727966308594}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '5'),
	(277, 'ap6im5', '{"poids":3000,"name":"ap6im5","label":"ap6im5"}', '1300000', '{"COFFRE":{"x":-623.0919189453125,"y":54.69309997558594,"z":96.59940338134766},"ENTER":{"x":-612.1599731445313,"y":59.06000137329101,"z":97.19999694824219},"EXIT":{"x":-66.08767700195313,"y":-801.2213745117188,"z":44.22727966308594}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '5'),
	(278, 'ap7im5', '{"poids":4000,"name":"ap7im5","label":"ap7im5"}', '3500000', '{"COFFRE":{"x":-1456.83740234375,"y":-531.0899047851563,"z":55.9369010925293},"ENTER":{"x":-1459.1700439453126,"y":-520.5800170898438,"z":54.92900085449219},"EXIT":{"x":-66.08767700195313,"y":-801.2213745117188,"z":44.22727966308594}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '5'),
	(279, 'ap8im5', '{"poids":3500,"name":"ap8im5","label":"ap8im5"}', '5000000', '{"COFFRE":{"x":-795.7161254882813,"y":326.81500244140627,"z":186.31289672851563},"ENTER":{"x":-785.1300048828125,"y":315.7900085449219,"z":187.91000366210938},"EXIT":{"x":-66.08767700195313,"y":-801.2213745117188,"z":44.22727966308594}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '5'),
	(280, 'ap9im5', '{"poids":3500,"name":"ap9im5","label":"ap9im5"}', '5000000', '{"COFFRE":{"x":-795.7161254882813,"y":326.81500244140627,"z":186.31289672851563},"ENTER":{"x":-785.1300048828125,"y":315.7900085449219,"z":187.91000366210938},"EXIT":{"x":-66.08767700195313,"y":-801.2213745117188,"z":44.22727966308594}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '5'),
	(281, 'ap10im5', '{"poids":4000,"name":"ap10im5","label":"ap10im5"}', '3500000', '{"COFFRE":{"x":-1456.83740234375,"y":-531.0899047851563,"z":55.9369010925293},"ENTER":{"x":-1459.1700439453126,"y":-520.5800170898438,"z":54.92900085449219},"EXIT":{"x":-66.08767700195313,"y":-801.2213745117188,"z":44.22727966308594}}', '0', NULL, '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '5'),
	(286, 'petit_entrepôt_du_port_2', '{"name":"petit_entrepôt_du_port_2","label":"Petit Entrepôt du port 2","poids":75000}', '100000', '{"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"EXIT":{"x":156.1920166015625,"y":-3217.775146484375,"z":7.03159046173095}}', '1', 'license:003af21a04d8fbdb862a5f35564e4bd744e6633f', '{"item":{"martini":{"count":3,"name":"martini","label":"Martini blanc"},"bankcard":{"count":12,"name":"bankcard","label":"Carte d\'accès Banque"},"cocainetraitement":{"count":1,"name":"cocainetraitement","label":"Pochon de Cocaïne"},"heroinerecolte":{"count":1,"name":"heroinerecolte","label":"Héroine pure"},"chargeur":{"count":5,"name":"chargeur","label":"Chargeur"},"drill":{"count":12,"name":"drill","label":"Perceuse"},"cagoule":{"count":3,"name":"cagoule","label":"Cagoule"},"weedtraitement":{"count":1,"name":"weedtraitement","label":"Pochon de Weed"}},"weapons":{"894989":{"label":"Revolver","name":"WEAPON_REVOLVER","ammo":0},"830724":{"label":"Micro smg","name":"WEAPON_MICROSMG","ammo":0},"294120":{"label":"Pistolet calibre 50","name":"WEAPON_PISTOL50","ammo":250},"977203":{"label":"Pistolet lourd","name":"WEAPON_HEAVYPISTOL","ammo":0},"851940":{"label":"Fusil compact","name":"WEAPON_COMPACTRIFLE","ammo":250}},"accounts":{"dirtycash":0,"cash":0}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(287, 'petit_entrepôt_du_port_de_los_santos', '{"label":"Petit Entrepôt du port de Los Santos","name":"petit_entrepôt_du_port_de_los_santos","poids":75000}', '100000', '{"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"EXIT":{"x":155.302490234375,"y":-3164.758056640625,"z":7.03037214279174}}', '1', 'license:7a1d5cf0c90e2f9df74c6e4a53bae69f8975f646', '{"accounts":{"cash":0,"dirtycash":1512984},"weapons":{"426611":{"ammo":0,"name":"WEAPON_PISTOL50","label":"Pistolet calibre 50"},"388147":{"ammo":0,"name":"WEAPON_REVOLVER","label":"Revolver"}},"item":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(288, 'moyen_entrepôt_du_port_1', '{"label":"Moyen Entrepôt du port 1","name":"moyen_entrepôt_du_port_1","poids":100000}', '500000', '{"ENTER":{"x":1048.5067138671876,"y":-3097.081787109375,"z":-38.99990081787109},"COFFRE":{"x":1070.829345703125,"y":-3098.585205078125,"z":-39.99990081787109},"EXIT":{"x":1219.6173095703126,"y":-3200.388916015625,"z":5.52806806564331}}', '1', 'license:ef3b4effc66a53022e19be35cc9e05ba2a526c36', '{"item":[],"weapons":[],"accounts":{"dirtycash":0,"cash":0}}', '{"PeopleAlloweds":[{"identifier":"license:075fbf1c2eef781531c2e5b1f183371deea9fb9e","name":"Léaa"}],"GradesAlloweds":[]}', '0'),
	(289, 'petit_entrepôt_du_port_6', '{"label":"Petit Entrepôt du port 6","name":"petit_entrepôt_du_port_6","poids":75000}', '100000', '{"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"EXIT":{"x":155.10031127929688,"y":-3236.050048828125,"z":7.03117513656616},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164}}', '1', 'unemployed2', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":{"Citoyen":true}}', '0'),
	(290, 'maison_du_golf', '{"name":"maison_du_golf","poids":2500,"label":"Maison du golf"}', '60000', '{"EXIT":{"x":-1583.710693359375,"y":-265.92681884765627,"z":48.2756462097168},"ENTER":{"x":265.3070068359375,"y":-1002.802001953125,"z":-101.00800323486328},"COFFRE":{"x":265.1007995605469,"y":-999.1278076171875,"z":-100.00859832763672}}', '1', 'license:bcf486dfe5ecfbf5196ec7b26f1291e7b8a95052', '{"item":{"medikit":{"count":20,"name":"medikit","label":"Medikit"}},"accounts":{"cash":0,"dirtycash":0},"weapons":{}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(291, 'villa_luxeuse_golf', '{"label":"Villa Luxeuse Golf","poids":4000,"name":"villa_luxeuse_golf"}', '3500000', '{"ENTER":{"x":-1459.1700439453126,"y":-520.5800170898438,"z":54.92900085449219},"COFFRE":{"x":-1456.83740234375,"y":-531.0899047851563,"z":55.9369010925293},"EXIT":{"x":-902.2230224609375,"y":191.63157653808595,"z":69.44611358642578}}', '1', 'license:716931c1abfe44d4144bbee75c7bda1105ca9211', '{"item":[],"accounts":{"dirtycash":0,"cash":0},"weapons":[]}', '{"GradesAlloweds":[],"PeopleAlloweds":[]}', '0'),
	(292, 'petit_entrepot_cayo_perico', '{"poids":75000,"name":"petit_entrepot_cayo_perico","label":"Petit entrepot Cayo Perico"}', '100000', '{"EXIT":{"x":5100.10400390625,"y":-5721.27099609375,"z":15.77477359771728},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109}}', '1', 'cosanostra', '{"accounts":{"dirtycash":0,"cash":1},"weapons":[],"item":{"ketaminerecolte":{"label":"Ketamine","name":"ketaminerecolte","count":30},"chargeur":{"label":"Chargeur","name":"chargeur","count":4},"ketaminetraitement":{"label":"Pochon de Kétamine","name":"ketaminetraitement","count":1057}}}', '{"PeopleAlloweds":[],"GradesAlloweds":{"Membre":true,"Boss":true,"Recrue":true,"Gérant":true}}', '0'),
	(293, 'petit_entrepot_100k_bijouterie', '{"name":"petit_entrepot_100k_bijouterie","poids":75000,"label":"Petit entrepot 100k bijouterie"}', '100000', '{"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"EXIT":{"x":-706.4743041992188,"y":-303.3401794433594,"z":36.7613639831543}}', '0', NULL, '{"weapons":[],"accounts":{"dirtycash":0,"cash":0},"item":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(294, 'entrepôt_800k_a_cotes_de_carter_orpa', '{"name":"entrepôt_800k_a_cotes_de_carter_orpa","poids":200000,"label":"Entrepôt 800k a cotes de Carter Orpa"}', '800000', '{"ENTER":{"x":1026.505615234375,"y":-3099.83203125,"z":-38.99980163574219},"COFFRE":{"x":999.58251953125,"y":-3096.294677734375,"z":-39.99980163574219},"EXIT":{"x":-1264.8179931640626,"y":-815.8736572265625,"z":17.09918975830078}}', '1', 'license:68c1be07460e23fd348bf53392b11f3e78bf4217', '{"item":{"opiumtraitement":{"count":50,"name":"opiumtraitement","label":"Pochon d\'opium"},"opiumrecolte":{"count":760,"name":"opiumrecolte","label":"Opium"},"methtraitement":{"count":20,"name":"methtraitement","label":"Pochon de Méthamphétamine"},"medikit":{"count":19,"name":"medikit","label":"Medikit"}},"weapons":[],"accounts":{"dirtycash":0,"cash":0}}', '{"GradesAlloweds":[],"PeopleAlloweds":[]}', '0'),
	(295, 'entrpôt_100_diams', '{"name":"entrpôt_100_diams","poids":75000,"label":"entrpôt 100 diams"}', '100000', '{"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"EXIT":{"x":-718.515380859375,"y":-298.91680908203127,"z":36.95339584350586}}', '1', 'license:98a34f7b5cc494b24c2112739654ca7d82fa1bee', '{"weapons":[],"accounts":{"dirtycash":0,"cash":0},"item":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(296, 'entrepot_cayo_leon', '{"poids":200000,"name":"entrepot_cayo_leon","label":"Entrepot Cayo Leon"}', '800000', '{"EXIT":{"x":4982.35400390625,"y":-5116.685546875,"z":2.61611080169677},"ENTER":{"x":1026.505615234375,"y":-3099.83203125,"z":-38.99980163574219},"COFFRE":{"x":999.58251953125,"y":-3096.294677734375,"z":-39.99980163574219}}', '1', 'rodriguez', '{"accounts":{"cash":30910000,"dirtycash":0},"item":[],"weapons":{"679657":{"label":"Pistolet","name":"WEAPON_PISTOL","ammo":250}}}', '{"GradesAlloweds":{"Gérant":true,"Membre":true,"Recrue":true,"Boss":true},"PeopleAlloweds":[]}', '0'),
	(297, 'petit_entrepot_akumi', '{"poids":75000,"name":"petit_entrepot_akumi","label":"Petit entrepot akumi"}', '100000', '{"EXIT":{"x":269.21221923828127,"y":3.35102581977844,"z":79.24595642089844},"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164}}', '1', 'license:86827dee90f49105d505615595c5c6b523f43f22', '{"weapons":[],"item":[],"accounts":{"cash":0,"dirtycash":0}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(298, 'entrpôt_de_la_plage_500k_coupe_tif', '{"name":"entrpôt_de_la_plage_500k_coupe_tif","label":"Entrpôt de la plage 500k coupe tif","poids":100000}', '500000', '{"COFFRE":{"x":1070.829345703125,"y":-3098.585205078125,"z":-39.99990081787109},"EXIT":{"x":-1320.2769775390626,"y":-1167.18359375,"z":4.8487434387207},"ENTER":{"x":1048.5067138671876,"y":-3097.081787109375,"z":-38.99990081787109}}', '0', NULL, '{"accounts":{"cash":0,"dirtycash":0},"item":[],"weapons":[]}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(299, 'motel_porte_verte', '{"name":"motel_porte_verte","label":"Motel porte verte","poids":1000}', '60000', '{"ENTER":{"x":151.4499969482422,"y":-1007.5700073242188,"z":-98.9999008178711},"EXIT":{"x":-1455.7662353515626,"y":-691.470703125,"z":26.33494186401367},"COFFRE":{"x":151.73609924316407,"y":-1003.5819091796875,"z":-100.0}}', '1', 'license:7a39e6db79a7827423e96f86ee03489fdd53e823', '{"accounts":{"dirtycash":0,"cash":0},"item":[],"weapons":[]}', '{"PeopleAlloweds":[{"name":"Davis Owlayds | MGIII","identifier":"license:12631ef6b3a4be8d6271b6831cb7c5803f85be7c"},{"name":"Davis Owlayds | MGIII","identifier":"license:12631ef6b3a4be8d6271b6831cb7c5803f85be7c"},{"name":"59z\' Bourata","identifier":"license:dbe2256f1838ed19b6ea0c838db14a0a457cb142"},{"name":"SPLIZZ","identifier":"license:65d22f1ca5597c2e02ac1711974859c10214906c"}],"GradesAlloweds":[]}', '0'),
	(300, 'main_noir_entrepot', '{"label":"Main noir entrepot","name":"main_noir_entrepot","poids":75000}', '100000', '{"COFFRE":{"x":1103.033935546875,"y":-3101.6630859375,"z":-39.9990005493164},"ENTER":{"x":1088.183349609375,"y":-3099.354736328125,"z":-38.99990081787109},"EXIT":{"x":-127.05760192871094,"y":-2530.4033203125,"z":6.09571313858032}}', '1', 'license:716931c1abfe44d4144bbee75c7bda1105ca9211', '{"accounts":{"cash":427899,"dirtycash":0},"weapons":{"972752":{"label":"Mini smg","ammo":250,"name":"WEAPON_MINISMG"},"784797":{"label":"Smg","ammo":250,"name":"WEAPON_SMG"},"172676":{"label":"Mini smg","ammo":250,"name":"WEAPON_MINISMG"},"796151":{"label":"Pistolet mitrailleur","ammo":250,"name":"WEAPON_MACHINEPISTOL"},"460368":{"label":"Smg","ammo":250,"name":"WEAPON_SMG"}},"item":{"weedrecolte":{"count":1,"label":"Weed","name":"weedrecolte"},"medikit":{"count":56,"label":"Medikit","name":"medikit"},"methtraitement":{"count":63,"label":"Pochon de Méthamphétamine","name":"methtraitement"},"tissu":{"count":600,"label":"Tissu","name":"tissu"},"opiumtraitement":{"count":85,"label":"Pochon d\'opium","name":"opiumtraitement"},"aciertraitement":{"count":14,"label":"Acier Traité","name":"aciertraitement"},"cocainetraitement":{"count":62,"label":"Pochon de Cocaïne","name":"cocainetraitement"},"bois":{"count":3,"label":"Buche de Bois","name":"bois"},"opiumrecolte":{"count":1,"label":"Opium","name":"opiumrecolte"},"weedtraitement":{"count":39,"label":"Pochon de Weed","name":"weedtraitement"},"ketaminetraitement":{"count":9,"label":"Pochon de Kétamine","name":"ketaminetraitement"},"chargeur":{"count":4,"label":"Chargeur","name":"chargeur"},"ammoniac":{"count":30,"label":"Ammoniac","name":"ammoniac"}}}', '{"GradesAlloweds":[],"PeopleAlloweds":[]}', '0'),
	(301, 'villa_coté_blue_dragon', '{"name":"villa_coté_blue_dragon","poids":3000,"label":"Villa coté blue dragon"}', '1300000', '{"EXIT":{"x":-1549.2843017578126,"y":-90.76976013183594,"z":54.9291877746582},"ENTER":{"x":-612.1599731445313,"y":59.06000137329101,"z":97.19999694824219},"COFFRE":{"x":-623.0919189453125,"y":54.69309997558594,"z":96.59940338134766}}', '1', 'license:5a16206a199dd572f8842d9ba695dac025223d94', '{"item":{"pelle":{"label":"Pelle","count":1,"name":"pelle"}},"weapons":[],"accounts":{"dirtycash":2122731,"cash":0}}', '{"PeopleAlloweds":[],"GradesAlloweds":[]}', '0'),
	(302, 'lescanaux', '{"label":"lescanaux","poids":3500,"name":"lescanaux"}', '5000000', '{"EXIT":{"x":-1055.505615234375,"y":-998.5360107421875,"z":6.4104905128479},"ENTER":{"x":-785.1300048828125,"y":315.7900085449219,"z":187.91000366210938},"COFFRE":{"x":-795.7161254882813,"y":326.81500244140627,"z":186.31289672851563}}', '0', NULL, NULL, NULL, '0');
/*!40000 ALTER TABLE `properties_list` ENABLE KEYS */;

-- Dumping structure for table bluestark.rented_vehicles
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(12) COLLATE utf8mb4_bin NOT NULL,
  `player_name` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `society` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT 'carshop',
  PRIMARY KEY (`plate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.rented_vehicles: ~3 rows (approximately)
/*!40000 ALTER TABLE `rented_vehicles` DISABLE KEYS */;
REPLACE INTO `rented_vehicles` (`vehicle`, `plate`, `player_name`, `base_price`, `rent_price`, `owner`, `society`) VALUES
	('felon2', 'RENTIGX2', 'Rompo Casane', 18000, 1, 'license:e192d8d85d11a4e54fd1c661b5cc44eb6f118df9', 'carshop'),
	('blista', 'RENTJZGJ', 'LOUIS SEILLIER', 7000, 1, 'license:b315991988768b8efd7a2e52f1ae2cca0119b7b1', 'carshop'),
	('seven70', 'RENTSWBL', 'Beely', 39500, 5000, 'license:be460a59d2766882a247f97156fa363e422f7e8a', 'carshop');
/*!40000 ALTER TABLE `rented_vehicles` ENABLE KEYS */;

-- Dumping structure for table bluestark.sealife_ammustockage
CREATE TABLE IF NOT EXISTS `sealife_ammustockage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL DEFAULT '0',
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.sealife_ammustockage: ~0 rows (approximately)
/*!40000 ALTER TABLE `sealife_ammustockage` DISABLE KEYS */;
/*!40000 ALTER TABLE `sealife_ammustockage` ENABLE KEYS */;

-- Dumping structure for table bluestark.sealife_ban
CREATE TABLE IF NOT EXISTS `sealife_ban` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `License` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `Discord` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Xbox` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Live` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Tokens` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '[]',
  `Reason` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `isBanned` int(11) NOT NULL DEFAULT 0,
  `Expire` int(11) NOT NULL DEFAULT 0,
  `timeat` int(55) DEFAULT 0,
  `permanent` int(1) DEFAULT 0,
  `moderatorName` varchar(255) DEFAULT 'BlueStark',
  KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.sealife_ban: ~0 rows (approximately)
/*!40000 ALTER TABLE `sealife_ban` DISABLE KEYS */;
/*!40000 ALTER TABLE `sealife_ban` ENABLE KEYS */;

-- Dumping structure for table bluestark.sealife_banhistory
CREATE TABLE IF NOT EXISTS `sealife_banhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `moderator` varchar(50) DEFAULT 'Inconnu',
  `date` varchar(255) DEFAULT NULL,
  `unbandate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.sealife_banhistory: ~0 rows (approximately)
/*!40000 ALTER TABLE `sealife_banhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `sealife_banhistory` ENABLE KEYS */;

-- Dumping structure for table bluestark.sealife_bank
CREATE TABLE IF NOT EXISTS `sealife_bank` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL DEFAULT '0',
  `history` longtext NOT NULL,
  `bankid` longtext NOT NULL,
  `Virement` longtext DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.sealife_bank: ~39 rows (approximately)
/*!40000 ALTER TABLE `sealife_bank` DISABLE KEYS */;
REPLACE INTO `sealife_bank` (`id`, `identifier`, `history`, `bankid`, `Virement`) VALUES
	(1, 'license:222c46fedf9fa74880e63ab731894be3fb57c497', '{"1":{"Title":"Création du Compte","amount":0,"Description":"Ouverture d\'un compte Bancaire.","Date":"03.03.2022 - 13:08:06","type":"Création"}}', 'IBAN-1646312886', NULL),
	(2, 'license:676c7031a7e3c4b1fe6d534ebfbfe1ae4af49d16', '{"1":{"Description":"Ouverture d\'un compte Bancaire.","type":"Création","amount":0,"Date":"03.03.2022 - 13:18:46","Title":"Création du Compte"}}', 'IBAN-1646313526', NULL),
	(3, 'license:840e2bbb73619a49876134911513efcd6e975c6c', '{"1":{"Title":"Création du Compte","Date":"03.03.2022 - 13:46:51","amount":0,"Description":"Ouverture d\'un compte Bancaire.","type":"Création"}}', 'IBAN-1646315211', NULL),
	(4, 'license:3b812812ad65ece34da9a84c3d7aa2bb1257f2a7', '{"1":{"Title":"Création du Compte","type":"Création","Date":"03.03.2022 - 14:10:42","Description":"Ouverture d\'un compte Bancaire.","amount":0}}', 'IBAN-1646316642', NULL),
	(5, 'license:afaba2ad9bca10e18363adece691fdecbcababee', '{"1":{"Date":"04.03.2022 - 13:09:17","type":"Création","amount":0,"Title":"Création du Compte","Description":"Ouverture d\'un compte Bancaire."}}', 'IBAN-1646399357', NULL),
	(6, 'license:d7b1a029b3e0d095633bb27dc9f31e5ac130ca62', '{"1":{"amount":0,"Date":"04.03.2022 - 22:45:48","type":"Création","Description":"Ouverture d\'un compte Bancaire.","Title":"Création du Compte"}}', 'IBAN-1646433948', NULL),
	(7, 'license:23eb122fbc001b121afd443767a90c32ce8d58b2', '{"1":{"Title":"Création du Compte","amount":0,"Description":"Ouverture d\'un compte Bancaire.","Date":"05.03.2022 - 00:35:12","type":"Création"}}', 'IBAN-1646440512', NULL),
	(8, 'license:17f2b8a5c19f26e1e136c114dfe204bc708ee87e', '{"1":{"Description":"Ouverture d\'un compte Bancaire.","type":"Création","amount":0,"Date":"05.03.2022 - 00:38:20","Title":"Création du Compte"}}', 'IBAN-1646440700', NULL),
	(9, 'license:74722e5d83c23057107334ec41dc2c5539369201', '{"1":{"Description":"Ouverture d\'un compte Bancaire.","type":"Création","amount":0,"Date":"05.03.2022 - 08:38:50","Title":"Création du Compte"}}', 'IBAN-1646469530', NULL),
	(10, 'license:1543c0430465cae3b2710706634749fbcfd7c567', '{"1":{"Title":"Création du Compte","amount":0,"Description":"Ouverture d\'un compte Bancaire.","Date":"05.03.2022 - 10:04:20","type":"Création"}}', 'IBAN-1646474660', NULL),
	(11, 'license:f5788bac547691e212faa76eb9e71f46da796d50', '{"1":{"Title":"Création du Compte","type":"Création","Date":"05.03.2022 - 10:07:21","Description":"Ouverture d\'un compte Bancaire.","amount":0}}', 'IBAN-1646474841', NULL),
	(12, 'license:5b545b297e209cdabcc80b0d8644571fd87de093', '{"1":{"Title":"Création du Compte","amount":0,"Description":"Ouverture d\'un compte Bancaire.","Date":"05.03.2022 - 12:08:59","type":"Création"}}', 'IBAN-1646482139', NULL),
	(13, 'license:d9725f63efe9d0d53a0883c78cb79f14db186780', '{"1":{"Title":"Création du Compte","amount":0,"Description":"Ouverture d\'un compte Bancaire.","Date":"05.03.2022 - 12:13:06","type":"Création"}}', 'IBAN-1646482386', NULL),
	(14, 'license:8b2dd308c0f10d32e5a363e13f7d1d016161668f', '{"1":{"Title":"Création du Compte","amount":0,"Description":"Ouverture d\'un compte Bancaire.","Date":"05.03.2022 - 13:29:37","type":"Création"}}', 'IBAN-1646486977', NULL),
	(15, 'license:a0e80b30c01ed966e9e9af43980587c7b526bace', '{"1":{"Title":"Création du Compte","amount":0,"Description":"Ouverture d\'un compte Bancaire.","Date":"05.03.2022 - 18:17:23","type":"Création"}}', 'IBAN-1646504243', NULL),
	(16, 'license:d4e9cbeaacc2b0ce1d1c8ce7f53ee71b8183867c', '{"1":{"Title":"Création du Compte","amount":0,"Description":"Ouverture d\'un compte Bancaire.","Date":"05.03.2022 - 19:26:58","type":"Création"}}', 'IBAN-1646508418', NULL),
	(17, 'license:efd104ae3a0f12892e88c17f63c0d08cd80f2b49', '{"1":{"Title":"Création du Compte","amount":0,"Description":"Ouverture d\'un compte Bancaire.","Date":"05.03.2022 - 19:37:11","type":"Création"}}', 'IBAN-1646509031', NULL),
	(18, 'license:17d8f0a88f62475eac0559a09a7a06355ba9b2ec', '{"1":{"Title":"Création du Compte","amount":0,"Description":"Ouverture d\'un compte Bancaire.","Date":"05.03.2022 - 21:52:09","type":"Création"}}', 'IBAN-1646517129', NULL),
	(19, 'license:6b4fbc2620bf3fe8fe144b88ecde934e50ac49c9', '{"1":{"Title":"Création du Compte","amount":0,"Description":"Ouverture d\'un compte Bancaire.","Date":"06.03.2022 - 01:01:53","type":"Création"}}', 'IBAN-1646528513', NULL),
	(20, 'license:44730fcd67e41f528b8916be9fdce29964561530', '{"1":{"Title":"Création du Compte","amount":0,"Description":"Ouverture d\'un compte Bancaire.","Date":"06.03.2022 - 01:04:08","type":"Création"}}', 'IBAN-1646528648', NULL),
	(21, 'license:07091b465a1b387c8a6d6968d6c841dcaeae2d57', '{"1":{"Title":"Création du Compte","amount":0,"Description":"Ouverture d\'un compte Bancaire.","Date":"06.03.2022 - 02:13:41","type":"Création"}}', 'IBAN-1646532821', NULL),
	(22, 'license:cf5d504aad8457773961dd28b37ce37e16db8923', '{"1":{"Title":"Création du Compte","amount":0,"Description":"Ouverture d\'un compte Bancaire.","Date":"06.03.2022 - 02:55:11","type":"Création"}}', 'IBAN-1646535311', NULL),
	(23, 'license:c33553d0860e631beb5586d1947bb3ccdbdb4ce4', '{"1":{"Title":"Création du Compte","amount":0,"Description":"Ouverture d\'un compte Bancaire.","Date":"06.03.2022 - 09:33:51","type":"Création"}}', 'IBAN-1646559231', NULL),
	(24, 'license:ca1d88031d0d25bcca2ab217cbe329177c25cff9', '{"1":{"Title":"Création du Compte","amount":0,"Description":"Ouverture d\'un compte Bancaire.","Date":"06.03.2022 - 15:52:24","type":"Création"}}', 'IBAN-1646581944', NULL),
	(25, 'license:5203102308639a36633cfce5e4a45ac9bab82a93', '{"1":{"Title":"Création du Compte","amount":0,"Description":"Ouverture d\'un compte Bancaire.","Date":"06.03.2022 - 18:13:07","type":"Création"}}', 'IBAN-1646590387', NULL),
	(26, 'license:63b7781c2a1bc429c70113ad64f73ae69ce0a789', '{"1":{"Title":"Création du Compte","amount":0,"Description":"Ouverture d\'un compte Bancaire.","Date":"06.03.2022 - 20:14:45","type":"Création"}}', 'IBAN-1646597685', NULL),
	(27, 'license:5e6b1e3c9912bca10bbf0a2258cab659480d5e21', '{"1":{"Title":"Création du Compte","amount":0,"Description":"Ouverture d\'un compte Bancaire.","Date":"06.03.2022 - 20:46:18","type":"Création"}}', 'IBAN-1646599578', NULL),
	(28, 'license:42514dcf5b5f34d8d249a01f66ccdffec3f74833', '{"1":{"Title":"Création du Compte","amount":0,"Description":"Ouverture d\'un compte Bancaire.","Date":"06.03.2022 - 21:55:31","type":"Création"}}', 'IBAN-1646603731', NULL),
	(29, 'license:e8a849c4ebb701efb4f651c6bf596d80252cad42', '{"1":{"Title":"Création du Compte","amount":0,"Description":"Ouverture d\'un compte Bancaire.","Date":"07.03.2022 - 00:04:32","type":"Création"}}', 'IBAN-1646611472', NULL),
	(30, 'license:f57cbaffc364f51fc165f2a95dad2b59b43aa3c8', '{"1":{"Title":"Création du Compte","amount":0,"Description":"Ouverture d\'un compte Bancaire.","Date":"07.03.2022 - 10:47:16","type":"Création"}}', 'IBAN-1646650036', NULL),
	(31, 'license:33d330aae30191a8ae6fe52c2015d5a6576f3d59', '{"1":{"Title":"Création du Compte","amount":0,"Description":"Ouverture d\'un compte Bancaire.","Date":"07.03.2022 - 16:25:53","type":"Création"}}', 'IBAN-1646670353', NULL),
	(32, 'license:08bee9809c7e7f8bfdcd7b840afc08b58279f780', '{"1":{"Title":"Création du Compte","amount":0,"Description":"Ouverture d\'un compte Bancaire.","Date":"07.03.2022 - 16:40:50","type":"Création"}}', 'IBAN-1646671250', NULL),
	(33, 'license:5839bd0648b6519bb31d5e395685d41d4b96cf35', '{"1":{"Title":"Création du Compte","amount":0,"Description":"Ouverture d\'un compte Bancaire.","Date":"07.03.2022 - 16:57:28","type":"Création"}}', 'IBAN-1646672248', NULL),
	(34, 'license:80019cf46f860351cfd79dc1d174f4e52f234034', '{"1":{"Title":"Création du Compte","amount":0,"Description":"Ouverture d\'un compte Bancaire.","Date":"07.03.2022 - 17:44:09","type":"Création"}}', 'IBAN-1646675049', NULL),
	(35, 'license:e7b2e663bbf6a24a12b25818893434f812b9c45b', '{"1":{"Title":"Création du Compte","amount":0,"Description":"Ouverture d\'un compte Bancaire.","Date":"08.03.2022 - 01:12:59","type":"Création"}}', 'IBAN-1646701979', NULL),
	(36, 'license:4108734c231c4d79813c0dba44ad9533d79b2bcc', '{"1":{"Title":"Création du Compte","amount":0,"Description":"Ouverture d\'un compte Bancaire.","Date":"08.03.2022 - 08:34:26","type":"Création"}}', 'IBAN-1646728466', NULL),
	(37, 'license:4e2da4d529d2cc3f1c508c526e90d3158e921f98', '{"1":{"Title":"Création du Compte","amount":0,"Description":"Ouverture d\'un compte Bancaire.","Date":"08.03.2022 - 14:00:10","type":"Création"}}', 'IBAN-1646748010', NULL),
	(38, 'license:0952c2029a28248d70dc879a193c1b91aa5475fe', '{"1":{"Date":"08.03.2022 - 21:56:56","Description":"Ouverture d\'un compte Bancaire.","amount":0,"Title":"Création du Compte","type":"Création"}}', 'IBAN-1646776616', NULL),
	(39, 'license:12374a551ca0dc681bed492fe4cd1fc449f757c7', '{"1":{"Title":"Création du Compte","amount":0,"Date":"13.03.2022 - 21:33:56","type":"Création","Description":"Ouverture d\'un compte Bancaire."}}', 'IBAN-1647207236', NULL);
/*!40000 ALTER TABLE `sealife_bank` ENABLE KEYS */;

-- Dumping structure for table bluestark.sealife_boostdiscord
CREATE TABLE IF NOT EXISTS `sealife_boostdiscord` (
  `identifier` varchar(50) DEFAULT '255',
  `time` int(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.sealife_boostdiscord: ~0 rows (approximately)
/*!40000 ALTER TABLE `sealife_boostdiscord` DISABLE KEYS */;
/*!40000 ALTER TABLE `sealife_boostdiscord` ENABLE KEYS */;

-- Dumping structure for table bluestark.sealife_crypto
CREATE TABLE IF NOT EXISTS `sealife_crypto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL DEFAULT '0',
  `vrack` longtext DEFAULT NULL,
  `vrackslot` int(55) NOT NULL DEFAULT 1,
  `numbervrack` int(55) DEFAULT 1,
  `WaitingMoney` int(255) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.sealife_crypto: ~2 rows (approximately)
/*!40000 ALTER TABLE `sealife_crypto` DISABLE KEYS */;
REPLACE INTO `sealife_crypto` (`id`, `identifier`, `vrack`, `vrackslot`, `numbervrack`, `WaitingMoney`) VALUES
	(1, 'license:afaba2ad9bca10e18363adece691fdecbcababee', '{"RIG-1":{"MoneyEarn":500,"level":1}}', 1, 1, 2500),
	(2, 'license:cf5d504aad8457773961dd28b37ce37e16db8923', '{"RIG-1":{"level":1,"MoneyEarn":500}}', 1, 1, 2000);
/*!40000 ALTER TABLE `sealife_crypto` ENABLE KEYS */;

-- Dumping structure for table bluestark.sealife_deletecontribvehicles
CREATE TABLE IF NOT EXISTS `sealife_deletecontribvehicles` (
  `plate` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.sealife_deletecontribvehicles: ~0 rows (approximately)
/*!40000 ALTER TABLE `sealife_deletecontribvehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `sealife_deletecontribvehicles` ENABLE KEYS */;

-- Dumping structure for table bluestark.sealife_invest
CREATE TABLE IF NOT EXISTS `sealife_invest` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `license` varchar(255) DEFAULT NULL,
  `time` int(25) NOT NULL DEFAULT 0,
  `type` int(25) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.sealife_invest: ~0 rows (approximately)
/*!40000 ALTER TABLE `sealife_invest` DISABLE KEYS */;
/*!40000 ALTER TABLE `sealife_invest` ENABLE KEYS */;

-- Dumping structure for table bluestark.sealife_isdead
CREATE TABLE IF NOT EXISTS `sealife_isdead` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `license` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.sealife_isdead: ~0 rows (approximately)
/*!40000 ALTER TABLE `sealife_isdead` DISABLE KEYS */;
/*!40000 ALTER TABLE `sealife_isdead` ENABLE KEYS */;

-- Dumping structure for table bluestark.sealife_isDead
CREATE TABLE IF NOT EXISTS `sealife_isDead` (
  `id` int(25) NOT NULL AUTO_INCREMENT,
  `license` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6621 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.sealife_isDead: ~6 rows (approximately)
/*!40000 ALTER TABLE `sealife_isDead` DISABLE KEYS */;
REPLACE INTO `sealife_isDead` (`id`, `license`) VALUES
	(6614, 'license:d5978481098e92d4daafbbef17620e54dec79196'),
	(6615, 'license:c48b0294f78a28f6f264a7adfa68a5b3f4cdc4f9'),
	(6616, 'license:c036013c3d6f5a5e951dfc69633cdbc51ddf4232'),
	(6617, 'license:6b4fbc2620bf3fe8fe144b88ecde934e50ac49c9'),
	(6619, 'license:33d330aae30191a8ae6fe52c2015d5a6576f3d59'),
	(6620, 'license:e7b2e663bbf6a24a12b25818893434f812b9c45b');
/*!40000 ALTER TABLE `sealife_isDead` ENABLE KEYS */;

-- Dumping structure for table bluestark.sealife_jail
CREATE TABLE IF NOT EXISTS `sealife_jail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(255) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.sealife_jail: ~3 rows (approximately)
/*!40000 ALTER TABLE `sealife_jail` DISABLE KEYS */;
REPLACE INTO `sealife_jail` (`id`, `license`, `time`) VALUES
	(2, 'license:676c7031a7e3c4b1fe6d534ebfbfe1ae4af49d16', NULL),
	(3, 'license:3b812812ad65ece34da9a84c3d7aa2bb1257f2a7', NULL),
	(4, 'license:afaba2ad9bca10e18363adece691fdecbcababee', NULL);
/*!40000 ALTER TABLE `sealife_jail` ENABLE KEYS */;

-- Dumping structure for table bluestark.sealife_laboratories
CREATE TABLE IF NOT EXISTS `sealife_laboratories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(255) NOT NULL DEFAULT '0',
  `positions` varchar(255) NOT NULL DEFAULT '0',
  `timestamps` int(250) NOT NULL DEFAULT 0,
  `allowAttack` int(250) NOT NULL DEFAULT 0,
  `type` varchar(255) NOT NULL DEFAULT '0',
  `recolte` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.sealife_laboratories: ~0 rows (approximately)
/*!40000 ALTER TABLE `sealife_laboratories` DISABLE KEYS */;
/*!40000 ALTER TABLE `sealife_laboratories` ENABLE KEYS */;

-- Dumping structure for table bluestark.sealife_utils
CREATE TABLE IF NOT EXISTS `sealife_utils` (
  `crypto` int(255) DEFAULT NULL,
  `vehicleboutique` int(255) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.sealife_utils: ~1 rows (approximately)
/*!40000 ALTER TABLE `sealife_utils` DISABLE KEYS */;
REPLACE INTO `sealife_utils` (`crypto`, `vehicleboutique`) VALUES
	(1647289348, 7);
/*!40000 ALTER TABLE `sealife_utils` ENABLE KEYS */;

-- Dumping structure for table bluestark.seashield_banlist
CREATE TABLE IF NOT EXISTS `seashield_banlist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `License` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `Discord` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Xbox` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Live` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `Tokens` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '[]',
  `Reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `isBanned` int(11) NOT NULL DEFAULT 0,
  `Expire` int(11) NOT NULL DEFAULT 0,
  `timeat` int(55) DEFAULT 0,
  `permanent` int(1) DEFAULT 0,
  `moderatorName` varchar(255) DEFAULT 'SeaShield',
  `banimg` longtext DEFAULT NULL,
  KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.seashield_banlist: ~0 rows (approximately)
/*!40000 ALTER TABLE `seashield_banlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `seashield_banlist` ENABLE KEYS */;

-- Dumping structure for table bluestark.society
CREATE TABLE IF NOT EXISTS `society` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `data` longtext NOT NULL DEFAULT '{"weapons":[],"accounts":{"cash":0,"dirtycash":0},"items":[]}',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.society: ~56 rows (approximately)
/*!40000 ALTER TABLE `society` DISABLE KEYS */;
REPLACE INTO `society` (`id`, `name`, `data`) VALUES
	(19, 'bennys', '{"accounts":{"cash":5476366,"dirtycash":0},"items":{},"weapons":{}}'),
	(21, 'hayesmotor', '{"weapons":{},"items":{},"accounts":{"dirtycash":0,"cash":461901}}'),
	(22, 'dumousap', '{"accounts":{"cash":3466046,"dirtycash":0},"items":{"pelle":{"count":1,"label":"Pelle","item":"pelle"},"weedtraitement":{"count":14,"label":"Pochon de Weed","item":"weedtraitement"},"methtraitement":{"count":10,"label":"Pochon de Méthamphétamine","item":"methtraitement"},"tissu":{"count":1,"label":"Tissu","item":"tissu"},"opiumtraitement":{"count":25,"label":"Pochon d\'opium","item":"opiumtraitement"}},"weapons":[]}'),
	(23, 'saudiaramco', '{"weapons":[],"items":{"gazoile":{"item":"gazoile","label":"Gazoile","count":27},"petrole":{"item":"petrole","label":"Pétrole","count":10}},"accounts":{"dirtycash":0,"cash":503000}}'),
	(24, 'police', '{"accounts":{"cash":6992270,"dirtycash":3514024},"items":{"chargeur":{"count":13,"label":"Chargeur","item":"chargeur"},"jewels":{"count":230,"label":"Bijou","item":"jewels"},"police_key":{"count":1,"label":"Clefs de Menottes LSPD","item":"police_key"},"police_cuff":{"count":2,"label":"Menottes LSPD","item":"police_cuff"}},"weapons":{"840819":{"label":"Pied de biche","ammo":0,"name":"WEAPON_CROWBAR"},"121816":{"label":"Pistolet calibre 50","ammo":250,"name":"WEAPON_PISTOL50"},"79294":{"label":"Revolver","ammo":250,"name":"WEAPON_REVOLVER"},"942078":{"label":"Queue de billard","ammo":0,"name":"WEAPON_POOLCUE"},"320695":{"label":"Fusil avancé","ammo":250,"name":"WEAPON_ADVANCEDRIFLE"},"25193":{"label":"Queue de billard","ammo":0,"name":"WEAPON_POOLCUE"},"147864":{"label":"Pistolet","ammo":250,"name":"WEAPON_PISTOL"},"942298":{"label":"Smg","ammo":250,"name":"WEAPON_SMG"},"212501":{"label":"Pistolet","ammo":250,"name":"WEAPON_PISTOL"}}}'),
	(26, 'ambulance', '{"accounts":{"cash":8494802,"dirtycash":0},"items":{"pochoncodeine":{"count":9,"label":"Pochon de Codéine","item":"pochoncodeine"}},"weapons":{}}'),
	(27, 'garciafarm', '{"items":{"opiumtraitement":{"item":"opiumtraitement","label":"Pochon d\'opium","count":45}},"weapons":{"14069":{"ammo":250,"name":"WEAPON_PETROLCAN","label":"Jerrican d\'essence"}},"accounts":{"cash":0,"dirtycash":0}}'),
	(34, 'coffeezo', '{"weapons":{},"items":{},"accounts":{"dirtycash":0,"cash":51000}}'),
	(38, 'burger', '{"accounts":{"dirtycash":0,"cash":82800},"items":{"frites":{"item":"frites","label":"Frites","count":30},"orangina":{"item":"orangina","label":"Orangina","count":99},"phone":{"item":"phone","label":"Téléphone","count":5},"viande":{"item":"viande","label":"Viande","count":14},"bread":{"item":"bread","label":"Pain","count":40}},"weapons":[]}'),
	(39, 'carterorpailleur', '{"accounts":{"cash":16500,"dirtycash":0},"items":{"medikit":{"count":67,"label":"Medikit","item":"medikit"}},"weapons":{}}'),
	(40, 'hookah', '{"weapons":[],"items":{"weedtraitement":{"item":"weedtraitement","count":1,"label":"Pochon de Weed"},"aciertraitement":{"item":"aciertraitement","count":112,"label":"Acier Traité"},"methrecolte":{"item":"methrecolte","count":4,"label":"Méthamphétamine"},"acierrecolte":{"item":"acierrecolte","count":4,"label":"Acier"}},"accounts":{"cash":557000,"dirtycash":0}}'),
	(42, 'bikeshop', '{"accounts":{"dirtycash":0,"cash":338250},"weapons":[],"items":{"alcoolbrut":{"label":"Alcool Brut","item":"alcoolbrut","count":1},"opiumrecolte":{"label":"Opium","item":"opiumrecolte","count":3},"weedrecolte":{"label":"Weed","item":"weedrecolte","count":6},"heroinerecolte":{"label":"Héroine pure","item":"heroinerecolte","count":3},"chargeur":{"label":"Chargeur","item":"chargeur","count":1},"pochonCBD":{"label":"Pochon de CBD","item":"pochonCBD","count":43}}}'),
	(43, 'ecorp', '{"items":[],"weapons":[],"accounts":{"cash":1,"dirtycash":0}}'),
	(44, 'sheriff', '{"items":{},"weapons":{},"accounts":{"cash":123382,"dirtycash":0}}'),
	(45, 'ambulance', '{"accounts":{"cash":8494802,"dirtycash":0},"items":{"pochoncodeine":{"count":9,"label":"Pochon de Codéine","item":"pochoncodeine"}},"weapons":{}}'),
	(46, 'carshop', '{"accounts":{"cash":11860671,"dirtycash":0},"items":{"phone":{"count":1,"label":"Téléphone","item":"phone"},"jewels":{"count":1,"label":"Bijou","item":"jewels"}},"weapons":{}}'),
	(47, 'unicorn', '{"accounts":{"cash":45404,"dirtycash":0},"items":{"alcoolbrut":{"item":"alcoolbrut","label":"Alcool Brut","count":22}},"weapons":{"159980":{"name":"WEAPON_STUNGUN","label":"Tazer","ammo":250},"846192":{"name":"WEAPON_STUNGUN","label":"Tazer","ammo":250},"358740":{"name":"WEAPON_STUNGUN","label":"Tazer","ammo":250},"434373":{"name":"WEAPON_STUNGUN","label":"Tazer","ammo":250},"98791":{"name":"WEAPON_STUNGUN","label":"Tazer","ammo":250}}}'),
	(48, 'realestateagent', '{"items":{},"weapons":{},"accounts":{"cash":22500,"dirtycash":0}}'),
	(49, 'mecano', '{"items":{},"weapons":{},"accounts":{"cash":1200,"dirtycash":0}}'),
	(50, 'ballas', '{"weapons":{},"accounts":{"dirtycash":0,"cash":0},"items":{"purplehazetraitement":{"label":"Pochon De Purple Haze","item":"purplehazetraitement","count":17},"methrecolte":{"label":"Méthamphétamine","item":"methrecolte","count":9},"purplehazerecolte":{"label":"Purple Haze","item":"purplehazerecolte","count":19},"pneu":{"label":"Pneu","item":"pneu","count":1},"heroinerecolte":{"label":"Héroine pure","item":"heroinerecolte","count":7},"opiumtraitement":{"label":"Pochon d\'opium","item":"opiumtraitement","count":5},"alcoolbrut":{"label":"Alcool Brut","item":"alcoolbrut","count":1},"ecstasy":{"label":"Ecstasy","item":"ecstasy","count":7},"piluleoubli":{"label":"GHB","item":"piluleoubli","count":1},"opiumrecolte":{"label":"Opium","item":"opiumrecolte","count":133},"tequila":{"label":"Tequila","item":"tequila","count":9}}}'),
	(51, 'lostmc', '{"accounts":{"cash":0,"dirtycash":0},"weapons":{},"items":{}}'),
	(52, 'blackmarket', '{"items":{},"weapons":{},"accounts":{"cash":0,"dirtycash":0}}'),
	(53, 'hoova', '{"items":[],"weapons":[],"accounts":{"cash":0,"dirtycash":0}}'),
	(54, 'peakyblinders', '{"items":{"phone":{"item":"phone","label":"Téléphone","count":1},"opiumtraitement":{"item":"opiumtraitement","label":"Pochon d\'opium","count":50},"munition":{"item":"munition","label":"Munition","count":1},"acierrecolte":{"item":"acierrecolte","label":"Acier","count":42},"pochoncodeine":{"item":"pochoncodeine","label":"Pochon de Codéine","count":43},"cbd":{"item":"cbd","count":50,"label":"CBD"},"methtraitement":{"item":"methtraitement","count":20,"label":"Pochon de Méthamphétamine"},"cocainerecolte":{"item":"cocainerecolte","label":"Cocaïne","count":2},"cocainetraitement":{"item":"cocainetraitement","label":"Pochon de Cocaïne","count":125},"weedrecolte":{"item":"weedrecolte","count":67,"label":"Weed"},"pochonCBD":{"item":"pochonCBD","count":43,"label":"Pochon de CBD"}},"accounts":{"dirtycash":0,"cash":0},"weapons":[]}'),
	(55, 'Cali', '{"items":{"methtraitement":{"item":"methtraitement","label":"Pochon de Méthamphétamine","count":10},"cbd":{"item":"cbd","label":"CBD","count":1}},"weapons":[],"accounts":{"cash":430585,"dirtycash":0}}'),
	(56, 'families', '{"accounts":{"cash":400632,"dirtycash":1403587},"weapons":{"665198":{"name":"WEAPON_REVOLVER","ammo":250,"label":"Revolver"},"627902":{"name":"WEAPON_PISTOL","ammo":250,"label":"Pistolet"}},"items":{"opiumtraitement":{"label":"Pochon d\'opium","item":"opiumtraitement","count":6},"acierrecolte":{"label":"Acier","item":"acierrecolte","count":4},"pelle":{"label":"Pelle","item":"pelle","count":2},"opiumrecolte":{"label":"Opium","item":"opiumrecolte","count":30},"water":{"label":"Bouteille d\'eau","item":"water","count":1},"methrecolte":{"label":"Méthamphétamine","item":"methrecolte","count":66},"purplehazerecolte":{"label":"Purple Haze","item":"purplehazerecolte","count":3},"methtraitement":{"label":"Pochon de Méthamphétamine","item":"methtraitement","count":38},"ammoniac":{"label":"Ammoniac","item":"ammoniac","count":3},"aciertraitement":{"label":"Acier Traité","item":"aciertraitement","count":2}}}'),
	(57, 'vagos', '{"weapons":{},"items":{"acierrecolte":{"item":"acierrecolte","label":"Acier","count":40},"cocainerecolte":{"item":"cocainerecolte","label":"Cocaïne","count":48},"bread":{"item":"bread","label":"Pain","count":90},"phone":{"item":"phone","label":"Téléphone","count":1},"cocainetraitement":{"item":"cocainetraitement","label":"Pochon de Cocaïne","count":1},"chargeur":{"item":"chargeur","label":"Chargeur","count":291},"pochonCBD":{"item":"pochonCBD","label":"Pochon de CBD","count":70},"water":{"item":"water","label":"Bouteille d\'eau","count":92}},"accounts":{"cash":30076,"dirtycash":1338789}}'),
	(58, 'Bloods', '{"weapons":{},"items":{},"accounts":{"cash":0,"dirtycash":0}}'),
	(59, 'lapegre', '{"weapons":[],"items":{"opiumtraitement":{"label":"Pochon d\'opium","count":12,"item":"opiumtraitement"},"weedtraitement":{"label":"Pochon de Weed","count":24,"item":"weedtraitement"},"cocainetraitement":{"label":"Pochon de Cocaïne","count":25,"item":"cocainetraitement"},"munition":{"label":"Munition","count":2,"item":"munition"},"aluminium":{"label":"Aluminium","count":601,"item":"aluminium"},"radiateur":{"label":"Radiateur","count":4380,"item":"radiateur"},"icerecolte":{"label":"Ice","count":2,"item":"icerecolte"}},"accounts":{"dirtycash":0,"cash":0}}'),
	(60, 'Crips', '{"items":{"methtraitement":{"item":"methtraitement","label":"Pochon de Méthamphétamine","count":55},"codeine":{"item":"codeine","label":"Codéine","count":2},"opiumtraitement":{"item":"opiumtraitement","label":"Pochon d\'opium","count":7},"icerecolte":{"item":"icerecolte","label":"Ice","count":56},"cocainetraitement":{"item":"cocainetraitement","label":"Pochon de Cocaïne","count":253},"weedtraitement":{"item":"weedtraitement","label":"Pochon de Weed","count":58}},"weapons":[],"accounts":{"cash":0,"dirtycash":0}}'),
	(61, 'cosanostra', '{"weapons":{"679433":{"ammo":247,"name":"WEAPON_MICROSMG","label":"Micro smg"}},"items":{"frites":{"item":"frites","label":"Frites","count":90},"drill":{"item":"drill","label":"Perceuse","count":7},"bankcard":{"item":"bankcard","label":"Carte d\'accès Banque","count":7},"cagoule":{"item":"cagoule","label":"Cagoule","count":3},"chargeur":{"item":"chargeur","label":"Chargeur","count":20}},"accounts":{"cash":18955742,"dirtycash":19564403}}'),
	(62, 'marabunta', '{"accounts":{"dirtycash":0,"cash":0},"weapons":{},"items":{"cocainerecolte":{"label":"Cocaïne","count":137,"item":"cocainerecolte"},"opiumtraitement":{"label":"Pochon d\'opium","count":10,"item":"opiumtraitement"},"weedtraitement":{"label":"Pochon de Weed","count":2,"item":"weedtraitement"}}}'),
	(63, 'Predis', '{"items":{"methtraitement":{"item":"methtraitement","label":"Pochon de Méthamphétamine","count":31},"codeine":{"item":"codeine","label":"Codéine","count":9},"phone":{"item":"phone","label":"Téléphone","count":1},"methrecolte":{"item":"methrecolte","label":"Méthamphétamine","count":1},"opiumrecolte":{"item":"opiumrecolte","label":"Opium","count":31},"radio":{"item":"radio","label":"Radio","count":1},"pochonice":{"item":"pochonice","label":"pochon d\'ice","count":13},"acierrecolte":{"item":"acierrecolte","label":"Acier","count":1},"cocainetraitement":{"item":"cocainetraitement","label":"Pochon de Cocaïne","count":71},"icerecolte":{"item":"icerecolte","label":"Ice","count":29},"weedtraitement":{"item":"weedtraitement","label":"Pochon de Weed","count":26}},"weapons":{},"accounts":{"cash":0,"dirtycash":0}}'),
	(64, 'BMF', '{"weapons":{},"items":{"cocainerecolte":{"item":"cocainerecolte","count":12,"label":"Cocaïne"},"opiumrecolte":{"item":"opiumrecolte","count":67,"label":"Opium"},"opiumtraitement":{"item":"opiumtraitement","count":61,"label":"Pochon d\'opium"},"ecstasy":{"item":"ecstasy","count":10,"label":"Ecstasy"}},"accounts":{"dirtycash":3258000,"cash":4169562}}'),
	(66, 'radiafarm', '{"weapons":[],"items":{"cocainetraitement":{"item":"cocainetraitement","label":"Pochon de Cocaïne","count":32},"cocainerecolte":{"item":"cocainerecolte","label":"Cocaïne","count":6},"opiumrecolte":{"item":"opiumrecolte","label":"Opium","count":26},"methtraitement":{"item":"methtraitement","label":"Pochon de Méthamphétamine","count":23}},"accounts":{"dirtycash":0,"cash":106000}}'),
	(67, 'Tijuana', '{"items":{"methtraitement":{"item":"methtraitement","label":"Pochon de Méthamphétamine","count":34},"ecstasy":{"item":"ecstasy","label":"Ecstasy","count":126}},"weapons":{},"accounts":{"cash":0,"dirtycash":40548}}'),
	(68, 'Los Zetas', '{"items":[],"weapons":[],"accounts":{"cash":0,"dirtycash":0}}'),
	(69, 'loszetas', '{"accounts":{"cash":0,"dirtycash":76276},"weapons":{},"items":{"cocainetraitement":{"count":29,"label":"Pochon de Cocaïne","item":"cocainetraitement"}}}'),
	(70, 'bm', '{"items":{"cagoule":{"item":"cagoule","label":"Cagoule","count":2}},"weapons":{"271596":{"ammo":250,"name":"WEAPON_SMG","label":"Smg"},"331318":{"ammo":250,"name":"WEAPON_HEAVYPISTOL","label":"Pistolet lourd"},"814214":{"ammo":250,"name":"WEAPON_SMG","label":"Smg"},"126038":{"ammo":250,"name":"WEAPON_MINISMG","label":"Mini smg"},"840612":{"ammo":188,"name":"WEAPON_COMPACTRIFLE","label":"Fusil compact"}},"accounts":{"cash":300000,"dirtycash":16370477}}'),
	(71, 'michelin', '{"weapons":[],"items":{"acierrecolte":{"item":"acierrecolte","count":4,"label":"Acier"}},"accounts":{"dirtycash":0,"cash":4024549}}'),
	(72, 'taxi', '{"accounts":{"cash":1793766,"dirtycash":0},"items":{"jusfruit":{"count":10,"label":"Jus de fruits","item":"jusfruit"},"rhum":{"count":4,"label":"Rhum","item":"rhum"},"whisky":{"count":2,"label":"Whisky","item":"whisky"},"ketaminerecolte":{"count":2,"label":"Ketamine","item":"ketaminerecolte"}},"weapons":[]}'),
	(73, 'madrazo', '{"items":[],"weapons":[],"accounts":{"cash":0,"dirtycash":0}}'),
	(74, 'Narcomafia', '{"items":[],"weapons":[],"accounts":{"cash":0,"dirtycash":0}}'),
	(75, 'Medelin', '{"items":[],"weapons":[],"accounts":{"cash":0,"dirtycash":0}}'),
	(76, 'mafiacanios', '{"weapons":[],"items":{"methtraitement":{"item":"methtraitement","label":"Pochon de Méthamphétamine","count":5},"opiumtraitement":{"item":"opiumtraitement","label":"Pochon d\'opium","count":5},"weedtraitement":{"item":"weedtraitement","label":"Pochon de Weed","count":1}},"accounts":{"cash":0,"dirtycash":934911}}'),
	(77, 'chihuahua', '{"weapons":[],"accounts":{"cash":0,"dirtycash":0},"items":[]}'),
	(78, 'rodriguez', '{"weapons":{"541539":{"label":"Revolver","name":"WEAPON_REVOLVER","ammo":250},"311552":{"label":"Revolver","name":"WEAPON_REVOLVER","ammo":250},"576176":{"label":"Revolver","name":"WEAPON_REVOLVER","ammo":250},"96725":{"label":"Revolver","name":"WEAPON_REVOLVER","ammo":250},"948961":{"label":"Revolver","name":"WEAPON_REVOLVER","ammo":250},"964872":{"label":"Revolver","name":"WEAPON_REVOLVER","ammo":250}},"items":[],"accounts":{"dirtycash":0,"cash":0}}'),
	(79, 'LaMainNoir', '{"accounts":{"cash":0,"dirtycash":100292},"items":{"water":{"count":61,"label":"Bouteille d\'eau","item":"water"},"hotdog":{"count":68,"label":"Hot Dog","item":"hotdog"},"radio":{"count":1,"label":"Radio","item":"radio"},"bandage":{"count":2,"label":"Bandage","item":"bandage"},"medikit":{"count":21,"label":"Medikit","item":"medikit"},"phone":{"count":2,"label":"Téléphone","item":"phone"}},"weapons":{"845524":{"label":"Micro smg","ammo":239,"name":"WEAPON_MICROSMG"},"54581":{"label":"Mini smg","ammo":250,"name":"WEAPON_MINISMG"}}}'),
	(80, '667_ekip', '{"accounts":{"cash":0,"dirtycash":209326},"items":{"weedrecolte":{"count":8,"label":"Weed","item":"weedrecolte"},"phone":{"count":3,"label":"Téléphone","item":"phone"},"weedtraitement":{"count":6,"label":"Pochon de Weed","item":"weedtraitement"},"methtraitement":{"count":7,"label":"Pochon de Méthamphétamine","item":"methtraitement"},"aciertraitement":{"count":1600,"label":"Acier Traité","item":"aciertraitement"},"bois":{"count":60,"label":"Buche de Bois","item":"bois"},"water":{"count":6,"label":"Bouteille d\'eau","item":"water"},"pochoncodeine":{"count":1,"label":"Pochon de Codéine","item":"pochoncodeine"},"methrecolte":{"count":6,"label":"Méthamphétamine","item":"methrecolte"},"pelle":{"count":1,"label":"Pelle","item":"pelle"}},"weapons":{}}'),
	(81, 'lescanaux', '{"weapons":[],"accounts":{"cash":0,"dirtycash":0},"items":[]}'),
	(82, 'Aucun', '{"weapons":[],"accounts":{"cash":0,"dirtycash":0},"items":[]}'),
	(83, 'Aucun', '{"weapons":[],"accounts":{"cash":0,"dirtycash":0},"items":[]}'),
	(84, 'Aucun', '{"weapons":[],"accounts":{"cash":0,"dirtycash":0},"items":[]}'),
	(85, 'Aucun', '{"weapons":[],"accounts":{"cash":0,"dirtycash":0},"items":[]}'),
	(86, 'Aucun', '{"weapons":[],"accounts":{"cash":0,"dirtycash":0},"items":[]}'),
	(87, 'jeanneymar', '{"weapons":[],"accounts":{"cash":0,"dirtycash":0},"items":[]}');
/*!40000 ALTER TABLE `society` ENABLE KEYS */;

-- Dumping structure for table bluestark.society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `society` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.society_moneywash: ~0 rows (approximately)
/*!40000 ALTER TABLE `society_moneywash` DISABLE KEYS */;
/*!40000 ALTER TABLE `society_moneywash` ENABLE KEYS */;

-- Dumping structure for table bluestark.staff_reports
CREATE TABLE IF NOT EXISTS `staff_reports` (
  `identifier` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.staff_reports: ~1 rows (approximately)
/*!40000 ALTER TABLE `staff_reports` DISABLE KEYS */;
REPLACE INTO `staff_reports` (`identifier`, `name`, `count`) VALUES
	('license:676c7031a7e3c4b1fe6d534ebfbfe1ae4af49d16', 'User', 1);
/*!40000 ALTER TABLE `staff_reports` ENABLE KEYS */;

-- Dumping structure for table bluestark.tebex_accounts
CREATE TABLE IF NOT EXISTS `tebex_accounts` (
  `steam` varchar(50) NOT NULL DEFAULT '0',
  `fivem` varchar(50) NOT NULL DEFAULT '0',
  `vip` tinyint(4) NOT NULL DEFAULT 0,
  `expiration` int(255) NOT NULL DEFAULT 0,
  PRIMARY KEY (`steam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.tebex_accounts: ~0 rows (approximately)
/*!40000 ALTER TABLE `tebex_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tebex_accounts` ENABLE KEYS */;

-- Dumping structure for table bluestark.tebex_commands
CREATE TABLE IF NOT EXISTS `tebex_commands` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fivem` varchar(50) NOT NULL DEFAULT '0',
  `command` varchar(50) NOT NULL DEFAULT '0',
  `argument` varchar(50) NOT NULL DEFAULT '0',
  `transaction` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.tebex_commands: ~0 rows (approximately)
/*!40000 ALTER TABLE `tebex_commands` DISABLE KEYS */;
/*!40000 ALTER TABLE `tebex_commands` ENABLE KEYS */;

-- Dumping structure for table bluestark.tebex_fidelite
CREATE TABLE IF NOT EXISTS `tebex_fidelite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(255) NOT NULL DEFAULT '0',
  `havebuy` int(11) NOT NULL DEFAULT 0,
  `totalbuy` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.tebex_fidelite: ~55 rows (approximately)
/*!40000 ALTER TABLE `tebex_fidelite` DISABLE KEYS */;
REPLACE INTO `tebex_fidelite` (`id`, `license`, `havebuy`, `totalbuy`) VALUES
	(1, 'license:676c7031a7e3c4b1fe6d534ebfbfe1ae4af49d16', 0, 0),
	(2, 'license:01b9eff04a01a7c8323354399d699764c24cb7d7', 0, 0),
	(3, 'license:222c46fedf9fa74880e63ab731894be3fb57c497', 0, 0),
	(4, 'license:043f73f4798aed626c424694b0906308ec92ff57', 0, 0),
	(5, 'license:4d292c606a1a81d2aa4d0b4a9c49672d181b584b', 0, 0),
	(6, 'license:3b812812ad65ece34da9a84c3d7aa2bb1257f2a7', 0, 0),
	(7, 'license:521045187680e125d6b9fb3f7f8e035bb1c3a1bc', 0, 0),
	(8, 'license:6721de1bfa6ecbee9c42da164dd605ab12a5888b', 0, 0),
	(9, 'license:e464bd067da5d5e39ce2a3356afeb1b02c812120', 0, 0),
	(10, 'license:e2de678052207ebcd04958796c64c342b52d881b', 0, 0),
	(11, 'license:84bf89ec01ebc2beebd249d27a292d485af7a22d', 0, 0),
	(12, 'license:447dea642a5a99636e9d66ae0607fbf35563d3d2', 0, 0),
	(13, 'license:4d3d0f2b343cdf45ff0b7089a4859ea99e183cfa', 0, 0),
	(14, 'license:3990e692cecfc4935f9d1af7311017c90e9475d2', 0, 0),
	(15, 'license:4b4fcf49c6967afd572191f73919f593bcf6d4c2', 0, 0),
	(16, 'license:d5978481098e92d4daafbbef17620e54dec79196', 0, 0),
	(17, 'license:c48b0294f78a28f6f264a7adfa68a5b3f4cdc4f9', 0, 0),
	(18, 'license:c036013c3d6f5a5e951dfc69633cdbc51ddf4232', 0, 0),
	(19, 'license:697abf7a9220e04e5568b31ce0a1c2d7c254aef0', 0, 0),
	(20, 'license:840e2bbb73619a49876134911513efcd6e975c6c', 0, 0),
	(21, 'license:afaba2ad9bca10e18363adece691fdecbcababee', 0, 0),
	(22, 'license:d7b1a029b3e0d095633bb27dc9f31e5ac130ca62', 0, 0),
	(23, 'license:23eb122fbc001b121afd443767a90c32ce8d58b2', 0, 0),
	(24, 'license:17f2b8a5c19f26e1e136c114dfe204bc708ee87e', 0, 0),
	(25, 'license:74722e5d83c23057107334ec41dc2c5539369201', 0, 0),
	(26, 'license:1543c0430465cae3b2710706634749fbcfd7c567', 0, 0),
	(27, 'license:f5788bac547691e212faa76eb9e71f46da796d50', 0, 0),
	(28, 'license:5b545b297e209cdabcc80b0d8644571fd87de093', 0, 0),
	(29, 'license:d9725f63efe9d0d53a0883c78cb79f14db186780', 0, 0),
	(30, 'license:8b2dd308c0f10d32e5a363e13f7d1d016161668f', 0, 0),
	(31, 'license:a0e80b30c01ed966e9e9af43980587c7b526bace', 0, 0),
	(32, 'license:d4e9cbeaacc2b0ce1d1c8ce7f53ee71b8183867c', 0, 0),
	(33, 'license:efd104ae3a0f12892e88c17f63c0d08cd80f2b49', 0, 0),
	(34, 'license:17d8f0a88f62475eac0559a09a7a06355ba9b2ec', 0, 0),
	(35, 'license:6b4fbc2620bf3fe8fe144b88ecde934e50ac49c9', 0, 0),
	(36, 'license:44730fcd67e41f528b8916be9fdce29964561530', 0, 0),
	(37, 'license:07091b465a1b387c8a6d6968d6c841dcaeae2d57', 0, 0),
	(38, 'license:cf5d504aad8457773961dd28b37ce37e16db8923', 0, 0),
	(39, 'license:c33553d0860e631beb5586d1947bb3ccdbdb4ce4', 0, 0),
	(40, 'license:ca1d88031d0d25bcca2ab217cbe329177c25cff9', 0, 0),
	(41, 'license:5203102308639a36633cfce5e4a45ac9bab82a93', 0, 0),
	(42, 'license:63b7781c2a1bc429c70113ad64f73ae69ce0a789', 0, 0),
	(43, 'license:5e6b1e3c9912bca10bbf0a2258cab659480d5e21', 0, 0),
	(44, 'license:42514dcf5b5f34d8d249a01f66ccdffec3f74833', 0, 0),
	(45, 'license:e8a849c4ebb701efb4f651c6bf596d80252cad42', 0, 0),
	(46, 'license:f57cbaffc364f51fc165f2a95dad2b59b43aa3c8', 0, 0),
	(47, 'license:33d330aae30191a8ae6fe52c2015d5a6576f3d59', 0, 0),
	(48, 'license:08bee9809c7e7f8bfdcd7b840afc08b58279f780', 0, 0),
	(49, 'license:5839bd0648b6519bb31d5e395685d41d4b96cf35', 0, 0),
	(50, 'license:80019cf46f860351cfd79dc1d174f4e52f234034', 0, 0),
	(51, 'license:e7b2e663bbf6a24a12b25818893434f812b9c45b', 0, 0),
	(52, 'license:4108734c231c4d79813c0dba44ad9533d79b2bcc', 0, 0),
	(53, 'license:4e2da4d529d2cc3f1c508c526e90d3158e921f98', 0, 0),
	(54, 'license:0952c2029a28248d70dc879a193c1b91aa5475fe', 0, 0),
	(55, 'license:12374a551ca0dc681bed492fe4cd1fc449f757c7', 0, 0);
/*!40000 ALTER TABLE `tebex_fidelite` ENABLE KEYS */;

-- Dumping structure for table bluestark.tebex_logs_commands
CREATE TABLE IF NOT EXISTS `tebex_logs_commands` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fivem` varchar(50) NOT NULL DEFAULT '0',
  `command` varchar(50) NOT NULL DEFAULT '0',
  `argument` varchar(50) NOT NULL DEFAULT '0',
  `transaction` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.tebex_logs_commands: ~0 rows (approximately)
/*!40000 ALTER TABLE `tebex_logs_commands` DISABLE KEYS */;
/*!40000 ALTER TABLE `tebex_logs_commands` ENABLE KEYS */;

-- Dumping structure for table bluestark.tebex_players_wallet
CREATE TABLE IF NOT EXISTS `tebex_players_wallet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifiers` text NOT NULL,
  `transaction` text DEFAULT NULL,
  `price` text NOT NULL,
  `currency` text DEFAULT NULL,
  `points` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.tebex_players_wallet: ~0 rows (approximately)
/*!40000 ALTER TABLE `tebex_players_wallet` DISABLE KEYS */;
/*!40000 ALTER TABLE `tebex_players_wallet` ENABLE KEYS */;

-- Dumping structure for table bluestark.tinder_accounts
CREATE TABLE IF NOT EXISTS `tinder_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL DEFAULT '0',
  `pp` text NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `gender` varchar(50) NOT NULL,
  `targetGender` varchar(50) NOT NULL DEFAULT '0',
  `hobbies` varchar(50) NOT NULL DEFAULT '0',
  `age` varchar(50) NOT NULL DEFAULT '0',
  `description` varchar(50) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.tinder_accounts: ~0 rows (approximately)
/*!40000 ALTER TABLE `tinder_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `tinder_accounts` ENABLE KEYS */;

-- Dumping structure for table bluestark.tinder_likes
CREATE TABLE IF NOT EXISTS `tinder_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(1024) NOT NULL,
  `likeds` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.tinder_likes: ~0 rows (approximately)
/*!40000 ALTER TABLE `tinder_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `tinder_likes` ENABLE KEYS */;

-- Dumping structure for table bluestark.tinder_messages
CREATE TABLE IF NOT EXISTS `tinder_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `messages` varchar(1024) DEFAULT '{}',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.tinder_messages: ~0 rows (approximately)
/*!40000 ALTER TABLE `tinder_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `tinder_messages` ENABLE KEYS */;

-- Dumping structure for table bluestark.truck_inventory
CREATE TABLE IF NOT EXISTS `truck_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `type` varchar(100) COLLATE utf8mb4_bin NOT NULL,
  `count` int(11) NOT NULL,
  `plate` varchar(8) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `item` (`item`,`plate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.truck_inventory: ~0 rows (approximately)
/*!40000 ALTER TABLE `truck_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `truck_inventory` ENABLE KEYS */;

-- Dumping structure for table bluestark.twitter_account
CREATE TABLE IF NOT EXISTS `twitter_account` (
  `id` varchar(90) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.twitter_account: ~0 rows (approximately)
/*!40000 ALTER TABLE `twitter_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_account` ENABLE KEYS */;

-- Dumping structure for table bluestark.twitter_accounts
CREATE TABLE IF NOT EXISTS `twitter_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.twitter_accounts: ~0 rows (approximately)
/*!40000 ALTER TABLE `twitter_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_accounts` ENABLE KEYS */;

-- Dumping structure for table bluestark.twitter_hashtags
CREATE TABLE IF NOT EXISTS `twitter_hashtags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `created` varchar(50) NOT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.twitter_hashtags: ~0 rows (approximately)
/*!40000 ALTER TABLE `twitter_hashtags` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_hashtags` ENABLE KEYS */;

-- Dumping structure for table bluestark.twitter_likes
CREATE TABLE IF NOT EXISTS `twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_twitter_likes_twitter_accounts` (`authorId`) USING BTREE,
  KEY `FK_twitter_likes_twitter_tweets` (`tweetId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.twitter_likes: ~0 rows (approximately)
/*!40000 ALTER TABLE `twitter_likes` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_likes` ENABLE KEYS */;

-- Dumping structure for table bluestark.twitter_mentions
CREATE TABLE IF NOT EXISTS `twitter_mentions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_tweet` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `mentioned` text NOT NULL,
  `created` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.twitter_mentions: ~0 rows (approximately)
/*!40000 ALTER TABLE `twitter_mentions` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_mentions` ENABLE KEYS */;

-- Dumping structure for table bluestark.twitter_tweets
CREATE TABLE IF NOT EXISTS `twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK_twitter_tweets_twitter_accounts` (`authorId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table bluestark.twitter_tweets: ~0 rows (approximately)
/*!40000 ALTER TABLE `twitter_tweets` DISABLE KEYS */;
/*!40000 ALTER TABLE `twitter_tweets` ENABLE KEYS */;

-- Dumping structure for table bluestark.users
CREATE TABLE IF NOT EXISTS `users` (
  `character_id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `discord` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `fivem` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `permission_group` varchar(50) COLLATE utf8mb4_bin DEFAULT 'user',
  `permission_level` int(11) DEFAULT 0,
  `position` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `skin` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `accounts` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `inventory` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `loadout` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `job` varchar(50) COLLATE utf8mb4_bin DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `job2` varchar(50) COLLATE utf8mb4_bin DEFAULT 'unemployed2',
  `job2_grade` int(11) DEFAULT 0,
  `status` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `last_property` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `dateofbirth` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `sex` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `height` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `phone_number` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `animations` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `jail_time` int(25) DEFAULT 0,
  `xp` int(11) DEFAULT 1,
  `IDIG` int(11) DEFAULT 0,
  `armour` int(55) DEFAULT 0,
  `vie` int(55) DEFAULT 200,
  `apps` text COLLATE utf8mb4_bin DEFAULT NULL,
  `widget` text COLLATE utf8mb4_bin DEFAULT NULL,
  `bt` text COLLATE utf8mb4_bin DEFAULT NULL,
  `charinfo` text COLLATE utf8mb4_bin DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_bin DEFAULT NULL,
  `cryptocurrency` longtext COLLATE utf8mb4_bin DEFAULT NULL,
  `cryptocurrencytransfers` text COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`character_id`),
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.users: ~55 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`character_id`, `identifier`, `discord`, `fivem`, `permission_group`, `permission_level`, `position`, `skin`, `accounts`, `inventory`, `loadout`, `job`, `job_grade`, `job2`, `job2_grade`, `status`, `last_property`, `firstname`, `lastname`, `dateofbirth`, `sex`, `height`, `phone_number`, `animations`, `jail_time`, `xp`, `IDIG`, `armour`, `vie`, `apps`, `widget`, `bt`, `charinfo`, `metadata`, `cryptocurrency`, `cryptocurrencytransfers`) VALUES
	(4, 'license:043f73f4798aed626c424694b0906308ec92ff57', NULL, NULL, 'user', 0, '{"x":1945.5,"z":78.4000015258789,"y":-930.7999877929688}', '{"makeup_3":0,"eyebrows_5":0,"bproof_1":0,"hair_color_1":0,"chain_2":0,"mask_2":0,"hair_2":0,"complexion_1":0,"chest_2":0,"blemishes_2":0,"bracelets_2":0,"beard_3":0,"arms_2":0,"age_1":0,"eyebrows_2":0,"watches_1":-1,"tshirt_2":0,"bodyb_1":-1,"shoes_1":35,"shoes_2":9,"lipstick_4":0,"moles_2":0,"sun_1":0,"torso_2":0,"nose_2":0,"bodyb_4":0,"makeup_1":0,"sex":0,"nose_3":0,"chin_4":0,"watches_2":0,"neck_thickness":0,"bags_2":0,"eyebrows_3":0,"eye_color":27,"torso_1":505,"chin_3":0,"blemishes_1":0,"moles_1":0,"bracelets_1":-1,"pants_1":191,"lipstick_1":0,"mom":3,"helmet_1":-1,"chain_1":0,"chin_1":0,"cheeks_2":0,"age_2":0,"lipstick_3":0,"beard_4":0,"makeup_2":0,"eyebrows_1":66,"complexion_2":0,"dad":3,"mask_1":0,"skin_md_weight":50,"blush_2":0,"hair_1":5,"bags_1":0,"lip_thickness":0,"nose_1":0,"beard_1":6,"helmet_2":0,"lipstick_2":0,"nose_6":0,"glasses_1":0,"bproof_2":0,"ears_2":0,"jaw_1":0,"beard_2":0,"hair_color_2":0,"nose_5":0,"tshirt_1":15,"blush_1":0,"cheeks_3":0,"eye_squint":0,"glasses_2":0,"blush_3":0,"ears_1":-1,"chest_1":0,"face_md_weight":50,"decals_2":0,"bodyb_3":-1,"decals_1":0,"bodyb_2":0,"nose_4":0,"makeup_4":0,"chest_3":0,"pants_2":0,"chin_2":0,"cheeks_1":0,"sun_2":0,"jaw_2":0,"arms":1,"eyebrows_6":0,"eyebrows_4":0}', '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[{"name":"bread","count":5},{"name":"water","count":5},{"name":"phone","count":1}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"name":"hunger","percent":97.03,"val":970300},{"name":"thirst","percent":97.03,"val":970300},{"name":"drunk","percent":0.0,"val":0},{"name":"drug","percent":0.0,"val":0}]', NULL, 'Xavier', 'DupontLigones', '78', 'm', '999999999999999', '360-1831', NULL, 0, 1, 0, 0, 199, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 'license:4d292c606a1a81d2aa4d0b4a9c49672d181b584b', NULL, NULL, 'user', 0, '{"x":-37.70000076293945,"z":26.70000076293945,"y":-1101.699951171875}', '{"jaw_2":0,"eyebrows_5":0,"helmet_2":0,"hair_color_1":0,"chain_2":0,"mask_2":0,"hair_2":0,"cheeks_3":0,"chest_2":0,"complexion_2":0,"bracelets_2":0,"beard_3":0,"lipstick_2":0,"age_1":0,"eyebrows_2":0,"watches_1":-1,"tshirt_2":0,"bodyb_1":-1,"shoes_1":8,"shoes_2":0,"lipstick_4":0,"moles_2":0,"sun_1":0,"torso_2":0,"nose_2":0,"decals_1":0,"makeup_1":0,"sex":0,"nose_3":0,"chin_4":0,"watches_2":0,"neck_thickness":0,"bags_2":0,"eyebrows_3":0,"eye_color":0,"torso_1":119,"chin_3":0,"blemishes_1":0,"decals_2":0,"chin_2":0,"pants_1":10,"nose_6":0,"chin_1":0,"helmet_1":-1,"chain_1":0,"beard_1":0,"eyebrows_1":0,"age_2":0,"lipstick_3":0,"beard_4":0,"makeup_2":0,"complexion_1":0,"eyebrows_4":0,"bproof_1":0,"mask_1":0,"skin_md_weight":50,"blush_2":0,"hair_1":0,"bodyb_2":0,"lip_thickness":0,"arms_2":0,"makeup_3":0,"blush_1":0,"ears_1":-1,"bodyb_4":0,"glasses_1":0,"bproof_2":0,"bags_1":0,"jaw_1":0,"beard_2":0,"hair_color_2":0,"nose_5":0,"tshirt_1":15,"moles_1":0,"blemishes_2":0,"eye_squint":0,"glasses_2":0,"blush_3":0,"chest_1":0,"chest_3":0,"face_md_weight":50,"mom":21,"bodyb_3":-1,"bracelets_1":-1,"cheeks_2":0,"nose_4":0,"makeup_4":0,"cheeks_1":0,"pants_2":0,"sun_2":0,"nose_1":0,"lipstick_1":0,"dad":0,"arms":1,"eyebrows_6":0,"ears_2":0}', '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[{"name":"bread","count":5},{"name":"water","count":5},{"name":"phone","count":1}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"name":"hunger","percent":98.965,"val":989650},{"name":"thirst","percent":98.965,"val":989650},{"name":"drunk","percent":0.0,"val":0},{"name":"drug","percent":0.0,"val":0}]', NULL, 'LE CON', 'DE TES MORT', '20', 'm', '180', '842-3860', NULL, 0, 1, 0, 0, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(7, 'license:521045187680e125d6b9fb3f7f8e035bb1c3a1bc', NULL, NULL, 'user', 0, '{"x":-498.1000061035156,"y":-992.2000122070313,"z":23.5}', '{"nose_4":0,"arms_2":0,"age_1":0,"beard_2":0,"ears_2":0,"tshirt_2":0,"torso_1":119,"lipstick_3":0,"hair_1":2,"shoes_1":8,"hair_color_2":0,"moles_2":0,"makeup_1":0,"glasses_1":0,"chin_3":0,"complexion_1":0,"bproof_2":0,"bags_1":0,"bodyb_4":0,"watches_1":-1,"chest_2":0,"arms":1,"bags_2":0,"cheeks_1":0,"glasses_2":0,"bodyb_1":-1,"eyebrows_5":0,"eye_squint":0,"eye_color":0,"torso_2":0,"bproof_1":0,"skin_md_weight":50,"neck_thickness":0,"beard_4":0,"complexion_2":0,"lip_thickness":0,"mask_2":0,"bracelets_2":0,"chest_1":0,"face_md_weight":50,"cheeks_2":0,"eyebrows_4":0,"sun_1":0,"blush_2":0,"eyebrows_1":0,"nose_6":0,"bodyb_2":0,"nose_3":0,"chain_2":0,"ears_1":-1,"age_2":0,"pants_1":10,"chin_2":0,"sex":0,"pants_2":0,"watches_2":0,"helmet_1":-1,"blemishes_2":0,"chain_1":0,"dad":0,"blemishes_1":0,"bracelets_1":-1,"lipstick_1":0,"moles_1":0,"chest_3":0,"sun_2":0,"mask_1":0,"makeup_2":0,"bodyb_3":-1,"lipstick_4":0,"makeup_3":0,"nose_1":0,"decals_2":0,"mom":21,"hair_2":0,"makeup_4":0,"blush_3":0,"shoes_2":0,"helmet_2":0,"eyebrows_2":0,"jaw_1":0,"beard_1":0,"beard_3":0,"tshirt_1":15,"blush_1":0,"decals_1":0,"eyebrows_3":0,"eyebrows_6":0,"jaw_2":0,"nose_5":0,"lipstick_2":0,"chin_1":0,"hair_color_1":0,"cheeks_3":0,"chin_4":0,"nose_2":0}', '[{"name":"cash","money":25000},{"name":"dirtycash","money":0},{"name":"bank","money":49725},{"name":"chip","money":0},{"name":"fidelcoins","money":0}]', '[{"name":"water","count":5},{"name":"bread","count":5},{"name":"phone","count":1}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"val":952500,"name":"hunger","percent":95.25},{"val":952500,"name":"thirst","percent":95.25},{"val":0,"name":"drunk","percent":0.0},{"val":0,"name":"drug","percent":0.0}]', NULL, 'ddd', 'dd', '10', 'm', '180', '214-7017', NULL, 0, 1, 0, 0, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(10, 'license:6721de1bfa6ecbee9c42da164dd605ab12a5888b', NULL, NULL, 'user', 0, '{"x":-785.4000244140625,"y":343.29998779296877,"z":216.8000030517578}', NULL, '[{"name":"cash","money":25000},{"name":"dirtycash","money":0},{"name":"bank","money":50000},{"name":"chip","money":0},{"name":"fidelcoins","money":0}]', '[]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"val":998550,"name":"hunger","percent":99.855},{"val":998550,"name":"thirst","percent":99.855},{"val":0,"name":"drunk","percent":0.0},{"val":0,"name":"drug","percent":0.0}]', NULL, NULL, NULL, NULL, NULL, NULL, '504-3550', NULL, 0, 1, 0, 0, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 'license:e464bd067da5d5e39ce2a3356afeb1b02c812120', NULL, NULL, 'user', 0, '{"x":-785.4000244140625,"y":343.1000061035156,"z":216.8000030517578}', NULL, '[{"name":"cash","money":25000},{"name":"dirtycash","money":0},{"name":"bank","money":50000},{"name":"chip","money":0},{"name":"fidelcoins","money":0}]', '[]', '[]', 'unemployed', 0, 'unemployed2', 0, '[]', NULL, NULL, NULL, NULL, NULL, NULL, '366-4795', NULL, 0, 1, 0, 0, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(12, 'license:e2de678052207ebcd04958796c64c342b52d881b', NULL, NULL, 'user', 0, '{"x":-785.4000244140625,"y":343.29998779296877,"z":216.8000030517578}', NULL, '[{"name":"cash","money":25000},{"name":"dirtycash","money":0},{"name":"bank","money":50000},{"name":"chip","money":0},{"name":"fidelcoins","money":0}]', '[]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"name":"hunger","val":998650,"percent":99.86500000000001},{"name":"thirst","val":998650,"percent":99.86500000000001},{"name":"drunk","val":0,"percent":0.0},{"name":"drug","val":0,"percent":0.0}]', NULL, NULL, NULL, NULL, NULL, NULL, '325-5290', NULL, 0, 1, 0, 0, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(13, 'license:84bf89ec01ebc2beebd249d27a292d485af7a22d', NULL, NULL, 'user', 0, '{"x":64.5999984741211,"y":-1126.9000244140626,"z":28.70000076293945}', '{"beard_4":0,"ears_1":-1,"cheeks_2":0,"sun_1":0,"arms":0,"age_1":0,"dad":0,"makeup_1":0,"nose_1":0,"nose_2":0,"sun_2":0,"beard_2":0,"hair_1":0,"decals_1":0,"cheeks_3":0,"glasses_1":0,"bodyb_4":0,"watches_1":-1,"blush_2":0,"cheeks_1":0,"lipstick_4":0,"bproof_2":0,"eyebrows_1":0,"bracelets_1":-1,"mask_1":0,"pants_1":0,"neck_thickness":0,"chain_1":0,"jaw_2":0,"torso_2":0,"helmet_2":0,"blemishes_1":0,"complexion_1":0,"eye_color":0,"beard_1":0,"eyebrows_2":0,"chest_1":0,"eyebrows_4":0,"hair_color_2":0,"hair_2":0,"nose_5":0,"bodyb_3":-1,"shoes_2":0,"complexion_2":0,"lipstick_2":0,"lipstick_3":0,"skin_md_weight":50,"moles_2":0,"makeup_4":0,"mask_2":0,"chain_2":0,"bracelets_2":0,"face_md_weight":50,"moles_1":0,"decals_2":0,"torso_1":0,"blush_1":0,"age_2":0,"bags_1":0,"mom":21,"arms_2":0,"bags_2":0,"nose_3":0,"hair_color_1":0,"watches_2":0,"eyebrows_3":0,"bodyb_1":-1,"makeup_3":0,"tshirt_2":0,"bodyb_2":0,"chin_4":0,"chin_1":0,"nose_6":0,"ears_2":0,"beard_3":0,"eyebrows_6":0,"lip_thickness":0,"bproof_1":0,"shoes_1":0,"helmet_1":-1,"chest_2":0,"jaw_1":0,"blemishes_2":0,"blush_3":0,"chest_3":0,"sex":0,"eye_squint":0,"tshirt_1":0,"makeup_2":0,"lipstick_1":0,"nose_4":0,"pants_2":0,"chin_3":0,"eyebrows_5":0,"glasses_2":0,"chin_2":0}', '[{"name":"cash","money":25000},{"name":"dirtycash","money":0},{"name":"bank","money":50000},{"name":"chip","money":0},{"name":"fidelcoins","money":0}]', '[{"name":"bread","count":5},{"name":"water","count":5},{"name":"phone","count":1}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"val":974750,"name":"hunger","percent":97.475},{"val":974750,"name":"thirst","percent":97.475},{"val":0,"name":"drunk","percent":0.0},{"val":0,"name":"drug","percent":0.0}]', NULL, 'darling', 'perez', '20', 'm', '150', '654-2460', NULL, 0, 1, 0, 0, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(14, 'license:447dea642a5a99636e9d66ae0607fbf35563d3d2', NULL, NULL, 'user', 0, '{"x":152.8000030517578,"y":-1001.4000244140625,"z":-99.0}', '{"moles_2":0,"ears_1":-1,"cheeks_2":0,"nose_6":0,"arms":0,"age_1":0,"dad":6,"makeup_1":0,"nose_1":0,"hair_color_1":0,"sun_2":0,"beard_2":0,"hair_1":0,"lip_thickness":0,"skin_md_weight":50,"glasses_1":0,"bodyb_4":0,"watches_1":-1,"blush_2":0,"cheeks_1":0,"lipstick_4":0,"bproof_2":0,"eyebrows_1":0,"bracelets_1":-1,"mask_1":0,"pants_1":61,"neck_thickness":0,"chain_1":28,"jaw_2":0,"torso_2":0,"helmet_2":0,"blemishes_1":0,"ears_2":0,"eye_color":0,"beard_1":0,"eyebrows_2":0,"chest_3":0,"mask_2":0,"blemishes_2":0,"hair_2":0,"nose_4":0,"tshirt_2":0,"shoes_2":0,"complexion_2":0,"tshirt_1":15,"chest_1":0,"sun_1":0,"eyebrows_6":0,"makeup_4":0,"cheeks_3":0,"age_2":0,"bracelets_2":0,"lipstick_2":0,"bodyb_1":-1,"eyebrows_5":0,"bodyb_3":-1,"moles_1":0,"hair_color_2":0,"bags_1":0,"mom":21,"arms_2":0,"bags_2":0,"chain_2":0,"makeup_3":0,"blush_3":0,"chin_1":0,"lipstick_3":0,"beard_4":0,"complexion_1":0,"bodyb_2":0,"chin_4":0,"eyebrows_3":0,"nose_3":0,"eyebrows_4":0,"jaw_1":0,"beard_3":0,"decals_1":0,"bproof_1":0,"shoes_1":28,"chin_2":0,"chest_2":0,"face_md_weight":50,"watches_2":0,"helmet_1":-1,"torso_1":254,"sex":0,"eye_squint":0,"nose_2":0,"makeup_2":0,"lipstick_1":0,"nose_5":0,"pants_2":0,"chin_3":0,"blush_1":0,"glasses_2":0,"decals_2":0}', '[{"name":"cash","money":25000},{"name":"dirtycash","money":0},{"name":"bank","money":50000},{"name":"chip","money":0},{"name":"fidelcoins","money":0}]', '[{"name":"bread","count":5},{"name":"water","count":5},{"name":"phone","count":1}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"val":991350,"name":"hunger","percent":99.13499999999999},{"val":991350,"name":"thirst","percent":99.13499999999999},{"val":0,"name":"drunk","percent":0.0},{"val":0,"name":"drug","percent":0.0}]', NULL, 'BLC', 'BLC', '32', 'm', '190', '960-4731', NULL, 0, 1, 0, 0, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(15, 'license:4d3d0f2b343cdf45ff0b7089a4859ea99e183cfa', NULL, NULL, 'user', 0, '{"x":155.5,"y":-1017.2999877929688,"z":29.39999961853027}', '{"beard_4":0,"ears_1":-1,"cheeks_2":0,"eyebrows_6":0,"arms":0,"age_1":0,"dad":4,"makeup_1":0,"nose_1":0,"hair_color_1":0,"sun_2":0,"beard_2":0,"hair_1":2,"lip_thickness":0,"cheeks_3":0,"glasses_1":0,"bodyb_4":0,"watches_1":-1,"blush_2":0,"cheeks_1":0,"lipstick_4":0,"bproof_2":0,"eyebrows_1":1,"bracelets_1":-1,"mask_1":0,"pants_1":61,"neck_thickness":0,"chain_1":28,"jaw_2":0,"blush_3":0,"helmet_2":0,"blemishes_1":0,"blush_1":0,"eye_color":12,"eyebrows_3":0,"bodyb_1":-1,"sun_1":0,"face_md_weight":50,"beard_1":1,"hair_2":0,"tshirt_1":15,"nose_4":0,"shoes_2":0,"complexion_2":0,"moles_2":0,"chest_1":0,"lipstick_3":0,"watches_2":0,"makeup_4":0,"nose_6":0,"chest_3":0,"bracelets_2":0,"mask_2":0,"decals_2":0,"ears_2":0,"nose_3":0,"hair_color_2":0,"eyebrows_2":0,"bags_1":0,"mom":10,"arms_2":0,"bags_2":0,"chain_2":0,"moles_1":0,"chin_1":0,"lipstick_2":0,"eyebrows_5":0,"age_2":0,"tshirt_2":0,"bodyb_2":0,"chin_4":0,"jaw_1":0,"eyebrows_4":0,"chin_2":0,"beard_3":0,"skin_md_weight":50,"makeup_2":0,"bproof_1":0,"shoes_1":28,"helmet_1":-1,"chest_2":0,"nose_2":0,"blemishes_2":0,"complexion_1":0,"torso_1":254,"sex":0,"eye_squint":0,"makeup_3":0,"bodyb_3":-1,"lipstick_1":0,"nose_5":0,"pants_2":0,"chin_3":0,"decals_1":0,"glasses_2":0,"torso_2":0}', '[{"name":"cash","money":25000},{"name":"dirtycash","money":0},{"name":"bank","money":50000},{"name":"chip","money":0},{"name":"fidelcoins","money":0}]', '[{"name":"bread","count":15},{"name":"water","count":15},{"name":"phone","count":3}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"name":"hunger","val":976250,"percent":97.625},{"name":"thirst","val":976250,"percent":97.625},{"name":"drunk","val":0,"percent":0.0},{"name":"drug","val":0,"percent":0.0}]', NULL, 'Espana', 'Ronaldo', '20', 'm', '180cm', '269-1255', NULL, 0, 1, 0, 0, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(16, 'license:3990e692cecfc4935f9d1af7311017c90e9475d2', NULL, NULL, 'user', 0, '{"x":-787.5999755859375,"y":-1045.0999755859376,"z":12.69999980926513}', '{"beard_4":0,"ears_1":-1,"cheeks_2":0,"eyebrows_6":0,"arms":0,"age_1":0,"dad":10,"makeup_1":0,"nose_1":0,"nose_2":0,"sun_2":0,"beard_2":7.8,"hair_1":1,"decals_1":0,"cheeks_3":0,"glasses_1":0,"hair_color_2":0,"watches_1":-1,"makeup_3":0,"cheeks_1":0,"lipstick_4":0,"bproof_2":0,"eyebrows_1":1,"bracelets_1":-1,"mask_1":0,"pants_1":0,"neck_thickness":0,"chain_1":0,"jaw_2":0,"blush_3":0,"helmet_2":0,"blemishes_1":0,"moles_2":0,"eye_color":0,"eyebrows_3":0,"eyebrows_2":6.8,"chain_2":0,"eyebrows_4":0,"shoes_1":0,"hair_2":0,"torso_1":0,"bodyb_3":-1,"shoes_2":0,"complexion_2":0,"lipstick_2":0,"chest_1":0,"beard_3":0,"skin_md_weight":50,"makeup_4":0,"bodyb_4":0,"age_2":0,"bracelets_2":0,"lipstick_3":0,"sun_1":0,"torso_2":0,"nose_6":0,"blush_1":0,"decals_2":0,"bags_1":0,"mom":21,"arms_2":0,"bags_2":0,"nose_3":0,"tshirt_1":0,"beard_1":18,"bodyb_1":-1,"lip_thickness":0,"face_md_weight":53.99999999999998,"complexion_1":0,"bodyb_2":0,"chin_4":0,"tshirt_2":0,"chin_1":0,"watches_2":0,"jaw_1":0,"helmet_1":-1,"hair_color_1":0,"bproof_1":0,"eyebrows_5":0,"chin_2":0,"chest_2":0,"nose_4":0,"blemishes_2":0,"moles_1":0,"chest_3":0,"sex":0,"eye_squint":0,"ears_2":0,"makeup_2":0,"lipstick_1":0,"nose_5":0,"pants_2":0,"chin_3":0,"blush_2":0,"glasses_2":0,"mask_2":0}', '[{"name":"cash","money":25000},{"name":"dirtycash","money":0},{"name":"bank","money":50000},{"name":"chip","money":0},{"name":"fidelcoins","money":0}]', '[{"name":"bread","count":5},{"name":"water","count":5},{"name":"phone","count":1}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"name":"hunger","val":983700,"percent":98.37},{"name":"thirst","val":983700,"percent":98.37},{"name":"drunk","val":0,"percent":0.0},{"name":"drug","val":0,"percent":0.0}]', NULL, 'Yves', 'Yves', '13', 'm', '189', '395-3814', NULL, 0, 1, 0, 0, 199, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(17, 'license:4b4fcf49c6967afd572191f73919f593bcf6d4c2', NULL, NULL, 'user', 0, '{"x":-812.0,"y":-1080.9000244140626,"z":11.10000038146972}', '{"moles_2":0,"ears_1":-1,"cheeks_2":0,"eyebrows_6":0,"arms":0,"age_1":0,"dad":0,"makeup_1":0,"moles_1":0,"hair_color_1":0,"sun_2":0,"beard_2":0,"hair_1":0,"decals_1":0,"cheeks_3":0,"glasses_1":0,"bodyb_4":0,"watches_1":-1,"blush_2":0,"cheeks_1":0,"lipstick_4":0,"bproof_2":0,"eyebrows_1":0,"bracelets_1":-1,"mask_1":0,"pants_1":61,"neck_thickness":0,"chain_1":28,"jaw_2":0,"blush_3":0,"helmet_2":0,"blemishes_1":0,"nose_6":0,"eye_color":0,"eyebrows_3":0,"bodyb_1":-1,"sun_1":0,"face_md_weight":50,"age_2":0,"hair_2":0,"makeup_2":0,"torso_1":254,"shoes_2":0,"complexion_2":0,"skin_md_weight":50,"lipstick_3":0,"eyebrows_2":0,"tshirt_2":0,"makeup_4":0,"makeup_3":0,"lipstick_2":0,"bracelets_2":0,"nose_2":0,"blemishes_2":0,"tshirt_1":15,"decals_2":0,"lip_thickness":0,"pants_2":0,"bags_1":0,"mom":21,"arms_2":0,"bags_2":0,"chain_2":0,"beard_3":0,"eyebrows_5":0,"chest_1":0,"beard_4":0,"mask_2":0,"complexion_1":0,"bodyb_2":0,"chin_4":0,"nose_1":0,"ears_2":0,"beard_1":0,"jaw_1":0,"helmet_1":-1,"eyebrows_4":0,"bproof_1":0,"shoes_1":28,"chin_2":0,"chest_2":0,"hair_color_2":0,"watches_2":0,"nose_5":0,"chest_3":0,"sex":0,"eye_squint":0,"torso_2":0,"bodyb_3":-1,"lipstick_1":0,"chin_1":0,"blush_1":0,"chin_3":0,"nose_3":0,"glasses_2":0,"nose_4":0}', '[{"name":"cash","money":25000},{"name":"dirtycash","money":0},{"name":"bank","money":50000},{"name":"chip","money":0},{"name":"fidelcoins","money":0}]', '[{"name":"bread","count":5},{"name":"water","count":5},{"name":"phone","count":1}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"val":997100,"name":"hunger","percent":99.71},{"val":997100,"name":"thirst","percent":99.71},{"val":0,"name":"drunk","percent":0.0},{"val":0,"name":"drug","percent":0.0}]', NULL, 'Maxime', 'Berthrand', '50', 'm', '150', '259-8437', NULL, 0, 1, 0, 0, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(18, 'license:d5978481098e92d4daafbbef17620e54dec79196', NULL, NULL, 'user', 0, '{"x":-637.4000244140625,"y":-473.1000061035156,"z":34.79999923706055}', '{"age_2":0,"ears_1":-1,"cheeks_2":0,"eyebrows_6":0,"arms":0,"age_1":0,"dad":0,"makeup_1":0,"moles_1":0,"nose_2":0,"sun_2":0,"beard_2":0,"hair_1":0,"lip_thickness":0,"cheeks_3":0,"glasses_1":0,"bodyb_4":0,"watches_1":-1,"makeup_3":0,"cheeks_1":0,"lipstick_4":0,"bproof_2":0,"eyebrows_1":0,"bracelets_1":-1,"mask_1":0,"pants_1":61,"neck_thickness":0,"chain_1":28,"jaw_2":0,"blush_3":0,"helmet_2":0,"blemishes_1":0,"torso_2":0,"eye_color":0,"eyebrows_3":0,"eyebrows_2":0,"lipstick_2":0,"eyebrows_4":0,"moles_2":0,"hair_2":0,"chin_2":0,"ears_2":0,"shoes_2":0,"complexion_2":0,"nose_4":0,"chest_1":0,"nose_1":0,"tshirt_2":0,"makeup_4":0,"complexion_1":0,"chain_2":0,"bracelets_2":0,"makeup_2":0,"chest_3":0,"skin_md_weight":50,"bodyb_1":-1,"pants_2":0,"beard_3":0,"bags_1":0,"mom":21,"arms_2":0,"bags_2":0,"nose_3":0,"blush_2":0,"hair_color_1":0,"beard_4":0,"beard_1":0,"lipstick_3":0,"tshirt_1":15,"bodyb_2":0,"chin_4":0,"face_md_weight":50,"hair_color_2":0,"watches_2":0,"jaw_1":0,"nose_6":0,"sun_1":0,"bproof_1":0,"shoes_1":28,"helmet_1":-1,"chest_2":0,"decals_1":0,"blemishes_2":0,"mask_2":0,"torso_1":254,"sex":0,"eye_squint":0,"eyebrows_5":0,"bodyb_3":-1,"lipstick_1":0,"chin_1":0,"blush_1":0,"chin_3":0,"decals_2":0,"glasses_2":0,"nose_5":0}', '[{"name":"cash","money":24500},{"name":"dirtycash","money":0},{"name":"bank","money":50000},{"name":"chip","money":0},{"name":"fidelcoins","money":0}]', '[{"name":"bread","count":5},{"name":"water","count":5},{"name":"phone","count":1},{"name":"hotdog","count":2}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"val":998850,"name":"hunger","percent":99.885},{"val":998850,"name":"thirst","percent":99.885},{"val":0,"name":"drunk","percent":0.0},{"val":0,"name":"drug","percent":0.0}]', NULL, 'fqfqfqzf', 'fqzfqfqz', '123', 'm', '134', '116-5055', NULL, 0, 1051, 0, 0, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(19, 'license:c48b0294f78a28f6f264a7adfa68a5b3f4cdc4f9', NULL, NULL, 'user', 0, '{"x":-635.9000244140625,"y":-1084.199951171875,"z":19.79999923706054}', '{"beard_4":0,"ears_1":-1,"cheeks_2":0,"nose_6":0,"arms":0,"age_1":0,"dad":0,"makeup_1":0,"moles_1":0,"nose_2":0,"sun_2":0,"beard_2":10.0,"hair_1":2,"decals_1":0,"cheeks_3":0,"glasses_1":0,"hair_color_2":0,"watches_1":-1,"decals_2":0,"cheeks_1":0,"lipstick_4":0,"bproof_2":0,"eyebrows_1":0,"bracelets_1":-1,"mask_1":0,"pants_1":61,"neck_thickness":0,"chain_1":28,"jaw_2":0,"torso_2":0,"helmet_2":0,"blemishes_1":0,"shoes_1":28,"eye_color":0,"beard_1":19,"eyebrows_2":0,"blush_1":0,"eyebrows_4":0,"lip_thickness":0,"hair_2":0,"moles_2":0,"lipstick_3":0,"shoes_2":0,"complexion_2":0,"makeup_2":0,"chest_1":0,"age_2":0,"tshirt_1":15,"makeup_4":0,"bodyb_1":-1,"face_md_weight":50,"bracelets_2":0,"makeup_3":0,"chain_2":0,"beard_3":0,"hair_color_1":0,"blush_3":0,"blush_2":0,"bags_1":0,"mom":21,"arms_2":0,"bags_2":0,"nose_3":0,"nose_4":0,"eyebrows_3":0,"helmet_1":-1,"mask_2":0,"chest_3":0,"complexion_1":0,"bodyb_2":0,"chin_4":0,"ears_2":0,"bodyb_4":0,"tshirt_2":0,"jaw_1":0,"nose_5":0,"skin_md_weight":50,"bproof_1":0,"lipstick_2":0,"chin_2":0,"chest_2":0,"nose_1":0,"blemishes_2":0,"sun_1":0,"torso_1":254,"sex":0,"eye_squint":0,"eyebrows_6":0,"bodyb_3":-1,"lipstick_1":0,"chin_1":0,"pants_2":0,"chin_3":0,"eyebrows_5":0,"glasses_2":0,"watches_2":0}', '[{"name":"cash","money":24750},{"name":"dirtycash","money":0},{"name":"bank","money":50000},{"name":"chip","money":0},{"name":"fidelcoins","money":0}]', '[{"name":"water","count":5},{"name":"hotdog","count":1},{"name":"bread","count":5},{"name":"phone","count":1}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"val":1000000,"name":"hunger","percent":100.0},{"val":1000000,"name":"thirst","percent":100.0},{"val":0,"name":"drunk","percent":0.0},{"val":0,"name":"drug","percent":0.0}]', NULL, 'José', 'Akha', '12', 'm', '185', '470-9441', NULL, 0, 1051, 0, 0, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(20, 'license:c036013c3d6f5a5e951dfc69633cdbc51ddf4232', NULL, NULL, 'user', 0, '{"x":-738.9000244140625,"y":-1065.800048828125,"z":12.30000019073486}', '{"beard_4":0,"ears_1":-1,"cheeks_2":0,"nose_6":0,"arms":0,"age_1":0,"dad":0,"makeup_1":0,"nose_1":0,"nose_2":0,"sun_2":0,"beard_2":0,"hair_1":0,"lip_thickness":0,"cheeks_3":0,"glasses_1":0,"bodyb_4":0,"watches_1":-1,"makeup_3":0,"cheeks_1":0,"lipstick_4":0,"bproof_2":0,"eyebrows_1":0,"bracelets_1":-1,"mask_1":0,"pants_1":61,"neck_thickness":0,"chain_1":28,"jaw_2":0,"torso_2":0,"helmet_2":0,"blemishes_1":0,"decals_1":0,"eye_color":0,"eyebrows_3":0,"eyebrows_2":0,"moles_1":0,"face_md_weight":50,"tshirt_1":15,"hair_2":0,"skin_md_weight":50,"lipstick_2":0,"shoes_2":0,"complexion_2":0,"blush_2":0,"lipstick_3":0,"nose_4":0,"hair_color_2":0,"makeup_4":0,"bodyb_1":-1,"tshirt_2":0,"bracelets_2":0,"nose_3":0,"eyebrows_4":0,"sun_1":0,"hair_color_1":0,"shoes_1":28,"helmet_1":-1,"bags_1":0,"mom":21,"arms_2":0,"bags_2":0,"chain_2":0,"blush_3":0,"blemishes_2":0,"jaw_1":0,"age_2":0,"beard_1":0,"ears_2":0,"bodyb_2":0,"chin_4":0,"eyebrows_6":0,"mask_2":0,"decals_2":0,"beard_3":0,"chest_3":0,"chin_1":0,"bproof_1":0,"eyebrows_5":0,"chin_2":0,"chest_2":0,"chest_1":0,"watches_2":0,"moles_2":0,"torso_1":254,"sex":0,"eye_squint":0,"blush_1":0,"makeup_2":0,"lipstick_1":0,"nose_5":0,"pants_2":0,"chin_3":0,"bodyb_3":-1,"glasses_2":0,"complexion_1":0}', '[{"name":"cash","money":25000},{"name":"dirtycash","money":0},{"name":"bank","money":50000},{"name":"chip","money":0},{"name":"fidelcoins","money":0}]', '[{"name":"bread","count":5},{"name":"water","count":5},{"name":"phone","count":1}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"val":999150,"name":"hunger","percent":99.91499999999999},{"val":999150,"name":"thirst","percent":99.91499999999999},{"val":0,"name":"drunk","percent":0.0},{"val":0,"name":"drug","percent":0.0}]', NULL, 'Victor', 'Ledoux', '25', 'm', '180', '192-7413', NULL, 0, 1, 0, 0, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(21, 'license:697abf7a9220e04e5568b31ce0a1c2d7c254aef0', NULL, NULL, 'user', 0, '{"x":-795.0999755859375,"y":-1045.0999755859376,"z":12.60000038146972}', '{"age_2":0,"ears_1":-1,"cheeks_2":0,"eyebrows_6":0,"arms":0,"age_1":0,"dad":0,"makeup_1":0,"nose_1":0,"nose_2":0,"sun_2":0,"beard_2":0,"hair_1":3,"decals_1":0,"cheeks_3":0,"glasses_1":0,"bodyb_4":0,"watches_1":-1,"decals_2":0,"cheeks_1":0,"lipstick_4":0,"bproof_2":0,"eyebrows_1":0,"bracelets_1":-1,"mask_1":0,"pants_1":61,"neck_thickness":0,"chain_1":28,"jaw_2":0,"blush_3":0,"helmet_2":0,"blemishes_1":0,"lipstick_3":0,"eye_color":0,"eyebrows_3":0,"bodyb_1":-1,"beard_3":0,"mask_2":0,"hair_color_1":0,"hair_2":0,"moles_2":0,"beard_1":0,"shoes_2":0,"complexion_2":0,"skin_md_weight":50,"chest_1":0,"lip_thickness":0,"chain_2":0,"makeup_4":0,"hair_color_2":0,"eyebrows_2":0,"bracelets_2":0,"torso_1":254,"face_md_weight":50,"pants_2":0,"ears_2":0,"complexion_1":0,"moles_1":0,"bags_1":0,"mom":21,"arms_2":0,"bags_2":0,"nose_3":0,"blush_2":0,"nose_4":0,"tshirt_2":0,"sun_1":0,"makeup_3":0,"tshirt_1":15,"bodyb_2":0,"chin_4":0,"makeup_2":0,"lipstick_2":0,"beard_4":0,"jaw_1":0,"nose_5":0,"eyebrows_4":0,"bproof_1":0,"shoes_1":28,"helmet_1":-1,"chest_2":0,"nose_6":0,"blemishes_2":0,"watches_2":0,"chest_3":0,"sex":0,"eye_squint":0,"eyebrows_5":0,"bodyb_3":-1,"lipstick_1":0,"chin_1":0,"blush_1":0,"chin_3":0,"chin_2":0,"glasses_2":0,"torso_2":0}', '[{"name":"cash","money":25000},{"name":"dirtycash","money":0},{"name":"bank","money":50000},{"name":"chip","money":0},{"name":"fidelcoins","money":0}]', '[{"name":"bread","count":5},{"name":"water","count":5},{"name":"phone","count":1}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"val":988200,"name":"hunger","percent":98.82},{"val":988200,"name":"thirst","percent":98.82},{"val":0,"name":"drunk","percent":0.0},{"val":0,"name":"drug","percent":0.0}]', NULL, 'Aron', 'Polito', '18', 'm', '180', '354-9280', NULL, 0, 1, 0, 0, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(22, 'license:840e2bbb73619a49876134911513efcd6e975c6c', NULL, NULL, 'user', 0, '{"z":216.8000030517578,"y":343.1000061035156,"x":-785.4000244140625}', NULL, '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[]', '[]', 'unemployed', 0, 'unemployed2', 0, '[]', NULL, NULL, NULL, NULL, NULL, NULL, '754-5610', NULL, 0, 1, 0, 0, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(23, 'license:676c7031a7e3c4b1fe6d534ebfbfe1ae4af49d16', NULL, NULL, 'user', 0, '{"z":216.8000030517578,"y":343.29998779296877,"x":-785.5}', NULL, '[{"name":"cash","money":25000},{"name":"dirtycash","money":0},{"name":"bank","money":50000},{"name":"chip","money":0},{"name":"fidelcoins","money":0}]', '[]', '[]', 'unemployed', 0, 'unemployed2', 0, '[]', NULL, NULL, NULL, NULL, NULL, NULL, '833-2252', NULL, 0, 1, 0, 0, 200, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(24, 'license:3b812812ad65ece34da9a84c3d7aa2bb1257f2a7', NULL, NULL, 'fondateur', 0, '{"x":1746.4000244140626,"z":45.70000076293945,"y":2475.0}', '{"jaw_1":0,"makeup_3":0,"skin_md_weight":50,"decals_1":0,"bodyb_2":0,"blemishes_1":0,"chest_2":0,"makeup_1":0,"blush_3":0,"beard_3":0,"complexion_1":0,"shoes_1":28,"eye_color":0,"bags_1":0,"ears_2":0,"glasses_1":0,"chin_4":0,"lipstick_2":0,"torso_2":0,"pants_1":61,"nose_3":0,"blush_2":0,"chain_1":28,"eyebrows_1":0,"nose_1":0,"bodyb_3":-1,"bproof_2":0,"eye_squint":0,"bracelets_2":0,"chin_3":0,"mom":21,"chain_2":0,"nose_6":0,"torso_1":254,"arms":0,"arms_2":0,"hair_color_2":0,"pants_2":0,"face_md_weight":50,"moles_1":0,"eyebrows_5":0,"cheeks_1":0,"chest_3":0,"nose_5":0,"cheeks_3":0,"glasses_2":0,"bracelets_1":-1,"tshirt_1":15,"makeup_4":0,"blemishes_2":0,"lipstick_1":0,"eyebrows_6":0,"mask_2":0,"ears_1":-1,"watches_2":0,"sun_2":0,"chin_2":0,"mask_1":0,"decals_2":0,"hair_2":0,"jaw_2":0,"hair_color_1":0,"sex":0,"watches_1":-1,"nose_4":0,"beard_4":0,"bodyb_1":-1,"eyebrows_2":0,"helmet_2":0,"makeup_2":0,"age_2":0,"cheeks_2":0,"chest_1":0,"eyebrows_3":0,"bags_2":0,"lipstick_3":0,"lip_thickness":0,"chin_1":0,"lipstick_4":0,"complexion_2":0,"moles_2":0,"sun_1":0,"bproof_1":0,"age_1":0,"blush_1":0,"beard_2":0,"nose_2":0,"neck_thickness":0,"hair_1":0,"beard_1":0,"bodyb_4":0,"eyebrows_4":0,"shoes_2":0,"dad":0,"tshirt_2":0,"helmet_1":-1}', '[{"name":"cash","money":25000},{"name":"dirtycash","money":0},{"name":"bank","money":50125},{"name":"chip","money":0},{"name":"fidelcoins","money":5}]', '[{"name":"water","count":5},{"name":"bread","count":5},{"name":"phone","count":1}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"percent":47.23,"name":"hunger","val":472300},{"percent":47.23,"name":"thirst","val":472300},{"percent":0.0,"name":"drunk","val":0},{"percent":0.0,"name":"drug","val":0}]', NULL, 'RTRTRTRTRTTRTR', 'RTRTRTRT', '18', 'm', '180', '861-2292', NULL, 0, 10501, 0, 0, 178, NULL, NULL, '0', '{"phone":"555200663","lastname":"RTRTRTRT","firstname":"RTRTRTRTRTTRTR","account":"IBAN9977736648"}', '{"cryptoid":"cpt-TC086","CryptoCurrency":[],"walletid":"QS-33004618","phone":{"InstalledApps":[]}}', NULL, NULL),
	(25, 'license:222c46fedf9fa74880e63ab731894be3fb57c497', NULL, NULL, 'fondateur', 0, '{"x":461.1000061035156,"y":-1413.9000244140626,"z":28.70000076293945}', '{"eyebrows_6":0,"eye_squint":0,"moles_2":0,"beard_3":0,"eye_color":0,"chin_3":0,"eyebrows_2":0,"arms_2":0,"age_1":0,"watches_1":-1,"face_md_weight":50,"neck_thickness":0,"jaw_2":0,"beard_4":0,"nose_1":0,"helmet_1":16,"shoes_2":0,"complexion_2":0,"sun_1":0,"ears_1":-1,"tshirt_1":15,"helmet_2":3,"eyebrows_4":0,"chin_2":0,"blush_2":0,"bracelets_2":0,"makeup_2":0,"bodyb_2":0,"ears_2":0,"bags_2":0,"chest_1":0,"skin_md_weight":50,"hair_color_1":0,"cheeks_1":0,"blemishes_1":0,"bproof_1":0,"hair_2":0,"chain_2":0,"makeup_3":0,"pants_1":162,"age_2":0,"chin_1":0,"glasses_2":2,"eyebrows_3":0,"hair_1":0,"mom":21,"lip_thickness":0,"chin_4":0,"arms":17,"makeup_1":0,"torso_2":3,"makeup_4":0,"beard_2":0,"nose_6":0,"lipstick_1":0,"pants_2":0,"jaw_1":0,"chest_3":0,"dad":0,"mask_2":0,"eyebrows_5":0,"lipstick_2":0,"chain_1":0,"torso_1":326,"bodyb_3":-1,"bracelets_1":-1,"lipstick_3":0,"watches_2":0,"moles_1":0,"nose_4":0,"cheeks_2":0,"blemishes_2":0,"nose_5":0,"shoes_1":120,"nose_2":0,"hair_color_2":0,"cheeks_3":0,"bproof_2":0,"tshirt_2":0,"sun_2":0,"decals_1":0,"decals_2":0,"chest_2":0,"bags_1":11,"bodyb_4":0,"blush_3":0,"mask_1":28,"bodyb_1":-1,"sex":1,"lipstick_4":0,"blush_1":0,"beard_1":0,"complexion_1":0,"nose_3":0,"glasses_1":35,"eyebrows_1":0}', '[{"money":21300,"name":"cash"},{"money":47673,"name":"dirtycash"},{"money":50075,"name":"bank"},{"money":0,"name":"chip"},{"money":7,"name":"fidelcoins"}]', '[{"count":15,"name":"water"},{"count":15,"name":"bread"},{"count":4,"name":"phone"}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"percent":88.26,"name":"hunger","val":882600},{"percent":88.26,"name":"thirst","val":882600},{"percent":0.0,"name":"drunk","val":0},{"percent":0.0,"name":"drug","val":0}]', NULL, 'Rachel', 'Yuksek', '37', 'f', '180', '534-1358', NULL, 0, 16801, 0, 0, 145, NULL, '{"widget_gorunum":false}', '0', '{"phone":"555364100","account":"IBAN8567477095","lastname":"Yuksek","firstname":"Rachel"}', '{"phone":{"background":"b27","InstalledApps":[]},"walletid":"QS-71960248","cryptoid":"cpt-mt001","CryptoCurrency":[]}', NULL, NULL),
	(26, 'license:afaba2ad9bca10e18363adece691fdecbcababee', NULL, NULL, 'fondateur', 0, '{"z":29.20000076293945,"x":138.3000030517578,"y":-1074.699951171875}', '{"makeup_3":0,"bracelets_2":0,"arms_2":0,"chin_1":0,"chin_4":0,"complexion_2":0,"ears_1":-1,"mask_1":28,"decals_1":0,"nose_4":0,"shoes_2":2,"bodyb_1":-1,"complexion_1":0,"watches_2":0,"jaw_2":0,"watches_1":-1,"beard_4":0,"blush_1":0,"ears_2":0,"shoes_1":48,"eyebrows_1":0,"lip_thickness":0,"sex":0,"pants_2":0,"cheeks_2":0,"tshirt_1":15,"tshirt_2":0,"lipstick_3":0,"blemishes_2":0,"makeup_1":0,"helmet_1":-1,"beard_1":0,"jaw_1":0,"bodyb_3":-1,"dad":0,"hair_2":0,"neck_thickness":0,"helmet_2":0,"glasses_2":0,"chin_3":0,"nose_6":0,"chest_1":0,"lipstick_4":0,"hair_1":1,"blemishes_1":0,"bproof_2":0,"chin_2":0,"nose_2":0,"bracelets_1":-1,"bags_2":0,"beard_3":0,"makeup_2":0,"bproof_1":0,"cheeks_3":0,"arms":40,"blush_2":0,"mask_2":0,"eyebrows_6":0,"moles_1":0,"chain_1":28,"sun_2":0,"lipstick_2":0,"eyebrows_4":0,"torso_2":0,"cheeks_1":0,"bodyb_2":0,"bags_1":0,"bodyb_4":0,"skin_md_weight":50,"eye_color":0,"face_md_weight":50,"moles_2":0,"age_2":0,"eyebrows_5":0,"decals_2":0,"sun_1":0,"makeup_4":0,"chest_2":0,"nose_5":0,"pants_1":42,"beard_2":0,"mom":21,"hair_color_1":0,"torso_1":63,"blush_3":0,"nose_1":0,"lipstick_1":0,"eye_squint":0,"eyebrows_2":0,"chest_3":0,"glasses_1":23,"eyebrows_3":0,"chain_2":0,"hair_color_2":0,"age_1":0,"nose_3":0}', '[{"money":24300,"name":"cash"},{"money":3579,"name":"dirtycash"},{"money":111925,"name":"bank"},{"money":0,"name":"chip"},{"money":15,"name":"fidelcoins"}]', '[{"count":10,"name":"water"},{"count":10,"name":"bread"},{"count":2,"name":"phone"}]', '[{"components":[],"name":"WEAPON_GLOCK","label":"GLOCK-17","ammo":250}]', 'ambulance', 1, 'unemployed2', 0, '[{"name":"hunger","val":987500,"percent":98.75},{"name":"thirst","val":987500,"percent":98.75},{"name":"drunk","val":0,"percent":0.0},{"name":"drug","val":0,"percent":0.0}]', NULL, 'Sissoko', 'Boka', '18', 'm', '185', NULL, NULL, 0, 35701, 0, 0, 199, NULL, '{"widget_gorunum":false}', '0', '{"account":"IBAN9340290149","phone":"555717828","firstname":"Sissoko","lastname":"Boka"}', '{"CryptoCurrency":[],"cryptoid":"cpt-oN428","phone":{"InstalledApps":[],"Pincode":"0578"},"walletid":"QS-31730301"}', NULL, NULL),
	(27, 'license:d7b1a029b3e0d095633bb27dc9f31e5ac130ca62', NULL, NULL, 'user', 0, '{"z":11.80000019073486,"y":-1045.800048828125,"x":-795.2999877929688}', '{"age_1":0,"bodyb_3":-1,"lipstick_1":0,"chin_1":0,"decals_2":0,"glasses_1":0,"neck_thickness":0,"chain_2":0,"lipstick_3":0,"tshirt_2":0,"bodyb_1":-1,"glasses_2":0,"bodyb_2":0,"hair_1":35,"pants_2":0,"blush_1":0,"beard_3":0,"cheeks_1":0,"chest_1":0,"bproof_2":0,"lipstick_4":0,"eyebrows_5":0,"cheeks_3":0,"shoes_1":28,"sun_2":0,"chin_4":0,"bodyb_4":0,"sun_1":0,"skin_md_weight":37.00000000000003,"cheeks_2":0,"tshirt_1":15,"eye_squint":0,"shoes_2":0,"complexion_2":0,"chain_1":28,"chest_3":0,"nose_1":0,"nose_2":0,"arms_2":0,"mom":2,"beard_2":0,"chest_2":0,"makeup_3":0,"beard_4":0,"sex":0,"makeup_2":0,"eyebrows_2":0,"eye_color":4,"complexion_1":0,"arms":0,"moles_2":0,"blemishes_2":0,"nose_5":0,"helmet_1":-1,"eyebrows_3":0,"chin_3":0,"bproof_1":0,"jaw_2":0,"ears_2":0,"blemishes_1":0,"chin_2":0,"moles_1":0,"nose_6":0,"lipstick_2":0,"torso_2":0,"nose_4":0,"eyebrows_6":0,"mask_1":0,"age_2":0,"makeup_1":0,"decals_1":0,"mask_2":0,"beard_1":7,"face_md_weight":51.0,"blush_2":0,"watches_2":0,"hair_color_1":0,"bags_2":0,"bracelets_2":0,"dad":19,"lip_thickness":0,"jaw_1":0,"pants_1":61,"blush_3":0,"watches_1":-1,"torso_1":254,"hair_color_2":0,"helmet_2":0,"bags_1":0,"hair_2":0,"nose_3":0,"ears_1":-1,"eyebrows_1":4,"eyebrows_4":0,"bracelets_1":-1,"makeup_4":0}', '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[{"name":"water","count":5},{"name":"bread","count":5},{"name":"phone","count":1}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"name":"hunger","val":980900,"percent":98.09},{"name":"thirst","val":980900,"percent":98.09},{"name":"drunk","val":0,"percent":0.0},{"name":"drug","val":0,"percent":0.0}]', NULL, 'Nono', 'Bou', '18', 'm', '170', NULL, NULL, 0, 1, 0, 0, 200, NULL, NULL, '0', '{"firstname":"Nono","phone":"555791251","lastname":"Bou","account":"IBAN7193167388"}', '{"phone":{"InstalledApps":[]},"cryptoid":"cpt-Hs607","CryptoCurrency":[],"walletid":"QS-31949259"}', NULL, NULL),
	(28, 'license:23eb122fbc001b121afd443767a90c32ce8d58b2', NULL, NULL, 'user', 0, '{"x":267.70001220703127,"y":-883.0999755859375,"z":29.10000038146972}', '{"age_1":0,"bodyb_3":-1,"lipstick_1":0,"chin_1":0,"decals_2":0,"glasses_1":0,"dad":0,"chain_2":0,"lipstick_3":0,"tshirt_2":0,"bodyb_1":-1,"glasses_2":0,"bodyb_2":0,"hair_1":0,"pants_2":0,"blush_1":0,"skin_md_weight":50,"cheeks_1":0,"chest_1":0,"bproof_2":0,"lipstick_4":0,"eyebrows_5":0,"chest_3":0,"shoes_1":28,"hair_color_2":0,"chin_4":0,"bodyb_4":0,"sun_1":0,"eye_squint":0,"chain_1":28,"watches_2":0,"face_md_weight":50,"mom":21,"cheeks_2":0,"bags_2":0,"helmet_1":-1,"nose_1":0,"nose_2":0,"arms_2":0,"complexion_2":0,"beard_2":0,"chest_2":0,"shoes_2":0,"ears_2":0,"sex":0,"makeup_2":0,"eyebrows_2":0,"eye_color":0,"complexion_1":0,"arms":0,"blemishes_2":0,"age_2":0,"nose_5":0,"beard_4":0,"eyebrows_3":0,"tshirt_1":25,"bproof_1":0,"jaw_2":0,"ears_1":-1,"blemishes_1":0,"sun_2":0,"moles_1":0,"torso_2":0,"eyebrows_6":0,"nose_3":0,"nose_4":0,"makeup_3":0,"cheeks_3":0,"helmet_2":0,"makeup_1":0,"lipstick_2":0,"blush_2":0,"beard_1":0,"chin_3":0,"decals_1":0,"bracelets_2":0,"hair_color_1":0,"neck_thickness":0,"moles_2":0,"mask_1":0,"lip_thickness":0,"jaw_1":0,"pants_1":61,"blush_3":0,"watches_1":-1,"torso_1":254,"beard_3":0,"chin_2":0,"bags_1":0,"hair_2":0,"nose_6":0,"mask_2":0,"eyebrows_1":0,"eyebrows_4":0,"bracelets_1":-1,"makeup_4":0}', '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[{"count":5,"name":"water"},{"count":5,"name":"bread"},{"count":1,"name":"phone"}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"percent":95.67999999999999,"name":"hunger","val":956800},{"percent":95.67999999999999,"name":"thirst","val":956800},{"percent":0.0,"name":"drunk","val":0},{"percent":0.0,"name":"drug","val":0}]', NULL, 'Hfdfj', 'Kfff', 'Jkfjff', 'm', '180', NULL, NULL, 0, 1, 0, 0, 199, NULL, NULL, '0', '{"phone":"555529500","account":"IBAN7918419941","lastname":"Kfff","firstname":"Hfdfj"}', '{"phone":{"InstalledApps":[]},"walletid":"QS-57648272","cryptoid":"cpt-Oq426","CryptoCurrency":[]}', NULL, NULL),
	(29, 'license:17f2b8a5c19f26e1e136c114dfe204bc708ee87e', NULL, NULL, 'user', 0, '{"z":216.8000030517578,"y":343.29998779296877,"x":-785.4000244140625}', NULL, '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[{"name":"bread","count":5},{"name":"water","count":5},{"name":"phone","count":1}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"name":"hunger","val":997100,"percent":99.71},{"name":"thirst","val":997100,"percent":99.71},{"name":"drunk","val":0,"percent":0.0},{"name":"drug","val":0,"percent":0.0}]', NULL, 'Karl', 'Boire', '13', 'm', '190', NULL, NULL, 0, 1, 0, 0, 200, NULL, NULL, '0', '{"lastname":"","phone":"555386871","account":"IBAN5819437877","firstname":""}', '{"phone":{"InstalledApps":[]},"cryptoid":"cpt-SZ302","CryptoCurrency":[],"walletid":"QS-24850971"}', NULL, NULL),
	(30, 'license:74722e5d83c23057107334ec41dc2c5539369201', NULL, NULL, 'user', 0, '{"z":16.89999961853027,"y":-969.0999755859375,"x":-744.0}', '{"age_1":0,"bodyb_3":-1,"lipstick_1":0,"bracelets_2":0,"decals_2":0,"glasses_1":0,"neck_thickness":0,"chain_2":0,"lipstick_3":0,"tshirt_2":0,"bodyb_1":-1,"glasses_2":0,"bodyb_2":0,"hair_1":0,"pants_2":0,"blush_1":0,"beard_3":0,"cheeks_1":0,"chest_1":0,"bproof_2":0,"lipstick_4":0,"eyebrows_5":0,"chest_3":0,"shoes_1":28,"sun_2":0,"chin_4":0,"bodyb_4":0,"sun_1":0,"nose_3":0,"moles_2":0,"age_2":0,"face_md_weight":50,"beard_2":0,"torso_2":0,"chain_1":28,"ears_2":0,"nose_1":0,"nose_2":0,"arms_2":0,"complexion_2":0,"makeup_3":0,"chest_2":0,"dad":0,"shoes_2":0,"sex":0,"makeup_2":0,"eyebrows_2":0,"beard_4":0,"complexion_1":0,"arms":0,"skin_md_weight":50,"blush_2":0,"nose_5":0,"watches_2":0,"chin_2":0,"chin_3":0,"bproof_1":0,"jaw_2":0,"helmet_1":-1,"cheeks_2":0,"eyebrows_3":0,"moles_1":0,"nose_6":0,"tshirt_1":15,"eye_squint":0,"nose_4":0,"lipstick_2":0,"ears_1":-1,"helmet_2":0,"makeup_1":0,"eyebrows_4":0,"bags_2":0,"beard_1":0,"mom":21,"eyebrows_1":0,"decals_1":0,"hair_color_1":0,"chin_1":0,"blemishes_1":0,"eye_color":0,"lip_thickness":0,"jaw_1":0,"pants_1":61,"blush_3":0,"watches_1":-1,"torso_1":254,"mask_2":0,"cheeks_3":0,"bags_1":0,"hair_2":0,"eyebrows_6":0,"hair_color_2":0,"mask_1":0,"blemishes_2":0,"bracelets_1":-1,"makeup_4":0}', '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[{"name":"bread","count":5},{"name":"water","count":5},{"name":"phone","count":1}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"name":"hunger","val":989650,"percent":98.965},{"name":"thirst","val":989650,"percent":98.965},{"name":"drunk","val":0,"percent":0.0},{"name":"drug","val":0,"percent":0.0}]', NULL, 'Ouais', 'Rat', '19', 'm', '111', NULL, NULL, 0, 1, 0, 0, 199, NULL, NULL, '0', '{"lastname":"","phone":"555114595","account":"IBAN7672749426","firstname":""}', '{"phone":{"InstalledApps":[]},"cryptoid":"cpt-iq628","CryptoCurrency":[],"walletid":"QS-58007590"}', NULL, NULL),
	(31, 'license:1543c0430465cae3b2710706634749fbcfd7c567', NULL, NULL, 'user', 0, '{"x":-785.5,"y":343.29998779296877,"z":217.5}', NULL, '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[]', '[]', 'unemployed', 0, 'unemployed2', 0, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 200, NULL, NULL, '0', '{"phone":"555879869","account":"IBAN8052772811","lastname":"","firstname":""}', '{"walletid":"QS-63112846","phone":{"InstalledApps":[]},"cryptoid":"cpt-yX122","CryptoCurrency":[]}', NULL, NULL),
	(32, 'license:f5788bac547691e212faa76eb9e71f46da796d50', NULL, NULL, 'user', 0, '{"x":212.1999969482422,"z":30.20000076293945,"y":-792.2000122070313}', '{"eyebrows_6":0,"glasses_1":0,"beard_3":0,"moles_1":0,"arms":0,"nose_5":0,"lipstick_1":0,"blush_3":0,"ears_2":0,"bodyb_4":0,"blush_1":0,"torso_1":254,"jaw_1":0,"makeup_2":0,"jaw_2":0,"helmet_1":-1,"cheeks_2":0,"tshirt_1":15,"eyebrows_4":0,"glasses_2":0,"beard_4":0,"chest_2":0,"dad":0,"blemishes_1":0,"beard_2":0,"hair_1":0,"sex":0,"chin_4":0,"bracelets_1":-1,"helmet_2":0,"ears_1":-1,"bags_1":0,"beard_1":0,"bproof_2":0,"bodyb_2":0,"mom":21,"torso_2":0,"makeup_3":0,"tshirt_2":0,"eyebrows_1":0,"lip_thickness":0,"chin_3":0,"eye_squint":0,"bodyb_1":-1,"bracelets_2":0,"shoes_1":28,"mask_1":0,"lipstick_3":0,"face_md_weight":50,"skin_md_weight":50,"pants_2":0,"sun_1":0,"cheeks_1":0,"eyebrows_3":0,"blush_2":0,"neck_thickness":0,"bags_2":0,"chain_2":0,"decals_1":0,"chest_3":0,"decals_2":0,"nose_3":0,"nose_4":0,"hair_2":0,"makeup_1":0,"bproof_1":0,"chin_2":0,"cheeks_3":0,"hair_color_2":0,"complexion_2":0,"makeup_4":0,"mask_2":0,"lipstick_4":0,"shoes_2":0,"moles_2":0,"age_2":0,"chest_1":0,"eyebrows_2":0,"nose_2":0,"watches_1":-1,"nose_1":0,"pants_1":61,"nose_6":0,"eye_color":0,"chain_1":28,"blemishes_2":0,"complexion_1":0,"watches_2":0,"age_1":0,"bodyb_3":-1,"chin_1":0,"lipstick_2":0,"arms_2":0,"eyebrows_5":0,"sun_2":0,"hair_color_1":0}', '[{"name":"cash","money":25000},{"name":"dirtycash","money":0},{"name":"bank","money":50000},{"name":"chip","money":0},{"name":"fidelcoins","money":0}]', '[{"name":"bread","count":5},{"name":"water","count":5},{"name":"phone","count":1}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"percent":98.1,"name":"hunger","val":981000},{"percent":98.1,"name":"thirst","val":981000},{"percent":0.0,"name":"drunk","val":0},{"percent":0.0,"name":"drug","val":0}]', NULL, 'Azer', 'Suiii', '12', 'm', '190', NULL, NULL, 0, 1, 0, 0, 200, NULL, NULL, '0', '{"account":"IBAN5641128015","firstname":"","lastname":"","phone":"555319900"}', '{"cryptoid":"cpt-fT525","CryptoCurrency":[],"walletid":"QS-14512208","phone":{"InstalledApps":[]}}', NULL, NULL),
	(33, 'license:5b545b297e209cdabcc80b0d8644571fd87de093', NULL, NULL, 'user', 0, '{"x":-785.4000244140625,"y":-1045.0,"z":13.0}', '{"pants_1":61,"bracelets_2":0,"arms_2":0,"bodyb_4":0,"chin_4":0,"hair_color_1":0,"ears_1":-1,"mask_1":0,"decals_1":0,"nose_4":0,"shoes_2":0,"bodyb_1":-1,"complexion_1":0,"watches_2":0,"jaw_2":0,"watches_1":-1,"beard_4":0,"lipstick_1":0,"ears_2":0,"shoes_1":28,"eyebrows_1":0,"lip_thickness":0,"sex":0,"pants_2":0,"cheeks_2":0,"tshirt_1":15,"tshirt_2":0,"lipstick_3":0,"blemishes_2":0,"makeup_1":0,"helmet_1":-1,"nose_2":0,"jaw_1":0,"bodyb_3":-1,"dad":2,"hair_2":0,"age_2":0,"helmet_2":0,"glasses_2":0,"chin_3":0,"chest_2":0,"blemishes_1":0,"lipstick_4":0,"hair_1":14,"beard_1":0,"chest_1":0,"chin_2":0,"face_md_weight":50,"eyebrows_4":0,"bags_2":0,"beard_3":0,"cheeks_1":0,"nose_1":0,"cheeks_3":0,"arms":0,"bproof_2":0,"mask_2":0,"bracelets_1":-1,"moles_1":0,"neck_thickness":0,"sun_2":0,"lipstick_2":0,"eyebrows_5":0,"makeup_3":0,"bproof_1":0,"bodyb_2":0,"bags_1":0,"chin_1":0,"skin_md_weight":100,"eye_color":0,"torso_2":0,"moles_2":0,"nose_3":0,"chest_3":0,"nose_6":0,"sun_1":0,"makeup_4":0,"blush_2":0,"nose_5":0,"torso_1":254,"beard_2":0,"glasses_1":0,"mom":6,"eyebrows_2":0,"blush_3":0,"eyebrows_6":0,"complexion_2":0,"chain_2":0,"decals_2":0,"blush_1":0,"makeup_2":0,"eyebrows_3":0,"eye_squint":0,"hair_color_2":0,"age_1":0,"chain_1":28}', '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[{"count":5,"name":"bread"},{"count":5,"name":"water"},{"count":1,"name":"phone"}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"percent":99.71,"name":"hunger","val":997100},{"percent":99.71,"name":"thirst","val":997100},{"percent":0.0,"name":"drunk","val":0},{"percent":0.0,"name":"drug","val":0}]', NULL, 'Alexis ', 'Smith', '21', 'm', '189', NULL, NULL, 0, 1, 0, 0, 200, NULL, NULL, '0', '{"phone":"555795863","account":"IBAN7462620658","lastname":"","firstname":""}', '{"phone":{"InstalledApps":[]},"walletid":"QS-36932644","cryptoid":"cpt-Lu776","CryptoCurrency":[]}', NULL, NULL),
	(34, 'license:d9725f63efe9d0d53a0883c78cb79f14db186780', NULL, NULL, 'user', 0, '{"x":-662.5,"y":-1026.199951171875,"z":18.0}', '{"makeup_3":0,"bracelets_2":0,"arms_2":0,"bodyb_4":0,"mom":21,"hair_color_1":0,"ears_1":-1,"mask_1":0,"decals_1":0,"nose_4":0,"shoes_2":0,"bodyb_1":-1,"complexion_1":0,"watches_2":0,"jaw_2":0,"eye_squint":0,"beard_4":0,"lipstick_1":0,"ears_2":0,"shoes_1":28,"eyebrows_1":0,"lip_thickness":0,"sex":0,"pants_2":0,"cheeks_2":0,"tshirt_1":15,"tshirt_2":0,"lipstick_3":0,"blemishes_2":0,"makeup_1":0,"chain_1":28,"beard_1":0,"jaw_1":0,"bodyb_3":-1,"dad":0,"hair_2":0,"neck_thickness":0,"helmet_2":0,"glasses_2":0,"chin_3":0,"nose_6":0,"chest_1":0,"lipstick_4":0,"hair_1":0,"eyebrows_4":0,"face_md_weight":50,"torso_2":0,"arms":0,"helmet_1":-1,"bags_2":0,"beard_3":0,"cheeks_1":0,"nose_1":0,"cheeks_3":0,"bracelets_1":-1,"eyebrows_6":0,"mask_2":0,"eyebrows_3":0,"moles_1":0,"blush_1":0,"sun_2":0,"lipstick_2":0,"torso_1":254,"age_2":0,"eyebrows_5":0,"bodyb_2":0,"bags_1":0,"pants_1":61,"skin_md_weight":50,"eye_color":0,"chest_2":0,"moles_2":0,"blemishes_1":0,"blush_2":0,"chain_2":0,"sun_1":0,"makeup_4":0,"glasses_1":0,"nose_5":0,"chin_4":0,"beard_2":0,"nose_2":0,"complexion_2":0,"eyebrows_2":0,"blush_3":0,"chin_2":0,"decals_2":0,"chin_1":0,"makeup_2":0,"bproof_1":0,"nose_3":0,"chest_3":0,"watches_1":-1,"hair_color_2":0,"age_1":0,"bproof_2":0}', '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[{"count":5,"name":"bread"},{"count":5,"name":"water"},{"count":1,"name":"phone"}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"percent":98.665,"name":"hunger","val":986650},{"percent":98.665,"name":"thirst","val":986650},{"percent":0.0,"name":"drunk","val":0},{"percent":0.0,"name":"drug","val":0}]', NULL, 'Axel', 'Sanchez', '19', 'm', '200', NULL, NULL, 0, 1, 0, 0, 200, NULL, '{"widget_gorunum":false}', '0', '{"phone":"555471295","account":"IBAN5687744877","lastname":"","firstname":""}', '{"phone":{"InstalledApps":[]},"walletid":"QS-92324304","cryptoid":"cpt-Im291","CryptoCurrency":[]}', NULL, NULL),
	(35, 'license:8b2dd308c0f10d32e5a363e13f7d1d016161668f', NULL, NULL, 'user', 0, '{"x":-785.4000244140625,"y":343.29998779296877,"z":216.8000030517578}', NULL, '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[{"count":10,"name":"bread"},{"count":10,"name":"water"},{"count":2,"name":"phone"}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"percent":99.265,"name":"hunger","val":992650},{"percent":99.265,"name":"thirst","val":992650},{"percent":0.0,"name":"drunk","val":0},{"percent":0.0,"name":"drug","val":0}]', NULL, 'Malcolm ', 'Murdock', '10/06/1995', 'm', '180', NULL, NULL, 0, 1, 0, 0, 200, NULL, NULL, '0', '{"phone":"555526715","account":"IBAN3277843413","lastname":"","firstname":""}', '{"phone":{"InstalledApps":[]},"walletid":"QS-32339093","cryptoid":"cpt-eo848","CryptoCurrency":[]}', NULL, NULL),
	(36, 'license:a0e80b30c01ed966e9e9af43980587c7b526bace', NULL, NULL, 'user', 0, '{"x":-785.4000244140625,"y":343.29998779296877,"z":216.8000030517578}', NULL, '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"percent":98.83,"name":"hunger","val":988300},{"percent":98.83,"name":"thirst","val":988300},{"percent":0.0,"name":"drunk","val":0},{"percent":0.0,"name":"drug","val":0}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 200, NULL, NULL, '0', '{"phone":"555345388","account":"IBAN8757996242","lastname":"","firstname":""}', '{"phone":{"InstalledApps":[]},"walletid":"QS-16970166","cryptoid":"cpt-Qe550","CryptoCurrency":[]}', NULL, NULL),
	(37, 'license:d4e9cbeaacc2b0ce1d1c8ce7f53ee71b8183867c', NULL, NULL, 'user', 0, '{"x":-801.2999877929688,"y":-1057.300048828125,"z":12.39999961853027}', '{"pants_1":61,"bracelets_2":0,"arms_2":0,"chin_1":0,"chin_4":0,"hair_color_1":0,"ears_1":-1,"mask_1":0,"decals_1":0,"nose_4":0,"shoes_2":0,"bodyb_1":-1,"complexion_1":0,"watches_2":0,"jaw_2":0,"eye_squint":0,"beard_4":0,"lipstick_1":0,"ears_2":0,"shoes_1":28,"eyebrows_1":0,"lip_thickness":0,"sex":0,"pants_2":0,"cheeks_2":0,"tshirt_1":15,"tshirt_2":0,"lipstick_3":0,"blemishes_2":0,"makeup_1":0,"helmet_1":-1,"nose_2":0,"jaw_1":0,"bodyb_3":-1,"bproof_2":0,"hair_2":0,"glasses_1":0,"helmet_2":0,"glasses_2":0,"chin_3":0,"nose_6":0,"blemishes_1":0,"lipstick_4":0,"hair_1":2,"dad":0,"nose_1":0,"torso_2":0,"face_md_weight":50,"neck_thickness":0,"bags_2":0,"beard_3":0,"makeup_2":0,"bproof_1":0,"cheeks_3":0,"bracelets_1":-1,"torso_1":254,"mask_2":0,"arms":0,"moles_1":0,"chest_1":0,"sun_2":0,"lipstick_2":0,"eyebrows_5":0,"mom":21,"decals_2":0,"bodyb_2":0,"bags_1":0,"watches_1":-1,"skin_md_weight":50,"eye_color":9,"nose_3":0,"moles_2":0,"age_2":0,"blush_2":0,"chin_2":0,"sun_1":0,"makeup_4":0,"chain_1":28,"nose_5":0,"eyebrows_4":0,"beard_2":10.0,"makeup_3":0,"blush_1":0,"chest_2":0,"blush_3":0,"eyebrows_6":0,"cheeks_1":0,"complexion_2":0,"bodyb_4":0,"eyebrows_2":9.7,"eyebrows_3":0,"chest_3":0,"chain_2":0,"hair_color_2":0,"age_1":0,"beard_1":1}', '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[{"count":5,"name":"water"},{"count":5,"name":"bread"},{"count":1,"name":"phone"}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"percent":98.4,"name":"hunger","val":984000},{"percent":98.4,"name":"thirst","val":984000},{"percent":0.0,"name":"drunk","val":0},{"percent":0.0,"name":"drug","val":0}]', NULL, 'Dick', 'Aprio', '200', 'm', '200', NULL, NULL, 0, 1, 0, 0, 200, NULL, NULL, '0', '{"phone":"555181988","account":"IBAN9016410490","lastname":"Aprio","firstname":"Dick"}', '{"phone":{"InstalledApps":[]},"walletid":"QS-57529608","cryptoid":"cpt-zk857","CryptoCurrency":[]}', NULL, NULL),
	(38, 'license:efd104ae3a0f12892e88c17f63c0d08cd80f2b49', NULL, NULL, 'user', 0, '{"x":-785.4000244140625,"y":343.29998779296877,"z":216.89999389648438}', NULL, '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[]', '[]', 'unemployed', 0, 'unemployed2', 0, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 200, NULL, NULL, '0', '{"phone":"555521597","account":"IBAN1989271480","lastname":"","firstname":""}', '{"phone":{"InstalledApps":[]},"walletid":"QS-98972997","cryptoid":"cpt-AW100","CryptoCurrency":[]}', NULL, NULL),
	(39, 'license:17d8f0a88f62475eac0559a09a7a06355ba9b2ec', NULL, NULL, 'user', 0, '{"x":-805.5999755859375,"y":332.29998779296877,"z":220.39999389648438}', NULL, '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[{"count":10,"name":"bread"},{"count":10,"name":"water"},{"count":2,"name":"phone"}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"percent":99.26,"name":"hunger","val":992600},{"percent":99.26,"name":"thirst","val":992600},{"percent":0.0,"name":"drunk","val":0},{"percent":0.0,"name":"drug","val":0}]', NULL, NULL, NULL, '18', 'm', NULL, NULL, NULL, 0, 1, 0, 0, 200, NULL, NULL, '0', '{"phone":"555836663","account":"IBAN9998116946","lastname":"","firstname":""}', '{"phone":{"InstalledApps":[]},"walletid":"QS-76128236","cryptoid":"cpt-Wv813","CryptoCurrency":[]}', NULL, NULL),
	(40, 'license:6b4fbc2620bf3fe8fe144b88ecde934e50ac49c9', NULL, NULL, 'user', 0, '{"x":85.69999694824219,"y":-988.7000122070313,"z":28.60000038146972}', '{"pants_1":61,"bracelets_2":0,"arms_2":0,"chin_1":0,"blush_2":0,"complexion_2":0,"ears_1":-1,"decals_2":0,"decals_1":0,"nose_4":0,"shoes_2":0,"bodyb_1":-1,"complexion_1":0,"watches_2":0,"jaw_2":0,"eye_squint":0,"beard_4":0,"blush_1":0,"ears_2":0,"shoes_1":28,"eyebrows_1":10,"lip_thickness":0,"sex":0,"pants_2":0,"chain_2":0,"tshirt_1":15,"tshirt_2":0,"lipstick_3":0,"blemishes_2":0,"makeup_1":0,"helmet_1":-1,"beard_1":10,"jaw_1":0,"bodyb_3":-1,"dad":0,"hair_2":0,"neck_thickness":0,"helmet_2":0,"glasses_2":0,"chin_3":0,"chest_2":0,"chest_1":0,"lipstick_4":0,"hair_1":6,"bodyb_4":0,"nose_2":0,"chin_2":0,"eyebrows_3":0,"mask_1":0,"bags_2":0,"beard_3":0,"cheeks_1":0,"bproof_1":0,"cheeks_3":0,"arms":0,"bproof_2":0,"mask_2":0,"blemishes_1":0,"moles_1":0,"bracelets_1":-1,"sun_2":0,"lipstick_2":0,"torso_1":254,"chin_4":0,"nose_3":0,"bodyb_2":0,"bags_1":0,"cheeks_2":0,"skin_md_weight":50,"eye_color":9,"makeup_3":0,"moles_2":0,"glasses_1":0,"nose_6":0,"nose_1":0,"sun_1":0,"makeup_4":0,"watches_1":-1,"nose_5":0,"eyebrows_2":10.0,"beard_2":10.0,"mom":21,"face_md_weight":50,"eyebrows_5":0,"blush_3":0,"hair_color_1":0,"lipstick_1":0,"eyebrows_6":0,"age_2":0,"eyebrows_4":0,"makeup_2":0,"chest_3":0,"chain_1":28,"hair_color_2":0,"age_1":0,"torso_2":0}', '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[{"count":5,"name":"water"},{"count":5,"name":"bread"},{"count":1,"name":"phone"}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"percent":99.92999999999999,"name":"hunger","val":999300},{"percent":99.92999999999999,"name":"thirst","val":999300},{"percent":0.0,"name":"drunk","val":0},{"percent":0.0,"name":"drug","val":0}]', NULL, 'louis', 'louis', 'louis', 'm', 'louis', NULL, NULL, 0, 1, 0, 0, 200, NULL, NULL, '0', '{"phone":"555951114","account":"IBAN4326836147","lastname":"louis","firstname":"louis"}', '{"phone":{"InstalledApps":[]},"walletid":"QS-70078456","cryptoid":"cpt-wS069","CryptoCurrency":[]}', NULL, NULL),
	(41, 'license:44730fcd67e41f528b8916be9fdce29964561530', NULL, NULL, 'user', 0, '{"x":523.0,"y":115.5,"z":96.5}', '{"makeup_3":0,"bracelets_2":0,"arms_2":0,"chin_1":0,"chin_4":0,"complexion_2":0,"ears_1":-1,"mask_1":0,"decals_1":0,"nose_4":0,"shoes_2":0,"bodyb_1":-1,"complexion_1":0,"watches_2":0,"jaw_2":0,"eye_squint":0,"beard_4":0,"lipstick_1":0,"ears_2":0,"shoes_1":28,"eyebrows_1":0,"lip_thickness":0,"sex":0,"pants_2":0,"chain_2":0,"tshirt_1":15,"tshirt_2":0,"lipstick_3":0,"blemishes_2":0,"makeup_1":0,"helmet_1":-1,"beard_1":0,"jaw_1":0,"bodyb_3":-1,"dad":0,"hair_2":0,"neck_thickness":0,"helmet_2":0,"glasses_2":0,"chin_3":0,"chest_2":0,"chest_1":0,"lipstick_4":0,"hair_1":0,"blush_2":0,"torso_1":254,"torso_2":0,"eyebrows_4":0,"face_md_weight":50,"bags_2":0,"beard_3":0,"cheeks_1":0,"bproof_1":0,"cheeks_3":0,"bracelets_1":-1,"decals_2":0,"mask_2":0,"bproof_2":0,"moles_1":0,"eyebrows_3":0,"sun_2":0,"lipstick_2":0,"eyebrows_5":0,"nose_3":0,"watches_1":-1,"bodyb_2":0,"bags_1":0,"pants_1":61,"skin_md_weight":50,"eye_color":0,"blush_1":0,"moles_2":0,"nose_6":0,"chin_2":0,"glasses_1":0,"sun_1":0,"makeup_4":0,"eyebrows_6":0,"nose_5":0,"bodyb_4":0,"beard_2":0,"chain_1":28,"mom":21,"hair_color_1":0,"blush_3":0,"makeup_2":0,"nose_1":0,"eyebrows_2":0,"cheeks_2":0,"blemishes_1":0,"arms":0,"chest_3":0,"nose_2":0,"hair_color_2":0,"age_1":0,"age_2":0}', '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[{"count":5,"name":"water"},{"count":5,"name":"bread"},{"count":1,"name":"phone"}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"percent":99.35000000000001,"name":"hunger","val":993500},{"percent":99.35000000000001,"name":"thirst","val":993500},{"percent":0.0,"name":"drunk","val":0},{"percent":0.0,"name":"drug","val":0}]', NULL, 'negre', 'negre', 'negre', 'm', 'negre', NULL, NULL, 0, 1051, 0, 0, 191, NULL, NULL, '0', '{"phone":"555130583","account":"IBAN7426498354","lastname":"negre","firstname":"negre"}', '{"phone":{"InstalledApps":[]},"walletid":"QS-94975577","cryptoid":"cpt-Tn095","CryptoCurrency":[]}', NULL, NULL),
	(42, 'license:07091b465a1b387c8a6d6968d6c841dcaeae2d57', NULL, NULL, 'user', 0, '{"x":-642.9000244140625,"y":-970.9000244140625,"z":21.39999961853027}', '{"pants_1":61,"bracelets_2":0,"arms_2":0,"bodyb_4":0,"chin_4":0,"hair_color_1":0,"ears_1":-1,"mask_1":0,"decals_1":0,"nose_4":0,"shoes_2":0,"bodyb_1":-1,"complexion_1":0,"watches_2":0,"jaw_2":0,"watches_1":-1,"beard_4":0,"lipstick_1":0,"ears_2":0,"shoes_1":28,"eyebrows_1":0,"lip_thickness":0,"sex":0,"pants_2":0,"cheeks_2":0,"tshirt_1":15,"tshirt_2":0,"lipstick_3":0,"blemishes_2":0,"makeup_1":0,"chain_1":28,"beard_1":0,"jaw_1":0,"bodyb_3":-1,"dad":0,"hair_2":0,"glasses_1":0,"helmet_2":0,"glasses_2":0,"chin_3":0,"nose_6":0,"chest_1":0,"lipstick_4":0,"hair_1":7,"makeup_3":0,"chin_1":0,"torso_2":0,"bproof_1":0,"bracelets_1":-1,"bags_2":0,"beard_3":0,"cheeks_1":0,"nose_1":0,"face_md_weight":50,"arms":0,"chain_2":0,"mask_2":0,"chin_2":0,"moles_1":0,"neck_thickness":0,"sun_2":0,"lipstick_2":0,"eyebrows_4":0,"cheeks_3":0,"complexion_2":0,"bodyb_2":0,"bags_1":0,"age_2":0,"skin_md_weight":50,"eye_color":0,"chest_2":0,"moles_2":0,"bproof_2":0,"decals_2":0,"nose_3":0,"sun_1":0,"makeup_4":0,"eyebrows_6":0,"nose_5":0,"blemishes_1":0,"beard_2":0,"blush_2":0,"mom":21,"nose_2":0,"blush_3":0,"eyebrows_3":0,"helmet_1":-1,"makeup_2":0,"eyebrows_5":0,"eyebrows_2":0,"eye_squint":0,"chest_3":0,"torso_1":254,"hair_color_2":0,"age_1":0,"blush_1":0}', '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[{"count":5,"name":"water"},{"count":5,"name":"bread"},{"count":1,"name":"phone"}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"percent":92.845,"name":"hunger","val":928450},{"percent":92.845,"name":"thirst","val":928450},{"percent":0.0,"name":"drunk","val":0},{"percent":0.0,"name":"drug","val":0}]', NULL, 'ZARA', 'MHENEZ', '02/02/1998', 'm', '200', NULL, NULL, 0, 1, 0, 0, 200, NULL, NULL, '0', '{"phone":"555168860","account":"IBAN4654996233","lastname":"MHENEZ","firstname":"ZARA"}', '{"phone":{"InstalledApps":[]},"walletid":"QS-64915617","cryptoid":"cpt-ce203","CryptoCurrency":[]}', NULL, NULL),
	(43, 'license:cf5d504aad8457773961dd28b37ce37e16db8923', NULL, NULL, 'user', 0, '{"x":-43.4000015258789,"y":-693.5999755859375,"z":32.29999923706055}', '{"pants_1":0,"bracelets_2":0,"arms_2":0,"chin_1":0,"eyebrows_2":0,"hair_color_1":0,"ears_1":-1,"decals_2":0,"decals_1":0,"nose_4":0,"shoes_2":0,"bodyb_1":-1,"complexion_1":0,"watches_2":0,"jaw_2":0,"watches_1":-1,"beard_4":0,"lipstick_1":0,"ears_2":0,"shoes_1":0,"eyebrows_1":0,"lip_thickness":0,"sex":0,"pants_2":0,"cheeks_2":0,"tshirt_1":0,"tshirt_2":0,"lipstick_3":0,"blemishes_2":0,"makeup_1":0,"chain_1":0,"beard_1":0,"jaw_1":0,"bodyb_3":-1,"dad":3,"hair_2":0,"glasses_1":0,"helmet_2":0,"glasses_2":0,"chin_3":0,"chest_2":0,"blemishes_1":0,"lipstick_4":0,"hair_1":4,"nose_3":0,"eye_squint":0,"chin_2":0,"neck_thickness":0,"torso_1":0,"bags_2":0,"beard_3":0,"makeup_2":0,"bproof_1":0,"face_md_weight":50,"arms":0,"bracelets_1":-1,"mask_2":0,"bodyb_4":0,"moles_1":0,"helmet_1":-1,"sun_2":0,"lipstick_2":0,"eyebrows_5":0,"chain_2":0,"makeup_3":0,"bodyb_2":0,"bags_1":0,"blush_2":0,"skin_md_weight":50,"eye_color":0,"age_2":0,"moles_2":0,"bproof_2":0,"eyebrows_4":0,"nose_1":0,"sun_1":0,"makeup_4":0,"nose_6":0,"nose_5":0,"chest_1":0,"beard_2":0,"cheeks_1":0,"chin_4":0,"mom":2,"blush_3":0,"complexion_2":0,"eyebrows_6":0,"torso_2":0,"mask_1":0,"cheeks_3":0,"eyebrows_3":0,"chest_3":0,"blush_1":0,"hair_color_2":0,"age_1":0,"nose_2":0}', '[{"money":25000,"name":"cash"},{"money":29364,"name":"dirtycash"},{"money":25,"name":"bank"},{"money":0,"name":"chip"},{"money":1,"name":"fidelcoins"}]', '[{"count":5,"name":"bread"},{"count":5,"name":"water"},{"count":1,"name":"phone"}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"percent":90.0,"name":"hunger","val":900000},{"percent":90.0,"name":"thirst","val":900000},{"percent":0.0,"name":"drunk","val":0},{"percent":0.0,"name":"drug","val":0}]', NULL, 'Tyler', 'Joshua', '22', 'm', '195', NULL, NULL, 0, 2101, 0, 0, 200, NULL, NULL, '0', '{"phone":"555917091","account":"IBAN9113843323","lastname":"","firstname":""}', '{"phone":{"InstalledApps":[]},"walletid":"QS-82883020","cryptoid":"cpt-yQ468","CryptoCurrency":[]}', NULL, NULL),
	(44, 'license:c33553d0860e631beb5586d1947bb3ccdbdb4ce4', NULL, NULL, 'user', 0, '{"x":-785.4000244140625,"y":343.1000061035156,"z":216.8000030517578}', NULL, '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[]', '[]', 'unemployed', 0, 'unemployed2', 0, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 200, NULL, NULL, '0', '{"phone":"555386705","account":"IBAN1232368860","lastname":"","firstname":""}', '{"phone":{"InstalledApps":[]},"walletid":"QS-99602145","cryptoid":"cpt-YH678","CryptoCurrency":[]}', NULL, NULL),
	(45, 'license:ca1d88031d0d25bcca2ab217cbe329177c25cff9', NULL, NULL, 'user', 0, '{"x":-790.9000244140625,"y":-1054.300048828125,"z":12.0}', '{"makeup_3":0,"bracelets_2":0,"arms_2":0,"chin_1":0,"eyebrows_6":0,"hair_color_1":0,"ears_1":-1,"decals_2":0,"decals_1":0,"nose_4":0,"shoes_2":0,"bodyb_1":-1,"complexion_1":0,"watches_2":0,"jaw_2":0,"watches_1":-1,"beard_4":0,"blush_1":0,"ears_2":0,"shoes_1":28,"eyebrows_1":0,"lip_thickness":0,"sex":0,"pants_2":0,"cheeks_2":0,"tshirt_1":15,"tshirt_2":0,"lipstick_3":0,"blemishes_2":0,"makeup_1":0,"chain_1":28,"beard_1":1,"jaw_1":0,"bodyb_3":-1,"bproof_2":0,"hair_2":0,"glasses_1":0,"helmet_2":0,"glasses_2":0,"chin_3":0,"chest_2":0,"blemishes_1":0,"lipstick_4":0,"hair_1":2,"bodyb_4":0,"lipstick_1":0,"torso_2":0,"dad":0,"mask_1":0,"bags_2":0,"beard_3":0,"cheeks_1":0,"bproof_1":0,"face_md_weight":50,"arms":0,"chest_1":0,"mask_2":0,"complexion_2":0,"moles_1":0,"eyebrows_3":0,"sun_2":0,"lipstick_2":0,"torso_1":254,"mom":21,"chin_2":0,"bodyb_2":0,"bags_1":0,"eyebrows_5":0,"skin_md_weight":50,"eye_color":0,"neck_thickness":0,"moles_2":0,"chin_4":0,"pants_1":61,"nose_6":0,"sun_1":0,"makeup_4":0,"eyebrows_4":0,"nose_5":0,"chain_2":0,"beard_2":0,"eyebrows_2":0,"nose_3":0,"helmet_1":-1,"blush_3":0,"makeup_2":0,"nose_1":0,"cheeks_3":0,"bracelets_1":-1,"eye_squint":0,"nose_2":0,"chest_3":0,"blush_2":0,"hair_color_2":0,"age_1":0,"age_2":0}', '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[{"count":5,"name":"bread"},{"count":5,"name":"water"},{"count":1,"name":"phone"}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"percent":98.98,"name":"hunger","val":989800},{"percent":98.98,"name":"thirst","val":989800},{"percent":0.0,"name":"drunk","val":0},{"percent":0.0,"name":"drug","val":0}]', NULL, 'wededs[', 'wedd', 'wede', 'm', 'wedde', NULL, NULL, 0, 1, 0, 0, 199, NULL, NULL, '0', '{"phone":"555695946","account":"IBAN2877639773","lastname":"","firstname":""}', '{"phone":{"InstalledApps":[]},"walletid":"QS-96162683","cryptoid":"cpt-Ld663","CryptoCurrency":[]}', NULL, NULL),
	(46, 'license:5203102308639a36633cfce5e4a45ac9bab82a93', NULL, NULL, 'user', 0, '{"x":-822.9000244140625,"y":-123.30000305175781,"z":28.20000076293945}', NULL, '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"percent":99.86500000000001,"name":"hunger","val":998650},{"percent":99.86500000000001,"name":"thirst","val":998650},{"percent":0.0,"name":"drunk","val":0},{"percent":0.0,"name":"drug","val":0}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 200, NULL, NULL, '0', '{"phone":"555524885","account":"IBAN2163138874","lastname":"","firstname":""}', '{"phone":{"InstalledApps":[]},"walletid":"QS-65610847","cryptoid":"cpt-km791","CryptoCurrency":[]}', NULL, NULL),
	(47, 'license:63b7781c2a1bc429c70113ad64f73ae69ce0a789', NULL, NULL, 'user', 0, '{"x":-130.10000610351563,"y":-1140.4000244140626,"z":25.10000038146972}', '{"pants_1":61,"bracelets_2":0,"arms_2":0,"chin_1":0,"eyebrows_2":0,"complexion_2":0,"ears_1":-1,"decals_2":0,"decals_1":0,"nose_4":0,"shoes_2":0,"bodyb_1":-1,"complexion_1":0,"watches_2":0,"jaw_2":0,"eye_squint":0,"beard_4":0,"blush_1":0,"ears_2":0,"shoes_1":28,"eyebrows_1":0,"lip_thickness":0,"sex":0,"pants_2":0,"cheeks_2":0,"tshirt_1":15,"tshirt_2":0,"lipstick_3":0,"blemishes_2":0,"makeup_1":0,"helmet_1":-1,"beard_1":0,"jaw_1":0,"bodyb_3":-1,"bproof_2":0,"hair_2":0,"neck_thickness":0,"helmet_2":0,"glasses_2":0,"chin_3":0,"chest_2":0,"chest_1":0,"lipstick_4":0,"hair_1":0,"watches_1":-1,"mask_1":0,"chin_2":0,"bodyb_4":0,"nose_2":0,"bags_2":0,"beard_3":0,"cheeks_1":0,"bproof_1":0,"cheeks_3":0,"bracelets_1":-1,"nose_6":0,"mask_2":0,"nose_1":0,"moles_1":0,"chain_2":0,"sun_2":0,"lipstick_2":0,"eyebrows_5":0,"lipstick_1":0,"dad":0,"bodyb_2":0,"bags_1":0,"hair_color_1":0,"skin_md_weight":50,"eye_color":0,"blush_2":0,"moles_2":0,"face_md_weight":50,"chain_1":28,"age_2":0,"sun_1":0,"makeup_4":0,"makeup_3":0,"nose_5":0,"blemishes_1":0,"beard_2":0,"eyebrows_4":0,"mom":21,"chin_4":0,"blush_3":0,"makeup_2":0,"eyebrows_3":0,"arms":0,"torso_2":0,"torso_1":254,"eyebrows_6":0,"chest_3":0,"glasses_1":0,"hair_color_2":0,"age_1":0,"nose_3":0}', '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[{"count":5,"name":"bread"},{"count":5,"name":"water"},{"count":1,"name":"phone"}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"percent":98.13,"name":"hunger","val":981300},{"percent":98.13,"name":"thirst","val":981300},{"percent":0.0,"name":"drunk","val":0},{"percent":0.0,"name":"drug","val":0}]', NULL, 'Dorian', 'Grand', '45', 'm', '145', NULL, NULL, 0, 1, 0, 0, 199, NULL, NULL, '0', '{"phone":"555214436","account":"IBAN8368650299","lastname":"","firstname":""}', '{"phone":{"InstalledApps":[]},"walletid":"QS-58980178","cryptoid":"cpt-ug391","CryptoCurrency":[]}', NULL, NULL),
	(48, 'license:5e6b1e3c9912bca10bbf0a2258cab659480d5e21', NULL, NULL, 'user', 0, '{"x":-787.9000244140625,"y":-1046.5999755859376,"z":12.39999961853027}', '{"makeup_3":0,"bracelets_2":0,"arms_2":0,"bodyb_4":0,"eyebrows_2":0,"complexion_2":0,"ears_1":-1,"mask_1":0,"decals_1":0,"nose_4":0,"shoes_2":0,"bodyb_1":-1,"complexion_1":0,"watches_2":0,"jaw_2":0,"watches_1":-1,"beard_4":0,"lipstick_1":0,"ears_2":0,"shoes_1":0,"eyebrows_1":0,"lip_thickness":0,"sex":0,"pants_2":0,"chain_2":0,"tshirt_1":0,"tshirt_2":0,"lipstick_3":0,"blemishes_2":0,"makeup_1":0,"helmet_1":-1,"nose_2":9.0,"jaw_1":0,"bodyb_3":-1,"bproof_2":0,"hair_2":0,"neck_thickness":0,"helmet_2":0,"glasses_2":0,"chin_3":0,"nose_6":0,"blemishes_1":0,"lipstick_4":0,"hair_1":0,"bracelets_1":-1,"blush_2":0,"chin_2":0,"eye_squint":0,"dad":0,"bags_2":0,"beard_3":0,"cheeks_1":0,"nose_1":0,"face_md_weight":50,"arms":0,"eyebrows_5":0,"mask_2":0,"age_2":0,"moles_1":0,"chest_3":0,"sun_2":0,"lipstick_2":0,"eyebrows_4":0,"chain_1":0,"chin_1":0,"bodyb_2":0,"bags_1":0,"mom":21,"skin_md_weight":50,"eye_color":0,"makeup_2":0,"moles_2":0,"cheeks_3":0,"beard_1":0,"eyebrows_6":0,"sun_1":0,"makeup_4":0,"pants_1":0,"nose_5":10.0,"hair_color_1":0,"beard_2":0,"chest_2":0,"chest_1":0,"chin_4":0,"blush_3":0,"torso_1":0,"nose_3":0,"torso_2":0,"decals_2":0,"bproof_1":0,"blush_1":0,"eyebrows_3":0,"cheeks_2":0,"hair_color_2":0,"age_1":0,"glasses_1":0}', '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[{"count":5,"name":"bread"},{"count":5,"name":"water"},{"count":1,"name":"phone"}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"percent":97.77,"name":"hunger","val":977700},{"percent":97.77,"name":"thirst","val":977700},{"percent":0.0,"name":"drunk","val":0},{"percent":0.0,"name":"drug","val":0}]', NULL, '745_FLEX', 'ALEXIS', '13', 'm', '1,60', NULL, NULL, 0, 1, 0, 0, 200, NULL, NULL, '0', '{"phone":"555201052","account":"IBAN4129668131","lastname":"","firstname":""}', '{"phone":{"InstalledApps":[]},"walletid":"QS-55181433","cryptoid":"cpt-tP867","CryptoCurrency":[]}', NULL, NULL),
	(49, 'license:42514dcf5b5f34d8d249a01f66ccdffec3f74833', NULL, NULL, 'user', 0, '{"x":-829.2999877929688,"y":-1073.9000244140626,"z":11.30000019073486}', '{"makeup_3":0,"bracelets_2":0,"arms_2":0,"bodyb_4":0,"eyebrows_2":0,"nose_3":0,"ears_1":-1,"mask_1":0,"decals_1":0,"nose_4":0,"shoes_2":0,"bodyb_1":-1,"complexion_1":0,"watches_2":0,"jaw_2":0,"watches_1":-1,"beard_4":0,"lipstick_1":0,"ears_2":0,"shoes_1":18,"eyebrows_1":24,"lip_thickness":0,"sex":1,"pants_2":0,"chain_2":0,"tshirt_1":16,"tshirt_2":0,"lipstick_3":0,"blemishes_2":0,"makeup_1":0,"chain_1":0,"beard_1":0,"jaw_1":0,"bodyb_3":-1,"dad":21,"hair_2":0,"glasses_1":0,"helmet_2":0,"glasses_2":0,"chin_3":0,"chest_2":0,"chest_1":0,"lipstick_4":0,"hair_1":14,"torso_1":33,"eyebrows_5":0,"torso_2":0,"makeup_2":0,"complexion_2":0,"bags_2":0,"beard_3":0,"cheeks_1":0,"bproof_1":0,"face_md_weight":100,"arms":16,"chin_1":0,"mask_2":0,"chin_2":0,"moles_1":0,"blush_2":0,"sun_2":0,"lipstick_2":0,"eyebrows_4":0,"helmet_1":-1,"bracelets_1":-1,"bodyb_2":0,"bags_1":0,"cheeks_2":0,"skin_md_weight":98.0,"eye_color":5,"nose_2":0,"moles_2":0,"cheeks_3":0,"nose_1":0,"nose_6":0,"sun_1":0,"makeup_4":0,"blush_1":0,"nose_5":0,"eyebrows_3":0,"beard_2":0,"neck_thickness":0,"bproof_2":0,"chin_4":0,"blush_3":0,"hair_color_1":0,"decals_2":0,"pants_1":62,"eyebrows_6":0,"eye_squint":0,"mom":17,"chest_3":0,"blemishes_1":0,"hair_color_2":0,"age_1":0,"age_2":0}', '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[{"count":5,"name":"bread"},{"count":5,"name":"water"},{"count":1,"name":"phone"}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"percent":98.08,"name":"hunger","val":980800},{"percent":98.08,"name":"thirst","val":980800},{"percent":0.0,"name":"drunk","val":0},{"percent":0.0,"name":"drug","val":0}]', NULL, 'Lily', 'Rose', '11/07/2000', 'f', '2m30cm', NULL, NULL, 0, 1, 0, 0, 175, NULL, NULL, '0', '{"phone":"555638353","account":"IBAN4913259166","lastname":"","firstname":""}', '{"phone":{"InstalledApps":[]},"walletid":"QS-58381385","cryptoid":"cpt-VM046","CryptoCurrency":[]}', NULL, NULL),
	(50, 'license:e8a849c4ebb701efb4f651c6bf596d80252cad42', NULL, NULL, 'user', 0, '{"x":-760.0,"y":-654.5,"z":53.4000015258789}', '{"pants_1":61,"bracelets_2":0,"arms_2":0,"chin_1":0,"eyebrows_2":0,"complexion_2":0,"ears_1":-1,"decals_2":0,"decals_1":0,"nose_4":0,"shoes_2":0,"bodyb_1":-1,"complexion_1":0,"watches_2":0,"jaw_2":0,"eye_squint":0,"beard_4":0,"lipstick_1":0,"ears_2":0,"shoes_1":28,"eyebrows_1":0,"lip_thickness":0,"sex":0,"pants_2":0,"cheeks_2":0,"tshirt_1":15,"tshirt_2":0,"lipstick_3":0,"blemishes_2":0,"makeup_1":0,"chain_1":28,"beard_1":0,"jaw_1":0,"bodyb_3":-1,"dad":0,"hair_2":0,"glasses_1":0,"helmet_2":0,"glasses_2":0,"chin_3":0,"chest_2":0,"chest_1":0,"lipstick_4":0,"hair_1":0,"helmet_1":-1,"nose_2":0,"torso_2":0,"chain_2":0,"bracelets_1":-1,"bags_2":0,"beard_3":0,"cheeks_1":0,"nose_1":0,"face_md_weight":50,"arms":0,"bproof_2":0,"mask_2":0,"bodyb_4":0,"moles_1":0,"bproof_1":0,"sun_2":0,"lipstick_2":0,"torso_1":254,"eyebrows_4":0,"cheeks_3":0,"bodyb_2":0,"bags_1":0,"chin_4":0,"skin_md_weight":50,"eye_color":0,"nose_3":0,"moles_2":0,"watches_1":-1,"blush_2":0,"blemishes_1":0,"sun_1":0,"makeup_4":0,"mask_1":0,"nose_5":0,"blush_1":0,"beard_2":0,"eyebrows_6":0,"eyebrows_3":0,"nose_6":0,"blush_3":0,"makeup_3":0,"makeup_2":0,"mom":21,"eyebrows_5":0,"hair_color_1":0,"neck_thickness":0,"chest_3":0,"chin_2":0,"hair_color_2":0,"age_1":0,"age_2":0}', '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[{"count":5,"name":"water"},{"count":5,"name":"bread"},{"count":1,"name":"phone"}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"percent":95.585,"name":"hunger","val":955850},{"percent":95.585,"name":"thirst","val":955850},{"percent":0.0,"name":"drunk","val":0},{"percent":0.0,"name":"drug","val":0}]', NULL, 'Hugi', 'Gay', '18', 'm', '185', NULL, NULL, 0, 1, 0, 0, 200, NULL, NULL, '0', '{"phone":"555481463","account":"IBAN8639985699","lastname":"Gay","firstname":"Hugi"}', '{"phone":{"InstalledApps":[]},"walletid":"QS-48654011","cryptoid":"cpt-VD945","CryptoCurrency":[]}', NULL, NULL),
	(51, 'license:f57cbaffc364f51fc165f2a95dad2b59b43aa3c8', NULL, NULL, 'user', 0, '{"x":-855.2000122070313,"y":-730.7999877929688,"z":24.29999923706054}', '{"makeup_3":0,"bracelets_2":0,"arms_2":0,"chin_1":0,"eyebrows_6":0,"complexion_2":0,"ears_1":-1,"decals_2":0,"decals_1":0,"nose_4":0,"shoes_2":0,"bodyb_1":-1,"complexion_1":0,"watches_2":0,"jaw_2":0,"eye_squint":0,"beard_4":0,"lipstick_1":0,"ears_2":0,"shoes_1":0,"eyebrows_1":0,"lip_thickness":0,"sex":0,"pants_2":0,"cheeks_2":0,"tshirt_1":0,"tshirt_2":0,"lipstick_3":0,"blemishes_2":0,"makeup_1":0,"helmet_1":-1,"nose_2":0,"jaw_1":0,"bodyb_3":-1,"dad":0,"hair_2":0,"neck_thickness":0,"helmet_2":0,"glasses_2":0,"chin_3":0,"chest_2":0,"blemishes_1":0,"lipstick_4":0,"hair_1":0,"chin_4":0,"nose_6":0,"torso_2":0,"eyebrows_4":0,"bproof_2":0,"bags_2":0,"beard_3":0,"makeup_2":0,"nose_1":0,"face_md_weight":50,"arms":0,"nose_3":0,"mask_2":0,"mask_1":0,"moles_1":0,"hair_color_1":0,"sun_2":0,"lipstick_2":0,"torso_1":0,"eyebrows_5":0,"bodyb_4":0,"bodyb_2":0,"bags_1":0,"age_2":0,"skin_md_weight":50,"eye_color":0,"chest_1":0,"moles_2":0,"cheeks_3":0,"blush_1":0,"eyebrows_3":0,"sun_1":0,"makeup_4":0,"eyebrows_2":0,"nose_5":0,"pants_1":0,"beard_2":0,"chain_2":0,"blush_2":0,"mom":21,"blush_3":0,"beard_1":0,"chin_2":0,"cheeks_1":0,"bproof_1":0,"watches_1":-1,"bracelets_1":-1,"chest_3":0,"chain_1":0,"hair_color_2":0,"age_1":0,"glasses_1":0}', '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[{"count":5,"name":"bread"},{"count":5,"name":"water"},{"count":1,"name":"phone"}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"percent":98.22,"name":"hunger","val":982200},{"percent":98.22,"name":"thirst","val":982200},{"percent":0.0,"name":"drunk","val":0},{"percent":0.0,"name":"drug","val":0}]', NULL, 'DDDDDDDD', 'Dzzzzd', '14', 'm', '111', NULL, NULL, 0, 1, 0, 0, 200, NULL, NULL, '0', '{"phone":"555310096","account":"IBAN6029862773","lastname":"","firstname":""}', '{"phone":{"InstalledApps":[]},"walletid":"QS-79691397","cryptoid":"cpt-eq195","CryptoCurrency":[]}', NULL, NULL),
	(52, 'license:6339c1a2cfbb27bdea9586377d4537d3fbda3e61', NULL, NULL, 'user', 0, '{"x":-822.9000244140625,"y":-123.30000305175781,"z":28.20000076293945}', NULL, '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[]', '[]', 'unemployed', 0, 'unemployed2', 0, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 200, NULL, NULL, NULL, '{"phone":"555288271","account":"IBAN9326369417","lastname":"","firstname":""}', '{"phone":{"InstalledApps":[]},"walletid":"QS-53947275","cryptoid":"cpt-QG142","CryptoCurrency":[]}', NULL, NULL),
	(53, 'license:33d330aae30191a8ae6fe52c2015d5a6576f3d59', NULL, NULL, 'user', 0, '{"x":-798.5,"y":339.3999938964844,"z":219.60000610351563}', '{"pants_1":61,"bracelets_2":0,"arms_2":0,"chin_1":0,"eyebrows_2":0,"nose_3":0,"ears_1":-1,"decals_2":0,"decals_1":0,"nose_4":0,"shoes_2":0,"bodyb_1":-1,"complexion_1":0,"watches_2":0,"jaw_2":0,"eye_squint":0,"beard_4":0,"blush_1":0,"ears_2":0,"shoes_1":28,"eyebrows_1":4,"lip_thickness":0,"sex":0,"pants_2":0,"chain_2":0,"tshirt_1":15,"tshirt_2":0,"lipstick_3":0,"blemishes_2":0,"makeup_1":0,"helmet_1":-1,"nose_2":0,"jaw_1":0,"bodyb_3":-1,"dad":1,"hair_2":0,"glasses_1":0,"helmet_2":0,"glasses_2":0,"chin_3":0,"nose_6":0,"blemishes_1":0,"lipstick_4":0,"hair_1":12,"complexion_2":0,"cheeks_1":0,"torso_2":0,"chain_1":28,"mom":21,"bags_2":0,"beard_3":0,"makeup_2":0,"nose_1":0,"cheeks_3":0,"arms":0,"cheeks_2":0,"mask_2":0,"bproof_1":0,"moles_1":0,"lipstick_1":0,"sun_2":0,"lipstick_2":0,"eyebrows_5":0,"neck_thickness":0,"bodyb_4":0,"bodyb_2":0,"bags_1":0,"blush_2":0,"skin_md_weight":50,"eye_color":4,"torso_1":254,"moles_2":0,"chin_4":0,"bracelets_1":-1,"makeup_3":0,"sun_1":0,"makeup_4":0,"chest_2":0,"nose_5":0,"chest_1":0,"beard_2":0,"face_md_weight":50,"eyebrows_6":0,"age_2":0,"blush_3":0,"chin_2":0,"mask_1":0,"watches_1":-1,"eyebrows_4":0,"hair_color_1":0,"bproof_2":0,"chest_3":0,"eyebrows_3":0,"hair_color_2":0,"age_1":0,"beard_1":6}', '[{"money":28640,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":43360,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[{"count":4,"name":"water"},{"count":5,"name":"bread"},{"count":1,"name":"phone"}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"percent":99.985,"name":"hunger","val":999850},{"percent":99.985,"name":"thirst","val":999850},{"percent":0.0,"name":"drunk","val":0},{"percent":0.0,"name":"drug","val":0}]', NULL, 'jan', 'khorani', 'jan', 'm', 'jan', NULL, NULL, 0, 1051, 0, 0, 200, NULL, NULL, '0', '{"phone":"555579702","account":"IBAN6741966241","lastname":"khorani","firstname":"jan"}', '{"phone":{"InstalledApps":[]},"walletid":"QS-48358455","cryptoid":"cpt-Vh552","CryptoCurrency":[]}', NULL, NULL),
	(54, 'license:08bee9809c7e7f8bfdcd7b840afc08b58279f780', NULL, NULL, 'user', 0, '{"x":-759.9000244140625,"y":-1104.9000244140626,"z":10.69999980926513}', '{"pants_1":61,"bracelets_2":0,"arms_2":0,"bodyb_4":0,"eyebrows_2":0,"nose_3":0,"ears_1":-1,"decals_2":0,"decals_1":0,"nose_4":0,"shoes_2":0,"bodyb_1":-1,"complexion_1":0,"watches_2":0,"jaw_2":0,"eye_squint":0,"beard_4":0,"lipstick_1":0,"ears_2":0,"shoes_1":28,"eyebrows_1":3,"lip_thickness":0,"sex":0,"pants_2":0,"chain_2":0,"tshirt_1":15,"tshirt_2":0,"lipstick_3":0,"blemishes_2":0,"makeup_1":0,"chain_1":28,"beard_1":7,"jaw_1":0,"bodyb_3":-1,"bproof_2":0,"hair_2":0,"neck_thickness":0,"helmet_2":0,"glasses_2":0,"chin_3":0,"nose_6":0,"chest_1":0,"lipstick_4":0,"hair_1":14,"helmet_1":-1,"chest_3":0,"torso_2":0,"dad":7,"chin_4":0,"bags_2":0,"beard_3":0,"cheeks_1":0,"nose_1":0,"cheeks_3":0,"bracelets_1":-1,"nose_2":0,"mask_2":0,"eyebrows_4":0,"moles_1":0,"blush_2":0,"sun_2":0,"lipstick_2":0,"eyebrows_5":0,"bproof_1":0,"torso_1":254,"bodyb_2":0,"bags_1":0,"mom":21,"skin_md_weight":50,"eye_color":2,"arms":0,"moles_2":0,"blush_1":0,"mask_1":0,"blemishes_1":0,"sun_1":0,"makeup_4":0,"cheeks_2":0,"nose_5":0,"makeup_3":0,"beard_2":0,"chest_2":0,"eyebrows_6":0,"makeup_2":0,"blush_3":0,"complexion_2":0,"chin_2":0,"age_2":0,"face_md_weight":50,"watches_1":-1,"hair_color_1":0,"eyebrows_3":0,"chin_1":0,"hair_color_2":0,"age_1":0,"glasses_1":0}', '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[{"count":10,"name":"bread"},{"count":10,"name":"water"},{"count":2,"name":"phone"}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"percent":98.67,"name":"hunger","val":986700},{"percent":98.67,"name":"thirst","val":986700},{"percent":0.0,"name":"drunk","val":0},{"percent":0.0,"name":"drug","val":0}]', NULL, NULL, NULL, '18', 'm', NULL, NULL, NULL, 0, 1, 0, 0, 200, NULL, NULL, '0', '{"phone":"555341359","account":"IBAN3929691160","lastname":"","firstname":""}', '{"phone":{"InstalledApps":[]},"walletid":"QS-39591258","cryptoid":"cpt-LG624","CryptoCurrency":[]}', NULL, NULL),
	(55, 'license:5839bd0648b6519bb31d5e395685d41d4b96cf35', NULL, NULL, 'user', 0, '{"x":229.5,"y":-882.5999755859375,"z":30.5}', '{"pants_1":61,"bracelets_2":0,"arms_2":0,"bodyb_4":0,"chin_4":0,"complexion_2":0,"ears_1":-1,"decals_2":0,"decals_1":0,"nose_4":0,"shoes_2":0,"bodyb_1":-1,"complexion_1":0,"watches_2":0,"jaw_2":0,"watches_1":-1,"beard_4":0,"blush_1":0,"ears_2":0,"shoes_1":28,"eyebrows_1":5,"lip_thickness":0,"sex":0,"pants_2":0,"chain_2":0,"tshirt_1":15,"tshirt_2":0,"lipstick_3":0,"blemishes_2":0,"makeup_1":0,"chain_1":28,"beard_1":10,"jaw_1":0,"bodyb_3":-1,"bproof_2":0,"hair_2":0,"age_2":0,"helmet_2":0,"glasses_2":0,"chin_3":0,"nose_6":0,"blemishes_1":0,"lipstick_4":0,"hair_1":11,"helmet_1":-1,"torso_1":254,"chin_2":0,"mask_1":0,"nose_2":0,"bags_2":0,"beard_3":0,"cheeks_1":0,"bproof_1":0,"cheeks_3":0,"arms":0,"chest_2":0,"mask_2":0,"cheeks_2":0,"moles_1":0,"eyebrows_3":0,"sun_2":0,"lipstick_2":0,"eyebrows_5":0,"eyebrows_4":0,"chin_1":0,"bodyb_2":0,"bags_1":0,"hair_color_1":0,"skin_md_weight":47.00000000000018,"eye_color":2,"eyebrows_6":0,"moles_2":0,"lipstick_1":0,"eyebrows_2":0,"makeup_3":0,"sun_1":0,"makeup_4":0,"chest_1":0,"nose_5":0,"face_md_weight":47.00000000000001,"beard_2":0,"mom":10,"blush_2":0,"nose_3":0,"blush_3":0,"torso_2":0,"makeup_2":0,"nose_1":0,"bracelets_1":-1,"glasses_1":0,"eye_squint":0,"chest_3":0,"dad":13,"hair_color_2":0,"age_1":0,"neck_thickness":0}', '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[{"count":20,"name":"bread"},{"count":20,"name":"water"},{"count":4,"name":"phone"}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"percent":96.285,"name":"hunger","val":962850},{"percent":96.285,"name":"thirst","val":962850},{"percent":0.0,"name":"drunk","val":0},{"percent":0.0,"name":"drug","val":0}]', NULL, NULL, NULL, NULL, 'm', NULL, NULL, NULL, 0, 1, 0, 0, 200, NULL, NULL, '0', '{"phone":"555677549","account":"IBAN5544384593","lastname":"","firstname":""}', '{"phone":{"InstalledApps":[]},"walletid":"QS-79845735","cryptoid":"cpt-RQ376","CryptoCurrency":[]}', NULL, NULL),
	(56, 'license:80019cf46f860351cfd79dc1d174f4e52f234034', NULL, NULL, 'user', 0, '{"x":-785.4000244140625,"y":343.29998779296877,"z":217.10000610351563}', NULL, '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[]', '[]', 'unemployed', 0, 'unemployed2', 0, '[]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 200, NULL, NULL, '0', '{"phone":"555185931","account":"IBAN6741957296","lastname":"","firstname":""}', '{"phone":{"InstalledApps":[]},"walletid":"QS-27122752","cryptoid":"cpt-Lo759","CryptoCurrency":[]}', NULL, NULL),
	(57, 'license:e7b2e663bbf6a24a12b25818893434f812b9c45b', NULL, NULL, 'user', 0, '{"x":324.1000061035156,"y":-584.2999877929688,"z":43.29999923706055}', '{"pants_1":61,"bracelets_2":0,"arms_2":0,"chin_1":0,"eyebrows_2":9.8,"hair_color_1":0,"ears_1":-1,"mask_1":0,"decals_1":0,"nose_4":0,"shoes_2":0,"bodyb_1":-1,"complexion_1":0,"watches_2":0,"jaw_2":0,"watches_1":-1,"beard_4":0,"lipstick_1":0,"ears_2":0,"shoes_1":28,"eyebrows_1":1,"lip_thickness":0,"sex":0,"pants_2":0,"cheeks_2":0,"tshirt_1":15,"tshirt_2":0,"lipstick_3":0,"blemishes_2":0,"makeup_1":0,"helmet_1":-1,"nose_2":0,"jaw_1":0,"bodyb_3":-1,"dad":0,"hair_2":0,"age_2":0,"helmet_2":0,"glasses_2":0,"chin_3":0,"chest_2":0,"chest_1":0,"lipstick_4":0,"hair_1":11,"blush_2":0,"arms":0,"torso_2":0,"complexion_2":0,"neck_thickness":0,"bags_2":0,"beard_3":0,"makeup_2":0,"bproof_1":0,"face_md_weight":50,"bracelets_1":-1,"nose_6":0,"mask_2":0,"bproof_2":0,"moles_1":0,"blush_1":0,"sun_2":0,"lipstick_2":0,"eyebrows_4":0,"eyebrows_6":0,"chain_2":0,"bodyb_2":0,"bags_1":0,"cheeks_1":0,"skin_md_weight":50,"eye_color":0,"nose_3":0,"moles_2":0,"bodyb_4":0,"eyebrows_5":0,"eyebrows_3":0,"sun_1":0,"makeup_4":0,"nose_1":0,"nose_5":0,"glasses_1":0,"beard_2":10.0,"makeup_3":0,"chin_4":0,"decals_2":0,"blush_3":0,"chain_1":28,"eye_squint":0,"torso_1":254,"cheeks_3":0,"chin_2":0,"mom":21,"chest_3":0,"blemishes_1":0,"hair_color_2":0,"age_1":0,"beard_1":10}', '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[{"count":5,"name":"bread"},{"count":5,"name":"water"},{"count":1,"name":"phone"}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"percent":99.955,"name":"hunger","val":999550},{"percent":99.955,"name":"thirst","val":999550},{"percent":0.0,"name":"drunk","val":0},{"percent":0.0,"name":"drug","val":0}]', NULL, 'Weed', 'Will', '22', 'm', '185', NULL, NULL, 0, 1051, 0, 0, 200, NULL, NULL, '0', '{"phone":"555572684","account":"IBAN7222390228","lastname":"","firstname":""}', '{"phone":{"InstalledApps":[]},"walletid":"QS-16096010","cryptoid":"cpt-CJ337","CryptoCurrency":[]}', NULL, NULL),
	(58, 'license:4108734c231c4d79813c0dba44ad9533d79b2bcc', NULL, NULL, 'user', 0, '{"x":-785.4000244140625,"y":343.1000061035156,"z":216.89999389648438}', NULL, '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"percent":99.42,"name":"hunger","val":994200},{"percent":99.42,"name":"thirst","val":994200},{"percent":0.0,"name":"drunk","val":0},{"percent":0.0,"name":"drug","val":0}]', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, 0, 0, 200, NULL, NULL, '0', '{"phone":"555408642","account":"IBAN5024896182","lastname":"","firstname":""}', '{"phone":{"InstalledApps":[]},"walletid":"QS-19153799","cryptoid":"cpt-PH092","CryptoCurrency":[]}', NULL, NULL),
	(59, 'license:4e2da4d529d2cc3f1c508c526e90d3158e921f98', NULL, NULL, 'user', 0, '{"x":-61.0,"y":-1073.0,"z":27.29999923706054}', '{"makeup_3":0,"bracelets_2":0,"arms_2":0,"bodyb_4":0,"chin_4":0,"complexion_2":0,"ears_1":-1,"mask_1":0,"decals_1":0,"nose_4":0,"shoes_2":0,"bodyb_1":-1,"complexion_1":0,"watches_2":0,"jaw_2":0,"eye_squint":0,"beard_4":0,"lipstick_1":0,"ears_2":0,"shoes_1":0,"eyebrows_1":0,"lip_thickness":0,"sex":0,"pants_2":0,"cheeks_2":0,"tshirt_1":0,"tshirt_2":0,"lipstick_3":0,"blemishes_2":0,"makeup_1":0,"helmet_1":-1,"nose_2":0,"jaw_1":0,"bodyb_3":-1,"dad":2,"hair_2":0,"neck_thickness":0,"helmet_2":0,"glasses_2":0,"chin_3":0,"chest_2":0,"blemishes_1":0,"lipstick_4":0,"hair_1":0,"beard_1":0,"arms":0,"chin_2":0,"bproof_1":0,"cheeks_1":0,"bags_2":0,"beard_3":0,"makeup_2":0,"nose_1":0,"cheeks_3":0,"bracelets_1":-1,"eyebrows_2":0,"mask_2":0,"chest_1":0,"moles_1":0,"blush_2":0,"sun_2":0,"lipstick_2":0,"eyebrows_4":0,"pants_1":0,"chain_1":0,"bodyb_2":0,"bags_1":0,"torso_1":0,"skin_md_weight":50,"eye_color":0,"torso_2":0,"moles_2":0,"eyebrows_6":0,"glasses_1":0,"blush_1":0,"sun_1":0,"makeup_4":0,"hair_color_1":0,"nose_5":0,"nose_6":0,"beard_2":0,"chin_1":0,"nose_3":0,"decals_2":0,"blush_3":0,"mom":21,"eyebrows_5":0,"face_md_weight":50,"watches_1":-1,"age_2":0,"eyebrows_3":0,"chest_3":0,"bproof_2":0,"hair_color_2":0,"age_1":0,"chain_2":0}', '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[{"count":5,"name":"bread"},{"count":5,"name":"water"},{"count":1,"name":"phone"}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"percent":97.94500000000001,"name":"hunger","val":979450},{"percent":97.94500000000001,"name":"thirst","val":979450},{"percent":0.0,"name":"drunk","val":0},{"percent":0.0,"name":"drug","val":0}]', NULL, 'Anton', 'Horvat', '88', 'm', '123', NULL, NULL, 0, 1, 0, 0, 198, NULL, '{"widget_gorunum":false}', '0', '{"phone":"555641613","account":"IBAN9902966286","lastname":"","firstname":""}', '{"phone":{"InstalledApps":[]},"walletid":"QS-31662678","cryptoid":"cpt-tX914","CryptoCurrency":[]}', NULL, NULL),
	(60, 'license:0952c2029a28248d70dc879a193c1b91aa5475fe', NULL, NULL, 'fondateur', 0, '{"x":-33.70000076293945,"z":26.39999961853027,"y":-1099.5999755859376}', '{"pants_2":0,"mask_2":0,"glasses_2":0,"chain_2":0,"jaw_2":0,"hair_color_2":0,"chest_3":0,"watches_1":-1,"decals_1":0,"torso_1":254,"hair_1":2,"chin_2":0,"cheeks_2":0,"arms_2":0,"chest_2":0,"pants_1":61,"complexion_2":0,"cheeks_1":0,"age_1":0,"blush_2":0,"makeup_1":0,"hair_color_1":0,"eyebrows_5":0,"bodyb_2":0,"bags_1":0,"age_2":0,"bracelets_2":0,"hair_2":0,"sun_1":0,"blemishes_2":0,"mask_1":0,"lipstick_1":0,"makeup_3":0,"ears_1":-1,"bodyb_1":-1,"moles_1":0,"beard_4":0,"bproof_2":0,"bodyb_4":0,"nose_2":0,"chin_1":0,"bracelets_1":-1,"glasses_1":0,"helmet_1":-1,"makeup_2":0,"tshirt_1":15,"eyebrows_6":0,"nose_6":0,"skin_md_weight":74.99999999999992,"eyebrows_3":0,"tshirt_2":0,"chin_3":0,"chin_4":0,"chain_1":28,"ears_2":0,"shoes_1":28,"arms":0,"dad":3,"decals_2":0,"sun_2":0,"face_md_weight":9.0,"beard_3":0,"mom":4,"eyebrows_1":3,"nose_3":0,"bproof_1":0,"blemishes_1":0,"jaw_1":0,"lip_thickness":0,"beard_2":0,"makeup_4":0,"cheeks_3":0,"helmet_2":0,"bodyb_3":-1,"sex":0,"nose_5":0,"shoes_2":0,"blush_3":0,"bags_2":0,"eye_squint":0,"torso_2":0,"complexion_1":0,"lipstick_3":0,"blush_1":0,"eyebrows_4":0,"eye_color":3,"eyebrows_2":0,"nose_1":4.9,"beard_1":3,"watches_2":0,"lipstick_4":0,"neck_thickness":0,"lipstick_2":0,"chest_1":0,"nose_4":0,"moles_2":0}', '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[{"name":"water","count":5},{"name":"bread","count":5},{"name":"phone","count":1}]', '[]', 'carshop', 3, 'unemployed2', 0, '[{"name":"hunger","val":840050,"percent":84.005},{"name":"thirst","val":840050,"percent":84.005},{"name":"drunk","val":0,"percent":0.0},{"name":"drug","val":0,"percent":0.0}]', NULL, 'Hox', 'Dupont Agnan', '16', 'm', '180', NULL, NULL, 0, 1051, 0, 0, 199, NULL, NULL, '0', '{"account":"IBAN4281825894","lastname":"Dupont Agnan","firstname":"Hox","phone":"555212616"}', '{"CryptoCurrency":[],"cryptoid":"cpt-Qj829","walletid":"QS-41228082","phone":{"InstalledApps":[]}}', NULL, NULL),
	(61, 'license:12374a551ca0dc681bed492fe4cd1fc449f757c7', NULL, NULL, 'user', 0, '{"z":168.10000610351563,"y":-456.3999938964844,"x":-911.2000122070313}', '{"eyebrows_4":0,"glasses_2":0,"eye_squint":0,"lip_thickness":0,"bproof_2":0,"bags_1":0,"jaw_2":0,"dad":0,"makeup_1":0,"cheeks_3":0,"beard_2":0,"lipstick_4":0,"bracelets_1":-1,"complexion_2":0,"eyebrows_5":0,"lipstick_2":0,"nose_4":0,"neck_thickness":0,"nose_5":0,"chest_2":0,"sex":0,"lipstick_3":0,"blush_2":0,"watches_1":-1,"skin_md_weight":50,"bodyb_3":-1,"age_2":0,"pants_1":61,"jaw_1":0,"hair_2":0,"lipstick_1":0,"bproof_1":0,"shoes_2":0,"chain_1":28,"complexion_1":0,"makeup_4":0,"blush_1":0,"sun_1":0,"chin_2":0,"beard_4":0,"glasses_1":0,"decals_1":0,"cheeks_1":0,"torso_2":0,"watches_2":0,"blush_3":0,"bodyb_1":-1,"hair_color_2":0,"tshirt_1":15,"age_1":0,"nose_3":0,"ears_2":0,"helmet_1":-1,"chin_1":0,"eye_color":0,"eyebrows_2":0,"bodyb_2":0,"arms":0,"nose_2":0,"bodyb_4":0,"moles_1":0,"nose_6":0,"chain_2":0,"chin_4":0,"chest_3":0,"mask_2":0,"blemishes_2":0,"eyebrows_6":0,"nose_1":0,"torso_1":254,"makeup_2":0,"eyebrows_3":0,"decals_2":0,"mom":21,"chest_1":0,"tshirt_2":0,"beard_3":0,"cheeks_2":0,"face_md_weight":50,"ears_1":-1,"moles_2":0,"pants_2":0,"makeup_3":0,"mask_1":0,"eyebrows_1":0,"hair_color_1":0,"blemishes_1":0,"helmet_2":0,"arms_2":0,"hair_1":12,"sun_2":0,"bracelets_2":0,"bags_2":0,"beard_1":0,"shoes_1":28,"chin_3":0}', '[{"money":25000,"name":"cash"},{"money":0,"name":"dirtycash"},{"money":50000,"name":"bank"},{"money":0,"name":"chip"},{"money":0,"name":"fidelcoins"}]', '[{"count":5,"name":"bread"},{"count":5,"name":"water"},{"count":1,"name":"phone"}]', '[]', 'unemployed', 0, 'unemployed2', 0, '[{"percent":99.265,"name":"hunger","val":992650},{"percent":99.265,"name":"thirst","val":992650},{"percent":0.0,"name":"drunk","val":0},{"percent":0.0,"name":"drug","val":0}]', NULL, 'Jhon', 'Lade', '17/09/1999', 'm', '180', NULL, NULL, 0, 1, 0, 0, 195, NULL, NULL, '0', '{"phone":"555138377","account":"IBAN6674374013","lastname":"","firstname":""}', '{"phone":{"InstalledApps":[]},"cryptoid":"cpt-Xq171","walletid":"QS-29162574","CryptoCurrency":[]}', NULL, NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table bluestark.users_jail
CREATE TABLE IF NOT EXISTS `users_jail` (
  `id_colum` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` text DEFAULT NULL,
  `time` int(11) NOT NULL DEFAULT 0,
  `reason` longtext NOT NULL,
  `author` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_colum`)
) ENGINE=InnoDB AUTO_INCREMENT=517 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.users_jail: ~1 rows (approximately)
/*!40000 ALTER TABLE `users_jail` DISABLE KEYS */;
REPLACE INTO `users_jail` (`id_colum`, `identifier`, `time`, `reason`, `author`) VALUES
	(516, 'license:3b812812ad65ece34da9a84c3d7aa2bb1257f2a7', 600, 'fdp', 'User');
/*!40000 ALTER TABLE `users_jail` ENABLE KEYS */;

-- Dumping structure for table bluestark.user_accessories
CREATE TABLE IF NOT EXISTS `user_accessories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL,
  `mask` varchar(255) DEFAULT NULL,
  `tshirt` varchar(255) DEFAULT NULL,
  `bras` varchar(255) DEFAULT NULL,
  `label` varchar(50) DEFAULT 'Masque',
  `type` varchar(50) DEFAULT NULL,
  `index` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.user_accessories: 0 rows
/*!40000 ALTER TABLE `user_accessories` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_accessories` ENABLE KEYS */;

-- Dumping structure for table bluestark.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `owner` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.user_licenses: ~6 rows (approximately)
/*!40000 ALTER TABLE `user_licenses` DISABLE KEYS */;
REPLACE INTO `user_licenses` (`id`, `type`, `owner`) VALUES
	(1, 'dmv', 'license:cf5d504aad8457773961dd28b37ce37e16db8923'),
	(2, 'drive', 'license:cf5d504aad8457773961dd28b37ce37e16db8923'),
	(3, 'drive_truck', 'license:cf5d504aad8457773961dd28b37ce37e16db8923'),
	(4, 'drive_bike', 'license:cf5d504aad8457773961dd28b37ce37e16db8923'),
	(5, 'theory_test', 'license:cf5d504aad8457773961dd28b37ce37e16db8923'),
	(6, 'theory_test', 'license:cf5d504aad8457773961dd28b37ce37e16db8923');
/*!40000 ALTER TABLE `user_licenses` ENABLE KEYS */;

-- Dumping structure for table bluestark.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `model` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`model`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.vehicles: ~307 rows (approximately)
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
REPLACE INTO `vehicles` (`model`, `name`, `price`, `category`) VALUES
	('adder', 'Adder', 500000, 'super'),
	('akuma', 'Akuma', 102000, 'motorcycles'),
	('alpha', 'Alpha', 142500, 'sports'),
	('asbo', 'Asbo', 68000, 'compacts'),
	('asea', 'Asea', 18750, 'sedans'),
	('autarch', 'Autarch', 900000, 'super'),
	('avarus', 'Avarus', 125000, 'motorcycles'),
	('bagger', 'Bagger', 65000, 'motorcycles'),
	('baller2', 'Baller', 50000, 'suvs'),
	('baller3', 'Baller Sport', 75000, 'suvs'),
	('banshee', 'Banshee', 105000, 'sports'),
	('banshee2', 'Banshee 900R', 125000, 'super'),
	('bati', 'Bati 801', 128000, 'motorcycles'),
	('bestiagts', 'Bestia GTS', 187500, 'sports'),
	('bf400', 'BF400', 100000, 'motorcycles'),
	('bfinjection', 'Bf Injection', 15000, 'offroad'),
	('bifta', 'Bifta', 15000, 'offroad'),
	('bison', 'Bison', 45000, 'vans'),
	('blade', 'Blade', 22500, 'muscle'),
	('blazer', 'Blazer', 60000, 'motorcycles'),
	('blazer3', 'Blazer Hot Road', 75000, 'motorcycles'),
	('blazer4', 'Blazer Sport', 100000, 'motorcycles'),
	('blista', 'Blista', 10500, 'compacts'),
	('blista2', 'Blista Sport', 28000, 'sports'),
	('bmx', 'BMX (velo)', 150, 'motorcycles'),
	('bobcatxl', 'Bobcat XL', 32000, 'vans'),
	('brawler', 'Brawler', 142500, 'offroad'),
	('brioso', 'Brioso R/A', 30000, 'compacts'),
	('btype', 'Btype', 110000, 'sportsclassics'),
	('btype2', 'Btype Hotroad', 155000, 'sportsclassics'),
	('btype3', 'Btype Luxe', 120000, 'sportsclassics'),
	('buccaneer', 'Buccaneer', 27000, 'muscle'),
	('buccaneer2', 'Buccaneer Rider', 33750, 'muscle'),
	('buffalo', 'Buffalo', 61500, 'sports'),
	('buffalo2', 'Buffalo S', 90000, 'sports'),
	('bullet', 'Bullet', 90000, 'super'),
	('burrito3', 'Burrito', 19000, 'vans'),
	('calico', 'Calico', 65000, 'sports'),
	('camper', 'Camper', 35000, 'vans'),
	('caracara2', 'Caracara', 1500000, 'offroad'),
	('carbonizzare', 'Carbonizzare', 112500, 'sports'),
	('carbonrs', 'Carbon RS', 120000, 'motorcycles'),
	('casco', 'Casco', 30000, 'sportsclassics'),
	('cavalcade2', 'Cavalcade', 40000, 'suvs'),
	('cheburek', 'Cheburek', 24000, 'sportsclassics'),
	('cheetah', 'Cheetah', 22000, 'super'),
	('cheetah2', 'Cheetah Retro', 440000, 'sportsclassics'),
	('chimera', 'Chimera', 88500, 'motorcycles'),
	('chino', 'Chino', 20250, 'muscle'),
	('chino2', 'Chino Luxe', 27000, 'muscle'),
	('cliffhanger', 'Cliffhanger', 90000, 'motorcycles'),
	('club', 'Club', 48000, 'compacts'),
	('cogcabrio', 'Cognoscenti Cabrio', 55000, 'coupes'),
	('cognoscenti', 'Cognoscenti', 52500, 'sedans'),
	('comet2', 'Comet', 112500, 'sports'),
	('comet4', 'Comet Safari', 600000, 'sports'),
	('comet5', 'Comet GT', 1200000, 'sports'),
	('comet6', 'Comet 6', 55000, 'sports'),
	('contender', 'Contender', 135000, 'suvs'),
	('coquette', 'Coquette', 97500, 'sports'),
	('coquette2', 'Coquette Classic', 40000, 'sportsclassics'),
	('coquette3', 'Coquette BlackFin', 63750, 'muscle'),
	('cruiser', 'Cruiser (velo)', 180, 'motorcycles'),
	('cyclone', 'Cyclone', 1890000, 'super'),
	('cypher', 'Cypher', 90000, 'sports'),
	('daemon', 'Daemon', 75000, 'motorcycles'),
	('daemon2', 'Daemon High', 28500, 'motorcycles'),
	('defiler', 'Defiler', 75000, 'motorcycles'),
	('diabolus', 'Diabolus', 140000, 'motorcycles'),
	('diabolus2', 'Diabolus Custom', 150000, 'motorcycles'),
	('dinghy3', 'Dinghy', 15000000, 'superboat'),
	('dominator', 'Dominator', 88000, 'muscle'),
	('dominator3', 'Dominator GTX Vapid', 292500, 'muscle'),
	('dominator7', 'Dominator 7', 70000, 'muscle'),
	('double', 'Double T', 100500, 'motorcycles'),
	('drafter', '8F Drafter', 1500000, 'sports'),
	('dubsta', 'Dubsta', 45000, 'suvs'),
	('dubsta2', 'Dubsta Luxuary', 60000, 'suvs'),
	('dubsta3', 'Bubsta 6x6', 266250, 'offroad'),
	('dukes', 'Dukes', 31500, 'muscle'),
	('dune', 'Dune Buggy', 22500, 'offroad'),
	('elegy', 'Elegy Retro Custom', 675000, 'sports'),
	('elegy2', 'Elegy', 38500, 'sports'),
	('ellie', 'Ellie', 64000, 'muscle'),
	('emperor', 'Emperor', 11250, 'sedans'),
	('enduro', 'Enduro', 50000, 'motorcycles'),
	('entityxf', 'Entity XF', 210000, 'super'),
	('esskey', 'Esskey', 60000, 'motorcycles'),
	('euros', 'Euros', 80000, 'sports'),
	('everon', 'Everon', 120000, 'offroad'),
	('exemplar', 'Exemplar', 52500, 'coupes'),
	('f620', 'F620', 33000, 'coupes'),
	('faction', 'Faction', 22500, 'muscle'),
	('faction2', 'Faction Rider', 33750, 'muscle'),
	('faction3', 'Faction XL', 63750, 'muscle'),
	('faggio', 'Faggio', 17500, 'motorcycles'),
	('faggio2', 'Vespa', 15000, 'motorcycles'),
	('fcr', 'FCR 1000', 165000, 'motorcycles'),
	('felon', 'Felon', 47250, 'coupes'),
	('felon2', 'Felon GT', 47250, 'coupes'),
	('feltzer2', 'Feltzer', 57750, 'sports'),
	('feltzer3', 'Stirling GT', 65000, 'sportsclassics'),
	('fixter', 'Fixter (velo)', 50, 'motorcycles'),
	('fmj', 'FMJ', 185000, 'super'),
	('fq2', 'Fhantom', 12500, 'suvs'),
	('freecrawler', 'Freecrawler', 120000, 'offroad'),
	('fugitive', 'Fugitive', 30000, 'sedans'),
	('furoregt', 'Furore GT', 67500, 'sports'),
	('fusilade', 'Fusilade', 60000, 'sports'),
	('futo', 'Futo', 80000, 'sports'),
	('futo2', 'Futo 2', 75000, 'sports'),
	('gargoyle', 'Gargoyle', 150000, 'motorcycles'),
	('gauntlet', 'Gauntlet', 41250, 'muscle'),
	('gauntlet3', 'Gauntlet Retro', 48000, 'muscle'),
	('gb200', 'GB200', 247500, 'sports'),
	('gburrito', 'Gang Burrito', 45000, 'vans'),
	('gburrito2', 'Burrito', 29000, 'vans'),
	('glendale', 'Glendale', 18750, 'sedans'),
	('glendale2', 'Glendale Custom', 26250, 'sedans'),
	('granger', 'Grabger', 50000, 'suvs'),
	('gresley', 'Gresley', 30000, 'suvs'),
	('growler', 'Growler', 80000, 'sports'),
	('gt500', 'GT 500', 785000, 'sportsclassics'),
	('guardian', 'Guardian', 187500, 'offroad'),
	('hakuchou', 'Hakuchou', 180000, 'motorcycles'),
	('hakuchou2', 'Hakuchou Sport', 200000, 'motorcycles'),
	('hermes', 'Hermes', 607500, 'muscle'),
	('hexer', 'Hexer', 55000, 'motorcycles'),
	('hotknife', 'Hotknife', 142500, 'muscle'),
	('huntley', 'Huntley S', 40000, 'suvs'),
	('hustler', 'Hustler', 600000, 'muscle'),
	('infernus', 'Infernus', 180000, 'super'),
	('innovation', 'Innovation', 60000, 'motorcycles'),
	('intruder', 'Intruder', 18750, 'sedans'),
	('issi2', 'Issi', 11250, 'compacts'),
	('italigto', 'Itali GTO', 684000, 'sports'),
	('jackal', 'Jackal', 47250, 'coupes'),
	('jester', 'Jester', 97500, 'sports'),
	('jester2', 'Jester(Racecar)', 202500, 'sports'),
	('jester4', 'Jester 4', 90000, 'sports'),
	('jetmax', 'Jetmax', 14000000, 'superboat'),
	('journey', 'Journey', 6500, 'vans'),
	('jugular', 'Jugular', 1200000, 'sports'),
	('kamacho', 'Kamacho', 390000, 'offroad'),
	('kanjo', 'Kanjo', 120000, 'compacts'),
	('khamelion', 'Khamelion', 112500, 'sports'),
	('komoda', 'Komoda', 1125000, 'sports'),
	('kuruma', 'Kuruma', 900000, 'sports'),
	('landstalker', 'Landstalker', 35000, 'suvs'),
	('le7b', 'RE-7B', 325000, 'super'),
	('locust', 'Locust', 80000, 'sports'),
	('lynx', 'Lynx', 60000, 'sports'),
	('mamba', 'Mamba', 135000, 'sports'),
	('manana', 'Manana', 12800, 'sportsclassics'),
	('manana2', 'Manana Custom', 44000, 'sportsclassics'),
	('manchez', 'Manchez', 75000, 'motorcycles'),
	('marquis', 'Marquis', 11000000, 'superboat'),
	('massacro', 'Massacro', 97500, 'sports'),
	('massacro2', 'Massacro(Racecar)', 195000, 'sports'),
	('mesa', 'Mesa', 16000, 'suvs'),
	('mesa3', 'Mesa Trail', 32500, 'suvs'),
	('minivan', 'Minivan', 8000, 'vans'),
	('minivan2', 'Minivan Custom', 15000, 'vans'),
	('monroe', 'Monroe', 55000, 'sportsclassics'),
	('moonbeam', 'Moonbeam', 18000, 'vans'),
	('moonbeam2', 'Moonbeam Rider', 35000, 'vans'),
	('nemesis', 'Nemesis', 84000, 'motorcycles'),
	('neon', 'Neon', 900000, 'sports'),
	('nightblade', 'Nightblade', 165000, 'motorcycles'),
	('nightshade', 'Nightshade', 127500, 'muscle'),
	('ninef', '9F', 97500, 'sports'),
	('ninef2', '9F Cabrio', 120000, 'sports'),
	('novak', 'Novak', 140000, 'suvs'),
	('omnis', 'Omnis', 120000, 'sports'),
	('oracle2', 'Oracle XS', 29250, 'coupes'),
	('osiris', 'Osiris', 190000, 'super'),
	('outlaw', 'Outlaw', 850000, 'motorcycles'),
	('panto', 'Panto', 4500, 'compacts'),
	('paradise', 'Paradise', 10000, 'vans'),
	('pariah', 'Pariah', 2137500, 'sports'),
	('patriot', 'Patriot', 35000, 'suvs'),
	('pcj', 'PCJ-600', 90000, 'motorcycles'),
	('penumbra', 'Penumbra', 45000, 'sports'),
	('penumbra2', 'Penumbra FF', 157500, 'sports'),
	('pfister811', 'Pfister', 145000, 'super'),
	('phoenix', 'Phoenix', 22500, 'muscle'),
	('picador', 'Picador', 40500, 'muscle'),
	('pigalle', 'Pigalle', 20000, 'sportsclassics'),
	('prairie', 'Prairie', 13500, 'compacts'),
	('premier', 'Premier', 15000, 'sedans'),
	('previon', 'Previon', 45000, 'sports'),
	('primo', 'Primo', 22500, 'sedans'),
	('primo2', 'Primo Custom', 33750, 'sedans'),
	('prototipo', 'X80 Proto', 2500000, 'super'),
	('radi', 'Radius', 29000, 'suvs'),
	('raiden', 'raiden', 2100000, 'sports'),
	('rapidgt', 'Rapid GT', 82500, 'sports'),
	('rapidgt2', 'Rapid GT Convertible', 112500, 'sports'),
	('rapidgt3', 'Rapid GT3', 88500, 'sportsclassics'),
	('raptor', 'Raptor', 750000, 'motorcycles'),
	('reaper', 'Reaper', 150000, 'super'),
	('rebel2', 'Rebel', 52500, 'offroad'),
	('rebla', 'Rebla', 964000, 'suvs'),
	('regina', 'Regina', 11250, 'sedans'),
	('remus', 'Remus', 30000, 'sports'),
	('retinue', 'Retinue', 61500, 'sportsclassics'),
	('riata', 'riata', 337500, 'offroad'),
	('rocoto', 'Rocoto', 33000, 'suvs'),
	('rrocket', 'Rocket', 1250000, 'motorcycles'),
	('rt3000', 'RT3000', 45000, 'sports'),
	('ruffian', 'Ruffian', 105000, 'motorcycles'),
	('rumpo', 'Rumpo', 15000, 'vans'),
	('rumpo3', 'Rumpo Trail', 19500, 'vans'),
	('ruston', 'Ruston', 80000, 'sports'),
	('sabregt', 'Sabre Turbo', 20000, 'muscle'),
	('sabregt2', 'Sabre GT', 41250, 'muscle'),
	('sanchez', 'Sanchez', 50000, 'motorcycles'),
	('sanchez2', 'Sanchez Sport', 60000, 'motorcycles'),
	('sanctus', 'Sanctus', 180000, 'motorcycles'),
	('sandking', 'Sandking', 75000, 'offroad'),
	('savestra', 'Savestra', 990000, 'sportsclassics'),
	('sc1', 'SC 1', 800000, 'super'),
	('schafter2', 'Schafter', 90000, 'sedans'),
	('schafter3', 'Schafter V12', 300000, 'sports'),
	('schlagen', 'Schlagen', 1200000, 'sports'),
	('scorcher', 'Scorcher (velo)', 100, 'motorcycles'),
	('seashark', 'SeaShark', 11000000, 'superboat'),
	('seashark2', 'Seashark2', 12500000, 'superboat'),
	('seminole', 'Seminole', 150000, 'suvs'),
	('seminole2', 'Seminole Frontiere', 200000, 'suvs'),
	('sentinel', 'Sentinel', 36000, 'coupes'),
	('sentinel2', 'Sentinel XS', 33750, 'coupes'),
	('sentinel3', 'Sentinel Classique', 48750, 'sports'),
	('seven70', 'Seven 70', 60000, 'sports'),
	('sheava', 'ETR1', 220000, 'super'),
	('slamvan3', 'Slam Van', 18750, 'muscle'),
	('sovereign', 'Sovereign', 130000, 'motorcycles'),
	('speeder', 'Speeder', 14000000, 'superboat'),
	('squalo', 'Squalo', 11000000, 'superboat'),
	('stinger', 'Stinger', 80000, 'sportsclassics'),
	('stingergt', 'Stinger GT', 75000, 'sportsclassics'),
	('streiter', 'Streiter', 900000, 'sports'),
	('stretch', 'Stretch (entreprise seulement)', 101250, 'sedans'),
	('stryder', 'Stryder', 80000, 'motorcycles'),
	('sugoi', 'Sugoï', 400000, 'sports'),
	('sultan', 'Sultan', 90000, 'sports'),
	('sultan2', 'Sultan Retro', 562500, 'sports'),
	('sultan3', 'Sultan 3', 65000, 'sports'),
	('sultanrs', 'Sultan RS', 200000, 'super'),
	('suntrap', 'Stuntrap', 12500000, 'superboat'),
	('superd', 'Super Diamond', 146250, 'sedans'),
	('surano', 'Surano', 82500, 'sports'),
	('surfer', 'Surfer', 12000, 'vans'),
	('t20', 'T20', 500000, 'super'),
	('tailgater2', 'Tailgater 2', 85000, 'sports'),
	('tampa', 'Tampa', 18750, 'muscle'),
	('tampa2', 'Drift Tampa', 120000, 'sports'),
	('thrust', 'Thrust', 130000, 'motorcycles'),
	('tornado2', 'Tornado', 36000, 'sportsclassics'),
	('tornado5', 'Tornado Lowrider', 28000, 'sportsclassics'),
	('toro', 'Toro', 12500000, 'superboat'),
	('toros', 'Toros', 200000, 'suvs'),
	('tribike3', 'Tri bike (velo)', 150, 'motorcycles'),
	('trophytruck', 'Trophy Truck', 100000, 'offroad'),
	('trophytruck2', 'Trophy Truck Limited', 127500, 'offroad'),
	('tropic', 'Tropic', 11500000, 'superboat'),
	('tropos', 'Tropos', 262500, 'sports'),
	('tulip', 'Tulip', 48000, 'muscle'),
	('turismor', 'Turismo R', 340000, 'super'),
	('tyrus', 'Tyrus', 600000, 'super'),
	('vacca', 'Vacca', 120000, 'super'),
	('vader', 'Vader', 66000, 'motorcycles'),
	('vagrant', 'Vagrant', 1500000, 'motorcycles'),
	('vamos', 'Vamos', 64000, 'muscle'),
	('vectre', 'Vectre', 85000, 'sports'),
	('verlierer2', 'Verlierer', 112500, 'sports'),
	('vigero', 'Vigero', 22500, 'muscle'),
	('virgo', 'Virgo', 22500, 'muscle'),
	('virgo2', 'Virgo Lowrider', 40000, 'muscle'),
	('virgo3', 'Virgo Luxe', 52000, 'muscle'),
	('viseris', 'Viseris', 875000, 'sportsclassics'),
	('visione', 'Visione', 2250000, 'super'),
	('voltic', 'Voltic', 900000, 'super'),
	('voodoo', 'Voodoo', 15000, 'muscle'),
	('vortex', 'Vortex', 115000, 'motorcycles'),
	('vstr', 'VSTR', 637500, 'sports'),
	('warrener', 'Warrener', 7500, 'sedans'),
	('washington', 'Washington', 9000, 'sedans'),
	('weevil', 'Weevil', 52000, 'compacts'),
	('windsor', 'Windsor', 90000, 'coupes'),
	('windsor2', 'Windsor Drop', 120000, 'coupes'),
	('wolfsbane', 'Woflsbane', 90000, 'motorcycles'),
	('xls', 'XLS', 21000, 'suvs'),
	('yosemite', 'Yosemite', 135000, 'muscle'),
	('yosemite2', 'Yosemite Lowrider', 192000, 'muscle'),
	('youga', 'Youga', 10800, 'vans'),
	('youga2', 'Youga Luxuary', 6000, 'vans'),
	('youga3', 'Yougo Lowrider', 80000, 'vans'),
	('z190', 'Z190', 90000, 'sportsclassics'),
	('zentorno', 'Zentorno', 700000, 'super'),
	('zion', 'Zion', 40500, 'coupes'),
	('zion2', 'Zion Cabrio', 48000, 'coupes'),
	('zion3', 'Zion Classique', 200000, 'sportsclassics'),
	('zombiea', 'Zombie', 105000, 'motorcycles'),
	('zombieb', 'Zombie Luxuary', 120000, 'motorcycles'),
	('zr350', 'ZR350', 80000, 'sports'),
	('ztype', 'Z-Type', 22000, 'sportsclassics');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;

-- Dumping structure for table bluestark.vehicle_categories
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(60) COLLATE utf8mb4_bin NOT NULL,
  `society` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT 'carshop',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.vehicle_categories: ~11 rows (approximately)
/*!40000 ALTER TABLE `vehicle_categories` DISABLE KEYS */;
REPLACE INTO `vehicle_categories` (`name`, `label`, `society`) VALUES
	('compacts', 'Compacts', 'carshop'),
	('coupes', 'Coupes', 'carshop'),
	('muscle', 'Muscle', 'carshop'),
	('offroad', 'Off Road', 'carshop'),
	('sedans', 'Sedans', 'carshop'),
	('sports', 'Sports', 'carshop'),
	('sportsclassics', 'Sports Classics', 'carshop'),
	('super', 'Super', 'carshop'),
	('superboat', 'Bateau', 'boatshop'),
	('suvs', 'SUVs', 'carshop'),
	('vans', 'Vans', 'carshop');
/*!40000 ALTER TABLE `vehicle_categories` ENABLE KEYS */;

-- Dumping structure for table bluestark.vehicle_inventory
CREATE TABLE IF NOT EXISTS `vehicle_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.vehicle_inventory: ~0 rows (approximately)
/*!40000 ALTER TABLE `vehicle_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_inventory` ENABLE KEYS */;

-- Dumping structure for table bluestark.vehicle_sold
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `client` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `model` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `plate` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `soldby` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `date` varchar(50) COLLATE utf8mb4_bin NOT NULL,
  `society` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT 'carshop',
  PRIMARY KEY (`plate`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Dumping data for table bluestark.vehicle_sold: ~0 rows (approximately)
/*!40000 ALTER TABLE `vehicle_sold` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_sold` ENABLE KEYS */;

-- Dumping structure for table bluestark.vente_leboncoin
CREATE TABLE IF NOT EXISTS `vente_leboncoin` (
  `identifier` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.vente_leboncoin: ~0 rows (approximately)
/*!40000 ALTER TABLE `vente_leboncoin` DISABLE KEYS */;
/*!40000 ALTER TABLE `vente_leboncoin` ENABLE KEYS */;

-- Dumping structure for table bluestark.vips
CREATE TABLE IF NOT EXISTS `vips` (
  `identifier` varchar(50) NOT NULL DEFAULT '0',
  `vip` tinyint(4) NOT NULL DEFAULT 0,
  `expiration` int(255) NOT NULL DEFAULT 0,
  PRIMARY KEY (`identifier`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bluestark.vips: ~0 rows (approximately)
/*!40000 ALTER TABLE `vips` DISABLE KEYS */;
/*!40000 ALTER TABLE `vips` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
