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

st.session_state["cur_page"] = 1

st.session_state["exe"] = 0

st.set_page_config(initial_sidebar_state="collapsed")

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

cr = db.cursor()
cr.execute("use mydb")

var = -1

def products(cr):
    cr.execute("select * from category;")
    recs = cr.fetchall()
    for r in recs:
        if(st.button(r[1])):
            st.session_state["var"] = r[0]
            if(st.session_state["exe"]==0):
               st.switch_page(r"pages\prods.py")
               st.session_state["exe"] = 1
               
    if(st.button("BACK")):
        st.switch_page(r"pages\implementation.py")

def edit(cr):
    
    ii = 0
    sa = 1000
    pi = 2000
    di = 3000
    na = 4000
    
    cr.execute("select * from product;")
    recs = cr.fetchall()
    sal = 0
    paid = 0
    
    for r in recs:
        ii+=1
        sa+=1
        pi+=1
        di+=1
        na+=1
        cols = st.columns(6)
        #cr.execute(f"select MonthlySalary, IsSalaryCredited from employee where Account_AccountID = '{r[7]}';")
        #r2 = cr.fetchone()
        cost = r[2]
        desc = r[3]
        cat = r[6]
        
        with cols[0]:
            st.button(f"ProductID: {r[0]}")
        with cols[1]:
            st.button(r[1],key = na)
        with cols[2]:
            cost = st.text_input(f"Cost: {r[2]}",key=sa)
        with cols[3]:
            desc = st.text_input(f"Description: {r[3]}",key=pi)
        with cols[4]:
            cat = st.text_input(f"Quantity: {r[6]}",key = di)
            
        with cols[5]:
            if(st.button("Update",key=ii)):
                cr.execute(f"update product set Cost = {cost}, Description = '{desc}' , Quantity = {cat} where ProductID = '{r[0]}';")
                db.commit()
                
    
    if st.button("BACK"):
            st.switch_page(r"pages\emplog.py")
        
            
        
            
        
          
            
            
        
edit(cr)