-- Fabric notebook source

-- METADATA ********************

-- META {
-- META   "kernel_info": {
-- META     "name": "sqldatawarehouse"
-- META   },
-- META   "dependencies": {
-- META     "warehouse": {
-- META       "default_warehouse": "b9e4f7ae-a6a9-8dcd-4856-d0aa8df7e81a",
-- META       "known_warehouses": [
-- META         {
-- META           "id": "b9e4f7ae-a6a9-8dcd-4856-d0aa8df7e81a",
-- META           "type": "Datawarehouse"
-- META         }
-- META       ]
-- META     }
-- META   }
-- META }

-- CELL ********************

DROP TABLE IF EXISTS dbo.call_center;
DROP TABLE IF EXISTS dbo.catalog_page;
DROP TABLE IF EXISTS dbo.catalog_returns;
DROP TABLE IF EXISTS dbo.catalog_sales;
DROP TABLE IF EXISTS dbo.customer;
DROP TABLE IF EXISTS dbo.customer_address;
DROP TABLE IF EXISTS dbo.customer_demographics;
DROP TABLE IF EXISTS dbo.date_dim;
DROP TABLE IF EXISTS dbo.household_demographics;
DROP TABLE IF EXISTS dbo.income_band;
DROP TABLE IF EXISTS dbo.inventory;
DROP TABLE IF EXISTS dbo.item;
DROP TABLE IF EXISTS dbo.promotion;
DROP TABLE IF EXISTS dbo.reason;
DROP TABLE IF EXISTS dbo.ship_mode;
DROP TABLE IF EXISTS dbo.store;
DROP TABLE IF EXISTS dbo.store_returns;
DROP TABLE IF EXISTS dbo.store_sales;
DROP TABLE IF EXISTS dbo.time_dim;
DROP TABLE IF EXISTS dbo.warehouse;
DROP TABLE IF EXISTS dbo.web_page;
DROP TABLE IF EXISTS dbo.web_returns;
DROP TABLE IF EXISTS dbo.web_sales;
DROP TABLE IF EXISTS dbo.web_site;


CREATE TABLE dbo.call_center
    (
        cc_call_center_sk  INT            NOT NULL,
        cc_call_center_id  CHAR(16)       NOT NULL,
        cc_rec_start_date  DATE           NULL,
        cc_rec_end_date    DATE           NULL,
        cc_closed_date_sk  INT            NULL,
        cc_open_date_sk    INT            NULL,
        cc_name            VARCHAR(50)    NULL,
        cc_class           VARCHAR(50)    NULL,
        cc_employees       INT            NULL,
        cc_sq_ft           INT            NULL,
        cc_hours           CHAR(20)       NULL,
        cc_manager         VARCHAR(40)    NULL,
        cc_mkt_id          INT            NULL,
        cc_mkt_class       CHAR(50)       NULL,
        cc_mkt_desc        VARCHAR(100)   NULL,
        cc_market_manager  VARCHAR(40)    NULL,
        cc_division        INT            NULL,
        cc_division_name   VARCHAR(50)    NULL,
        cc_company         INT            NULL,
        cc_company_name    CHAR(50)       NULL,
        cc_street_number   CHAR(10)       NULL,
        cc_street_name     VARCHAR(60)    NULL,
        cc_street_type     CHAR(15)       NULL,
        cc_suite_number    CHAR(10)       NULL,
        cc_city            VARCHAR(60)    NULL,
        cc_county          VARCHAR(30)    NULL,
        cc_state           CHAR(2)        NULL,
        cc_zip             CHAR(10)       NULL,
        cc_country         VARCHAR(20)    NULL,
        cc_gmt_offset      DECIMAL(5, 2)  NULL,
        cc_tax_percentage  DECIMAL(5, 2)  NULL
    );

CREATE TABLE dbo.catalog_page
    (
        cp_catalog_page_sk      INT           NOT NULL,
        cp_catalog_page_id      CHAR(16)      NOT NULL,
        cp_start_date_sk        INT           NULL,
        cp_end_date_sk          INT           NULL,
        cp_department           VARCHAR(50)   NULL,
        cp_catalog_number       INT           NULL,
        cp_catalog_page_number  INT           NULL,
        cp_description          VARCHAR(100)  NULL,
        cp_type                 VARCHAR(100)  NULL
    );

CREATE TABLE dbo.catalog_returns
    (
        cr_returned_date_sk       INT            NULL,
        cr_returned_time_sk       INT            NULL,
        cr_item_sk                INT            NOT NULL,
        cr_refunded_customer_sk   INT            NULL,
        cr_refunded_cdemo_sk      INT            NULL,
        cr_refunded_hdemo_sk      INT            NULL,
        cr_refunded_addr_sk       INT            NULL,
        cr_returning_customer_sk  INT            NULL,
        cr_returning_cdemo_sk     INT            NULL,
        cr_returning_hdemo_sk     INT            NULL,
        cr_returning_addr_sk      INT            NULL,
        cr_call_center_sk         INT            NULL,
        cr_catalog_page_sk        INT            NULL,
        cr_ship_mode_sk           INT            NULL,
        cr_warehouse_sk           INT            NULL,
        cr_reason_sk              INT            NULL,
        cr_order_number           BIGINT         NOT NULL,
        cr_return_quantity        INT            NULL,
        cr_return_amount          DECIMAL(7, 2)  NULL,
        cr_return_tax             DECIMAL(7, 2)  NULL,
        cr_return_amt_inc_tax     DECIMAL(7, 2)  NULL,
        cr_fee                    DECIMAL(7, 2)  NULL,
        cr_return_ship_cost       DECIMAL(7, 2)  NULL,
        cr_refunded_cash          DECIMAL(7, 2)  NULL,
        cr_reversed_charge        DECIMAL(7, 2)  NULL,
        cr_store_credit           DECIMAL(7, 2)  NULL,
        cr_net_loss               DECIMAL(7, 2)  NULL
    );

CREATE TABLE dbo.catalog_sales
    (
        cs_sold_date_sk           INT            NULL,
        cs_sold_time_sk           INT            NULL,
        cs_ship_date_sk           INT            NULL,
        cs_bill_customer_sk       INT            NULL,
        cs_bill_cdemo_sk          INT            NULL,
        cs_bill_hdemo_sk          INT            NULL,
        cs_bill_addr_sk           INT            NULL,
        cs_ship_customer_sk       INT            NULL,
        cs_ship_cdemo_sk          INT            NULL,
        cs_ship_hdemo_sk          INT            NULL,
        cs_ship_addr_sk           INT            NULL,
        cs_call_center_sk         INT            NULL,
        cs_catalog_page_sk        INT            NULL,
        cs_ship_mode_sk           INT            NULL,
        cs_warehouse_sk           INT            NULL,
        cs_item_sk                INT            NOT NULL,
        cs_promo_sk               INT            NULL,
        cs_order_number           BIGINT         NOT NULL,
        cs_quantity               INT            NULL,
        cs_wholesale_cost         DECIMAL(7, 2)  NULL,
        cs_list_price             DECIMAL(7, 2)  NULL,
        cs_sales_price            DECIMAL(7, 2)  NULL,
        cs_ext_discount_amt       DECIMAL(7, 2)  NULL,
        cs_ext_sales_price        DECIMAL(7, 2)  NULL,
        cs_ext_wholesale_cost     DECIMAL(7, 2)  NULL,
        cs_ext_list_price         DECIMAL(7, 2)  NULL,
        cs_ext_tax                DECIMAL(7, 2)  NULL,
        cs_coupon_amt             DECIMAL(7, 2)  NULL,
        cs_ext_ship_cost          DECIMAL(7, 2)  NULL,
        cs_net_paid               DECIMAL(7, 2)  NULL,
        cs_net_paid_inc_tax       DECIMAL(7, 2)  NULL,
        cs_net_paid_inc_ship      DECIMAL(7, 2)  NULL,
        cs_net_paid_inc_ship_tax  DECIMAL(7, 2)  NULL,
        cs_net_profit             DECIMAL(7, 2)  NULL
    );

CREATE TABLE dbo.customer
    (
        c_customer_sk           INT          NOT NULL,
        c_customer_id           CHAR(16)     NOT NULL,
        c_current_cdemo_sk      INT          NULL,
        c_current_hdemo_sk      INT          NULL,
        c_current_addr_sk       INT          NULL,
        c_first_shipto_date_sk  INT          NULL,
        c_first_sales_date_sk   INT          NULL,
        c_salutation            CHAR(10)     NULL,
        c_first_name            CHAR(20)     NULL,
        c_last_name             CHAR(30)     NULL,
        c_preferred_cust_flag   CHAR(1)      NULL,
        c_birth_day             INT          NULL,
        c_birth_month           INT          NULL,
        c_birth_year            INT          NULL,
        c_birth_country         VARCHAR(20)  NULL,
        c_login                 CHAR(13)     NULL,
        c_email_address         CHAR(50)     NULL,
        c_last_review_date_sk   INT          NULL
    );

CREATE TABLE dbo.customer_address
    (
        ca_address_sk     INT            NOT NULL,
        ca_address_id     CHAR(16)       NOT NULL,
        ca_street_number  CHAR(10)       NULL,
        ca_street_name    VARCHAR(60)    NULL,
        ca_street_type    CHAR(15)       NULL,
        ca_suite_number   CHAR(10)       NULL,
        ca_city           VARCHAR(60)    NULL,
        ca_county         VARCHAR(30)    NULL,
        ca_state          CHAR(2)        NULL,
        ca_zip            CHAR(10)       NULL,
        ca_country        VARCHAR(20)    NULL,
        ca_gmt_offset     DECIMAL(5, 2)  NULL,
        ca_location_type  CHAR(20)       NULL
    );

CREATE TABLE dbo.customer_demographics
    (
        cd_demo_sk             INT       NOT NULL,
        cd_gender              CHAR(1)   NULL,
        cd_marital_status      CHAR(1)   NULL,
        cd_education_status    CHAR(20)  NULL,
        cd_purchase_estimate   INT       NULL,
        cd_credit_rating       CHAR(10)  NULL,
        cd_dep_count           INT       NULL,
        cd_dep_employed_count  INT       NULL,
        cd_dep_college_count   INT       NULL
    );

CREATE TABLE dbo.date_dim
    (
        d_date_sk            INT       NOT NULL,
        d_date_id            CHAR(16)  NOT NULL,
        d_date               DATE      NOT NULL,
        d_month_seq          INT       NULL,
        d_week_seq           INT       NULL,
        d_quarter_seq        INT       NULL,
        d_year               INT       NULL,
        d_dow                INT       NULL,
        d_moy                INT       NULL,
        d_dom                INT       NULL,
        d_qoy                INT       NULL,
        d_fy_year            INT       NULL,
        d_fy_quarter_seq     INT       NULL,
        d_fy_week_seq        INT       NULL,
        d_day_name           CHAR(9)   NULL,
        d_quarter_name       CHAR(6)   NULL,
        d_holiday            CHAR(1)   NULL,
        d_weekend            CHAR(1)   NULL,
        d_following_holiday  CHAR(1)   NULL,
        d_first_dom          INT       NULL,
        d_last_dom           INT       NULL,
        d_same_day_ly        INT       NULL,
        d_same_day_lq        INT       NULL,
        d_current_day        CHAR(1)   NULL,
        d_current_week       CHAR(1)   NULL,
        d_current_month      CHAR(1)   NULL,
        d_current_quarter    CHAR(1)   NULL,
        d_current_year       CHAR(1)   NULL
    );

CREATE TABLE dbo.household_demographics
    (
        hd_demo_sk         INT       NOT NULL,
        hd_income_band_sk  INT       NULL,
        hd_buy_potential   CHAR(15)  NULL,
        hd_dep_count       INT       NULL,
        hd_vehicle_count   INT       NULL
    );

CREATE TABLE dbo.income_band
    (
        ib_income_band_sk  INT  NOT NULL,
        ib_lower_bound     INT  NULL,
        ib_upper_bound     INT  NULL
    );

CREATE TABLE dbo.inventory
    (
        inv_date_sk           INT  NOT NULL,
        inv_item_sk           INT  NOT NULL,
        inv_warehouse_sk      INT  NOT NULL,
        inv_quantity_on_hand  INT  NULL
    );

CREATE TABLE dbo.item
    (
        i_item_sk         INT            NOT NULL,
        i_item_id         CHAR(16)       NOT NULL,
        i_rec_start_date  DATE           NULL,
        i_rec_end_date    DATE           NULL,
        i_item_desc       VARCHAR(200)   NULL,
        i_current_price   DECIMAL(7, 2)  NULL,
        i_wholesale_cost  DECIMAL(7, 2)  NULL,
        i_brand_id        INT            NULL,
        i_brand           CHAR(50)       NULL,
        i_class_id        INT            NULL,
        i_class           CHAR(50)       NULL,
        i_category_id     INT            NULL,
        i_category        CHAR(50)       NULL,
        i_manufact_id     INT            NULL,
        i_manufact        CHAR(50)       NULL,
        i_size            CHAR(20)       NULL,
        i_formulation     CHAR(20)       NULL,
        i_color           CHAR(20)       NULL,
        i_units           CHAR(10)       NULL,
        i_container       CHAR(10)       NULL,
        i_manager_id      INT            NULL,
        i_product_name    CHAR(50)       NULL
    );

CREATE TABLE dbo.promotion
    (
        p_promo_sk         INT             NOT NULL,
        p_promo_id         CHAR(16)        NOT NULL,
        p_start_date_sk    INT             NULL,
        p_end_date_sk      INT             NULL,
        p_item_sk          INT             NULL,
        p_cost             DECIMAL(15, 2)  NULL,
        p_response_target  INT             NULL,
        p_promo_name       CHAR(50)        NULL,
        p_channel_dmail    CHAR(1)         NULL,
        p_channel_email    CHAR(1)         NULL,
        p_channel_catalog  CHAR(1)         NULL,
        p_channel_tv       CHAR(1)         NULL,
        p_channel_radio    CHAR(1)         NULL,
        p_channel_press    CHAR(1)         NULL,
        p_channel_event    CHAR(1)         NULL,
        p_channel_demo     CHAR(1)         NULL,
        p_channel_details  VARCHAR(100)    NULL,
        p_purpose          CHAR(15)        NULL,
        p_discount_active  CHAR(1)         NULL
    );

CREATE TABLE dbo.reason
    (
        r_reason_sk    INT        NOT NULL,
        r_reason_id    CHAR(16)   NOT NULL,
        r_reason_desc  CHAR(100)  NULL
    );

CREATE TABLE dbo.ship_mode
    (
        sm_ship_mode_sk  INT       NOT NULL,
        sm_ship_mode_id  CHAR(16)  NOT NULL,
        sm_type          CHAR(30)  NULL,
        sm_code          CHAR(10)  NULL,
        sm_carrier       CHAR(20)  NULL,
        sm_contract      CHAR(20)  NULL
    );

CREATE TABLE dbo.store
    (
        s_store_sk          INT            NOT NULL,
        s_store_id          CHAR(16)       NOT NULL,
        s_rec_start_date    DATE           NULL,
        s_rec_end_date      DATE           NULL,
        s_closed_date_sk    INT            NULL,
        s_store_name        VARCHAR(50)    NULL,
        s_number_employees  INT            NULL,
        s_floor_space       INT            NULL,
        s_hours             CHAR(20)       NULL,
        s_manager           VARCHAR(40)    NULL,
        s_market_id         INT            NULL,
        s_geography_class   VARCHAR(100)   NULL,
        s_market_desc       VARCHAR(100)   NULL,
        s_market_manager    VARCHAR(40)    NULL,
        s_division_id       INT            NULL,
        s_division_name     VARCHAR(50)    NULL,
        s_company_id        INT            NULL,
        s_company_name      VARCHAR(50)    NULL,
        s_street_number     VARCHAR(10)    NULL,
        s_street_name       VARCHAR(60)    NULL,
        s_street_type       CHAR(15)       NULL,
        s_suite_number      CHAR(10)       NULL,
        s_city              VARCHAR(60)    NULL,
        s_county            VARCHAR(30)    NULL,
        s_state             CHAR(2)        NULL,
        s_zip               CHAR(10)       NULL,
        s_country           VARCHAR(20)    NULL,
        s_gmt_offset        DECIMAL(5, 2)  NULL,
        s_tax_percentage    DECIMAL(5, 2)  NULL
    );

CREATE TABLE dbo.store_returns
    (
        sr_returned_date_sk    INT            NULL,
        sr_return_time_sk      INT            NULL,
        sr_item_sk             INT            NOT NULL,
        sr_customer_sk         INT            NULL,
        sr_cdemo_sk            INT            NULL,
        sr_hdemo_sk            INT            NULL,
        sr_addr_sk             INT            NULL,
        sr_store_sk            INT            NULL,
        sr_reason_sk           INT            NULL,
        sr_ticket_number       BIGINT         NOT NULL,
        sr_return_quantity     INT            NULL,
        sr_return_amt          DECIMAL(7, 2)  NULL,
        sr_return_tax          DECIMAL(7, 2)  NULL,
        sr_return_amt_inc_tax  DECIMAL(7, 2)  NULL,
        sr_fee                 DECIMAL(7, 2)  NULL,
        sr_return_ship_cost    DECIMAL(7, 2)  NULL,
        sr_refunded_cash       DECIMAL(7, 2)  NULL,
        sr_reversed_charge     DECIMAL(7, 2)  NULL,
        sr_store_credit        DECIMAL(7, 2)  NULL,
        sr_net_loss            DECIMAL(7, 2)  NULL
    );

CREATE TABLE dbo.store_sales
    (
        ss_sold_date_sk        INT            NULL,
        ss_sold_time_sk        INT            NULL,
        ss_item_sk             INT            NOT NULL,
        ss_customer_sk         INT            NULL,
        ss_cdemo_sk            INT            NULL,
        ss_hdemo_sk            INT            NULL,
        ss_addr_sk             INT            NULL,
        ss_store_sk            INT            NULL,
        ss_promo_sk            INT            NULL,
        ss_ticket_number       BIGINT         NOT NULL,
        ss_quantity            INT            NULL,
        ss_wholesale_cost      DECIMAL(7, 2)  NULL,
        ss_list_price          DECIMAL(7, 2)  NULL,
        ss_sales_price         DECIMAL(7, 2)  NULL,
        ss_ext_discount_amt    DECIMAL(7, 2)  NULL,
        ss_ext_sales_price     DECIMAL(7, 2)  NULL,
        ss_ext_wholesale_cost  DECIMAL(7, 2)  NULL,
        ss_ext_list_price      DECIMAL(7, 2)  NULL,
        ss_ext_tax             DECIMAL(7, 2)  NULL,
        ss_coupon_amt          DECIMAL(7, 2)  NULL,
        ss_net_paid            DECIMAL(7, 2)  NULL,
        ss_net_paid_inc_tax    DECIMAL(7, 2)  NULL,
        ss_net_profit          DECIMAL(7, 2)  NULL
    );

CREATE TABLE dbo.time_dim
    (
        t_time_sk    INT       NOT NULL,
        t_time_id    CHAR(16)  NOT NULL,
        t_time       INT       NOT NULL,
        t_hour       INT       NULL,
        t_minute     INT       NULL,
        t_second     INT       NULL,
        t_am_pm      CHAR(2)   NULL,
        t_shift      CHAR(20)  NULL,
        t_sub_shift  CHAR(20)  NULL,
        t_meal_time  CHAR(20)  NULL
    );

CREATE TABLE dbo.warehouse
    (
        w_warehouse_sk     INT            NOT NULL,
        w_warehouse_id     CHAR(16)       NOT NULL,
        w_warehouse_name   VARCHAR(20)    NULL,
        w_warehouse_sq_ft  INT            NULL,
        w_street_number    CHAR(10)       NULL,
        w_street_name      VARCHAR(60)    NULL,
        w_street_type      CHAR(15)       NULL,
        w_suite_number     CHAR(10)       NULL,
        w_city             VARCHAR(60)    NULL,
        w_county           VARCHAR(30)    NULL,
        w_state            CHAR(2)        NULL,
        w_zip              CHAR(10)       NULL,
        w_country          VARCHAR(20)    NULL,
        w_gmt_offset       DECIMAL(5, 2)  NULL
    );

CREATE TABLE dbo.web_page
    (
        wp_web_page_sk       INT           NOT NULL,
        wp_web_page_id       CHAR(16)      NOT NULL,
        wp_rec_start_date    DATE          NULL,
        wp_rec_end_date      DATE          NULL,
        wp_creation_date_sk  INT           NULL,
        wp_access_date_sk    INT           NULL,
        wp_autogen_flag      CHAR(1)       NULL,
        wp_customer_sk       INT           NULL,
        wp_url               VARCHAR(100)  NULL,
        wp_type              CHAR(50)      NULL,
        wp_char_count        INT           NULL,
        wp_link_count        INT           NULL,
        wp_image_count       INT           NULL,
        wp_max_ad_count      INT           NULL
    );

CREATE TABLE dbo.web_returns
    (
        wr_returned_date_sk       INT            NULL,
        wr_returned_time_sk       INT            NULL,
        wr_item_sk                INT            NOT NULL,
        wr_refunded_customer_sk   INT            NULL,
        wr_refunded_cdemo_sk      INT            NULL,
        wr_refunded_hdemo_sk      INT            NULL,
        wr_refunded_addr_sk       INT            NULL,
        wr_returning_customer_sk  INT            NULL,
        wr_returning_cdemo_sk     INT            NULL,
        wr_returning_hdemo_sk     INT            NULL,
        wr_returning_addr_sk      INT            NULL,
        wr_web_page_sk            INT            NULL,
        wr_reason_sk              INT            NULL,
        wr_order_number           BIGINT         NOT NULL,
        wr_return_quantity        INT            NULL,
        wr_return_amt             DECIMAL(7, 2)  NULL,
        wr_return_tax             DECIMAL(7, 2)  NULL,
        wr_return_amt_inc_tax     DECIMAL(7, 2)  NULL,
        wr_fee                    DECIMAL(7, 2)  NULL,
        wr_return_ship_cost       DECIMAL(7, 2)  NULL,
        wr_refunded_cash          DECIMAL(7, 2)  NULL,
        wr_reversed_charge        DECIMAL(7, 2)  NULL,
        wr_account_credit         DECIMAL(7, 2)  NULL,
        wr_net_loss               DECIMAL(7, 2)  NULL
    );

CREATE TABLE dbo.web_sales
    (
        ws_sold_date_sk           INT            NULL,
        ws_sold_time_sk           INT            NULL,
        ws_ship_date_sk           INT            NULL,
        ws_item_sk                INT            NOT NULL,
        ws_bill_customer_sk       INT            NULL,
        ws_bill_cdemo_sk          INT            NULL,
        ws_bill_hdemo_sk          INT            NULL,
        ws_bill_addr_sk           INT            NULL,
        ws_ship_customer_sk       INT            NULL,
        ws_ship_cdemo_sk          INT            NULL,
        ws_ship_hdemo_sk          INT            NULL,
        ws_ship_addr_sk           INT            NULL,
        ws_web_page_sk            INT            NULL,
        ws_web_site_sk            INT            NULL,
        ws_ship_mode_sk           INT            NULL,
        ws_warehouse_sk           INT            NULL,
        ws_promo_sk               INT            NULL,
        ws_order_number           BIGINT         NOT NULL,
        ws_quantity               INT            NULL,
        ws_wholesale_cost         DECIMAL(7, 2)  NULL,
        ws_list_price             DECIMAL(7, 2)  NULL,
        ws_sales_price            DECIMAL(7, 2)  NULL,
        ws_ext_discount_amt       DECIMAL(7, 2)  NULL,
        ws_ext_sales_price        DECIMAL(7, 2)  NULL,
        ws_ext_wholesale_cost     DECIMAL(7, 2)  NULL,
        ws_ext_list_price         DECIMAL(7, 2)  NULL,
        ws_ext_tax                DECIMAL(7, 2)  NULL,
        ws_coupon_amt             DECIMAL(7, 2)  NULL,
        ws_ext_ship_cost          DECIMAL(7, 2)  NULL,
        ws_net_paid               DECIMAL(7, 2)  NULL,
        ws_net_paid_inc_tax       DECIMAL(7, 2)  NULL,
        ws_net_paid_inc_ship      DECIMAL(7, 2)  NULL,
        ws_net_paid_inc_ship_tax  DECIMAL(7, 2)  NULL,
        ws_net_profit             DECIMAL(7, 2)  NULL
    );

CREATE TABLE dbo.web_site
    (
        web_site_sk         INT            NOT NULL,
        web_site_id         CHAR(16)       NOT NULL,
        web_rec_start_date  DATE           NULL,
        web_rec_end_date    DATE           NULL,
        web_name            VARCHAR(50)    NULL,
        web_open_date_sk    INT            NULL,
        web_close_date_sk   INT            NULL,
        web_class           VARCHAR(50)    NULL,
        web_manager         VARCHAR(40)    NULL,
        web_mkt_id          INT            NULL,
        web_mkt_class       VARCHAR(50)    NULL,
        web_mkt_desc        VARCHAR(100)   NULL,
        web_market_manager  VARCHAR(40)    NULL,
        web_company_id      INT            NULL,
        web_company_name    CHAR(50)       NULL,
        web_street_number   CHAR(10)       NULL,
        web_street_name     VARCHAR(60)    NULL,
        web_street_type     CHAR(15)       NULL,
        web_suite_number    CHAR(10)       NULL,
        web_city            VARCHAR(60)    NULL,
        web_county          VARCHAR(30)    NULL,
        web_state           CHAR(2)        NULL,
        web_zip             CHAR(10)       NULL,
        web_country         VARCHAR(20)    NULL,
        web_gmt_offset      DECIMAL(5, 2)  NULL,
        web_tax_percentage  DECIMAL(5, 2)  NULL
    );


COPY INTO dbo.call_center             FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpcds_sf1/call_center/*.parquet' WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - call_center - COPY INTO');
COPY INTO dbo.catalog_page            FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpcds_sf1/catalog_page/*.parquet' WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - catalog_page - COPY INTO');
COPY INTO dbo.catalog_returns         FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpcds_sf1/catalog_returns/*.parquet' WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - catalog_returns - COPY INTO');
COPY INTO dbo.catalog_sales           FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpcds_sf1/catalog_sales/*.parquet' WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - catalog_sales - COPY INTO');
COPY INTO dbo.customer                FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpcds_sf1/customer/*.parquet' WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - customer - COPY INTO');
COPY INTO dbo.customer_address        FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpcds_sf1/customer_address/*.parquet' WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - customer_address - COPY INTO');
COPY INTO dbo.customer_demographics   FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpcds_sf1/customer_demographics/*.parquet' WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - customer_demographics - COPY INTO');
COPY INTO dbo.date_dim                FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpcds_sf1/date_dim/*.parquet' WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - date_dim - COPY INTO');
COPY INTO dbo.household_demographics  FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpcds_sf1/household_demographics/*.parquet' WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - household_demographics - COPY INTO');
COPY INTO dbo.income_band             FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpcds_sf1/income_band/*.parquet' WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - income_band - COPY INTO');
COPY INTO dbo.inventory               FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpcds_sf1/inventory/*.parquet' WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - inventory - COPY INTO');
COPY INTO dbo.item                    FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpcds_sf1/item/*.parquet' WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - item - COPY INTO');
COPY INTO dbo.promotion               FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpcds_sf1/promotion/*.parquet' WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - promotion - COPY INTO');
COPY INTO dbo.reason                  FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpcds_sf1/reason/*.parquet' WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - reason - COPY INTO');
COPY INTO dbo.ship_mode               FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpcds_sf1/ship_mode/*.parquet' WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - ship_mode - COPY INTO');
COPY INTO dbo.store                   FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpcds_sf1/store/*.parquet' WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - store - COPY INTO');
COPY INTO dbo.store_returns           FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpcds_sf1/store_returns/*.parquet' WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - store_returns - COPY INTO');
COPY INTO dbo.store_sales             FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpcds_sf1/store_sales/*.parquet' WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - store_sales - COPY INTO');
COPY INTO dbo.time_dim                FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpcds_sf1/time_dim/*.parquet' WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - time_dim - COPY INTO');
COPY INTO dbo.warehouse               FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpcds_sf1/warehouse/*.parquet' WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - warehouse - COPY INTO');
COPY INTO dbo.web_page                FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpcds_sf1/web_page/*.parquet' WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - web_page - COPY INTO');
COPY INTO dbo.web_returns             FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpcds_sf1/web_returns/*.parquet' WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - web_returns - COPY INTO');
COPY INTO dbo.web_sales               FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpcds_sf1/web_sales/*.parquet' WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - web_sales - COPY INTO');
COPY INTO dbo.web_site                FROM 'https://onelake.dfs.fabric.microsoft.com/0631bff8-b82c-4800-bc4f-b1f6cd2b9cfc/023336ad-ad68-40ff-b90a-063128753fb0/Files/tpcds_sf1/web_site/*.parquet' WITH (FILE_TYPE = 'PARQUET') OPTION (LABEL = 'Load - web_site - COPY INTO');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q1
WITH customer_total_return AS (
  SELECT
    sr_customer_sk AS ctr_customer_sk,
    sr_store_sk AS ctr_store_sk,
    SUM(sr_return_amt) AS ctr_total_return
  FROM store_returns
  JOIN date_dim ON sr_returned_date_sk = d_date_sk
  WHERE d_year = 2000
  GROUP BY
    sr_customer_sk,
    sr_store_sk
)
SELECT TOP 100
  c_customer_id
FROM customer_total_return AS ctr1
JOIN store ON ctr1.ctr_store_sk = s_store_sk
JOIN customer ON ctr1.ctr_customer_sk = c_customer_sk
WHERE
  ctr1.ctr_total_return > (
    SELECT
      AVG(ctr_total_return) * 1.2
    FROM customer_total_return AS ctr2
    WHERE ctr1.ctr_store_sk = ctr2.ctr_store_sk
  )
  AND s_state = 'TN'
ORDER BY
  c_customer_id
OPTION (LABEL = 'TPC-DS Q1');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q2
WITH wscs AS (
  SELECT
    sold_date_sk,
    sales_price
  FROM (
    SELECT
      ws_sold_date_sk AS sold_date_sk,
      ws_ext_sales_price AS sales_price
    FROM web_sales
    UNION ALL
    SELECT
      cs_sold_date_sk AS sold_date_sk,
      cs_ext_sales_price AS sales_price
    FROM catalog_sales
  )
), wswscs AS (
  SELECT
    d_week_seq,
    SUM(CASE WHEN d_day_name = 'Sunday' THEN sales_price ELSE NULL END) AS sun_sales,
    SUM(CASE WHEN d_day_name = 'Monday' THEN sales_price ELSE NULL END) AS mon_sales,
    SUM(CASE WHEN d_day_name = 'Tuesday' THEN sales_price ELSE NULL END) AS tue_sales,
    SUM(CASE WHEN d_day_name = 'Wednesday' THEN sales_price ELSE NULL END) AS wed_sales,
    SUM(CASE WHEN d_day_name = 'Thursday' THEN sales_price ELSE NULL END) AS thu_sales,
    SUM(CASE WHEN d_day_name = 'Friday' THEN sales_price ELSE NULL END) AS fri_sales,
    SUM(CASE WHEN d_day_name = 'Saturday' THEN sales_price ELSE NULL END) AS sat_sales
  FROM wscs
  JOIN date_dim ON d_date_sk = sold_date_sk
  GROUP BY d_week_seq
)
SELECT
  d_week_seq1,
  ROUND(sun_sales1 / sun_sales2, 2),
  ROUND(mon_sales1 / mon_sales2, 2),
  ROUND(tue_sales1 / tue_sales2, 2),
  ROUND(wed_sales1 / wed_sales2, 2),
  ROUND(thu_sales1 / thu_sales2, 2),
  ROUND(fri_sales1 / fri_sales2, 2),
  ROUND(sat_sales1 / sat_sales2, 2)
FROM (
  SELECT
    wswscs.d_week_seq AS d_week_seq1,
    sun_sales AS sun_sales1,
    mon_sales AS mon_sales1,
    tue_sales AS tue_sales1,
    wed_sales AS wed_sales1,
    thu_sales AS thu_sales1,
    fri_sales AS fri_sales1,
    sat_sales AS sat_sales1
  FROM wswscs
  JOIN date_dim ON date_dim.d_week_seq = wswscs.d_week_seq
  WHERE d_year = 1998
) AS y
JOIN (
  SELECT
    wswscs.d_week_seq AS d_week_seq2,
    sun_sales AS sun_sales2,
    mon_sales AS mon_sales2,
    tue_sales AS tue_sales2,
    wed_sales AS wed_sales2,
    thu_sales AS thu_sales2,
    fri_sales AS fri_sales2,
    sat_sales AS sat_sales2
  FROM wswscs
  JOIN date_dim ON date_dim.d_week_seq = wswscs.d_week_seq
  WHERE d_year = 1999
) AS z ON d_week_seq1 = d_week_seq2 - 53
ORDER BY d_week_seq1
OPTION (LABEL = 'TPC-DS Q2');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q3
SELECT TOP 100
  dt.d_year,
  item.i_brand_id AS brand_id,
  item.i_brand AS brand,
  SUM(ss_ext_sales_price) AS sum_agg
FROM date_dim AS dt
JOIN store_sales ON dt.d_date_sk = store_sales.ss_sold_date_sk
JOIN item ON store_sales.ss_item_sk = item.i_item_sk
WHERE item.i_manufact_id = 717
  AND dt.d_moy = 12
GROUP BY
  dt.d_year,
  item.i_brand,
  item.i_brand_id
ORDER BY
  dt.d_year,
  sum_agg DESC,
  brand_id
OPTION (LABEL = 'TPC-DS Q3');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q4
WITH year_total AS (
  SELECT
    c_customer_id AS customer_id,
    c_first_name AS customer_first_name,
    c_last_name AS customer_last_name,
    c_preferred_cust_flag AS customer_preferred_cust_flag,
    c_birth_country AS customer_birth_country,
    c_login AS customer_login,
    c_email_address AS customer_email_address,
    d_year AS dyear,
    SUM(
      (
        (
          ss_ext_list_price - ss_ext_wholesale_cost - ss_ext_discount_amt
        ) + ss_ext_sales_price
      ) / 2
    ) AS year_total,
    's' AS sale_type
  FROM customer
  JOIN store_sales ON c_customer_sk = ss_customer_sk
  JOIN date_dim ON ss_sold_date_sk = d_date_sk
  GROUP BY
    c_customer_id,
    c_first_name,
    c_last_name,
    c_preferred_cust_flag,
    c_birth_country,
    c_login,
    c_email_address,
    d_year
  UNION ALL
  SELECT
    c_customer_id AS customer_id,
    c_first_name AS customer_first_name,
    c_last_name AS customer_last_name,
    c_preferred_cust_flag AS customer_preferred_cust_flag,
    c_birth_country AS customer_birth_country,
    c_login AS customer_login,
    c_email_address AS customer_email_address,
    d_year AS dyear,
    SUM(
      (
        (
          (
            cs_ext_list_price - cs_ext_wholesale_cost - cs_ext_discount_amt
          ) + cs_ext_sales_price
        ) / 2
      )
    ) AS year_total,
    'c' AS sale_type
  FROM customer
  JOIN catalog_sales ON c_customer_sk = cs_bill_customer_sk
  JOIN date_dim ON cs_sold_date_sk = d_date_sk
  GROUP BY
    c_customer_id,
    c_first_name,
    c_last_name,
    c_preferred_cust_flag,
    c_birth_country,
    c_login,
    c_email_address,
    d_year
  UNION ALL
  SELECT
    c_customer_id AS customer_id,
    c_first_name AS customer_first_name,
    c_last_name AS customer_last_name,
    c_preferred_cust_flag AS customer_preferred_cust_flag,
    c_birth_country AS customer_birth_country,
    c_login AS customer_login,
    c_email_address AS customer_email_address,
    d_year AS dyear,
    SUM(
      (
        (
          (
            ws_ext_list_price - ws_ext_wholesale_cost - ws_ext_discount_amt
          ) + ws_ext_sales_price
        ) / 2
      )
    ) AS year_total,
    'w' AS sale_type
  FROM customer
  JOIN web_sales ON c_customer_sk = ws_bill_customer_sk
  JOIN date_dim ON ws_sold_date_sk = d_date_sk
  GROUP BY
    c_customer_id,
    c_first_name,
    c_last_name,
    c_preferred_cust_flag,
    c_birth_country,
    c_login,
    c_email_address,
    d_year
)
SELECT TOP 100
  t_s_secyear.customer_id,
  t_s_secyear.customer_first_name,
  t_s_secyear.customer_last_name,
  t_s_secyear.customer_preferred_cust_flag
FROM year_total AS t_s_firstyear
JOIN year_total AS t_s_secyear ON t_s_secyear.customer_id = t_s_firstyear.customer_id
JOIN year_total AS t_c_firstyear ON t_s_firstyear.customer_id = t_c_firstyear.customer_id
JOIN year_total AS t_c_secyear ON t_s_firstyear.customer_id = t_c_secyear.customer_id
JOIN year_total AS t_w_firstyear ON t_s_firstyear.customer_id = t_w_firstyear.customer_id
JOIN year_total AS t_w_secyear ON t_s_firstyear.customer_id = t_w_secyear.customer_id
WHERE
  t_s_firstyear.sale_type = 's'
  AND t_c_firstyear.sale_type = 'c'
  AND t_w_firstyear.sale_type = 'w'
  AND t_s_secyear.sale_type = 's'
  AND t_c_secyear.sale_type = 'c'
  AND t_w_secyear.sale_type = 'w'
  AND t_s_firstyear.dyear = 2001
  AND t_s_secyear.dyear = 2001 + 1
  AND t_c_firstyear.dyear = 2001
  AND t_c_secyear.dyear = 2001 + 1
  AND t_w_firstyear.dyear = 2001
  AND t_w_secyear.dyear = 2001 + 1
  AND t_s_firstyear.year_total > 0
  AND t_c_firstyear.year_total > 0
  AND t_w_firstyear.year_total > 0
  AND CASE
    WHEN t_c_firstyear.year_total > 0
    THEN t_c_secyear.year_total / t_c_firstyear.year_total
    ELSE NULL
  END > CASE
    WHEN t_s_firstyear.year_total > 0
    THEN t_s_secyear.year_total / t_s_firstyear.year_total
    ELSE NULL
  END
  AND CASE
    WHEN t_c_firstyear.year_total > 0
    THEN t_c_secyear.year_total / t_c_firstyear.year_total
    ELSE NULL
  END > CASE
    WHEN t_w_firstyear.year_total > 0
    THEN t_w_secyear.year_total / t_w_firstyear.year_total
    ELSE NULL
  END
ORDER BY
  t_s_secyear.customer_id,
  t_s_secyear.customer_first_name,
  t_s_secyear.customer_last_name,
  t_s_secyear.customer_preferred_cust_flag
OPTION (LABEL = 'TPC-DS Q4');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q5
WITH ssr AS (
  SELECT
    s_store_id,
    SUM(sales_price) AS sales,
    SUM(profit) AS profit,
    SUM(return_amt) AS returns,
    SUM(net_loss) AS profit_loss
  FROM (
    SELECT
      ss_store_sk AS store_sk,
      ss_sold_date_sk AS date_sk,
      ss_ext_sales_price AS sales_price,
      ss_net_profit AS profit,
      CAST(0 AS DECIMAL(7, 2)) AS return_amt,
      CAST(0 AS DECIMAL(7, 2)) AS net_loss
    FROM store_sales
    UNION ALL
    SELECT
      sr_store_sk AS store_sk,
      sr_returned_date_sk AS date_sk,
      CAST(0 AS DECIMAL(7, 2)) AS sales_price,
      CAST(0 AS DECIMAL(7, 2)) AS profit,
      sr_return_amt AS return_amt,
      sr_net_loss AS net_loss
    FROM store_returns
  ) AS salesreturns
  JOIN date_dim ON date_sk = d_date_sk
  JOIN store ON store_sk = s_store_sk
  WHERE
    d_date BETWEEN CAST('1999-08-29' AS DATE) AND DATEADD(day, 14, CAST('1999-08-29' AS DATE))
  GROUP BY
    s_store_id
), csr AS (
  SELECT
    cp_catalog_page_id,
    SUM(sales_price) AS sales,
    SUM(profit) AS profit,
    SUM(return_amt) AS returns,
    SUM(net_loss) AS profit_loss
  FROM (
    SELECT
      cs_catalog_page_sk AS page_sk,
      cs_sold_date_sk AS date_sk,
      cs_ext_sales_price AS sales_price,
      cs_net_profit AS profit,
      CAST(0 AS DECIMAL(7, 2)) AS return_amt,
      CAST(0 AS DECIMAL(7, 2)) AS net_loss
    FROM catalog_sales
    UNION ALL
    SELECT
      cr_catalog_page_sk AS page_sk,
      cr_returned_date_sk AS date_sk,
      CAST(0 AS DECIMAL(7, 2)) AS sales_price,
      CAST(0 AS DECIMAL(7, 2)) AS profit,
      cr_return_amount AS return_amt,
      cr_net_loss AS net_loss
    FROM catalog_returns
  ) AS salesreturns
  JOIN date_dim ON date_sk = d_date_sk
  JOIN catalog_page ON page_sk = cp_catalog_page_sk
  WHERE
    d_date BETWEEN CAST('1999-08-29' AS DATE) AND DATEADD(day, 14, CAST('1999-08-29' AS DATE))
  GROUP BY
    cp_catalog_page_id
), wsr AS (
  SELECT
    web_site_id,
    SUM(sales_price) AS sales,
    SUM(profit) AS profit,
    SUM(return_amt) AS returns,
    SUM(net_loss) AS profit_loss
  FROM (
    SELECT
      ws_web_site_sk AS wsr_web_site_sk,
      ws_sold_date_sk AS date_sk,
      ws_ext_sales_price AS sales_price,
      ws_net_profit AS profit,
      CAST(0 AS DECIMAL(7, 2)) AS return_amt,
      CAST(0 AS DECIMAL(7, 2)) AS net_loss
    FROM web_sales
    UNION ALL
    SELECT
      ws_web_site_sk AS wsr_web_site_sk,
      wr_returned_date_sk AS date_sk,
      CAST(0 AS DECIMAL(7, 2)) AS sales_price,
      CAST(0 AS DECIMAL(7, 2)) AS profit,
      wr_return_amt AS return_amt,
      wr_net_loss AS net_loss
    FROM web_returns
    JOIN web_sales ON wr_item_sk = ws_item_sk AND wr_order_number = ws_order_number
  ) AS salesreturns
  JOIN date_dim ON date_sk = d_date_sk
  JOIN web_site ON wsr_web_site_sk = web_site_sk
  WHERE
    d_date BETWEEN CAST('1999-08-29' AS DATE) AND DATEADD(day, 14, CAST('1999-08-29' AS DATE))
  GROUP BY
    web_site_id
)
SELECT TOP 100
  channel,
  id,
  SUM(sales) AS sales,
  SUM(returns) AS returns,
  SUM(profit) AS profit
FROM (
  SELECT
    'store channel' AS channel,
    'store' + s_store_id AS id,
    sales,
    returns,
    (
      profit - profit_loss
    ) AS profit
  FROM ssr
  UNION ALL
  SELECT
    'catalog channel' AS channel,
    'catalog_page' + cp_catalog_page_id AS id,
    sales,
    returns,
    (
      profit - profit_loss
    ) AS profit
  FROM csr
  UNION ALL
  SELECT
    'web channel' AS channel,
    'web_site' + web_site_id AS id,
    sales,
    returns,
    (
      profit - profit_loss
    ) AS profit
  FROM wsr
) AS x
GROUP BY
ROLLUP (
  channel,
  id
)
ORDER BY
  channel,
  id
OPTION (LABEL = 'TPC-DS Q5');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q6
SELECT TOP 100
  a.ca_state AS state,
  COUNT(*) AS cnt
FROM customer_address AS a
JOIN customer AS c ON a.ca_address_sk = c.c_current_addr_sk
JOIN store_sales AS s ON c.c_customer_sk = s.ss_customer_sk
JOIN date_dim AS d ON s.ss_sold_date_sk = d.d_date_sk
JOIN item AS i ON s.ss_item_sk = i.i_item_sk
WHERE
  d.d_month_seq = (
    SELECT DISTINCT
      d_month_seq
    FROM date_dim
    WHERE
      d_year = 2000 AND d_moy = 1
  )
  AND i.i_current_price > 1.2 * (
    SELECT
      AVG(j.i_current_price)
    FROM item AS j
    WHERE
      j.i_category = i.i_category
  )
GROUP BY
  a.ca_state
HAVING
  COUNT(*) >= 10
ORDER BY
  cnt,
  a.ca_state
OPTION (LABEL = 'TPC-DS Q6');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q7
SELECT TOP 100
  i_item_id,
  AVG(ss_quantity) AS agg1,
  AVG(ss_list_price) AS agg2,
  AVG(ss_coupon_amt) AS agg3,
  AVG(ss_sales_price) AS agg4
FROM store_sales
JOIN customer_demographics ON ss_cdemo_sk = cd_demo_sk
JOIN date_dim ON ss_sold_date_sk = d_date_sk
JOIN item ON ss_item_sk = i_item_sk
JOIN promotion ON ss_promo_sk = p_promo_sk
WHERE
  cd_gender = 'M'
  AND cd_marital_status = 'D'
  AND cd_education_status = 'Secondary'
  AND (
    p_channel_email = 'N' OR p_channel_event = 'N'
  )
  AND d_year = 1999
GROUP BY
  i_item_id
ORDER BY
  i_item_id
OPTION (LABEL = 'TPC-DS Q7');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q8
SELECT TOP 100
  s_store_name,
  SUM(ss_net_profit)
FROM store_sales
JOIN date_dim ON ss_sold_date_sk = d_date_sk
JOIN store ON ss_store_sk = s_store_sk
JOIN (
  SELECT
    ca_zip
  FROM (
    SELECT
      SUBSTRING(ca_zip, 1, 5) AS ca_zip
    FROM customer_address
    WHERE
      SUBSTRING(ca_zip, 1, 5) IN ('58087', '52097', '23033', '46494', '27421', '56154', '72453', '14580', '66165', '59090', '51865', '42527', '43609', '33798', '50608', '59446', '41647', '71298', '41594', '41769', '47020', '11375', '78837', '24194', '80442', '96449', '17307', '90047', '35370', '47858', '18721', '24516', '56046', '60261', '54629', '64437', '50645', '90224', '22199', '49507', '29884', '39195', '42750', '80575', '42979', '23981', '93511', '64161', '86373', '54815', '52174', '61155', '65526', '63356', '97492', '83608', '10655', '23405', '13212', '98713', '60603', '94643', '64019', '55952', '52716', '41532', '67410', '20010', '25995', '59192', '30016', '73601', '39676', '86898', '44901', '34800', '26839', '38526', '81257', '87759', '32863', '65443', '47649', '20841', '28524', '71013', '22300', '59034', '11492', '53512', '50389', '90274', '20702', '54678', '72280', '39086', '71924', '26046', '31991', '36877', '93675', '14268', '60905', '97986', '65993', '43743', '57134', '30547', '13170', '33768', '19449', '36958', '34070', '11524', '51677', '43189', '60208', '99533', '24131', '38259', '54309', '27931', '77346', '65804', '49212', '40286', '25404', '47564', '31738', '15852', '88372', '67610', '45578', '72244', '80443', '58583', '79057', '92464', '45450', '70204', '16299', '20174', '18846', '54660', '58276', '67978', '68429', '83337', '66150', '14592', '53318', '80478', '39976', '96610', '36978', '12068', '54561', '28543', '76166', '17749', '59509', '85078', '84947', '66016', '53347', '63697', '54468', '25401', '37415', '86796', '18698', '42338', '10515', '76996', '25513', '22561', '28697', '54557', '61687', '75862', '57590', '53570', '34850', '31096', '55028', '19874', '93548', '34949', '90391', '65484', '28826', '14253', '16034', '43385', '55875', '52351', '29154', '56219', '44205', '12210', '30537', '11071', '53391', '35367', '37532', '23533', '53876', '57837', '85116', '43201', '23058', '73313', '13286', '21309', '25626', '51845', '63388', '33313', '58262', '28798', '48865', '54453', '26953', '13010', '56590', '87320', '17608', '98621', '96822', '24441', '17156', '41179', '37964', '92050', '33709', '36975', '86260', '44459', '98090', '40520', '54010', '42084', '39495', '53306', '29101', '92072', '70911', '95838', '19852', '75390', '75959', '53273', '62848', '59378', '45239', '77350', '27576', '80480', '18354', '37234', '36349', '46252', '70060', '11114', '61222', '18898', '40940', '87201', '43569', '31064', '19502', '68381', '52410', '77806', '44076', '68239', '75948', '39443', '57007', '86481', '93493', '53043', '56564', '10519', '57343', '65520', '18114', '46516', '23294', '39931', '11825', '62863', '20343', '73137', '45948', '31249', '34845', '39827', '98195', '93122', '26367', '11905', '44366', '15360', '23845', '57728', '92077', '27427', '31739', '31403', '23758', '40411', '29264', '15304', '40474', '75267', '18694', '99742', '23355', '14452', '74326', '75943', '66304', '82947', '93461', '18040', '20252', '48343', '28024', '78603', '98210', '45403', '72926', '33247', '48574', '16635', '21097', '36569', '37826', '84733', '48896', '70066', '48108', '31643', '31547', '93161', '13348', '78228', '36480', '31327', '16543', '64824', '82118', '33557', '55376', '79216', '72364', '48512', '60046', '24847', '28698', '49723', '25341', '31950', '40076', '27805', '18529', '68946', '20718', '74219', '31219', '18875', '10539', '34804', '15337', '57786', '24110', '16747', '78877', '67451', '40799', '91115', '43459', '38288', '48821', '69121', '45722', '13823', '90355', '72186', '22224', '24195', '77278', '45555', '46449', '36672', '22688', '50197', '36548', '34019')
    INTERSECT
    SELECT
      ca_zip
    FROM (
      SELECT
        SUBSTRING(ca_zip, 1, 5) AS ca_zip,
        COUNT(*) AS cnt
      FROM customer_address
      JOIN customer ON ca_address_sk = c_current_addr_sk
      WHERE c_preferred_cust_flag = 'Y'
      GROUP BY ca_zip
      HAVING COUNT(*) > 10
    ) AS A1
  ) AS A2
) AS V1 ON SUBSTRING(s_zip, 1, 2) = SUBSTRING(V1.ca_zip, 1, 2)
WHERE d_qoy = 1
  AND d_year = 2002
GROUP BY s_store_name
ORDER BY s_store_name
OPTION (LABEL = 'TPC-DS Q8');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q9
SELECT
  CASE
    WHEN (
      SELECT
        COUNT(*)
      FROM store_sales
      WHERE
        ss_quantity BETWEEN 1 AND 20
    ) > 10347718
    THEN (
      SELECT
        AVG(ss_ext_tax)
      FROM store_sales
      WHERE
        ss_quantity BETWEEN 1 AND 20
    )
    ELSE (
      SELECT
        AVG(ss_net_paid_inc_tax)
      FROM store_sales
      WHERE
        ss_quantity BETWEEN 1 AND 20
    )
  END AS bucket1,
  CASE
    WHEN (
      SELECT
        COUNT(*)
      FROM store_sales
      WHERE
        ss_quantity BETWEEN 21 AND 40
    ) > 41233003
    THEN (
      SELECT
        AVG(ss_ext_tax)
      FROM store_sales
      WHERE
        ss_quantity BETWEEN 21 AND 40
    )
    ELSE (
      SELECT
        AVG(ss_net_paid_inc_tax)
      FROM store_sales
      WHERE
        ss_quantity BETWEEN 21 AND 40
    )
  END AS bucket2,
  CASE
    WHEN (
      SELECT
        COUNT(*)
      FROM store_sales
      WHERE
        ss_quantity BETWEEN 41 AND 60
    ) > 25517412
    THEN (
      SELECT
        AVG(ss_ext_tax)
      FROM store_sales
      WHERE
        ss_quantity BETWEEN 41 AND 60
    )
    ELSE (
      SELECT
        AVG(ss_net_paid_inc_tax)
      FROM store_sales
      WHERE
        ss_quantity BETWEEN 41 AND 60
    )
  END AS bucket3,
  CASE
    WHEN (
      SELECT
        COUNT(*)
      FROM store_sales
      WHERE
        ss_quantity BETWEEN 61 AND 80
    ) > 5987365
    THEN (
      SELECT
        AVG(ss_ext_tax)
      FROM store_sales
      WHERE
        ss_quantity BETWEEN 61 AND 80
    )
    ELSE (
      SELECT
        AVG(ss_net_paid_inc_tax)
      FROM store_sales
      WHERE
        ss_quantity BETWEEN 61 AND 80
    )
  END AS bucket4,
  CASE
    WHEN (
      SELECT
        COUNT(*)
      FROM store_sales
      WHERE
        ss_quantity BETWEEN 81 AND 100
    ) > 15407422
    THEN (
      SELECT
        AVG(ss_ext_tax)
      FROM store_sales
      WHERE
        ss_quantity BETWEEN 81 AND 100
    )
    ELSE (
      SELECT
        AVG(ss_net_paid_inc_tax)
      FROM store_sales
      WHERE
        ss_quantity BETWEEN 81 AND 100
    )
  END AS bucket5
FROM reason
WHERE
  r_reason_sk = 1
OPTION (LABEL = 'TPC-DS Q9');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q10
SELECT TOP 100
  cd_gender,
  cd_marital_status,
  cd_education_status,
  COUNT(*) AS cnt1,
  cd_purchase_estimate,
  COUNT(*) AS cnt2,
  cd_credit_rating,
  COUNT(*) AS cnt3,
  cd_dep_count,
  COUNT(*) AS cnt4,
  cd_dep_employed_count,
  COUNT(*) AS cnt5,
  cd_dep_college_count,
  COUNT(*) AS cnt6
FROM customer AS c
JOIN customer_address AS ca ON c.c_current_addr_sk = ca.ca_address_sk
JOIN customer_demographics AS cd ON cd_demo_sk = c.c_current_cdemo_sk
WHERE
  ca_county IN ('Shawnee County', 'Jersey County', 'Big Stone County', 'Polk County', 'Wolfe County')
  AND EXISTS(
    SELECT
      *
    FROM store_sales AS ss
    JOIN date_dim AS d ON ss.ss_sold_date_sk = d.d_date_sk
    WHERE
      c.c_customer_sk = ss.ss_customer_sk
      AND d.d_year = 1999
      AND d.d_moy BETWEEN 4 AND 4 + 3
  )
  AND (
    EXISTS(
      SELECT
        *
      FROM web_sales AS ws
      JOIN date_dim AS d ON ws.ws_sold_date_sk = d.d_date_sk
      WHERE
        c.c_customer_sk = ws.ws_bill_customer_sk
        AND d.d_year = 1999
        AND d.d_moy BETWEEN 4 AND 4 + 3
    )
    OR EXISTS(
      SELECT
        *
      FROM catalog_sales AS cs
      JOIN date_dim AS d ON cs.cs_sold_date_sk = d.d_date_sk
      WHERE
        c.c_customer_sk = cs.cs_ship_customer_sk
        AND d.d_year = 1999
        AND d.d_moy BETWEEN 4 AND 4 + 3
    )
  )
GROUP BY
  cd_gender,
  cd_marital_status,
  cd_education_status,
  cd_purchase_estimate,
  cd_credit_rating,
  cd_dep_count,
  cd_dep_employed_count,
  cd_dep_college_count
ORDER BY
  cd_gender,
  cd_marital_status,
  cd_education_status,
  cd_purchase_estimate,
  cd_credit_rating,
  cd_dep_count,
  cd_dep_employed_count,
  cd_dep_college_count
OPTION (LABEL = 'TPC-DS Q10');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q11
WITH year_total AS (
  SELECT
    c_customer_id AS customer_id,
    c_first_name AS customer_first_name,
    c_last_name AS customer_last_name,
    c_preferred_cust_flag AS customer_preferred_cust_flag,
    c_birth_country AS customer_birth_country,
    c_login AS customer_login,
    c_email_address AS customer_email_address,
    d_year AS dyear,
    SUM(ss_ext_list_price - ss_ext_discount_amt) AS year_total,
    's' AS sale_type
  FROM customer
  JOIN store_sales ON c_customer_sk = ss_customer_sk
  JOIN date_dim ON ss_sold_date_sk = d_date_sk
  GROUP BY
    c_customer_id,
    c_first_name,
    c_last_name,
    c_preferred_cust_flag,
    c_birth_country,
    c_login,
    c_email_address,
    d_year
  UNION ALL
  SELECT
    c_customer_id AS customer_id,
    c_first_name AS customer_first_name,
    c_last_name AS customer_last_name,
    c_preferred_cust_flag AS customer_preferred_cust_flag,
    c_birth_country AS customer_birth_country,
    c_login AS customer_login,
    c_email_address AS customer_email_address,
    d_year AS dyear,
    SUM(ws_ext_list_price - ws_ext_discount_amt) AS year_total,
    'w' AS sale_type
  FROM customer
  JOIN web_sales ON c_customer_sk = ws_bill_customer_sk
  JOIN date_dim ON ws_sold_date_sk = d_date_sk
  GROUP BY
    c_customer_id,
    c_first_name,
    c_last_name,
    c_preferred_cust_flag,
    c_birth_country,
    c_login,
    c_email_address,
    d_year
)
SELECT TOP 100
  t_s_secyear.customer_id,
  t_s_secyear.customer_first_name,
  t_s_secyear.customer_last_name,
  t_s_secyear.customer_preferred_cust_flag
FROM year_total AS t_s_firstyear
JOIN year_total AS t_s_secyear ON t_s_secyear.customer_id = t_s_firstyear.customer_id
JOIN year_total AS t_w_firstyear ON t_s_firstyear.customer_id = t_w_firstyear.customer_id
JOIN year_total AS t_w_secyear ON t_s_firstyear.customer_id = t_w_secyear.customer_id
WHERE
  t_s_firstyear.sale_type = 's'
  AND t_w_firstyear.sale_type = 'w'
  AND t_s_secyear.sale_type = 's'
  AND t_w_secyear.sale_type = 'w'
  AND t_s_firstyear.dyear = 2001
  AND t_s_secyear.dyear = 2001 + 1
  AND t_w_firstyear.dyear = 2001
  AND t_w_secyear.dyear = 2001 + 1
  AND t_s_firstyear.year_total > 0
  AND t_w_firstyear.year_total > 0
  AND CASE
    WHEN t_w_firstyear.year_total > 0
    THEN t_w_secyear.year_total / t_w_firstyear.year_total
    ELSE 0.0
  END > CASE
    WHEN t_s_firstyear.year_total > 0
    THEN t_s_secyear.year_total / t_s_firstyear.year_total
    ELSE 0.0
  END
ORDER BY
  t_s_secyear.customer_id,
  t_s_secyear.customer_first_name,
  t_s_secyear.customer_last_name,
  t_s_secyear.customer_preferred_cust_flag
OPTION (LABEL = 'TPC-DS Q11');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q12
SELECT TOP 100
  i_item_id,
  i_item_desc,
  i_category,
  i_class,
  i_current_price,
  SUM(ws_ext_sales_price) AS itemrevenue,
  SUM(ws_ext_sales_price) * 100 / SUM(SUM(ws_ext_sales_price)) OVER (PARTITION BY i_class) AS revenueratio
FROM web_sales
JOIN item ON ws_item_sk = i_item_sk
JOIN date_dim ON ws_sold_date_sk = d_date_sk
WHERE
  i_category IN ('Music', 'Sports', 'Children')
  AND d_date BETWEEN CAST('1998-03-14' AS DATE) AND DATEADD(day, 30, CAST('1998-03-14' AS DATE))
GROUP BY
  i_item_id,
  i_item_desc,
  i_category,
  i_class,
  i_current_price
ORDER BY
  i_category,
  i_class,
  i_item_id,
  i_item_desc,
  revenueratio
OPTION (LABEL = 'TPC-DS Q12');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q13
SELECT
  AVG(ss_quantity),
  AVG(ss_ext_sales_price),
  AVG(ss_ext_wholesale_cost),
  SUM(ss_ext_wholesale_cost)
FROM store_sales
JOIN store ON s_store_sk = ss_store_sk
JOIN customer_demographics ON cd_demo_sk = ss_cdemo_sk
JOIN household_demographics ON ss_hdemo_sk = hd_demo_sk
JOIN customer_address ON ss_addr_sk = ca_address_sk
JOIN date_dim ON ss_sold_date_sk = d_date_sk
WHERE
  d_year = 2001
  AND (
    (
      cd_marital_status = 'W'
      AND cd_education_status = 'College'
      AND ss_sales_price BETWEEN 100.00 AND 150.00
      AND hd_dep_count = 3
    )
    OR (
      cd_marital_status = 'M'
      AND cd_education_status = 'Secondary'
      AND ss_sales_price BETWEEN 50.00 AND 100.00
      AND hd_dep_count = 1
    )
    OR (
      cd_marital_status = 'U'
      AND cd_education_status = 'Primary'
      AND ss_sales_price BETWEEN 150.00 AND 200.00
      AND hd_dep_count = 1
    )
  )
  AND (
    (
      ca_country = 'United States'
      AND ca_state IN ('KS', 'MT', 'NE')
      AND ss_net_profit BETWEEN 100 AND 200
    )
    OR (
      ca_country = 'United States'
      AND ca_state IN ('OH', 'NY', 'TN')
      AND ss_net_profit BETWEEN 150 AND 300
    )
    OR (
      ca_country = 'United States'
      AND ca_state IN ('PA', 'GA', 'MI')
      AND ss_net_profit BETWEEN 50 AND 250
    )
  )
OPTION (LABEL = 'TPC-DS Q13');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q14A
WITH cross_items AS (
  SELECT
    i_item_sk AS ss_item_sk
  FROM item
  JOIN (
    SELECT
      iss.i_brand_id AS brand_id,
      iss.i_class_id AS class_id,
      iss.i_category_id AS category_id
    FROM store_sales
    JOIN item AS iss ON ss_item_sk = iss.i_item_sk
    JOIN date_dim AS d1 ON ss_sold_date_sk = d1.d_date_sk
    WHERE d1.d_year BETWEEN 1999 AND 1999 + 2
    INTERSECT
    SELECT
      ics.i_brand_id,
      ics.i_class_id,
      ics.i_category_id
    FROM catalog_sales
    JOIN item AS ics ON cs_item_sk = ics.i_item_sk
    JOIN date_dim AS d2 ON cs_sold_date_sk = d2.d_date_sk
    WHERE d2.d_year BETWEEN 1999 AND 1999 + 2
    INTERSECT
    SELECT
      iws.i_brand_id,
      iws.i_class_id,
      iws.i_category_id
    FROM web_sales
    JOIN item AS iws ON ws_item_sk = iws.i_item_sk
    JOIN date_dim AS d3 ON ws_sold_date_sk = d3.d_date_sk
    WHERE d3.d_year BETWEEN 1999 AND 1999 + 2
  ) AS subquery
  ON item.i_brand_id = subquery.brand_id AND item.i_class_id = subquery.class_id AND item.i_category_id = subquery.category_id
), avg_sales AS (
  SELECT
    AVG(quantity * list_price) AS average_sales
  FROM (
    SELECT
      ss_quantity AS quantity,
      ss_list_price AS list_price
    FROM store_sales
    JOIN date_dim ON ss_sold_date_sk = d_date_sk
    WHERE d_year BETWEEN 1999 AND 1999 + 2
    UNION ALL
    SELECT
      cs_quantity AS quantity,
      cs_list_price AS list_price
    FROM catalog_sales
    JOIN date_dim ON cs_sold_date_sk = d_date_sk
    WHERE d_year BETWEEN 1999 AND 1999 + 2
    UNION ALL
    SELECT
      ws_quantity AS quantity,
      ws_list_price AS list_price
    FROM web_sales
    JOIN date_dim ON ws_sold_date_sk = d_date_sk
    WHERE d_year BETWEEN 1999 AND 1999 + 2
  ) AS x
)
SELECT TOP 100
  channel,
  i_brand_id,
  i_class_id,
  i_category_id,
  SUM(sales),
  SUM(number_sales)
FROM (
  SELECT
    'store' AS channel,
    i_brand_id,
    i_class_id,
    i_category_id,
    SUM(ss_quantity * ss_list_price) AS sales,
    COUNT(*) AS number_sales
  FROM store_sales
  JOIN item ON ss_item_sk = i_item_sk
  JOIN date_dim ON ss_sold_date_sk = d_date_sk
  WHERE
    ss_item_sk IN (
      SELECT
        ss_item_sk
      FROM cross_items
    )
    AND d_year = 1999 + 2
    AND d_moy = 11
  GROUP BY
    i_brand_id,
    i_class_id,
    i_category_id
  HAVING
    SUM(ss_quantity * ss_list_price) > (
      SELECT
        average_sales
      FROM avg_sales
    )
  UNION ALL
  SELECT
    'catalog' AS channel,
    i_brand_id,
    i_class_id,
    i_category_id,
    SUM(cs_quantity * cs_list_price) AS sales,
    COUNT(*) AS number_sales
  FROM catalog_sales
  JOIN item ON cs_item_sk = i_item_sk
  JOIN date_dim ON cs_sold_date_sk = d_date_sk
  WHERE
    cs_item_sk IN (
      SELECT
        ss_item_sk
      FROM cross_items
    )
    AND d_year = 1999 + 2
    AND d_moy = 11
  GROUP BY
    i_brand_id,
    i_class_id,
    i_category_id
  HAVING
    SUM(cs_quantity * cs_list_price) > (
      SELECT
        average_sales
      FROM avg_sales
    )
  UNION ALL
  SELECT
    'web' AS channel,
    i_brand_id,
    i_class_id,
    i_category_id,
    SUM(ws_quantity * ws_list_price) AS sales,
    COUNT(*) AS number_sales
  FROM web_sales
  JOIN item ON ws_item_sk = i_item_sk
  JOIN date_dim ON ws_sold_date_sk = d_date_sk
  WHERE
    ws_item_sk IN (
      SELECT
        ss_item_sk
      FROM cross_items
    )
    AND d_year = 1999 + 2
    AND d_moy = 11
  GROUP BY
    i_brand_id,
    i_class_id,
    i_category_id
  HAVING
    SUM(ws_quantity * ws_list_price) > (
      SELECT
        average_sales
      FROM avg_sales
    )
) AS y
GROUP BY
ROLLUP (
  channel,
  i_brand_id,
  i_class_id,
  i_category_id
)
ORDER BY
  channel,
  i_brand_id,
  i_class_id,
  i_category_id
OPTION (LABEL = 'TPC-DS Q14A');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q14B
WITH cross_items AS (
  SELECT
    i_item_sk AS ss_item_sk
  FROM item
  JOIN (
    SELECT
      iss.i_brand_id AS brand_id,
      iss.i_class_id AS class_id,
      iss.i_category_id AS category_id
    FROM store_sales
    JOIN item AS iss ON ss_item_sk = iss.i_item_sk
    JOIN date_dim AS d1 ON ss_sold_date_sk = d1.d_date_sk
    WHERE d1.d_year BETWEEN 1999 AND 1999 + 2
    INTERSECT
    SELECT
      ics.i_brand_id,
      ics.i_class_id,
      ics.i_category_id
    FROM catalog_sales
    JOIN item AS ics ON cs_item_sk = ics.i_item_sk
    JOIN date_dim AS d2 ON cs_sold_date_sk = d2.d_date_sk
    WHERE d2.d_year BETWEEN 1999 AND 1999 + 2
    INTERSECT
    SELECT
      iws.i_brand_id,
      iws.i_class_id,
      iws.i_category_id
    FROM web_sales
    JOIN item AS iws ON ws_item_sk = iws.i_item_sk
    JOIN date_dim AS d3 ON ws_sold_date_sk = d3.d_date_sk
    WHERE d3.d_year BETWEEN 1999 AND 1999 + 2
  ) AS x ON i_brand_id = brand_id AND i_class_id = class_id AND i_category_id = category_id
), avg_sales AS (
  SELECT
    AVG(quantity * list_price) AS average_sales
  FROM (
    SELECT
      ss_quantity AS quantity,
      ss_list_price AS list_price
    FROM store_sales
    JOIN date_dim ON ss_sold_date_sk = d_date_sk
    WHERE d_year BETWEEN 1999 AND 1999 + 2
    UNION ALL
    SELECT
      cs_quantity AS quantity,
      cs_list_price AS list_price
    FROM catalog_sales
    JOIN date_dim ON cs_sold_date_sk = d_date_sk
    WHERE d_year BETWEEN 1999 AND 1999 + 2
    UNION ALL
    SELECT
      ws_quantity AS quantity,
      ws_list_price AS list_price
    FROM web_sales
    JOIN date_dim ON ws_sold_date_sk = d_date_sk
    WHERE d_year BETWEEN 1999 AND 1999 + 2
  ) AS x
)
SELECT TOP 100
  this_year.channel AS ty_channel,
  this_year.i_brand_id AS ty_brand,
  this_year.i_class_id AS ty_class,
  this_year.i_category_id AS ty_category,
  this_year.sales AS ty_sales,
  this_year.number_sales AS ty_number_sales,
  last_year.channel AS ly_channel,
  last_year.i_brand_id AS ly_brand,
  last_year.i_class_id AS ly_class,
  last_year.i_category_id AS ly_category,
  last_year.sales AS ly_sales,
  last_year.number_sales AS ly_number_sales
FROM (
  SELECT
    'store' AS channel,
    i_brand_id,
    i_class_id,
    i_category_id,
    SUM(ss_quantity * ss_list_price) AS sales,
    COUNT(*) AS number_sales
  FROM store_sales
  JOIN item ON ss_item_sk = i_item_sk
  JOIN date_dim ON ss_sold_date_sk = d_date_sk
  WHERE
    ss_item_sk IN (
      SELECT
        ss_item_sk
      FROM cross_items
    )
    AND d_week_seq = (
      SELECT
        d_week_seq
      FROM date_dim
      WHERE
        d_year = 1999 + 1 AND d_moy = 12 AND d_dom = 1
    )
  GROUP BY
    i_brand_id,
    i_class_id,
    i_category_id
  HAVING
    SUM(ss_quantity * ss_list_price) > (
      SELECT
        average_sales
      FROM avg_sales
    )
) AS this_year
JOIN (
  SELECT
    'store' AS channel,
    i_brand_id,
    i_class_id,
    i_category_id,
    SUM(ss_quantity * ss_list_price) AS sales,
    COUNT(*) AS number_sales
  FROM store_sales
  JOIN item ON ss_item_sk = i_item_sk
  JOIN date_dim ON ss_sold_date_sk = d_date_sk
  WHERE
    ss_item_sk IN (
      SELECT
        ss_item_sk
      FROM cross_items
    )
    AND d_week_seq = (
      SELECT
        d_week_seq
      FROM date_dim
      WHERE
        d_year = 1999 AND d_moy = 12 AND d_dom = 1
    )
  GROUP BY
    i_brand_id,
    i_class_id,
    i_category_id
  HAVING
    SUM(ss_quantity * ss_list_price) > (
      SELECT
        average_sales
      FROM avg_sales
    )
) AS last_year ON this_year.i_brand_id = last_year.i_brand_id
  AND this_year.i_class_id = last_year.i_class_id
  AND this_year.i_category_id = last_year.i_category_id
ORDER BY
  this_year.channel,
  this_year.i_brand_id,
  this_year.i_class_id,
  this_year.i_category_id
OPTION (LABEL = 'TPC-DS Q14B');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q15
SELECT TOP 100
  ca_zip,
  SUM(cs_sales_price)
FROM catalog_sales
JOIN customer ON cs_bill_customer_sk = c_customer_sk
JOIN customer_address ON c_current_addr_sk = ca_address_sk
JOIN date_dim ON cs_sold_date_sk = d_date_sk
WHERE
  (
    SUBSTRING(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348', '81792')
    OR ca_state IN ('CA', 'WA', 'GA')
    OR cs_sales_price > 500
  )
  AND d_qoy = 1
  AND d_year = 2000
GROUP BY
  ca_zip
ORDER BY
  ca_zip
OPTION (LABEL = 'TPC-DS Q15');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q16
SELECT TOP 100
  COUNT(DISTINCT cs1.cs_order_number) AS [order count],
  SUM(cs1.cs_ext_ship_cost) AS [total shipping cost],
  SUM(cs1.cs_net_profit) AS [total net profit]
FROM catalog_sales AS cs1
JOIN date_dim ON cs1.cs_ship_date_sk = date_dim.d_date_sk
JOIN customer_address ON cs1.cs_ship_addr_sk = customer_address.ca_address_sk
JOIN call_center ON cs1.cs_call_center_sk = call_center.cc_call_center_sk
WHERE
  date_dim.d_date BETWEEN '2000-02-01' AND DATEADD(day, 60, CAST('2000-02-01' AS DATE))
  AND customer_address.ca_state = 'ND'
  AND call_center.cc_county IN ('Mobile County', 'Huron County', 'San Miguel County', 'Bronx County', 'Jefferson Davis Parish')
  AND EXISTS(
    SELECT
      1
    FROM catalog_sales AS cs2
    WHERE
      cs1.cs_order_number = cs2.cs_order_number
      AND cs1.cs_warehouse_sk <> cs2.cs_warehouse_sk
  )
  AND NOT EXISTS(
    SELECT
      1
    FROM catalog_returns AS cr1
    WHERE
      cs1.cs_order_number = cr1.cr_order_number
  )
ORDER BY
  COUNT(DISTINCT cs1.cs_order_number)
OPTION (LABEL = 'TPC-DS Q16');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q17
SELECT TOP 100
  i_item_id,
  i_item_desc,
  s_state,
  COUNT(ss_quantity) AS store_sales_quantitycount,
  AVG(ss_quantity) AS store_sales_quantityave,
  STDDEV(ss_quantity) AS store_sales_quantitystdev,
  STDDEV(ss_quantity) / AVG(ss_quantity) AS store_sales_quantitycov,
  COUNT(sr_return_quantity) AS store_returns_quantitycount,
  AVG(sr_return_quantity) AS store_returns_quantityave,
  STDDEV(sr_return_quantity) AS store_returns_quantitystdev,
  STDDEV(sr_return_quantity) / AVG(sr_return_quantity) AS store_returns_quantitycov,
  COUNT(cs_quantity) AS catalog_sales_quantitycount,
  AVG(cs_quantity) AS catalog_sales_quantityave,
  STDDEV(cs_quantity) AS catalog_sales_quantitystdev,
  STDDEV(cs_quantity) / AVG(cs_quantity) AS catalog_sales_quantitycov
FROM store_sales
JOIN store ON s_store_sk = ss_store_sk
JOIN item ON i_item_sk = ss_item_sk
JOIN date_dim AS d1 ON d1.d_date_sk = ss_sold_date_sk
JOIN store_returns ON ss_customer_sk = sr_customer_sk
  AND ss_item_sk = sr_item_sk
  AND ss_ticket_number = sr_ticket_number
JOIN date_dim AS d2 ON sr_returned_date_sk = d2.d_date_sk
JOIN catalog_sales ON sr_customer_sk = cs_bill_customer_sk
  AND sr_item_sk = cs_item_sk
JOIN date_dim AS d3 ON cs_sold_date_sk = d3.d_date_sk
WHERE
  d1.d_quarter_name = '1999Q1'
  AND d2.d_quarter_name IN ('1999Q1', '1999Q2', '1999Q3')
  AND d3.d_quarter_name IN ('1999Q1', '1999Q2', '1999Q3')
GROUP BY
  i_item_id,
  i_item_desc,
  s_state
ORDER BY
  i_item_id,
  i_item_desc,
  s_state
OPTION (LABEL = 'TPC-DS Q17');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q18
SELECT TOP 100
  i_item_id,
  ca_country,
  ca_state,
  ca_county,
  AVG(CAST(cs_quantity AS DECIMAL(12, 2))) AS agg1,
  AVG(CAST(cs_list_price AS DECIMAL(12, 2))) AS agg2,
  AVG(CAST(cs_coupon_amt AS DECIMAL(12, 2))) AS agg3,
  AVG(CAST(cs_sales_price AS DECIMAL(12, 2))) AS agg4,
  AVG(CAST(cs_net_profit AS DECIMAL(12, 2))) AS agg5,
  AVG(CAST(c_birth_year AS DECIMAL(12, 2))) AS agg6,
  AVG(CAST(cd1.cd_dep_count AS DECIMAL(12, 2))) AS agg7
FROM catalog_sales
JOIN customer_demographics AS cd1 ON cs_bill_cdemo_sk = cd1.cd_demo_sk
JOIN customer_demographics AS cd2 ON cs_bill_cdemo_sk = cd2.cd_demo_sk
JOIN customer ON cs_bill_customer_sk = c_customer_sk
JOIN customer_address ON c_current_addr_sk = ca_address_sk
JOIN date_dim ON cs_sold_date_sk = d_date_sk
JOIN item ON cs_item_sk = i_item_sk
WHERE
  cd1.cd_gender = 'M'
  AND cd1.cd_education_status = 'Primary'
  AND c_birth_month IN (4, 6, 8, 11, 2, 12)
  AND d_year = 2001
  AND ca_state IN ('NE', 'PA', 'RI', 'TX', 'MN', 'KY', 'ID')
GROUP BY
ROLLUP (
  i_item_id,
  ca_country,
  ca_state,
  ca_county
)
ORDER BY
  ca_country,
  ca_state,
  ca_county,
  i_item_id
OPTION (LABEL = 'TPC-DS Q18');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q19
SELECT TOP 100
  i_brand_id AS brand_id,
  i_brand AS brand,
  i_manufact_id,
  i_manufact,
  SUM(ss_ext_sales_price) AS ext_price
FROM store_sales
JOIN date_dim ON d_date_sk = ss_sold_date_sk
JOIN item ON ss_item_sk = i_item_sk
JOIN customer ON ss_customer_sk = c_customer_sk
JOIN customer_address ON c_current_addr_sk = ca_address_sk
JOIN store ON ss_store_sk = s_store_sk
WHERE
  i_manager_id = 26
  AND d_moy = 11
  AND d_year = 2002
  AND SUBSTRING(ca_zip, 1, 5) <> SUBSTRING(s_zip, 1, 5)
GROUP BY
  i_brand,
  i_brand_id,
  i_manufact_id,
  i_manufact
ORDER BY
  ext_price DESC,
  i_brand,
  i_brand_id,
  i_manufact_id,
  i_manufact
OPTION (LABEL = 'TPC-DS Q19');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q20
SELECT TOP 100
  i_item_id,
  i_item_desc,
  i_category,
  i_class,
  i_current_price,
  SUM(cs_ext_sales_price) AS itemrevenue,
  SUM(cs_ext_sales_price) * 100 / SUM(SUM(cs_ext_sales_price)) OVER (PARTITION BY i_class) AS revenueratio
FROM catalog_sales
JOIN item ON cs_item_sk = i_item_sk
JOIN date_dim ON cs_sold_date_sk = d_date_sk
WHERE
  i_category IN ('Music', 'Sports', 'Children')
  AND d_date BETWEEN CAST('1998-03-14' AS DATE) AND DATEADD(day, 30, CAST('1998-03-14' AS DATE))
GROUP BY
  i_item_id,
  i_item_desc,
  i_category,
  i_class,
  i_current_price
ORDER BY
  i_category,
  i_class,
  i_item_id,
  i_item_desc,
  revenueratio
OPTION (LABEL = 'TPC-DS Q20');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q21
SELECT TOP 100
  *
FROM (
  SELECT
    w_warehouse_name,
    i_item_id,
    SUM(
      CASE
        WHEN (
          CAST(d_date AS DATE) < CAST('1999-02-01' AS DATE)
        )
        THEN inv_quantity_on_hand
        ELSE 0
      END
    ) AS inv_before,
    SUM(
      CASE
        WHEN (
          CAST(d_date AS DATE) >= CAST('1999-02-01' AS DATE)
        )
        THEN inv_quantity_on_hand
        ELSE 0
      END
    ) AS inv_after
  FROM inventory
  JOIN warehouse ON inv_warehouse_sk = w_warehouse_sk
  JOIN item ON i_item_sk = inv_item_sk
  JOIN date_dim ON inv_date_sk = d_date_sk
  WHERE
    i_current_price BETWEEN 0.99 AND 1.49
    AND d_date BETWEEN
      DATEADD(day, -30, CAST('1999-02-01' AS DATE)) AND
      DATEADD(day, 30, CAST('1999-02-01' AS DATE))
  GROUP BY
    w_warehouse_name,
    i_item_id
) AS x
WHERE
  (
    CASE WHEN inv_before > 0 THEN inv_after / inv_before ELSE NULL END
  ) BETWEEN 2.0 / 3.0 AND 3.0 / 2.0
ORDER BY
  w_warehouse_name,
  i_item_id
OPTION (LABEL = 'TPC-DS Q21');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q22
SELECT TOP 100
  i_product_name,
  i_brand,
  i_class,
  i_category,
  AVG(CAST(inv_quantity_on_hand AS BIGINT)) AS qoh
FROM inventory
JOIN date_dim ON inv_date_sk = d_date_sk
JOIN item ON inv_item_sk = i_item_sk
WHERE d_month_seq BETWEEN 1183 AND 1183 + 11
GROUP BY
ROLLUP (
  i_product_name,
  i_brand,
  i_class,
  i_category
)
ORDER BY
  qoh,
  i_product_name,
  i_brand,
  i_class,
  i_category
OPTION (LABEL = 'TPC-DS Q22');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q23A
WITH frequent_ss_items AS (
  SELECT
    SUBSTRING(i_item_desc, 1, 30) AS itemdesc,
    i_item_sk AS item_sk,
    d_date AS solddate,
    COUNT(*) AS cnt
  FROM store_sales
  JOIN date_dim ON ss_sold_date_sk = d_date_sk
  JOIN item ON ss_item_sk = i_item_sk
  WHERE d_year IN (1998, 1998 + 1, 1998 + 2, 1998 + 3)
  GROUP BY
    SUBSTRING(i_item_desc, 1, 30),
    i_item_sk,
    d_date
  HAVING
    COUNT(*) > 4
), max_store_sales AS (
  SELECT
    MAX(csales) AS tpcds_cmax
  FROM (
    SELECT
      c_customer_sk,
      SUM(ss_quantity * ss_sales_price) AS csales
    FROM store_sales
    JOIN customer ON ss_customer_sk = c_customer_sk
    JOIN date_dim ON ss_sold_date_sk = d_date_sk
    WHERE d_year IN (1998, 1998 + 1, 1998 + 2, 1998 + 3)
    GROUP BY
      c_customer_sk
  )
), best_ss_customer AS (
  SELECT
    c_customer_sk,
    SUM(ss_quantity * ss_sales_price) AS ssales
  FROM store_sales
  JOIN customer ON ss_customer_sk = c_customer_sk
  GROUP BY
    c_customer_sk
  HAVING
    SUM(ss_quantity * ss_sales_price) > (
      95 / 100.0
    ) * (
      SELECT
        *
      FROM max_store_sales
    )
)
SELECT TOP 100
  SUM(sales)
FROM (
  SELECT
    cs_quantity * cs_list_price AS sales
  FROM catalog_sales
  JOIN date_dim ON cs_sold_date_sk = d_date_sk
  WHERE
    d_year = 1998
    AND d_moy = 2
    AND cs_item_sk IN (
      SELECT
        item_sk
      FROM frequent_ss_items
    )
    AND cs_bill_customer_sk IN (
      SELECT
        c_customer_sk
      FROM best_ss_customer
    )
  UNION ALL
  SELECT
    ws_quantity * ws_list_price AS sales
  FROM web_sales
  JOIN date_dim ON ws_sold_date_sk = d_date_sk
  WHERE
    d_year = 1998
    AND d_moy = 2
    AND ws_item_sk IN (
      SELECT
        item_sk
      FROM frequent_ss_items
    )
    AND ws_bill_customer_sk IN (
      SELECT
        c_customer_sk
      FROM best_ss_customer
    )
)
OPTION (LABEL = 'TPC-DS Q23A');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q23B
WITH frequent_ss_items AS (
  SELECT
    SUBSTRING(i_item_desc, 1, 30) AS itemdesc,
    i_item_sk AS item_sk,
    d_date AS solddate,
    COUNT(*) AS cnt
  FROM store_sales
  JOIN date_dim ON ss_sold_date_sk = d_date_sk
  JOIN item ON ss_item_sk = i_item_sk
  WHERE d_year IN (1998, 1998 + 1, 1998 + 2, 1998 + 3)
  GROUP BY
    SUBSTRING(i_item_desc, 1, 30),
    i_item_sk,
    d_date
  HAVING COUNT(*) > 4
), max_store_sales AS (
  SELECT
    MAX(csales) AS tpcds_cmax
  FROM (
    SELECT
      c_customer_sk,
      SUM(ss_quantity * ss_sales_price) AS csales
    FROM store_sales
    JOIN customer ON ss_customer_sk = c_customer_sk
    JOIN date_dim ON ss_sold_date_sk = d_date_sk
    WHERE d_year IN (1998, 1998 + 1, 1998 + 2, 1998 + 3)
    GROUP BY c_customer_sk
  )
), best_ss_customer AS (
  SELECT
    c_customer_sk,
    SUM(ss_quantity * ss_sales_price) AS ssales
  FROM store_sales
  JOIN customer ON ss_customer_sk = c_customer_sk
  GROUP BY c_customer_sk
  HAVING SUM(ss_quantity * ss_sales_price) > (
    95 / 100.0
  ) * (
    SELECT * FROM max_store_sales
  )
)
SELECT TOP 100
  c_last_name,
  c_first_name,
  sales
FROM (
  SELECT
    c_last_name,
    c_first_name,
    SUM(cs_quantity * cs_list_price) AS sales
  FROM catalog_sales
  JOIN customer ON cs_bill_customer_sk = c_customer_sk
  JOIN date_dim ON cs_sold_date_sk = d_date_sk
  WHERE
    d_year = 1998
    AND d_moy = 2
    AND cs_item_sk IN (
      SELECT item_sk FROM frequent_ss_items
    )
    AND cs_bill_customer_sk IN (
      SELECT c_customer_sk FROM best_ss_customer
    )
  GROUP BY c_last_name, c_first_name
  UNION ALL
  SELECT
    c_last_name,
    c_first_name,
    SUM(ws_quantity * ws_list_price) AS sales
  FROM web_sales
  JOIN customer ON ws_bill_customer_sk = c_customer_sk
  JOIN date_dim ON ws_sold_date_sk = d_date_sk
  WHERE
    d_year = 1998
    AND d_moy = 2
    AND ws_item_sk IN (
      SELECT item_sk FROM frequent_ss_items
    )
    AND ws_bill_customer_sk IN (
      SELECT c_customer_sk FROM best_ss_customer
    )
  GROUP BY c_last_name, c_first_name
)
ORDER BY
  c_last_name,
  c_first_name,
  sales
OPTION (LABEL = 'TPC-DS Q23B');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q24A
WITH ssales AS (
  SELECT
    c_last_name,
    c_first_name,
    s_store_name,
    ca_state,
    s_state,
    i_color,
    i_current_price,
    i_manager_id,
    i_units,
    i_size,
    SUM(ss_sales_price) AS netpaid
  FROM store_sales
  JOIN store_returns ON ss_ticket_number = sr_ticket_number AND ss_item_sk = sr_item_sk
  JOIN store ON ss_store_sk = s_store_sk
  JOIN item ON ss_item_sk = i_item_sk
  JOIN customer ON ss_customer_sk = c_customer_sk
  JOIN customer_address ON c_current_addr_sk = ca_address_sk
  WHERE
    c_birth_country <> UPPER(ca_country)
    AND s_zip = ca_zip
    AND s_market_id = 8
  GROUP BY
    c_last_name,
    c_first_name,
    s_store_name,
    ca_state,
    s_state,
    i_color,
    i_current_price,
    i_manager_id,
    i_units,
    i_size
)
SELECT
  c_last_name,
  c_first_name,
  s_store_name,
  SUM(netpaid) AS paid
FROM ssales
WHERE
  i_color = 'violet'
GROUP BY
  c_last_name,
  c_first_name,
  s_store_name
HAVING
  SUM(netpaid) > (
    SELECT
      0.05 * AVG(netpaid)
    FROM ssales
  )
ORDER BY
  c_last_name,
  c_first_name,
  s_store_name
OPTION (LABEL = 'TPC-DS Q24A');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q24B
WITH ssales AS (
  SELECT
    c_last_name,
    c_first_name,
    s_store_name,
    ca_state,
    s_state,
    i_color,
    i_current_price,
    i_manager_id,
    i_units,
    i_size,
    SUM(ss_sales_price) AS netpaid
  FROM store_sales
  JOIN store_returns ON ss_ticket_number = sr_ticket_number AND ss_item_sk = sr_item_sk
  JOIN store ON ss_store_sk = s_store_sk
  JOIN item ON ss_item_sk = i_item_sk
  JOIN customer ON ss_customer_sk = c_customer_sk
  JOIN customer_address ON c_current_addr_sk = ca_address_sk
  WHERE
    c_birth_country <> UPPER(ca_country)
    AND s_zip = ca_zip
    AND s_market_id = 8
  GROUP BY
    c_last_name,
    c_first_name,
    s_store_name,
    ca_state,
    s_state,
    i_color,
    i_current_price,
    i_manager_id,
    i_units,
    i_size
)
SELECT
  c_last_name,
  c_first_name,
  s_store_name,
  SUM(netpaid) AS paid
FROM ssales
WHERE
  i_color = 'floral'
GROUP BY
  c_last_name,
  c_first_name,
  s_store_name
HAVING
  SUM(netpaid) > (
    SELECT
      0.05 * AVG(netpaid)
    FROM ssales
  )
ORDER BY
  c_last_name,
  c_first_name,
  s_store_name
OPTION (LABEL = 'TPC-DS Q24B');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q25
SELECT TOP 100
  i_item_id,
  i_item_desc,
  s_store_id,
  s_store_name,
  MIN(ss_net_profit) AS store_sales_profit,
  MIN(sr_net_loss) AS store_returns_loss,
  MIN(cs_net_profit) AS catalog_sales_profit
FROM store_sales
JOIN store ON s_store_sk = ss_store_sk
JOIN item ON i_item_sk = ss_item_sk
JOIN date_dim AS d1 ON d1.d_date_sk = ss_sold_date_sk
JOIN store_returns ON ss_customer_sk = sr_customer_sk
  AND ss_item_sk = sr_item_sk
  AND ss_ticket_number = sr_ticket_number
JOIN date_dim AS d2 ON sr_returned_date_sk = d2.d_date_sk
JOIN catalog_sales ON sr_customer_sk = cs_bill_customer_sk
  AND sr_item_sk = cs_item_sk
JOIN date_dim AS d3 ON cs_sold_date_sk = d3.d_date_sk
WHERE
  d1.d_moy = 4
  AND d1.d_year = 2000
  AND d2.d_moy BETWEEN 4 AND 10
  AND d2.d_year = 2000
  AND d3.d_moy BETWEEN 4 AND 10
  AND d3.d_year = 2000
GROUP BY
  i_item_id,
  i_item_desc,
  s_store_id,
  s_store_name
ORDER BY
  i_item_id,
  i_item_desc,
  s_store_id,
  s_store_name
OPTION (LABEL = 'TPC-DS Q25');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q26
SELECT TOP 100
  i_item_id,
  AVG(cs_quantity) AS agg1,
  AVG(cs_list_price) AS agg2,
  AVG(cs_coupon_amt) AS agg3,
  AVG(cs_sales_price) AS agg4
FROM catalog_sales
JOIN date_dim ON cs_sold_date_sk = d_date_sk
JOIN item ON cs_item_sk = i_item_sk
JOIN customer_demographics ON cs_bill_cdemo_sk = cd_demo_sk
JOIN promotion ON cs_promo_sk = p_promo_sk
WHERE
  cd_gender = 'M'
  AND cd_marital_status = 'D'
  AND cd_education_status = 'Secondary'
  AND (
    p_channel_email = 'N' OR p_channel_event = 'N'
  )
  AND d_year = 1999
GROUP BY
  i_item_id
ORDER BY
  i_item_id
OPTION (LABEL = 'TPC-DS Q26');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q27
SELECT TOP 100
  i_item_id,
  s_state,
  GROUPING(s_state) AS g_state,
  AVG(ss_quantity) AS agg1,
  AVG(ss_list_price) AS agg2,
  AVG(ss_coupon_amt) AS agg3,
  AVG(ss_sales_price) AS agg4
FROM store_sales
JOIN date_dim ON ss_sold_date_sk = d_date_sk
JOIN item ON ss_item_sk = i_item_sk
JOIN store ON ss_store_sk = s_store_sk
JOIN customer_demographics ON ss_cdemo_sk = cd_demo_sk
WHERE
  cd_gender = 'M'
  AND cd_marital_status = 'S'
  AND cd_education_status = '2 yr Degree'
  AND d_year = 1999
  AND s_state IN ('AL', 'MI', 'NM', 'NY', 'LA', 'GA')
GROUP BY
ROLLUP (
  i_item_id,
  s_state
)
ORDER BY
  i_item_id,
  s_state
OPTION (LABEL = 'TPC-DS Q27');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q28
SELECT TOP 100
  *
FROM (
  SELECT
    AVG(ss_list_price) AS B1_LP,
    COUNT(ss_list_price) AS B1_CNT,
    COUNT(DISTINCT ss_list_price) AS B1_CNTD
  FROM store_sales
  WHERE
    ss_quantity BETWEEN 0 AND 5
    AND (
      ss_list_price BETWEEN 190 AND 190 + 10
      OR ss_coupon_amt BETWEEN 55 AND 55 + 1000
      OR ss_wholesale_cost BETWEEN 42 AND 42 + 20
    )
) AS B1, (
  SELECT
    AVG(ss_list_price) AS B2_LP,
    COUNT(ss_list_price) AS B2_CNT,
    COUNT(DISTINCT ss_list_price) AS B2_CNTD
  FROM store_sales
  WHERE
    ss_quantity BETWEEN 6 AND 10
    AND (
      ss_list_price BETWEEN 115 AND 115 + 10
      OR ss_coupon_amt BETWEEN 7271 AND 7271 + 1000
      OR ss_wholesale_cost BETWEEN 74 AND 74 + 20
    )
) AS B2, (
  SELECT
    AVG(ss_list_price) AS B3_LP,
    COUNT(ss_list_price) AS B3_CNT,
    COUNT(DISTINCT ss_list_price) AS B3_CNTD
  FROM store_sales
  WHERE
    ss_quantity BETWEEN 11 AND 15
    AND (
      ss_list_price BETWEEN 72 AND 72 + 10
      OR ss_coupon_amt BETWEEN 3099 AND 3099 + 1000
      OR ss_wholesale_cost BETWEEN 77 AND 77 + 20
    )
) AS B3, (
  SELECT
    AVG(ss_list_price) AS B4_LP,
    COUNT(ss_list_price) AS B4_CNT,
    COUNT(DISTINCT ss_list_price) AS B4_CNTD
  FROM store_sales
  WHERE
    ss_quantity BETWEEN 16 AND 20
    AND (
      ss_list_price BETWEEN 16 AND 16 + 10
      OR ss_coupon_amt BETWEEN 5099 AND 5099 + 1000
      OR ss_wholesale_cost BETWEEN 70 AND 70 + 20
    )
) AS B4, (
  SELECT
    AVG(ss_list_price) AS B5_LP,
    COUNT(ss_list_price) AS B5_CNT,
    COUNT(DISTINCT ss_list_price) AS B5_CNTD
  FROM store_sales
  WHERE
    ss_quantity BETWEEN 21 AND 25
    AND (
      ss_list_price BETWEEN 149 AND 149 + 10
      OR ss_coupon_amt BETWEEN 7344 AND 7344 + 1000
      OR ss_wholesale_cost BETWEEN 78 AND 78 + 20
    )
) AS B5, (
  SELECT
    AVG(ss_list_price) AS B6_LP,
    COUNT(ss_list_price) AS B6_CNT,
    COUNT(DISTINCT ss_list_price) AS B6_CNTD
  FROM store_sales
  WHERE
    ss_quantity BETWEEN 26 AND 30
    AND (
      ss_list_price BETWEEN 165 AND 165 + 10
      OR ss_coupon_amt BETWEEN 3569 AND 3569 + 1000
      OR ss_wholesale_cost BETWEEN 59 AND 59 + 20
    )
) AS B6
OPTION (LABEL = 'TPC-DS Q28');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q29
SELECT TOP 100
  i_item_id,
  i_item_desc,
  s_store_id,
  s_store_name,
  MIN(ss_quantity) AS store_sales_quantity,
  MIN(sr_return_quantity) AS store_returns_quantity,
  MIN(cs_quantity) AS catalog_sales_quantity
FROM store_sales
JOIN store_returns ON ss_customer_sk = sr_customer_sk
  AND ss_item_sk = sr_item_sk
  AND ss_ticket_number = sr_ticket_number
JOIN catalog_sales ON sr_customer_sk = cs_bill_customer_sk
  AND sr_item_sk = cs_item_sk
JOIN date_dim AS d1 ON d1.d_date_sk = ss_sold_date_sk
JOIN date_dim AS d2 ON sr_returned_date_sk = d2.d_date_sk
JOIN date_dim AS d3 ON cs_sold_date_sk = d3.d_date_sk
JOIN store ON s_store_sk = ss_store_sk
JOIN item ON i_item_sk = ss_item_sk
WHERE
  d1.d_moy = 4
  AND d1.d_year = 1998
  AND d2.d_moy BETWEEN 4 AND 4 + 3
  AND d2.d_year = 1998
  AND d3.d_year IN (1998, 1998 + 1, 1998 + 2)
GROUP BY
  i_item_id,
  i_item_desc,
  s_store_id,
  s_store_name
ORDER BY
  i_item_id,
  i_item_desc,
  s_store_id,
  s_store_name
OPTION (LABEL = 'TPC-DS Q29');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q30
WITH customer_total_return AS (
  SELECT
    wr_returning_customer_sk AS ctr_customer_sk,
    ca_state AS ctr_state,
    SUM(wr_return_amt) AS ctr_total_return
  FROM web_returns
  JOIN date_dim ON wr_returned_date_sk = d_date_sk
  JOIN customer_address ON wr_returning_addr_sk = ca_address_sk
  WHERE
    d_year = 1999
  GROUP BY
    wr_returning_customer_sk,
    ca_state
)
SELECT TOP 100
  c_customer_id,
  c_salutation,
  c_first_name,
  c_last_name,
  c_preferred_cust_flag,
  c_birth_day,
  c_birth_month,
  c_birth_year,
  c_birth_country,
  c_login,
  c_email_address,
  c_last_review_date_sk,
  ctr_total_return
FROM customer_total_return AS ctr1
JOIN customer ON ctr1.ctr_customer_sk = c_customer_sk
JOIN customer_address ON ca_address_sk = c_current_addr_sk
WHERE
  ctr1.ctr_total_return > (
    SELECT
      AVG(ctr_total_return) * 1.2
    FROM customer_total_return AS ctr2
    WHERE
      ctr1.ctr_state = ctr2.ctr_state
  )
  AND ca_state = 'KY'
ORDER BY
  c_customer_id,
  c_salutation,
  c_first_name,
  c_last_name,
  c_preferred_cust_flag,
  c_birth_day,
  c_birth_month,
  c_birth_year,
  c_birth_country,
  c_login,
  c_email_address,
  c_last_review_date_sk,
  ctr_total_return
OPTION (LABEL = 'TPC-DS Q30');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q31
WITH ss AS (
  SELECT
    ca_county,
    d_qoy,
    d_year,
    SUM(ss_ext_sales_price) AS store_sales
  FROM store_sales
  JOIN date_dim ON ss_sold_date_sk = d_date_sk
  JOIN customer_address ON ss_addr_sk = ca_address_sk
  GROUP BY
    ca_county,
    d_qoy,
    d_year
), ws AS (
  SELECT
    ca_county,
    d_qoy,
    d_year,
    SUM(ws_ext_sales_price) AS web_sales
  FROM web_sales
  JOIN date_dim ON ws_sold_date_sk = d_date_sk
  JOIN customer_address ON ws_bill_addr_sk = ca_address_sk
  GROUP BY
    ca_county,
    d_qoy,
    d_year
)
SELECT
  ss1.ca_county,
  ss1.d_year,
  ws2.web_sales / ws1.web_sales AS web_q1_q2_increase,
  ss2.store_sales / ss1.store_sales AS store_q1_q2_increase,
  ws3.web_sales / ws2.web_sales AS web_q2_q3_increase,
  ss3.store_sales / ss2.store_sales AS store_q2_q3_increase
FROM ss AS ss1
JOIN ss AS ss2 ON ss1.ca_county = ss2.ca_county
JOIN ss AS ss3 ON ss2.ca_county = ss3.ca_county
JOIN ws AS ws1 ON ss1.ca_county = ws1.ca_county
JOIN ws AS ws2 ON ws1.ca_county = ws2.ca_county
JOIN ws AS ws3 ON ws1.ca_county = ws3.ca_county
WHERE
  ss1.d_qoy = 1
  AND ss1.d_year = 2000
  AND ss2.d_qoy = 2
  AND ss2.d_year = 2000
  AND ss3.d_qoy = 3
  AND ss3.d_year = 2000
  AND ws1.d_qoy = 1
  AND ws1.d_year = 2000
  AND ws2.d_qoy = 2
  AND ws2.d_year = 2000
  AND ws3.d_qoy = 3
  AND ws3.d_year = 2000
  AND CASE WHEN ws1.web_sales > 0 THEN ws2.web_sales / ws1.web_sales ELSE NULL END > CASE WHEN ss1.store_sales > 0 THEN ss2.store_sales / ss1.store_sales ELSE NULL END
  AND CASE WHEN ws2.web_sales > 0 THEN ws3.web_sales / ws2.web_sales ELSE NULL END > CASE WHEN ss2.store_sales > 0 THEN ss3.store_sales / ss2.store_sales ELSE NULL END
ORDER BY
  web_q1_q2_increase
OPTION (LABEL = 'TPC-DS Q31');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q32
SELECT TOP 100
  SUM(cs_ext_discount_amt) AS [excess discount amount]
FROM catalog_sales
JOIN item ON i_item_sk = cs_item_sk
JOIN date_dim ON d_date_sk = cs_sold_date_sk
WHERE
  i_manufact_id = 33
  AND d_date BETWEEN '1999-02-10' AND
    DATEADD(day, 90, CAST('1999-02-10' AS DATE))
  AND cs_ext_discount_amt > (
    SELECT
      1.3 * AVG(cs_ext_discount_amt)
    FROM catalog_sales
    JOIN date_dim ON d_date_sk = cs_sold_date_sk
    WHERE
      cs_item_sk = i_item_sk
      AND d_date BETWEEN '1999-02-10' AND
        DATEADD(day, 90, CAST('1999-02-10' AS DATE))
  )
OPTION (LABEL = 'TPC-DS Q32');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q33
WITH ss AS (
  SELECT
    i_manufact_id,
    SUM(ss_ext_sales_price) AS total_sales
  FROM store_sales
  JOIN date_dim ON ss_sold_date_sk = d_date_sk
  JOIN customer_address ON ss_addr_sk = ca_address_sk
  JOIN item ON ss_item_sk = i_item_sk
  WHERE
    i_manufact_id IN (
      SELECT
        i_manufact_id
      FROM item
      WHERE
        i_category IN ('Home')
    )
    AND d_year = 2002
    AND d_moy = 3
    AND ca_gmt_offset = -6
  GROUP BY
    i_manufact_id
), cs AS (
  SELECT
    i_manufact_id,
    SUM(cs_ext_sales_price) AS total_sales
  FROM catalog_sales
  JOIN date_dim ON cs_sold_date_sk = d_date_sk
  JOIN customer_address ON cs_bill_addr_sk = ca_address_sk
  JOIN item ON cs_item_sk = i_item_sk
  WHERE
    i_manufact_id IN (
      SELECT
        i_manufact_id
      FROM item
      WHERE
        i_category IN ('Home')
    )
    AND d_year = 2002
    AND d_moy = 3
    AND ca_gmt_offset = -6
  GROUP BY
    i_manufact_id
), ws AS (
  SELECT
    i_manufact_id,
    SUM(ws_ext_sales_price) AS total_sales
  FROM web_sales
  JOIN item ON ws_item_sk = i_item_sk
  JOIN date_dim ON ws_sold_date_sk = d_date_sk
  JOIN customer_address ON ws_bill_addr_sk = ca_address_sk
  WHERE
    i_manufact_id IN (
      SELECT
        i_manufact_id
      FROM item
      WHERE
        i_category IN ('Home')
    )
    AND d_year = 2002
    AND d_moy = 3
    AND ca_gmt_offset = -6
  GROUP BY
    i_manufact_id
)
SELECT TOP 100
  i_manufact_id,
  SUM(total_sales) AS total_sales
FROM (
  SELECT
    *
  FROM ss
  UNION ALL
  SELECT
    *
  FROM cs
  UNION ALL
  SELECT
    *
  FROM ws
) AS tmp1
GROUP BY
  i_manufact_id
ORDER BY
  total_sales
OPTION (LABEL = 'TPC-DS Q33');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q34
SELECT
  c_last_name,
  c_first_name,
  c_salutation,
  c_preferred_cust_flag,
  ss_ticket_number,
  cnt
FROM (
  SELECT
    ss_ticket_number,
    ss_customer_sk,
    COUNT(*) AS cnt
  FROM store_sales
  JOIN date_dim ON store_sales.ss_sold_date_sk = date_dim.d_date_sk
  JOIN store ON store_sales.ss_store_sk = store.s_store_sk
  JOIN household_demographics ON store_sales.ss_hdemo_sk = household_demographics.hd_demo_sk
  WHERE
    (
      date_dim.d_dom BETWEEN 1 AND 3 OR date_dim.d_dom BETWEEN 25 AND 28
    )
    AND (
      household_demographics.hd_buy_potential = '1001-5000'
      OR household_demographics.hd_buy_potential = '0-500'
    )
    AND household_demographics.hd_vehicle_count > 0
    AND (
      CASE
        WHEN household_demographics.hd_vehicle_count > 0
        THEN household_demographics.hd_dep_count / household_demographics.hd_vehicle_count
        ELSE NULL
      END
    ) > 1.2
    AND date_dim.d_year IN (1998, 1998 + 1, 1998 + 2)
    AND store.s_county IN ('Barrow County', 'Ziebach County', 'Bronx County', 'Franklin Parish', 'Kittitas County', 'Gogebic County', 'Dauphin County', 'Maverick County')
  GROUP BY
    ss_ticket_number,
    ss_customer_sk
) AS dn
JOIN customer ON ss_customer_sk = c_customer_sk
WHERE
  cnt BETWEEN 15 AND 20
ORDER BY
  c_last_name,
  c_first_name,
  c_salutation,
  c_preferred_cust_flag DESC,
  ss_ticket_number
OPTION (LABEL = 'TPC-DS Q34');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q35
SELECT TOP 100
  ca_state,
  cd_gender,
  cd_marital_status,
  cd_dep_count,
  COUNT(*) AS cnt1,
  MAX(cd_dep_count),
  MAX(cd_dep_count),
  MIN(cd_dep_count),
  cd_dep_employed_count,
  COUNT(*) AS cnt2,
  MAX(cd_dep_employed_count),
  MAX(cd_dep_employed_count),
  MIN(cd_dep_employed_count),
  cd_dep_college_count,
  COUNT(*) AS cnt3,
  MAX(cd_dep_college_count),
  MAX(cd_dep_college_count),
  MIN(cd_dep_college_count)
FROM customer AS c
JOIN customer_address AS ca ON c.c_current_addr_sk = ca.ca_address_sk
JOIN customer_demographics ON cd_demo_sk = c.c_current_cdemo_sk
WHERE
  EXISTS(
    SELECT
      *
    FROM store_sales
    JOIN date_dim ON ss_sold_date_sk = d_date_sk
    WHERE
      c.c_customer_sk = ss_customer_sk
      AND d_year = 2000
      AND d_qoy < 4
  )
  AND (
    EXISTS(
      SELECT
        *
      FROM web_sales
      JOIN date_dim ON ws_sold_date_sk = d_date_sk
      WHERE
        c.c_customer_sk = ws_bill_customer_sk
        AND d_year = 2000
        AND d_qoy < 4
    )
    OR EXISTS(
      SELECT
        *
      FROM catalog_sales
      JOIN date_dim ON cs_sold_date_sk = d_date_sk
      WHERE
        c.c_customer_sk = cs_ship_customer_sk
        AND d_year = 2000
        AND d_qoy < 4
    )
  )
GROUP BY
  ca_state,
  cd_gender,
  cd_marital_status,
  cd_dep_count,
  cd_dep_employed_count,
  cd_dep_college_count
ORDER BY
  ca_state,
  cd_gender,
  cd_marital_status,
  cd_dep_count,
  cd_dep_employed_count,
  cd_dep_college_count
OPTION (LABEL = 'TPC-DS Q35');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q36
SELECT TOP 100
  SUM(ss_net_profit) / SUM(ss_ext_sales_price) AS gross_margin,
  i_category,
  i_class,
  GROUPING(i_category) + GROUPING(i_class) AS lochierarchy,
  RANK() OVER (PARTITION BY GROUPING(i_category) + GROUPING(i_class), CASE WHEN GROUPING(i_class) = 0 THEN i_category END ORDER BY SUM(ss_net_profit) / SUM(ss_ext_sales_price) ASC) AS rank_within_parent
FROM store_sales
JOIN date_dim AS d1 ON d1.d_date_sk = ss_sold_date_sk
JOIN item ON i_item_sk = ss_item_sk
JOIN store ON s_store_sk = ss_store_sk
WHERE
  d1.d_year = 2002
  AND s_state IN ('AL', 'MI', 'NM', 'NY', 'LA', 'GA', 'PA', 'MN')
GROUP BY
ROLLUP (
  i_category,
  i_class
)
ORDER BY
  lochierarchy DESC,
  CASE WHEN GROUPING(i_category) + GROUPING(i_class) = 0 THEN i_category END,
  rank_within_parent
OPTION (LABEL = 'TPC-DS Q36');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q37
SELECT TOP 100
  i_item_id,
  i_item_desc,
  i_current_price
FROM item
JOIN inventory ON inv_item_sk = i_item_sk
JOIN date_dim ON d_date_sk = inv_date_sk
JOIN catalog_sales ON cs_item_sk = i_item_sk
WHERE
  i_current_price BETWEEN 60 AND 60 + 30
  AND d_date BETWEEN CAST('2002-03-26' AS DATE) AND
    DATEADD(day, 60, CAST('2002-03-26' AS DATE))
  AND i_manufact_id IN (787, 892, 767, 711)
  AND inv_quantity_on_hand BETWEEN 100 AND 500
GROUP BY
  i_item_id,
  i_item_desc,
  i_current_price
ORDER BY
  i_item_id
OPTION (LABEL = 'TPC-DS Q37');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q38
SELECT TOP 100
  COUNT(*)
FROM (
  SELECT DISTINCT
    c_last_name,
    c_first_name,
    d_date
  FROM store_sales
  JOIN date_dim ON store_sales.ss_sold_date_sk = date_dim.d_date_sk
  JOIN customer ON store_sales.ss_customer_sk = customer.c_customer_sk
  WHERE
    d_month_seq BETWEEN 1183 AND 1183 + 11
  INTERSECT
  SELECT DISTINCT
    c_last_name,
    c_first_name,
    d_date
  FROM catalog_sales
  JOIN date_dim ON catalog_sales.cs_sold_date_sk = date_dim.d_date_sk
  JOIN customer ON catalog_sales.cs_bill_customer_sk = customer.c_customer_sk
  WHERE
    d_month_seq BETWEEN 1183 AND 1183 + 11
  INTERSECT
  SELECT DISTINCT
    c_last_name,
    c_first_name,
    d_date
  FROM web_sales
  JOIN date_dim ON web_sales.ws_sold_date_sk = date_dim.d_date_sk
  JOIN customer ON web_sales.ws_bill_customer_sk = customer.c_customer_sk
  WHERE
    d_month_seq BETWEEN 1183 AND 1183 + 11
) AS hot_cust
OPTION (LABEL = 'TPC-DS Q38');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q39A
WITH inv AS (
  SELECT
    w_warehouse_name,
    w_warehouse_sk,
    i_item_sk,
    d_moy,
    stdev,
    mean,
    CASE mean WHEN 0 THEN NULL ELSE stdev / mean END AS cov
  FROM (
    SELECT
      w_warehouse_name,
      w_warehouse_sk,
      i_item_sk,
      d_moy,
      STDDEV(inv_quantity_on_hand) AS stdev,
      AVG(inv_quantity_on_hand) AS mean
    FROM inventory
    JOIN item ON inv_item_sk = i_item_sk
    JOIN warehouse ON inv_warehouse_sk = w_warehouse_sk
    JOIN date_dim ON inv_date_sk = d_date_sk
    WHERE
      d_year = 1999
    GROUP BY
      w_warehouse_name,
      w_warehouse_sk,
      i_item_sk,
      d_moy
  ) AS foo
  WHERE
    CASE mean WHEN 0 THEN 0 ELSE stdev / mean END > 1
)
SELECT
  inv1.w_warehouse_sk,
  inv1.i_item_sk,
  inv1.d_moy,
  inv1.mean,
  inv1.cov,
  inv2.w_warehouse_sk,
  inv2.i_item_sk,
  inv2.d_moy,
  inv2.mean,
  inv2.cov
FROM inv AS inv1
JOIN inv AS inv2 ON inv1.i_item_sk = inv2.i_item_sk
  AND inv1.w_warehouse_sk = inv2.w_warehouse_sk
WHERE
  inv1.d_moy = 4
  AND inv2.d_moy = 4 + 1
ORDER BY
  inv1.w_warehouse_sk,
  inv1.i_item_sk,
  inv1.d_moy,
  inv1.mean,
  inv1.cov,
  inv2.d_moy,
  inv2.mean,
  inv2.cov
OPTION (LABEL = 'TPC-DS Q39A');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q39B
WITH inv AS (
  SELECT
    w_warehouse_name,
    w_warehouse_sk,
    i_item_sk,
    d_moy,
    stdev,
    mean,
    CASE mean WHEN 0 THEN NULL ELSE stdev / mean END AS cov
  FROM (
    SELECT
      w_warehouse_name,
      w_warehouse_sk,
      i_item_sk,
      d_moy,
      STDDEV(inv_quantity_on_hand) AS stdev,
      AVG(inv_quantity_on_hand) AS mean
    FROM inventory
    JOIN item ON inv_item_sk = i_item_sk
    JOIN warehouse ON inv_warehouse_sk = w_warehouse_sk
    JOIN date_dim ON inv_date_sk = d_date_sk
    WHERE
      d_year = 1999
    GROUP BY
      w_warehouse_name,
      w_warehouse_sk,
      i_item_sk,
      d_moy
  ) AS foo
  WHERE
    CASE mean WHEN 0 THEN 0 ELSE stdev / mean END > 1
)
SELECT
  inv1.w_warehouse_sk,
  inv1.i_item_sk,
  inv1.d_moy,
  inv1.mean,
  inv1.cov,
  inv2.w_warehouse_sk,
  inv2.i_item_sk,
  inv2.d_moy,
  inv2.mean,
  inv2.cov
FROM inv AS inv1
JOIN inv AS inv2 ON inv1.i_item_sk = inv2.i_item_sk
  AND inv1.w_warehouse_sk = inv2.w_warehouse_sk
WHERE
  inv1.d_moy = 4
  AND inv2.d_moy = 4 + 1
  AND inv1.cov > 1.5
ORDER BY
  inv1.w_warehouse_sk,
  inv1.i_item_sk,
  inv1.d_moy,
  inv1.mean,
  inv1.cov,
  inv2.d_moy,
  inv2.mean,
  inv2.cov
OPTION (LABEL = 'TPC-DS Q39B');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q40
SELECT TOP 100
  w_state,
  i_item_id,
  SUM(
    CASE
      WHEN (
        CAST(d_date AS DATE) < CAST('1999-02-01' AS DATE)
      )
      THEN cs_sales_price - COALESCE(cr_refunded_cash, 0)
      ELSE 0
    END
  ) AS sales_before,
  SUM(
    CASE
      WHEN (
        CAST(d_date AS DATE) >= CAST('1999-02-01' AS DATE)
      )
      THEN cs_sales_price - COALESCE(cr_refunded_cash, 0)
      ELSE 0
    END
  ) AS sales_after
FROM catalog_sales
LEFT OUTER JOIN catalog_returns
  ON (
    cs_order_number = cr_order_number AND cs_item_sk = cr_item_sk
  )
JOIN warehouse ON cs_warehouse_sk = w_warehouse_sk
JOIN item ON i_item_sk = cs_item_sk
JOIN date_dim ON cs_sold_date_sk = d_date_sk
WHERE
  i_current_price BETWEEN 0.99 AND 1.49
  AND d_date BETWEEN (
    DATEADD(day, -30, CAST('1999-02-01' AS DATE))
  ) AND (
    DATEADD(day, 30, CAST('1999-02-01' AS DATE))
  )
GROUP BY
  w_state,
  i_item_id
ORDER BY
  w_state,
  i_item_id
OPTION (LABEL = 'TPC-DS Q40');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q41
SELECT DISTINCT
  (
    i_product_name
  )
FROM item AS i1
WHERE
  i_manufact_id BETWEEN 953 AND 953 + 40
  AND (
    SELECT
      COUNT(*) AS item_cnt
    FROM item
    WHERE
      (
        i_manufact = i1.i_manufact
        AND (
          (
            i_category = 'Women'
            AND (
              i_color = 'yellow' OR i_color = 'coral'
            )
            AND (
              i_units = 'Unknown' OR i_units = 'Dozen'
            )
            AND (
              i_size = 'large' OR i_size = 'medium'
            )
          )
          OR (
            i_category = 'Women'
            AND (
              i_color = 'green' OR i_color = 'navajo'
            )
            AND (
              i_units = 'Pound' OR i_units = 'Dram'
            )
            AND (
              i_size = 'economy' OR i_size = 'small'
            )
          )
          OR (
            i_category = 'Men'
            AND (
              i_color = 'violet' OR i_color = 'ivory'
            )
            AND (
              i_units = 'Lb' OR i_units = 'Box'
            )
            AND (
              i_size = 'extra large' OR i_size = 'N/A'
            )
          )
          OR (
            i_category = 'Men'
            AND (
              i_color = 'seashell' OR i_color = 'chartreuse'
            )
            AND (
              i_units = 'Tsp' OR i_units = 'Case'
            )
            AND (
              i_size = 'large' OR i_size = 'medium'
            )
          )
        )
      )
      OR (
        i_manufact = i1.i_manufact
        AND (
          (
            i_category = 'Women'
            AND (
              i_color = 'cornsilk' OR i_color = 'cream'
            )
            AND (
              i_units = 'Tbl' OR i_units = 'Ounce'
            )
            AND (
              i_size = 'large' OR i_size = 'medium'
            )
          )
          OR (
            i_category = 'Women'
            AND (
              i_color = 'red' OR i_color = 'orange'
            )
            AND (
              i_units = 'Bundle' OR i_units = 'Carton'
            )
            AND (
              i_size = 'economy' OR i_size = 'small'
            )
          )
          OR (
            i_category = 'Men'
            AND (
              i_color = 'hot' OR i_color = 'indian'
            )
            AND (
              i_units = 'Ton' OR i_units = 'Oz'
            )
            AND (
              i_size = 'extra large' OR i_size = 'N/A'
            )
          )
          OR (
            i_category = 'Men'
            AND (
              i_color = 'gainsboro' OR i_color = 'peach'
            )
            AND (
              i_units = 'Bunch' OR i_units = 'N/A'
            )
            AND (
              i_size = 'large' OR i_size = 'medium'
            )
          )
        )
      )
  ) > 0
ORDER BY
  i_product_name
OPTION (LABEL = 'TPC-DS Q41');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q42
SELECT TOP 100
  dt.d_year,
  item.i_category_id,
  item.i_category,
  SUM(ss_ext_sales_price)
FROM date_dim AS dt
JOIN store_sales ON dt.d_date_sk = store_sales.ss_sold_date_sk
JOIN item ON store_sales.ss_item_sk = item.i_item_sk
WHERE
  item.i_manager_id = 1
  AND dt.d_moy = 12
  AND dt.d_year = 1999
GROUP BY
  dt.d_year,
  item.i_category_id,
  item.i_category
ORDER BY
  SUM(ss_ext_sales_price) DESC,
  dt.d_year,
  item.i_category_id,
  item.i_category
OPTION (LABEL = 'TPC-DS Q42');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q43
SELECT TOP 100
  s_store_name,
  s_store_id,
  SUM(CASE WHEN (
    d_day_name = 'Sunday'
  ) THEN ss_sales_price ELSE NULL END) AS sun_sales,
  SUM(CASE WHEN (
    d_day_name = 'Monday'
  ) THEN ss_sales_price ELSE NULL END) AS mon_sales,
  SUM(CASE WHEN (
    d_day_name = 'Tuesday'
  ) THEN ss_sales_price ELSE NULL END) AS tue_sales,
  SUM(CASE WHEN (
    d_day_name = 'Wednesday'
  ) THEN ss_sales_price ELSE NULL END) AS wed_sales,
  SUM(CASE WHEN (
    d_day_name = 'Thursday'
  ) THEN ss_sales_price ELSE NULL END) AS thu_sales,
  SUM(CASE WHEN (
    d_day_name = 'Friday'
  ) THEN ss_sales_price ELSE NULL END) AS fri_sales,
  SUM(CASE WHEN (
    d_day_name = 'Saturday'
  ) THEN ss_sales_price ELSE NULL END) AS sat_sales
FROM date_dim
JOIN store_sales ON d_date_sk = ss_sold_date_sk
JOIN store ON s_store_sk = ss_store_sk
WHERE
  s_gmt_offset = -6
  AND d_year = 1999
GROUP BY
  s_store_name,
  s_store_id
ORDER BY
  s_store_name,
  s_store_id,
  sun_sales,
  mon_sales,
  tue_sales,
  wed_sales,
  thu_sales,
  fri_sales,
  sat_sales
OPTION (LABEL = 'TPC-DS Q43');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q44
SELECT TOP 100
  asceding.rnk,
  i1.i_product_name AS best_performing,
  i2.i_product_name AS worst_performing
FROM (
  SELECT
    *
  FROM (
    SELECT
      item_sk,
      RANK() OVER (ORDER BY rank_col ASC) AS rnk
    FROM (
      SELECT
        ss_item_sk AS item_sk,
        AVG(ss_net_profit) AS rank_col
      FROM store_sales AS ss1
      WHERE
        ss_store_sk = 120
      GROUP BY
        ss_item_sk
      HAVING
        AVG(ss_net_profit) > 0.9 * (
          SELECT
            AVG(ss_net_profit) AS rank_col
          FROM store_sales
          WHERE
            ss_store_sk = 120 AND ss_hdemo_sk IS NULL
          GROUP BY
            ss_store_sk
        )
    ) AS V1
  ) AS V11
  WHERE
    rnk < 11
) AS asceding
JOIN (
  SELECT
    *
  FROM (
    SELECT
      item_sk,
      RANK() OVER (ORDER BY rank_col DESC) AS rnk
    FROM (
      SELECT
        ss_item_sk AS item_sk,
        AVG(ss_net_profit) AS rank_col
      FROM store_sales AS ss1
      WHERE
        ss_store_sk = 120
      GROUP BY
        ss_item_sk
      HAVING
        AVG(ss_net_profit) > 0.9 * (
          SELECT
            AVG(ss_net_profit) AS rank_col
          FROM store_sales
          WHERE
            ss_store_sk = 120 AND ss_hdemo_sk IS NULL
          GROUP BY
            ss_store_sk
        )
    ) AS V2
  ) AS V21
  WHERE
    rnk < 11
) AS descending ON asceding.rnk = descending.rnk
JOIN item AS i1 ON i1.i_item_sk = asceding.item_sk
JOIN item AS i2 ON i2.i_item_sk = descending.item_sk
ORDER BY
  asceding.rnk
OPTION (LABEL = 'TPC-DS Q44');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q45
SELECT TOP 100
  ca_zip,
  ca_city,
  SUM(ws_sales_price)
FROM web_sales
JOIN customer ON ws_bill_customer_sk = c_customer_sk
JOIN customer_address ON c_current_addr_sk = ca_address_sk
JOIN date_dim ON ws_sold_date_sk = d_date_sk
JOIN item ON ws_item_sk = i_item_sk
WHERE
  (
    SUBSTRING(ca_zip, 1, 5) IN ('85669', '86197', '88274', '83405', '86475', '85392', '85460', '80348', '81792')
    OR i_item_id IN (
      SELECT
        i_item_id
      FROM item
      WHERE
        i_item_sk IN (2, 3, 5, 7, 11, 13, 17, 19, 23, 29)
    )
  )
  AND d_qoy = 1
  AND d_year = 2000
GROUP BY
  ca_zip,
  ca_city
ORDER BY
  ca_zip,
  ca_city
OPTION (LABEL = 'TPC-DS Q45');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q46
SELECT TOP 100
  c_last_name,
  c_first_name,
  ca_city,
  bought_city,
  ss_ticket_number,
  amt,
  profit
FROM (
  SELECT
    ss_ticket_number,
    ss_customer_sk,
    ca_city AS bought_city,
    SUM(ss_coupon_amt) AS amt,
    SUM(ss_net_profit) AS profit
  FROM store_sales
  JOIN date_dim ON store_sales.ss_sold_date_sk = date_dim.d_date_sk
  JOIN store ON store_sales.ss_store_sk = store.s_store_sk
  JOIN household_demographics ON store_sales.ss_hdemo_sk = household_demographics.hd_demo_sk
  JOIN customer_address ON store_sales.ss_addr_sk = customer_address.ca_address_sk
  WHERE
    (
      household_demographics.hd_dep_count = 6
      OR household_demographics.hd_vehicle_count = 4
    )
    AND date_dim.d_dow IN (6, 0)
    AND date_dim.d_year IN (2000, 2000 + 1, 2000 + 2)
    AND store.s_city IN ('Shiloh', 'Fairview', 'New Hope', 'Buena Vista', 'Mount Olive')
  GROUP BY
    ss_ticket_number,
    ss_customer_sk,
    ss_addr_sk,
    ca_city
) AS dn
JOIN customer ON ss_customer_sk = c_customer_sk
JOIN customer_address AS current_addr ON customer.c_current_addr_sk = current_addr.ca_address_sk
WHERE
  current_addr.ca_city <> bought_city
ORDER BY
  c_last_name,
  c_first_name,
  ca_city,
  bought_city,
  ss_ticket_number
OPTION (LABEL = 'TPC-DS Q46');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q47
WITH v1 AS (
  SELECT
    i_category,
    i_brand,
    s_store_name,
    s_company_name,
    d_year,
    d_moy,
    SUM(ss_sales_price) AS sum_sales,
    AVG(SUM(ss_sales_price)) OVER (PARTITION BY i_category, i_brand, s_store_name, s_company_name, d_year) AS avg_monthly_sales,
    RANK() OVER (PARTITION BY i_category, i_brand, s_store_name, s_company_name ORDER BY d_year, d_moy) AS rn
  FROM item
  JOIN store_sales ON ss_item_sk = i_item_sk
  JOIN date_dim ON ss_sold_date_sk = d_date_sk
  JOIN store ON ss_store_sk = s_store_sk
  WHERE
    (
      d_year = 1999
      OR (
        d_year = 1999 - 1 AND d_moy = 12
      )
      OR (
        d_year = 1999 + 1 AND d_moy = 1
      )
    )
  GROUP BY
    i_category,
    i_brand,
    s_store_name,
    s_company_name,
    d_year,
    d_moy
), v2 AS (
  SELECT
    v1.i_category,
    v1.i_brand,
    v1.d_year,
    v1.d_moy,
    v1.avg_monthly_sales,
    v1.sum_sales,
    v1_lag.sum_sales AS psum,
    v1_lead.sum_sales AS nsum
  FROM v1
  JOIN v1 AS v1_lag ON v1.i_category = v1_lag.i_category
    AND v1.i_brand = v1_lag.i_brand
    AND v1.s_store_name = v1_lag.s_store_name
    AND v1.s_company_name = v1_lag.s_company_name
    AND v1.rn = v1_lag.rn + 1
  JOIN v1 AS v1_lead ON v1.i_category = v1_lead.i_category
    AND v1.i_brand = v1_lead.i_brand
    AND v1.s_store_name = v1_lead.s_store_name
    AND v1.s_company_name = v1_lead.s_company_name
    AND v1.rn = v1_lead.rn - 1
)
SELECT TOP 100
  *
FROM v2
WHERE
  d_year = 1999
  AND avg_monthly_sales > 0
  AND CASE
    WHEN avg_monthly_sales > 0
    THEN ABS(sum_sales - avg_monthly_sales) / avg_monthly_sales
    ELSE NULL
  END > 0.1
ORDER BY
  sum_sales - avg_monthly_sales,
  avg_monthly_sales
OPTION (LABEL = 'TPC-DS Q47');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q48
SELECT
  SUM(ss_quantity)
FROM store_sales
JOIN store ON s_store_sk = ss_store_sk
JOIN customer_demographics ON cd_demo_sk = ss_cdemo_sk
JOIN customer_address ON ss_addr_sk = ca_address_sk
JOIN date_dim ON ss_sold_date_sk = d_date_sk
WHERE
  d_year = 1999
  AND (
    (
      cd_marital_status = 'U'
      AND cd_education_status = 'Primary'
      AND ss_sales_price BETWEEN 100.00 AND 150.00
    )
    OR (
      cd_marital_status = 'D'
      AND cd_education_status = 'College'
      AND ss_sales_price BETWEEN 50.00 AND 100.00
    )
    OR (
      cd_marital_status = 'M'
      AND cd_education_status = 'Unknown'
      AND ss_sales_price BETWEEN 150.00 AND 200.00
    )
  )
  AND (
    (
      ca_country = 'United States'
      AND ca_state IN ('IN', 'MN', 'NE')
      AND ss_net_profit BETWEEN 0 AND 2000
    )
    OR (
      ca_country = 'United States'
      AND ca_state IN ('OH', 'SC', 'KY')
      AND ss_net_profit BETWEEN 150 AND 3000
    )
    OR (
      ca_country = 'United States'
      AND ca_state IN ('VA', 'IL', 'GA')
      AND ss_net_profit BETWEEN 50 AND 25000
    )
  )
OPTION (LABEL = 'TPC-DS Q48');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q49
SELECT TOP 100
  channel,
  item,
  return_ratio,
  return_rank,
  currency_rank
FROM (
  SELECT
    'web' AS channel,
    web.item,
    web.return_ratio,
    web.return_rank,
    web.currency_rank
  FROM (
    SELECT
      item,
      return_ratio,
      currency_ratio,
      RANK() OVER (ORDER BY return_ratio) AS return_rank,
      RANK() OVER (ORDER BY currency_ratio) AS currency_rank
    FROM (
      SELECT
        ws.ws_item_sk AS item,
        (
          CAST(SUM(COALESCE(wr.wr_return_quantity, 0)) AS DECIMAL(15, 4)) / CAST(SUM(COALESCE(ws.ws_quantity, 0)) AS DECIMAL(15, 4))
        ) AS return_ratio,
        (
          CAST(SUM(COALESCE(wr.wr_return_amt, 0)) AS DECIMAL(15, 4)) / CAST(SUM(COALESCE(ws.ws_net_paid, 0)) AS DECIMAL(15, 4))
        ) AS currency_ratio
      FROM web_sales AS ws
      LEFT OUTER JOIN web_returns AS wr
        ON (
          ws.ws_order_number = wr.wr_order_number AND ws.ws_item_sk = wr.wr_item_sk
        )
      JOIN date_dim ON ws_sold_date_sk = d_date_sk
      WHERE
        wr.wr_return_amt > 10000
        AND ws.ws_net_profit > 1
        AND ws.ws_net_paid > 0
        AND ws.ws_quantity > 0
        AND d_year = 2000
        AND d_moy = 11
      GROUP BY
        ws.ws_item_sk
    ) AS in_web
  ) AS web
  WHERE
    (
      web.return_rank <= 10 OR web.currency_rank <= 10
    )
  UNION
  SELECT
    'catalog' AS channel,
    catalog.item,
    catalog.return_ratio,
    catalog.return_rank,
    catalog.currency_rank
  FROM (
    SELECT
      item,
      return_ratio,
      currency_ratio,
      RANK() OVER (ORDER BY return_ratio) AS return_rank,
      RANK() OVER (ORDER BY currency_ratio) AS currency_rank
    FROM (
      SELECT
        cs.cs_item_sk AS item,
        (
          CAST(SUM(COALESCE(cr.cr_return_quantity, 0)) AS DECIMAL(15, 4)) / CAST(SUM(COALESCE(cs.cs_quantity, 0)) AS DECIMAL(15, 4))
        ) AS return_ratio,
        (
          CAST(SUM(COALESCE(cr.cr_return_amount, 0)) AS DECIMAL(15, 4)) / CAST(SUM(COALESCE(cs.cs_net_paid, 0)) AS DECIMAL(15, 4))
        ) AS currency_ratio
      FROM catalog_sales AS cs
      LEFT OUTER JOIN catalog_returns AS cr
        ON (
          cs.cs_order_number = cr.cr_order_number AND cs.cs_item_sk = cr.cr_item_sk
        )
      JOIN date_dim ON cs_sold_date_sk = d_date_sk
      WHERE
        cr.cr_return_amount > 10000
        AND cs.cs_net_profit > 1
        AND cs.cs_net_paid > 0
        AND cs.cs_quantity > 0
        AND d_year = 2000
        AND d_moy = 11
      GROUP BY
        cs.cs_item_sk
    ) AS in_cat
  ) AS catalog
  WHERE
    (
      catalog.return_rank <= 10 OR catalog.currency_rank <= 10
    )
  UNION
  SELECT
    'store' AS channel,
    store.item,
    store.return_ratio,
    store.return_rank,
    store.currency_rank
  FROM (
    SELECT
      item,
      return_ratio,
      currency_ratio,
      RANK() OVER (ORDER BY return_ratio) AS return_rank,
      RANK() OVER (ORDER BY currency_ratio) AS currency_rank
    FROM (
      SELECT
        sts.ss_item_sk AS item,
        (
          CAST(SUM(COALESCE(sr.sr_return_quantity, 0)) AS DECIMAL(15, 4)) / CAST(SUM(COALESCE(sts.ss_quantity, 0)) AS DECIMAL(15, 4))
        ) AS return_ratio,
        (
          CAST(SUM(COALESCE(sr.sr_return_amt, 0)) AS DECIMAL(15, 4)) / CAST(SUM(COALESCE(sts.ss_net_paid, 0)) AS DECIMAL(15, 4))
        ) AS currency_ratio
      FROM store_sales AS sts
      LEFT OUTER JOIN store_returns AS sr
        ON (
          sts.ss_ticket_number = sr.sr_ticket_number AND sts.ss_item_sk = sr.sr_item_sk
        )
      JOIN date_dim ON ss_sold_date_sk = d_date_sk
      WHERE
        sr.sr_return_amt > 10000
        AND sts.ss_net_profit > 1
        AND sts.ss_net_paid > 0
        AND sts.ss_quantity > 0
        AND d_year = 2000
        AND d_moy = 11
      GROUP BY
        sts.ss_item_sk
    ) AS in_store
  ) AS store
  WHERE
    (
      store.return_rank <= 10 OR store.currency_rank <= 10
    )
)
ORDER BY
  1,
  4,
  5,
  2
OPTION (LABEL = 'TPC-DS Q49');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q50
SELECT TOP 100
  s_store_name,
  s_company_id,
  s_street_number,
  s_street_name,
  s_street_type,
  s_suite_number,
  s_city,
  s_county,
  s_state,
  s_zip,
  SUM(CASE WHEN (
    sr_returned_date_sk - ss_sold_date_sk <= 30
  ) THEN 1 ELSE 0 END) AS [30 days],
  SUM(
    CASE
      WHEN (
        sr_returned_date_sk - ss_sold_date_sk > 30
      )
      AND (
        sr_returned_date_sk - ss_sold_date_sk <= 60
      )
      THEN 1
      ELSE 0
    END
  ) AS [31-60 days],
  SUM(
    CASE
      WHEN (
        sr_returned_date_sk - ss_sold_date_sk > 60
      )
      AND (
        sr_returned_date_sk - ss_sold_date_sk <= 90
      )
      THEN 1
      ELSE 0
    END
  ) AS [61-90 days],
  SUM(
    CASE
      WHEN (
        sr_returned_date_sk - ss_sold_date_sk > 90
      )
      AND (
        sr_returned_date_sk - ss_sold_date_sk <= 120
      )
      THEN 1
      ELSE 0
    END
  ) AS [91-120 days],
  SUM(CASE WHEN (
    sr_returned_date_sk - ss_sold_date_sk > 120
  ) THEN 1 ELSE 0 END) AS [>120 days]
FROM store_sales
JOIN store_returns ON ss_ticket_number = sr_ticket_number
  AND ss_item_sk = sr_item_sk
  AND ss_customer_sk = sr_customer_sk
JOIN store ON ss_store_sk = s_store_sk
JOIN date_dim AS d1 ON ss_sold_date_sk = d1.d_date_sk
JOIN date_dim AS d2 ON sr_returned_date_sk = d2.d_date_sk
WHERE
  d2.d_year = 2000
  AND d2.d_moy = 10
GROUP BY
  s_store_name,
  s_company_id,
  s_street_number,
  s_street_name,
  s_street_type,
  s_suite_number,
  s_city,
  s_county,
  s_state,
  s_zip
ORDER BY
  s_store_name,
  s_company_id,
  s_street_number,
  s_street_name,
  s_street_type,
  s_suite_number,
  s_city,
  s_county,
  s_state,
  s_zip
OPTION (LABEL = 'TPC-DS Q50');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q51
WITH web_v1 AS (
  SELECT
    ws_item_sk AS item_sk,
    d_date,
    SUM(SUM(ws_sales_price)) OVER (PARTITION BY ws_item_sk ORDER BY d_date rows BETWEEN UNBOUNDED preceding AND CURRENT ROW) AS cume_sales
  FROM web_sales
  JOIN date_dim ON ws_sold_date_sk = d_date_sk
  WHERE
    d_month_seq BETWEEN 1183 AND 1183 + 11
    AND NOT ws_item_sk IS NULL
  GROUP BY
    ws_item_sk,
    d_date
), store_v1 AS (
  SELECT
    ss_item_sk AS item_sk,
    d_date,
    SUM(SUM(ss_sales_price)) OVER (PARTITION BY ss_item_sk ORDER BY d_date rows BETWEEN UNBOUNDED preceding AND CURRENT ROW) AS cume_sales
  FROM store_sales
  JOIN date_dim ON ss_sold_date_sk = d_date_sk
  WHERE
    d_month_seq BETWEEN 1183 AND 1183 + 11
    AND NOT ss_item_sk IS NULL
  GROUP BY
    ss_item_sk,
    d_date
)
SELECT TOP 100
  *
FROM (
  SELECT
    item_sk,
    d_date,
    web_sales,
    store_sales,
    MAX(web_sales) OVER (PARTITION BY item_sk ORDER BY d_date rows BETWEEN UNBOUNDED preceding AND CURRENT ROW) AS web_cumulative,
    MAX(store_sales) OVER (PARTITION BY item_sk ORDER BY d_date rows BETWEEN UNBOUNDED preceding AND CURRENT ROW) AS store_cumulative
  FROM (
    SELECT
      CASE WHEN NOT web.item_sk IS NULL THEN web.item_sk ELSE store.item_sk END AS item_sk,
      CASE WHEN NOT web.d_date IS NULL THEN web.d_date ELSE store.d_date END AS d_date,
      web.cume_sales AS web_sales,
      store.cume_sales AS store_sales
    FROM web_v1 AS web
    FULL OUTER JOIN store_v1 AS store
      ON (
        web.item_sk = store.item_sk AND web.d_date = store.d_date
      )
  ) AS x
) AS y
WHERE
  web_cumulative > store_cumulative
ORDER BY
  item_sk,
  d_date
OPTION (LABEL = 'TPC-DS Q51');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q52
SELECT TOP 100
  dt.d_year,
  item.i_brand_id AS brand_id,
  item.i_brand AS brand,
  SUM(ss_ext_sales_price) AS ext_price
FROM date_dim AS dt
JOIN store_sales ON dt.d_date_sk = store_sales.ss_sold_date_sk
JOIN item ON store_sales.ss_item_sk = item.i_item_sk
WHERE
  item.i_manager_id = 1
  AND dt.d_moy = 12
  AND dt.d_year = 1999
GROUP BY
  dt.d_year,
  item.i_brand,
  item.i_brand_id
ORDER BY
  dt.d_year,
  ext_price DESC,
  brand_id
OPTION (LABEL = 'TPC-DS Q52');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q53
SELECT TOP 100
  *
FROM (
  SELECT
    i_manufact_id,
    SUM(ss_sales_price) AS sum_sales,
    AVG(SUM(ss_sales_price)) OVER (PARTITION BY i_manufact_id) AS avg_quarterly_sales
  FROM item
  JOIN store_sales ON ss_item_sk = i_item_sk
  JOIN date_dim ON ss_sold_date_sk = d_date_sk
  JOIN store ON ss_store_sk = s_store_sk
  WHERE
    d_month_seq IN (1183, 1183 + 1, 1183 + 2, 1183 + 3, 1183 + 4, 1183 + 5, 1183 + 6, 1183 + 7, 1183 + 8, 1183 + 9, 1183 + 10, 1183 + 11)
    AND (
      (
        i_category IN ('Books', 'Children', 'Electronics')
        AND i_class IN ('personal', 'portable', 'reference', 'self-help')
        AND i_brand IN ('scholaramalgamalg #14', 'scholaramalgamalg #7', 'exportiunivamalg #9', 'scholaramalgamalg #9')
      )
      OR (
        i_category IN ('Women', 'Music', 'Men')
        AND i_class IN ('accessories', 'classical', 'fragrances', 'pants')
        AND i_brand IN ('amalgimporto #1', 'edu packscholar #1', 'exportiimporto #1', 'importoamalg #1')
      )
    )
  GROUP BY
    i_manufact_id,
    d_qoy
) AS tmp1
WHERE
  CASE
    WHEN avg_quarterly_sales > 0
    THEN ABS(sum_sales - avg_quarterly_sales) / avg_quarterly_sales
    ELSE NULL
  END > 0.1
ORDER BY
  avg_quarterly_sales,
  sum_sales,
  i_manufact_id
OPTION (LABEL = 'TPC-DS Q53');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q54
WITH my_customers AS (
  SELECT DISTINCT
    c_customer_sk,
    c_current_addr_sk
  FROM (
    SELECT
      cs_sold_date_sk AS sold_date_sk,
      cs_bill_customer_sk AS customer_sk,
      cs_item_sk AS item_sk
    FROM catalog_sales
    UNION ALL
    SELECT
      ws_sold_date_sk AS sold_date_sk,
      ws_bill_customer_sk AS customer_sk,
      ws_item_sk AS item_sk
    FROM web_sales
  ) AS cs_or_ws_sales
  JOIN item ON item_sk = i_item_sk
  JOIN date_dim ON sold_date_sk = d_date_sk
  JOIN customer ON c_customer_sk = cs_or_ws_sales.customer_sk
  WHERE
    i_category = 'Home'
    AND i_class = 'paint'
    AND d_moy = 3
    AND d_year = 2002
), my_revenue AS (
  SELECT
    c_customer_sk,
    SUM(ss_ext_sales_price) AS revenue
  FROM my_customers
  JOIN store_sales ON c_customer_sk = ss_customer_sk
  JOIN customer_address ON c_current_addr_sk = ca_address_sk
  JOIN store ON ca_county = s_county
    AND ca_state = s_state
  JOIN date_dim ON ss_sold_date_sk = d_date_sk
  WHERE
    d_month_seq BETWEEN (
      SELECT DISTINCT
        d_month_seq + 1
      FROM date_dim
      WHERE
        d_year = 2002 AND d_moy = 3
    ) AND (
      SELECT DISTINCT
        d_month_seq + 3
      FROM date_dim
      WHERE
        d_year = 2002 AND d_moy = 3
    )
  GROUP BY
    c_customer_sk
), segments AS (
  SELECT
    CAST((
      revenue / 50
    ) AS INT) AS segment
  FROM my_revenue
)
SELECT TOP 100
  segment,
  COUNT(*) AS num_customers,
  segment * 50 AS segment_base
FROM segments
GROUP BY
  segment
ORDER BY
  segment,
  num_customers
OPTION (LABEL = 'TPC-DS Q54');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q55
SELECT TOP 100
  i_brand_id AS brand_id,
  i_brand AS brand,
  SUM(ss_ext_sales_price) AS ext_price
FROM date_dim
JOIN store_sales ON d_date_sk = ss_sold_date_sk
JOIN item ON ss_item_sk = i_item_sk
WHERE
  i_manager_id = 17
  AND d_moy = 12
  AND d_year = 2000
GROUP BY
  i_brand,
  i_brand_id
ORDER BY
  ext_price DESC,
  i_brand_id
OPTION (LABEL = 'TPC-DS Q55');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q56
WITH ss AS (
  SELECT
    i_item_id,
    SUM(ss_ext_sales_price) AS total_sales
  FROM store_sales
  JOIN date_dim ON ss_sold_date_sk = d_date_sk
  JOIN customer_address ON ss_addr_sk = ca_address_sk
  JOIN item ON ss_item_sk = i_item_sk
  WHERE
    i_item_id IN (
      SELECT
        i_item_id
      FROM item
      WHERE
        i_color IN ('violet', 'floral', 'coral')
    )
    AND d_year = 2002
    AND d_moy = 2
    AND ca_gmt_offset = -6
  GROUP BY
    i_item_id
), cs AS (
  SELECT
    i_item_id,
    SUM(cs_ext_sales_price) AS total_sales
  FROM catalog_sales
  JOIN date_dim ON cs_sold_date_sk = d_date_sk
  JOIN customer_address ON cs_bill_addr_sk = ca_address_sk
  JOIN item ON cs_item_sk = i_item_sk
  WHERE
    i_item_id IN (
      SELECT
        i_item_id
      FROM item
      WHERE
        i_color IN ('violet', 'floral', 'coral')
    )
    AND d_year = 2002
    AND d_moy = 2
    AND ca_gmt_offset = -6
  GROUP BY
    i_item_id
), ws AS (
  SELECT
    i_item_id,
    SUM(ws_ext_sales_price) AS total_sales
  FROM web_sales
  JOIN item ON ws_item_sk = i_item_sk
  JOIN date_dim ON ws_sold_date_sk = d_date_sk
  JOIN customer_address ON ws_bill_addr_sk = ca_address_sk
  WHERE
    i_item_id IN (
      SELECT
        i_item_id
      FROM item
      WHERE
        i_color IN ('violet', 'floral', 'coral')
    )
    AND d_year = 2002
    AND d_moy = 2
    AND ca_gmt_offset = -6
  GROUP BY
    i_item_id
)
SELECT TOP 100
  i_item_id,
  SUM(total_sales) AS total_sales
FROM (
  SELECT
    *
  FROM ss
  UNION ALL
  SELECT
    *
  FROM cs
  UNION ALL
  SELECT
    *
  FROM ws
) AS tmp1
GROUP BY
  i_item_id
ORDER BY
  total_sales,
  i_item_id
OPTION (LABEL = 'TPC-DS Q56');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q57
WITH v1 AS (
  SELECT
    i_category,
    i_brand,
    cc_name,
    d_year,
    d_moy,
    SUM(cs_sales_price) AS sum_sales,
    AVG(SUM(cs_sales_price)) OVER (PARTITION BY i_category, i_brand, cc_name, d_year) AS avg_monthly_sales,
    RANK() OVER (PARTITION BY i_category, i_brand, cc_name ORDER BY d_year, d_moy) AS rn
  FROM item
  JOIN catalog_sales ON cs_item_sk = i_item_sk
  JOIN date_dim ON cs_sold_date_sk = d_date_sk
  JOIN call_center ON cc_call_center_sk = cs_call_center_sk
  WHERE
    (
      d_year = 1999
      OR (
        d_year = 1999 - 1 AND d_moy = 12
      )
      OR (
        d_year = 1999 + 1 AND d_moy = 1
      )
    )
  GROUP BY
    i_category,
    i_brand,
    cc_name,
    d_year,
    d_moy
), v2 AS (
  SELECT
    v1.i_category,
    v1.i_brand,
    v1.d_year,
    v1.d_moy,
    v1.avg_monthly_sales,
    v1.sum_sales,
    v1_lag.sum_sales AS psum,
    v1_lead.sum_sales AS nsum
  FROM v1
  JOIN v1 AS v1_lag ON v1.i_category = v1_lag.i_category
    AND v1.i_brand = v1_lag.i_brand
    AND v1.cc_name = v1_lag.cc_name
    AND v1.rn = v1_lag.rn + 1
  JOIN v1 AS v1_lead ON v1.i_category = v1_lead.i_category
    AND v1.i_brand = v1_lead.i_brand
    AND v1.cc_name = v1_lead.cc_name
    AND v1.rn = v1_lead.rn - 1
)
SELECT TOP 100
  *
FROM v2
WHERE
  d_year = 1999
  AND avg_monthly_sales > 0
  AND CASE
    WHEN avg_monthly_sales > 0
    THEN ABS(sum_sales - avg_monthly_sales) / avg_monthly_sales
    ELSE NULL
  END > 0.1
ORDER BY
  sum_sales - avg_monthly_sales,
  avg_monthly_sales
OPTION (LABEL = 'TPC-DS Q57');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q58
WITH ss_items AS (
  SELECT
    i_item_id AS item_id,
    SUM(ss_ext_sales_price) AS ss_item_rev
  FROM store_sales
  JOIN item ON ss_item_sk = i_item_sk
  JOIN date_dim ON ss_sold_date_sk = d_date_sk
  WHERE
    d_date IN (
      SELECT
        d_date
      FROM date_dim
      WHERE
        d_week_seq = (
          SELECT
            d_week_seq
          FROM date_dim
          WHERE
            d_date = '1999-01-05'
        )
    )
  GROUP BY
    i_item_id
), cs_items AS (
  SELECT
    i_item_id AS item_id,
    SUM(cs_ext_sales_price) AS cs_item_rev
  FROM catalog_sales
  JOIN item ON cs_item_sk = i_item_sk
  JOIN date_dim ON cs_sold_date_sk = d_date_sk
  WHERE
    d_date IN (
      SELECT
        d_date
      FROM date_dim
      WHERE
        d_week_seq = (
          SELECT
            d_week_seq
          FROM date_dim
          WHERE
            d_date = '1999-01-05'
        )
    )
  GROUP BY
    i_item_id
), ws_items AS (
  SELECT
    i_item_id AS item_id,
    SUM(ws_ext_sales_price) AS ws_item_rev
  FROM web_sales
  JOIN item ON ws_item_sk = i_item_sk
  JOIN date_dim ON ws_sold_date_sk = d_date_sk
  WHERE
    d_date IN (
      SELECT
        d_date
      FROM date_dim
      WHERE
        d_week_seq = (
          SELECT
            d_week_seq
          FROM date_dim
          WHERE
            d_date = '1999-01-05'
        )
    )
  GROUP BY
    i_item_id
)
SELECT TOP 100
  ss_items.item_id,
  ss_item_rev,
  ss_item_rev / (
    (
      ss_item_rev + cs_item_rev + ws_item_rev
    ) / 3
  ) * 100 AS ss_dev,
  cs_item_rev,
  cs_item_rev / (
    (
      ss_item_rev + cs_item_rev + ws_item_rev
    ) / 3
  ) * 100 AS cs_dev,
  ws_item_rev,
  ws_item_rev / (
    (
      ss_item_rev + cs_item_rev + ws_item_rev
    ) / 3
  ) * 100 AS ws_dev,
  (
    ss_item_rev + cs_item_rev + ws_item_rev
  ) / 3 AS average
FROM ss_items
JOIN cs_items ON ss_items.item_id = cs_items.item_id
JOIN ws_items ON ss_items.item_id = ws_items.item_id
WHERE
  ss_item_rev BETWEEN 0.9 * cs_item_rev AND 1.1 * cs_item_rev
  AND ss_item_rev BETWEEN 0.9 * ws_item_rev AND 1.1 * ws_item_rev
  AND cs_item_rev BETWEEN 0.9 * ss_item_rev AND 1.1 * ss_item_rev
  AND cs_item_rev BETWEEN 0.9 * ws_item_rev AND 1.1 * ws_item_rev
  AND ws_item_rev BETWEEN 0.9 * ss_item_rev AND 1.1 * ss_item_rev
  AND ws_item_rev BETWEEN 0.9 * cs_item_rev AND 1.1 * cs_item_rev
ORDER BY
  ss_items.item_id,
  ss_item_rev
OPTION (LABEL = 'TPC-DS Q58');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q59
WITH wss AS (
  SELECT
    d_week_seq,
    ss_store_sk,
    SUM(CASE WHEN (
      d_day_name = 'Sunday'
    ) THEN ss_sales_price ELSE NULL END) AS sun_sales,
    SUM(CASE WHEN (
      d_day_name = 'Monday'
    ) THEN ss_sales_price ELSE NULL END) AS mon_sales,
    SUM(CASE WHEN (
      d_day_name = 'Tuesday'
    ) THEN ss_sales_price ELSE NULL END) AS tue_sales,
    SUM(CASE WHEN (
      d_day_name = 'Wednesday'
    ) THEN ss_sales_price ELSE NULL END) AS wed_sales,
    SUM(CASE WHEN (
      d_day_name = 'Thursday'
    ) THEN ss_sales_price ELSE NULL END) AS thu_sales,
    SUM(CASE WHEN (
      d_day_name = 'Friday'
    ) THEN ss_sales_price ELSE NULL END) AS fri_sales,
    SUM(CASE WHEN (
      d_day_name = 'Saturday'
    ) THEN ss_sales_price ELSE NULL END) AS sat_sales
  FROM store_sales
  JOIN date_dim ON d_date_sk = ss_sold_date_sk
  GROUP BY
    d_week_seq,
    ss_store_sk
)
SELECT TOP 100
  s_store_name1,
  s_store_id1,
  d_week_seq1,
  sun_sales1 / sun_sales2,
  mon_sales1 / mon_sales2,
  tue_sales1 / tue_sales2,
  wed_sales1 / wed_sales2,
  thu_sales1 / thu_sales2,
  fri_sales1 / fri_sales2,
  sat_sales1 / sat_sales2
FROM (
  SELECT
    s_store_name AS s_store_name1,
    wss.d_week_seq AS d_week_seq1,
    s_store_id AS s_store_id1,
    sun_sales AS sun_sales1,
    mon_sales AS mon_sales1,
    tue_sales AS tue_sales1,
    wed_sales AS wed_sales1,
    thu_sales AS thu_sales1,
    fri_sales AS fri_sales1,
    sat_sales AS sat_sales1
  FROM wss
  JOIN store ON ss_store_sk = s_store_sk
  JOIN date_dim AS d ON d.d_week_seq = wss.d_week_seq
  WHERE
    d_month_seq BETWEEN 1199 AND 1199 + 11
) AS y
JOIN (
  SELECT
    s_store_name AS s_store_name2,
    wss.d_week_seq AS d_week_seq2,
    s_store_id AS s_store_id2,
    sun_sales AS sun_sales2,
    mon_sales AS mon_sales2,
    tue_sales AS tue_sales2,
    wed_sales AS wed_sales2,
    thu_sales AS thu_sales2,
    fri_sales AS fri_sales2,
    sat_sales AS sat_sales2
  FROM wss
  JOIN store ON ss_store_sk = s_store_sk
  JOIN date_dim AS d ON d.d_week_seq = wss.d_week_seq
  WHERE
    d_month_seq BETWEEN 1199 + 12 AND 1199 + 23
) AS x ON s_store_id1 = s_store_id2 AND d_week_seq1 = d_week_seq2 - 52
ORDER BY
  s_store_name1,
  s_store_id1,
  d_week_seq1
OPTION (LABEL = 'TPC-DS Q59');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q60
WITH ss AS (
  SELECT
    i_item_id,
    SUM(ss_ext_sales_price) AS total_sales
  FROM store_sales
  JOIN date_dim ON ss_sold_date_sk = d_date_sk
  JOIN customer_address ON ss_addr_sk = ca_address_sk
  JOIN item ON ss_item_sk = i_item_sk
  WHERE
    i_item_id IN (
      SELECT
        i_item_id
      FROM item
      WHERE
        i_category IN ('Men')
    )
    AND d_year = 2002
    AND d_moy = 8
    AND ca_gmt_offset = -6
  GROUP BY
    i_item_id
), cs AS (
  SELECT
    i_item_id,
    SUM(cs_ext_sales_price) AS total_sales
  FROM catalog_sales
  JOIN date_dim ON cs_sold_date_sk = d_date_sk
  JOIN customer_address ON cs_bill_addr_sk = ca_address_sk
  JOIN item ON cs_item_sk = i_item_sk
  WHERE
    i_item_id IN (
      SELECT
        i_item_id
      FROM item
      WHERE
        i_category IN ('Men')
    )
    AND d_year = 2002
    AND d_moy = 8
    AND ca_gmt_offset = -6
  GROUP BY
    i_item_id
), ws AS (
  SELECT
    i_item_id,
    SUM(ws_ext_sales_price) AS total_sales
  FROM web_sales
  JOIN item ON ws_item_sk = i_item_sk
  JOIN date_dim ON ws_sold_date_sk = d_date_sk
  JOIN customer_address ON ws_bill_addr_sk = ca_address_sk
  WHERE
    i_item_id IN (
      SELECT
        i_item_id
      FROM item
      WHERE
        i_category IN ('Men')
    )
    AND d_year = 2002
    AND d_moy = 8
    AND ca_gmt_offset = -6
  GROUP BY
    i_item_id
)
SELECT TOP 100
  i_item_id,
  SUM(total_sales) AS total_sales
FROM (
  SELECT
    *
  FROM ss
  UNION ALL
  SELECT
    *
  FROM cs
  UNION ALL
  SELECT
    *
  FROM ws
) AS tmp1
GROUP BY
  i_item_id
ORDER BY
  i_item_id,
  total_sales
OPTION (LABEL = 'TPC-DS Q60');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q61
SELECT TOP 100
  promotions,
  total,
  CAST(promotions AS DECIMAL(15, 4)) / CAST(total AS DECIMAL(15, 4)) * 100
FROM (
  SELECT
    SUM(ss_ext_sales_price) AS promotions
  FROM store_sales
  JOIN store ON ss_store_sk = s_store_sk
  JOIN promotion ON ss_promo_sk = p_promo_sk
  JOIN date_dim ON ss_sold_date_sk = d_date_sk
  JOIN customer ON ss_customer_sk = c_customer_sk
  JOIN customer_address ON ca_address_sk = c_current_addr_sk
  JOIN item ON ss_item_sk = i_item_sk
  WHERE
    ca_gmt_offset = -7
    AND i_category = 'Home'
    AND (
      p_channel_dmail = 'Y' OR p_channel_email = 'Y' OR p_channel_tv = 'Y'
    )
    AND s_gmt_offset = -7
    AND d_year = 2002
    AND d_moy = 11
) AS promotional_sales, (
  SELECT
    SUM(ss_ext_sales_price) AS total
  FROM store_sales
  JOIN store ON ss_store_sk = s_store_sk
  JOIN date_dim ON ss_sold_date_sk = d_date_sk
  JOIN customer ON ss_customer_sk = c_customer_sk
  JOIN customer_address ON ca_address_sk = c_current_addr_sk
  JOIN item ON ss_item_sk = i_item_sk
  WHERE
    ca_gmt_offset = -7
    AND i_category = 'Home'
    AND s_gmt_offset = -7
    AND d_year = 2002
    AND d_moy = 11
) AS all_sales
ORDER BY
  promotions,
  total
OPTION (LABEL = 'TPC-DS Q61');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q62
SELECT TOP 100
  SUBSTRING(w_warehouse_name, 1, 20),
  sm_type,
  web_name,
  SUM(CASE WHEN (
    ws_ship_date_sk - ws_sold_date_sk <= 30
  ) THEN 1 ELSE 0 END) AS [30 days],
  SUM(
    CASE
      WHEN (
        ws_ship_date_sk - ws_sold_date_sk > 30
      )
      AND (
        ws_ship_date_sk - ws_sold_date_sk <= 60
      )
      THEN 1
      ELSE 0
    END
  ) AS [31-60 days],
  SUM(
    CASE
      WHEN (
        ws_ship_date_sk - ws_sold_date_sk > 60
      )
      AND (
        ws_ship_date_sk - ws_sold_date_sk <= 90
      )
      THEN 1
      ELSE 0
    END
  ) AS [61-90 days],
  SUM(
    CASE
      WHEN (
        ws_ship_date_sk - ws_sold_date_sk > 90
      )
      AND (
        ws_ship_date_sk - ws_sold_date_sk <= 120
      )
      THEN 1
      ELSE 0
    END
  ) AS [91-120 days],
  SUM(CASE WHEN (
    ws_ship_date_sk - ws_sold_date_sk > 120
  ) THEN 1 ELSE 0 END) AS [>120 days]
FROM web_sales
JOIN warehouse ON ws_warehouse_sk = w_warehouse_sk
JOIN ship_mode ON ws_ship_mode_sk = sm_ship_mode_sk
JOIN web_site ON ws_web_site_sk = web_site_sk
JOIN date_dim ON ws_ship_date_sk = d_date_sk
WHERE
  d_month_seq BETWEEN 1183 AND 1183 + 11
GROUP BY
  SUBSTRING(w_warehouse_name, 1, 20),
  sm_type,
  web_name
ORDER BY
  SUBSTRING(w_warehouse_name, 1, 20),
  sm_type,
  web_name
OPTION (LABEL = 'TPC-DS Q62');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q63
SELECT TOP 100
  *
FROM (
  SELECT
    i_manager_id,
    SUM(ss_sales_price) AS sum_sales,
    AVG(SUM(ss_sales_price)) OVER (PARTITION BY i_manager_id) AS avg_monthly_sales
  FROM item
  JOIN store_sales ON ss_item_sk = i_item_sk
  JOIN date_dim ON ss_sold_date_sk = d_date_sk
  JOIN store ON ss_store_sk = s_store_sk
  WHERE
    d_month_seq IN (1183, 1183 + 1, 1183 + 2, 1183 + 3, 1183 + 4, 1183 + 5, 1183 + 6, 1183 + 7, 1183 + 8, 1183 + 9, 1183 + 10, 1183 + 11)
    AND (
      (
        i_category IN ('Books', 'Children', 'Electronics')
        AND i_class IN ('personal', 'portable', 'reference', 'self-help')
        AND i_brand IN ('scholaramalgamalg #14', 'scholaramalgamalg #7', 'exportiunivamalg #9', 'scholaramalgamalg #9')
      )
      OR (
        i_category IN ('Women', 'Music', 'Men')
        AND i_class IN ('accessories', 'classical', 'fragrances', 'pants')
        AND i_brand IN ('amalgimporto #1', 'edu packscholar #1', 'exportiimporto #1', 'importoamalg #1')
      )
    )
  GROUP BY
    i_manager_id,
    d_moy
) AS tmp1
WHERE
  CASE
    WHEN avg_monthly_sales > 0
    THEN ABS(sum_sales - avg_monthly_sales) / avg_monthly_sales
    ELSE NULL
  END > 0.1
ORDER BY
  i_manager_id,
  avg_monthly_sales,
  sum_sales
OPTION (LABEL = 'TPC-DS Q63');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q64
WITH cs_ui AS (
  SELECT
    cs_item_sk,
    SUM(cs_ext_list_price) AS sale,
    SUM(cr_refunded_cash + cr_reversed_charge + cr_store_credit) AS refund
  FROM catalog_sales
  JOIN catalog_returns ON cs_item_sk = cr_item_sk AND cs_order_number = cr_order_number
  GROUP BY
    cs_item_sk
  HAVING
    SUM(cs_ext_list_price) > 2 * SUM(cr_refunded_cash + cr_reversed_charge + cr_store_credit)
), cross_sales AS (
  SELECT
    i_product_name AS product_name,
    i_item_sk AS item_sk,
    s_store_name AS store_name,
    s_zip AS store_zip,
    ad1.ca_street_number AS b_street_number,
    ad1.ca_street_name AS b_street_name,
    ad1.ca_city AS b_city,
    ad1.ca_zip AS b_zip,
    ad2.ca_street_number AS c_street_number,
    ad2.ca_street_name AS c_street_name,
    ad2.ca_city AS c_city,
    ad2.ca_zip AS c_zip,
    d1.d_year AS syear,
    d2.d_year AS fsyear,
    d3.d_year AS s2year,
    COUNT(*) AS cnt,
    SUM(ss_wholesale_cost) AS s1,
    SUM(ss_list_price) AS s2,
    SUM(ss_coupon_amt) AS s3
  FROM store_sales
  JOIN store ON ss_store_sk = s_store_sk
  JOIN date_dim AS d1 ON ss_sold_date_sk = d1.d_date_sk
  JOIN customer ON ss_customer_sk = c_customer_sk
  JOIN customer_demographics AS cd1 ON ss_cdemo_sk = cd1.cd_demo_sk
  JOIN household_demographics AS hd1 ON ss_hdemo_sk = hd1.hd_demo_sk
  JOIN customer_address AS ad1 ON ss_addr_sk = ad1.ca_address_sk
  JOIN item ON ss_item_sk = i_item_sk
  JOIN store_returns ON ss_item_sk = sr_item_sk
    AND ss_ticket_number = sr_ticket_number
  JOIN cs_ui ON ss_item_sk = cs_ui.cs_item_sk
  JOIN customer_demographics AS cd2 ON c_current_cdemo_sk = cd2.cd_demo_sk
  JOIN household_demographics AS hd2 ON c_current_hdemo_sk = hd2.hd_demo_sk
  JOIN customer_address AS ad2 ON c_current_addr_sk = ad2.ca_address_sk
  JOIN date_dim AS d2 ON c_first_sales_date_sk = d2.d_date_sk
  JOIN date_dim AS d3 ON c_first_shipto_date_sk = d3.d_date_sk
  JOIN promotion ON ss_promo_sk = p_promo_sk
  JOIN income_band AS ib1 ON hd1.hd_income_band_sk = ib1.ib_income_band_sk
  JOIN income_band AS ib2 ON hd2.hd_income_band_sk = ib2.ib_income_band_sk
  WHERE
    cd1.cd_marital_status <> cd2.cd_marital_status
    AND i_color IN ('coral', 'thistle', 'lace', 'beige', 'spring', 'orchid')
    AND i_current_price BETWEEN 81 AND 81 + 10
    AND i_current_price BETWEEN 81 + 1 AND 81 + 15
  GROUP BY
    i_product_name,
    i_item_sk,
    s_store_name,
    s_zip,
    ad1.ca_street_number,
    ad1.ca_street_name,
    ad1.ca_city,
    ad1.ca_zip,
    ad2.ca_street_number,
    ad2.ca_street_name,
    ad2.ca_city,
    ad2.ca_zip,
    d1.d_year,
    d2.d_year,
    d3.d_year
)
SELECT
  cs1.product_name,
  cs1.store_name,
  cs1.store_zip,
  cs1.b_street_number,
  cs1.b_street_name,
  cs1.b_city,
  cs1.b_zip,
  cs1.c_street_number,
  cs1.c_street_name,
  cs1.c_city,
  cs1.c_zip,
  cs1.syear,
  cs1.cnt,
  cs1.s1 AS s11,
  cs1.s2 AS s21,
  cs1.s3 AS s31,
  cs2.s1 AS s12,
  cs2.s2 AS s22,
  cs2.s3 AS s32,
  cs2.syear,
  cs2.cnt
FROM cross_sales AS cs1
JOIN cross_sales AS cs2 ON cs1.item_sk = cs2.item_sk
  AND cs1.store_name = cs2.store_name
  AND cs1.store_zip = cs2.store_zip
WHERE
  cs1.syear = 2001
  AND cs2.syear = 2001 + 1
  AND cs2.cnt <= cs1.cnt
ORDER BY
  cs1.product_name,
  cs1.store_name,
  cs2.cnt,
  cs1.s1,
  cs2.s1
OPTION (LABEL = 'TPC-DS Q64');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q65
SELECT TOP 100
  s_store_name,
  i_item_desc,
  sc.revenue,
  i_current_price,
  i_wholesale_cost,
  i_brand
FROM store
JOIN (
  SELECT
    ss_store_sk,
    ss_item_sk,
    SUM(ss_sales_price) AS revenue
  FROM store_sales
  JOIN date_dim ON ss_sold_date_sk = d_date_sk
  WHERE
    d_month_seq BETWEEN 1183 AND 1183 + 11
  GROUP BY
    ss_store_sk,
    ss_item_sk
) AS sc ON s_store_sk = sc.ss_store_sk
JOIN (
  SELECT
    ss_store_sk,
    AVG(revenue) AS ave
  FROM (
    SELECT
      ss_store_sk,
      ss_item_sk,
      SUM(ss_sales_price) AS revenue
    FROM store_sales
    JOIN date_dim ON ss_sold_date_sk = d_date_sk
    WHERE
      d_month_seq BETWEEN 1183 AND 1183 + 11
    GROUP BY
      ss_store_sk,
      ss_item_sk
  ) AS sa
  GROUP BY
    ss_store_sk
) AS sb ON sb.ss_store_sk = sc.ss_store_sk
    AND sc.revenue <= 0.1 * sb.ave
JOIN item ON i_item_sk = sc.ss_item_sk
ORDER BY
  s_store_name,
  i_item_desc
OPTION (LABEL = 'TPC-DS Q65');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q66
SELECT TOP 100
  w_warehouse_name,
  w_warehouse_sq_ft,
  w_city,
  w_county,
  w_state,
  w_country,
  ship_carriers,
  year,
  SUM(jan_sales) AS jan_sales,
  SUM(feb_sales) AS feb_sales,
  SUM(mar_sales) AS mar_sales,
  SUM(apr_sales) AS apr_sales,
  SUM(may_sales) AS may_sales,
  SUM(jun_sales) AS jun_sales,
  SUM(jul_sales) AS jul_sales,
  SUM(aug_sales) AS aug_sales,
  SUM(sep_sales) AS sep_sales,
  SUM(oct_sales) AS oct_sales,
  SUM(nov_sales) AS nov_sales,
  SUM(dec_sales) AS dec_sales,
  SUM(jan_sales / w_warehouse_sq_ft) AS jan_sales_per_sq_foot,
  SUM(feb_sales / w_warehouse_sq_ft) AS feb_sales_per_sq_foot,
  SUM(mar_sales / w_warehouse_sq_ft) AS mar_sales_per_sq_foot,
  SUM(apr_sales / w_warehouse_sq_ft) AS apr_sales_per_sq_foot,
  SUM(may_sales / w_warehouse_sq_ft) AS may_sales_per_sq_foot,
  SUM(jun_sales / w_warehouse_sq_ft) AS jun_sales_per_sq_foot,
  SUM(jul_sales / w_warehouse_sq_ft) AS jul_sales_per_sq_foot,
  SUM(aug_sales / w_warehouse_sq_ft) AS aug_sales_per_sq_foot,
  SUM(sep_sales / w_warehouse_sq_ft) AS sep_sales_per_sq_foot,
  SUM(oct_sales / w_warehouse_sq_ft) AS oct_sales_per_sq_foot,
  SUM(nov_sales / w_warehouse_sq_ft) AS nov_sales_per_sq_foot,
  SUM(dec_sales / w_warehouse_sq_ft) AS dec_sales_per_sq_foot,
  SUM(jan_net) AS jan_net,
  SUM(feb_net) AS feb_net,
  SUM(mar_net) AS mar_net,
  SUM(apr_net) AS apr_net,
  SUM(may_net) AS may_net,
  SUM(jun_net) AS jun_net,
  SUM(jul_net) AS jul_net,
  SUM(aug_net) AS aug_net,
  SUM(sep_net) AS sep_net,
  SUM(oct_net) AS oct_net,
  SUM(nov_net) AS nov_net,
  SUM(dec_net) AS dec_net
FROM (
  SELECT
    w_warehouse_name,
    w_warehouse_sq_ft,
    w_city,
    w_county,
    w_state,
    w_country,
    'UPS' + ',' + 'ALLIANCE' AS ship_carriers,
    d_year AS year,
    SUM(CASE WHEN d_moy = 1 THEN ws_ext_sales_price * ws_quantity ELSE 0 END) AS jan_sales,
    SUM(CASE WHEN d_moy = 2 THEN ws_ext_sales_price * ws_quantity ELSE 0 END) AS feb_sales,
    SUM(CASE WHEN d_moy = 3 THEN ws_ext_sales_price * ws_quantity ELSE 0 END) AS mar_sales,
    SUM(CASE WHEN d_moy = 4 THEN ws_ext_sales_price * ws_quantity ELSE 0 END) AS apr_sales,
    SUM(CASE WHEN d_moy = 5 THEN ws_ext_sales_price * ws_quantity ELSE 0 END) AS may_sales,
    SUM(CASE WHEN d_moy = 6 THEN ws_ext_sales_price * ws_quantity ELSE 0 END) AS jun_sales,
    SUM(CASE WHEN d_moy = 7 THEN ws_ext_sales_price * ws_quantity ELSE 0 END) AS jul_sales,
    SUM(CASE WHEN d_moy = 8 THEN ws_ext_sales_price * ws_quantity ELSE 0 END) AS aug_sales,
    SUM(CASE WHEN d_moy = 9 THEN ws_ext_sales_price * ws_quantity ELSE 0 END) AS sep_sales,
    SUM(CASE WHEN d_moy = 10 THEN ws_ext_sales_price * ws_quantity ELSE 0 END) AS oct_sales,
    SUM(CASE WHEN d_moy = 11 THEN ws_ext_sales_price * ws_quantity ELSE 0 END) AS nov_sales,
    SUM(CASE WHEN d_moy = 12 THEN ws_ext_sales_price * ws_quantity ELSE 0 END) AS dec_sales,
    SUM(CASE WHEN d_moy = 1 THEN ws_net_profit * ws_quantity ELSE 0 END) AS jan_net,
    SUM(CASE WHEN d_moy = 2 THEN ws_net_profit * ws_quantity ELSE 0 END) AS feb_net,
    SUM(CASE WHEN d_moy = 3 THEN ws_net_profit * ws_quantity ELSE 0 END) AS mar_net,
    SUM(CASE WHEN d_moy = 4 THEN ws_net_profit * ws_quantity ELSE 0 END) AS apr_net,
    SUM(CASE WHEN d_moy = 5 THEN ws_net_profit * ws_quantity ELSE 0 END) AS may_net,
    SUM(CASE WHEN d_moy = 6 THEN ws_net_profit * ws_quantity ELSE 0 END) AS jun_net,
    SUM(CASE WHEN d_moy = 7 THEN ws_net_profit * ws_quantity ELSE 0 END) AS jul_net,
    SUM(CASE WHEN d_moy = 8 THEN ws_net_profit * ws_quantity ELSE 0 END) AS aug_net,
    SUM(CASE WHEN d_moy = 9 THEN ws_net_profit * ws_quantity ELSE 0 END) AS sep_net,
    SUM(CASE WHEN d_moy = 10 THEN ws_net_profit * ws_quantity ELSE 0 END) AS oct_net,
    SUM(CASE WHEN d_moy = 11 THEN ws_net_profit * ws_quantity ELSE 0 END) AS nov_net,
    SUM(CASE WHEN d_moy = 12 THEN ws_net_profit * ws_quantity ELSE 0 END) AS dec_net
  FROM web_sales
  JOIN warehouse ON ws_warehouse_sk = w_warehouse_sk
  JOIN date_dim ON ws_sold_date_sk = d_date_sk
  JOIN time_dim ON ws_sold_time_sk = t_time_sk
  JOIN ship_mode ON ws_ship_mode_sk = sm_ship_mode_sk
  WHERE
    d_year = 2001
    AND t_time BETWEEN 46037 AND 46037 + 28800
    AND sm_carrier IN ('UPS', 'ALLIANCE')
  GROUP BY
    w_warehouse_name,
    w_warehouse_sq_ft,
    w_city,
    w_county,
    w_state,
    w_country,
    d_year
  UNION ALL
  SELECT
    w_warehouse_name,
    w_warehouse_sq_ft,
    w_city,
    w_county,
    w_state,
    w_country,
    'UPS' + ',' + 'ALLIANCE' AS ship_carriers,
    d_year AS year,
    SUM(CASE WHEN d_moy = 1 THEN cs_ext_list_price * cs_quantity ELSE 0 END) AS jan_sales,
    SUM(CASE WHEN d_moy = 2 THEN cs_ext_list_price * cs_quantity ELSE 0 END) AS feb_sales,
    SUM(CASE WHEN d_moy = 3 THEN cs_ext_list_price * cs_quantity ELSE 0 END) AS mar_sales,
    SUM(CASE WHEN d_moy = 4 THEN cs_ext_list_price * cs_quantity ELSE 0 END) AS apr_sales,
    SUM(CASE WHEN d_moy = 5 THEN cs_ext_list_price * cs_quantity ELSE 0 END) AS may_sales,
    SUM(CASE WHEN d_moy = 6 THEN cs_ext_list_price * cs_quantity ELSE 0 END) AS jun_sales,
    SUM(CASE WHEN d_moy = 7 THEN cs_ext_list_price * cs_quantity ELSE 0 END) AS jul_sales,
    SUM(CASE WHEN d_moy = 8 THEN cs_ext_list_price * cs_quantity ELSE 0 END) AS aug_sales,
    SUM(CASE WHEN d_moy = 9 THEN cs_ext_list_price * cs_quantity ELSE 0 END) AS sep_sales,
    SUM(CASE WHEN d_moy = 10 THEN cs_ext_list_price * cs_quantity ELSE 0 END) AS oct_sales,
    SUM(CASE WHEN d_moy = 11 THEN cs_ext_list_price * cs_quantity ELSE 0 END) AS nov_sales,
    SUM(CASE WHEN d_moy = 12 THEN cs_ext_list_price * cs_quantity ELSE 0 END) AS dec_sales,
    SUM(CASE WHEN d_moy = 1 THEN cs_net_paid_inc_ship * cs_quantity ELSE 0 END) AS jan_net,
    SUM(CASE WHEN d_moy = 2 THEN cs_net_paid_inc_ship * cs_quantity ELSE 0 END) AS feb_net,
    SUM(CASE WHEN d_moy = 3 THEN cs_net_paid_inc_ship * cs_quantity ELSE 0 END) AS mar_net,
    SUM(CASE WHEN d_moy = 4 THEN cs_net_paid_inc_ship * cs_quantity ELSE 0 END) AS apr_net,
    SUM(CASE WHEN d_moy = 5 THEN cs_net_paid_inc_ship * cs_quantity ELSE 0 END) AS may_net,
    SUM(CASE WHEN d_moy = 6 THEN cs_net_paid_inc_ship * cs_quantity ELSE 0 END) AS jun_net,
    SUM(CASE WHEN d_moy = 7 THEN cs_net_paid_inc_ship * cs_quantity ELSE 0 END) AS jul_net,
    SUM(CASE WHEN d_moy = 8 THEN cs_net_paid_inc_ship * cs_quantity ELSE 0 END) AS aug_net,
    SUM(CASE WHEN d_moy = 9 THEN cs_net_paid_inc_ship * cs_quantity ELSE 0 END) AS sep_net,
    SUM(CASE WHEN d_moy = 10 THEN cs_net_paid_inc_ship * cs_quantity ELSE 0 END) AS oct_net,
    SUM(CASE WHEN d_moy = 11 THEN cs_net_paid_inc_ship * cs_quantity ELSE 0 END) AS nov_net,
    SUM(CASE WHEN d_moy = 12 THEN cs_net_paid_inc_ship * cs_quantity ELSE 0 END) AS dec_net
  FROM catalog_sales
  JOIN warehouse ON cs_warehouse_sk = w_warehouse_sk
  JOIN date_dim ON cs_sold_date_sk = d_date_sk
  JOIN time_dim ON cs_sold_time_sk = t_time_sk
  JOIN ship_mode ON cs_ship_mode_sk = sm_ship_mode_sk
  WHERE
    d_year = 2001
    AND t_time BETWEEN 46037 AND 46037 + 28800
    AND sm_carrier IN ('UPS', 'ALLIANCE')
  GROUP BY
    w_warehouse_name,
    w_warehouse_sq_ft,
    w_city,
    w_county,
    w_state,
    w_country,
    d_year
) AS x
GROUP BY
  w_warehouse_name,
  w_warehouse_sq_ft,
  w_city,
  w_county,
  w_state,
  w_country,
  ship_carriers,
  year
ORDER BY
  w_warehouse_name
OPTION (LABEL = 'TPC-DS Q66');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q67
SELECT TOP 100
  *
FROM (
  SELECT
    i_category,
    i_class,
    i_brand,
    i_product_name,
    d_year,
    d_qoy,
    d_moy,
    s_store_id,
    sumsales,
    RANK() OVER (PARTITION BY i_category ORDER BY sumsales DESC) AS rk
  FROM (
    SELECT
      i_category,
      i_class,
      i_brand,
      i_product_name,
      d_year,
      d_qoy,
      d_moy,
      s_store_id,
      SUM(COALESCE(ss_sales_price * ss_quantity, 0)) AS sumsales
    FROM store_sales
    JOIN date_dim ON ss_sold_date_sk = d_date_sk
    JOIN store ON ss_store_sk = s_store_sk
    JOIN item ON ss_item_sk = i_item_sk
    WHERE
      d_month_seq BETWEEN 1183 AND 1183 + 11
    GROUP BY
    ROLLUP (
      i_category,
      i_class,
      i_brand,
      i_product_name,
      d_year,
      d_qoy,
      d_moy,
      s_store_id
    )
  ) AS dw1
) AS dw2
WHERE
  rk <= 100
ORDER BY
  i_category,
  i_class,
  i_brand,
  i_product_name,
  d_year,
  d_qoy,
  d_moy,
  s_store_id,
  sumsales,
  rk
OPTION (LABEL = 'TPC-DS Q67');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q68
SELECT TOP 100
  c_last_name,
  c_first_name,
  ca_city,
  bought_city,
  ss_ticket_number,
  extended_price,
  extended_tax,
  list_price
FROM (
  SELECT
    ss_ticket_number,
    ss_customer_sk,
    ca_city AS bought_city,
    SUM(ss_ext_sales_price) AS extended_price,
    SUM(ss_ext_list_price) AS list_price,
    SUM(ss_ext_tax) AS extended_tax
  FROM store_sales
  JOIN date_dim ON store_sales.ss_sold_date_sk = date_dim.d_date_sk
  JOIN store ON store_sales.ss_store_sk = store.s_store_sk
  JOIN household_demographics ON store_sales.ss_hdemo_sk = household_demographics.hd_demo_sk
  JOIN customer_address ON store_sales.ss_addr_sk = customer_address.ca_address_sk
  WHERE
    date_dim.d_dom BETWEEN 1 AND 2
    AND (
      household_demographics.hd_dep_count = 6
      OR household_demographics.hd_vehicle_count = 4
    )
    AND date_dim.d_year IN (2000, 2000 + 1, 2000 + 2)
    AND store.s_city IN ('Shiloh', 'Fairview')
  GROUP BY
    ss_ticket_number,
    ss_customer_sk,
    ss_addr_sk,
    ca_city
) AS dn
JOIN customer ON ss_customer_sk = c_customer_sk
JOIN customer_address AS current_addr ON customer.c_current_addr_sk = current_addr.ca_address_sk
WHERE
  current_addr.ca_city <> bought_city
ORDER BY
  c_last_name,
  ss_ticket_number
OPTION (LABEL = 'TPC-DS Q68');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q69
SELECT TOP 100
  cd_gender,
  cd_marital_status,
  cd_education_status,
  COUNT(*) AS cnt1,
  cd_purchase_estimate,
  COUNT(*) AS cnt2,
  cd_credit_rating,
  COUNT(*) AS cnt3
FROM customer AS c
JOIN customer_address AS ca ON c.c_current_addr_sk = ca.ca_address_sk
JOIN customer_demographics ON cd_demo_sk = c.c_current_cdemo_sk
WHERE
  ca_state IN ('KS', 'MT', 'NE')
  AND EXISTS(
    SELECT
      *
    FROM store_sales
    JOIN date_dim ON ss_sold_date_sk = d_date_sk
    WHERE
      c.c_customer_sk = ss_customer_sk
      AND d_year = 2000
      AND d_moy BETWEEN 4 AND 4 + 2
  )
  AND (
    NOT EXISTS(
      SELECT
        *
      FROM web_sales
      JOIN date_dim ON ws_sold_date_sk = d_date_sk
      WHERE
        c.c_customer_sk = ws_bill_customer_sk
        AND d_year = 2000
        AND d_moy BETWEEN 4 AND 4 + 2
    )
    AND NOT EXISTS(
      SELECT
        *
      FROM catalog_sales
      JOIN date_dim ON cs_sold_date_sk = d_date_sk
      WHERE
        c.c_customer_sk = cs_ship_customer_sk
        AND d_year = 2000
        AND d_moy BETWEEN 4 AND 4 + 2
    )
  )
GROUP BY
  cd_gender,
  cd_marital_status,
  cd_education_status,
  cd_purchase_estimate,
  cd_credit_rating
ORDER BY
  cd_gender,
  cd_marital_status,
  cd_education_status,
  cd_purchase_estimate,
  cd_credit_rating
OPTION (LABEL = 'TPC-DS Q69');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q70
SELECT TOP 100
  SUM(ss_net_profit) AS total_sum,
  s_state,
  s_county,
  GROUPING(s_state) + GROUPING(s_county) AS lochierarchy,
  RANK() OVER (PARTITION BY GROUPING(s_state) + GROUPING(s_county), CASE WHEN GROUPING(s_county) = 0 THEN s_state END ORDER BY SUM(ss_net_profit) DESC) AS rank_within_parent
FROM store_sales
JOIN date_dim AS d1 ON d1.d_date_sk = ss_sold_date_sk
JOIN store ON s_store_sk = ss_store_sk
WHERE
  d1.d_month_seq BETWEEN 1183 AND 1183 + 11
  AND s_state IN (
    SELECT
      s_state
    FROM (
      SELECT
        s_state AS s_state,
        RANK() OVER (PARTITION BY s_state ORDER BY SUM(ss_net_profit) DESC) AS ranking
      FROM store_sales
      JOIN store ON s_store_sk = ss_store_sk
      JOIN date_dim ON d_date_sk = ss_sold_date_sk
      WHERE
        d_month_seq BETWEEN 1183 AND 1183 + 11
      GROUP BY
        s_state
    ) AS tmp1
    WHERE
      ranking <= 5
  )
GROUP BY
ROLLUP (
  s_state,
  s_county
)
ORDER BY
  lochierarchy DESC,
  CASE WHEN GROUPING(s_state) + GROUPING(s_county) = 0 THEN s_state END,
  rank_within_parent
OPTION (LABEL = 'TPC-DS Q70');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q71
SELECT
  i_brand_id AS brand_id,
  i_brand AS brand,
  t_hour,
  t_minute,
  SUM(ext_price) AS ext_price
FROM item
JOIN (
  SELECT
    ws_ext_sales_price AS ext_price,
    ws_sold_date_sk AS sold_date_sk,
    ws_item_sk AS sold_item_sk,
    ws_sold_time_sk AS time_sk
  FROM web_sales
  JOIN date_dim ON d_date_sk = ws_sold_date_sk
  WHERE
    d_moy = 11 AND d_year = 2000
  UNION ALL
  SELECT
    cs_ext_sales_price AS ext_price,
    cs_sold_date_sk AS sold_date_sk,
    cs_item_sk AS sold_item_sk,
    cs_sold_time_sk AS time_sk
  FROM catalog_sales
  JOIN date_dim ON d_date_sk = cs_sold_date_sk
  WHERE
    d_moy = 11 AND d_year = 2000
  UNION ALL
  SELECT
    ss_ext_sales_price AS ext_price,
    ss_sold_date_sk AS sold_date_sk,
    ss_item_sk AS sold_item_sk,
    ss_sold_time_sk AS time_sk
  FROM store_sales
  JOIN date_dim ON d_date_sk = ss_sold_date_sk
  WHERE
    d_moy = 11 AND d_year = 2000
) AS tmp ON sold_item_sk = i_item_sk
JOIN time_dim ON time_sk = t_time_sk
WHERE
  i_manager_id = 1
  AND (
    t_meal_time = 'breakfast' OR t_meal_time = 'dinner'
  )
GROUP BY
  i_brand,
  i_brand_id,
  t_hour,
  t_minute
ORDER BY
  ext_price DESC,
  i_brand_id
OPTION (LABEL = 'TPC-DS Q71');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q72
SELECT TOP 100
  i_item_desc,
  w_warehouse_name,
  d1.d_week_seq,
  SUM(CASE WHEN p_promo_sk IS NULL THEN 1 ELSE 0 END) AS no_promo,
  SUM(CASE WHEN NOT p_promo_sk IS NULL THEN 1 ELSE 0 END) AS promo,
  COUNT(*) AS total_cnt
FROM catalog_sales
JOIN inventory
  ON (
    cs_item_sk = inv_item_sk
  )
JOIN warehouse
  ON (
    w_warehouse_sk = inv_warehouse_sk
  )
JOIN item
  ON (
    i_item_sk = cs_item_sk
  )
JOIN customer_demographics
  ON (
    cs_bill_cdemo_sk = cd_demo_sk
  )
JOIN household_demographics
  ON (
    cs_bill_hdemo_sk = hd_demo_sk
  )
JOIN date_dim AS d1
  ON (
    cs_sold_date_sk = d1.d_date_sk
  )
JOIN date_dim AS d2
  ON (
    inv_date_sk = d2.d_date_sk
  )
JOIN date_dim AS d3
  ON (
    cs_ship_date_sk = d3.d_date_sk
  )
LEFT OUTER JOIN promotion
  ON (
    cs_promo_sk = p_promo_sk
  )
LEFT OUTER JOIN catalog_returns
  ON (
    cr_item_sk = cs_item_sk AND cr_order_number = cs_order_number
  )
WHERE
  d1.d_week_seq = d2.d_week_seq
  AND inv_quantity_on_hand < cs_quantity
  AND d3.d_date > DATEADD(day, 5, d1.d_date)
  AND hd_buy_potential = '>10000'
  AND d1.d_year = 2000
  AND cd_marital_status = 'S'
GROUP BY
  i_item_desc,
  w_warehouse_name,
  d1.d_week_seq
ORDER BY
  total_cnt DESC,
  i_item_desc,
  w_warehouse_name,
  d1.d_week_seq
OPTION (LABEL = 'TPC-DS Q72');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q73
SELECT
  c_last_name,
  c_first_name,
  c_salutation,
  c_preferred_cust_flag,
  ss_ticket_number,
  cnt
FROM (
  SELECT
    ss_ticket_number,
    ss_customer_sk,
    COUNT(*) AS cnt
  FROM store_sales
  JOIN date_dim ON store_sales.ss_sold_date_sk = date_dim.d_date_sk
  JOIN store ON store_sales.ss_store_sk = store.s_store_sk
  JOIN household_demographics ON store_sales.ss_hdemo_sk = household_demographics.hd_demo_sk
  WHERE
    date_dim.d_dom BETWEEN 1 AND 2
    AND (
      household_demographics.hd_buy_potential = '1001-5000'
      OR household_demographics.hd_buy_potential = '0-500'
    )
    AND household_demographics.hd_vehicle_count > 0
    AND CASE
      WHEN household_demographics.hd_vehicle_count > 0
      THEN household_demographics.hd_dep_count / household_demographics.hd_vehicle_count
      ELSE NULL
    END > 1
    AND date_dim.d_year IN (1998, 1998 + 1, 1998 + 2)
    AND store.s_county IN ('Barrow County', 'Ziebach County', 'Bronx County', 'Franklin Parish')
  GROUP BY
    ss_ticket_number,
    ss_customer_sk
) AS dj
JOIN customer ON ss_customer_sk = c_customer_sk
WHERE
  cnt BETWEEN 1 AND 5
ORDER BY
  cnt DESC,
  c_last_name ASC
OPTION (LABEL = 'TPC-DS Q73');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q74
WITH year_total AS (
  SELECT
    c_customer_id AS customer_id,
    c_first_name AS customer_first_name,
    c_last_name AS customer_last_name,
    d_year AS year,
    AVG(ss_net_paid) AS year_total,
    's' AS sale_type
  FROM customer
  JOIN store_sales ON c_customer_sk = ss_customer_sk
  JOIN date_dim ON ss_sold_date_sk = d_date_sk
  WHERE
    d_year IN (1998, 1998 + 1)
  GROUP BY
    c_customer_id,
    c_first_name,
    c_last_name,
    d_year
  UNION ALL
  SELECT
    c_customer_id AS customer_id,
    c_first_name AS customer_first_name,
    c_last_name AS customer_last_name,
    d_year AS year,
    AVG(ws_net_paid) AS year_total,
    'w' AS sale_type
  FROM customer
  JOIN web_sales ON c_customer_sk = ws_bill_customer_sk
  JOIN date_dim ON ws_sold_date_sk = d_date_sk
  WHERE
    d_year IN (1998, 1998 + 1)
  GROUP BY
    c_customer_id,
    c_first_name,
    c_last_name,
    d_year
)
SELECT TOP 100
  t_s_secyear.customer_id,
  t_s_secyear.customer_first_name,
  t_s_secyear.customer_last_name
FROM year_total AS t_s_firstyear
JOIN year_total AS t_s_secyear ON t_s_secyear.customer_id = t_s_firstyear.customer_id
JOIN year_total AS t_w_firstyear ON t_s_firstyear.customer_id = t_w_firstyear.customer_id
JOIN year_total AS t_w_secyear ON t_s_firstyear.customer_id = t_w_secyear.customer_id
WHERE
  t_s_firstyear.sale_type = 's'
  AND t_w_firstyear.sale_type = 'w'
  AND t_s_secyear.sale_type = 's'
  AND t_w_secyear.sale_type = 'w'
  AND t_s_firstyear.year = 1998
  AND t_s_secyear.year = 1998 + 1
  AND t_w_firstyear.year = 1998
  AND t_w_secyear.year = 1998 + 1
  AND t_s_firstyear.year_total > 0
  AND t_w_firstyear.year_total > 0
  AND CASE
    WHEN t_w_firstyear.year_total > 0
    THEN t_w_secyear.year_total / t_w_firstyear.year_total
    ELSE NULL
  END > CASE
    WHEN t_s_firstyear.year_total > 0
    THEN t_s_secyear.year_total / t_s_firstyear.year_total
    ELSE NULL
  END
ORDER BY
  2,
  3,
  1
OPTION (LABEL = 'TPC-DS Q74');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q75
WITH all_sales AS (
  SELECT
    d_year,
    i_brand_id,
    i_class_id,
    i_category_id,
    i_manufact_id,
    SUM(sales_cnt) AS sales_cnt,
    SUM(sales_amt) AS sales_amt
  FROM (
    SELECT
      d_year,
      i_brand_id,
      i_class_id,
      i_category_id,
      i_manufact_id,
      cs_quantity - COALESCE(cr_return_quantity, 0) AS sales_cnt,
      cs_ext_sales_price - COALESCE(cr_return_amount, 0.0) AS sales_amt
    FROM catalog_sales
    JOIN item
      ON i_item_sk = cs_item_sk
    JOIN date_dim
      ON d_date_sk = cs_sold_date_sk
    LEFT JOIN catalog_returns
      ON (
        cs_order_number = cr_order_number AND cs_item_sk = cr_item_sk
      )
    WHERE
      i_category = 'Sports'
    UNION
    SELECT
      d_year,
      i_brand_id,
      i_class_id,
      i_category_id,
      i_manufact_id,
      ss_quantity - COALESCE(sr_return_quantity, 0) AS sales_cnt,
      ss_ext_sales_price - COALESCE(sr_return_amt, 0.0) AS sales_amt
    FROM store_sales
    JOIN item
      ON i_item_sk = ss_item_sk
    JOIN date_dim
      ON d_date_sk = ss_sold_date_sk
    LEFT JOIN store_returns
      ON (
        ss_ticket_number = sr_ticket_number AND ss_item_sk = sr_item_sk
      )
    WHERE
      i_category = 'Sports'
    UNION
    SELECT
      d_year,
      i_brand_id,
      i_class_id,
      i_category_id,
      i_manufact_id,
      ws_quantity - COALESCE(wr_return_quantity, 0) AS sales_cnt,
      ws_ext_sales_price - COALESCE(wr_return_amt, 0.0) AS sales_amt
    FROM web_sales
    JOIN item
      ON i_item_sk = ws_item_sk
    JOIN date_dim
      ON d_date_sk = ws_sold_date_sk
    LEFT JOIN web_returns
      ON (
        ws_order_number = wr_order_number AND ws_item_sk = wr_item_sk
      )
    WHERE
      i_category = 'Sports'
  ) AS sales_detail
  GROUP BY
    d_year,
    i_brand_id,
    i_class_id,
    i_category_id,
    i_manufact_id
)
SELECT TOP 100
  prev_yr.d_year AS prev_year,
  curr_yr.d_year AS year,
  curr_yr.i_brand_id,
  curr_yr.i_class_id,
  curr_yr.i_category_id,
  curr_yr.i_manufact_id,
  prev_yr.sales_cnt AS prev_yr_cnt,
  curr_yr.sales_cnt AS curr_yr_cnt,
  curr_yr.sales_cnt - prev_yr.sales_cnt AS sales_cnt_diff,
  curr_yr.sales_amt - prev_yr.sales_amt AS sales_amt_diff
FROM all_sales AS curr_yr
JOIN all_sales AS prev_yr ON curr_yr.i_brand_id = prev_yr.i_brand_id
  AND curr_yr.i_class_id = prev_yr.i_class_id
  AND curr_yr.i_category_id = prev_yr.i_category_id
  AND curr_yr.i_manufact_id = prev_yr.i_manufact_id
WHERE
  curr_yr.d_year = 1999
  AND prev_yr.d_year = 1999 - 1
  AND CAST(curr_yr.sales_cnt AS DECIMAL(17, 2)) / CAST(prev_yr.sales_cnt AS DECIMAL(17, 2)) < 0.9
ORDER BY
  sales_cnt_diff,
  sales_amt_diff
OPTION (LABEL = 'TPC-DS Q75');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q76
SELECT TOP 100
  channel,
  col_name,
  d_year,
  d_qoy,
  i_category,
  COUNT(*) AS sales_cnt,
  SUM(ext_sales_price) AS sales_amt
FROM (
  SELECT
    'store' AS channel,
    'ss_cdemo_sk' AS col_name,
    d_year,
    d_qoy,
    i_category,
    ss_ext_sales_price AS ext_sales_price
  FROM store_sales
  JOIN item ON ss_item_sk = i_item_sk
  JOIN date_dim ON ss_sold_date_sk = d_date_sk
  WHERE
    ss_cdemo_sk IS NULL
  UNION ALL
  SELECT
    'web' AS channel,
    'ws_web_site_sk' AS col_name,
    d_year,
    d_qoy,
    i_category,
    ws_ext_sales_price AS ext_sales_price
  FROM web_sales
  JOIN item ON ws_item_sk = i_item_sk
  JOIN date_dim ON ws_sold_date_sk = d_date_sk
  WHERE
    ws_web_site_sk IS NULL
  UNION ALL
  SELECT
    'catalog' AS channel,
    'cs_bill_addr_sk' AS col_name,
    d_year,
    d_qoy,
    i_category,
    cs_ext_sales_price AS ext_sales_price
  FROM catalog_sales
  JOIN item ON cs_item_sk = i_item_sk
  JOIN date_dim ON cs_sold_date_sk = d_date_sk
  WHERE
    cs_bill_addr_sk IS NULL
) AS foo
GROUP BY
  channel,
  col_name,
  d_year,
  d_qoy,
  i_category
ORDER BY
  channel,
  col_name,
  d_year,
  d_qoy,
  i_category
OPTION (LABEL = 'TPC-DS Q76');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q77
WITH ss AS (
  SELECT
    s_store_sk,
    SUM(ss_ext_sales_price) AS sales,
    SUM(ss_net_profit) AS profit
  FROM store_sales
  JOIN date_dim ON ss_sold_date_sk = d_date_sk
  JOIN store ON ss_store_sk = s_store_sk
  WHERE
    d_date BETWEEN CAST('1999-08-29' AS DATE) AND (
      DATEADD(day, 30, CAST('1999-08-29' AS DATE))
    )
  GROUP BY
    s_store_sk
), sr AS (
  SELECT
    s_store_sk,
    SUM(sr_return_amt) AS returns,
    SUM(sr_net_loss) AS profit_loss
  FROM store_returns
  JOIN date_dim ON sr_returned_date_sk = d_date_sk
  JOIN store ON sr_store_sk = s_store_sk
  WHERE
    d_date BETWEEN CAST('1999-08-29' AS DATE) AND (
      DATEADD(day, 30, CAST('1999-08-29' AS DATE))
    )
  GROUP BY
    s_store_sk
), cs AS (
  SELECT
    cs_call_center_sk,
    SUM(cs_ext_sales_price) AS sales,
    SUM(cs_net_profit) AS profit
  FROM catalog_sales
  JOIN date_dim ON cs_sold_date_sk = d_date_sk
  WHERE
    d_date BETWEEN CAST('1999-08-29' AS DATE) AND (
      DATEADD(day, 30, CAST('1999-08-29' AS DATE))
    )
  GROUP BY
    cs_call_center_sk
), cr AS (
  SELECT
    cr_call_center_sk,
    SUM(cr_return_amount) AS returns,
    SUM(cr_net_loss) AS profit_loss
  FROM catalog_returns
  JOIN date_dim ON cr_returned_date_sk = d_date_sk
  WHERE
    d_date BETWEEN CAST('1999-08-29' AS DATE) AND (
      DATEADD(day, 30, CAST('1999-08-29' AS DATE))
    )
  GROUP BY
    cr_call_center_sk
), ws AS (
  SELECT
    wp_web_page_sk,
    SUM(ws_ext_sales_price) AS sales,
    SUM(ws_net_profit) AS profit
  FROM web_sales
  JOIN date_dim ON ws_sold_date_sk = d_date_sk
  JOIN web_page ON ws_web_page_sk = wp_web_page_sk
  WHERE
    d_date BETWEEN CAST('1999-08-29' AS DATE) AND (
      DATEADD(day, 30, CAST('1999-08-29' AS DATE))
    )
  GROUP BY
    wp_web_page_sk
), wr AS (
  SELECT
    wp_web_page_sk,
    SUM(wr_return_amt) AS returns,
    SUM(wr_net_loss) AS profit_loss
  FROM web_returns
  JOIN date_dim ON wr_returned_date_sk = d_date_sk
  JOIN web_page ON wr_web_page_sk = wp_web_page_sk
  WHERE
    d_date BETWEEN CAST('1999-08-29' AS DATE) AND (
      DATEADD(day, 30, CAST('1999-08-29' AS DATE))
    )
  GROUP BY
    wp_web_page_sk
)
SELECT TOP 100
  channel,
  id,
  SUM(sales) AS sales,
  SUM(returns) AS returns,
  SUM(profit) AS profit
FROM (
  SELECT
    'store channel' AS channel,
    ss.s_store_sk AS id,
    sales,
    COALESCE(returns, 0) AS returns,
    (
      profit - COALESCE(profit_loss, 0)
    ) AS profit
  FROM ss
  LEFT JOIN sr
    ON ss.s_store_sk = sr.s_store_sk
  UNION ALL
  SELECT
    'catalog channel' AS channel,
    cs_call_center_sk AS id,
    sales,
    returns,
    (
      profit - profit_loss
    ) AS profit
  FROM cs
  JOIN cr ON cs.cs_call_center_sk = cr.cr_call_center_sk
  UNION ALL
  SELECT
    'web channel' AS channel,
    ws.wp_web_page_sk AS id,
    sales,
    COALESCE(returns, 0) AS returns,
    (
      profit - COALESCE(profit_loss, 0)
    ) AS profit
  FROM ws
  LEFT JOIN wr
    ON ws.wp_web_page_sk = wr.wp_web_page_sk
) AS x
GROUP BY
ROLLUP (
  channel,
  id
)
ORDER BY
  channel,
  id
OPTION (LABEL = 'TPC-DS Q77');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q78
WITH ws AS (
  SELECT
    d_year AS ws_sold_year,
    ws_item_sk,
    ws_bill_customer_sk AS ws_customer_sk,
    SUM(ws_quantity) AS ws_qty,
    SUM(ws_wholesale_cost) AS ws_wc,
    SUM(ws_sales_price) AS ws_sp
  FROM web_sales
  LEFT JOIN web_returns
    ON wr_order_number = ws_order_number AND ws_item_sk = wr_item_sk
  JOIN date_dim
    ON ws_sold_date_sk = d_date_sk
  WHERE
    wr_order_number IS NULL
  GROUP BY
    d_year,
    ws_item_sk,
    ws_bill_customer_sk
), cs AS (
  SELECT
    d_year AS cs_sold_year,
    cs_item_sk,
    cs_bill_customer_sk AS cs_customer_sk,
    SUM(cs_quantity) AS cs_qty,
    SUM(cs_wholesale_cost) AS cs_wc,
    SUM(cs_sales_price) AS cs_sp
  FROM catalog_sales
  LEFT JOIN catalog_returns
    ON cr_order_number = cs_order_number AND cs_item_sk = cr_item_sk
  JOIN date_dim
    ON cs_sold_date_sk = d_date_sk
  WHERE
    cr_order_number IS NULL
  GROUP BY
    d_year,
    cs_item_sk,
    cs_bill_customer_sk
), ss AS (
  SELECT
    d_year AS ss_sold_year,
    ss_item_sk,
    ss_customer_sk,
    SUM(ss_quantity) AS ss_qty,
    SUM(ss_wholesale_cost) AS ss_wc,
    SUM(ss_sales_price) AS ss_sp
  FROM store_sales
  LEFT JOIN store_returns
    ON sr_ticket_number = ss_ticket_number AND ss_item_sk = sr_item_sk
  JOIN date_dim
    ON ss_sold_date_sk = d_date_sk
  WHERE
    sr_ticket_number IS NULL
  GROUP BY
    d_year,
    ss_item_sk,
    ss_customer_sk
)
SELECT TOP 100
  ss_sold_year,
  ROUND(ss_qty / (
    COALESCE(ws_qty, 0) + COALESCE(cs_qty, 0)
  ), 2) AS ratio,
  ss_qty AS store_qty,
  ss_wc AS store_wholesale_cost,
  ss_sp AS store_sales_price,
  COALESCE(ws_qty, 0) + COALESCE(cs_qty, 0) AS other_chan_qty,
  COALESCE(ws_wc, 0) + COALESCE(cs_wc, 0) AS other_chan_wholesale_cost,
  COALESCE(ws_sp, 0) + COALESCE(cs_sp, 0) AS other_chan_sales_price
FROM ss
LEFT JOIN ws
  ON (
    ws_sold_year = ss_sold_year
    AND ws_item_sk = ss_item_sk
    AND ws_customer_sk = ss_customer_sk
  )
LEFT JOIN cs
  ON (
    cs_sold_year = ss_sold_year
    AND cs_item_sk = ss_item_sk
    AND cs_customer_sk = ss_customer_sk
  )
WHERE
  (
    COALESCE(ws_qty, 0) > 0 OR COALESCE(cs_qty, 0) > 0
  ) AND ss_sold_year = 2000
ORDER BY
  ss_sold_year,
  ss_qty DESC,
  ss_wc DESC,
  ss_sp DESC,
  other_chan_qty,
  other_chan_wholesale_cost,
  other_chan_sales_price,
  ratio
OPTION (LABEL = 'TPC-DS Q78');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q79
SELECT TOP 100
  c_last_name,
  c_first_name,
  SUBSTRING(s_city, 1, 30),
  ss_ticket_number,
  amt,
  profit
FROM (
  SELECT
    ss_ticket_number,
    ss_customer_sk,
    store.s_city,
    SUM(ss_coupon_amt) AS amt,
    SUM(ss_net_profit) AS profit
  FROM store_sales
  JOIN date_dim ON store_sales.ss_sold_date_sk = date_dim.d_date_sk
  JOIN store ON store_sales.ss_store_sk = store.s_store_sk
  JOIN household_demographics ON store_sales.ss_hdemo_sk = household_demographics.hd_demo_sk
  WHERE
    (
      household_demographics.hd_dep_count = 2
      OR household_demographics.hd_vehicle_count > 1
    )
    AND date_dim.d_dow = 1
    AND date_dim.d_year IN (1999, 1999 + 1, 1999 + 2)
    AND store.s_number_employees BETWEEN 200 AND 295
  GROUP BY
    ss_ticket_number,
    ss_customer_sk,
    ss_addr_sk,
    store.s_city
) AS ms
JOIN customer ON ss_customer_sk = c_customer_sk
ORDER BY
  c_last_name,
  c_first_name,
  SUBSTRING(s_city, 1, 30),
  profit
OPTION (LABEL = 'TPC-DS Q79');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q80
WITH ssr AS (
  SELECT
    s_store_id AS store_id,
    SUM(ss_ext_sales_price) AS sales,
    SUM(COALESCE(sr_return_amt, 0)) AS returns,
    SUM(ss_net_profit - COALESCE(sr_net_loss, 0)) AS profit
  FROM store_sales
  LEFT OUTER JOIN store_returns
    ON (
      ss_item_sk = sr_item_sk AND ss_ticket_number = sr_ticket_number
    )
  JOIN date_dim ON ss_sold_date_sk = d_date_sk
  JOIN store ON ss_store_sk = s_store_sk
  JOIN item ON ss_item_sk = i_item_sk
  JOIN promotion ON ss_promo_sk = p_promo_sk
  WHERE
    d_date BETWEEN CAST('1999-08-29' AS DATE) AND (
      DATEADD(day, 30, CAST('1999-08-29' AS DATE))
    )
    AND i_current_price > 50
    AND p_channel_tv = 'N'
  GROUP BY
    s_store_id
), csr AS (
  SELECT
    cp_catalog_page_id AS catalog_page_id,
    SUM(cs_ext_sales_price) AS sales,
    SUM(COALESCE(cr_return_amount, 0)) AS returns,
    SUM(cs_net_profit - COALESCE(cr_net_loss, 0)) AS profit
  FROM catalog_sales
  LEFT OUTER JOIN catalog_returns
    ON (
      cs_item_sk = cr_item_sk AND cs_order_number = cr_order_number
    )
  JOIN date_dim ON cs_sold_date_sk = d_date_sk
  JOIN catalog_page ON cs_catalog_page_sk = cp_catalog_page_sk
  JOIN item ON cs_item_sk = i_item_sk
  JOIN promotion ON cs_promo_sk = p_promo_sk
  WHERE
    d_date BETWEEN CAST('1999-08-29' AS DATE) AND (
      DATEADD(day, 30, CAST('1999-08-29' AS DATE))
    )
    AND i_current_price > 50
    AND p_channel_tv = 'N'
  GROUP BY
    cp_catalog_page_id
), wsr AS (
  SELECT
    web_site_id,
    SUM(ws_ext_sales_price) AS sales,
    SUM(COALESCE(wr_return_amt, 0)) AS returns,
    SUM(ws_net_profit - COALESCE(wr_net_loss, 0)) AS profit
  FROM web_sales
  LEFT OUTER JOIN web_returns
    ON (
      ws_item_sk = wr_item_sk AND ws_order_number = wr_order_number
    )
  JOIN date_dim ON ws_sold_date_sk = d_date_sk
  JOIN web_site ON ws_web_site_sk = web_site_sk
  JOIN item ON ws_item_sk = i_item_sk
  JOIN promotion ON ws_promo_sk = p_promo_sk
  WHERE
    d_date BETWEEN CAST('1999-08-29' AS DATE) AND (
      DATEADD(day, 30, CAST('1999-08-29' AS DATE))
    )
    AND i_current_price > 50
    AND p_channel_tv = 'N'
  GROUP BY
    web_site_id
)
SELECT TOP 100
  channel,
  id,
  SUM(sales) AS sales,
  SUM(returns) AS returns,
  SUM(profit) AS profit
FROM (
  SELECT
    'store channel' AS channel,
    'store' + store_id AS id,
    sales,
    returns,
    profit
  FROM ssr
  UNION ALL
  SELECT
    'catalog channel' AS channel,
    'catalog_page' + catalog_page_id AS id,
    sales,
    returns,
    profit
  FROM csr
  UNION ALL
  SELECT
    'web channel' AS channel,
    'web_site' + web_site_id AS id,
    sales,
    returns,
    profit
  FROM wsr
) AS x
GROUP BY
ROLLUP (
  channel,
  id
)
ORDER BY
  channel,
  id
OPTION (LABEL = 'TPC-DS Q80');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q81
WITH customer_total_return AS (
  SELECT
    cr_returning_customer_sk AS ctr_customer_sk,
    ca_state AS ctr_state,
    SUM(cr_return_amt_inc_tax) AS ctr_total_return
  FROM catalog_returns
  JOIN date_dim ON cr_returned_date_sk = d_date_sk
  JOIN customer_address ON cr_returning_addr_sk = ca_address_sk
  WHERE
    d_year = 1999
  GROUP BY
    cr_returning_customer_sk,
    ca_state
)
SELECT TOP 100
  c_customer_id,
  c_salutation,
  c_first_name,
  c_last_name,
  ca_street_number,
  ca_street_name,
  ca_street_type,
  ca_suite_number,
  ca_city,
  ca_county,
  ca_state,
  ca_zip,
  ca_country,
  ca_gmt_offset,
  ca_location_type,
  ctr_total_return
FROM customer_total_return AS ctr1
JOIN customer ON ctr1.ctr_customer_sk = c_customer_sk
JOIN customer_address ON ca_address_sk = c_current_addr_sk
WHERE
  ctr1.ctr_total_return > (
    SELECT
      AVG(ctr_total_return) * 1.2
    FROM customer_total_return AS ctr2
    WHERE
      ctr1.ctr_state = ctr2.ctr_state
  )
  AND ca_state = 'KY'
ORDER BY
  c_customer_id,
  c_salutation,
  c_first_name,
  c_last_name,
  ca_street_number,
  ca_street_name,
  ca_street_type,
  ca_suite_number,
  ca_city,
  ca_county,
  ca_state,
  ca_zip,
  ca_country,
  ca_gmt_offset,
  ca_location_type,
  ctr_total_return
OPTION (LABEL = 'TPC-DS Q81');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q82
SELECT TOP 100
  i_item_id,
  i_item_desc,
  i_current_price
FROM item
JOIN inventory ON inv_item_sk = i_item_sk
JOIN date_dim ON d_date_sk = inv_date_sk
JOIN store_sales ON ss_item_sk = i_item_sk
WHERE
  i_current_price BETWEEN 82 AND 82 + 30
  AND d_date BETWEEN CAST('2002-07-07' AS DATE) AND (
    DATEADD(day, 60, CAST('2002-07-07' AS DATE))
  )
  AND i_manufact_id IN (718, 646, 539, 176)
  AND inv_quantity_on_hand BETWEEN 100 AND 500
GROUP BY
  i_item_id,
  i_item_desc,
  i_current_price
ORDER BY
  i_item_id
OPTION (LABEL = 'TPC-DS Q82');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q83
WITH sr_items AS (
  SELECT
    i_item_id AS item_id,
    SUM(sr_return_quantity) AS sr_item_qty
  FROM store_returns
  JOIN item ON sr_item_sk = i_item_sk
  JOIN date_dim ON sr_returned_date_sk = d_date_sk
  WHERE
    d_date IN (
      SELECT
        d_date
      FROM date_dim
      WHERE
        d_week_seq IN (
          SELECT
            d_week_seq
          FROM date_dim
          WHERE
            d_date IN ('1999-02-22', '1999-08-19', '1999-11-19')
        )
    )
  GROUP BY
    i_item_id
), cr_items AS (
  SELECT
    i_item_id AS item_id,
    SUM(cr_return_quantity) AS cr_item_qty
  FROM catalog_returns
  JOIN item ON cr_item_sk = i_item_sk
  JOIN date_dim ON cr_returned_date_sk = d_date_sk
  WHERE
    d_date IN (
      SELECT
        d_date
      FROM date_dim
      WHERE
        d_week_seq IN (
          SELECT
            d_week_seq
          FROM date_dim
          WHERE
            d_date IN ('1999-02-22', '1999-08-19', '1999-11-19')
        )
    )
  GROUP BY
    i_item_id
), wr_items AS (
  SELECT
    i_item_id AS item_id,
    SUM(wr_return_quantity) AS wr_item_qty
  FROM web_returns
  JOIN item ON wr_item_sk = i_item_sk
  JOIN date_dim ON wr_returned_date_sk = d_date_sk
  WHERE
    d_date IN (
      SELECT
        d_date
      FROM date_dim
      WHERE
        d_week_seq IN (
          SELECT
            d_week_seq
          FROM date_dim
          WHERE
            d_date IN ('1999-02-22', '1999-08-19', '1999-11-19')
        )
    )
  GROUP BY
    i_item_id
)
SELECT TOP 100
  sr_items.item_id,
  sr_item_qty,
  sr_item_qty / (
    sr_item_qty + cr_item_qty + wr_item_qty
  ) / 3.0 * 100 AS sr_dev,
  cr_item_qty,
  cr_item_qty / (
    sr_item_qty + cr_item_qty + wr_item_qty
  ) / 3.0 * 100 AS cr_dev,
  wr_item_qty,
  wr_item_qty / (
    sr_item_qty + cr_item_qty + wr_item_qty
  ) / 3.0 * 100 AS wr_dev,
  (
    sr_item_qty + cr_item_qty + wr_item_qty
  ) / 3.0 AS average
FROM sr_items
JOIN cr_items ON sr_items.item_id = cr_items.item_id
JOIN wr_items ON sr_items.item_id = wr_items.item_id
ORDER BY
  sr_items.item_id,
  sr_item_qty
OPTION (LABEL = 'TPC-DS Q83');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q84
SELECT TOP 100
  c_customer_id AS customer_id,
  COALESCE(c_last_name, '') + ', ' + COALESCE(c_first_name, '') AS customername
FROM customer
JOIN customer_address ON c_current_addr_sk = ca_address_sk
JOIN customer_demographics ON cd_demo_sk = c_current_cdemo_sk
JOIN household_demographics ON hd_demo_sk = c_current_hdemo_sk
JOIN income_band ON ib_income_band_sk = hd_income_band_sk
JOIN store_returns ON sr_cdemo_sk = cd_demo_sk
WHERE
  ca_city = 'Waterloo'
  AND ib_lower_bound >= 17683
  AND ib_upper_bound <= 17683 + 50000
ORDER BY
  c_customer_id
OPTION (LABEL = 'TPC-DS Q84');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q85
SELECT TOP 100
  SUBSTRING(r_reason_desc, 1, 20),
  AVG(ws_quantity),
  AVG(wr_refunded_cash),
  AVG(wr_fee)
FROM web_sales
JOIN web_returns ON ws_item_sk = wr_item_sk
  AND ws_order_number = wr_order_number
JOIN web_page ON ws_web_page_sk = wp_web_page_sk
JOIN customer_demographics AS cd1 ON cd1.cd_demo_sk = wr_refunded_cdemo_sk
JOIN customer_demographics AS cd2 ON cd2.cd_demo_sk = wr_returning_cdemo_sk
JOIN customer_address ON ca_address_sk = wr_refunded_addr_sk
JOIN date_dim ON ws_sold_date_sk = d_date_sk
JOIN reason ON r_reason_sk = wr_reason_sk
WHERE
  d_year = 1999
  AND (
    (
      cd1.cd_marital_status = 'U'
      AND cd1.cd_marital_status = cd2.cd_marital_status
      AND cd1.cd_education_status = 'Primary'
      AND cd1.cd_education_status = cd2.cd_education_status
      AND ws_sales_price BETWEEN 100.00 AND 150.00
    )
    OR (
      cd1.cd_marital_status = 'D'
      AND cd1.cd_marital_status = cd2.cd_marital_status
      AND cd1.cd_education_status = 'College'
      AND cd1.cd_education_status = cd2.cd_education_status
      AND ws_sales_price BETWEEN 50.00 AND 100.00
    )
    OR (
      cd1.cd_marital_status = 'M'
      AND cd1.cd_marital_status = cd2.cd_marital_status
      AND cd1.cd_education_status = 'Unknown'
      AND cd1.cd_education_status = cd2.cd_education_status
      AND ws_sales_price BETWEEN 150.00 AND 200.00
    )
  )
  AND (
    (
      ca_country = 'United States'
      AND ca_state IN ('IN', 'MN', 'NE')
      AND ws_net_profit BETWEEN 100 AND 200
    )
    OR (
      ca_country = 'United States'
      AND ca_state IN ('OH', 'SC', 'KY')
      AND ws_net_profit BETWEEN 150 AND 300
    )
    OR (
      ca_country = 'United States'
      AND ca_state IN ('VA', 'IL', 'GA')
      AND ws_net_profit BETWEEN 50 AND 250
    )
  )
GROUP BY
  r_reason_desc
ORDER BY
  SUBSTRING(r_reason_desc, 1, 20),
  AVG(ws_quantity),
  AVG(wr_refunded_cash),
  AVG(wr_fee)
OPTION (LABEL = 'TPC-DS Q85');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q86
SELECT TOP 100
  SUM(ws_net_paid) AS total_sum,
  i_category,
  i_class,
  GROUPING(i_category) + GROUPING(i_class) AS lochierarchy,
  RANK() OVER (PARTITION BY GROUPING(i_category) + GROUPING(i_class), CASE WHEN GROUPING(i_class) = 0 THEN i_category END ORDER BY SUM(ws_net_paid) DESC) AS rank_within_parent
FROM web_sales
JOIN date_dim AS d1 ON d1.d_date_sk = ws_sold_date_sk
JOIN item ON i_item_sk = ws_item_sk
WHERE
  d1.d_month_seq BETWEEN 1183 AND 1183 + 11
GROUP BY
ROLLUP (
  i_category,
  i_class
)
ORDER BY
  lochierarchy DESC,
  CASE WHEN GROUPING(i_category) + GROUPING(i_class) = 0 THEN i_category END,
  rank_within_parent
OPTION (LABEL = 'TPC-DS Q86');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q87
SELECT
  COUNT(*)
FROM (
  (
    SELECT DISTINCT
      c_last_name,
      c_first_name,
      d_date
    FROM store_sales
    JOIN date_dim ON store_sales.ss_sold_date_sk = date_dim.d_date_sk
    JOIN customer ON store_sales.ss_customer_sk = customer.c_customer_sk
    WHERE
      d_month_seq BETWEEN 1183 AND 1183 + 11
  )
  EXCEPT
  (
    SELECT DISTINCT
      c_last_name,
      c_first_name,
      d_date
    FROM catalog_sales
    JOIN date_dim ON catalog_sales.cs_sold_date_sk = date_dim.d_date_sk
    JOIN customer ON catalog_sales.cs_bill_customer_sk = customer.c_customer_sk
    WHERE
      d_month_seq BETWEEN 1183 AND 1183 + 11
  )
  EXCEPT
  (
    SELECT DISTINCT
      c_last_name,
      c_first_name,
      d_date
    FROM web_sales
    JOIN date_dim ON web_sales.ws_sold_date_sk = date_dim.d_date_sk
    JOIN customer ON web_sales.ws_bill_customer_sk = customer.c_customer_sk
    WHERE
      d_month_seq BETWEEN 1183 AND 1183 + 11
  )
) AS cool_cust
OPTION (LABEL = 'TPC-DS Q87');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q88
SELECT
  *
FROM (
  SELECT
    COUNT(*) AS h8_30_to_9
  FROM store_sales
  JOIN household_demographics ON ss_hdemo_sk = household_demographics.hd_demo_sk
  JOIN time_dim ON ss_sold_time_sk = time_dim.t_time_sk
  JOIN store ON ss_store_sk = s_store_sk
  WHERE
    time_dim.t_hour = 8
    AND time_dim.t_minute >= 30
    AND (
      (
        household_demographics.hd_dep_count = 0
        AND household_demographics.hd_vehicle_count <= 0 + 2
      )
      OR (
        household_demographics.hd_dep_count = 1
        AND household_demographics.hd_vehicle_count <= 1 + 2
      )
      OR (
        household_demographics.hd_dep_count = -1
        AND household_demographics.hd_vehicle_count <= -1 + 2
      )
    )
    AND store.s_store_name = 'ese'
) AS s1, (
  SELECT
    COUNT(*) AS h9_to_9_30
  FROM store_sales
  JOIN household_demographics ON ss_hdemo_sk = household_demographics.hd_demo_sk
  JOIN time_dim ON ss_sold_time_sk = time_dim.t_time_sk
  JOIN store ON ss_store_sk = s_store_sk
  WHERE
    time_dim.t_hour = 9
    AND time_dim.t_minute < 30
    AND (
      (
        household_demographics.hd_dep_count = 0
        AND household_demographics.hd_vehicle_count <= 0 + 2
      )
      OR (
        household_demographics.hd_dep_count = 1
        AND household_demographics.hd_vehicle_count <= 1 + 2
      )
      OR (
        household_demographics.hd_dep_count = -1
        AND household_demographics.hd_vehicle_count <= -1 + 2
      )
    )
    AND store.s_store_name = 'ese'
) AS s2, (
  SELECT
    COUNT(*) AS h9_30_to_10
  FROM store_sales
  JOIN household_demographics ON ss_hdemo_sk = household_demographics.hd_demo_sk
  JOIN time_dim ON ss_sold_time_sk = time_dim.t_time_sk
  JOIN store ON ss_store_sk = s_store_sk
  WHERE
    time_dim.t_hour = 9
    AND time_dim.t_minute >= 30
    AND (
      (
        household_demographics.hd_dep_count = 0
        AND household_demographics.hd_vehicle_count <= 0 + 2
      )
      OR (
        household_demographics.hd_dep_count = 1
        AND household_demographics.hd_vehicle_count <= 1 + 2
      )
      OR (
        household_demographics.hd_dep_count = -1
        AND household_demographics.hd_vehicle_count <= -1 + 2
      )
    )
    AND store.s_store_name = 'ese'
) AS s3, (
  SELECT
    COUNT(*) AS h10_to_10_30
  FROM store_sales
  JOIN household_demographics ON ss_hdemo_sk = household_demographics.hd_demo_sk
  JOIN time_dim ON ss_sold_time_sk = time_dim.t_time_sk
  JOIN store ON ss_store_sk = s_store_sk
  WHERE
    time_dim.t_hour = 10
    AND time_dim.t_minute < 30
    AND (
      (
        household_demographics.hd_dep_count = 0
        AND household_demographics.hd_vehicle_count <= 0 + 2
      )
      OR (
        household_demographics.hd_dep_count = 1
        AND household_demographics.hd_vehicle_count <= 1 + 2
      )
      OR (
        household_demographics.hd_dep_count = -1
        AND household_demographics.hd_vehicle_count <= -1 + 2
      )
    )
    AND store.s_store_name = 'ese'
) AS s4, (
  SELECT
    COUNT(*) AS h10_30_to_11
  FROM store_sales
  JOIN household_demographics ON ss_hdemo_sk = household_demographics.hd_demo_sk
  JOIN time_dim ON ss_sold_time_sk = time_dim.t_time_sk
  JOIN store ON ss_store_sk = s_store_sk
  WHERE
    time_dim.t_hour = 10
    AND time_dim.t_minute >= 30
    AND (
      (
        household_demographics.hd_dep_count = 0
        AND household_demographics.hd_vehicle_count <= 0 + 2
      )
      OR (
        household_demographics.hd_dep_count = 1
        AND household_demographics.hd_vehicle_count <= 1 + 2
      )
      OR (
        household_demographics.hd_dep_count = -1
        AND household_demographics.hd_vehicle_count <= -1 + 2
      )
    )
    AND store.s_store_name = 'ese'
) AS s5, (
  SELECT
    COUNT(*) AS h11_to_11_30
  FROM store_sales
  JOIN household_demographics ON ss_hdemo_sk = household_demographics.hd_demo_sk
  JOIN time_dim ON ss_sold_time_sk = time_dim.t_time_sk
  JOIN store ON ss_store_sk = s_store_sk
  WHERE
    time_dim.t_hour = 11
    AND time_dim.t_minute < 30
    AND (
      (
        household_demographics.hd_dep_count = 0
        AND household_demographics.hd_vehicle_count <= 0 + 2
      )
      OR (
        household_demographics.hd_dep_count = 1
        AND household_demographics.hd_vehicle_count <= 1 + 2
      )
      OR (
        household_demographics.hd_dep_count = -1
        AND household_demographics.hd_vehicle_count <= -1 + 2
      )
    )
    AND store.s_store_name = 'ese'
) AS s6, (
  SELECT
    COUNT(*) AS h11_30_to_12
  FROM store_sales
  JOIN household_demographics ON ss_hdemo_sk = household_demographics.hd_demo_sk
  JOIN time_dim ON ss_sold_time_sk = time_dim.t_time_sk
  JOIN store ON ss_store_sk = s_store_sk
  WHERE
    time_dim.t_hour = 11
    AND time_dim.t_minute >= 30
    AND (
      (
        household_demographics.hd_dep_count = 0
        AND household_demographics.hd_vehicle_count <= 0 + 2
      )
      OR (
        household_demographics.hd_dep_count = 1
        AND household_demographics.hd_vehicle_count <= 1 + 2
      )
      OR (
        household_demographics.hd_dep_count = -1
        AND household_demographics.hd_vehicle_count <= -1 + 2
      )
    )
    AND store.s_store_name = 'ese'
) AS s7, (
  SELECT
    COUNT(*) AS h12_to_12_30
  FROM store_sales
  JOIN household_demographics ON ss_hdemo_sk = household_demographics.hd_demo_sk
  JOIN time_dim ON ss_sold_time_sk = time_dim.t_time_sk
  JOIN store ON ss_store_sk = s_store_sk
  WHERE
    time_dim.t_hour = 12
    AND time_dim.t_minute < 30
    AND (
      (
        household_demographics.hd_dep_count = 0
        AND household_demographics.hd_vehicle_count <= 0 + 2
      )
      OR (
        household_demographics.hd_dep_count = 1
        AND household_demographics.hd_vehicle_count <= 1 + 2
      )
      OR (
        household_demographics.hd_dep_count = -1
        AND household_demographics.hd_vehicle_count <= -1 + 2
      )
    )
    AND store.s_store_name = 'ese'
) AS s8
OPTION (LABEL = 'TPC-DS Q88');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q89
SELECT TOP 100
  *
FROM (
  SELECT
    i_category,
    i_class,
    i_brand,
    s_store_name,
    s_company_name,
    d_moy,
    SUM(ss_sales_price) AS sum_sales,
    AVG(SUM(ss_sales_price)) OVER (PARTITION BY i_category, i_brand, s_store_name, s_company_name) AS avg_monthly_sales
  FROM item
  JOIN store_sales ON ss_item_sk = i_item_sk
  JOIN date_dim ON ss_sold_date_sk = d_date_sk
  JOIN store ON ss_store_sk = s_store_sk
  WHERE
    d_year IN (1999)
    AND (
      (
        i_category IN ('Jewelry', 'Books', 'Shoes')
        AND i_class IN ('rings', 'arts', 'athletic')
      )
      OR (
        i_category IN ('Electronics', 'Children', 'Sports')
        AND i_class IN ('wireless', 'toddlers', 'camping')
      )
    )
  GROUP BY
    i_category,
    i_class,
    i_brand,
    s_store_name,
    s_company_name,
    d_moy
) AS tmp1
WHERE
  CASE
    WHEN (
      avg_monthly_sales <> 0
    )
    THEN (
      ABS(sum_sales - avg_monthly_sales) / avg_monthly_sales
    )
    ELSE NULL
  END > 0.1
ORDER BY
  sum_sales - avg_monthly_sales,
  s_store_name
OPTION (LABEL = 'TPC-DS Q89');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q90
SELECT TOP 100
  CAST(amc AS DECIMAL(15, 4)) / CAST(NULLIF(pmc, 0) AS DECIMAL(15, 4)) AS am_pm_ratio --NULLIF to avoid divide by zero error on small scales
FROM (
  SELECT
    COUNT(*) AS amc
  FROM web_sales
  JOIN household_demographics ON ws_ship_hdemo_sk = household_demographics.hd_demo_sk
  JOIN time_dim ON ws_sold_time_sk = time_dim.t_time_sk
  JOIN web_page ON ws_web_page_sk = web_page.wp_web_page_sk
  WHERE
    time_dim.t_hour BETWEEN 7 AND 7 + 1
    AND household_demographics.hd_dep_count = 2
    AND web_page.wp_char_count BETWEEN 5000 AND 5200
) AS at_time, (
  SELECT
    COUNT(*) AS pmc
  FROM web_sales
  JOIN household_demographics ON ws_ship_hdemo_sk = household_demographics.hd_demo_sk
  JOIN time_dim ON ws_sold_time_sk = time_dim.t_time_sk
  JOIN web_page ON ws_web_page_sk = web_page.wp_web_page_sk
  WHERE
    time_dim.t_hour BETWEEN 21 AND 21 + 1
    AND household_demographics.hd_dep_count = 2
    AND web_page.wp_char_count BETWEEN 5000 AND 5200
) AS pt_time
ORDER BY
  am_pm_ratio
OPTION (LABEL = 'TPC-DS Q90');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q91
SELECT
  cc_call_center_id AS Call_Center,
  cc_name AS Call_Center_Name,
  cc_manager AS Manager,
  SUM(cr_net_loss) AS Returns_Loss
FROM call_center
JOIN catalog_returns ON cr_call_center_sk = cc_call_center_sk
JOIN date_dim ON cr_returned_date_sk = d_date_sk
JOIN customer ON cr_returning_customer_sk = c_customer_sk
JOIN customer_address ON ca_address_sk = c_current_addr_sk
JOIN customer_demographics ON cd_demo_sk = c_current_cdemo_sk
JOIN household_demographics ON hd_demo_sk = c_current_hdemo_sk
WHERE
  d_year = 2002
  AND d_moy = 11
  AND (
    (
      cd_marital_status = 'M' AND cd_education_status = 'Unknown'
    )
    OR (
      cd_marital_status = 'W' AND cd_education_status = 'Advanced Degree'
    )
  )
  AND hd_buy_potential LIKE '>10000%'
  AND ca_gmt_offset = -6
GROUP BY
  cc_call_center_id,
  cc_name,
  cc_manager,
  cd_marital_status,
  cd_education_status
ORDER BY
  SUM(cr_net_loss) DESC
OPTION (LABEL = 'TPC-DS Q91');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q92
SELECT TOP 100
  SUM(ws_ext_discount_amt) AS [Excess Discount Amount]
FROM web_sales
JOIN item ON i_item_sk = ws_item_sk
JOIN date_dim ON d_date_sk = ws_sold_date_sk
WHERE
  i_manufact_id = 33
  AND d_date BETWEEN '1999-02-10' AND (
    DATEADD(day, 90, CAST('1999-02-10' AS DATE))
  )
  AND ws_ext_discount_amt > (
    SELECT
      1.3 * AVG(ws_ext_discount_amt)
    FROM web_sales
    JOIN date_dim ON d_date_sk = ws_sold_date_sk
    WHERE
      ws_item_sk = i_item_sk
      AND d_date BETWEEN '1999-02-10' AND (
        DATEADD(day, 90, CAST('1999-02-10' AS DATE))
      )
  )
ORDER BY
  SUM(ws_ext_discount_amt)
OPTION (LABEL = 'TPC-DS Q92');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q93
SELECT TOP 100
  ss_customer_sk,
  SUM(act_sales) AS sumsales
FROM (
  SELECT
    ss_item_sk,
    ss_ticket_number,
    ss_customer_sk,
    CASE
      WHEN NOT sr_return_quantity IS NULL
      THEN (
        ss_quantity - sr_return_quantity
      ) * ss_sales_price
      ELSE (
        ss_quantity * ss_sales_price
      )
    END AS act_sales
  FROM store_sales
  LEFT OUTER JOIN store_returns
    ON (
      sr_item_sk = ss_item_sk AND sr_ticket_number = ss_ticket_number
    )
  JOIN reason ON sr_reason_sk = r_reason_sk
  WHERE
    r_reason_desc = 'reason 42'
) AS t
GROUP BY
  ss_customer_sk
ORDER BY
  sumsales,
  ss_customer_sk
OPTION (LABEL = 'TPC-DS Q93');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q94
SELECT TOP 100
  COUNT(DISTINCT ws_order_number) AS [order count],
  SUM(ws_ext_ship_cost) AS [total shipping cost],
  SUM(ws_net_profit) AS [total net profit]
FROM web_sales AS ws1
JOIN date_dim ON ws1.ws_ship_date_sk = d_date_sk
JOIN customer_address ON ws1.ws_ship_addr_sk = ca_address_sk
JOIN web_site ON ws1.ws_web_site_sk = web_site_sk
WHERE
  d_date BETWEEN '1999-5-01' AND (
    DATEADD(day, 60, CAST('1999-5-01' AS DATE))
  )
  AND ca_state = 'TX'
  AND web_company_name = 'pri'
  AND EXISTS(
    SELECT
      *
    FROM web_sales AS ws2
    WHERE
      ws1.ws_order_number = ws2.ws_order_number
      AND ws1.ws_warehouse_sk <> ws2.ws_warehouse_sk
  )
  AND NOT EXISTS(
    SELECT
      *
    FROM web_returns AS wr1
    WHERE
      ws1.ws_order_number = wr1.wr_order_number
  )
ORDER BY
  COUNT(DISTINCT ws_order_number)
OPTION (LABEL = 'TPC-DS Q94');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q95
WITH ws_wh AS (
  SELECT
    ws1.ws_order_number,
    ws1.ws_warehouse_sk AS wh1,
    ws2.ws_warehouse_sk AS wh2
  FROM web_sales AS ws1
  JOIN web_sales AS ws2 ON ws1.ws_order_number = ws2.ws_order_number
  WHERE
    ws1.ws_warehouse_sk <> ws2.ws_warehouse_sk
)
SELECT TOP 100
  COUNT(DISTINCT ws_order_number) AS [order count],
  SUM(ws_ext_ship_cost) AS [total shipping cost],
  SUM(ws_net_profit) AS [total net profit]
FROM web_sales AS ws1
JOIN date_dim ON ws1.ws_ship_date_sk = d_date_sk
JOIN customer_address ON ws1.ws_ship_addr_sk = ca_address_sk
JOIN web_site ON ws1.ws_web_site_sk = web_site_sk
WHERE
  d_date BETWEEN '1999-5-01' AND (
    DATEADD(day, 60, CAST('1999-5-01' AS DATE))
  )
  AND ca_state = 'TX'
  AND web_company_name = 'pri'
  AND ws1.ws_order_number IN (
    SELECT
      ws_order_number
    FROM ws_wh
  )
  AND ws1.ws_order_number IN (
    SELECT
      wr_order_number
    FROM web_returns
    JOIN ws_wh ON wr_order_number = ws_wh.ws_order_number
  )
ORDER BY
  COUNT(DISTINCT ws_order_number)
OPTION (LABEL = 'TPC-DS Q95');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q96
SELECT TOP 100
  COUNT(*)
FROM store_sales
JOIN household_demographics ON ss_hdemo_sk = household_demographics.hd_demo_sk
JOIN time_dim ON ss_sold_time_sk = time_dim.t_time_sk
JOIN store ON ss_store_sk = s_store_sk
WHERE
  time_dim.t_hour = 8
  AND time_dim.t_minute >= 30
  AND household_demographics.hd_dep_count = 6
  AND store.s_store_name = 'ese'
ORDER BY
  COUNT(*)
OPTION (LABEL = 'TPC-DS Q96');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q97
WITH ssci AS (
  SELECT
    ss_customer_sk AS customer_sk,
    ss_item_sk AS item_sk
  FROM store_sales
  JOIN date_dim ON ss_sold_date_sk = d_date_sk
  WHERE
    d_month_seq BETWEEN 1183 AND 1183 + 11
  GROUP BY
    ss_customer_sk,
    ss_item_sk
), csci AS (
  SELECT
    cs_bill_customer_sk AS customer_sk,
    cs_item_sk AS item_sk
  FROM catalog_sales
  JOIN date_dim ON cs_sold_date_sk = d_date_sk
  WHERE
    d_month_seq BETWEEN 1183 AND 1183 + 11
  GROUP BY
    cs_bill_customer_sk,
    cs_item_sk
)
SELECT TOP 100
  SUM(
    CASE
      WHEN NOT ssci.customer_sk IS NULL AND csci.customer_sk IS NULL
      THEN 1
      ELSE 0
    END
  ) AS store_only,
  SUM(
    CASE
      WHEN ssci.customer_sk IS NULL AND NOT csci.customer_sk IS NULL
      THEN 1
      ELSE 0
    END
  ) AS catalog_only,
  SUM(
    CASE
      WHEN NOT ssci.customer_sk IS NULL AND NOT csci.customer_sk IS NULL
      THEN 1
      ELSE 0
    END
  ) AS store_and_catalog
FROM ssci
FULL OUTER JOIN csci
  ON (
    ssci.customer_sk = csci.customer_sk AND ssci.item_sk = csci.item_sk
  )
OPTION (LABEL = 'TPC-DS Q97');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q98
SELECT
  i_item_id,
  i_item_desc,
  i_category,
  i_class,
  i_current_price,
  SUM(ss_ext_sales_price) AS itemrevenue,
  SUM(ss_ext_sales_price) * 100 / SUM(SUM(ss_ext_sales_price)) OVER (PARTITION BY i_class) AS revenueratio
FROM store_sales
JOIN item ON ss_item_sk = i_item_sk
JOIN date_dim ON ss_sold_date_sk = d_date_sk
WHERE
  i_category IN ('Music', 'Sports', 'Children')
  AND d_date BETWEEN CAST('1998-03-14' AS DATE) AND (
    DATEADD(day, 30, CAST('1998-03-14' AS DATE))
  )
GROUP BY
  i_item_id,
  i_item_desc,
  i_category,
  i_class,
  i_current_price
ORDER BY
  i_category,
  i_class,
  i_item_id,
  i_item_desc,
  revenueratio
OPTION (LABEL = 'TPC-DS Q98');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- CELL ********************

-- TPC-DS Q99
SELECT TOP 100
  SUBSTRING(w_warehouse_name, 1, 20),
  sm_type,
  cc_name,
  SUM(CASE WHEN (
    cs_ship_date_sk - cs_sold_date_sk <= 30
  ) THEN 1 ELSE 0 END) AS [30 days],
  SUM(
    CASE
      WHEN (
        cs_ship_date_sk - cs_sold_date_sk > 30
      )
      AND (
        cs_ship_date_sk - cs_sold_date_sk <= 60
      )
      THEN 1
      ELSE 0
    END
  ) AS [31-60 days],
  SUM(
    CASE
      WHEN (
        cs_ship_date_sk - cs_sold_date_sk > 60
      )
      AND (
        cs_ship_date_sk - cs_sold_date_sk <= 90
      )
      THEN 1
      ELSE 0
    END
  ) AS [61-90 days],
  SUM(
    CASE
      WHEN (
        cs_ship_date_sk - cs_sold_date_sk > 90
      )
      AND (
        cs_ship_date_sk - cs_sold_date_sk <= 120
      )
      THEN 1
      ELSE 0
    END
  ) AS [91-120 days],
  SUM(CASE WHEN (
    cs_ship_date_sk - cs_sold_date_sk > 120
  ) THEN 1 ELSE 0 END) AS [>120 days]
FROM catalog_sales
JOIN warehouse ON cs_warehouse_sk = w_warehouse_sk
JOIN ship_mode ON cs_ship_mode_sk = sm_ship_mode_sk
JOIN call_center ON cs_call_center_sk = cc_call_center_sk
JOIN date_dim ON cs_ship_date_sk = d_date_sk
WHERE
  d_month_seq BETWEEN 1183 AND 1183 + 11
GROUP BY
  SUBSTRING(w_warehouse_name, 1, 20),
  sm_type,
  cc_name
ORDER BY
  SUBSTRING(w_warehouse_name, 1, 20),
  sm_type,
  cc_name
OPTION (LABEL = 'TPC-DS Q99');

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }

-- MARKDOWN ********************

-- _Run all 103 TPC-DS query cells above (Q1-Q99, including the a/b variants) to complete a TPC-DS power run, then run the cell below to review the runtime and cost of every query in this run via query insights._

-- CELL ********************

-- TPC-DS power run results: one row per query, filtered to just the TPC-DS query labels
SELECT
	UPPER(distributed_statement_id) AS distributed_statement_id,
	label,
	submit_time,
	start_time,
	end_time,
	DATEDIFF(SECOND, start_time, end_time) AS runtime_in_seconds,
	row_count,
	allocated_cpu_time_ms,
	data_scanned_remote_storage_mb + data_scanned_memory_mb + data_scanned_disk_mb AS total_data_scanned_mb
FROM queryinsights.exec_requests_history
WHERE
	status = 'Succeeded'
	AND label IN (
		'TPC-DS Q1', 'TPC-DS Q2', 'TPC-DS Q3', 'TPC-DS Q4', 'TPC-DS Q5', 'TPC-DS Q6', 'TPC-DS Q7',
		'TPC-DS Q8', 'TPC-DS Q9', 'TPC-DS Q10', 'TPC-DS Q11', 'TPC-DS Q12', 'TPC-DS Q13', 'TPC-DS Q14A',
		'TPC-DS Q14B', 'TPC-DS Q15', 'TPC-DS Q16', 'TPC-DS Q17', 'TPC-DS Q18', 'TPC-DS Q19',
		'TPC-DS Q20', 'TPC-DS Q21', 'TPC-DS Q22', 'TPC-DS Q23A', 'TPC-DS Q23B', 'TPC-DS Q24A',
		'TPC-DS Q24B', 'TPC-DS Q25', 'TPC-DS Q26', 'TPC-DS Q27', 'TPC-DS Q28', 'TPC-DS Q29',
		'TPC-DS Q30', 'TPC-DS Q31', 'TPC-DS Q32', 'TPC-DS Q33', 'TPC-DS Q34', 'TPC-DS Q35', 'TPC-DS Q36',
		'TPC-DS Q37', 'TPC-DS Q38', 'TPC-DS Q39A', 'TPC-DS Q39B', 'TPC-DS Q40', 'TPC-DS Q41',
		'TPC-DS Q42', 'TPC-DS Q43', 'TPC-DS Q44', 'TPC-DS Q45', 'TPC-DS Q46', 'TPC-DS Q47', 'TPC-DS Q48',
		'TPC-DS Q49', 'TPC-DS Q50', 'TPC-DS Q51', 'TPC-DS Q52', 'TPC-DS Q53', 'TPC-DS Q54', 'TPC-DS Q55',
		'TPC-DS Q56', 'TPC-DS Q57', 'TPC-DS Q58', 'TPC-DS Q59', 'TPC-DS Q60', 'TPC-DS Q61', 'TPC-DS Q62',
		'TPC-DS Q63', 'TPC-DS Q64', 'TPC-DS Q65', 'TPC-DS Q66', 'TPC-DS Q67', 'TPC-DS Q68', 'TPC-DS Q69',
		'TPC-DS Q70', 'TPC-DS Q71', 'TPC-DS Q72', 'TPC-DS Q73', 'TPC-DS Q74', 'TPC-DS Q75', 'TPC-DS Q76',
		'TPC-DS Q77', 'TPC-DS Q78', 'TPC-DS Q79', 'TPC-DS Q80', 'TPC-DS Q81', 'TPC-DS Q82', 'TPC-DS Q83',
		'TPC-DS Q84', 'TPC-DS Q85', 'TPC-DS Q86', 'TPC-DS Q87', 'TPC-DS Q88', 'TPC-DS Q89', 'TPC-DS Q90',
		'TPC-DS Q91', 'TPC-DS Q92', 'TPC-DS Q93', 'TPC-DS Q94', 'TPC-DS Q95', 'TPC-DS Q96', 'TPC-DS Q97',
		'TPC-DS Q98', 'TPC-DS Q99'
	)
ORDER BY label

-- METADATA ********************

-- META {
-- META   "language": "sql",
-- META   "language_group": "sqldatawarehouse"
-- META }
