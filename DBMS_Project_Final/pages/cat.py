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
    if(st.button("Logout")):
        cr.execute(f"select Product_ProductID from cartitem where ItemQuantity>0;")
        recs = cr.fetchall()
        f = open("op.txt","w")
        for i in recs:
            
            #f.write(st.session_state.cart[i[0]])
            #st.session_state.cart[f"{i[0]}"] = 0
            pass
            
        cr.execute(f"delete from cartitem where ItemQuantity>0;")
        db.commit()
        st.switch_page(r"pages\implementation.py")
        
            
            
        
products(cr)