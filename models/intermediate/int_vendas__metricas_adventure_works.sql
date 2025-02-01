with
    dim_human_resources as (
        select
            PK_BUSINESS_ENTITY_ID
            , JOB_TITLE
            , BIRTHDATE_EMPLOYEE
            , HIRE_DATE
            , VACATION_HOURS
            , SICK_LEAVE_HOURS
            , SALES_QUOTA
            , BONUS
            , COMISSION_PCT
            , SALES_YTD_VALUE
            , SALES_LAST_YEAR_VALUE
        from {{ ref('dim_human_resources') }}
    )

    , dim_person as (
        select *
        from {{ ref('dim_person') }}
    )

    , dim_person_credit_card as (
        select
            CREDIT_CARD_TYPE
            , CREDIT_CARD_NUMBER
            , EXP_MONTH
            , EXP_YEAR
        from {{ ref('dim_person_credit_card') }}
    )

    , dim_products as (
        select *
        from {{ ref('dim_products') }}
    )

    , dim_purchasing as (
        select *
        from {{ ref('dim_purchasing') }}
    )

    , dim_sales as (
        select
            PK_SALES_ORDER_DETAIL_ID
            , ADDRESS_LINE1
            , CITY
            , POSTAL_CODE
            , SPATIAL_LOCATION
            , NAME_TERRITORY
            , COUNTRY_REGION_CODE
            , CONTINENT_REGION
            , SALES_YTD_PER_REGION_VALUE
            , SALES_LAST_YEAR_PER_REGION_VALUE
            , TOTAL_DUE_VALUE
            , TRACKING_NUMER
            , STATUS
            , UNITY_PRICE
            , DISCOUNT_UNITY_PRICE
        from {{ ref('dim_sales') }}
    )

    , dim_sales_reason as (
        select *
        from {{ ref('dim_sales_reason') }}
    )

    , dim_work_order as (
        select *
        from {{ ref('dim_work_order') }}
    )

        
    , metrica_fct as (
        select
            -- dim_sales
            PK_SALES_ORDER_DETAIL_ID
            -- dim_human_resources
            , PK_BUSINESS_ENTITY_ID as FK_BUSINESS_ENTITY_ID
            -- dim_products
            , PK_PRODUCT_ID as FK_PRODUCT_ID
            -- dim_purchasing
            , PK_PURCHASE_ORDER_ID as FK_PURCHASE_ORDER_ID
            -- dim_sales_reason
            , PK_JOIN_SALES_REASON_ID as FK_JOIN_SALES_REASON_ID
            -- dim_work_order
            , PK_WORK_PROD_LOC_ID as FK_WORK_PROD_LOC_ID
            -- Datas
            , BIRTHDATE_EMPLOYEE
            , HIRE_DATE
            , ORDER_DATE
            , SHIP_DATE 
            , START_DATE
            , END_DATE
            , DUE_DATE
            -- Métricas
            , ORDER_QTY
            , UNITY_PRICE
            , UNITY_PRICE * ORDER_QTY as TOTAL_NO_DISCOUNT
            , DISCOUNT_UNITY_PRICE
            , case
                when DISCOUNT_UNITY_PRICE > 0 then true
                else false
            end as HAVE_DISCOUNT   
            , cast(
                (TOTAL_NO_DISCOUNT - TOTAL_NO_DISCOUNT * DISCOUNT_UNITY_PRICE) 
                as numeric(18,2)) as TOTAL_DISCOUNT
            , cast(
                (TOTAL_NO_DISCOUNT - DISCOUNT_UNITY_PRICE) / ORDER_QTY
                as numeric(18,2)) as TICKET_MEDIUM
            
            -- Atributos
            , PRODUCT_NUMBER
            , NAME_PRODUCT
            , SAFE_STOCK_LEVEL
            , REORDER_POINT
            , STATUS  
            -- Característica dos funcionários
            , EMPLOYEE_NAME
            , JOB_TITLE            
            , EMAIL_EMPLOYEE
            , PHONE_NUMBER
            -- Características do cartão de crédito
            , CREDIT_CARD_TYPE
            , CREDIT_CARD_NUMBER            
            , ACCOUNT_NUMBER
            -- Características do endereço                       
            , ADDRESS_LINE1
            , CITY
            , POSTAL_CODE
            , SPATIAL_LOCATION
            , NAME_TERRITORY
            , COUNTRY_REGION_CODE
            , CONTINENT_REGION
            -- Características da razão de compra
            , NAME_REASON
            , REASON_TYPE            
            , NAME_LOCATION

                                  
        from dim_human_resources, dim_person, dim_person_credit_card, dim_products, dim_purchasing
        , dim_sales_reason, dim_work_order
        --dim_sales

    )

select *
from metrica_fct