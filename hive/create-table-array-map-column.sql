CREATE EXTERNAL TABLE db1.member_info_2018
(member_code int, order_list array<map<string, string>>, label_6m map<string, int>)
 LOCATION '/data/member-info-2018';