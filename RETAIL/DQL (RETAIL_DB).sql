/* QTY OF INVOICES PER CUSTOMER */

SELECT b.customer_first_name AS 'First Name', b.customer_last_name AS 'Last Name', b.customer_email AS 'Email', b.category_name AS 'Category', 
b.city_name AS 'City', COUNT(i.invoice_id) AS 'QTY Invoice'
FROM (
	SELECT a.customer_id, a.customer_first_name, a.customer_last_name, a.customer_email, a.category_name, c.city_name
	FROM (
		SELECT c.customer_id, c.city_id, c.customer_first_name, c.customer_last_name, c.customer_email, cc.category_name
		FROM customer AS c INNER JOIN customer_category AS cc
		ON c.customer_category_id = cc.customer_category_id) AS a INNER JOIN city AS c
	ON a.city_id = c.city_id) AS b INNER JOIN invoice AS i
ON b.customer_id = i.customer_id
GROUP BY b.customer_first_name, b.customer_last_name, b.customer_email, b.category_name, b.city_name
ORDER BY b.customer_last_name ASC;



/* INVOICES DETAILS */

SELECT a.invoice_id AS 'Invoice Number', a.date_invoice AS 'Date Purchased', p.product_name AS 'Product', a.quantity AS 'QTY', p.product_price AS 'Product Price', 
ROUND((a.quantity*p.product_price),2) AS 'Subtotal', 
ROUND(((a.quantity*p.product_price)*a.tax),2) AS 'Taxes', 
ROUND(((a.quantity*p.product_price)+((a.quantity*p.product_price)*a.tax)),2) AS 'Total Amount'
FROM (
	SELECT i.invoice_id, i.date_invoice, id.product_id, id.quantity, id.tax
	FROM invoice AS i INNER JOIN invoice_detail AS id
	ON i.invoice_id = id.invoice_id) AS a INNER JOIN product AS p
ON a.product_id = p.product_id
GROUP BY a.invoice_id, a.date_invoice, p.product_name, a.quantity, p.product_price, a.tax;



/* TOTAL AMOUNT PER INVOICES */

SELECT a.invoice_id 'Invoice Number', a.date_invoice AS 'Date Purchased', ROUND(SUM(a.total),2) AS 'Total Amount'
FROM (
	SELECT a.invoice_id, a.date_invoice, p.product_name, a.quantity, p.product_price, 
	ROUND((a.quantity*p.product_price),2) AS subtotal, 
	ROUND(((a.quantity*p.product_price)*a.tax),2) AS tax_value, 
	ROUND(((a.quantity*p.product_price)+((a.quantity*p.product_price)*a.tax)),2) AS total
	FROM (
		SELECT i.invoice_id, i.date_invoice, id.product_id, id.quantity, id.tax
		FROM invoice AS i INNER JOIN invoice_detail AS id
		ON i.invoice_id = id.invoice_id) AS a INNER JOIN product AS p
	ON a.product_id = p.product_id
	GROUP BY a.invoice_id, a.date_invoice, p.product_name, a.quantity, p.product_price, a.tax) AS a
GROUP BY  a.invoice_id, a.date_invoice;



/* TOTAL AMOUNT PER CUSTOMER AND INVOICES */

SELECT a.customer_first_name AS 'First Name', a.customer_last_name AS 'Last Name', a.customer_mobile_number AS 'Mobile Number', a.customer_email AS 'Email', a.category AS 'Category Customer', 
CASE WHEN SUM(b.total) > 0 THEN SUM(b.total) ELSE 0 END
AS 'Total'
FROM (
	SELECT a.*, i.invoice_id
    FROM (
		SELECT c.customer_id, c.customer_first_name, c.customer_last_name, c.customer_mobile_number, c.customer_email, cc.category_name as category
		FROM customer AS c INNER JOIN customer_category AS cc
		ON c.customer_category_id = cc.customer_category_id) AS a LEFT JOIN invoice AS i
	ON i.customer_id = a.customer_id) AS a 
    
    LEFT JOIN (

	SELECT a.invoice_id, ROUND(SUM(a.total),2) AS total
    FROM (
		SELECT a.invoice_id, ROUND((a.quantity*p.product_price)+((a.quantity*p.product_price)*a.tax),2) AS total
		FROM (
			SELECT i.invoice_id, id.product_id, id.quantity, id.tax
			FROM invoice AS i INNER JOIN invoice_detail AS id
			ON i.invoice_id = id.invoice_id ) AS a INNER JOIN product AS p
		ON p.product_id = a.product_id
		GROUP BY a.invoice_id, a.tax, a.quantity, p.product_price) AS a
	GROUP BY a.invoice_id ) AS b
ON a.invoice_id = b.invoice_id
GROUP BY a.customer_first_name, a.customer_last_name, a.customer_mobile_number, a.customer_email, a.category;