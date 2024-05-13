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


def view_cart():
    if len(st.session_state.cart) > 0:
        
        st.subheader("Your Cart")
        #for product_id, quantity in st.session_state.cart.items():
        cr.execute("select * from cartitem;")
        recs = cr.fetchall()
        
        #st.write(product_id)
        for r in recs:
            
        # Fetch product details based on product_id
            product_id = r[1]
            cr.execute(f"select category_category_id from product where ProductID = '{product_id}';")
            rr = cr.fetchone()
            cr.execute(f"select Percentage from discount where category_category_id1 = '{rr[0]}';")
            rd = cr.fetchone()
            quantity = r[0]
            cr.execute(f"select Description, Cost from product where ProductID = '{product_id}';")
            product_data = cr.fetchone()
            # Display product details and quantity
            #st.write(f"{product_data[0]} - ${product_data[1]:.2f} (x{quantity})")
            
            st.write(f"{product_data[0]} - {(product_data[1] - product_data[1]*rd[0]/100)*quantity},  ({quantity} items), price after discount")
        
        
        # Add buttons for update quantity or remove from cart (optional)
    a,b = st.columns(2)
    with a:
        if st.button("BACK"):
            st.switch_page(r"pages\prods.py")
    with b:
        if(st.button("Proceed to Checkout")):
            st.switch_page(r"pages\buy.py")
        

# Call view_cart() after the product listing section
view_cart()