import streamlit as st
import pandas as pd
import pyodbc

server = 'NISHU-DELL'
database = 'BlueBikes'
driver = 'ODBC Driver 17 for SQL Server'
conn = pyodbc.connect('DRIVER={'+driver+'};SERVER='+server+';DATABASE='+database+';Trusted_Connection=yes;')
cursor = conn.cursor()


st.title('Blue Bikes Database Management System')
st.subheader('Delete Operation')

def delete_accessory(itemid):
    try:
        cursor.execute("DELETE FROM Accessory WHERE ItemID = ?", itemid)
        conn.commit()
        st.success("Accessory deleted!")
    except Exception as e:
        st.error(f"Error deleting accessory: {e}")

def delete_bike(bikeid):
    try:
        cursor.execute("DELETE FROM Bike WHERE BikeID = ?", bikeid)
        conn.commit()
        st.success("Bike deleted!")
    except Exception as e:
        st.error(f"Error deleting bike: {e}")

def delete_customer(custid):
    try:
        cursor.execute("DELETE FROM Customer WHERE CustomerID = ?", (custid,))
        conn.commit()
        st.success("Customer deleted successfully!")
    except:
        conn.rollback()
        st.error("Error: Customer deletion failed.")

def delete_dock(dockid):
    cursor.execute("DELETE FROM Dock WHERE DockID = ?", dockid)
    conn.commit()
    st.success("Dock deleted successfully!")

def delete_employee(employee_id):
    delete_query = "DELETE FROM Employee WHERE EmployeeID = ?"
    cursor.execute(delete_query, (employee_id,))
    conn.commit()
    st.warning("Employee deleted successfully!")

option = st.selectbox("Select a table", ("Select", "Accessory", "Bike", "Customer", "Dock", "Employee"))

if option == "Accessory":
    itemid = st.number_input("Enter Item ID to delete:", min_value=1001)
    if st.button("Delete Accessory"):
        delete_accessory(itemid)

elif option == "Bike":
    bikeid = st.text_input("Enter Bike ID to delete:")
    if st.button("Delete Bike"):
        delete_bike(bikeid)

elif option == "Customer":
    custid = st.text_input("Enter Customer ID to delete:")
    if st.button("Delete Customer"):
        delete_customer(custid)

elif option == "Dock":
    dockid = st.text_input("Enter Dock ID to delete:")
    if st.button("Delete Dock"):
        delete_dock(dockid)

elif option == "Employee":
    employee_id = st.text_input("Enter Employee ID to delete:")
    if st.button("Delete"):
        delete_employee(employee_id)