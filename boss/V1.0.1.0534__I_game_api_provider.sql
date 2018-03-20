-- auto gen by linsen 2018-03-20 10:01:46
-- PPAPI　by pack

INSERT INTO "game_api_provider" ("id", "abbr_name", "full_name", "api_url", "remarks", "jar_url", "api_class", "jar_version", "ext_json", "default_timezone", "support_agent", "trial")
SELECT '38', 'PP', '', 'http://3rd.game.api.com/pp-api/IntegrationService/v3/http/CasinoGameAPI{0}', '', 'file:/data/impl-jars/api/api-ysb.jar', 'so.wwb.gamebox.service.gameapi.impl.PpGameApi', '20180318020358', '{"url":"https://api.prerelease-env.biz/IntegrationService/v3/http/CasinoGameAPI","secureLogin":"hg_hongtubet","Key":"testKey","PlayerTimeZone":"GMT+8","hisUrl":"https://api.prerelease-env.biz/IntegrationService/v3{0}","search-minute":"-10"}', '+0', 'f', 'f'
WHERE not EXISTS (SELECT id FROM game_api_provider where id=38);



INSERT INTO  "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json")
 SELECT '3808', 'HTTP', '/DataFeeds/gamerounds/?login={0}&password={1}&timepoint={2}', 'fetchRecord', 'GET', 'PP-获取注单', 'org.soul.model.gameapi.param.FetchRecordParam', 'org.soul.model.gameapi.result.FetchRecordResult', 'FORM', 'CSV', '38', NULL
WHERE not EXISTS (SELECT id FROM game_api_interface where id=3808);
INSERT INTO  "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json")
SELECT '3807', 'HTTP', '/balance/transfer?secureLogin={0}&externalPlayerId={1}&externalTransactionId={2}&amount={3}&hash={4}', 'withdraw', 'POST', 'PP-转账取款', 'org.soul.model.gameapi.param.WithdrawParam', 'org.soul.model.gameapi.result.WithdrawResult', 'FORM', 'JSON', '38', NULL
WHERE not EXISTS (SELECT id FROM game_api_interface where id=3807);
INSERT INTO  "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json")
 SELECT '3806', 'HTTP', '/game/start?secureLogin={0}&externalPlayerId={1}&gameId={2}&language={3}&hash={4}', 'login', 'POST', 'PP-登录', 'org.soul.model.gameapi.param.LoginParam', 'org.soul.model.gameapi.param.LoginParam', 'FORM', 'JSON', '38', NULL
WHERE not EXISTS (SELECT id FROM game_api_interface where id=3806);
INSERT INTO  "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json")
SELECT '3805', 'HTTP', '/game/session/terminate?secureLogin={0}&externalPlayerId={1}&hash={2}', 'kickOut', 'POST', 'PP-踢出玩家', 'org.soul.model.gameapi.param.KickOutParam', 'org.soul.model.gameapi.result.KickOutResult', 'FORM', 'JSON', '38', NULL
WHERE not EXISTS (SELECT id FROM game_api_interface where id=3805);
INSERT INTO  "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json")
SELECT '3804', 'HTTP', '/balance/current?secureLogin={0}&externalPlayerId={1}&hash={2}', 'fetchBalance', 'POST', 'PP-查询余额', 'org.soul.model.gameapi.param.FetchBalanceParam', 'org.soul.model.gameapi.result.FetchBalanceResult', 'FORM', 'JSON', '38', NULL
WHERE not EXISTS (SELECT id FROM game_api_interface where id=3804);
INSERT INTO  "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json")
SELECT '3803', 'HTTP', '/balance/transfer/status/?secureLogin={0}&externalTransactionId={1}&hash={2}', 'confirm_trans', 'POST', 'PP-确认转账', 'org.soul.model.gameapi.param.ConfirmTransParam', 'org.soul.model.gameapi.result.ConfirmTransResult', 'FORM', 'JSON', '38', NULL
WHERE not EXISTS (SELECT id FROM game_api_interface where id=3803);
INSERT INTO  "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json")
SELECT '3802', 'HTTP', '/balance/transfer?secureLogin={0}&externalPlayerId={1}&externalTransactionId={2}&amount={3}&hash={4}', 'deposit', 'POST', 'PP-转账存款', 'org.soul.model.gameapi.param.DepositParam', 'org.soul.model.gameapi.result.DepositResult', 'FORM', 'JSON', '38', NULL
WHERE not EXISTS (SELECT id FROM game_api_interface where id=3802);
INSERT INTO  "game_api_interface" ("id", "protocol", "api_action", "local_action", "http_method", "remarks", "param_class", "result_class", "request_content_type", "response_content_type", "provider_id", "ext_json")
SELECT '3801', 'HTTP', '/player/account/create?secureLogin={0}&externalPlayerId={1}&currency={2}&hash={3}', 'register', 'POST', 'PP-创建账号', 'org.soul.model.gameapi.param.RegisterParam', 'org.soul.model.gameapi.result.RegisterResult', 'FORM', 'JSON', '38', NULL
WHERE not EXISTS (SELECT id FROM game_api_interface where id=3801);



INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38083', 'timepoint', 'timepoint', 't', NULL, NULL, NULL, NULL, '3808', NULL, 'PP-开始拉取注单的时间点', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38083);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38082', 'password', 'password', 't', NULL, NULL, NULL, NULL, '3808', NULL, 'PP-密匙值', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38082);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38081', 'login', 'login', 't', NULL, NULL, NULL, NULL, '3808', NULL, 'PP-API身份验证的用户名', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38081);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38075', 'hash', 'hash', 't', NULL, NULL, NULL, NULL, '3807', NULL, 'PP-请求的哈希代码', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38075);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38074', 'externalTransactionId', 'externalTransactionId', 't', NULL, NULL, NULL, NULL, '3807', NULL, 'PP-交易ｉｄ号码', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38074);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38073', 'externalPlayerId', 'externalPlayerId', 't', NULL, NULL, NULL, NULL, '3807', NULL, 'PP-玩家用户id', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38073);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38072', 'secureLogin', 'secureLogin', 't', NULL, NULL, NULL, NULL, '3807', NULL, 'PP-API身份验证的用户名', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38072);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38071', 'amount', 'amount', 't', NULL, NULL, NULL, NULL, '3807', NULL, 'PP-取款金额', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38071);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38068', 'lobbyURl', 'lobbyURl', 'f', NULL, NULL, NULL, NULL, '3806', NULL, 'PP-大厅页面链接', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38068);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38067', 'cashierURL', 'cashierURL', 'f', NULL, NULL, NULL, NULL, '3806', NULL, 'PP-收银台链接', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38067);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38066', 'platform', 'platform', 'f', NULL, NULL, NULL, NULL, '3806', NULL, 'PP-打开游戏的平台', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38066);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38065', 'hash', 'hash', 't', NULL, NULL, NULL, NULL, '3806', NULL, 'PP-请求的哈希代码', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38065);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38064', 'language', 'language', 't', NULL, NULL, NULL, NULL, '3806', NULL, 'PP-游戏的语言', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38064);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38063', 'gameId', 'gameId', 't', NULL, NULL, NULL, NULL, '3806', NULL, 'PP-ppAPI系统中的游戏ID', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38063);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38062', 'externalPlayerId', 'externalPlayerId', 't', NULL, NULL, NULL, NULL, '3806', NULL, 'PP-玩家用户id', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38062);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38061', 'secureLogin', 'secureLogin', 't', NULL, NULL, NULL, NULL, '3806', NULL, 'PP-API身份验证的用户名', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38061);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38053', 'hash', 'hash', 't', NULL, NULL, NULL, NULL, '3805', NULL, 'PP-请求的哈希代码', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38053);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38052', 'externalPlayerId', 'externalPlayerId', 't', NULL, NULL, NULL, NULL, '3805', NULL, 'PP-玩家用户id', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38052);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38051', 'secureLogin', 'secureLogin', 't', NULL, NULL, NULL, NULL, '3805', NULL, 'PP-API身份验证的用户名', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38051);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38043', 'hash', 'hash', 't', NULL, NULL, NULL, NULL, '3804', NULL, 'PP-请求的哈希代码', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38043);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38042', 'externalPlayerId', 'externalPlayerId', 't', NULL, NULL, NULL, NULL, '3804', NULL, 'PP-玩家用户id', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38042);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38041', 'secureLogin', 'secureLogin', 't', NULL, NULL, NULL, NULL, '3804', NULL, 'PP-API身份验证的用户名', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38041);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38033', 'hash', 'hash', 't', NULL, NULL, NULL, NULL, '3803', NULL, 'PP-请求的哈希代码', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38033);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38032', 'externalTransactionId', 'externalTransactionId', 't', NULL, NULL, NULL, NULL, '3803', NULL, 'PP-交易ｉｄ号码', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38032);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38031', 'secureLogin', 'secureLogin', 't', NULL, NULL, NULL, NULL, '3803', NULL, 'PP-API身份验证的用户名', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38031);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38025', 'hash', 'hash', 't', NULL, NULL, NULL, NULL, '3802', NULL, 'PP-请求的哈希代码', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38025);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38024', 'externalTransactionId', 'externalTransactionId', 't', NULL, NULL, NULL, NULL, '3802', NULL, 'PP-交易ｉｄ号码', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38024);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38023', 'externalPlayerId', 'externalPlayerId', 't', NULL, NULL, NULL, NULL, '3802', NULL, 'PP-玩家用户id', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38023);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38022', 'secureLogin', 'secureLogin', 't', NULL, NULL, NULL, NULL, '3802', NULL, 'PP-API身份验证的用户名', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38022);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38021', 'amount', 'amount', 't', NULL, NULL, NULL, NULL, '3802', NULL, 'PP-存款金额', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38021);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38014', 'hash', 'hash', 't', NULL, NULL, NULL, NULL, '3801', NULL, 'PP-请求的哈希代码', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38014);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38013', 'secureLogin', 'secureLogin', 't', NULL, NULL, NULL, NULL, '3801', NULL, 'PP-API身份验证的用户名', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38013);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38012', 'externalPlayerId', 'externalPlayerId', 't', NULL, NULL, NULL, NULL, '3801', NULL, 'PP-玩家用户id', NULL, NULL WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38012);
INSERT INTO   "game_api_interface_request" ("id", "api_field_name", "property_name", "required", "min_length", "max_length", "reg_exp", "default_value", "interface_id", "remarks", "comment", "min_value", "max_value") SELECT '38011', 'currency', 'currency', 't', NULL, NULL, '', '', '3801', '', 'PP-玩家货币类型', '', '' WHERE not EXISTS (SELECT id FROM game_api_interface_request where id=38011);
