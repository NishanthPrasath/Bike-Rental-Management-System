import streamlit as st
import pandas as pd
import pyodbc

server = 'NISHU-DELL'
database = 'BlueBikes'
driver = 'ODBC Driver 17 for SQL Server'
conn = pyodbc.connect('DRIVER={'+driver+'};SERVER='+server+';DATABASE='+database+';Trusted_Connection=yes;')
cursor = conn.cursor()


st.title('Blue Bikes Database Management System')
st.subheader('Update Operation')

def update_accessory(itemid, itemname, itemcost, itemcount):
    try:
        cursor.execute("UPDATE Accessory SET ItemName = ?, ItemCost = ?, ItemCount = ? WHERE ItemID = ?", itemname, itemcost, itemcount, itemid)
        conn.commit()
        st.success("Accessory updated!")
    except Exception as e:
        st.error(f"Error updating accessory: {e}")

def update_bike(bikeid, bikemodelid, dockid, bikelocation, bikerentalstatus):
    try:
        cursor.execute("UPDATE Bike SET BikeModelID = ?, DockID = ?, BikeLocation = ?, BikeRentalStatus = ? WHERE BikeID = ?", bikemodelid, dockid, bikelocation, bikerentalstatus, bikeid)
        conn.commit()
        st.success("Bike updated!")
    except Exception as e:
        st.error(f"Error updating bike: {e}")

def update_customer(custid, custfname, custlname, custemail, custpassword, custphone, custaddress, custhouseno, custcity, custstate, custzip):
    try:
        cursor.execute("UPDATE Customer SET CustFName = ?, CustLName = ?, CustEmail = ?, CustPassword = CONVERT(varbinary(256), ?), CustPhone = ?, CustStreetAddress = ?, CustHouseNo = ?, CustCity = ?, CustState = ?, CustZIP = ? WHERE CustomerID = ?", 
                       (custfname, custlname, custemail, custpassword, custphone, custaddress, custhouseno, custcity, custstate, custzip, custid))
        conn.commit()
        st.success("Customer updated successfully!")
    except:
        conn.rollback()
        st.error("Error: Customer update failed.")

def update_dock(employeeid, dockid, dockname, docklocation, bikecapacity, bikeavailable):
    cursor.execute("UPDATE Dock SET EmployeeID = ?, DockName = ?, DockLocation = ?, BikeCapacity = ?, BikeAvailable = ? WHERE DockID = ?", (employeeid, dockname, docklocation, bikecapacity, bikeavailable, dockid))
    conn.commit()
    st.success("Dock updated successfully!")

def update_employee(employee_id, emp_fname, emp_lname, emp_email, emp_phone, emp_street_address, emp_house_no, emp_city, emp_state, emp_zip, emp_gender, emp_designation):
    update_query = "UPDATE Employee SET EmpFName = ?, EmpLName = ?, EmpEmail = ?, EmpPhone = ?, EmpStreetAddress = ?, EmpHouseNo = ?, EmpCity = ?, EmpState = ?, EmpZIP = ?, EmpGender = ?, EmpDesignation = ? WHERE EmployeeID = ?"
    values = (emp_fname, emp_lname, emp_email, emp_phone, emp_street_address, emp_house_no, emp_city, emp_state, emp_zip, emp_gender, emp_designation, employee_id)
    cursor.execute(update_query, values)
    conn.commit()
    st.success("Employee updated successfully!")

option = st.selectbox("Select a table", ("Select", "Accessory", "Bike", "Customer", "Dock", "Employee"))

if option == "Accessory":
    itemid = st.number_input("Enter Item ID to update:", min_value=1001)
    itemname = st.text_input("Item Name")
    itemcost = st.number_input("Item Cost")
    itemcount = st.number_input("Item Count", min_value=0)
    if st.button("Update Accessory"):
        update_accessory(itemid, itemname, itemcost, itemcount)

elif option == "Bike":
    bikeid = st.text_input("Enter Bike ID to update:")
    bikemodelid = st.number_input("Bike Model ID", min_value=1)
    dockid = st.text_input("Dock ID")
    bikelocation = st.text_input("Bike Location")
    bikerentalstatus = st.checkbox("Bike Rental Status")
    if st.button("Update Bike"):
        update_bike(bikeid, bikemodelid, dockid, bikelocation, bikerentalstatus)

elif option == "Customer":
    custid = st.text_input("Enter Customer ID to update:")
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
    if st.button("Update Customer"):
        update_customer(custid, custfname, custlname, custemail, custpassword, custphone, custaddress, custhouseno, custcity, custstate, custzip)

elif option == "Dock":
    dockid = st.text_input("Enter Dock ID to update:")
    employeeid = st.text_input("Enter Employee ID:")
    dockname = st.text_input("Enter Dock Name:")
    docklocation = st.text_input("Enter Dock Location:")
    bikecapacity = st.number_input("Enter Bike Capacity:", min_value=0)
    bikeavailable = st.number_input("Enter Bike Available:", min_value=0, max_value=bikecapacity)
    if st.button("Update Dock"):
        update_dock(employeeid, dockid, dockname, docklocation, bikecapacity, bikeavailable)

elif option == "Employee":
    employee_id = st.text_input("Enter Employee ID to update:")
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
    if st.button("Update"):
        update_employee(employee_id, emp_fname, emp_lname, emp_email, emp_phone, emp_street_address, emp_house_no, emp_city, emp_state, emp_zip, emp_gender, emp_designation)
