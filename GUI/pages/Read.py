import streamlit as st
import pandas as pd
import pyodbc

server = 'NISHU-DELL'
database = 'BlueBikes'
driver = 'ODBC Driver 17 for SQL Server'
conn = pyodbc.connect('DRIVER={'+driver+'};SERVER='+server+';DATABASE='+database+';Trusted_Connection=yes;')
cursor = conn.cursor()


st.title('Blue Bikes Database Management System')
st.subheader('Read Operation')

def read_accessory_id(itemid):
    try:
        cursor.execute("SELECT * FROM Accessory WHERE ItemID = ?", itemid)
        result = cursor.fetchone()
        if result:
            df = pd.DataFrame([list(result)], columns=['ItemID', 'ItemName', 'ItemCost', 'ItemCount'])
            st.table(df)
        else:
            st.warning("Accessory not found.")
    except Exception as e:
        st.error(f"Error reading accessory: {e}")

def read_bike_id(bikeid):
    try:
        cursor.execute("SELECT * FROM Bike WHERE BikeID = ?", bikeid)
        result = cursor.fetchone()
        if result:
            df = pd.DataFrame([list(result)], columns=['BikeID', 'BikeModelID', 'DockID', 'BikeLocation', 'BikeRentalStatus'])
            st.table(df)
        else:
            st.warning("Bike not found.")
    except Exception as e:
        st.error(f"Error reading bike: {e}")

def read_customer_id(custid):
    cursor.execute("SELECT * FROM Customer WHERE CustomerID = ?", (custid,))
    row = cursor.fetchone()
    if row:
        df = pd.DataFrame([list(row)], columns=['CustomerID', 'CustFName', 'CustLName', 'CustEmail', 'CustPassword', 'CustPhone', 'CustStreetAddress', 'CustHouseNo', 'CustCity', 'CustState', 'CustZIP'])
        st.table(df)
    else:
        st.warning("Customer not found.")

def read_dock_id(dockid):
    try:
        cursor.execute("SELECT * FROM Dock WHERE DockID = ?", dockid)
        result = cursor.fetchone()
        if result:
            df = pd.DataFrame([list(result)], columns=['DockID', 'EmployeeID', 'DockName', 'DockLocation', 'BikeCapacity','BikeAvailable', 'AvailableSpots'])
            st.table(df)
        else:
            st.warning("Dock not found.")
    except Exception as e:
        st.error(f"Error reading dock: {e}")

def view_employee_id(employee_id):
    select_query = "SELECT * FROM Employee WHERE EmployeeID = ?"
    cursor.execute(select_query, (employee_id,))
    result = cursor.fetchone()
    if result:
        df = pd.DataFrame([list(result)], columns=['EmployeeID', 'EmpFName', 'EmpLName', 'EmpEmail', 'EmpPhone', 'EmpStreetAddress', 'EmpHouseNo', 'EmpCity', 'EmpState', 'EmpZIP', 'EmpGender', 'EmpDesignation'])
        st.table(df)
    else:
        st.warning("Employee not found.")


def read_accessory():
    try:
        cursor.execute("SELECT * FROM Accessory")
        data = cursor.fetchall()
        if data:
            df = pd.DataFrame([list(row) for row in data], columns=['ItemID', 'ItemName', 'ItemCost', 'ItemCount'])
            st.table(df)
        else:
            st.warning("Accessory not found.")
    except Exception as e:
        st.error(f"Error reading accessory: {e}")

def read_bike():
    try:
        cursor.execute("SELECT * FROM Bike")
        data = cursor.fetchall()
        if data:
            df = pd.DataFrame([list(row) for row in data], columns=['BikeID', 'BikeModelID', 'DockID', 'BikeLocation', 'BikeRentalStatus'])
            st.table(df)
        else:
            st.warning("Bike not found.")
    except Exception as e:
        st.error(f"Error reading bike: {e}")

def read_customer():
    cursor.execute("SELECT * FROM Customer")
    data = cursor.fetchall()
    if data:
        df = pd.DataFrame([list(row) for row in data], columns=['CustomerID', 'CustFName', 'CustLName', 'CustEmail', 'CustPassword', 'CustPhone', 'CustStreetAddress', 'CustHouseNo', 'CustCity', 'CustState', 'CustZIP'])
        st.table(df)
    else:
        st.warning("Customer not found.")

def read_dock():
    try:
        cursor.execute("SELECT * FROM Dock")
        data = cursor.fetchall()
        if data:
            df = pd.DataFrame([list(row) for row in data], columns=['DockID', 'EmployeeID', 'DockName', 'DockLocation', 'BikeCapacity','BikeAvailable', 'AvailableSpots'])
            st.table(df)
        else:
            st.warning("Dock not found.")
    except Exception as e:
        st.error(f"Error reading dock: {e}")

def view_employee():
    cursor.execute("SELECT * FROM Employee")
    data = cursor.fetchall()
    if data:
        df = pd.DataFrame([list(row) for row in data], columns=['EmployeeID', 'EmpFName', 'EmpLName', 'EmpEmail', 'EmpPhone', 'EmpStreetAddress', 'EmpHouseNo', 'EmpCity', 'EmpState', 'EmpZIP', 'EmpGender', 'EmpDesignation'])
        st.table(df)
    else:
        st.warning("Employee not found.")


def read_payment_method():
    try:
        cursor.execute("SELECT * FROM PaymentMethod")
        data = cursor.fetchall()
        if data:
            df = pd.DataFrame([list(row) for row in data], columns=['PaymentID', 'CustomerID', 'PaymentType'])
            st.table(df)
        else:
            st.warning("PaymentMethod not found.")
    except Exception as e:
        st.error(f"Error reading PaymentMethod: {e}")

def read_bank_account():
    try:
        cursor.execute("SELECT * FROM BankAccountPayment")
        data = cursor.fetchall()
        if data:
            df = pd.DataFrame([list(row) for row in data], columns=['PaymentID', 'BankAccFName', 'BankAccLName', 'AccountNumber', 'RoutingNumber', 'AccountType'])
            st.table(df)
        else:
            st.warning("BankAccountPayment not found.")
    except Exception as e:
        st.error(f"Error reading BankAccountPayment: {e}")

def read_transaction():
    try:
        cursor.execute("SELECT * FROM [Transaction]")
        data = cursor.fetchall()
        if data:
            df = pd.DataFrame([list(row) for row in data], columns=['TransactionID', 'CustomerID', 'PaymentID', 'TransactionDateTime', 'RentDuration', 'TransactionCost'])
            st.table(df)
        else:
            st.warning("[Transaction] not found.")
    except Exception as e:
        st.error(f"Error reading [Transaction]: {e}")

def read_bike_model():
    try:
        cursor.execute("SELECT * FROM BikeModel")
        data = cursor.fetchall()
        if data:
            df = pd.DataFrame([list(row) for row in data], columns=['Bike ID', 'BikeBrandName', 'BikeModelName'])
            st.table(df)
        else:
            st.warning("BikeModel not found.")
    except Exception as e:
        st.error(f"Error reading BikeModel: {e}")

def read_maintenance():
    try:
        cursor.execute("SELECT * FROM Maintenance")
        data = cursor.fetchall()
        if data:
            df = pd.DataFrame([list(row) for row in data], columns=['MaintenanceID', 'BikeID', 'EmployeeID', 'MaintenanceDateTime', 'MaintenanceDescription', 'MaintenanceCost'])
            st.table(df)
        else:
            st.warning("Maintenance not found.")
    except Exception as e:
        st.error(f"Error reading Maintenance: {e}")

def read_rental():
    try:
        cursor.execute("SELECT * FROM Rental")
        data = cursor.fetchall()
        if data:
            df = pd.DataFrame([list(row) for row in data], columns=['RentalID', 'CustomerID', 'BikeID', 'TransactionID', 'StartDockID', 'EndDockID', 'StartDateTime', 'EndDateTime', 'RentalTime'])
            st.table(df)
        else:
            st.warning("Rental not found.")
    except Exception as e:
        st.error(f"Error reading Rental: {e}")

def read_bike_accessory():
    try:
        cursor.execute("SELECT * FROM Bike_Accessory")
        data = cursor.fetchall()
        if data:
            df = pd.DataFrame([list(row) for row in data], columns=['BikeID', 'ItemID'])
            st.table(df)
        else:
            st.warning("BikeAccessory not found.")
    except Exception as e:
        st.error(f"Error reading BikeAccessory: {e}")

option = st.selectbox("Select a table", ("Select", "Accessory", "Bike", "Customer", "Dock", "Employee", "PaymentMethod", "BankAccountPayment", "Transaction", "BikeModel", "Maintenance", "Rental", "BikeAccessory"))


if option == "Accessory":
    read_accessory()
    itemid = st.number_input("Enter Item ID to read:", min_value=1001)
    if st.button("View Accessory"):
        read_accessory_id(itemid)

elif option == "Bike":
    read_bike()
    bikeid = st.text_input("Enter Bike ID to read:")
    if st.button("View Bike"):
        read_bike_id(bikeid)

elif option == "Customer":
    read_customer()
    custid = st.text_input("Enter Customer ID to read:")
    if st.button("View Customer"):
        read_customer_id(custid)

elif option == "Dock":
    read_dock()
    dockid = st.text_input("Enter Dock ID to read:")
    if st.button("View Dock"):
        read_dock_id(dockid)

elif option == "Employee":
    view_employee()
    employee_id = st.text_input("Enter Employee ID to read:")
    if st.button("View"):
        view_employee_id(employee_id)

elif option == "PaymentMethod":
    read_payment_method()

elif option == "BankAccountPayment":
    read_bank_account()

elif option == "Transaction":
    read_transaction()

elif option == "BikeModel":
    read_bike_model()

elif option == "Maintenance":
    read_maintenance()

elif option == "Rental":
    read_rental()

elif option == "BikeAccessory":
    read_bike_accessory()