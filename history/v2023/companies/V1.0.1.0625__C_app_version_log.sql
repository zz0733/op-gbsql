

-- auto gen by steffan 2018-05-23 09:07:37   add by hanson
drop table if exists app_version_log;
drop sequence if exists app_version_log_id_seq;

--创建序列

--站点app升级表增加强制升级版本号
select redo_sqls($$
	ALTER TABLE site_app_update ADD COLUMN force_version int4;
$$);




CREATE TABLE if not exists "app_version_log" (
"id" serial,
"app_name" varchar(50) NOT NULL,
"app_type" varchar(50),
"version_name" varchar(50) NOT NULL,
"app_url" varchar(255)  NOT NULL,
"version_memo" varchar(500),
"create_time" timestamp(6),
"is_force" bool,
CONSTRAINT "app_version_log_pkey" PRIMARY KEY ("id")
)
WITH (OIDS=FALSE)
;

COMMENT ON TABLE "app_version_log" IS 'APP版本记录表';

COMMENT ON COLUMN "app_version_log"."id" IS '主键';

COMMENT ON COLUMN "app_version_log"."app_name" IS '应用名称';

COMMENT ON COLUMN "app_version_log"."app_type" IS '应用类别：ios, android';

COMMENT ON COLUMN "app_version_log"."version_name" IS '版本说明';

COMMENT ON COLUMN "app_version_log"."app_url" IS '下载地址';

COMMENT ON COLUMN "app_version_log"."version_memo" IS '更新描述';

COMMENT ON COLUMN "app_version_log"."create_time" IS '更新时间';

COMMENT ON COLUMN "app_version_log"."is_force" IS '是否强制升级';

