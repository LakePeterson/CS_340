

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
(02, 'Grey', 'Tin', '541-453-8329', 'greytin@gmail.com', '1967-11-11', 45000, 6);


--------------------------------------------------------

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
CREATE TABLE `Customers` (
  `customerID` int(11) NOT NULL,
  `birthDate` date NOT NULL,
  `favoriteBrand` varchar(255) DEFAULT NULL,
  `shoeID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Customers`
--

INSERT INTO `Customers` (`customerID`, `birthDate`, `favoriteBrand`, `shoeID`) VALUES
(1, '1974-09-05', 'Nike', 02),
(2, '2001-08-04', 'Puma', 01);


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
  `saleAmount` float(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Sales`
--

INSERT INTO `Sales` (`receiptNumber`, `cashierID`, `customerID`, `purchaseTime`, `shoeBought`, `saleAmount`) VALUES
(000374592, 01, 01, '2020-07-25 16:32:29', 02, 86.55),
(000274288, 02, 02, '2020-07-26 13:39:01', 01, 90.22);

-- --------------------------------------------------------

--
-- Table structure for table `Shoes`
--

DROP TABLE IF EXISTS `Shoes`;
CREATE TABLE `Shoes` (
  `shoeID` int(11) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `popularity` int NOT NULL,
  `price` float(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Shoes`
--

INSERT INTO `Shoes` (`shoeID`, `brand`, `gender`, `type`, `popularity`, `price`) VALUES
(01, 'Puma', 'Womens', 'Soccer cleats', 5, 90.22),
(02, 'Nike', 'Mens', 'Running', 5, 86.55);


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
  ADD KEY `shoeID` (`shoeID`);

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

/*
ALTER TABLE `Customers`
  ADD CONSTRAINT `Customer_ibfk_1` FOREIGN KEY (`shoeID`) REFERENCES `Shoes` (`shoeID`);
--
-- Constraints for table `Sales`
--
ALTER TABLE `Sales`
  ADD CONSTRAINT `Sales_ibfk_1` FOREIGN KEY (`cashierID`) REFERENCES `Cashiers` (`cashierID`),
  ADD CONSTRAINT `Sales_ibfk_2` FOREIGN KEY (`customerID`) REFERENCES `Customers` (`customerID`);
  ADD CONSTRAINT `Sales_ibfk_3` FOREIGN KEY (`shoeBought`) REFERENCES `Shoes` (`shoeID`);
COMMIT;
*/
