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
    r'''cr.execute("select * from category;")
    recs = cr.fetchall()
    for r in recs:
        if(st.button(r[1])):
            st.session_state["var"] = r[0]
            if(st.session_state["exe"]==0):
               st.switch_page(r"pages\prods.py")
               st.session_state["exe"] = 1'''
    
    if(st.button("Edit employee info")):
        st.switch_page(r"pages\editemps.py")
        
    if(st.button("Edit Product Info")):
        st.switch_page(r"pages\editprods.py")
    
               
    if(st.button("BACK")):
        st.switch_page(r"pages\emplog.py")
        
            
            
        
products(cr)