*** Settings ***
Resource    ../../resources.robot


*** Test Cases ***
Verify checkout with empty cart with error user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with error user
    Go to cart
    # Verify cart is empty
    Verify cart is empty
    # Go to checkout
    Go to checkout page
    Verify Checkout Page
    Fill in info for Checkout    John    Doe    707
    Go continue
    Verify Checkout overview    $0    $0.00    $0.00
    Go finish (error user)
    # Finish btn should not be workable, still remain at checkout overview page
    Verify Checkout overview    $0    $0.00    $0.00
    Close Browser
    Fail    With empty cart Checkout function must be not available.

Fill postal-code contain letter with error user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with error user
    # Buy an item
    Buy Sauce Labs Backpack
    # Go to checkout
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Fill in info for Checkout    John    Doe    abcdd
    Go continue
    Verify Checkout overview    $29.99    $2.40    $32.39
    Close Browser
    Fail    Postal-code supposed to be not contain any letters.

Fill valid info at Checkout page with error user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with error user
    # Buy an item
    Buy Sauce Labs Backpack
    # Go to checkout
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Fill in info for Checkout    John    Doe    707
    # Last name field should empty
    Element Attribute Value Should Be    id:last-name    value    ${EMPTY} 
    # Error user should be able to go to checkout overview page without last name
    Go continue
    Verify Checkout overview    $29.99    $2.40    $32.39
    Close Browser

Not fill firstname at Checkout page with error user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with error user
    # Buy an item
    Buy Sauce Labs Backpack
    # Go to checkout
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Input Text    id:last-name    Doctor
    Input Text    id:postal-code    707   
    Go continue
    # Error message should appear
    Page Should Contain    Error: First Name is required
    # Can turn off error message
    Click Button    class:error-button
    # Error message should disappear
    Page Should Not Contain    Error: First Name is required
    Close Browser

Not fill lastname at Checkout page with error user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with error user
    # Buy an item
    Buy Sauce Labs Backpack
    # Go to checkout
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Input Text    id:first-name    John
    Input Text    id:postal-code    707  
    Go continue
    # Error user should be able to go to checkout overview page without last name
    Verify Checkout overview    $29.99    $2.40    $32.39
    Close Browser

Not fill postal-code at Checkout page with error user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with error user
    # Buy an item
    Buy Sauce Labs Backpack
    # Go to checkout
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Input Text    id:first-name    John
    Input Text    id:last-name    Doe
    Go continue
    # Error message should appear
    Page Should Contain    Error: Postal Code is required
    # Can turn off error message
    Click Button    class:error-button
    # Error message should disappear
    Page Should Not Contain    Error: Postal Code is required
    Close Browser

Only fill firstname at Checkout page with error user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with error user
    # Buy an item
    Buy Sauce Labs Backpack
    # Go to checkout
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Input Text    id:first-name    John
    Go continue
    # Error message should appear
    Page Should Contain    Error: Postal Code is required
    # Can turn off error message
    Click Button    class:error-button
    # Error message should disappear
    Page Should Not Contain    Error: Postal Code is required
    Close Browser

Only fill lastname at Checkout page with error user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with error user
    # Buy an item
    Buy Sauce Labs Backpack
    # Go to checkout
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Input Text    id:last-name    Doe
    Go continue
    # Error message should appear
    Page Should Contain    Error: First Name is required
    # Can turn off error message
    Click Button    class:error-button
    # Error message should disappear
    Page Should Not Contain    Error: First Name is required
    Close Browser

Only fill postal-code at Checkout page with error user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with error user
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

Cancel checkout process at checkout overview with error user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with error user
    # Buy an item
    Buy Sauce Labs Backpack
    # Go to checkout
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Fill in info for Checkout (error user)    John    707
    Go continue
    Verify Checkout overview    $29.99    $2.40    $32.39
    Cancel checkout
    # Should return to product page, cart should still contain item
    Element Text Should Be    class:title    Products
    Verify Remove button of Sauce Labs Backpack
    Go to cart
    Verify First item in cart    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    # Verify cart is not empty
    Close Browser

Cancel checkout process at checkout information with error user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with error user
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

Buy an item and checkout with error user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with error user
    # Buy an item
    Buy Sauce Labs Backpack
    # Go to checkout to verify
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Fill in info for Checkout (error user)    John    707
    Go continue
    Verify First item in checkout    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    Verify Checkout overview    $29.99    $2.40    $32.39
    Go finish (error user)
    # Finish btn should not be workable, still remain at checkout overview page
    Verify Checkout overview    $29.99    $2.40    $32.39
    Close Browser

Buy some items then checkout with error user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with error user
    # Buy an item
    Buy Sauce Labs Backpack
    # Go to checkout to verify
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Fill in info for Checkout (error user)    John    707
    Go continue
    Verify First item in checkout    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    Verify Checkout overview    $29.99    $2.40    $32.39
    Cancel checkout
    # Buy another item
    Buy Sauce Labs Bike Light
    # Go to checkout to verify
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Fill in info for Checkout (error user)    John    707
    Go continue
    Verify First item in checkout    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    Verify Second item in checkout    ${ITEMS}[1]    ${ITEM2_DESC}    ${ITEMS_PRICE}[1]
    Verify Checkout overview    $39.98    $3.20    $43.18
    Cancel checkout
    # Buy another item
    Buy Sauce Labs Onesie
    # Go to checkout to verify
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Fill in info for Checkout (error user)    John    707
    Go continue
    Verify First item in checkout    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    Verify Second item in checkout    ${ITEMS}[1]    ${ITEM2_DESC}    ${ITEMS_PRICE}[1]
    Verify Third item in checkout    ${ITEMS}[4]    ${ITEM5_DESC}    ${ITEMS_PRICE}[4]
    Verify Checkout overview    $47.97    $3.84    $51.81
    Go finish (error user)
    # Finish btn should not be workable, still remain at checkout overview page
    Verify Checkout overview    $47.97    $3.84    $51.81
    Close Browser