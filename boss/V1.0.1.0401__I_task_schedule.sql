-- auto gen by cherry 2017-08-11 16:22:52
-- Water note: 为了解决IDC:B,无法彩票开奖的问题
INSERT INTO "task_schedule" ("job_name", "alias_name", "job_group", "job_class", "job_method", "is_local", "status", "cronexpression", "is_sync", "description", "create_time", "update_time", "job_code", "is_system", "is_dynamic", "job_method_arg", "job_method_arg_class", "belong_to_idc", "scheduler")
SELECT '彩票派彩任务', NULL, NULL, 'so.wwb.gamebox.service.company.LotteryResultOpenJob', 'execute', 't', '1', '0 0/3 * * * ?', 't', '彩票派彩任务', '2017-08-11 06:43:33.906', NULL, 'lottery_result_payout', 'f', 'f', '5', 'java.lang.Integer', 'B', 'scheduler4Lottery'
WHERE NOT EXISTS (SELECT job_code from task_schedule where job_code='lottery_result_payout');