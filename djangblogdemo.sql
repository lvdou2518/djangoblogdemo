-- MySQL dump 10.14  Distrib 5.5.44-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: djangoblogdemo
-- ------------------------------------------------------
-- Server version	5.5.44-MariaDB

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add category',7,'add_category'),(20,'Can change category',7,'change_category'),(21,'Can delete category',7,'delete_category'),(22,'Can add tag',8,'add_tag'),(23,'Can change tag',8,'change_tag'),(24,'Can delete tag',8,'delete_tag'),(25,'Can add article',9,'add_article'),(26,'Can change article',9,'change_article'),(27,'Can delete article',9,'delete_article'),(28,'Can add reply',10,'add_reply'),(29,'Can change reply',10,'change_reply'),(30,'Can delete reply',10,'delete_reply');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$1mq5mCzR5kRP$WQYHUT8OZPDU2M4MkQSiLG30v4xRsNeEJpR7ZpEo1u4=','2016-01-12 08:57:36',1,'admin','','','admin@admin.com',1,1,'2016-01-12 08:56:58');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article`
--

DROP TABLE IF EXISTS `blog_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `content` longtext NOT NULL,
  `created` datetime NOT NULL,
  `hits` int(11) NOT NULL,
  `reply_count` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_article_category_id_45371416e1252d6d_fk_blog_category_id` (`category_id`),
  CONSTRAINT `blog_article_category_id_45371416e1252d6d_fk_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article`
--

LOCK TABLES `blog_article` WRITE;
/*!40000 ALTER TABLE `blog_article` DISABLE KEYS */;
INSERT INTO `blog_article` VALUES (1,'Sed accumsan libero quis mi commodo et suscipit','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. \r\nAliquam viverra convallis auctor. Sed accumsan libero quis mi commodo et\r\n suscipit enim lacinia. Morbi rutrum vulputate est sed faucibus. Nulla \r\nsed nisl mauris, id tristique tortor. Sed iaculis dapibus urna nec \r\ndictum. Morbi rutrum vulputate est sed faucibus. Nulla sed nisl mauris, \r\nid tristique tortor. Sed iaculis dapibus urna nec dictum [...]</p><p><br/></p>','2016-01-13 03:08:45',0,0,1),(2,'表单','<p>的完整列表取决于用户所发送的Header信息和服务器<br/>端设置的Header信息。 这个字典中几个常见的键值有：<br/>1<br/>2010-5-5 第七章：表单<br/>djangobook.py3k.cn/2.0/chapter07/ 1/18<br/>HTTP_REFERER，进站前链接网页，如果有的话。 （请注意，它是REFERRER的笔误。）<br/>HTTP_USER_AGENT，用户浏览器的user-agent字符串，如果有的话。 例如：<br/>&quot;Mozilla/5.0 (X11; U; Linux i686; fr‐FR; rv:1.8.1.17) Gecko/20080829 Firefox/2.0.0.17&quot; .<br/>REMOTE_ADDR 客户端IP，如：&quot;12.345.67.89&quot; 。(如果申请是经过代理服务器的话，那么它可能是以逗号分<br/>割的多个IP地址，如：&quot;12.345.67.89,23.456.78.90&quot; 。)<br/>注意，因为 request.META 是一个普通的Python字典，因此当你试图访问一个不存在的键时，会触发一个<br/>KeyError异常。 （HTTP header信息是由用户的浏览器所提交的、不应该给予信任的“额外”数据，因此你总<br/>是应该好好设计你的应用以便当一个特定的Header数据不存在时，给出一个优雅的回应。）你应该用<br/>try/except 语句，或者用Python字典的 get() 方法来处理这些“可能不存在的键”：<br/># BAD!<br/>def ua_display_bad(request):<br/>ua = request.META[&#39;HTTP_USER_AGENT&#39;] # Might raise KeyError!<br/>return HttpResponse(&quot;Your browser is %s&quot; % ua)<br/># GOOD (VERSION 1)<br/>def ua_display_good1(request):<br/>try:<br/>ua = request.META[&#39;HTTP_USER_AGENT&#39;]<br/>except KeyError:<br/>ua = &#39;unknown&#39;<br/>return HttpResponse(&quot;Your browser is %s&quot; % ua)<br/># GOOD (VERSION 2)<br/>def ua_display_good2(request):<br/>ua = request.META.get(&#39;HTTP_USER_AGENT&#39;, &#39;unknown&#39;)<br/>return HttpResponse(&quot;Your browser is %s&quot; % ua)<br/>我们鼓励你动手写一个简单的view函数来显示 request.META 的所有数据，这样你就知道里面有什么了。 这个<br/>view函数可能是这样的：<br/>def display_meta(request):<br/>values = request.META.items()<br/>values.sort()<br/>html = []<br/>for k,</p>','2016-01-13 03:13:22',0,0,2),(3,'sdsd','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. \r\nAliquam viverra convallis auctor. Sed accumsan libero quis mi commodo et\r\n suscipit enim lacinia. Morbi rutrum vulputate est sed faucibus. Nulla \r\nsed nisl mauris, id tristique tortor. Sed iaculis dapibus urna nec \r\ndictum. Morbi rutrum vulputate est sed faucibus. Nulla sed nisl mauris, \r\nid tristique tortor. Sed iaculis dapibus urna nec dictum [...]</p><p><br/></p>','2016-01-13 03:20:49',0,0,1),(4,'3333333333333333333333','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. \r\nAliquam viverra convallis auctor. Sed accumsan libero quis mi commodo et\r\n suscipit enim lacinia. Morbi rutrum vulputate est sed faucibus. Nulla \r\nsed nisl mauris, id tristique tortor. Sed iaculis dapibus urna nec \r\ndictum. Morbi rutrum vulputate est sed faucibus. Nulla sed nisl mauris, \r\nid tristique tortor. Sed iaculis dapibus urna nec dictum [...]</p><p><br/></p>','2016-01-13 03:21:07',0,0,1),(5,'adsads','<p>dsdsadsadsd</p><p><br/></p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. \r\nAliquam viverra convallis auctor. Sed accumsan libero quis mi commodo et\r\n suscipit enim lacinia. Morbi rutrum vulputate est sed faucibus. Nulla \r\nsed nisl mauris, id tristique tortor. Sed iaculis dapibus urna nec \r\ndictum. Morbi rutrum vulputate est sed faucibus. Nulla sed nisl mauris, \r\nid tristique tortor. Sed iaculis dapibus urna nec dictum [...]</p><p><br/></p>','2016-01-13 03:21:23',0,0,2),(6,'fdsafdsf','<p>dsafdsfdsf<a target=\"_blank\" class=\"NIvFSc\" href=\"http://www.baidu.com/baidu.php?url=FOsK000GQyKWRR9SprfK7cnfpgwsGavQNVaxoX64n5CY6AFBtHT4sIUQlTpnXZGJN-IqG2VfNkHGQ7pjc-7HxOyNmgVhx4i44T76bGKqVVOCHzqxrlx6q01wzMIlGuMVWj7TV9n.DD_jIEo9HZRShjOCNeoQrz1mGyAp7Wk_o_R.U1Y10ZDq_8Q2d0KY5UMWdVvz3_oRdVjfk0KGUHYznjf0u1dBugK1nfKdpHdBmy-bIfKspyfqP0KWpyfqrjf0UgfqnH0kPsKopHYs0ZFY5HRvPfK-pyfqnH6zrjuxnHfzndtLPjTLg1D3nWfkg1D3rjT4g1Dzrjcdg1D3P1nkg1D3P1m3g1D3P1T3g1D3P16sg1D3nHn1g1DLnj0kg1D3P16zg1DLnjTzg1DdnjR1g1Dzn1b10AFG5HcsP7tkPHR0UynqrjcLnjDsn1b0TgKGujYs0Z7Wpyfqn0KzuLw9u1Ys0AqvUjYknW0VuZGxnHczQHFxnW0LHaYLg1csPYkmQHIxnWD4PiYkg1ckrHbVn-tznWczQywlg1czPWnVnNtzPjRYQywlg1cYrj0VuZGxnWf4nzYYg1cYrHRVuZGxnWf4PzYknj7xnWRknzdbX-tzPHf1QHFxnWR3nzYkg1RLnBdbX6K9mWYsg100ugFM5H00TZ0qn0K8IM0qna3snj0snj0sn0KVIZ0qn0KbuAqs5H00ThCqn0KbugmqTAn0uMfqn0KspjYs0Aq15H00mMTqPsK8IjYs0ZPl5fKYIgnqnHTkrHTYn16drj6LnHfLPHDYPsKzug7Y5HDYPHcvPHfLPWRzrjR0Tv-b5ycLPj6vnhnLnj0sPhDdrAc0mLPV5HParH6Yf1Dsn1czfHfsrDR0mynqnfKsUWYs0Z7VIjYs0ZGY5H00mhsqn0KWThnqPHcLnj0&us=0.0.0.0.0.0.16&us=0.0.0.0.0.0.35&ck=7140.21.0.0.0.588.175.0&shh=www.baidu.com&sht=baidu\">含量分析就选微谱-咨询热线:4007001002-154</a></p><p><a href=\"http://www.baidu.com/baidu.php?url=FOsK000GQyKWRR9SprfK7cnfpgwsGavQNVaxoX64n5CY6AFBtHT4sIUQlTpnXZGJN-IqG2VfNkHGQ7pjc-7HxOyNmgVhx4i44T76bGKqVVOCHzqxrlx6q01wzMIlGuMVWj7TV9n.DD_jIEo9HZRShjOCNeoQrz1mGyAp7Wk_o_R.U1Y10ZDq_8Q2d0KY5UMWdVvz3_oRdVjfk0KGUHYznjf0u1dBugK1nfKdpHdBmy-bIfKspyfqP0KWpyfqrjf0UgfqnH0kPsKopHYs0ZFY5HRvPfK-pyfqnH6zrjuxnHfzndtLPjTLg1D3nWfkg1D3rjT4g1Dzrjcdg1D3P1nkg1D3P1m3g1D3P1T3g1D3P16sg1D3nHn1g1DLnj0kg1D3P16zg1DLnjTzg1DdnjR1g1Dzn1b10AFG5HcsP7tkPHR0UynqrjcLnjDsn1b0TgKGujYs0Z7Wpyfqn0KzuLw9u1Ys0AqvUjYknW0VuZGxnHczQHFxnW0LHaYLg1csPYkmQHIxnWD4PiYkg1ckrHbVn-tznWczQywlg1czPWnVnNtzPjRYQywlg1cYrj0VuZGxnWf4nzYYg1cYrHRVuZGxnWf4PzYknj7xnWRknzdbX-tzPHf1QHFxnWR3nzYkg1RLnBdbX6K9mWYsg100ugFM5H00TZ0qn0K8IM0qna3snj0snj0sn0KVIZ0qn0KbuAqs5H00ThCqn0KbugmqTAn0uMfqn0KspjYs0Aq15H00mMTqPsK8IjYs0ZPl5fKYIgnqnHTkrHTYn16drj6LnHfLPHDYPsKzug7Y5HDYPHcvPHfLPWRzrjR0Tv-b5ycLPj6vnhnLnj0sPhDdrAc0mLPV5HParH6Yf1Dsn1czfHfsrDR0mynqnfKsUWYs0Z7VIjYs0ZGY5H00mhsqn0KWThnqPHcLnj0&us=0.0.0.0.0.0.17&us=0.0.0.0.0.0.36&ck=2310.15.0.0.0.588.175.0&shh=www.baidu.com&sht=baidu\" target=\"_blank\" class=\"_gluID\"><span class=\"ksRDUA\">www.591ceshi.com.cn</span>&nbsp;<span class=\"ehFwPJ\">2016-01</span></a><span class=\"icons MzXdyR\"></span><span style=\"font-size:-1px\">-&nbsp;<a href=\"http://www.baidu.com/tools?url=http%3A%2F%2Fwww.baidu.com%2Fbaidu.php%3Furl%3DFOsK000GQyKWRR9SprfK7cnfpgwsGavQNVaxoX64n5CY6AFBtHT4sIUQlTpnXZGJN-IqG2VfNkHGQ7pjc-7HxOyNmgVhx4i44T76bGKqVVOCHzqxrlx6q01wzMIlGuMVWj7TV9n.DD_jIEo9HZRShjOCNeoQrz1mGyAp7Wk_o_R.U1Y10ZDq_8Q2d0KY5UMWdVvz3_oRdVjfk0KGUHYznjf0u1dBugK1nfKdpHdBmy-bIfKspyfqP0KWpyfqrjf0UgfqnH0kPsKopHYs0ZFY5HRvPfK-pyfqnH6zrjuxnHfzndtLPjTLg1D3nWfkg1D3rjT4g1Dzrjcdg1D3P1nkg1D3P1m3g1D3P1T3g1D3P16sg1D3nHn1g1DLnj0kg1D3P16zg1DLnjTzg1DdnjR1g1Dzn1b10AFG5HcsP7tkPHR0UynqrjcLnjDsn1b0TgKGujYs0Z7Wpyfqn0KzuLw9u1Ys0AqvUjYknW0VuZGxnHczQHFxnW0LHaYLg1csPYkmQHIxnWD4PiYkg1ckrHbVn-tznWczQywlg1czPWnVnNtzPjRYQywlg1cYrj0VuZGxnWf4nzYYg1cYrHRVuZGxnWf4PzYknj7xnWRknzdbX-tzPHf1QHFxnWR3nzYkg1RLnBdbX6K9mWYsg100ugFM5H00TZ0qn0K8IM0qna3snj0snj0sn0KVIZ0qn0KbuAqs5H00ThCqn0KbugmqTAn0uMfqn0KspjYs0Aq15H00mMTqPsK8IjYs0ZPl5fKYIgnqnHTkrHTYn16drj6LnHfLPHDYPsKzug7Y5HDYPHcvPHfLPWRzrjR0Tv-b5ycLPj6vnhnLnj0sPhDdrAc0mLPV5HParH6Yf1Dsn1czfHfsrDR0mynqnfKsUWYs0Z7VIjYs0ZGY5H00mhsqn0KWThnqPHcLnj0&jump=http%3A%2F%2Fkoubei.baidu.com%2Fwomc%2Fp%2Fsentry%3Ftitle%3D%25E5%25B9%25BF%25E5%25B7%259E%25E6%25B5%258B%25E8%25AF%2595%25E4%25B8%25AD%25E5%25BF%2583-%25E8%25AE%25A4%25E5%2587%2586%25E5%25BE%25AE%25E8%25B0%25B1%25E4%25B8%2593%25E4%25B8%259A%25E5%25B9%25BF%25E5%25B7%259E%25E6%25B5%258B%25E8%25AF%2595%25E4%25B8%25AD%25E5%25BF%2583%2521%25EF%25BD%259C%25E8%2583%25BD%25E8%25B0%25B1%25E6%25B5%258B%25E8%25AF%2595%26q%3D%25E6%25B5%258B%25E8%25AF%2595&key=surl&ck=0.0.0.0.0.0.0.0&shh=www.baidu.com&sht=baidu\" target=\"_blank\" class=\"m\">评价</a></span></p><h3 class=\"t\"><a data-click=\"{\r\n			&#39;F&#39;:&#39;778317EA&#39;,\r\n			&#39;F1&#39;:&#39;9D73F1E4&#39;,\r\n			&#39;F2&#39;:&#39;4CA6DD6B&#39;,\r\n			&#39;F3&#39;:&#39;54E5363F&#39;,\r\n			&#39;T&#39;:&#39;1452654765&#39;,\r\n						&#39;y&#39;:&#39;1DFBBB76&#39;\r\n			 \r\n									}\" href=\"http://www.baidu.com/link?url=VucCCFZ8njUBytDcP6TF03aG69PSGs0Wl_tEnZp4RROqJ7bXpD82jJ_k-Rwx4bG5\" target=\"_blank\">【<em>测试</em>】心理<em>测试</em>大全_星座<em>测试</em>_心里<em>测试</em>解析-美国神婆星座网</a></h3><p><a class=\"c-img6\" style=\"height:75px\" href=\"http://www.baidu.com/link?url=VucCCFZ8njUBytDcP6TF03aG69PSGs0Wl_tEnZp4RROqJ7bXpD82jJ_k-Rwx4bG5\" target=\"_blank\"><img class=\"c-img c-img6\" src=\"https://ss0.baidu.com/73x1bjeh1BF3odCf/it/u=2531427922,2282050566&fm=96&s=758627BA46824EE506BEB16003003038\" style=\"height:75px;\"/></a></p><p>美国神婆星座网<em>测试</em>栏目提供心理<em>测试</em>、星座<em>测试</em>、星座配对<em>测试</em>、星座心理<em>测试</em>、潜意识<em>测试</em>、心理素质<em>测试</em>、心理<em>测试</em>题等心里<em>测试</em>大全,了解更多心理<em>测试</em>大全分析就到美国...</p><p><a target=\"_blank\" href=\"http://www.baidu.com/link?url=VucCCFZ8njUBytDcP6TF03aG69PSGs0Wl_tEnZp4RROqJ7bXpD82jJ_k-Rwx4bG5\" class=\"c-showurl\" style=\"text-decoration:none;\">www.meiguoshenpo.com/c...&nbsp;</a><span class=\"c-icons-outer\"><span class=\"c-icons-inner\"></span></span>&nbsp;-&nbsp;<a data-click=\"{&#39;rsv_snapshot&#39;:&#39;1&#39;}\" href=\"http://cache.baiducontent.com/c?m=9f65cb4a8c8507ed4fece763105392230e54f73c6b8c85522295c91fcf2606564711b2e6783f4153929f277a15ea141cbcff2102371457b78cb9fb5dabbd&p=9f74f915d9c041ac4bbe9b7c7f4886&newp=8b2a975ecc934eac58eecd354b0ec4231610db2151d4d41764ce&user=baidu&fm=sc&query=%B2%E2%CA%D4&qid=b74862c70006a58b&p1=1\" target=\"_blank\" class=\"m\">百度快照</a>&nbsp;-&nbsp;<a href=\"http://www.baidu.com/tools?url=http%3A%2F%2Fwww.baidu.com%2Flink%3Furl%3DVucCCFZ8njUBytDcP6TF03aG69PSGs0Wl_tEnZp4RROqJ7bXpD82jJ_k-Rwx4bG5&jump=http%3A%2F%2Fkoubei.baidu.com%2Fwomc%2Fp%2Fsentry%3Ftitle%3D%01%E3%80%90%02%E6%B5%8B%E8%AF%95%03%E3%80%91%01%E5%BF%83%E7%90%86%02%E6%B5%8B%E8%AF%95%03%E5%A4%A7%E5%85%A8%01_%01%E6%98%9F%E5%BA%A7%02%E6%B5%8B%E8%AF%95%03_%01%E5%BF%83%E9%87%8C%02%E6%B5%8B%E8%AF%95%03%E8%A7%A3%E6%9E%90%01-%01%E7%BE%8E%E5%9B%BD%01%E7%A5%9E%E5%A9%86%01%E6%98%9F%E5%BA%A7%01%E7%BD%91%01%26q%3D%B2%E2%CA%D4&key=surl\" target=\"_blank\" class=\"m\" data-click=\"{&#39;rsv_comments&#39;:&#39;1&#39;}\">69%好评</a></p><h3 class=\"t\"><a data-click=\"{\r\n			&#39;F&#39;:&#39;778317EA&#39;,\r\n			&#39;F1&#39;:&#39;9D73F1E4&#39;,\r\n			&#39;F2&#39;:&#39;4CA6DE6B&#39;,\r\n			&#39;F3&#39;:&#39;54E5363F&#39;,\r\n			&#39;T&#39;:&#39;1452654765&#39;,\r\n						&#39;y&#39;:&#39;E3ADB22F&#39;\r\n			 \r\n									}\" href=\"http://www.baidu.com/link?url=YNfYxseiZKNg518vOF1I78H8fSjaqZpOcPHWvCiZDnc2h1nly1kNE7CDazqfof3y\" target=\"_blank\">心理<em>测试</em> 心理<em>测试</em>题 - 壹心理</a></h3><p>性格<em>测试</em> 爱情<em>测试</em> 心理<em>测试</em> 能力<em>测试</em> 趣味<em>测试</em> 专业<em>测试</em> 姻缘测试 <em>测试</em>爱情 职业<em>测试</em> 预言<em>测试</em> 会员<em>测试</em> 翻译<em>测试</em> 专业量表 潜意识<em>测试</em> 外国<em>测试</em> 爱情 职场<em>测试</em> 健...</p><p><a target=\"_blank\" href=\"http://www.baidu.com/link?url=YNfYxseiZKNg518vOF1I78H8fSjaqZpOcPHWvCiZDnc2h1nly1kNE7CDazqfof3y\" class=\"c-showurl\" style=\"text-decoration:none;\">www.xinli001.com/ceshi/&nbsp;</a><span class=\"c-icons-outer\"><span class=\"c-icons-inner\"><span class=\"c-vline\"></span><span class=\"c-trust-as vstar\"></span></span></span>&nbsp;-&nbsp;<a data-click=\"{&#39;rsv_snapshot&#39;:&#39;1&#39;}\" href=\"http://cache.baiducontent.com/c?m=9f65cb4a8c8507ed4fece763105392230e54f729678b8e4e7dd6905f93130a1c187bb2ec66784b19c780212757a05e2ceae74172207253a0edce&p=82769a47928411a05beed7231652&newp=882a9646cedf10f30be2966f494092695c16ed603fcfcc4423&user=baidu&fm=sc&query=%B2%E2%CA%D4&qid=b74862c70006a58b&p1=2\" target=\"_blank\" class=\"m\">百度快照</a>&nbsp;-&nbsp;<a href=\"http://www.baidu.com/tools?url=http%3A%2F%2Fwww.baidu.com%2Flink%3Furl%3DYNfYxseiZKNg518vOF1I78H8fSjaqZpOcPHWvCiZDnc2h1nly1kNE7CDazqfof3y&jump=http%3A%2F%2Fkoubei.baidu.com%2Fwomc%2Fp%2Fsentry%3Ftitle%3D%01%E5%BF%83%E7%90%86%02%E6%B5%8B%E8%AF%95%03%20%01%E5%BF%83%E7%90%86%02%E6%B5%8B%E8%AF%95%03%E9%A2%98%01%20%01-%01%20%01%E5%A3%B9%01%E5%BF%83%E7%90%86%01%26q%3D%B2%E2%CA%D4&key=surl\" target=\"_blank\" class=\"m\" data-click=\"{&#39;rsv_comments&#39;:&#39;1&#39;}\">89%好评</a></p><p>&nbsp; &nbsp;\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n \r\n \r\n \r\n \r\n\r\n\r\n\r\n &nbsp; &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp; \r\n &nbsp; &nbsp; &nbsp; &nbsp;						 &nbsp; &nbsp; &nbsp; &nbsp;	 &nbsp; &nbsp;\r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;\r\n\r\n &nbsp; &nbsp;	</p><h3 class=\"t c-gap-bottom-small\"><a href=\"http://www.baidu.com/link?url=Skt15BHcuZkFVd9JwYUAdcOqvZPnVNMdjVRy4YT7KN-6T7KYiAKyEueg3GEYldnY0cXuD1G-0tggn8gyB_AXiDErSr1AB7XqFIsrzjSrbL7\" target=\"_blank\"><em>测试</em>_百度百科</a>\r\n &nbsp; &nbsp; &nbsp; &nbsp;</h3><p><a href=\"http://www.baidu.com/link?url=Skt15BHcuZkFVd9JwYUAdcOqvZPnVNMdjVRy4YT7KN-6T7KYiAKyEueg3GEYldnY0cXuD1G-0tggn8gyB_AXiDErSr1AB7XqFIsrzjSrbL7\" target=\"_blank\" class=\"op-bk-polysemy-album op-se-listen-recommend\" style=\"_height:91px\">\r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img class=\"c-img c-img6\" src=\"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=2218934219,1989383835&fm=58\"/>\r\n &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</a>\r\n &nbsp; &nbsp; &nbsp; &nbsp;</p><p><em>测试</em>英文名Test;Measure;中文拼音cè shì；由中文“测”与中文“试”两个字组成的词语。是动词、名词。意思是；...</p><p><br/></p>','2016-01-13 03:21:37',0,0,2),(7,'asda','<p>sdsadsadsad<br/></p>','2016-01-13 03:21:54',0,0,3),(8,'dsad','<p>sadsadasdsa<br/></p>','2016-01-13 03:22:08',0,0,1),(9,'fdsafasd','<p>fsf<br/></p>','2016-01-13 03:22:21',0,0,1),(10,'fdsf','<p>sdfsdafsdaf<br/></p>','2016-01-13 03:22:29',0,0,2),(11,'pip install django-ckeditor','<p><strong>pip install django-ckeditor</strong></p><p>关于 富文本编辑框可以参考 https://www.djangopackages.com/grids/g/wysiwyg/</p><p>这里我选择ckeditor</p><p>在setting.py里创建如下代码</p><pre>MEDIA_URL&nbsp;=&nbsp;&quot;/media/&quot;\r\n&nbsp;MEDIA_ROOT&nbsp;=&nbsp;os.path.join(BASE_DIR,&nbsp;&quot;media&quot;)\r\n&nbsp;CKEDITOR_UPLOAD_PATH&nbsp;=&nbsp;&quot;uploads&quot;</pre><p>在项目根目录下创建media文件夹，在media文件下创建uploads文件夹，uploads用于存放上传的图片。</p><p>在urls.py下加入如下代码</p><pre>url(r&#39;^ckeditor/&#39;,&nbsp;include(&#39;ckeditor.urls&#39;)),</pre><p>在INSTALLED_APPS 里添加 &#39;ckeditor&#39;,</p><p><br/></p>','2016-01-13 03:22:45',25,5,2);
/*!40000 ALTER TABLE `blog_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_article_tags`
--

DROP TABLE IF EXISTS `blog_article_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_article_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_id` (`article_id`,`tag_id`),
  KEY `blog_article_tags_tag_id_44f63623647e57b3_fk_blog_tag_id` (`tag_id`),
  CONSTRAINT `blog_article_tags_article_id_4147c6466c017843_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`),
  CONSTRAINT `blog_article_tags_tag_id_44f63623647e57b3_fk_blog_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `blog_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_article_tags`
--

LOCK TABLES `blog_article_tags` WRITE;
/*!40000 ALTER TABLE `blog_article_tags` DISABLE KEYS */;
INSERT INTO `blog_article_tags` VALUES (1,1,1),(2,2,1),(3,2,2),(4,3,1),(5,4,1),(6,5,1),(7,6,2),(8,7,2),(9,8,1),(10,8,2),(11,8,3),(12,9,2),(13,10,2),(14,11,2);
/*!40000 ALTER TABLE `blog_article_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_category`
--

DROP TABLE IF EXISTS `blog_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_category`
--

LOCK TABLES `blog_category` WRITE;
/*!40000 ALTER TABLE `blog_category` DISABLE KEYS */;
INSERT INTO `blog_category` VALUES (1,'测试','2016-01-13 03:09:09'),(2,'表单2','2016-01-13 03:13:35'),(3,'dasd','2016-01-13 03:22:02');
/*!40000 ALTER TABLE `blog_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_reply`
--

DROP TABLE IF EXISTS `blog_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(200) NOT NULL,
  `article_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `content` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_reply_article_id_60f31ac647ca8114_fk_blog_article_id` (`article_id`),
  CONSTRAINT `blog_reply_article_id_60f31ac647ca8114_fk_blog_article_id` FOREIGN KEY (`article_id`) REFERENCES `blog_article` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_reply`
--

LOCK TABLES `blog_reply` WRITE;
/*!40000 ALTER TABLE `blog_reply` DISABLE KEYS */;
INSERT INTO `blog_reply` VALUES (1,'dasd',11,'2016-01-14 03:13:09','<p>dasd<br/></p>'),(2,'nickname',11,'2016-01-14 03:13:19','<p>dsadasd<br/></p>'),(3,'nickname',11,'2016-01-14 03:14:45','<p><img src=\"http://img.baidu.com/hi/jx2/j_0024.gif\"/></p>'),(4,'nickname',11,'2016-01-14 03:17:13','<p>的萨大赛<br/></p>'),(5,'nickname',11,'2016-01-14 03:35:07','<p>bbcv <br/></p>');
/*!40000 ALTER TABLE `blog_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tag`
--

DROP TABLE IF EXISTS `blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
INSERT INTO `blog_tag` VALUES (1,'ttt1','2016-01-13 03:09:18'),(2,'测试222','2016-01-13 03:13:42'),(3,'dsad','2016-01-13 03:22:15');
/*!40000 ALTER TABLE `blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-01-13 03:09:16','1','测试',1,'',7,1),(2,'2016-01-13 03:09:23','1','ttt1',1,'',8,1),(3,'2016-01-13 03:09:26','1','Sed accumsan libero quis mi commodo et suscipit',1,'',9,1),(4,'2016-01-13 03:13:39','2','表单2',1,'',7,1),(5,'2016-01-13 03:13:46','2','测试222',1,'',8,1),(6,'2016-01-13 03:13:48','2','表单',1,'',9,1),(7,'2016-01-13 03:21:05','3','sdsd',1,'',9,1),(8,'2016-01-13 03:21:21','4','3333333333333333333333',1,'',9,1),(9,'2016-01-13 03:21:35','5','adsads',1,'',9,1),(10,'2016-01-13 03:21:52','6','fdsafdsf',1,'',9,1),(11,'2016-01-13 03:22:04','3','dasd',1,'',7,1),(12,'2016-01-13 03:22:06','7','asda',1,'',9,1),(13,'2016-01-13 03:22:17','3','dsad',1,'',8,1),(14,'2016-01-13 03:22:20','8','dsad',1,'',9,1),(15,'2016-01-13 03:22:28','9','fdsafasd',1,'',9,1),(16,'2016-01-13 03:22:36','10','fdsf',1,'',9,1),(17,'2016-01-13 03:22:54','11','pip install django-ckeditor',1,'',9,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(9,'blog','article'),(7,'blog','category'),(10,'blog','reply'),(8,'blog','tag'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-01-12 08:55:00'),(2,'auth','0001_initial','2016-01-12 08:55:01'),(3,'admin','0001_initial','2016-01-12 08:55:01'),(4,'contenttypes','0002_remove_content_type_name','2016-01-12 08:55:01'),(5,'auth','0002_alter_permission_name_max_length','2016-01-12 08:55:01'),(6,'auth','0003_alter_user_email_max_length','2016-01-12 08:55:01'),(7,'auth','0004_alter_user_username_opts','2016-01-12 08:55:01'),(8,'auth','0005_alter_user_last_login_null','2016-01-12 08:55:01'),(9,'auth','0006_require_contenttypes_0002','2016-01-12 08:55:01'),(10,'sessions','0001_initial','2016-01-12 08:55:01');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('opxnh4ytsagsy6h7b9z9yd6be8ec3jcz','MDZkOWZlOTFkNTlhZWY0M2RjOTg0Zjc5MDI4NTRmYjFjMjE2YTRkMDp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ2NzQyMDY3YWI5NGQ1MGIxZDk0MjUwZWMxYzBlNDhiNDdlYjg2NTEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-01-26 08:57:36');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-14 22:06:51
