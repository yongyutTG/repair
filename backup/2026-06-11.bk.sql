# Dump of autonumber 
# Dump DATE : 11-Jun-2026

DROP TABLE IF EXISTS autonumber;
CREATE TABLE autonumber (
  item_number int(4) unsigned zerofill NOT NULL,
  finance_number int(4) unsigned zerofill NOT NULL,
  quotation_number int(4) unsigned zerofill NOT NULL,
  invoice_number int(4) unsigned zerofill NOT NULL,
  year int(4) unsigned zerofill NOT NULL,
  month int(2) unsigned zerofill NOT NULL,
  day int(2) unsigned zerofill NOT NULL,
  PRIMARY KEY (finance_number)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



INSERT INTO autonumber VALUES(0003,0001,0001,0001,2026,06,11);



# Dump of backup_logs 
# Dump DATE : 11-Jun-2026

DROP TABLE IF EXISTS backup_logs;
CREATE TABLE backup_logs (
  backup_key varchar(32) NOT NULL,
  backup_file varchar(256) NOT NULL,
  backup_date timestamp NOT NULL DEFAULT current_timestamp(),
  user_key char(32) NOT NULL,
  PRIMARY KEY (backup_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



INSERT INTO backup_logs VALUES("9678a29d0f4f076ead4fc8ecd71c1632","2026-06-11.bk.sql","2026-06-11 23:00:38","21232f297a57a5a743894a0e4a801fc3");



# Dump of card_info 
# Dump DATE : 11-Jun-2026

DROP TABLE IF EXISTS card_info;
CREATE TABLE card_info (
  card_key char(32) NOT NULL,
  card_code varchar(16) NOT NULL,
  card_customer_name varchar(64) NOT NULL,
  card_customer_lastname varchar(64) NOT NULL,
  card_customer_address text NOT NULL,
  card_customer_phone varchar(128) NOT NULL,
  card_customer_email varchar(128) NOT NULL,
  card_note text NOT NULL,
  card_done_aprox date NOT NULL,
  user_key varchar(32) NOT NULL,
  card_status varchar(32) NOT NULL,
  card_insert timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (card_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



INSERT INTO card_info VALUES("08ed42bc990967d879deff44843a639b","CDWICQDG","ชัยยุทธ","วัชรพงศ์เธี","42/245 กทม","0849270598","yongyuttgsaving@gmail.com","","0000-00-00","21232f297a57a5a743894a0e4a801fc3","89da7d193f3c67e4310f50cbb5b36b90","2026-06-11 22:49:50");



# Dump of card_item 
# Dump DATE : 11-Jun-2026

DROP TABLE IF EXISTS card_item;
CREATE TABLE card_item (
  item_key char(32) NOT NULL,
  card_key varchar(32) NOT NULL,
  item_number int(11) NOT NULL,
  item_name varchar(128) NOT NULL,
  item_note text NOT NULL,
  item_price_aprox float NOT NULL,
  item_insert timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (item_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



INSERT INTO card_item VALUES("342d8879370248e14d41f8c8d396cc70","08ed42bc990967d879deff44843a639b",26060001,"โน้ตบุค","เปิดไม่ติด",1000,"2026-06-11 22:50:34");



# Dump of card_status 
# Dump DATE : 11-Jun-2026

DROP TABLE IF EXISTS card_status;
CREATE TABLE card_status (
  cstatus_key char(32) NOT NULL,
  card_key varchar(32) NOT NULL,
  card_status varchar(32) NOT NULL,
  card_status_note text NOT NULL,
  user_key varchar(32) NOT NULL,
  cstatus_insert timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (cstatus_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



INSERT INTO card_status VALUES("579b18cb020d9aabea46f540ba94cbed","08ed42bc990967d879deff44843a639b","89da7d193f3c67e4310f50cbb5b36b90","","21232f297a57a5a743894a0e4a801fc3","2026-06-11 22:53:11");



# Dump of card_type 
# Dump DATE : 11-Jun-2026

DROP TABLE IF EXISTS card_type;
CREATE TABLE card_type (
  ctype_key char(32) NOT NULL,
  ctype_name varchar(128) NOT NULL,
  ctype_color varchar(16) NOT NULL,
  ctype_status tinyint(1) NOT NULL,
  ctype_insert timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (ctype_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



INSERT INTO card_type VALUES("2fdf411856947d19708cf4da19aa3af3","เปลี่ยนสินค้าชิ้นใหม่","#ff6969",1,"2016-04-25 20:50:59");
INSERT INTO card_type VALUES("31c1891444b8e5734bee09165953bca1","ไม่สามารถซ่อมได้","#9e9806",1,"2016-04-25 20:49:41");
INSERT INTO card_type VALUES("4973069504e1be2a5bdcf7162ade8a16","ซ่อม/เคลม เสร็จ","#06d628",1,"2016-04-25 20:49:21");
INSERT INTO card_type VALUES("58dc6633d9c14d0189efd328fc119591","ส่งมอบสินค้าคืนลูกค้าเรียบร้อย","#2958ff",1,"2016-04-25 20:52:56");
INSERT INTO card_type VALUES("89da7d193f3c67e4310f50cbb5b36b90","นำรายการซ่อม/เคลม เข้าระบบ","#29ccff",1,"2016-04-25 20:23:50");
INSERT INTO card_type VALUES("a5eb0dd1c5065bb9fe0cb05d61f03f4a","ยกเลิกการซ่อม/เคลม","#753709",1,"2016-04-25 20:51:39");
INSERT INTO card_type VALUES("b090c4112da52d40a08349b9000dab88","ตรวจสอบรายการซ่อม/เคลม","#c9c9c9",1,"2016-04-25 20:11:34");
INSERT INTO card_type VALUES("b1f4d8a6d50a01b4211fd877f7ae464f","ดำเนินการซ่อม/เคลม","#120eeb",1,"2016-04-25 20:48:05");
INSERT INTO card_type VALUES("c382e352e2e620a3c60a2cc7c6a7fa35","ส่งต่อการซ่อม/เคลม","#d940ff",1,"2016-04-25 20:48:42");
INSERT INTO card_type VALUES("c9934ed002b3a365088862d85604b765","เปลี่ยนอะไหล่","#9c9c9c",1,"2016-04-25 20:51:16");
INSERT INTO card_type VALUES("da144a84c0660c67f115eeefa93dc56f","ชำระเงิน","#ff5c00",1,"2016-04-25 20:52:35");



# Dump of language 
# Dump DATE : 11-Jun-2026

DROP TABLE IF EXISTS language;
CREATE TABLE language (
  language_code varchar(16) NOT NULL,
  language_name varchar(32) NOT NULL,
  language_status tinyint(1) NOT NULL,
  PRIMARY KEY (language_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



INSERT INTO language VALUES("en","English",0);
INSERT INTO language VALUES("th","ภาษาไทย",1);



# Dump of list 
# Dump DATE : 11-Jun-2026

DROP TABLE IF EXISTS list;
CREATE TABLE list (
  cases varchar(64) NOT NULL,
  menu varchar(64) NOT NULL,
  pages varchar(128) NOT NULL,
  case_status tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (cases)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



INSERT INTO list VALUES("setting","setting","settings/setting.php",1);
INSERT INTO list VALUES("member","member","members/member.php",1);
INSERT INTO list VALUES("cashier","cashier","cashier/cashier.php",1);
INSERT INTO list VALUES("report","report","report/report.php",1);
INSERT INTO list VALUES("report_export","report","report/report_export.php",1);
INSERT INTO list VALUES("report_movement","report","report/report_movement.php",1);
INSERT INTO list VALUES("report_income","report","report/report_income.php",1);
INSERT INTO list VALUES("report_income_detail","report","report/report_income_detail.php",1);
INSERT INTO list VALUES("report_booking","report","report/report_booking.php",1);
INSERT INTO list VALUES("report_logs","report","report/report_logs.php",1);
INSERT INTO list VALUES("report_delivery","report","report/report_delivery.php",1);
INSERT INTO list VALUES("report_delivery_detail","report","report/report_delivery_detail.php",1);
INSERT INTO list VALUES("setting_users","setting","settings/setting_users.php",1);
INSERT INTO list VALUES("setting_backup","setting","settings/setting_backup.php",1);
INSERT INTO list VALUES("setting_unit","setting","settings/setting_unit.php",0);
INSERT INTO list VALUES("setting_categories","setting","settings/setting_categories.php",1);
INSERT INTO list VALUES("setting_member_group","setting","settings/setting_member_group.php",1);
INSERT INTO list VALUES("setting_promotions","setting","settings/setting_promotions.php",1);
INSERT INTO list VALUES("report_debt","report","report/report_debt.php",1);
INSERT INTO list VALUES("report_creditor","report","report/report_creditor.php",1);
INSERT INTO list VALUES("setting_info","setting","settings/setting_info.php",1);
INSERT INTO list VALUES("setting_system","setting","settings/setting_system.php",1);
INSERT INTO list VALUES("setting_user_access","setting","settings/setting_user_access.php",1);
INSERT INTO list VALUES("administrator_access_list","setting","administrator/administrator_access_list.php",1);
INSERT INTO list VALUES("administrator_cases","setting","administrator/administrator_cases.php",1);
INSERT INTO list VALUES("administrator_menus","setting","administrator/administrator_menus.php",1);
INSERT INTO list VALUES("administrator_modules","setting","administrator/administrator_modules.php",1);
INSERT INTO list VALUES("administrator_helper","seting","administrator/administrator_helper.php",1);
INSERT INTO list VALUES("cashier_member","cashier","cashier/cashier_member.php",1);
INSERT INTO list VALUES("cashier_booking","cashier","cashier/cashier_booking.php",1);
INSERT INTO list VALUES("product_detail","product","products/product_detail.php",1);
INSERT INTO list VALUES("member_detail","member","members/member_detail.php",1);
INSERT INTO list VALUES("new_member","member","members/new_member.php",1);
INSERT INTO list VALUES("member_history","member","members/member_history.php",1);
INSERT INTO list VALUES("setting_promotion_member","setting","settings/setting_promotion_member.php",1);
INSERT INTO list VALUES("report_cancel","report","report/report_cancel.php",1);
INSERT INTO list VALUES("card_all_status","card","card/card_all_status.php",1);
INSERT INTO list VALUES("search","","main/search.php",1);
INSERT INTO list VALUES("card","card","card/card.php",1);
INSERT INTO list VALUES("setting_card_status","setting","settings/setting_card_status.php",1);
INSERT INTO list VALUES("card_create_detail","card_create","card/card_create_detail.php",1);
INSERT INTO list VALUES("search_code","","main/search.php",1);
INSERT INTO list VALUES("card_create","card_create","card/main.php",1);
INSERT INTO list VALUES("setting_products","setting","settings/setting_products.php",1);



# Dump of logs 
# Dump DATE : 11-Jun-2026

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
  log_key varchar(16) NOT NULL,
  log_date timestamp NOT NULL DEFAULT current_timestamp(),
  log_ipaddress varchar(32) NOT NULL,
  log_text varchar(256) NOT NULL,
  log_user varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



INSERT INTO logs VALUES("ecce955f7a3e1a95","2026-06-11 22:27:05","::1","admin เข้าสู่ระบบ.","21232f297a57a5a743894a0e4a801fc3");
INSERT INTO logs VALUES("ecce955f7a3e1a95","2026-06-11 22:27:25","::1","admin เข้าสู่ระบบ.","21232f297a57a5a743894a0e4a801fc3");
INSERT INTO logs VALUES("ecce955f7a3e1a95","2026-06-11 22:29:11","::1","admin เข้าสู่ระบบ.","21232f297a57a5a743894a0e4a801fc3");
INSERT INTO logs VALUES("ecce955f7a3e1a95","2026-06-11 22:30:36","::1","admin เข้าสู่ระบบ.","21232f297a57a5a743894a0e4a801fc3");



# Dump of menus 
# Dump DATE : 11-Jun-2026

DROP TABLE IF EXISTS menus;
CREATE TABLE menus (
  menu_key char(32) NOT NULL,
  menu_upkey char(32) NOT NULL,
  menu_icon varchar(256) NOT NULL,
  menu_name varchar(128) NOT NULL,
  menu_case varchar(128) NOT NULL,
  menu_link varchar(256) NOT NULL,
  menu_status tinyint(1) NOT NULL,
  menu_sorting int(11) NOT NULL,
  PRIMARY KEY (menu_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



INSERT INTO menus VALUES("0a3c8aabc6cdbce67a157ba1701b3fa9","0a3c8aabc6cdbce67a157ba1701b3fa9","<i class=\"fa fa-pie-chart fa-fw\"></i>","LA_MN_REPORT","report","?p=report",0,8);
INSERT INTO menus VALUES("2309e0cdb2c541bf7cb8ef0dee7b7eba","2309e0cdb2c541bf7cb8ef0dee7b7eba","<i class=\"fa fa-gear  fa-fw\"></i>","LA_MN_SETTING","setting","?p=setting",1,9);
INSERT INTO menus VALUES("26f7e62109e2566eaec8b01fe8e3598d","26f7e62109e2566eaec8b01fe8e3598d","<i class=\"fa fa-edit fa-fw\"></i>","ส่งซ่อมสินค้า/เคลม","card_create","?p=card_create",1,2);
INSERT INTO menus VALUES("295744c466c17b46170f88b5c1b9104d","295744c466c17b46170f88b5c1b9104d","<i class=\"fa fa-list fa-fw\"></i>","รายการส่งซ่อม/เคลม<span class=\"pull-right\"><span class=\"badge\" id=\"card_count\"></span></span>","card","?p=card",1,3);
INSERT INTO menus VALUES("439c4113b058975e22f776669bb36bf0","ff7d5a554f4300b09f2de2e06d523be9","<i class=\"fa flaticon-stack4 fa-fw\"></i>","LA_MN_PRODUCTS_DATA","product","?p=product",1,31);
INSERT INTO menus VALUES("a16043256ea5ca0ea86995e2b69ec238","a16043256ea5ca0ea86995e2b69ec238","<i class=\"fa fa-home fa-fw\"></i>","LA_MN_HOME","","index.php",1,1);
INSERT INTO menus VALUES("c6c8729b45d1fec563f8453c16ff03b8","c6c8729b45d1fec563f8453c16ff03b8","<i class=\"fa fa-lock fa-fw\"></i>","LA_MN_LOGOUT","logout","../core/logout.core.php",1,10);
INSERT INTO menus VALUES("f1344bc0fb9c5594fa0e3d3f37a56957","f1344bc0fb9c5594fa0e3d3f37a56957","<i class=\"fa fa-users fa-fw\"></i>","LA_MN_MEMBERS","member","?p=member",0,4);



# Dump of system_font_size 
# Dump DATE : 11-Jun-2026

DROP TABLE IF EXISTS system_font_size;
CREATE TABLE system_font_size (
  font_key char(32) NOT NULL,
  font_name varchar(128) NOT NULL,
  font_size_text text NOT NULL,
  font_status tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



INSERT INTO system_font_size VALUES("6c3ca25445248c1dff79d51ad9fa4082","14px","font-size:14px;",1);
INSERT INTO system_font_size VALUES("74af75636b4e933684d63b617c97f398","24px","font-size:24px;",1);
INSERT INTO system_font_size VALUES("bffeb9ae0d04ffc7affc3701f9858932","22px","font-size:22px;",1);
INSERT INTO system_font_size VALUES("dd7e28065e654467be0f9c16f3bd987d","16px","font-size:16px;",1);
INSERT INTO system_font_size VALUES("e215155479796a0bdcad2326ffca09c7","18px","font-size:18px;",1);
INSERT INTO system_font_size VALUES("ff9ec5b758824e67edcf5ecc7e635f6f","20px","font-size:20px;",1);



# Dump of system_info 
# Dump DATE : 11-Jun-2026

DROP TABLE IF EXISTS system_info;
CREATE TABLE system_info (
  site_key char(32) NOT NULL,
  site_logo varchar(256) NOT NULL,
  site_favicon varchar(256) NOT NULL,
  time_zone varchar(128) NOT NULL,
  year_type varchar(16) NOT NULL,
  year_format varchar(32) NOT NULL,
  booking_logo_en varchar(128) NOT NULL,
  booking_title_en varchar(128) NOT NULL,
  booking_note1_en text NOT NULL,
  booking_note2_en text NOT NULL,
  booking_logo_th varchar(128) NOT NULL,
  booking_title_th varchar(128) NOT NULL,
  booking_note1_th text NOT NULL,
  booking_note2_th text NOT NULL,
  reciept_logo_en varchar(128) NOT NULL,
  reciept_title_en varchar(128) NOT NULL,
  reciept_note1_en text NOT NULL,
  reciept_note2_en text NOT NULL,
  reciept_logo_th varchar(128) NOT NULL,
  reciept_title_th varchar(128) NOT NULL,
  reciept_note1_th text NOT NULL,
  reciept_note2_th text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



INSERT INTO system_info VALUES("8f411b77c389d5de467af8f2c0e91cda","logo.png","icon.png","Asia/Bangkok","BE","3","logo.png","Booking Slip","Name..............................................<br/>Address..............................................................................<br/>Tel................................................................","","logo.png","ใบจองห้องพัก","ชื่อ..............................................<br/>ที่อยู่..............................................................................<br/>โทร................................................................","","logo.png","Reciept","Name..............................................<br/>Address..............................................................................<br/>Tel................................................................","","logo.png","ใบเสร็จรับเงิน","ชื่อ..............................................<br/>ที่อยู่..............................................................................<br/>โทร................................................................","");



# Dump of user 
# Dump DATE : 11-Jun-2026

DROP TABLE IF EXISTS user;
CREATE TABLE user (
  user_key char(32) NOT NULL,
  name varchar(64) NOT NULL,
  lastname varchar(64) NOT NULL,
  username varchar(64) NOT NULL,
  password varchar(32) NOT NULL,
  user_photo varchar(128) NOT NULL DEFAULT 'noimg.jpg',
  user_class tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=user,2=admin,3=super admin',
  bed_view varchar(64) NOT NULL DEFAULT 'box_view',
  user_language varchar(8) NOT NULL DEFAULT 'th',
  system_font_size varchar(32) NOT NULL DEFAULT 'dd7e28065e654467be0f9c16f3bd987d',
  email varchar(128) NOT NULL,
  user_status tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;



INSERT INTO user VALUES("c37d695c6f1144abdefa8890a921b8fb","Khumphol","Tearmpin","dump","b501bef9289ddaf8dade6e04f1000120","noimg.jpg",3,"box_view","th","dd7e28065e654467be0f9c16f3bd987d","khumphol@clear.co.th",1);
INSERT INTO user VALUES("21232f297a57a5a743894a0e4a801fc3","ยงยุทธ","วัชรพงศ์เมธี","admin","21232f297a57a5a743894a0e4a801fc3","noimg.jpg",2,"box_view","th","dd7e28065e654467be0f9c16f3bd987d","yongyuttgsaving@gmail.com",1);



# Dump of user_online 
# Dump DATE : 11-Jun-2026

DROP TABLE IF EXISTS user_online;
CREATE TABLE user_online (
  osession varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  user_key varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  otime int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;



INSERT INTO user_online VALUES("42caa594enivh37s0a68nh3j6m","21232f297a57a5a743894a0e4a801fc3",1781193658);
INSERT INTO user_online VALUES("9bqtev9misqjeth9oatqkefcf8","21232f297a57a5a743894a0e4a801fc3",1781193694);
INSERT INTO user_online VALUES("7dtckf0riqua1fblgotbhlt2gr","",1781193569);



