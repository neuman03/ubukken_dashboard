WITH
  --会員ごと掲載プランの抽出
  com AS (
  SELECT
    member_id,
    CAST( SUBSTR(CAST(commodity_code AS string),1,LENGTH(CAST(commodity_code AS string))-4) AS int64) AS comCD,
    DATE_TRUNC(CAST(start_date AS date),month) AS start_ym,
    DATE_TRUNC(CAST(end_date AS date),month) AS end_ym,
    count,
    status
  FROM
    `datadriven-prod.s_ora_zhum.commodity`
  WHERE
    CAST(SUBSTR(CAST(commodity_code AS string),1,LENGTH(CAST(commodity_code AS string))-4) AS int64) IN (110301,
      110305,
      110434,
      10302,
      110304,
      509100,
      100001,
      100011,
      100017,
      100200,
      100210,
      100220,
      100230,
      100235,
      100240,
      100245,
      100250,
      100260,
      100270,
      100290,
      100111,
      100112,
      100104,
      100101,
      100167,
      100310,
      100320,
      100330,
      100335,
      100340,
      100345,
      100350,
      100360,
      100370,
      100390,
      100102,
      100103,
      106139)
    AND member_id < 7000000),
  k AS(
  SELECT
    homes_id AS member_id,
    company_name,
    prefecture_code,
    city_code,
    prefecture_name,
    city_name,
    phone,
    license_number,
    business_holiday,
    account_rep,
    rent_kokai_avg,
    unit,
    DATE_TRUNC(CAST(partition_month AS date),month) AS ym
  FROM
    `datadriven-prod.clients.clients_list`
  WHERE
    homes_id < 7000000
    AND partition_month >= '2015-01-01'
    AND homes_id IS NOT NULL),
  mm AS (
  SELECT
    k.member_id,
    ym,
    CASE
      WHEN comCD = 110301 AND start_ym <=ym AND end_ym >= ym THEN '賃貸反響課金'
      WHEN comCD = 110305
    AND start_ym <=ym
    AND end_ym >= ym THEN '賃貸掲載課金'
      WHEN comCD = 110434 AND start_ym <=ym AND end_ym >= ym THEN '賃貸掲載課金'
      WHEN comCD = 509100
    AND start_ym <=ym
    AND end_ym >= ym THEN '業務支援プラン'
      WHEN comCD = 100001 AND start_ym <=ym AND end_ym >= ym THEN '賃貸反響課金'
      WHEN comCD = 100210
    AND start_ym <=ym
    AND end_ym >= ym THEN '賃貸掲載課金'
      WHEN comCD = 100220 AND start_ym <=ym AND end_ym >= ym THEN '賃貸掲載課金'
      WHEN comCD = 100230
    AND start_ym <=ym
    AND end_ym >= ym THEN '賃貸掲載課金'
      WHEN comCD = 100235 AND start_ym <=ym AND end_ym >= ym THEN '賃貸掲載課金'
      WHEN comCD = 100240
    AND start_ym <=ym
    AND end_ym >= ym THEN '賃貸掲載課金'
      WHEN comCD = 100245 AND start_ym <=ym AND end_ym >= ym THEN '賃貸掲載課金'
      WHEN comCD = 100250
    AND start_ym <=ym
    AND end_ym >= ym THEN '賃貸掲載課金'
      WHEN comCD = 100260 AND start_ym <=ym AND end_ym >= ym THEN '賃貸掲載課金'
      WHEN comCD = 100270
    AND start_ym <=ym
    AND end_ym >= ym THEN '賃貸掲載課金'
      WHEN comCD = 100290 AND start_ym <=ym AND end_ym >= ym THEN '賃貸掲載課金'
      WHEN comCD = 100111
    AND start_ym <=ym
    AND end_ym >= ym THEN '賃貸掲載課金'
      WHEN comCD = 100112 AND start_ym <=ym AND end_ym >= ym THEN '賃貸掲載課金'
      WHEN comCD = 100104
    AND start_ym <=ym
    AND end_ym >= ym THEN '賃貸掲載課金'
      WHEN comCD = 100101 AND start_ym <=ym AND end_ym >= ym THEN '賃貸掲載課金'
      WHEN comCD = 100167
    AND start_ym <=ym
    AND end_ym >= ym THEN '賃貸掲載課金'
    ELSE
    NULL
  END
    AS pattern_c,
    CASE
      WHEN comCD = 110302 AND start_ym <=ym AND end_ym >= ym THEN '売買反響課金'
      WHEN comCD = 110304
    AND start_ym <=ym
    AND end_ym >= ym THEN '売買掲載課金'
      WHEN comCD = 100001 AND start_ym <=ym AND end_ym >= ym THEN '売買反響課金'
      WHEN comCD = 100310
    AND start_ym <=ym
    AND end_ym >= ym THEN '売買掲載課金'
      WHEN comCD = 100320 AND start_ym <=ym AND end_ym >= ym THEN '売買掲載課金'
      WHEN comCD = 100330
    AND start_ym <=ym
    AND end_ym >= ym THEN '売買掲載課金'
      WHEN comCD = 100335 AND start_ym <=ym AND end_ym >= ym THEN '売買掲載課金'
      WHEN comCD = 100340
    AND start_ym <=ym
    AND end_ym >= ym THEN '売買掲載課金'
      WHEN comCD = 100345 AND start_ym <=ym AND end_ym >= ym THEN '売買掲載課金'
      WHEN comCD = 100350
    AND start_ym <=ym
    AND end_ym >= ym THEN '売買掲載課金'
      WHEN comCD = 100360 AND start_ym <=ym AND end_ym >= ym THEN '売買掲載課金'
      WHEN comCD = 100370
    AND start_ym <=ym
    AND end_ym >= ym THEN '売買掲載課金'
      WHEN comCD = 100390 AND start_ym <=ym AND end_ym >= ym THEN '売買掲載課金'
      WHEN comCD = 100102
    AND start_ym <=ym
    AND end_ym >= ym THEN '売買掲載課金'
      WHEN comCD = 100103 AND start_ym <=ym AND end_ym >= ym THEN '売買掲載課金'
      WHEN comCD = 106139
    AND start_ym <=ym
    AND end_ym >= ym THEN '売買掲載課金'
    ELSE
    NULL
  END
    AS pattern_s,
    count,
    company_name,
    prefecture_code,
    city_code,
    prefecture_name,
    city_name,
    phone,
    license_number,
    business_holiday,
    account_rep,
    unit
  FROM
    k
  INNER JOIN
    com
  ON
    k.member_id = com.member_id
  ORDER BY
    member_id,
    ym),
  mm_c1 AS (
  SELECT
    member_id,
    ym,
    COUNT(1) AS pattern_c1
  FROM
    mm
  WHERE
    pattern_c = '賃貸反響課金'
  GROUP BY
    member_id,
    ym),
  mm_c2 AS (
  SELECT
    member_id,
    ym,
    COUNT(1) AS pattern_c2,
    SUM(count) AS count_c
  FROM
    mm
  WHERE
    pattern_c = '賃貸掲載課金'
  GROUP BY
    member_id,
    ym),
  mm_c3 AS (
  SELECT
    member_id,
    ym,
    COUNT(1) AS pattern_c3
  FROM
    mm
  WHERE
    pattern_c = '業務支援プラン'
  GROUP BY
    member_id,
    ym),
  mm_s1 AS (
  SELECT
    member_id,
    ym,
    COUNT(1) AS pattern_s1
  FROM
    mm
  WHERE
    pattern_s = '売買反響課金'
  GROUP BY
    member_id,
    ym),
  mm_s2 AS (
  SELECT
    member_id,
    ym,
    COUNT(1) AS pattern_s2,
    SUM(count) AS count_s
  FROM
    mm
  WHERE
    pattern_s = '売買掲載課金'
  GROUP BY
    member_id,
    ym),
  --ID単位でLH本体・提携媒体の総反響数を抽出
  inq AS (
  SELECT
    member_id,
    DATE_TRUNC(inquire_date,month) AS ym,
    SUM(CASE
        WHEN market_name = '賃貸' THEN countable_number
      ELSE
      0
    END
      ) AS inquire_count_chintai,
    SUM(CASE
        WHEN market_name = '賃貸' AND oem_id_for_join IN (0, 48, 10025, 10031, 10036, 10030, 10029, 10010, 10032, 10027, 10013, 10038, 10039, 601, 602) THEN countable_number
      ELSE
      0
    END
      ) AS inquire_count_chintai_hontai,
    SUM(CASE
        WHEN market_name = '賃貸' AND oem_id_for_join = 302 THEN countable_number
      ELSE
      0
    END
      ) AS inquire_count_chintai_smocca,
    SUM(CASE
        WHEN market_name = '賃貸' AND oem_id_for_join IN (293, 287, 279, 278, 147, 158, 194, 268, 275, 105, 144, 267, 230, 297, 298, 309, 312, 294, 299) THEN countable_number
      ELSE
      0
    END
      ) AS inquire_count_chintai_otherteikei,
    SUM(CASE
        WHEN market_name = '流通' THEN countable_number
      ELSE
      0
    END
      ) AS inquire_count_ryutsu
  FROM
    `datadriven-prod.kpi_report.inquiries_all`
  WHERE
    inquire_date >= '2015-01-01'
  GROUP BY
    member_id,
    ym ),
  --horitabからIDごと代表数を抽出　※b_com：事業用物件。名寄せされない必ず代表　b_res：居住用賃貸
  --注意点…kykey情報は月末時点のものしか残っていないため、月末時点の代表状況
  b_com AS (
  SELECT
    member_id,
    CAST(ym AS date) AS ym,
    COUNT(1) AS bukken_count_com,
    COUNT(1) AS daihyo_bukken_count_com,
    COUNT(1) AS tandoku_bukken_count_com
  FROM
    `datadriven-prod.horitab.v_fact_bukken_rent_com`
  WHERE
    ym >= "2015-01-01"
    AND representative IS NOT NULL
  GROUP BY
    member_id,
    ym),
  b_res AS (
  SELECT
    member_id,
    CAST(ym AS date) AS ym,
    COUNT(1) AS bukken_count_res,
    SUM(CASE representative
        WHEN '代表' THEN 1
        WHEN '名寄りなし' THEN 1
    END
      ) AS daihyo_bukken_count_res,
    SUM(CASE
        WHEN representative = '名寄りなし' THEN 1
      ELSE
      0
    END
      ) AS tandoku_bukken_count_res
  FROM
    `datadriven-prod.horitab.v_fact_bukken_rent_res`
  WHERE
    ym >= "2015-01-01"
    AND representative IS NOT NULL
  GROUP BY
    member_id,
    ym),
  --上記ジョイン
  mmm AS (
  SELECT
    k.member_id,
    k.ym,
    pattern_c1,
    pattern_c2,
    pattern_c3,
    pattern_s1,
    pattern_s2,
    company_name,
    prefecture_code,
    city_code,
    prefecture_name,
    city_name,
    phone,
    license_number,
    business_holiday,
    account_rep,
    unit,
    inquire_count_chintai,
    inquire_count_ryutsu,
    bukken_count_com,
    bukken_count_res,
    daihyo_bukken_count_com,
    tandoku_bukken_count_com,
    daihyo_bukken_count_res,
    tandoku_bukken_count_res,
    rent_kokai_avg,
    inquire_count_chintai_hontai,
    inquire_count_chintai_smocca,
    inquire_count_chintai_otherteikei
  FROM
    k
  LEFT OUTER JOIN
    mm_c1
  ON
    k.member_id = mm_c1.member_id
    AND k.ym = mm_c1.ym
  LEFT OUTER JOIN
    mm_c2
  ON
    k.member_id = mm_c2.member_id
    AND k.ym = mm_c2.ym
  LEFT OUTER JOIN
    mm_c3
  ON
    k.member_id = mm_c3.member_id
    AND k.ym = mm_c3.ym
  LEFT OUTER JOIN
    mm_s1
  ON
    k.member_id = mm_s1.member_id
    AND k.ym = mm_s1.ym
  LEFT OUTER JOIN
    mm_s2
  ON
    k.member_id = mm_s2.member_id
    AND k.ym = mm_s2.ym
  LEFT OUTER JOIN
    inq
  ON
    k.member_id = inq.member_id
    AND k.ym = inq.ym
  LEFT OUTER JOIN
    b_com
  ON
    k.member_id = b_com.member_id
    AND k.ym = b_com.ym
  LEFT OUTER JOIN
    b_res
  ON
    k.member_id = b_res.member_id
    AND k.ym = b_res.ym ),
  yoshimura AS (
  SELECT
    member_id,
    ym,
    CASE
      WHEN pattern_c1 > 0 AND pattern_c2 IS NULL AND pattern_c3 IS NULL THEN '反響課金'
      WHEN pattern_c2 > 0 THEN '掲載課金'
      WHEN pattern_c3 > 0 THEN '業務支援プラン'
      WHEN pattern_c1 IS NULL
    AND pattern_c2 IS NULL
    AND pattern_c3 IS NULL
    AND pattern_s1 IS NULL
    AND pattern_s2 IS NULL THEN '非掲載プラン'
    ELSE
    '-'
  END
    AS plan_c,
    CASE
      WHEN pattern_s1 > 0 AND pattern_s2 IS NULL THEN '反響課金'
      WHEN pattern_s2 > 0 THEN '掲載課金'
      WHEN pattern_c1 IS NULL AND pattern_c2 IS NULL AND pattern_c3 IS NULL AND pattern_s1 IS NULL AND pattern_s2 IS NULL THEN '非掲載プラン'
    ELSE
    '-'
  END
    AS plan_s,
    company_name,
    prefecture_code,
    city_code,
    prefecture_name,
    city_name,
    phone,
    license_number,
    business_holiday,
    account_rep,
    unit,
    inquire_count_chintai,
    inquire_count_ryutsu,
    bukken_count_com,
    bukken_count_res,
    daihyo_bukken_count_res,
    tandoku_bukken_count_res,
    rent_kokai_avg,
    daihyo_bukken_count_com,
    tandoku_bukken_count_com,
    inquire_count_chintai_hontai,
    inquire_count_chintai_smocca,
    inquire_count_chintai_otherteikei
  FROM
    mmm
  ORDER BY
    member_id,
    ym)
SELECT
  *
FROM
  yoshimura
WHERE
  ym>="2019-10-01"
