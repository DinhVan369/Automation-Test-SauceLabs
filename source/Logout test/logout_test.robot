*** Settings ***
Resource    ../resources.robot


*** Test Cases ***
Verify Logout With standard user
    Open Browser to Login
    Login with standard user
    Logout the page
    Close Browser

Verify Logout With problem user
    Open Browser to Login
    Login with problem user
    Logout the page
    Close Browser

Verify Logout With performance glitch user
    Open Browser to Login
    Login with performance glitch user
    Logout the page
    Close Browser

Verify Logout With error user
    Open Browser to Login
    Login with error user
    Logout the page
    Close Browser

Verify Login With visual user
    Open Browser to Login
    Login with visual user
    Logout the page
    Close Browser

Logout when at view detail item page with standard user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with standard user
    # Go to a detail item page
    Click Element    id:item_4_title_link
    Logout the page
    # Login again
    Login with standard user
    # Go to a detail item page
    Click Element    id:item_0_title_link
    Logout the page
    # Login again
    Login with standard user
    # Go to a detail item page
    Click Element    id:item_1_title_link
    Logout the page
    # Login again
    Login with standard user
    # Go to a detail item page
    Click Element    id:item_5_title_link
    Logout the page
    # Login again
    Login with standard user
    # Go to a detail item page
    Click Element    id:item_2_title_link
    Logout the page
    # Login again
    Login with standard user
    # Go to a detail item page
    Click Element    id:item_3_title_link
    Logout the page
    Close Browser

Logout when at view detail item page with problem user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with problem user
    # Go to a detail item page
    Click Element    id:item_4_title_link
    Logout the page
    # Login again
    Login with problem user
    # Go to a detail item page
    Click Element    id:item_0_title_link
    Logout the page
    # Login again
    Login with problem user
    # Go to a detail item page
    Click Element    id:item_1_title_link
    Logout the page
    # Login again
    Login with problem user
    # Go to a detail item page
    Click Element    id:item_5_title_link
    Logout the page
    # Login again
    Login with problem user
    # Go to a detail item page
    Click Element    id:item_2_title_link
    Logout the page
    # Login again
    Login with problem user
    # Go to a detail item page
    Click Element    id:item_3_title_link
    Logout the page
    Close Browser

Logout when at view detail item page with error user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with error user
    # Go to a detail item page
    Click Element    id:item_4_title_link
    Logout the page
    # Login again
    Login with error user
    # Go to a detail item page
    Click Element    id:item_0_title_link
    Logout the page
    # Login again
    Login with error user
    # Go to a detail item page
    Click Element    id:item_1_title_link
    Logout the page
    # Login again
    Login with error user
    # Go to a detail item page
    Click Element    id:item_5_title_link
    Logout the page
    # Login again
    Login with error user
    # Go to a detail item page
    Click Element    id:item_2_title_link
    Logout the page
    # Login again
    Login with error user
    # Go to a detail item page
    Click Element    id:item_3_title_link
    Logout the page
    Close Browser

Logout when at view detail item page with performance glitch user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with performance glitch user
    # Go to a detail item page
    Click Element    id:item_4_title_link
    Logout the page
    # Login again
    Login with performance glitch user
    # Go to a detail item page
    Click Element    id:item_0_title_link
    Logout the page
    # Login again
    Login with performance glitch user
    # Go to a detail item page
    Click Element    id:item_1_title_link
    Logout the page
    # Login again
    Login with performance glitch user
    # Go to a detail item page
    Click Element    id:item_5_title_link
    Logout the page
    # Login again
    Login with performance glitch user
    # Go to a detail item page
    Click Element    id:item_2_title_link
    Logout the page
    # Login again
    Login with performance glitch user
    # Go to a detail item page
    Click Element    id:item_3_title_link
    Logout the page
    Close Browser

Logout when at view detail item page with visual user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with visual user
    # Go to a detail item page
    Click Element    id:item_4_title_link
    Logout the page
    # Login again
    Login with visual user
    # Go to a detail item page
    Click Element    id:item_0_title_link
    Logout the page
    # Login again
    Login with visual user
    # Go to a detail item page
    Click Element    id:item_1_title_link
    Logout the page
    # Login again
    Login with visual user
    # Go to a detail item page
    Click Element    id:item_5_title_link
    Logout the page
    # Login again
    Login with visual user
    # Go to a detail item page
    Click Element    id:item_2_title_link
    Logout the page
    # Login again
    Login with visual user
    # Go to a detail item page
    Click Element    id:item_3_title_link
    Logout the page
    Close Browser

Logout when at cart page with standard user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with standard user
    # Go to cart page
    Go to cart
    Logout the page
    Close Browser

Logout when at cart page with problem user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with problem user
    # Go to cart page
    Go to cart
    Logout the page
    Close Browser

Logout when at cart page with error user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with error user
    # Go to cart page
    Go to cart
    Logout the page
    Close Browser

Logout when at cart page with performance glitch user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with performance glitch user
    # Go to cart page
    Go to cart
    Logout the page
    Close Browser

Logout when at cart page with visual user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with visual user
    # Go to cart page
    Go to cart
    Logout the page 
    Close Browser

Logout when at checkout info page with standard user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with standard user
    # Go to cart page
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Logout the page
    # Login again
    Close Browser

Logout when at checkout info page with problem user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with problem user
    # Go to cart page
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Logout the page
    # Login again
    Close Browser

Logout when at checkout info page with error user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with error user
    # Go to cart page
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Logout the page
    # Login again
    Close Browser

Logout when at checkout info page with performance glitch user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with performance glitch user
    # Go to cart page
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Logout the page
    # Login again
    Close Browser

Logout when at checkout info page with visual user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with visual user
    # Go to cart page
    Go to cart
    Go to checkout page
    Verify Checkout Page
    Logout the page
    # Login again
    Close Browser

Logout when at checkout overview page with standard user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with standard user
    # Go to cart page
    Go to cart
    Go to checkout page
    # Input info
    Fill in info for Checkout    John    Doe    707
    Verify Checkout Page
    Logout the page
    # Login again
    Close Browser

Logout when at checkout overview page with visual user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with visual user
    # Go to cart page
    Go to cart
    Go to checkout page
    # Input info
    Fill in info for Checkout    John    Doe    707
    Verify Checkout Page
    Logout the page
    # Login again
    Close Browser

Logout when at checkout overview page with performance glitch user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with performance glitch user
    # Go to cart page
    Go to cart
    Go to checkout page
    # Input info
    Fill in info for Checkout    John    Doe    707
    Verify Checkout Page
    Logout the page
    # Login again
    Close Browser

Logout when at checkout overview page with error user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with error user
    # Go to cart page
    Go to cart
    Go to checkout page
    # Input info
    Fill in info for Checkout (error user)    John    707
    Verify Checkout Page
    Logout the page
    # Login again
    Close Browser

# With problem user cannot go to checkout overview page (already test), so not perform test for problem user

Logout when at checkout complete page with standard user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with standard user
    # Go to cart page
    Go to cart
    Go to checkout page
    # Input info
    Fill in info for Checkout    John    Doe    707
    Verify Checkout Page
    Go continue
    Go finish
    Logout the page
    # Login again
    Close Browser

Logout when at checkout complete page with visual user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with visual user
    # Go to cart page
    Go to cart
    Go to checkout page
    # Input info
    Fill in info for Checkout    John    Doe    707
    Verify Checkout Page
    Go continue
    Go finish
    Logout the page
    # Login again
    Close Browser

Logout when at checkout complete page with performance glitch user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with performance glitch user
    # Go to cart page
    Go to cart
    Go to checkout page
    # Input info
    Fill in info for Checkout    John    Doe    707
    Verify Checkout Page
    Go continue
    Go finish
    Logout the page
    # Login again
    Close Browser