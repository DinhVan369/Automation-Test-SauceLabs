*** Settings ***
Resource    ../resources.robot


*** Test Cases ***
Click all item at product page
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with standard user
    # Verify product page
    Verify product page
    # Click view all item
    Click all items
    # Should return to home page
    Verify product page
    Close Browser

Click all item at cart page
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with standard user
    # Go to cart page
    Go to cart
    # Click view all item
    Click all items
    # Should return to home page
    Verify product page
    Close Browser

Click all item at items detail page
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with standard user
    Go to Sauce Labs Backpack detail page
    # Click view all item
    Click all items
    # Should return to home page
    Verify product page
    Go to Sauce Labs Bike Light detail page
    # Click view all item
    Click all items
    # Should return to home page
    Verify product page
    Go to Sauce Labs Bolt T-Shirt detail page
    # Click view all item
    Click all items
    # Should return to home page
    Verify product page
    Go to Sauce Labs Fleece Jacket detail page
    # Click view all item
    Click all items
    # Should return to home page
    Verify product page
    Go to Sauce Labs Onesie detail page
    # Click view all item
    Click all items
    # Should return to home page
    Verify product page
    Go to Test.allTheThings() T-Shirt (Red) detail page
    # Click view all item
    Click all items
    # Should return to home page
    Verify product page
    Close Browser

Click all item at checkout info page
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with standard user
    # Go to checkout info page
    Go to cart
    Go to checkout page
    # Click view all item
    Click all items
    # Should return to home page
    Verify product page
    Close Browser

Click all item at checkout overview page
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with standard user
    # Go to checkout overview page
    Go to cart
    Go to checkout page
    Fill in info for Checkout    Aatroxx    Darkin    369369
    Go continue
    # Click view all item
    Click all items
    # Should return to home page
    Verify product page
    Close Browser

Click all item at checkout complete page
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with standard user
    # Go to checkout complete page
    Go to cart
    Go to checkout page
    Fill in info for Checkout    Aatroxx    Darkin    369369
    Go continue
    Go finish
    # Click view all item
    Click all items
    # Should return to home page
    Verify product page
    Close Browser