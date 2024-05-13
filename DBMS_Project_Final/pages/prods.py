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


def add_to_cart():
    product_id = st.session_state.get("add_to_cart_product_id")
    if product_id:
        
        if "cart" not in st.session_state:
            st.session_state.cart = {}
        if product_id in st.session_state.cart:
            st.session_state.cart[product_id] += 1
        else:
            st.session_state.cart[product_id] = 1
        
        x = 0
        
        cr.execute(f"select * from CartItem where Product_ProductID = '{product_id}';")
        rrr = cr.fetchall()
        if(len(rrr)==0):
            cr.execute(f"INSERT INTO mydb.CartItem (ItemQuantity, Product_ProductID) VALUES ({st.session_state.cart[product_id]}, '{product_id}');")
            db.commit()
        else:
            cr.execute(f"update CartItem set ItemQuantity = {st.session_state.cart[product_id]} where Product_ProductID = '{product_id}';")
            db.commit()

def remove_from_cart(product_id):
    if product_id in st.session_state.cart:
        st.session_state.cart[product_id] -= 1
        cr.execute(f"update CartItem set ItemQuantity = {st.session_state.cart[product_id]} where Product_ProductID = '{product_id}';")
        db.commit()
        if st.session_state.cart[product_id] <= 0:
            del st.session_state.cart[product_id]

def add_to_cart_callback(product_id):
    st.session_state["add_to_cart_product_id"] = product_id
    add_to_cart()

def prods():
    # ... (other code omitted for brevity)
    if "cart" not in st.session_state:
        st.session_state.cart = {}
    cats = st.session_state["var"]
    #st.write(st.session_state["var"])
    q = f"select * from product where category_category_id = {cats};"
    cr.execute(q)
    recs = cr.fetchall()
    
    a,b,c,d,e,f = st.columns(6)
    with a:
        st.write("Product Description")
    with b:
        st.write("Price in dollars")
    with c:
        st.write("Discount %")
    
    for r in recs:
        quantity = st.session_state.cart.get(r[0], 0)
        a,b,d,col1, col2, col3 = st.columns(6)
        cr.execute(f"select Percentage from discount where category_category_id1 = '{cats}';")
        dd = cr.fetchone()
        with a:
            st.write(r[3])
        with b:
            st.write(str(r[2]))
        with d:
            st.write(str(dd[0]))
        
        with col1:
            st.button("add", key=f"add_{r[0]}", on_click=add_to_cart_callback, args=(r[0],),disabled = (quantity == r[6]))
        with col2:
            cr.execute(f"select ItemQuantity from cartitem where Product_ProductID = '{r[0]}';")
            recs = cr.fetchone()
            if(recs==None):
                st.write(0)
            else:
                st.write(f"{recs[0]}")
        with col3:
            st.button("remove", key=f"remove_{r[0]}", on_click=remove_from_cart, args=(r[0],), disabled=(quantity == 0))
            
        #st.write(f"{str(r[3])} - ${r[1]:.2f}")
    
    a,b = st.columns(2)
    with a:
        if(st.button("VIEW CART")):
            st.switch_page(r"pages\cart.py")
    with b:
        if(st.button("BACK")):
            st.switch_page(r"pages\cat.py")
        
    

prods()           
                    
                
