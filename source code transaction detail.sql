with products_cte as (
    select p.ProdNumber, p.ProdName, p.Category, p2.CategoryName , p.Price 
    from products p 
    left join productcategory p2 
    on p.Category  = p2.CategoryID  
)
select 
    o.`Date` as order_date, 
    pc.CategoryName as category_name, 
    pc.ProdName as product_name,
    pc.Price as product_price,  
    o.Quantity as order_qty, 
    pc.Price * o.Quantity as total_sales,
    c.CustomerEmail as cust_email, 
    c.CustomerCity as cust_city 
from orders o 
left join products_cte pc
on o.ProdNumber = pc.ProdNumber
left join customers c 
on o.CustomerID = c.CustomerID 
order by 1	
