/**********************************************************************
** * Program: Shoe Store Database Manipulation Queries
** * Author: Lake Peterson, Nick Barraclough
** * Date: July 27, 2020
** * Description: Database Manipulation Queries
** * Input: User Input
** * Output: Displays tables with corresponding values
**********************************************************************/

/**********************************************************************
** * Statement Type: SELECT
** * Input Type: None
** * Description:
**********************************************************************/

-- Might needs to make alias for all attributes

SELECT cashierID, firstName, lastName, phoneNumber, email, birthDate, salary, experience
FROM Cashiers;

SELECT customerID, birthDate, favoriteBrand, shoesPurchased
FROM Customers;

SELECT recieptNumber, cashierID, customerID, purchaseTime, shoesBought, saleAmount
FROM Sales;

SELECT shoeID, shoeBrand, shoeSize, shoeType, shoeGender, shoePopularity, shoePrice
FROM Shoes;

/**********************************************************************
** * Statement Type: INSERT
** * Input Type: User
** * Description: Takes in user input to fill values
**********************************************************************/

INSERT INTO Cashiers (cashierID, firstName, lastName, phoneNumber, email, birthDate, salary, experience)
VALUES (:cashierIDInput, :firstNameInput, :lastNameInput, :phoneNumberInput, :emailInput, :birthDateInput, :salaryInput, :experienceInput);

INSERT INTO Customers (customerID, birthDate, favoriteBrand, shoesPurchased)
VALUES (:customerIDInput, :birthDateInput, :favoriteBrandInput, :shoesPurchasedInput);

INSERT INTO Sales (recieptNumber, cashierID, customerID, purchaseTime, shoesBought, saleAmount)
VALUES (:receiptNumberInput, :cashierIDInput, :customerIDInput, :purchaseTimeInput, :shoesBoughtInput, :saleAmountInput);

INSERT INTO Shoes (shoeID, shoeBrand, shoeSize, shoeType, shoeGender, shoePopularity, shoePrice)
VALUES (:shoeIDInput, :shoeBrandInput, :shoeSizesInput, :shoeTypeInput, shoeGenderInput, shoePopularityInput, shoePriceInput);

/**********************************************************************
** * Statement Type: UPDATE
** * Input Type: User
** * Description: Overwrites existing value with new value
**********************************************************************/

UPDATE Cashiers
SET cashierID = :cashierIDInput, firstName = :firstNameInput, lastName = :lastNameInput, phoneNumber = :phoneNumberInput, email = :emailInput, birthDate = :birthDateInput, salary = :salaryInput, experience = :experienceInput;
WHERE cashierID = :cashierID_from_the_update_form

UPDATE Customers
SET customerID = :customerIDInput, birthDate = :birthDateInput, favoriteBrand = :favoriteBrandInput, shoesPurchased = :shoesPurchasedInput;
WHERE customerID = :customerID_from_the_update_form

UPDATE Sales
SET recieptNumber = :receiptNumberInput, cashierID = :cashierIDInput, customerID = :customerIDInput, purchaseTime = :purchaseTimeInput, shoesBought = :shoesBoughtInput, saleAmount = :saleAmountInput;
WHERE recieptNumber = :recieptNumber_from_the_update_form

UPDATE Shoes
SET shoeID = :shoeIDInput, shoeBrand = :shoeBrandInput, shoeSize = :shoeSizesInput, shoeType = :shoeTypeInput, shoeGender = shoeGenderInput, shoePopularity = shoePopularityInput, shoePrice = shoePriceInput;
WHERE recieptNumber = :recieptNumber_from_the_update_form

/**********************************************************************
** * Statement Type: DELETE
** * Input Type: User
** * Description: Takes in user input to delete an entire entry
**********************************************************************/

DELETE FROM Cashiers
WHERE cashierID = :cashierID_selected_from_cashier_page

DELETE FROM Customers
WHERE customerID = :customerID_selected_from_cashier_page

DELETE FROM Sales
WHERE recieptNumber = :recieptNumber_selected_from_cashier_page

DELETE FROM Shoes
WHERE shoeID = :shoeID_selected_from_cashier_page
