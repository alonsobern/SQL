SELECT c.customer_first_name, c.customer_last_name, COUNT(i.invoice_id) AS qty_invoices
FROM customer AS c INNER JOIN invoice AS i
ON c.customer_id=i.customer_id
GROUP BY c.customer_first_name, c.customer_last_name
ORDER BY c.customer_last_name ASC;