TYPE=VIEW
query=select `c`.`sortname` AS `sortname`,count(1) AS `cnt`,max(if((`c`.`bookmaker_id` = 3),`c`.`id`,0)) AS `bk1`,max(if((`c`.`bookmaker_id` = 4),`c`.`id`,0)) AS `bk2`,max(if((`c`.`bookmaker_id` = 5),`c`.`id`,0)) AS `bk3`,max(if((`c`.`bookmaker_id` = 3),`c`.`bookmaker_competition`,0)) AS `bk1_event`,max(if((`c`.`bookmaker_id` = 4),`c`.`bookmaker_competition`,0)) AS `bk2_event`,max(if((`c`.`bookmaker_id` = 5),`c`.`bookmaker_competition`,0)) AS `bk3_event`,`c`.`match_date` AS `match_date`,max(`c`.`_updated`) AS `last_updated` from `bet`.`competition` `c` group by `c`.`sortname`,`c`.`match_date` having (`cnt` > 1)
md5=6b7fac7bba5527d9ccba479e7b3c22cb
updatable=0
algorithm=0
definer_user=betscraper
definer_host=%
suid=1
with_check_option=0
timestamp=2018-12-24 19:13:21
create-version=1
source=select `c`.`sortname` AS `sortname`,count(1) AS `cnt`,max(if((`c`.`bookmaker_id` = 3),`c`.`id`,0)) AS `bk1`,max(if((`c`.`bookmaker_id` = 4),`c`.`id`,0)) AS `bk2`,max(if((`c`.`bookmaker_id` = 5),`c`.`id`,0)) AS `bk3`,max(if((`c`.`bookmaker_id` = 3),`c`.`bookmaker_competition`,0)) AS `bk1_event`,max(if((`c`.`bookmaker_id` = 4),`c`.`bookmaker_competition`,0)) AS `bk2_event`,max(if((`c`.`bookmaker_id` = 5),`c`.`bookmaker_competition`,0)) AS `bk3_event`,`c`.`match_date` AS `match_date`,max(`c`.`_updated`) AS `last_updated` from `competition` `c` group by `c`.`sortname`,`c`.`match_date` having (`cnt` > 1)
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `c`.`sortname` AS `sortname`,count(1) AS `cnt`,max(if((`c`.`bookmaker_id` = 3),`c`.`id`,0)) AS `bk1`,max(if((`c`.`bookmaker_id` = 4),`c`.`id`,0)) AS `bk2`,max(if((`c`.`bookmaker_id` = 5),`c`.`id`,0)) AS `bk3`,max(if((`c`.`bookmaker_id` = 3),`c`.`bookmaker_competition`,0)) AS `bk1_event`,max(if((`c`.`bookmaker_id` = 4),`c`.`bookmaker_competition`,0)) AS `bk2_event`,max(if((`c`.`bookmaker_id` = 5),`c`.`bookmaker_competition`,0)) AS `bk3_event`,`c`.`match_date` AS `match_date`,max(`c`.`_updated`) AS `last_updated` from `bet`.`competition` `c` group by `c`.`sortname`,`c`.`match_date` having (`cnt` > 1)
