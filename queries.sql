\c store

# Retrieve all the sellers whose age is below 50. 
 SELECT name,Age FROM Seller WHERE Age<50; 
 
# Retrieve all the customers who do not live in '64R,Minerva Circle'.
SELECT name,Address FROM Customer
WHERE Address NOT IN (SELECT Address FROM Customer 
WHERE Address='64R,Minerva Circle')
 
#Retrive the products purchased on 21-09-2021 
SELECT prod_purchased,bill_date FROM Bill WHERE bill_date='2021-09-21' ; 
4)Find the new rate of the products if GST of 18% is added.
SELECT prod_name,selling_rate,1.18*selling_rate as new_selling_rate FROM 
Product;
 
 
#Retrieve all the products sold by each seller.
 SELECT seller_id,name,prod_name as Product_Sold 
 FROM Product as p,Seller as s,Seller_sells as ss
 WHERE ss.s_id=s.seller_id and p.product_id=ss.p_id;
 
#Find the customers whose name starts with 'K' and purchased 'shampoo'.
 
SELECT name FROM Customer WHERE name like 'K%'
 EXCEPT
 SELECT name 
 FROM Bill as b,Customer as c
 WHERE b.cust_id=c.cust_id and b.prod_purchased='Shampoo';
 
#Complex Queries ( includes nested query ) 
 
 
# Find customers who have at least one payment whose amount is greater 
than 200.
 
SELECT name,bill_total
 FROM Customer as c,Bill
 WHERE c.cust_id=Bill.cust_id AND EXISTS
 (SELECT cust_id
 FROM Bill as b
 WHERE b.cust_id = c.cust_id AND bill_total > 200 )
 ORDER BY name;
 
# Find all customers who purchased more than one product.
 SELECT count(*),name 
 FROM Customer as c,Bill as b
 WHERE c.cust_id=b.cust_id GROUP by name;
 
# Retrive the products purchased on 21-09-2021 SELECT 
prod_purchased,bill_date,bill_total
 FROM Bill 
 WHERE bill_total in (SELECT bill_total FROM Bill WHERE bill_total>250 and 
bill_date='2021-09-21');
 
 
 
# Retrieve all the sellers and customers whose age is below 50.
 (SELECT name,Age FROM Seller WHERE Age<50) 
 UNION
 (SELECT name,Age FROM Customer WHERE Age<50);

#Retrieve all the customers who's bill total is greater than 250 rupees.
SELECT name,bill_total
FROM Customer as c,Bill as b
WHERE bill_total > 250 and b.cust_id=c.cust_id ORDER BY bill_total;
