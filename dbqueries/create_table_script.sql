CREATE TABLE `admin_user` (
  `userid` int(11) NOT NULL auto_increment,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `type` varchar(20) default NULL,
  `name` varchar(45) default NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `bank` (
  `bank_id` int(11) NOT NULL auto_increment,
  `bank_name` varchar(60) NOT NULL,
  PRIMARY KEY  (`bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `books` (
  `book_id` int(10) unsigned NOT NULL auto_increment,
  `book_name` varchar(100) NOT NULL default '',
  `book_author` varchar(45) NOT NULL default '',
  `list_price` float NOT NULL default '0',
  `price` float NOT NULL default '0',
  `new_from` float NOT NULL default '0',
  `used_from` float NOT NULL default '0',
  `digital_list_price` float NOT NULL default '0',
  `print_list_price` float NOT NULL default '0',
  `kindle_price` float NOT NULL default '0',
  `book_type` varchar(45) NOT NULL default '',
  `book_category` varchar(45) NOT NULL default '',
  `country_id` int(10) unsigned default NULL,
  `book_image` blob,
  `discount` float default NULL,
  PRIMARY KEY  (`book_id`),
  KEY `FK_books_country` (`country_id`),
  CONSTRAINT `FK_books_country` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`),
  CONSTRAINT `FK_item_id` FOREIGN KEY (`book_id`) REFERENCES `item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `category` (
  `Category_id` int(10) unsigned NOT NULL auto_increment,
  `Category_name` varchar(100) character set latin1 collate latin1_bin NOT NULL default '',
  PRIMARY KEY  (`Category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `computers` (
  `ItemId` int(11) NOT NULL auto_increment,
  `Brand` varchar(45) default NULL,
  `Model` varchar(45) default NULL,
  `Rating` int(11) default NULL,
  `Price` float default NULL,
  `Pic` blob,
  `Type` varchar(45) default NULL,
  PRIMARY KEY  (`ItemId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `country` (
  `country_id` int(10) unsigned NOT NULL auto_increment,
  `country_name` varchar(45) NOT NULL default '',
  `currency` varchar(45) NOT NULL default '',
  `conversion_rate` float NOT NULL default '0',
  PRIMARY KEY  (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `courier` (
  `item_name` varchar(200) NOT NULL,
  `total_price` float default NULL,
  `quantity` int(10) unsigned default NULL,
  `username` varchar(45) NOT NULL,
  `address` varchar(200) NOT NULL,
  `delivered` int(1) NOT NULL,
  `courier_name` varchar(45) NOT NULL,
  `order_id` int(11) NOT NULL default '0',
  `item_id` int(11) NOT NULL,
  PRIMARY KEY  (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `credit_card_details` (
  `credit_card_number` int(11) NOT NULL,
  `bank_name` varchar(60) NOT NULL,
  `cvv` int(11) NOT NULL,
  `pin` int(11) NOT NULL,
  `credit_card_holder` varchar(60) NOT NULL,
  `balance` int(11) default NULL,
  PRIMARY KEY  (`credit_card_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `electronics` (
  `item_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL default '',
  `brand` varchar(45) NOT NULL default '',
  `price` int(10) unsigned NOT NULL default '0',
  `list_price` int(10) unsigned NOT NULL default '0',
  `type` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `item` (
  `item_id` int(10) unsigned NOT NULL auto_increment,
  `subcategory_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`item_id`),
  KEY `FK_subcategory` (`subcategory_id`),
  CONSTRAINT `FK_subcategory` FOREIGN KEY (`subcategory_id`) REFERENCES `subcategory` (`subcategory_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `publisher` (
  `item_name` varchar(200) default NULL,
  `total_price` float default NULL,
  `quantity` int(11) default NULL,
  `item_id` int(10) unsigned default NULL,
  `username` varchar(45) default NULL,
  `courier_name` varchar(45) default NULL,
  `order_id` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`order_id`),
  KEY `FK_publisher_1` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `shopping_cart` (
  `SHOPPING_CART_ID` int(11) NOT NULL auto_increment,
  `SHOPPING_CART_ITEM_NAME` text NOT NULL,
  `SHOPPING_CART_ITEM_PRICE` float NOT NULL,
  `SHOPPING_CART_ITEM_DATE` date NOT NULL,
  `SHOPPING_CART_ITEM_QTY` int(11) NOT NULL,
  `SHOPPING_CART_STATUS` int(11) NOT NULL,
  `SHOPPING_CART_DISCOUNT` float NOT NULL,
  `username` varchar(45) default NULL,
  `item_type` varchar(45) default NULL,
  PRIMARY KEY  (`SHOPPING_CART_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `subcategory` (
  `subcategory_id` int(10) unsigned NOT NULL auto_increment,
  `subcategory_name` varchar(100) NOT NULL default '',
  `category_id` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`subcategory_id`),
  KEY `FK_subcategory_1` (`category_id`),
  CONSTRAINT `FK_subcategory_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`Category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `user` (
  `User_id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(45) NOT NULL default '',
  `username` varchar(45) NOT NULL default '',
  `password` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`User_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `user_details` (
  `USER_DETAILS_ID` int(10) unsigned NOT NULL auto_increment,
  `USER_ID` int(10) unsigned NOT NULL default '0',
  `USER_ID_FIRST_NAME` varchar(45) NOT NULL default '',
  `USER_ID_MIDDLE_NAME` varchar(45) NOT NULL default '',
  `USER_ID_SURNAME` varchar(45) NOT NULL default '',
  `USER_ID_ADDRESS_LINE1` varchar(45) NOT NULL default '',
  `USER_ID_ADDRESS_LINE2` varchar(45) NOT NULL default '',
  `USER_ID_CITY` varchar(45) NOT NULL default '',
  `USER_ID_ZIP` varchar(45) NOT NULL default '',
  `USER_ID_COUNTRY` varchar(45) NOT NULL default '',
  `USER_ID_REGION` varchar(45) NOT NULL default '',
  `USER_ID_PHONE_NUMBER` varchar(45) NOT NULL default '',
  PRIMARY KEY  (`USER_DETAILS_ID`),
  KEY `FK_USER_DETAILS_1` (`USER_ID`),
  CONSTRAINT `FK_USER_DETAILS_1` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`User_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

