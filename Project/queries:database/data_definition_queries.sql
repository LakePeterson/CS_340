<<<<<<< HEAD

=======
>>>>>>> 6c8f72e38583ceccbebbd4804e50ae6bd970a25f
--
-- Database: `cs340_peterlak`
--

-- --------------------------------------------------------

--
-- Table structure for table `Cashiers`
--

DROP TABLE IF EXISTS `Cashiers`;
CREATE TABLE `Cashiers` (
  `cashierID` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `birthDate` date NOT NULL,
  `salary` float(11, 2) NOT NULL,
  `experience` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Cashiers`
--

INSERT INTO `Cashiers` (`cashierID`, `firstName`, `lastName`, `phoneNumber`, `email`, `birthDate`, `salary`, `experience`) VALUES
(01, 'Ron', 'Fellows', '541-783-8789', 'ronfellows@gmail.com', '1994-11-30', 30000, 2),
(02, 'Walden', 'Cooper', '592-933-3792', 'waldencooper@gmail.com', '2002-06-10', 30000, 2),
(03, 'Grey', 'Tin', '541-453-8329', 'greytin@gmail.com', '1967-11-11', 45000, 6);

SELECT * FROM Cashiers;

--------------------------------------------------------

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
CREATE TABLE `Customers` (
  `customerID` int(11) NOT NULL,
  `birthDate` date NOT NULL,
  `favoriteBrand` varchar(255) DEFAULT NULL,
  `shoePurchased` int(11) DEFAULT NULL,
  CONSTRAINT `Customers_Shoes_fk_1` FOREIGN KEY (`shoePurchased`) REFERENCES `Shoes` (`shoeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Customers`
--

INSERT INTO `Customers` (`customerID`, `birthDate`, `favoriteBrand`, `shoePurchased`) VALUES
(1, '1974-09-05', 'Nike', 02),
(2, '1999-03-22', 'Nike', 02),
(3, '2001-08-04', 'Puma', 01);

SELECT * FROM Customers;

-- --------------------------------------------------------

--
-- Table structure for table `Sales`
--

DROP TABLE IF EXISTS `Sales`;
CREATE TABLE `Sales` (
  `receiptNumber` int(11) NOT NULL,
  `cashierID` int(11) NOT NULL,
  `customerID` int(11) NOT NULL,
  `purchaseTime` datetime NOT NULL,
  `shoeBought` int(11) NOT NULL,
  `saleAmount` float(11,2) NOT NULL,
  CONSTRAINT `Sales_Cashiers_fk_1` FOREIGN KEY (`cashierID`) REFERENCES `Shoes` (`shoeID`),
  CONSTRAINT `Sales_Customers_fk_2` FOREIGN KEY (`customerID`) REFERENCES `Customers` (`customerID`),
  CONSTRAINT `Sales_Shoes_fk_3` FOREIGN KEY (`shoeBought`) REFERENCES `Shoes` (`shoeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Sales`
--

INSERT INTO `Sales` (`receiptNumber`, `cashierID`, `customerID`, `purchaseTime`, `shoeBought`, `saleAmount`) VALUES
(374592, 01, 01, '2020-07-25', 02, 86.55),
(342492, 01, 03, '2020-07-25', 02, 86.55),
(274288, 02, 02, '2020-07-26', 01, 90.22);

SELECT * FROM Sales;

-- --------------------------------------------------------

--
-- Table structure for table `Shoes`
--

DROP TABLE IF EXISTS `Shoes`;
CREATE TABLE `Shoes` (
  `shoeID` int(11) NOT NULL,
  `shoeBrand` varchar(255) NOT NULL,
  `shoeGender` varchar(255) NOT NULL,
  `shoeType` varchar(255) NOT NULL,
  `shoePopularity` varchar(255) NOT NULL,
  `shoePrice` float(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Shoes`
--

INSERT INTO `Shoes` (`shoeID`, `shoeBrand`, `shoeGender`, `shoeType`, `shoePopularity`, `shoePrice`) VALUES
(01, 'Puma', 'Womens', 'Soccer cleats', 'High', 90.22),
(02, 'Nike', 'Mens', 'Running', 'Low', 86.55),
(03, 'New Balance', 'Mens', 'Casual', 'Medium', 86.55);

SELECT * FROM Shoes;


-- Indexes for dumped tables

--
-- Indexes for table `Cashiers`
--
ALTER TABLE `Cashiers`
  ADD PRIMARY KEY (`cashierID`);

--
-- Indexes for table `Customers`
--
ALTER TABLE `Customers`
  ADD PRIMARY KEY (`customerID`),
  ADD KEY `shoePurchased` (`shoePurchased`);

--
-- Indexes for table `Sales`
--
ALTER TABLE `Sales`
  ADD PRIMARY KEY (`receiptNumber`),
  ADD KEY `cashierID` (`cashierID`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `shoeBought` (`shoeBought`);

--
-- Indexes for table `Shoes`
--
ALTER TABLE `Shoes`
  ADD PRIMARY KEY (`shoeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Cashiers`
--
ALTER TABLE `Cashiers`
  MODIFY `cashierID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Customers`
--
ALTER TABLE `Customers`
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Sales`
--
ALTER TABLE `Sales`
  MODIFY `receiptNumber` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Shoes`
--
ALTER TABLE `Shoes`
  MODIFY `shoeID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Customers`
--

--
-- ALTER TABLE `Sales`
--   ADD CONSTRAINT `Sales_ibfk_1` FOREIGN KEY (`shoeBought`) REFERENCES `Shoes` (`shoeID`);



--
-- Constraints for table `Sales`
--
--
-- ALTER TABLE `Sales`
--   ADD CONSTRAINT `Sales_ibfk_1` FOREIGN KEY (`cashierID`) REFERENCES `Cashiers` (`cashierID`),
--   ADD CONSTRAINT `Sales_ibfk_2` FOREIGN KEY (`customerID`) REFERENCES `Customers` (`customerID`);
--   ADD CONSTRAINT `Sales_ibfk_3` FOREIGN KEY (`shoeBought`) REFERENCES `Shoes` (`shoeID`);
-- COMMIT;
