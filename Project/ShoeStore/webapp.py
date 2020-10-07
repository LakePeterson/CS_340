from flask import Flask, url_for, render_template, request, redirect
from db_connector.db_connector import connect_to_database, execute_query

app = Flask(__name__)

@app.route("/")
@app.route("/home")
def home():
    return render_template("index.html")

###
## Display and Add Cashiers
###

@app.route("/cashiers", methods=['GET', 'POST'])
def cashiers():

    # connect to database
    db_connection = connect_to_database()
    alerts = ()

    if request.method == 'POST':

        # Fetch data from the form
        firstName = request.form['firstName']
        lastName = request.form['lastName']
        phoneNumber = request.form['phoneNumber']
        email = request.form['email']
        birthDate = request.form['birthDate']
        salary = request.form['salary']
        experience = request.form['experience']

        # If no experience is given
        if experience == 'NULL':
            experience = None

            # Create query string and execute command
            query = 'INSERT INTO Cashiers (firstName, lastName, phoneNumber, email, birthDate, salary, experience) VALUES (%s, %s, %s, %s, %s, %s, %s)'
            data = (firstName, lastName, phoneNumber, email, birthDate, salary, experience)
            execute_query(db_connection, query, data)
            alerts = ("Success! Database updated!", False)

        else:

            # Create query string and execute command
            query = 'INSERT INTO Cashiers (firstName, lastName, phoneNumber, email, birthDate, salary, experience) VALUES (%s, %s, %s, %s, %s, %s, %s)'
            data = (firstName, lastName, phoneNumber, email, birthDate, salary, experience)
            execute_query(db_connection, query, data)
            alerts = ("Success! Database updated!", False)

    print('Fetching info from database')

    # Create query strings and execute to retrieve required data from database
    query = 'SELECT * FROM Cashiers'
    result = execute_query(db_connection, query).fetchall()

    return render_template('cashiers.html', rows=result, alerts=alerts)


###
## Display and Add Customers
###

@app.route("/customers", methods=['GET', 'POST'])
def customers():

    # connect to database
    db_connection = connect_to_database()
    alerts = ()

    if request.method == 'POST':

        # Fetch data from the form
        customerID = request.form['customerID']
        birthDate = request.form['birthDate']
        favoriteBrand = request.form['favoriteBrand']
        shoePurchased = request.form['shoePurchased']

        # Create query string and execute command
        query = 'INSERT INTO Customers (customerID, birthDate, favoriteBrand, shoePurchased) VALUES (%s, %s, %s, %s)'
        data = (customerID, birthDate, favoriteBrand, shoePurchased)
        execute_query(db_connection, query, data)
        alerts = ("Success! Database updated!", False)

    print('Fetching info from database')

    # Create query strings and execute to retrieve required data from database
    query = 'SELECT * FROM Customers'
    result = execute_query(db_connection, query).fetchall()

    return render_template('customers.html', rows=result, alerts=alerts)

###
## Display and Add Sales
###

@app.route("/sales", methods=['GET', 'POST'])
def sales():

    # connect to database
    db_connection = connect_to_database()
    alerts = ()

    if request.method == 'POST':

        # Fetch data from the form
        receiptNumber = request.form['receiptNumber']
        cashierID = request.form['cashierID']
        customerID = request.form['customerID']
        purchaseTime = request.form['purchaseTime']
        shoeBought = request.form['shoeBought']
        saleAmount = request.form['saleAmount']

        # Create query string and execute command
        query = 'INSERT INTO Sales (receiptNumber, cashierID, customerID, purchaseTime, shoeBought, saleAmount) VALUES (%s, %s, %s, %s, %s, %s)'
        data = (receiptNumber, cashierID, customerID, purchaseTime, shoeBought, saleAmount)
        execute_query(db_connection, query, data)
        alerts = ("Sales Data Has Been Updated", False)

    print('Retrieving Sales Data From Database')

    # Create query strings and execute to retrieve required data from database
    query = 'SELECT * FROM Sales'
    result = execute_query(db_connection, query).fetchall()

    return render_template('sales.html', rows=result, alerts=alerts)

###
## Display and Add Shoes
###

@app.route("/shoes", methods=['GET', 'POST'])
def shoes():

    # connect to database
    db_connection = connect_to_database()
    alerts = ()

    if request.method == 'POST':

        # Fetch data from the form
        shoeID = request.form['shoeID']
        shoeBrand = request.form['shoeBrand']
        shoeGender = request.form['shoeGender']
        shoeType = request.form['shoeType']
        shoePopularity = request.form['shoePopularity']
        shoePrice = request.form['shoePrice']

        # Create query string and execute command
        query = 'INSERT INTO Shoes (shoeID, shoeBrand, shoeGender, shoeType, shoePopularity, shoePrice) VALUES (%s, %s, %s, %s, %s, %s)'
        data = (shoeID, shoeBrand, shoeGender, shoeType, shoePopularity, shoePrice)
        execute_query(db_connection, query, data)
        alerts = ("Shoes Data Has Been Updated", False)

    print('Retrieving Shoes Data From Database')

    # Create query strings and execute to retrieve required data from database

    # If search was used to show tables:
    search_request = request.args.get('searchBar')

	# Check if user uses the search bar
    if search_request is not None:
        query = f"SELECT * FROM Shoes WHERE shoePopularity LIKE '%{search_request}%'"
        result = execute_query(db_connection, query).fetchall()
    else:
        query = f'SELECT * FROM Shoes'
        result = execute_query(db_connection, query).fetchall()

    return render_template('shoes.html', rows=result, alerts=alerts)

###
## Delete Shoe and Sale
###

@app.route("/deleteShoeAndSale/<int:id>")
def delete_coupon(id):
    db_connection = connect_to_database()
    alerts = ()

    # Delete from Sales
    query = 'DELETE FROM Sales WHERE shoeBought = %s'
    data = (id,)
    execute_query(db_connection, query, data)

    # Delete from Shoes
    query = 'DELETE FROM Shoes WHERE shoeID = %s'
    data = (id,)
    execute_query(db_connection, query, data)

    alerts = ("successfully Deleted", False)

    # Query data to display in table
    query = 'SELECT * FROM Shoes'
    result = execute_query(db_connection, query).fetchall()

    return render_template("shoes.html", rows=result, alerts=alerts)
