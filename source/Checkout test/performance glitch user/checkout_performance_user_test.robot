*** Settings ***
Resource    ../../resources.robot


*** Test Cases ***
Verify checkout with empty cart with performance glitch user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with performance glitch user
    Go to cart
    # Verify cart is empty
    Verify cart is empty
    # Go to checkout
    Go to checkout page
    Verify Checkout Page
    Fill in info for Checkout    John    Doe    707
    Go continue
    Verify Checkout overview    $0    $0.00    $0.00
    Go finish
    Close Browser
    Fail    With empty cart Checkout function must be not available.

Fill postal-code contain letter with performance glitch user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with performance glitch user
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

Fill valid info at Checkout page with performance glitch user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with performance glitch user
    # Buy an item
    Buy Sauce Labs Backpack
    # Go to checkout
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Fill in info for Checkout    John    Doe    707
    Go continue
    Verify Checkout overview    $29.99    $2.40    $32.39
    Close Browser

Not fill firstname at Checkout page with performance glitch user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with performance glitch user
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

Not fill lastname at Checkout page with performance glitch user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with performance glitch user
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

Not fill postal-code at Checkout page with performance glitch user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with performance glitch user
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

Only fill firstname at Checkout page with performance glitch user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with performance glitch user
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

Only fill lastname at Checkout page with performance glitch user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with performance glitch user
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

Only fill postal-code at Checkout page with performance glitch user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with performance glitch user
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

Cancel checkout process at checkout overview with performance glitch user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with performance glitch user
    # Buy an item
    Buy Sauce Labs Backpack
    # Go to checkout
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Fill in info for Checkout    John    Doe    707
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

Cancel checkout process at checkout information with performance glitch user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with performance glitch user
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

Buy each item and checkout for each item with performance glitch user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with performance glitch user
    # Buy an item
    Buy Sauce Labs Backpack
    # Go to checkout to verify
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Fill in info for Checkout    John    Doe    707
    Go continue
    Verify First item in checkout    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    Verify Checkout overview    $29.99    $2.40    $32.39
    Go finish
    Go back to home page
    # Buy another item
    Buy Sauce Labs Bike Light
    # Go to checkout to verify
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Fill in info for Checkout    John    Doe    707
    Go continue
    Verify First item in checkout    ${ITEMS}[1]    ${ITEM2_DESC}    ${ITEMS_PRICE}[1]
    Verify Checkout overview    $9.99    $0.80    $10.79
    Go finish
    Go back to home page
    # Buy another item
    Buy Sauce Labs Bolt T-Shirt
    # Go to checkout to verify
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Fill in info for Checkout    John    Doe    707
    Go continue
    Verify First item in checkout    ${ITEMS}[2]    ${ITEM3_DESC}    ${ITEMS_PRICE}[2]
    Verify Checkout overview    $15.99    $1.28    $17.27
    Go finish
    Go back to home page
    # Buy another item
    Buy Sauce Labs Fleece Jacket
    # Go to checkout to verify
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Fill in info for Checkout    John    Doe    707
    Go continue
    Verify First item in checkout    ${ITEMS}[3]    ${ITEM4_DESC}    ${ITEMS_PRICE}[3]
    Verify Checkout overview    $49.99    $4.00    $53.99
    Go finish
    Go back to home page
    # Buy another item
    Buy Sauce Labs Onesie
    # Go to checkout to verify
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Fill in info for Checkout    John    Doe    707
    Go continue
    Verify First item in checkout    ${ITEMS}[4]    ${ITEM5_DESC}    ${ITEMS_PRICE}[4]
    Verify Checkout overview    $7.99    $0.64   $8.63
    Go finish
    Go back to home page
    # Buy another item
    Buy Test.allTheThings() T-Shirt (Red)
    # Go to checkout to verify
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Fill in info for Checkout    John    Doe    707
    Go continue
    Verify First item in checkout    ${ITEMS}[5]    ${ITEM6_DESC}    ${ITEMS_PRICE}[5]
    Verify Checkout overview    $15.99    $1.28    $17.27
    Go finish
    Go back to home page
    Close Browser

Buy all items then checkout for all items with performance glitch user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with performance glitch user
    # Buy an item
    Buy Sauce Labs Backpack
    # Go to checkout to verify
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Fill in info for Checkout    John    Doe    707
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
    Fill in info for Checkout    John    Doe    707
    Go continue
    Verify First item in checkout    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    Verify Second item in checkout    ${ITEMS}[1]    ${ITEM2_DESC}    ${ITEMS_PRICE}[1]
    Verify Checkout overview    $39.98    $3.20    $43.18
    Cancel checkout
    # Buy another item
    Buy Sauce Labs Bolt T-Shirt
    # Go to checkout to verify
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Fill in info for Checkout    John    Doe    707
    Go continue
    Verify First item in checkout    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    Verify Second item in checkout    ${ITEMS}[1]    ${ITEM2_DESC}    ${ITEMS_PRICE}[1]
    Verify Third item in checkout    ${ITEMS}[2]    ${ITEM3_DESC}    ${ITEMS_PRICE}[2]
    Verify Checkout overview    $55.97    $4.48    $60.45
    Cancel checkout
    # Buy another item
    Buy Sauce Labs Fleece Jacket
    # Go to checkout to verify
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Fill in info for Checkout    John    Doe    707
    Go continue
    Verify First item in checkout    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    Verify Second item in checkout    ${ITEMS}[1]    ${ITEM2_DESC}    ${ITEMS_PRICE}[1]
    Verify Third item in checkout    ${ITEMS}[2]    ${ITEM3_DESC}    ${ITEMS_PRICE}[2]
    Verify Fourth item in checkout    ${ITEMS}[3]    ${ITEM4_DESC}    ${ITEMS_PRICE}[3]
    Verify Checkout overview    $105.96000000000001    $8.48    $114.44
    Cancel checkout
    # Buy another item
    Buy Sauce Labs Onesie
    # Go to checkout to verify
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Fill in info for Checkout    John    Doe    707
    Go continue
    Verify First item in checkout    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    Verify Second item in checkout    ${ITEMS}[1]    ${ITEM2_DESC}    ${ITEMS_PRICE}[1]
    Verify Third item in checkout    ${ITEMS}[2]    ${ITEM3_DESC}    ${ITEMS_PRICE}[2]
    Verify Fourth item in checkout    ${ITEMS}[3]    ${ITEM4_DESC}    ${ITEMS_PRICE}[3]
    Verify Fifth item in checkout    ${ITEMS}[4]    ${ITEM5_DESC}    ${ITEMS_PRICE}[4]
    Verify Checkout overview    $113.95    $9.12   $123.07
    Cancel checkout
    # Buy another item
    Buy Test.allTheThings() T-Shirt (Red)
    # Go to checkout to verify
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Fill in info for Checkout    John    Doe    707
    Go continue
    Verify First item in checkout    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    Verify Second item in checkout    ${ITEMS}[1]    ${ITEM2_DESC}    ${ITEMS_PRICE}[1]
    Verify Third item in checkout    ${ITEMS}[2]    ${ITEM3_DESC}    ${ITEMS_PRICE}[2]
    Verify Fourth item in checkout    ${ITEMS}[3]    ${ITEM4_DESC}    ${ITEMS_PRICE}[3]
    Verify Fifth item in checkout    ${ITEMS}[4]    ${ITEM5_DESC}    ${ITEMS_PRICE}[4]
    Verify Sixth item in checkout    ${ITEMS}[5]    ${ITEM6_DESC}    ${ITEMS_PRICE}[5]
    Verify Checkout overview    $129.94    $10.40    $140.34
    Go finish
    Go back to home page
    Close Browser