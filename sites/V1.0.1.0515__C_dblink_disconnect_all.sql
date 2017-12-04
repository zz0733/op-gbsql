-- auto gen by cherry 2017-08-30 16:28:28
DROP FUNCTION IF EXISTS dblink_disconnect_all();
CREATE OR REPLACE FUNCTION dblink_disconnect_all()
RETURNS TEXT as $$

DECLARE
linkname TEXT;

BEGIN

  FOR linkname IN ( SELECT unnest(dblink_get_connections()) )
  LOOP
    RAISE NOTICE 'Disconnect DBLink : %', linkname;
    PERFORM dblink_disconnect(linkname);
  END LOOP;

  RETURN 'OK';

END;

$$ LANGUAGE plpgsql;
COMMENT ON FUNCTION dblink_disconnect_all()
IS 'Leisure-断开所有dblink连接';

DROP FUNCTION IF EXISTS redo_sqls(sqls text);
CREATE OR REPLACE FUNCTION redo_sqls(sqls text)
 RETURNS void
 LANGUAGE plpgsql
AS $function$
/*版本更新说明
--版本   时间        作者     内容
--v1.00  2015/01/01  Will     创建此函数
--v1.10  2016/05/12  Leisure  优化代码，修改查询条件限制为当前Schema
--v1.11  2017/08/16  Leisure  增加对rename各种对象的支持
*/
DECLARE
  arr TEXT[];
  tmp VARCHAR[];
  s TEXT;
  obj_name VARCHAR;
  sql_str VARCHAR;
  cnt INT := 0;

BEGIN
  SELECT regexp_split_to_array(sqls, ';') INTO arr;
  <<lbl1>>FOREACH s IN array arr
  LOOP
    s := replace(s,chr(13)||chr(10), '');
    s := trim(s, ' ');
    s := lower(s);
    s := replace(s, '"', '');
    sql_str := s;

    --raise info 'sql_str: %', sql_str;
    IF regexp_matches(sql_str, 'alter\s+table\s+\S+\s+add\s+column\s+\S+') IS NOT NULL THEN
      tmp := regexp_matches(sql_str, 'alter\s+table\s+(\S+)\s+add\s+column\s+(\S+)');
      obj_name := tmp[1];
      --IF position('public.' in obj_name) = 1 THEN
      --  obj_name := (regexp_matches(obj_name, 'public\.(\w+)'))[1];
      --END IF;
      --SELECT count(*) INTO cnt FROM information_schema.columns WHERE table_schema='public' AND table_name=obj_name AND column_name=tmp[2];
      SELECT count(*) INTO cnt
        FROM information_schema.columns
       WHERE table_name = obj_name
         AND column_name = tmp[2]
         AND table_schema = current_schema;

    ELSEIF regexp_matches(sql_str, 'create\s+sequence \S+') IS NOT NULL THEN
      obj_name := (regexp_matches(sql_str, 'create\s+sequence (\S+)'))[1];
      --IF position('public.' in obj_name) = 1 THEN
      --  obj_name := (regexp_matches(obj_name, 'public\.(\w+)'))[1];
      --END IF;
      --SELECT count(*) INTO cnt FROM pg_class WHERE relkind='S' AND relname=obj_name AND pg_table_is_visible(oid);
      SELECT count(*) INTO cnt
        FROM pg_class
       WHERE relkind = 'S'
         AND relname = obj_name
         AND pg_table_is_visible(oid);

    ELSEIF regexp_matches(sql_str, 'create(\s+\S+\s+|\s+)index\s+\S+\s+on\s+\S+') IS NOT NULL THEN
      obj_name := (regexp_matches(sql_str, 'create(\s+\S+\s+|\s+)index\s+(\S+)\s+on\s+\S+'))[2];
      --SELECT count(*) INTO cnt FROM pg_class c JOIN pg_namespace n ON n.oid = c.relnamespace WHERE c.relkind = 'i' AND c.relname = obj_name;
      SELECT count(*) INTO cnt
        FROM pg_class c
        JOIN pg_namespace n
          ON c.relnamespace = n.oid
       WHERE c.relkind = 'i'
         AND c.relname = obj_name
         AND n.nspname = current_schema;

    ELSEIF regexp_matches(sql_str, 'alter\s+table\s+\S+\s+add\s+constraint\s+\S+') IS NOT NULL THEN
      tmp := regexp_matches(sql_str, 'alter\s+table\s+(\S+)\s+add\s+constraint\s+(\S+)');
      obj_name := tmp[1];
      --IF position('public.' in obj_name) = 1 THEN
      --  obj_name := (regexp_matches(obj_name, 'public\.(\w+)'))[1];
      --END IF;
      --SELECT count(*) INTO cnt FROM information_schema.constraint_column_usage WHERE table_name = obj_name AND constraint_name = tmp[2];
      SELECT count(*) INTO cnt
        FROM information_schema.constraint_table_usage
       WHERE table_name = obj_name
         AND constraint_name = tmp[2]
         AND constraint_schema = current_schema;

    --v1.02  2017/08/16  Leisure
    ELSEIF regexp_matches(sql_str, 'alter\s+table\s+(if\s+exists\s+)?(\S+)\s+rename\s+to\s+(\S+)') IS NOT NULL THEN
      tmp := regexp_matches(sql_str, 'alter\s+table\s+(if\s+exists\s+)?(\S+)\s+rename\s+to\s+(\S+)');
      obj_name := tmp[1];
      --IF position('public.' in obj_name) = 1 THEN
      --  obj_name := (regexp_matches(obj_name, 'public\.(\w+)'))[1];
      --END IF;
      SELECT count(*) INTO cnt
        FROM information_schema.tables
       WHERE table_name = tmp[3]
         AND table_schema = current_schema;

    --v1.02  2017/08/16  Leisure
    ELSEIF regexp_matches(sql_str, 'alter\s+sequence\s+(if\s+exists\s+)?(\S+)\s+rename\s+to\s+(\S+)') IS NOT NULL THEN
      tmp := regexp_matches(sql_str, 'alter\s+sequence\s+(if\s+exists\s+)?(\S+)\s+rename\s+to\s+(\S+)');
      obj_name := tmp[1];
      --IF position('public.' in obj_name) = 1 THEN
      --  obj_name := (regexp_matches(obj_name, 'public\.(\w+)'))[1];
      --END IF;
      SELECT count(*) INTO cnt
        FROM information_schema.sequences
       WHERE sequence_name = tmp[3]
         AND sequence_schema = current_schema;

    --v1.02  2017/08/16  Leisure
    ELSEIF regexp_matches(sql_str, 'alter\s+index\s+(if\s+exists\s+)?(\S+)\s+rename\s+to\s+(\S+)') IS NOT NULL THEN
      tmp := regexp_matches(sql_str, 'alter\s+index\s+(if\s+exists\s+)?(\S+)\s+rename\s+to\s+(\S+)');
      obj_name := tmp[1];
      --SELECT count(*) INTO cnt FROM pg_class c JOIN pg_namespace n ON n.oid = c.relnamespace WHERE c.relkind = 'i' AND c.relname = obj_name;
      SELECT count(*) INTO cnt
        FROM pg_class c
        JOIN pg_namespace n
          ON c.relnamespace = n.oid
       WHERE c.relkind = 'i'
         AND c.relname = tmp[3]
         AND n.nspname = current_schema;

    --v1.02  2017/08/16  Leisure
    ELSEIF regexp_matches(sql_str, 'alter\s+table\s+\S+\s+rename\s+constraint\s+\S+\s+to\s+\S+') IS NOT NULL THEN
      tmp := regexp_matches(sql_str, 'alter\s+table\s+(\S+)\s+rename\s+constraint\s+(\S+)\s+to\s+(\S+)');
      obj_name := tmp[1];
      --IF position('public.' in obj_name) = 1 THEN
      --  obj_name := (regexp_matches(obj_name, 'public\.(\w+)'))[1];
      --END IF;
      SELECT count(*) INTO cnt
        FROM information_schema.constraint_table_usage
       WHERE table_name = obj_name
         AND constraint_name = tmp[3]
         AND constraint_schema = current_schema;

    --v1.02  2017/08/16  Leisure
    ELSEIF regexp_matches(sql_str, 'alter\s+table\s+\S+\s+rename\s+column\s+\S+\s+to\s+\S+') IS NOT NULL THEN
      tmp := regexp_matches(sql_str, 'alter\s+table\s+(\S+)\s+rename\s+column\s+(\S+)\s+to\s+(\S+)');
      obj_name := tmp[1];
      --IF position('public.' in obj_name) = 1 THEN
      --  obj_name := (regexp_matches(obj_name, 'public\.(\w+)'))[1];
      --END IF;
      SELECT count(*) INTO cnt
        FROM information_schema.columns
       WHERE table_name = obj_name
         AND column_name = tmp[3]
         AND table_schema = current_schema;

    END IF;

    IF cnt = 0 AND s <> '' THEN
      execute s;
    END IF;

  END LOOP lbl1;

END;
$function$
;
COMMENT ON FUNCTION redo_sqls(sqls text)
IS 'Will-重复执行脚本';


-- 推荐奖励计划任务
/**
 * 玩家推荐奖励存储函数
 * @author: Fly
 * @date: 2015-12-18
**/
DROP FUNCTION IF EXISTS f_player_recommend_award (VARCHAR, VARCHAR, VARCHAR, VARCHAR);
CREATE OR REPLACE FUNCTION f_player_recommend_award (
  siteCode VARCHAR,    -- 站点代码
  orderType VARCHAR,    -- 订单类型: 01-充值, 02-优惠, 03-游戏API, 04-返水, 05-返佣, 06-玩家取款, 07-代理提现, 08-转账
  start_time VARCHAR,
  end_time VARCHAR
) RETURNS INTEGER AS $BODY$
/*版本更新说明
  版本   时间        作者     内容
--v1.00  2015/01/01  Fei      创建此函数: 玩家推荐奖励存储函数
--v1.01  2016/06/15  Leisure  增加时间参数，解决时区问题
--v1.02  2016/07/04  Leisure  player_transaction新增记录，增加completion_time
--v1.03  2016/07/06  Leisure  修正推荐红利重复生成bug；
                              修正一个bug，begin_time改为start_time
--v1.04  2016/07/14  Leisure  修正推荐红利-优惠稽核倍数不对的问题
--v1.05  2016/07/14  Leisure  调整返回值，修改参数获取时机，从定义阶段获取，改成BEGIN后获取，方便排查错误

--订单类型: 01-充值, 02-优惠, 03-游戏API, 04-返水, 05-返佣, 06-玩家取款, 07-代理提现, 08-转账
*/

DECLARE
  rec record;

  singleReward BOOLEAN; -- 单次奖励
  rewardWay INTEGER; -- 奖励方式: 1-奖励双方,2-奖励推荐人,3-奖励被推荐人
  deposit NUMERIC; -- 单次奖励存款金额
  rewardAmount NUMERIC; -- 奖励金额

  rewardMultiple NUMERIC; -- 单次奖励优惠稽核倍数
  rewardPoint NUMERIC; -- 优惠稽核点

  br record;

  bonusReward BOOLEAN; -- 推荐红利
  effeTrade NUMERIC; -- 推荐红利有效玩家交易量
  toplimit NUMERIC; -- 红利上限

  bonusAmount NUMERIC:=0.0; -- 奖励金额

  bonusPoint NUMERIC:=0.0; -- 优惠稽核点
  bonusAudit NUMERIC; -- 优惠稽核

  orderNo   VARCHAR:='';
  transType   VARCHAR:='recommend';    -- 交易类型:推荐
  transStatus VARCHAR:='success';      -- 交易状态:待处理
  fundType   VARCHAR:='recommend';    -- 资金类型:推荐
  single     VARCHAR:='single_reward';   -- 单次奖励
  bonus     VARCHAR:='bonus_awards';  -- 推荐红利
  referee   VARCHAR:='2';        -- 推荐人
  referen   VARCHAR:='3';        -- 被推荐人
BEGIN

  -- 单次奖励
  singleReward := (SELECT active FROM sys_param WHERE param_type = 'recommended' AND param_code = 'reward');
  -- 奖励方式: 1-奖励双方,2-奖励推荐人,3-奖励被推荐人
  rewardWay := (SELECT CASE WHEN param_value = '' OR param_value IS NULL THEN '0' ELSE param_value END FROM sys_param WHERE param_type = 'recommended' AND param_code = 'reward');
  -- 单次奖励存款金额
  deposit := (SELECT CASE WHEN param_value = '' OR param_value IS NULL THEN '0.00' ELSE param_value END FROM sys_param WHERE param_type = 'recommended' AND param_code = 'reward.theWay');
  -- 奖励金额
  rewardAmount := (SELECT CASE WHEN param_value = '' OR param_value IS NULL THEN '0.00' ELSE param_value END FROM sys_param WHERE param_type = 'recommended' AND param_code = 'reward.money');
  -- 单次奖励优惠稽核倍数
  rewardMultiple := (SELECT CASE WHEN param_value = '' OR param_value IS NULL THEN '0.00' ELSE param_value END FROM sys_param WHERE param_type = 'recommended' AND param_code = 'audit');
  -- 优惠稽核点
  rewardPoint := (rewardAmount * rewardMultiple);

  -- 推荐红利
  bonusReward := (SELECT active FROM sys_param WHERE param_type = 'recommended' AND param_code = 'bonus');
  -- 推荐红利有效玩家交易量
  effeTrade := (SELECT CASE WHEN param_value = '' OR param_value IS NULL THEN '0.00' ELSE param_value END FROM sys_param WHERE param_type = 'recommended' AND param_code = 'bonus.trading');
  -- 红利上限
  toplimit := (SELECT CASE WHEN param_value = '' OR param_value IS NULL THEN '0.00' ELSE param_value END FROM sys_param WHERE param_type = 'recommended' AND param_code = 'bonus.bonusMax');
  -- 奖励金额
  bonusAmount :=0.0;

  -- 优惠稽核点
  bonusPoint :=0.0;
  --v1.04  2016/07/14  Leisure
  -- 优惠稽核
  bonusAudit := (SELECT CASE WHEN param_value = '' OR param_value IS NULL THEN '0.00' ELSE param_value END FROM sys_param WHERE param_type = 'recommended' AND param_code = 'bonus.audit');

  IF singleReward THEN  -- 单次奖励
    FOR rec IN
      SELECT * FROM (
        /* 去除已奖励的玩家**/
        SELECT up."id", up.recommend_user_id recommend_id, su.username recommend_name
          FROM user_player up
         INNER JOIN sys_user su ON up."recommend_user_id" = su."id"
         WHERE su.user_type = '24'
           AND up.recommend_user_id IS NOT NULL
           AND up."id" NOT IN (
             SELECT DISTINCT recommend_user_id FROM player_recommend_award
              WHERE reward_mode = 'single_reward'
               AND user_id IN (SELECT DISTINCT(recommend_user_id) FROM user_player WHERE recommend_user_id IS NOT NULL)
           )
      ) tr INNER JOIN (
        /* 被推荐人满足交易量**/
        SELECT su."id" berecommend_id, su.username berecommend_name, ep.trade_amount
          FROM (SELECT *
                FROM (SELECT player_id, SUM(transaction_money) trade_amount
                    FROM player_transaction
                   WHERE transaction_type = 'deposit'
                     AND status = 'success'
                   GROUP BY player_id) pt
               WHERE trade_amount >= deposit
             ) ep
          LEFT JOIN sys_user su ON ep.player_id = su."id"
         WHERE su.user_type = '24'
      ) ta ON tr."id" = ta.berecommend_id

      LOOP

        IF rewardWay = '1' THEN  -- 奖励双方
          orderNo := (SELECT f_order_no(siteCode, orderType));
          /** 奖励推荐人**/
          WITH award1 AS (
            -- 新增推荐记录数据
            INSERT INTO player_recommend_award (
              transaction_no, user_id, user_name, recommend_user_id, recommend_user_name, reward_mode, reward_amount, reward_time, reward_reason)
            VALUES (
              orderNo, rec.recommend_id, rec.recommend_name, rec.berecommend_id, rec.berecommend_name, single, rewardAmount, now(), '推荐')
            RETURNING id
          )
          -- 新增交易订单数据
          INSERT INTO player_transaction (
            transaction_no, create_time, transaction_type, remark, transaction_money, balance,
            status, player_id, source_id, favorable_audit_points, is_satisfy_audit, is_clear_audit,
            completion_time, fund_type, transaction_way, transaction_data)
          VALUES (
            orderNo, now(), transType, '推荐奖励-单次', rewardAmount, rewardAmount + (SELECT wallet_balance FROM user_player WHERE id = rec.recommend_id),
            transStatus,rec.recommend_id, (SELECT id FROM award1), rewardPoint, false, false,
            now(), fundType, single, '{"username":"'||rec.berecommend_name||'","rewardType":"'||referee||'"}');
          -- 修改玩家余额
          UPDATE user_player SET wallet_balance = wallet_balance + rewardAmount WHERE id = rec.recommend_id;

          /** 奖励被推荐人**/
          orderNo := (SELECT f_order_no(siteCode, orderType));
          WITH award2 AS (
            -- 新增推荐记录数据
            INSERT INTO player_recommend_award (
              transaction_no, user_id, user_name, recommend_user_id, recommend_user_name, reward_mode, reward_amount, reward_time, reward_reason)
            VALUES (
              orderNo, rec.recommend_id, rec.recommend_name, rec.berecommend_id, rec.berecommend_name, single, rewardAmount, now(), '被推荐')
            RETURNING id
          )
          -- 新增交易订单数据
          INSERT INTO player_transaction (
            transaction_no, create_time, transaction_type, remark, transaction_money, balance,
            status, player_id, source_id, favorable_audit_points, is_satisfy_audit, is_clear_audit,
            completion_time, fund_type, transaction_way, transaction_data)
          VALUES (
            orderNo, now(), transType, '推荐奖励-单次', rewardAmount, rewardAmount + (SELECT wallet_balance FROM user_player WHERE id = rec.berecommend_id),
            transStatus, rec.berecommend_id, (SELECT id FROM award2), rewardPoint, false, false,
            now(), fundType, single, '{"username":"'||rec.recommend_name||'","rewardType":"'||referen||'"}');
          -- 修改玩家余额
          UPDATE user_player SET wallet_balance = wallet_balance + rewardAmount WHERE id = rec.berecommend_id;

        ELSEIF rewardWay = '2' THEN   -- 奖励推荐人
          orderNo := (SELECT f_order_no(siteCode, orderType));
          WITH award AS (
            -- 新增推荐记录数据
            INSERT INTO player_recommend_award (
              transaction_no, user_id, user_name, recommend_user_id, recommend_user_name, reward_mode, reward_amount, reward_time, reward_reason)
            VALUES (
              orderNo, rec.recommend_id, rec.recommend_name, rec.berecommend_id, rec.berecommend_name, single, rewardAmount, now(), '推荐')
            RETURNING id
          )
          -- 新增交易订单数据
          INSERT INTO player_transaction (
            transaction_no, create_time, transaction_type, remark, transaction_money, balance,
            status, player_id, source_id, favorable_audit_points, is_satisfy_audit, is_clear_audit,
            completion_time, fund_type, transaction_way, transaction_data)
          VALUES (
            orderNo, now(), transType, '推荐奖励-单次', rewardAmount, rewardAmount + (SELECT wallet_balance FROM user_player WHERE id = rec.recommend_id),
            transStatus, rec.recommend_id, (SELECT id FROM award), rewardPoint, false, false,
            now(), fundType, single, '{"username":"'||rec.berecommend_name||'","rewardType":"'||referee||'"}');
          -- 修改玩家余额
          UPDATE user_player SET wallet_balance = wallet_balance + rewardAmount WHERE id = rec.recommend_id;

        ELSEIF rewardWay = '3' THEN  -- 奖励被推荐人
          orderNo := (SELECT f_order_no(siteCode, orderType));
          WITH award AS (
            -- 新增推荐记录数据
            INSERT INTO player_recommend_award (
              transaction_no, user_id, user_name, recommend_user_id, recommend_user_name, reward_mode, reward_amount, reward_time, reward_reason)
            VALUES (
              orderNo, rec.recommend_id, rec.recommend_name, rec.berecommend_id, rec.berecommend_name, single, rewardAmount, now(), '被推荐')
            RETURNING id
          )
          -- 新增交易订单数据
          INSERT INTO player_transaction (
            transaction_no, create_time, transaction_type, remark, transaction_money, balance, status,
            player_id, source_id, favorable_audit_points, is_satisfy_audit, is_clear_audit,
            completion_time, fund_type, transaction_way, transaction_data)
          VALUES (
            orderNo, now(), transType, '推荐奖励-单次', rewardAmount, rewardAmount + (SELECT wallet_balance FROM user_player WHERE id = rec.berecommend_id),
            transStatus, rec.berecommend_id, (SELECT id FROM award), rewardPoint, false, false,
            now(), fundType, single, '{"username":"'||rec.recommend_name||'","rewardType":"'||referen||'"}');
          -- 修改玩家余额
          UPDATE user_player SET wallet_balance = wallet_balance + rewardAmount WHERE id = rec.berecommend_id;

        END IF;

      END LOOP;

  END IF;

  IF bonusReward THEN   --推荐红利

    FOR rec IN
      SELECT up.recommend_user_id       recommend_id,
             su.username             recommend_name,
             COUNT(DISTINCT pgo.player_id)   recommend_total,
             SUM(pgo.effective_trade_amount)   trade_amount
        FROM user_player up
        LEFT JOIN sys_user su ON up.recommend_user_id = su."id"
        LEFT JOIN player_game_order pgo ON up."id" = pgo.player_id
       WHERE up.recommend_user_id IS NOT NULL
         AND NOT EXISTS (--v1.03  2016/07/06  Leisure add
           SELECT 1 FROM player_recommend_award pra
            WHERE pra.user_id = up.recommend_user_id
              AND pra.reward_mode = bonus
              AND pra.reward_time = end_time::TIMESTAMP
         )
         --v1.01  2016/06/15  Leisure
         --AND to_char(pgo.create_time, 'yyyy-MM-dd') = to_char((CURRENT_DATE - INTERVAL '1 day'), 'yyyy-MM-dd')
         --v1.03  2016/07/06  Leisure
         AND pgo.bet_time >= start_time::TIMESTAMP
         AND pgo.bet_time <  end_time::TIMESTAMP
         AND su.user_type = '24'
         AND pgo.is_profit_loss = TRUE
         AND pgo.order_state = 'settle'
       GROUP BY up.recommend_user_id, su.username

    LOOP

      -- 达到有效交易量
      IF rec.trade_amount >= effeTrade THEN

        FOR br IN
          SELECT playernum, proportion
            FROM json_to_recordset((SELECT lower(param_value) FROM sys_param WHERE param_type = 'recommended' AND param_code = 'bonus.json')::json)
            AS x(id INTEGER,playernum INTEGER,proportion FLOAT)
           ORDER BY playernum DESC

        LOOP

          -- 达到推荐人数
          IF rec.recommend_total >= br.playernum THEN

            bonusAmount := br.proportion / 100 * rec.trade_amount; -- 奖励金额
            IF bonusAmount > toplimit THEN -- 奖励金额高于红利上限取上限值
              bonusAmount := toplimit;
            END IF;

            -- 优惠稽核点 = (奖励稽核 x 优惠稽核倍数)
            bonusPoint := bonusAmount * bonusAudit; --v1.04  2016/07/14  Leisure

            orderNo := (SELECT f_order_no(siteCode, orderType));
            WITH award AS (
              -- 新增推荐记录数据
              INSERT INTO player_recommend_award (
                transaction_no, user_id, user_name, reward_mode, reward_amount, reward_time, reward_reason)
              VALUES (
                --v1.03  2016/07/06  Leisure
                --orderNo, rec.recommend_id, rec.recommend_name, bonus, bonusAmount, now(), '推荐')
                orderNo, rec.recommend_id, rec.recommend_name, bonus, bonusAmount, end_time::TIMESTAMP, '推荐')
              RETURNING id
            )
            -- 新增交易订单数据
            INSERT INTO player_transaction (
              transaction_no, create_time, transaction_type, remark, transaction_money, balance,
              status, player_id, source_id, favorable_audit_points, is_satisfy_audit, is_clear_audit,
              completion_time, fund_type, transaction_way, transaction_data)
            VALUES (
              orderNo, now(), transType, '推荐奖励-红利', bonusAmount, bonusAmount + (SELECT wallet_balance FROM user_player WHERE id = rec.recommend_id),
              transStatus, rec.recommend_id, (SELECT id FROM award), bonusPoint, false, false,
              now(), fundType, bonus, '{"username":"'||rec.recommend_name||'"}');
            -- 修改玩家余额
            UPDATE user_player SET wallet_balance = wallet_balance + bonusAmount WHERE id = rec.recommend_id;

            EXIT; -- 跳出循环

          END IF; -- end 达到推荐人数

        END LOOP;

      END IF; -- end 达到有效交易量

    END LOOP;

  END IF;

  --v1.05  2016/07/14  Leisure
  --RETURN 1;
  RETURN 0;
END;
$BODY$
LANGUAGE 'plpgsql';-- VOLATILE;

--ALTER FUNCTION f_player_recommend_award(siteCode VARCHAR, orderType VARCHAR) OWNER TO "postgres";
COMMENT ON FUNCTION f_player_recommend_award(siteCode VARCHAR, orderType VARCHAR, start_time VARCHAR, end_time VARCHAR) IS 'Fly - 玩家推荐奖励存储函数';
