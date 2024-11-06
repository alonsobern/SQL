/* TOTAL AMOUNT PER PAYMENT TYPE */

DELIMITER //
CREATE PROCEDURE total_amount_payment (IN payment_type_name varchar(20))
BEGIN
SELECT pt.payment_type_name AS 'Payment Type', SUM(a.total_amount) AS 'Total Amount'
FROM (
	SELECT a.invoice_id, a.payment_type_id, a.date_invoice, ROUND(SUM(a.total),2) AS 'total_amount'
	FROM (
		SELECT a.invoice_id, a.payment_type_id, a.date_invoice, a.quantity, p.product_price, 
		ROUND((a.quantity*p.product_price),2) AS subtotal, 
		ROUND(((a.quantity*p.product_price)*a.tax),2) AS tax_value, 
		ROUND(((a.quantity*p.product_price)+((a.quantity*p.product_price)*a.tax)),2) AS total
		FROM (
			SELECT i.invoice_id, i.payment_type_id, i.date_invoice, id.product_id, id.quantity, id.tax
			FROM invoice AS i INNER JOIN invoice_detail AS id
			ON i.invoice_id = id.invoice_id) AS a INNER JOIN product AS p
		ON a.product_id = p.product_id
		GROUP BY a.invoice_id, a.date_invoice, a.quantity, p.product_price, a.tax) AS a
	GROUP BY  a.invoice_id, a.date_invoice) AS a INNER JOIN payment_type AS pt
ON a.payment_type_id = pt.payment_type_id
WHERE pt.payment_type_name = payment_type_name
GROUP BY pt.payment_type_name;
END //
DELIMITER ;
