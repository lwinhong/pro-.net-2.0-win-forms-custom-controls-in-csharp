USE Northwind
GO
CREATE PROCEDURE GetOrdersByPage(@FromID	 int, @ToID int)
AS

-- Create a temporary table with the columns you are interested in.
CREATE TABLE #TempOrders
(
    ID int IDENTITY PRIMARY KEY,
    OrderID int,
    ShippedDate datetime
)

-- Fill the table with all the records.
INSERT INTO #TempOrders
(
    OrderID,
    ShippedDate
)
SELECT 
    OrderID,
    ShippedDate
FROM 
 Orders ORDER BY OrderID

-- Select the page of records.
SELECT * FROM #TempOrders WHERE ID >= @FromID AND ID <= @ToID
GO
