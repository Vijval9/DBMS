from time import sleep
import mysql.connector
import streamlit as st
#from streamlit.state.session_state import SessionState

db = mysql.connector.connect(
    
    host = "localhost",
    user = "root",
    password = "Duppu0903)()#",
    database = "mydb"
    
    
)

st.set_page_config(initial_sidebar_state="collapsed")
st.markdown("""
    <style>
    [data-testid="collapsedControl"] { display: none }
    </style>
""", unsafe_allow_html=True)




global cr
cr = db.cursor()
cr.execute("use mydb")

def paid(cr):
    
    st.write("Payment completed!")
    
    if(st.button("BAck to Categories")):
        st.switch_page(r"pages\cat.py")
        
paid(cr)      
        
    
    
    