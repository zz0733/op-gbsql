-- auto gen by george 2017-11-29 15:45:06
INSERT INTO "task_schedule" ("job_name", "alias_name", "job_group", "job_class", "job_method", "is_local", "status", "cronexpression", "is_sync", "description", "create_time", "update_time", "job_code", "is_system", "is_dynamic", "job_method_arg", "job_method_arg_class", "belong_to_idc", "scheduler")
SELECT  'api-12-三昇皇冠-游戏结果', NULL, NULL, 'so.wwb.gamebox.service.company.PlayerGameOrderResultJob', 'execute', 't', '1', '0 2/4 * * * ?', 't', 'api任务', '2017-11-23 16:58:55', NULL, 'ss-api-12-GAME_RESULT', 'f', 'f', '12', 'java.lang.Integer', 'v', 'scheduler4Api'
WHERE not EXISTS(SELECT job_code FROM task_schedule where job_code='ss-api-12-GAME_RESULT' and job_method_arg='12');