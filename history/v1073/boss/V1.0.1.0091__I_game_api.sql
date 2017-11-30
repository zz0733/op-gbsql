-- auto gen by lenovo 2016-07-30 07:50:35
INSERT INTO "game_api_provider" ("id", "abbr_name", "full_name", "api_url", "remarks", "jar_url", "api_class", "jar_version", "ext_json") VALUES ('14', 'NYX', '', 'http://3rd.game.api.com/ag-api/doBusiness.do?params={0}&key={1}', '正式环境', 'file:/data/impl-jars/api-ag.jar', 'so.wwb.gamebox.service.gameapi.impl.AgGameApi', '20160730020758', '{"cagent":"H48_AGIN","Encrypt_key":"YDEZF2Nf","MD5_key":"lHNkkp0DX8La","loginurl":"http://gci.ampinplayopt0matrix.com:81/forwardGame.do?params={0}&key={1}","dm":"http://gci.ampinplayopt0matrix.com","search-minute":"4","setNum":"500","ftpHost":"xml.agingames.com","ftpPort":"21","ftpUserName":"H48.dayu","ftpPassword":"n3JJXo7eWQ","ftprootPath":"/AGIN/","lostAndfound":"lostAndfound"}');

INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('260', 'HTTP', '', 'register', 'POST', 'AG-创建账号并登录到游戏平台，', 'org.soul.model.gameapi.param.RegisterParam', 'org.soul.model.gameapi.result.RegisterResult', 'XML', 'XML', '14', '');
INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('261', 'HTTP', '', 'login', 'POST', 'AG-登录到游戏平台', 'org.soul.model.gameapi.param.LoginParam', 'org.soul.model.gameapi.result.LoginResult', 'XML', 'XML', '14', '');
INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('262', 'HTTP', '', 'kickOut', 'POST', 'AG-强制登出', 'org.soul.model.gameapi.param.KickOutParam', 'org.soul.model.gameapi.result.KickOutResult', 'XML', 'XML', '14', '');
INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('263', 'HTTP', '', 'withdraw', 'POST', 'AG-从游戏平台取款', 'org.soul.model.gameapi.param.WithdrawParam', 'org.soul.model.gameapi.result.WithdrawResult', 'XML', 'XML', '14', '');
INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('264', 'HTTP', '', 'deposit', 'POST', 'AG-转账到游戏平台', 'org.soul.model.gameapi.param.DepositParam', 'org.soul.model.gameapi.result.DepositResult', 'XML', 'XML', '14', '');
INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('265', 'HTTP', '', 'fetchBalance', 'POST', 'AG-获取游戏平台即时余额', 'org.soul.model.gameapi.param.FetchBalanceParam', 'org.soul.model.gameapi.result.FetchBalanceResult', 'XML', 'XML', '14', '');
INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('266', 'HTTP', '', 'fetchRecord', 'POST', 'AG-获取游戏平台注单', 'org.soul.model.gameapi.param.FetchRecordParam', 'org.soul.model.gameapi.result.FetchRecordResult', 'XML', 'XML', '14', '');
INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('267', 'HTTP', '', 'checkTransfer', 'POST', 'AG-验证存取款交易号是否已经处理', 'org.soul.model.gameapi.param.CheckTransferParam', 'org.soul.model.gameapi.result.CheckTransferResult', 'XML', 'XML', '14', '');
INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('268', 'HTTP', '', 'fetchModifiedRecord', 'POST', 'AG-修改注单', 'org.soul.model.gameapi.param.FetchModifiedRecordParam', 'org.soul.model.gameapi.result.FetchModifiedRecordResult', 'XML', 'XML', '14', '');
INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('269', 'HTTP', '', 'confirm_trans', 'POST', 'AG-确认转账', 'org.soul.model.gameapi.param.ConfirmTransParam', 'org.soul.model.gameapi.result.ConfirmTransResult', 'XML', 'XML', '14', '');


INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1300', 'cagent', 'cagent', 't', NULL, NULL, '', '', '260', '', 'AG-代理', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1301', 'loginname', 'user.account', 't', NULL, NULL, '', '', '260', '', 'AG-玩家游戏账号', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1302', 'method', 'method', 't', NULL, NULL, '', '', '260', '', 'AG-方法名', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1303', 'actype', 'actype', 't', NULL, NULL, '', '1', '260', '', 'AG-钱包类型(actype=1 代表真錢账号;actype=0 代表试玩账号)', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1304', 'password', 'user.password', 't', NULL, NULL, '', '', '260', '', 'AG-玩家游戏密码', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1305', 'oddtype', 'oddtype', 't', NULL, NULL, '', 'A', '260', 'A、B、C、D、E、F、G、H 及 I', 'AG-盘口, 设定新玩家可下注的范围', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1306', 'cur', 'user.currency', 't', NULL, NULL, '', '', '260', '', 'AG-货币种类', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1307', 'mh5', 'mh5', 'f', NULL, NULL, '', '', '260', '', 'AG-跳转页面配置', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1308', 'flashid', 'flashid', 'f', NULL, NULL, '', '', '260', '', 'AG-接入MG, 如进入MG电子游戏, forward game API需加上
flashid=xxx', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1309', 'Session Token', 'Session Token', 'f', NULL, NULL, '', '', '260', '', 'AG—生成方式:当用戶登陆网站,网站保存Session Token在内存用于驗證用户合法性', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1310', 'cagent', 'cagent', 't', NULL, NULL, '', '', '261', '', 'AG-代理', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1311', 'loginname', 'user.account', 't', NULL, NULL, '', '', '261', '', 'AG-玩家游戏账号', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1312', 'password', 'user.password', 't', NULL, NULL, '', '', '261', '', 'AG-玩家游戏密码', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1313', 'dm', 'dm', 't', NULL, NULL, '', 'http://gci.ampinplayopt0matrix.com', '261', '', 'AG-返回的网站域名', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1314', 'sid', 'sid', 't', NULL, NULL, '', '', '261', '', 'AG-(cagent+序列), 序列是唯一的 13~16 位数', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1315', 'actype', 'actype', 't', NULL, NULL, '', '1', '261', '', 'AG-钱包类型(actype=1 代表真錢账号;actype=0 代表试玩账号)', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1316', 'lang', 'user.locale', 't', NULL, NULL, '', '', '261', '', 'AG-语言', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1317', 'gameType', 'gameId', 'f', NULL, NULL, '', '', '261', '', 'AG-游戏类型 (AGIN 平台, 为空将导入整合页面)', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1318', 'oddtype', 'oddtype', 't', NULL, NULL, '', 'A', '261', 'A、B、C、D、E、F、G、H 及 I', 'AG-盘口, 设定新玩家可下注的范围', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1320', 'cagent', 'cagent', 't', NULL, NULL, '', '', '263', '', 'AG-代理', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1321', 'loginname', 'user.account', 't', NULL, NULL, '', '', '263', '', 'AG-玩家游戏账号', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1322', 'method', 'method', 't', NULL, NULL, '', '', '263', '', 'AG-方法名', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1323', 'credit', 'amount', 't', NULL, NULL, '', '', '263', '', 'AG-转账金额', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1324', 'type', 'type', 't', NULL, NULL, '', 'OUT', '263', '“IN” or “OUT”', 'AG-转账类型', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1325', 'billno', 'billno', 't', NULL, NULL, '', '', '263', '', 'AG-转账交易号，billno = (cagent+序列), 序列是唯一的 13~16 位数', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1326', 'actype', 'actype', 't', NULL, NULL, '', '1', '263', '', 'AG-钱包类型(actype=1 代表真錢账号;actype=0 代表试玩账号)', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1327', 'password', 'user.password', 't', NULL, NULL, '', '', '263', '', 'AG-玩家游戏密码', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1328', 'fixcredit', 'fixcredit', 'f', NULL, NULL, '', '', '263', '', 'AG-不可用额度,只有 AG 棋牌平台平台才需调用此参数', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1329', 'gameCategory', 'gameCategory', 'f', NULL, NULL, '', '0', '263', '', 'AG-只有 AG 棋牌平台平台才需调用此参数', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1330', 'cur', 'user.currency', 't', NULL, NULL, '', '', '263', '', 'AG-货币种类', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1331', 'flag', 'flag', 't', NULL, NULL, '', '1', '263', '1成功，0失败', 'AG-预备转账成功标识', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1340', 'cagent', 'cagent', 't', NULL, NULL, '', '', '264', '', 'AG-代理', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1341', 'loginname', 'user.account', 't', NULL, NULL, '', '', '264', '', 'AG-玩家游戏账号', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1342', 'method', 'method', 't', NULL, NULL, '', '', '264', '', 'AG-方法名', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1343', 'credit', 'amount', 't', NULL, NULL, '', '', '264', '', 'AG-转账金额', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1344', 'type', 'type', 't', NULL, NULL, '', 'IN', '264', '“IN” or “OUT”', 'AG-转账类型', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1345', 'billno', 'billno', 't', NULL, NULL, '', '', '264', '', 'AG-转账交易号，billno = (cagent+序列), 序列是唯一的 13~16 位数', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1346', 'actype', 'actype', 't', NULL, NULL, '', '1', '264', '', 'AG-钱包类型(actype=1 代表真錢账号;actype=0 代表试玩账号)', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1347', 'password', 'user.password', 't', NULL, NULL, '', '', '264', '', 'AG-玩家游戏密码', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1348', 'fixcredit', 'fixcredit', 'f', NULL, NULL, '', '', '264', '', 'AG-不可用额度,只有 AG 棋牌平台平台才需调用此参数', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1349', 'gameCategory', 'gameCategory', 'f', NULL, NULL, '', '0', '264', '', 'AG-只有 AG 棋牌平台平台才需调用此参数', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1350', 'cur', 'user.currency', 't', NULL, NULL, '', '', '264', '', 'AG-货币种类', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1351', 'flag', 'flag', 't', NULL, NULL, '', '1', '264', '1成功，0失败', 'AG-预备转账成功标识', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1352', 'billno', 'transId', 't', NULL, NULL, '', '', '264', '', 'AG-转账交易号，billno = (cagent+序列), 序列是唯一的 13~16 位数', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1360', 'cagent', 'cagent', 't', NULL, NULL, '', '', '265', '', 'AG-代理', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1361', 'loginname', 'loginname', 't', NULL, NULL, '', '', '265', '', 'AG-玩家游戏账号', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1362', 'method', 'method', 't', NULL, NULL, '', '', '265', '', 'AG-方法名', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1363', 'actype', 'actype', 't', NULL, NULL, '', '1', '265', '', 'AG-钱包类型(actype=1 代表真錢账号;actype=0 代表试玩账号)', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1364', 'password', 'password', 't', NULL, NULL, '', '', '265', '', 'AG-玩家游戏密码', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1365', 'cur', 'cur', 't', NULL, NULL, '', '', '265', '', 'AG-货币种类', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1370', 'startTime', 'startTime', 't', NULL, NULL, '', '', '266', '', 'AG-查询开始时间', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1380', 'cagent', 'cagent', 't', NULL, NULL, '', '', '267', '', 'AG-代理', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1381', 'actype', 'actype', 't', NULL, NULL, '1', '', '267', '', 'AG-钱包类型(actype=1 代表真錢账号;actype=0 代表试玩账号)', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1382', 'password', 'user.password', 't', NULL, NULL, '', '', '267', '', 'AG-玩家游戏密码', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1383', 'method', 'method', 't', NULL, NULL, '', '', '267', '', 'AG-方法名', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1384', 'actype', 'actype', 't', NULL, NULL, '', '1', '267', '', 'AG-钱包类型(actype=1 代表真錢账号;actype=0 代表试玩账号)', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1385', 'cur', 'user.currency', 't', NULL, NULL, '', '', '267', '', 'AG-货币种类', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1390', 'startTime', 'startTime', 't', NULL, NULL, '', '', '268', '', 'AG-查询开始时间', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1391', 'actype', 'actype', 't', NULL, NULL, '', '1', '269', '', 'AG-钱包类型(actype=1 代表真錢账号;actype=0 代表试玩账号)', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1392', 'billno', 'billno', 't', NULL, NULL, '', '', '269', '', 'AG-转账交易号，billno = (cagent+序列), 序列是唯一的 13~16 位数', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1393', 'type', 'type', 't', NULL, NULL, '', '', '269', '“IN” or “OUT”', 'AG-转账类型', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1394', 'credit', 'amount', 't', NULL, NULL, '', '', '269', '', 'AG-转账金额', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1395', 'flag', 'flag', 't', NULL, NULL, '', '1', '269', '1成功，0失败', 'AG-预备转账成功标识', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1396', 'cur', 'user.currency', 't', NULL, NULL, '', '', '269', '', 'AG-货币种类', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1397', 'gameCategory', 'gameCategory', 'f', NULL, NULL, '', '0', '269', '', 'AG-只有 AG 棋牌平台平台才需调用此参数', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1398', 'fixcredit', 'fixcredit', 'f', NULL, NULL, '', '', '269', '', 'AG-不可用额度,只有 AG 棋牌平台平台才需调用此参数', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1399', 'password', 'user.password', 't', NULL, NULL, '', '', '269', '', 'AG-玩家游戏密码', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1400', 'method', 'method', 't', NULL, NULL, '', '', '269', '', 'AG-方法名', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1401', 'loginname', 'user.account', 't', NULL, NULL, '', '', '269', '', 'AG-玩家游戏账号', '', '');
INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1402', 'cagent', 'cagent', 't', NULL, NULL, '', '', '269', '', 'AG-代理', '', '');