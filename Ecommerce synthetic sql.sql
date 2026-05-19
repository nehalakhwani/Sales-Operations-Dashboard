create database ecommerce_dataset;
use ecommerce_dataset;
select * from ecommerce_returns_synthetic_data;
update ecommerce_returns_synthetic_data set Return_Reason = 'No Return' where Return_Status = 'Not Returned';
select * from ecommerce_returns_synthetic_data;
update ecommerce_returns_synthetic_data set Days_to_Return='0' where Return_Status='Not Returned';
UPDATE ecommerce_returns_synthetic_data
SET order_date = STR_TO_DATE(order_date,'%d-%m-%Y');
update ecommerce_returns_synthetic_data
set Return_Date= date_add(Order_Date, interval Days_to_Return Day);
update ecommerce_returns_synthetic_data set Return_Date = NULL where Return_Status= 'Not Returned';
select * from ecommerce_returns_synthetic_data;
