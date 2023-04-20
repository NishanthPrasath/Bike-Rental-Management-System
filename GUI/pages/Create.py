import streamlit as st
import pandas as pd
import pyodbc

server = 'NISHU-DELL'
database = 'BlueBikes'
driver = 'ODBC Driver 17 for SQL Server'
conn = pyodbc.connect('DRIVER={'+driver+'};SERVER='+server+';DATABASE='+database+';Trusted_Connection=yes;')
cursor = conn.cursor()


st.title('Blue Bikes Database Management System')
st.subheader('Create Operation')

def create_accessory(itemname, itemcost, itemcount):
    try:
        cursor.execute("INSERT INTO Accessory (ItemName, ItemCost, ItemCount) VALUES (?, ?, ?)", itemname, itemcost, itemcount)
        conn.commit()
        st.success("Accessory created!")
    except Exception as e:
        st.error(f"Error creating accessory: {e}")

def create_bike(bikemodelid, dockid, bikelocation, bikerentalstatus):
    try:
        cursor.execute("INSERT INTO Bike (BikeModelID, DockID, BikeLocation, BikeRentalStatus) VALUES (?, ?, ?, ?)", bikemodelid, dockid, bikelocation, bikerentalstatus)
        conn.commit()
        st.success("Bike created!")
    except Exception as e:
        st.error(f"Error creating bike: {e}")

def create_customer(custfname, custlname, custemail, custpassword, custphone, custaddress, custhouseno, custcity, custstate, custzip):
    try:
        cursor.execute("INSERT INTO Customer (CustFName, CustLName, CustEmail, CustPassword, CustPhone, CustStreetAddress, CustHouseNo, CustCity, CustState, CustZIP) VALUES (?, ?, ?, CONVERT(varbinary(256), ?), ?, ?, ?, ?, ?, ?)", 
                       (custfname, custlname, custemail, custpassword, custphone, custaddress, custhouseno, custcity, custstate, custzip))
        conn.commit()
        st.success("Customer created successfully!")
    except:
        conn.rollback()
        st.error("Error: Customer creation failed.")

def create_dock(employeeid, dockname, docklocation, bikecapacity, bikeavailable):
    cursor.execute("INSERT INTO Dock (EmployeeID, DockName, DockLocation, BikeCapacity, BikeAvailable) VALUES (?, ?, ?, ?, ?)", (employeeid, dockname, docklocation, bikecapacity, bikeavailable))
    conn.commit()
    st.success("Dock created successfully!")

def create_employee(emp_fname, emp_lname, emp_email, emp_phone, emp_street_address, emp_house_no, emp_city, emp_state, emp_zip, emp_gender, emp_designation):
    insert_query = "INSERT INTO Employee (EmpFName, EmpLName, EmpEmail, EmpPhone, EmpStreetAddress, EmpHouseNo, EmpCity, EmpState, EmpZIP, EmpGender, EmpDesignation) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
    values = (emp_fname, emp_lname, emp_email, emp_phone, emp_street_address, emp_house_no, emp_city, emp_state, emp_zip, emp_gender, emp_designation)
    cursor.execute(insert_query, values)
    conn.commit()
    st.success("Employee added successfully!")


option = st.selectbox("Select a table", ("Select", "Accessory", "Bike", "Customer", "Dock", "Employee"))

if option == "Accessory":
    itemname = st.text_input("Item Name")
    itemcost = st.number_input("Item Cost")
    itemcount = st.number_input("Item Count", min_value=0)
    if st.button("Create Accessory"):
        create_accessory(itemname, itemcost, itemcount)

elif option == "Bike":
    bikemodelid = st.number_input("Bike Model ID", min_value=1)
    dockid = st.text_input("Dock ID")
    bikelocation = st.text_input("Bike Location")
    bikerentalstatus = st.checkbox("Bike Rental Status")
    if st.button("Create Bike"):
        create_bike(bikemodelid, dockid, bikelocation, bikerentalstatus)

elif option == "Customer":
    custfname = st.text_input("Customer First Name")
    custlname = st.text_input("Customer Last Name")
    custemail = st.text_input("Customer Email")
    custpassword = st.text_input("Customer Password", type="password")
    custphone = st.text_input("Customer Phone Number")
    custaddress = st.text_input("Customer Street Address")
    custhouseno = st.text_input("Customer House Number")
    custcity = st.text_input("Customer City")
    custstate = st.text_input("Customer State")
    custzip = st.text_input("Customer ZIP Code")
    if st.button("Create Customer"):
        create_customer(custfname, custlname, custemail, custpassword, custphone, custaddress, custhouseno, custcity, custstate, custzip)

elif option == "Dock":
    employeeid = st.text_input("Enter Employee ID:")
    dockname = st.text_input("Enter Dock Name:")
    docklocation = st.text_input("Enter Dock Location:")
    bikecapacity = st.number_input("Enter Bike Capacity:", min_value=0)
    bikeavailable = st.number_input("Enter Bike Available:", min_value=0, max_value=bikecapacity)
    if st.button("Create Dock"):
        create_dock(employeeid, dockname, docklocation, bikecapacity, bikeavailable)
        
elif option == "Employee":
    emp_fname = st.text_input("First Name")
    emp_lname = st.text_input("Last Name")
    emp_email = st.text_input("Email")
    emp_phone = st.text_input("Phone")
    emp_street_address = st.text_input("Street Address")
    emp_house_no = st.text_input("House No.")
    emp_city = st.text_input("City")
    emp_state = st.text_input("State")
    emp_zip = st.text_input("ZIP")
    emp_gender = st.selectbox("Gender", ["Male", "Female", "Other"])
    emp_designation = st.text_input("Designation")
    if st.button("Add Employee"):
        create_employee(emp_fname, emp_lname, emp_email, emp_phone, emp_street_address, emp_house_no, emp_city, emp_state, emp_zip, emp_gender, emp_designation)
