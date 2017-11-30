-- auto gen by mark 2016-01-14 19:50:55
-- SELECT redo_sqls($$
-- INSERT INTO "game_api_provider" ("id", "abbr_name", "full_name", "api_url", "remarks", "jar_url", "api_class", "jar_version", "ext_json") VALUES ('2', 'KG', NULL, 'http://localhost:7777/mock/kg/api.html', NULL, 'gamebox-api/api-impl/kg/target/api-kg.jar', 'so.wwb.gamebox.service.gameapi.impl.KgGameApi', '201512031100', '{"vendorId":"104","Vendorsite":"www.baidu.com"}');
-- INSERT INTO "game_api_provider" ("id", "abbr_name", "full_name", "api_url", "remarks", "jar_url", "api_class", "jar_version", "ext_json") VALUES ('3', 'MG', NULL, 'http://localhost:7777/mock/mg/api.html', NULL, 'gamebox-api/api-impl/mg/target/api-mg.jar', 'so.wwb.gamebox.service.gameapi.impl.MgGameApi', '201512031100', '{"username":"abc","password":"abc","SH_NET_ID":"80000495","ipaddress":"127.0.0.1","parentID":"","API_URL":"lps/j_spring_security_check.html","headers":{"X-Requested-With":"X-Api-Client","X-Api-Call":"X-Api-Client"}}');
-- INSERT INTO "game_api_provider" ("id", "abbr_name", "full_name", "api_url", "remarks", "jar_url", "api_class", "jar_version", "ext_json") VALUES ('1', 'DS', NULL, 'http://localhost:7777/mock/ds/api.html', NULL, 'gamebox-api/api-impl/ds/target/api-ds.jar', 'so.wwb.gamebox.service.gameapi.impl.DsGameApi', '201512031100', '{"hashCode":"a_test_hash_code"}');
--
--
-- INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('11', 'HTTP', 'WITHDRAW', 'withdraw', 'POST', 'DS-从游戏平台取款', 'org.soul.model.gameapi.param.WithdrawParam', 'org.soul.model.gameapi.result.WithdrawResult', 'JSON', 'JSON', '1', NULL);
-- INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('23', 'HTTP', 'member-api-web/member-api', 'deposit', 'POST', 'MG-玩家充值', 'org.soul.model.gameapi.param.DepositParam', 'org.soul.model.gameapi.result.DepositResult', 'XML', 'XML', '3', '{"header":{"":"application/xml"}}');
-- INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('24', 'HTTP', 'member-api-web/member-api', 'withdraw', 'POST', 'MG-玩家取款', 'org.soul.model.gameapi.param.WithdrawParam', 'org.soul.model.gameapi.result.WithdrawResult', 'XML', 'XML', '3', '{"header":{"":"application/xml"}}');
-- INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('25', 'HTTP', 'member-api-web/member-api', 'fetchBalance', 'POST', 'MG-玩家余额', 'org.soul.model.gameapi.param.FetchBalanceParam', 'org.soul.model.gameapi.result.FetchBalanceResult', 'XML', 'XML', '3', '{"header":{"":"application/xml"}}');
-- INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('26', 'HTTP', 'lps/secure/hortx/', 'fetchRecord', 'GET', 'MG-游戏注单记录', 'org.soul.model.gameapi.param.FetchRecordParam', 'org.soul.model.gameapi.result.FetchRecordResult', 'FROM', 'JSON', '3', '');
-- INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('30', 'HTTP', 'PlayerLanding', 'register', 'POST', '创建账号并登录到游戏平台，若账号已存在则直接登录', 'org.sourl.model.gameapi.param.RegisterParam', 'org.sourl.model.gameapi.result.RegisterResult', 'XML', 'XML', '2', NULL);
-- INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('18', 'HTTP', 'GET_ADJUSTED_RECORD', 'fetchModifiedRecord', 'POST', 'DS-获取游戏平台修改游戏局影响的注单ID', 'org.soul.model.gameapi.param.FetchModifiedRecordParam', 'org.soul.model.gameapi.result.FetchModifiedRecordResult', 'JSON', 'JSON', '1', NULL);
-- INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('21', 'HTTP', 'lps/secure/network/${SH_NET_ID}/downline', 'register', 'PUT', 'MG-注册玩家账号', 'org.soul.model.gameapi.param.RegisterParam', 'org.soul.model.gameapi.result.RegisterResult', 'JSON', 'JSON', '3', '{"headers":{"X-Requested-With":"X-Api-Client","X-Api-Call":"X-Api-Client","Content-Type":"application/json"},"additional":{"crId":"00000483","crType":"hor","neId":"00000495","neId":"00000495","neType":"sh","tarType":"m","casino":{"enable":true},"poker":{"enable":false}}}');
-- INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('31', 'HTTP', 'PlayerLanding', 'login', 'POST', '登录到游戏平台', 'org.soul.model.gameapi.param.LoginParam', 'org.soul.model.gameapi.result.LoginResult', 'XML', 'XML', '2', NULL);
-- INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('22', 'HTTP', 'member-api-web/member-api', 'login', 'POST', 'MG-玩家登入', 'org.soul.model.gameapi.param.LoginParam', 'org.soul.model.gameapi.result.LoginResult', 'JSON', 'JSON', '3', '');
-- INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('32', 'HTTP', 'FundInOutFirst', 'deposit', 'POST', '转账到游戏平台', 'org.soul.model.gameapi.param.DepositParam', 'org.soul.model.gameapi.result.DepositResult', 'XML', 'XML', '2', NULL);
-- INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('33', 'HTTP', 'FundInOutFirst', 'withdraw', 'POST', '从游戏平台取款', 'org.soul.model.gameapi.param.WithdrawParam', 'org.soul.model.gameapi.result.WithdrawResult', 'XML', 'XML', '2', NULL);
-- INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('6', 'HTTP', 'DEPOSIT', 'deposit', 'POST', 'DS-转账到游戏平台', 'org.soul.model.gameapi.param.DepositParam', 'org.soul.model.gameapi.result.DepositResult', 'JSON', 'JSON', '1', NULL);
-- INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('35', 'HTTP', 'GetGameInfo', 'fetchRecord', 'POST', 'KG-获取游戏平台注单', 'org.soul.model.gameapi.param.FetchRecordParam', 'org.soul.model.gameapi.result.FetchRecordResult', 'XML', 'JSON', '2', NULL);
-- INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('14', 'HTTP', 'GET_BALANCE', 'fetchBalance', 'POST', 'DS-获取游戏平台即时余额', 'org.soul.model.gameapi.param.FetchBalanceParam', 'org.soul.model.gameapi.result.FetchBalanceResult', 'JSON', 'JSON', '1', NULL);
-- INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('15', 'HTTP', 'GET_RECORD', 'fetchRecord', 'POST', 'DS-获取游戏平台注单', 'org.soul.model.gameapi.param.FetchRecordParam', 'org.soul.model.gameapi.result.FetchRecordResult', 'JSON', 'JSON', '1', NULL);
-- INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('20', 'HTTP', 'CHECK_REF', 'checkTransfer', 'POST', 'DS-验证存取款交易号是否已经处理', 'org.soul.model.gameapi.param.CheckTransferParam', 'org.soul.model.gameapi.result.CheckTransferResult', 'JSON', 'JSON', '1', NULL);
-- INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('34', 'HTTP', 'FundInOutConfirm', 'fetchBalance', 'POST', 'KG-获取游戏平台即时余额', 'org.soul.model.gameapi.param.FetchBalanceParam', 'org.soul.model.gameapi.result.FetchBalanceResult', 'XML', 'XML', '2', NULL);
-- INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('36', 'HTTP', 'GET_ADJUSTED_RECORD', 'fetchModifiedRecord', 'POST', 'KG-获取游戏平台修改游戏局影响的注单ID', 'org.soul.model.gameapi.param.FetchModifiedRecordParam', 'org.soul.model.gameapi.result.FetchModifiedRecordResult', 'XML', 'JSON', '2', NULL);
-- INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('37', 'HTTP', 'CHECK_REF', 'checkTransfer', 'POST', 'KG-验证存取款交易号是否已经处理', 'org.soul.model.gameapi.param.CheckTransferParam', 'org.soul.model.gameapi.result.CheckTransferResult', 'XML', 'JSON', '2', NULL);
-- INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('2', 'HTTP', 'LOGIN', 'register', 'POST', 'DS-创建账号并登录到游戏平台，若账号已存在则直接登录', 'org.soul.model.gameapi.param.RegisterParam', 'org.soul.model.gameapi.result.RegisterResult', 'JSON', 'JSON', '1', NULL);
-- INSERT INTO "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json") VALUES ('10', 'HTTP', 'LOGIN', 'login', 'POST', 'DS-登录到游戏平台', 'org.soul.model.gameapi.param.LoginParam', 'org.soul.model.gameapi.result.LoginResult', 'JSON', 'JSON', '1', NULL);
--
--
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('15', 'password', 'user.password', 't', NULL, NULL, '^[0-9a-z]{32}$', NULL, '6', NULL, 'DS-玩家在游戏平台的账号密码', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('3', 'password', 'user.password', 't', NULL, NULL, '^[0-9a-z]{32}$', NULL, '2', NULL, 'DS-玩家在游戏平台的账号密码', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('8', 'language', 'user.locale', 't', NULL, NULL, '^[A-Z]{2}$', NULL, '2', 'CN,HK,EN,TH,VN', 'DS-游戏语言', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('12', 'line', 'line', 'f', NULL, NULL, NULL, '1', '2', NULL, 'DS-线路', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('18', 'amount', 'amount', 't', NULL, NULL, NULL, NULL, '6', NULL, 'DS-存款金额, 格式(#.00)', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('31', 'username', 'user.account', 't', NULL, NULL, '^[0-9a-zA-Z]{1,20}$', NULL, '14', NULL, 'DS-玩家在游戏平台的账号', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('34', 'count', 'maxCount', 't', NULL, NULL, NULL, '1000', '15', NULL, 'DS-一次拉取多少条记录，最多1000条', '1', '1000');
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('50', 'username', 'account', 't', NULL, NULL, '^[0-9a-zA-Z]{1,20}$', NULL, '30', NULL, '玩家在游戏平台的账号', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('51', 'currency', 'currency', 't', NULL, NULL, '^[A-Z]{3}$', NULL, '30', NULL, '币种', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('52', 'nickname', 'nickname', 't', '1', '20', NULL, NULL, '30', NULL, '玩家在游戏平台的昵称', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('35', 'beginId', 'startId', 't', NULL, NULL, NULL, NULL, '15', NULL, 'DS-注单最大序列号, 第一次拉取, 值为 0', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('37', 'beginId', 'startId', 't', NULL, NULL, NULL, NULL, '18', NULL, 'DS-注单最大序列号, 第一次拉取, 值为 0', '0', NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('38', 'ref', 'transId', 't', NULL, NULL, NULL, NULL, '20', NULL, 'DS-唯一交易号, 由合作伙伴平台提供, 以备查验', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('19', 'username', 'user.account', 't', NULL, NULL, '^[0-9a-zA-Z]{1,20}$', NULL, '11', NULL, 'DS-玩家在游戏平台的账号', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('23', 'amount', 'amount', 't', NULL, NULL, NULL, NULL, '11', NULL, 'DS-取款金额, 格式(#.00)', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('71', 'username', 'account', 't', NULL, NULL, '^[0-9a-zA-Z]{1,20}$', NULL, '25', NULL, 'MG-Balance-玩家账号', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('72', 'password', 'password', 't', NULL, NULL, '^[0-9a-z]{32}$', NULL, '25', NULL, 'MG-Balance-玩家密码', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('46', 'username', 'account', 't', NULL, NULL, '^[0-9a-zA-Z]{1,20}$', NULL, '22', NULL, 'MG-LOGIN-玩家账号', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('47', 'password', 'password', 't', NULL, NULL, '^[0-9a-z]{32}$', NULL, '22', NULL, 'MG-LOGIN-玩家密码', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('48', 'currencyCode', 'currency', 't', NULL, NULL, '^[a-z]{3}$', NULL, '22', NULL, 'MG-LOGIN-玩家币别', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('66', 'username', 'account', 't', NULL, NULL, '^[0-9a-zA-Z]{1,20}$', NULL, '24', NULL, 'MG-WITHDRAW-玩家账号', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('13', 'username', 'user.account', 't', NULL, NULL, '^[0-9a-zA-Z]{1,20}$', NULL, '6', NULL, 'DS-玩家在游戏平台的账号', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('67', 'password', 'password', 't', NULL, NULL, '^[0-9a-z]{32}$', NULL, '24', NULL, 'MG-WITHDRAW-玩家密码', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('53', 'language', 'locale', 't', NULL, NULL, '^[A-Z]{2}$', 'sc', '30', '默认sc（简体中文）', '游戏语言', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('55', 'fundLink', 'fundLink', 't', '1', '200', '^[0-9a-zA-Z]{1,20}$', NULL, '30', NULL, '网主给予玩家转账的网址', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('56', 'playerCredit', 'playerCredit', 't', '1', '200', '^[0-9a-zA-Z]{1,20}$', NULL, '30', NULL, '玩家信用', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('57', 'playerAllowStake', 'playerAllowStake', 't', '1', '200', '^[0-9a-zA-Z]{1,20}$', NULL, '30', NULL, '玩家选择赌注上限组别（网主在KG管理网站设置的赌注组别）', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('58', 'trial', 'trial', 't', '1', '5', '^[0-9a-zA-Z]{1,20}$', NULL, '30', NULL, '试用版账户 ( Yes -1 /No – 0 )', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('59', 'rebateLevel', 'rebateLevel', 't', '1', '10', '^[0-9a-zA-Z]{1,20}$', '1', '30', NULL, '不同返水等級的返水百分比由網主設定,默认为1', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('60', 'playerIP', 'playerIP', 't', '1', '20', '^[0-9a-zA-Z]{1,20}$', '1', '30', NULL, '玩家 ip', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('68', 'amount', 'amount', 't', NULL, NULL, NULL, NULL, '24', NULL, 'MG-WITHDRAW-充值金额', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('61', 'username', 'account', 't', NULL, NULL, '^[0-9a-zA-Z]{1,20}$', NULL, '23', NULL, 'MG-DEPOSIT-玩家账号', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('62', 'password', 'password', 't', NULL, NULL, '^[0-9a-z]{32}$', NULL, '23', NULL, 'MG-DEPOSIT-玩家密码', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('63', 'amount', 'amount', 't', NULL, NULL, NULL, NULL, '23', NULL, 'MG-DEPOSIT-充值金额', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('64', 'transactionID', 'orderNo', 't', NULL, NULL, NULL, NULL, '23', NULL, 'MG-DEPOSIT-充值交易号', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('65', 'product', 'product', 't', NULL, NULL, NULL, 'poker', '23', NULL, 'MG-DEPOSIT-产品类型', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('69', 'transactionID', 'orderNo', 't', NULL, NULL, NULL, NULL, '24', NULL, 'MG-WITHDRAW-充值交易号', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('70', 'product', 'product', 't', NULL, NULL, NULL, 'poker', '24', NULL, 'MG-WITHDRAW-产品类型', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('44', 'email', 'email', 'f', NULL, NULL, NULL, '', '21', NULL, 'MG-REGISTER-玩家Email', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('41', 'currency', 'currency', 't', NULL, NULL, '^[A-Z]{3}$', 'CNY', '21', NULL, 'MG-REGISTER-玩家币种', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('42', 'name', 'nickname', 't', '1', '20', NULL, NULL, '21', NULL, 'MG-REGISTER-玩家的昵称', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('45', 'mobile', 'mobile', 'f', NULL, NULL, NULL, ' ', '21', NULL, 'MG-REGISTER-玩家电话', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('39', 'username', 'account', 't', NULL, NULL, '^[0-9a-zA-Z]{1,20}$', NULL, '21', NULL, 'MG-REGISTER-玩家账号', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('40', 'password', 'password', 't', NULL, NULL, '^[0-9a-z]{32}$', NULL, '21', NULL, 'MG-REGISTER-玩家账号密码', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('43', 'language', 'locale', 't', NULL, NULL, '^[A-Z]{2}$', 'en', '21', 'cn,hk,en,th,vn', 'MG-REGISTER-游戏语言', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('88', 'start', 'startTime', 't', NULL, NULL, '^(\d{4}):[0-9]{2}:[0-9]{2}:[0-9]{?}$', NULL, '26', NULL, 'MG-注单-开始时间', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('89', 'end', 'endTime', 't', NULL, NULL, '^(\d{4}):[0-9]{2}:[0-9]{2}:[0-9]{?}$', NULL, '26', NULL, 'MG-注单-结束时间', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('90', 'timezone', 'timezone', 't', NULL, NULL, '^[UTC|Asia/Shanghai]{1}$', 'UTC', '26', NULL, 'MG-注单-时区(UTC,Asia/Shanghai)', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('7', 'nickname', 'user.nickname', 't', '1', '20', NULL, NULL, '2', NULL, 'DS-玩家在游戏平台的昵称', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('5', 'currency', 'user.currency', 't', NULL, NULL, '^[A-Z]{3}$', NULL, '2', NULL, 'DS-币种', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('16', 'ref', 'transId', 't', NULL, NULL, NULL, NULL, '6', NULL, 'DS-唯一交易号, 由合作伙伴平台提供, 以备查验', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('20', 'password', 'user.password', 't', NULL, NULL, '^[0-9a-z]{32}$', NULL, '11', NULL, 'DS-玩家在游戏平台的账号密码', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('21', 'ref', 'transId', 't', NULL, NULL, NULL, NULL, '11', NULL, 'DS-唯一交易号, 由合作伙伴平台提供, 以备查验', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('1', 'username', 'user.account', 't', NULL, NULL, '^[0-9a-zA-Z]{1,20}$', NULL, '2', NULL, 'DS-玩家在游戏平台的账号', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('17', 'desc', 'desc', 'f', NULL, NULL, NULL, NULL, '6', NULL, 'DS-本次交易描述', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('25', 'password', 'user.password', 't', NULL, NULL, '^[0-9a-z]{32}$', NULL, '10', NULL, 'DS-玩家在游戏平台的账号密码', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('26', 'currency', 'user.currency', 't', NULL, NULL, '^[A-Z]{3}$', NULL, '10', NULL, 'DS-币种', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('27', 'nickname', 'user.nickname', 't', '1', '20', NULL, NULL, '10', NULL, 'DS-玩家在游戏平台的昵称', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('28', 'language', 'user.locale', 't', NULL, NULL, '^[A-Z]{2}$', NULL, '10', 'CN,HK,EN,TH,VN', 'DS-游戏语言', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('32', 'password', 'user.password', 't', NULL, NULL, '^[0-9a-z]{32}$', NULL, '14', NULL, 'DS-玩家在游戏平台的账号密码', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('30', 'line', 'line', 'f', NULL, NULL, NULL, '1', '10', NULL, 'DS-线路', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('22', 'desc', 'desc', 'f', NULL, NULL, NULL, NULL, '11', NULL, 'DS-本次交易描述', NULL, NULL);
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('36', 'count', 'maxCount', 't', NULL, NULL, NULL, '10', '18', NULL, 'DS-一次拉取多少条记录，最多10条', '1', '10');
-- INSERT INTO "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") VALUES ('24', 'username', 'user.account', 't', NULL, NULL, '^[0-9a-zA-Z]{1,20}$', NULL, '10', NULL, 'DS-玩家在游戏平台的账号', NULL, NULL);
--
--
--
-- INSERT INTO "game_api_interface_response" ("id", "api_field_name", "property_name", "comment", "interface_id") VALUES ('1', 'request', NULL, '原请求', '2');
-- INSERT INTO "game_api_interface_response" ("id", "api_field_name", "property_name", "comment", "interface_id") VALUES ('2', 'logId', NULL, 'API日志ID', '2');
-- INSERT INTO "game_api_interface_response" ("id", "api_field_name", "property_name", "comment", "interface_id") VALUES ('6', 'params', NULL, '参数', '2');
-- INSERT INTO "game_api_interface_response" ("id", "api_field_name", "property_name", "comment", "interface_id") VALUES ('8', 'link', NULL, '游戏平台地址', '2');
-- INSERT INTO "game_api_interface_response" ("id", "api_field_name", "property_name", "comment", "interface_id") VALUES ('3', 'errorCode', 'errCode', '错误代码', '2');
-- INSERT INTO "game_api_interface_response" ("id", "api_field_name", "property_name", "comment", "interface_id") VALUES ('5', 'errorMessage', 'errMsg', '错误消息', '2');
-- INSERT INTO "game_api_interface_response" ("id", "api_field_name", "property_name", "comment", "interface_id") VALUES ('9', 'link', 'link', 'MG-游戏平台地址', '21');
-- INSERT INTO "game_api_interface_response" ("id", "api_field_name", "property_name", "comment", "interface_id") VALUES ('10', 'code', 'errCode', '错误代码', '21');
-- INSERT INTO "game_api_interface_response" ("id", "api_field_name", "property_name", "comment", "interface_id") VALUES ('11', 'message', 'errMsg', '错误消息', '21');
-- INSERT INTO "game_api_interface_response" ("id", "api_field_name", "property_name", "comment", "interface_id") VALUES ('12', 'id', 'member_id', 'MG-玩家ID', '21');
--
-- $$);