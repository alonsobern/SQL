/* QTY OF INVOICES PER CUSTOMER */

SELECT b.customer_first_name as first_name, b.customer_last_name as last_name, b.customer_email as email, b.category_name as category, b.city_name as city, COUNT(i.invoice_id) as qty_invoices
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

SELECT a.invoice_id, a.date_invoice, p.product_name, a.quantity, p.product_price, 
ROUND((a.quantity*p.product_price),2) AS subtotal, 
ROUND(((a.quantity*p.product_price)*a.tax),2) AS tax_value, 
ROUND(((a.quantity*p.product_price)+((a.quantity*p.product_price)*a.tax)),2) AS total
FROM (
	SELECT i.invoice_id, i.date_invoice, id.product_id, id.quantity, id.tax
	FROM invoice AS i INNER JOIN invoice_detail AS id
	ON i.invoice_id = id.invoice_id) AS a INNER JOIN product AS p
ON a.product_id = p.product_id
GROUP BY a.invoice_id, a.date_invoice, p.product_name, a.quantity, p.product_price, a.tax;


/* TOTAL AMOUNT PER INVOICES */

SELECT a.invoice_id, a.date_invoice, ROUND(SUM(a.total),2) as total
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