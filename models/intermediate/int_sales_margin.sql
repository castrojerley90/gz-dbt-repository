With sales_data as (
    
    select *
    from {{ref("stg_raw__sales")}}

),

product_data as (

    select * 
    from {{ref("stg_raw__product")}}

)

select 
    sales.*
    , product.purchase_price
    , ROUND((sales.revenue - (sales.quantity * product.purchase_price)),2) AS margin
    , ROUND((sales.quantity * product.purchase_price),2) AS purchase_cost
from sales_data as sales
left join product_data as product 
on sales.products_id = product.products_id

