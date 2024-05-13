from time import sleep
import mysql.connector
import streamlit as st
import sys
#from streamlit.state.session_state import SessionState

db = mysql.connector.connect(
    
    host = "localhost",
    user = "root",
    password = "Duppu0903)()#",
    database = "mydb"
    
    
)

cr = db.cursor()
cr.execute("use mydb")


st.set_page_config(initial_sidebar_state="collapsed")

st.session_state["cur_page"] = 0
#st.session_state["attempts"] = 0

st.markdown(
    """
<style>
    [data-testid="collapsedControl"] {
        display: none
    }
</style>
""",
    unsafe_allow_html=True,
)

def updatea():
    st.session_state["attempts"]+=1
    #st.write(st.session_state["attempts"])
    st.error("Invalid username or password. Attempts left: {}".format(3-st.session_state["attempts"]))
    
    if(st.session_state["attempts"]!=3):
       #st.rerun()
       
       pass
    else:
        #st.write("fffff")
        #sleep(2)
        st.error("Maximum attempts reached. App closing...")
        sleep(2)
        return 0



        
def login_page(cr):
    
    em = st.text_input("Enter email_id: ")
    pas = st.text_input("Enter password")
    num = st.text_input("Enter number")
    name = st.text_input("Enter name")
    addr = st.text_input("Enter Address")
    sess = st.session_state["sessionid"]
    acid = st.session_state["accountid"]+1
    
    if(st.button("Register")):
    
        cr.execute(f"insert into account(emailID, Name, Password, PhoneNumber, Address, SessionID, isEmployee, AccountID) values ('{em}','{name}','{pas}','{num}','{addr}',{sess},0,'{acid}');")
        db.commit()
        sleep(2)
        st.switch_page(r"C:\Users\vijva\Documents\DBMS\Project\pages\implementation.py")
    max_attempts = 3
    
        
 

def mai(cr):
    log = login_page(cr)
    #sleep(5)
    
    
    if(log==0):
        st.write("success")
        #sleep(3)
        
        st.switch_page(r"pages\cat.py")
    if(log==2):
        st.stop()
        
        return
    
def change(cr):
    
    nam = st.text_input("Name")
    cos = st.text_input("Cost")
    desc = st.text_input('Description')
    disc = st.text_input("Discount")
    cat = st.text_input("category")
    qu = st.text_input("Quantity")
    
def see(cr):
    
    cat = st.text_input("Category")
    
    if(cat.lower()!="all"):
        cr.execute(f"select * from product where category_category_id = '{cat}';")
        recs = cr.fetchall()
        
        a,b,c,d = st.columns(4)
        
        with a:
            st.write("Product Id")
        with b:
            st.write("Name")
        with c:
            st.write("Cost")
        with d:
            st.write("Quantity")
            
        for r in recs:
            with a:
                st.write(r[0])
            with b:
                st.write(r[1])
            with c:
                st.write(r[2])
            with d:
                st.write(r[6])
    
    else:
        cr.execute(f"select * from product;")
        recs = cr.fetchall()
        
        a,b,c,d = st.columns(4)
        
        with a:
            st.write("Product Id")
        with b:
            st.write("Name")
        with c:
            st.write("Cost")
        with d:
            st.write("Quantity")
            
        for r in recs:
            with a:
                st.write(r[0])
            with b:
                st.write(r[1])
            with c:
                st.write(r[2])
            with d:
                st.write(r[6])
                
    if(st.button("BACK")):
        st.switch_page(r"pages\implementation.py")
        
    
    

# Separate 
see(cr)

