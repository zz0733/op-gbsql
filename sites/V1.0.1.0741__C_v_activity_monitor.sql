-- auto gen by linsen 2018-04-13 16:13:44

-- 删除活动申请表字段transaction_no by steffan
select redo_sqls($$
      alter table activity_player_apply drop column IF EXISTS "transaction_no" ;
$$);

-- 活动效果监控视图 by steffan
drop view if exists v_activity_monitor;
CREATE OR REPLACE VIEW "v_activity_monitor" AS
 SELECT p.id,
    p.activity_message_id,
    p.user_id AS player_id,
    p.user_name AS player_name,
    p.register_time,
    p.rank_id,
    p.rank_name,
    p.risk_marker,
    p.apply_time,
    p.check_user_id,
    p.check_time,
    p.check_state,
    p.reason_title,
    p.reason_content,
    pr.transaction_no,
    m.activity_type_code,
    m.start_time,
    m.end_time,
    m.create_time,
    m.user_id AS message_create_person_id,
    m.user_name AS message_create_person_name,
    m.is_display,
    p.player_recharge_id,
    p.ip_apply,
    p.ip_dict_code,
    p.remark,
    c.activity_name,
    c.activity_version,
    c.activity_terminal_type,
    pp.preferential_audit,
    pp.preferential_value,
    m.activity_classify_key,
    b.code,
    su.username,
    NULL::text AS script_check,
        CASE
            WHEN ((p.check_state)::text = '0'::text) THEN '1'::character varying
            WHEN ((p.check_state)::text = '1'::text) THEN '0'::character varying
            ELSE p.check_state
        END AS order_num
   FROM (((((activity_player_apply p
     LEFT JOIN activity_message m ON ((p.activity_message_id = m.id)))
     LEFT JOIN activity_player_preferential pp ON ((pp.activity_player_apply_id = p.id)))
     LEFT JOIN activity_message_i18n c ON ((c.activity_message_id = m.id)))
     LEFT JOIN activity_type b ON (((m.activity_type_code)::text = (b.code)::text)))
     LEFT JOIN sys_user su ON ((p.check_user_id = su.id))
     LEFT JOIN player_recharge pr ON ((pr.id = p.player_recharge_id))
);


COMMENT ON VIEW "v_activity_monitor" IS '活动效果监控视图 -- create by steffan';