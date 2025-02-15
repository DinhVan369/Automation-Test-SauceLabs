*** Settings ***
Resource    ../../resources.robot


*** Test Cases ***
Verify checkout with empty cart with problem user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with problem user
    Go to cart
    # Verify cart is empty
    Verify cart is empty
    # Go to checkout
    Go to checkout page
    Verify Checkout Page
    Close Browser
    Fail    With empty cart Checkout function must be not available.

Fill valid info at Checkout page with problem user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with problem user
    # Buy an item
    Buy Sauce Labs Backpack
    # Go to checkout
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Fill in info for Checkout    John    Doe    707
    # First name field should be replaced by one latest character type from last name field
    Element Attribute Value Should Be    id:first-name    value    e
    # Last name field should empty
    Element Attribute Value Should Be    id:last-name    value    ${EMPTY}   
    Go continue
    # Error message should appear
    Page Should Contain    Error: Last Name is required
    # Can turn off error message
    Click Button    class:error-button
    # Error message should disappear
    Page Should Not Contain    Error: Last Name is required
    Close Browser

Not fill firstname at Checkout page with problem user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with problem user
    # Buy an item
    Buy Sauce Labs Backpack
    # Go to checkout
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Input Text    id:last-name    Doctor
    Input Text    id:postal-code    707   
    # First name field should be replaced by one latest character type from last name field
    Element Attribute Value Should Be    id:first-name    value    r
    # Last name field should empty
    Element Attribute Value Should Be    id:last-name    value    ${EMPTY} 
    Go continue
    # Error message should appear
    Page Should Contain    Error: Last Name is required
    # Can turn off error message
    Click Button    class:error-button
    # Error message should disappear
    Page Should Not Contain    Error: Last Name is required
    Close Browser

Not fill lastname at Checkout page with problem user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with problem user
    # Buy an item
    Buy Sauce Labs Backpack
    # Go to checkout
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Input Text    id:first-name    John
    Input Text    id:postal-code    707  
    Go continue
    # Error message should appear
    Page Should Contain    Error: Last Name is required
    # Can turn off error message
    Click Button    class:error-button
    # Error message should disappear
    Page Should Not Contain    Error: Last Name is required
    Close Browser

Not fill postal-code at Checkout page with problem user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with problem user
    # Buy an item
    Buy Sauce Labs Backpack
    # Go to checkout
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Input Text    id:first-name    John
    Input Text    id:last-name    Doe
    # First name field should be replaced by one latest character type from last name field
    Element Attribute Value Should Be    id:first-name    value    e
    # Last name field should empty
    Element Attribute Value Should Be    id:last-name    value    ${EMPTY} 
    Go continue
    # Error message should appear
    Page Should Contain    Error: Last Name is required
    # Can turn off error message
    Click Button    class:error-button
    # Error message should disappear
    Page Should Not Contain    Error: Last Name is required
    Close Browser

Only fill firstname at Checkout page with problem user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with problem user
    # Buy an item
    Buy Sauce Labs Backpack
    # Go to checkout
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Input Text    id:first-name    John
    Go continue
    # Error message should appear
    Page Should Contain    Error: Last Name is required
    # Can turn off error message
    Click Button    class:error-button
    # Error message should disappear
    Page Should Not Contain    Error: Last Name is required
    Close Browser

Only fill lastname at Checkout page with problem user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with problem user
    # Buy an item
    Buy Sauce Labs Backpack
    # Go to checkout
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Input Text    id:last-name    Doe
    # First name field should be replaced by one latest character type from last name field
    Element Attribute Value Should Be    id:first-name    value    e
    # Last name field should empty
    Element Attribute Value Should Be    id:last-name    value    ${EMPTY} 
    Go continue
    # Error message should appear
    Page Should Contain    Error: Last Name is required
    # Can turn off error message
    Click Button    class:error-button
    # Error message should disappear
    Page Should Not Contain    Error: Last Name is required
    Close Browser

Only fill postal-code at Checkout page with problem user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with problem user
    # Buy an item
    Buy Sauce Labs Backpack
    # Go to checkout
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Input Text    id:postal-code    707
    Go continue
    # Error message should appear
    Page Should Contain    Error: First Name is required
    # Can turn off error message
    Click Button    class:error-button
    # Error message should disappear
    Page Should Not Contain    Error: First Name is required
    Close Browser

Cancel checkout process at checkout information with problem user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with problem user
    # Buy an item
    Buy Sauce Labs Backpack
    # Go to checkout
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Cancel checkout
    # Should return to cart page, cart should still contain item
    Verify Cart page
    Verify First item in cart    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    # Verify cart is not empty
    Close Browser

# Because problem user have problem at the last name input field, so we cant perform further test of checkout function