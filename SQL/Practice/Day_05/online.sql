CREATE TABLE `online-retail-dataset` (
	`InvoiceNo` VARCHAR(7) NOT NULL, 
	`StockCode` VARCHAR(12) NOT NULL, 
	`Description` VARCHAR(35), 
	`Quantity` DECIMAL(38, 0) NOT NULL, 
	`InvoiceDate` TIMESTAMP NULL, 
	`UnitPrice` DECIMAL(38, 3) NOT NULL, 
	`CustomerID` DECIMAL(38, 0), 
	`Country` VARCHAR(20) NOT NULL
);
