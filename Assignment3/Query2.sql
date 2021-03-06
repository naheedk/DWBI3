--Query 2: Ranking within a partition
--
--Use the RANK function to rank customers in descending order by the sum of extended cost for shipments (transaction type 5). 
--You should partition the rank values by customer state. The result should include the customer state, customer name, sum of the extended cost, and rank. You should order the result by customer state.
SELECT STATE, NAME, SUM(EXTCOST) AS TOTAL_COST, RANK () OVER (PARTITION BY STATE ORDER BY SUM(EXTCOST) DESC) AS CUST_STATE_RANK
FROM INVENTORY_FACT F JOIN CUST_VENDOR_DIM C ON F.CUSTVENDORKEY = C.CUSTVENDORKEY
WHERE TRANSTYPEKEY = 5
GROUP BY STATE, NAME
ORDER BY STATE;