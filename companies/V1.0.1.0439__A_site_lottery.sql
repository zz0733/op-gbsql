-- auto gen by marz 2017-10-09 19:34:29
select redo_sqls($$
    ALTER TABLE site_lottery ADD COLUMN genre int4 DEFAULT 3;
$$);

COMMENT ON COLUMN "site_lottery"."genre" IS '类型(1.全部2.官方玩法3.双面玩法)';