*** Settings ***
Resource    ../resources.robot


*** Test Cases ***
Reset App State with standard user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with standard user
    Buy all Items
    Cart Item Quantity    6
    # Click reset app state
    Reset App State
    # Verify all item was remove from cart
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span 
    Go to cart
    Verify cart is empty
    Continue Shopping
    Verify all Add button
    Logout the page
    Close Browser

Reset App State with performane glitch user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with performance glitch user
    Buy all Items
    Cart Item Quantity    6
    # Click reset app state
    Reset App State
    # Verify all item was remove from cart
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span 
    Go to cart
    Verify cart is empty
    Continue Shopping
    Verify all Add button
    Logout the page
    Close Browser

Reset App State with visual user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with visual user
    Buy all Items
    Cart Item Quantity    6
    # Click reset app state
    Reset App State
    # Verify all item was remove from cart
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span 
    Go to cart
    Verify Checkout button position changed
    Verify cart is empty
    Continue Shopping
    Verify Cart Icon position changed
    Verify all Add button
    Logout the page
    Close Browser

Reset App State with problem user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with problem user
    Buy all Items (problem user)
    Cart Item Quantity    3
    # Click reset app state
    Reset App State
    # Verify all item was remove from cart
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span 
    Go to cart
    Verify cart is empty
    Continue Shopping
    Verify all Add button
    Logout the page
    Close Browser

Reset App State with error user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with error user
    Buy all Items (problem user)
    Cart Item Quantity    3
    # Click reset app state
    Reset App State
    # Verify all item was remove from cart
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span 
    Go to cart
    Verify cart is empty
    Continue Shopping
    Verify all Add button
    Logout the page
    Close Browser
