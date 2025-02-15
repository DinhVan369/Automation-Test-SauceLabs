*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            https://www.saucedemo.com/
${HOMEPAGE_URL}    https://www.saucedemo.com/inventory.html
${CARTPAGE_URL}    https://www.saucedemo.com/cart.html
${CHECKOUT_1_URL}    https://www.saucedemo.com/checkout-step-one.html
${CHECKOUT_2_URL}    https://www.saucedemo.com/checkout-step-two.html
${CHECKOUT_COMPLETE}    https://www.saucedemo.com/checkout-complete.html
${STANDARD_USER}    standard_user
${LOCKED_OUT_USER}    locked_out_user
${PROBLEM_USER}    problem_user
${PERFORMANCE_GLITCH_USER}    performance_glitch_user
${ERROR_USER}    error_user
${VISUAL_USER}    visual_user
${PASSWORD}    secret_sauce
@{ITEMS}    Sauce Labs Backpack     Sauce Labs Bike Light       Sauce Labs Bolt T-Shirt       Sauce Labs Fleece Jacket      Sauce Labs Onesie       Test.allTheThings() T-Shirt (Red)
${ITEM1_IMG}    https://www.saucedemo.com/static/media/sauce-backpack-1200x1500.0a0b85a3.jpg
${ITEM2_IMG}    https://www.saucedemo.com/static/media/bike-light-1200x1500.37c843b0.jpg
${ITEM3_IMG}    https://www.saucedemo.com/static/media/bolt-shirt-1200x1500.c2599ac5.jpg
${ITEM4_IMG}    https://www.saucedemo.com/static/media/sauce-pullover-1200x1500.51d7ffaf.jpg
${ITEM5_IMG}    https://www.saucedemo.com/static/media/red-onesie-1200x1500.2ec615b2.jpg
${ITEM6_IMG}    https://www.saucedemo.com/static/media/red-tatt-1200x1500.30dadef4.jpg
${ITEM1_DESC}    carry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection.
${ITEM2_DESC}    A red light isn't the desired state in testing but it sure helps when riding your bike at night. Water-resistant with 3 lighting modes, 1 AAA battery included.
${ITEM3_DESC}    Get your testing superhero on with the Sauce Labs bolt T-shirt. From American Apparel, 100% ringspun combed cotton, heather gray with red bolt.
${ITEM4_DESC}    It's not every day that you come across a midweight quarter-zip fleece jacket capable of handling everything from a relaxing day outdoors to a busy day at the office.
${ITEM5_DESC}    Rib snap infant onesie for the junior automation engineer in development. Reinforced 3-snap bottom closure, two-needle hemmed sleeved and bottom won't unravel.
${ITEM6_DESC}    This classic Sauce Labs t-shirt is perfect to wear when cozying up to your keyboard to automate a few tests. Super-soft and comfy ringspun combed cotton.
@{ITEMS_PRICE}    $29.99    $9.99    $15.99    $49.99    $7.99    $15.99
${BROKEN_ITEM_IMG}    https://www.saucedemo.com/static/media/sl-404.168b1cce.jpg
${BROKEN_ITEM_DESC}   We're sorry, but your call could not be completed as dialled. Please check your number, and try your call again. If you are in need of assistance, 
...    please dial 0 to be connected with an operator. This is a recording. 4 T 1. 
${BROKEN_ITEM_PRICE}    $√-1
${ERROR_ITEM_DESC}    A description should be here, but it failed to render! This error has been reported to Backtrace.
${cart_icon}    1971
${checkout_position}    1444

*** Keywords ***
Fill in info for Checkout
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Input Text    id=first-name    ${first_name}
    Input Text    id=last-name    ${last_name}
    Input Text    id=postal-code    ${postal_code}

Fill in info for Checkout (error user)
    [Arguments]    ${first_name}    ${postal_code}
    Input Text    id=first-name    ${first_name}
    Input Text    id=postal-code    ${postal_code}

Verify Login Page
    # Verify Login Page
    Page Should Contain Element    id=user-name
    Element Attribute Value Should Be    id:user-name    placeholder    Username
    Page Should Contain Element    id=password
    Element Attribute Value Should Be    id:password    placeholder    Password
    Page Should Contain Element    id=login-button
    Element Attribute Value Should Be    id=login-button    value    Login
    Page Should Contain    Accepted usernames are:
    Page Should Contain    ${STANDARD_USER}
    Page Should Contain    ${LOCKED_OUT_USER}
    Page Should Contain    ${PROBLEM_USER}
    Page Should Contain    ${PERFORMANCE_GLITCH_USER}
    Page Should Contain    ${ERROR_USER}
    Page Should Contain    ${VISUAL_USER}
    Page Should Contain    Password for all users:
    Page Should Contain    ${PASSWORD}
Go to checkout page
    Click Button    id=checkout

Verify Checkout Page
    Element Text Should Be    class=title    Checkout: Your Information
    Page Should Contain Element    id:first-name
    Page Should Contain Element    id:last-name
    Page Should Contain Element    id:postal-code
    Element Attribute Value Should Be    id:first-name    placeholder    First Name
    Element Attribute Value Should Be    id:last-name    placeholder    Last Name
    Element Attribute Value Should Be    id:postal-code    placeholder    Zip/Postal Code
    Page Should Contain Element    id:continue
    Page Should Contain Element    id:cancel

Go continue
    Click Button    id=continue

Go finish (error user)
    Click Button    id=finish

Go finish
    Click Button    id=finish
    # Verify Checkout Complete
    Page Should Contain    Checkout: Complete!
    Element Text Should Be    class=complete-header    Thank you for your order!
    Element Text Should Be    class=complete-text    Your order has been dispatched, and will arrive just as fast as the pony can get there!
    Page Should Contain Element    xpath://*[@id="checkout_complete_container"]/img
    Element Text Should Be    id:back-to-products    Back Home
Go back to home page
    Click Element    id:back-to-products

Verify Checkout overview
    [Arguments]    ${item_total}    ${tax}    ${total}
    # Verify Checkout Overview
    Element Text Should Be    class=title    Checkout: Overview
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[2]/div[1]    Payment Information:
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[2]/div[2]    SauceCard #31337
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[2]/div[3]    Shipping Information:
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[2]/div[4]    Free Pony Express Delivery!
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[2]/div[5]    Price Total
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[2]/div[6]    Item total: ${item_total}
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[2]/div[7]    Tax: ${tax}
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[2]/div[8]    Total: ${total}
    Page Should Contain Element    id:cancel
    Page Should Contain Element    id:finish
Cancel checkout
    Click Element    id:cancel

Get Cart Icon Position
    ${cart_icon}=    Get Horizontal Position    xpath://*[@id="shopping_cart_container"]
    RETURN    ${cart_icon}
Get Checkout Button Position
    ${checkout_btn}=    Get Horizontal Position    xpath://*[@id="checkout"]
    RETURN    ${checkout_btn}
Open Browser to Login
    Open Browser    ${URL}    ${BROWSER}
    # Verify Login Page
    Page Should Contain Element    id=login-button

Open Browser to Home Page
    Open Browser    ${HOMEPAGE_URL}    ${BROWSER}

Open Browser to Cart Page
    Open Browser    ${CARTPAGE_URL}    ${BROWSER}

Open Browser to Checkout Page step 1
    Open Browser    ${CHECKOUT_1_URL}    ${BROWSER}

Open Browser to Checkout Page step 2
    Open Browser    ${CHECKOUT_2_URL}    ${BROWSER}

Open Browser to Checkout Complete Page
    Open Browser    ${CHECKOUT_COMPLETE}    ${BROWSER}

Login with standard user
    # Login with username and password
    Input Text    id=user-name    ${STANDARD_USER}
    Input Text    id=password    ${PASSWORD}
    Click Button    css=.btn_action
    Sleep    2
    # Verify Home Page   
    Element Text Should Be    class:title    Products

Login with locked out user
    # Login with username and password
    Input Text    id=user-name    ${LOCKED_OUT_USER}
    Input Text    id=password    ${PASSWORD}
    Click Button    css=.btn_action
    Sleep    2
    # Verify Error Message
    Page Should Contain    Epic sadface: Sorry, this user has been locked out.

Login with problem user
    # Login with username and password
    Input Text    id=user-name    ${PROBLEM_USER}
    Input Text    id=password    ${PASSWORD}
    Click Button    css=.btn_action
    Sleep    2
    # Verify Home Page
    Element Text Should Be    class:title    Products

Login with performance glitch user
    # Login with username and password
    Input Text    id=user-name    ${PERFORMANCE_GLITCH_USER}
    Input Text    id=password    ${PASSWORD}
    Click Button    css=.btn_action
    Sleep    5
    # Verify Home Page
    Element Text Should Be    class:title    Products

Login with error user
    # Login with username and password
    Input Text    id=user-name    ${ERROR_USER} 
    Input Text    id=password    ${PASSWORD}
    Click Button    css=.btn_action
    Sleep    2
    # Verify Home Page
    Element Text Should Be    class:title    Products

Login with visual user
    # Login with username and password
    Input Text    id=user-name    ${VISUAL_USER} 
    Input Text    id=password    ${PASSWORD}
    Click Button    css=.btn_action
    Sleep    2
    # Verify Home Page
    Element Text Should Be    class:title    Products

Logout the page
    # Logout
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    id=logout_sidebar_link
    Click Element    id=logout_sidebar_link   
    # Verify return to Login Page
    Wait Until Page Contains Element    id=login-button

Reset App State
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    id=reset_sidebar_link
    Click Element    id=reset_sidebar_link

Click Back to Products
    Click Button    id=back-to-products
    Element Text Should Be    class:title    Products

View item
    [Arguments]    ${item}    ${item_name}    ${item_desc}    ${item_price}    ${item_img}
    Click Element    ${item}
    Sleep    2
    # Verify Product's name
    Element Text Should Be    xpath://*[@id="inventory_item_container"]/div/div/div[2]/div[1]    ${item_name}
    # Verify Product's description
    Element Text Should Be    xpath://*[@id="inventory_item_container"]/div/div/div[2]/div[2]    ${item_desc}
    # Verify Product's price
    Element Text Should Be    xpath://*[@id="inventory_item_container"]/div/div/div[2]/div[3]    ${item_price}
    # Verify Add Button
    Page Should Contain Element    name:add-to-cart
    # Verify Product's Image
    ${image_src}=    Get Element Attribute    xpath://*[@id="inventory_item_container"]/div/div/div[1]/img    src
    Should Be Equal    ${item_img}    ${image_src}

View item (problem user)
    [Arguments]    ${item}    ${item_name}    ${item_desc}    ${item_price}    ${item_img}
    Click Element    ${item}
    Sleep    2
    # Verify Product's name
    Element Text Should Not Be    xpath://*[@id="inventory_item_container"]/div/div/div[2]/div[1]    ${item_name}
    # Verify Product's description
    Element Text Should Not Be    xpath://*[@id="inventory_item_container"]/div/div/div[2]/div[2]    ${item_desc}
    # Verify Product's price
    Element Text Should Not Be    xpath://*[@id="inventory_item_container"]/div/div/div[2]/div[3]    ${item_price}
    # Verify Add Button
    Page Should Contain Element    name:add-to-cart
    # Verify Product's Image
    ${image_src}=    Get Element Attribute    xpath://*[@id="inventory_item_container"]/div/div/div[1]/img    src
    Should Not Be Equal    ${item_img}    ${image_src}

View item (performance glitch user)
    [Arguments]    ${item}    ${item_name}    ${item_desc}    ${item_price}    ${item_img}
    Click Element    ${item}
    Sleep    5
    # Verify Product's name
    Element Text Should Be    xpath://*[@id="inventory_item_container"]/div/div/div[2]/div[1]    ${item_name}
    # Verify Product's description
    Element Text Should Be    xpath://*[@id="inventory_item_container"]/div/div/div[2]/div[2]    ${item_desc}
    # Verify Product's price
    Element Text Should Be    xpath://*[@id="inventory_item_container"]/div/div/div[2]/div[3]    ${item_price}
    # Verify Add Button
    Page Should Contain Element    name:add-to-cart
    # Verify Product's Image
    ${image_src}=    Get Element Attribute    xpath://*[@id="inventory_item_container"]/div/div/div[1]/img    src
    Should Be Equal    ${item_img}    ${image_src}

View item (visual user)
    [Arguments]    ${item}    ${item_name}    ${item_desc}    ${item_price}    ${item_img}
    Click Element    ${item}
    Sleep    2
    # Verify cart icon at the detail page change
    Verify Cart Icon position changed
    # Verify Product's name
    Element Text Should Be    xpath://*[@id="inventory_item_container"]/div/div/div[2]/div[1]    ${item_name}
    # Verify Product's description
    Element Text Should Be    xpath://*[@id="inventory_item_container"]/div/div/div[2]/div[2]    ${item_desc}
    # Verify Product's price
    Element Text Should Be    xpath://*[@id="inventory_item_container"]/div/div/div[2]/div[3]    ${item_price}
    # Verify Add Button
    Page Should Contain Element    name:add-to-cart
    # Verify Product's Image
    ${image_src}=    Get Element Attribute    xpath://*[@id="inventory_item_container"]/div/div/div[1]/img    src
    Should Not Be Equal    ${item_img}    ${image_src}
View all Items
    # View item Sauce Labs Backpack
    View item    xpath://*[@id="item_4_title_link"]/div    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]    ${ITEM1_IMG}
    # Back to home page
    Click Back to Products
    # View item Sauce Labs Bike Light
    View item    xpath://*[@id="item_0_title_link"]/div    ${ITEMS}[1]    ${ITEM2_DESC}    ${ITEMS_PRICE}[1]    ${ITEM2_IMG}
    # Back to home page
    Click Back to Products
    # View item Sauce Labs Bolt T-Shirt
    View item    xpath://*[@id="item_1_title_link"]/div    ${ITEMS}[2]    ${ITEM3_DESC}    ${ITEMS_PRICE}[2]    ${ITEM3_IMG}
    # Back to home page
    Click Back to Products
    # View item Sauce Labs Fleece Jacket
    View item    xpath://*[@id="item_5_title_link"]/div    ${ITEMS}[3]    ${ITEM4_DESC}    ${ITEMS_PRICE}[3]    ${ITEM4_IMG}
    # Back to home page
    Click Back to Products
    # View item Sauce Labs Onesie
    View item    xpath://*[@id="item_2_title_link"]/div    ${ITEMS}[4]    ${ITEM5_DESC}    ${ITEMS_PRICE}[4]    ${ITEM5_IMG}
    # Back to home page
    Click Back to Products
    # View item Test.allTheThings() T-Shirt (Red)
    View item    xpath://*[@id="item_3_title_link"]/div    ${ITEMS}[5]    ${ITEM6_DESC}    ${ITEMS_PRICE}[5]    ${ITEM6_IMG}
    # Back to home page
    Click Back to Products

View all Items (problem user)
    # View item Sauce Labs Backpack
    View item (problem user)    xpath://*[@id="item_4_title_link"]/div    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]    ${BROKEN_ITEM_IMG}
    # Back to home page
    Click Back to Products
    # View item Sauce Labs Bike Light
    View item (problem user)    xpath://*[@id="item_0_title_link"]/div    ${ITEMS}[1]    ${ITEM2_DESC}    ${ITEMS_PRICE}[1]    ${BROKEN_ITEM_IMG}
    # Back to home page
    Click Back to Products
    # View item Sauce Labs Bolt T-Shirt
    View item (problem user)   xpath://*[@id="item_1_title_link"]/div     ${ITEMS}[2]    ${ITEM3_DESC}    ${ITEMS_PRICE}[2]    ${BROKEN_ITEM_IMG}
    # Back to home page
    Click Back to Products
    # View item Sauce Labs Fleece Jacket
    View item   xpath://*[@id="item_5_title_link"]/div    ITEM NOT FOUND    ${BROKEN_ITEM_DESC}    ${BROKEN_ITEM_PRICE}    ${BROKEN_ITEM_IMG}
    # Back to home page
    Click Back to Products
    # View item Sauce Labs Onesie
    View item (problem user)    xpath://*[@id="item_2_title_link"]/div    ${ITEMS}[4]    ${ITEM5_DESC}    ${ITEMS_PRICE}[4]    ${BROKEN_ITEM_IMG}
    # Back to home page
    Click Back to Products
    # View item Test.allTheThings() T-Shirt (Red)
    View item (problem user)    xpath://*[@id="item_3_title_link"]/div    ${ITEMS}[5]    ${ITEM6_DESC}    ${ITEMS_PRICE}[5]    ${BROKEN_ITEM_IMG}
    # Back to home page
    Click Back to Products

View all Items (performance glitch user)
    # View item Sauce Labs Backpack
    View item (performance glitch user)   xpath://*[@id="item_4_title_link"]/div    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]    ${ITEM1_IMG}
    # Back to home page
    Click Back to Products
    Sleep    5
    # View item Sauce Labs Bike Light
    View item (performance glitch user)    xpath://*[@id="item_0_title_link"]/div    ${ITEMS}[1]    ${ITEM2_DESC}    ${ITEMS_PRICE}[1]    ${ITEM2_IMG}
    # Back to home page
    Click Back to Products
    Sleep    5
    # View item Sauce Labs Bolt T-Shirt
    View item (performance glitch user)    xpath://*[@id="item_1_title_link"]/div    ${ITEMS}[2]    ${ITEM3_DESC}    ${ITEMS_PRICE}[2]    ${ITEM3_IMG}
    # Back to home page
    Click Back to Products
    Sleep    5
    # View item Sauce Labs Fleece Jacket
    View item (performance glitch user)    xpath://*[@id="item_5_title_link"]/div    ${ITEMS}[3]    ${ITEM4_DESC}    ${ITEMS_PRICE}[3]    ${ITEM4_IMG}
    # Back to home page
    Click Back to Products
    Sleep    5
    # View item Sauce Labs Onesie
    View item (performance glitch user)    xpath://*[@id="item_2_title_link"]/div    ${ITEMS}[4]    ${ITEM5_DESC}    ${ITEMS_PRICE}[4]    ${ITEM5_IMG}
    # Back to home page
    Click Back to Products
    Sleep    5
    # View item Test.allTheThings() T-Shirt (Red)
    View item (performance glitch user)    xpath://*[@id="item_3_title_link"]/div    ${ITEMS}[5]    ${ITEM6_DESC}    ${ITEMS_PRICE}[5]    ${ITEM6_IMG}
    # Back to home page
    Click Back to Products
    Sleep    5

View all Items (error user)
    # View item Sauce Labs Backpack
    View item    xpath://*[@id="item_4_title_link"]/div    ${ITEMS}[0]    ${ERROR_ITEM_DESC}    ${ITEMS_PRICE}[0]    ${ITEM1_IMG}
    # Back to home page
    Click Back to Products
    # View item Sauce Labs Bike Light
    View item    xpath://*[@id="item_0_title_link"]/div    ${ITEMS}[1]    ${ERROR_ITEM_DESC}    ${ITEMS_PRICE}[1]    ${ITEM2_IMG}
    # Back to home page
    Click Back to Products
    # View item Sauce Labs Bolt T-Shirt
    View item    xpath://*[@id="item_1_title_link"]/div    ${ITEMS}[2]   ${ERROR_ITEM_DESC}    ${ITEMS_PRICE}[2]    ${ITEM3_IMG}
    # Back to home page
    Click Back to Products
    # View item Sauce Labs Fleece Jacket
    View item    xpath://*[@id="item_5_title_link"]/div    ${ITEMS}[3]    ${ERROR_ITEM_DESC}    ${ITEMS_PRICE}[3]    ${ITEM4_IMG}
    # Back to home page
    Click Back to Products
    # View item Sauce Labs Onesie
    View item    xpath://*[@id="item_2_title_link"]/div    ${ITEMS}[4]    ${ERROR_ITEM_DESC}    ${ITEMS_PRICE}[4]    ${ITEM5_IMG} 
    # Back to home page
    Click Back to Products
    # View item Test.allTheThings() T-Shirt (Red)
    View item    xpath://*[@id="item_3_title_link"]/div    ${ITEMS}[5]    ${ERROR_ITEM_DESC}    ${ITEMS_PRICE}[5]    ${ITEM6_IMG}   
    # Back to home page
    Click Back to Products

View all Items (visual_user)
    # View item Sauce Labs Backpack
    View item (visual user)    xpath://*[@id="item_4_title_link"]/div    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]    ${BROKEN_ITEM_IMG}
    # Back to home page
    Click Back to Products
    # View item Sauce Labs Bike Light
    View item    xpath://*[@id="item_0_title_link"]/div    ${ITEMS}[1]    ${ITEM2_DESC}    ${ITEMS_PRICE}[1]    ${ITEM2_IMG}
    # Verify cart icon at the detail page change
    Verify Cart Icon position changed
    # Back to home page
    Click Back to Products
    # View item Sauce Labs Bolt T-Shirt
    View item    xpath://*[@id="item_1_title_link"]/div    ${ITEMS}[2]    ${ITEM3_DESC}    ${ITEMS_PRICE}[2]    ${ITEM3_IMG}
    # Verify cart icon at the detail page change
    Verify Cart Icon position changed
    # Back to home page
    Click Back to Products
    # View item Sauce Labs Fleece Jacket
    View item    xpath://*[@id="item_5_title_link"]/div    ${ITEMS}[3]    ${ITEM4_DESC}    ${ITEMS_PRICE}[3]    ${ITEM4_IMG}
    # Verify cart icon at the detail page change
    Verify Cart Icon position changed
    # Back to home page
    Click Back to Products
    # View item Sauce Labs Onesie
    View item    xpath://*[@id="item_2_title_link"]/div    ${ITEMS}[4]    ${ITEM5_DESC}    ${ITEMS_PRICE}[4]    ${ITEM5_IMG}
    # Verify cart icon at the detail page change
    Verify Cart Icon position changed
    # Back to home page
    Click Back to Products
    # View item Test.allTheThings() T-Shirt (Red)
    View item    xpath://*[@id="item_3_title_link"]/div    ${ITEMS}[5]    ${ITEM6_DESC}    ${ITEMS_PRICE}[5]    ${ITEM6_IMG}
    # Verify cart icon at the detail page change
    Verify Cart Icon position changed
    # Back to home page
    Click Back to Products

Sort item A-Z
    Select From List By Value   xpath://*[@id="header_container"]/div[2]/div/span/select    az

Sort item Z-A
    Select From List By Value   xpath://*[@id="header_container"]/div[2]/div/span/select    za

Sort item low-high
    Select From List By Value   xpath://*[@id="header_container"]/div[2]/div/span/select    lohi

Sort item high-low
    Select From List By Value   xpath://*[@id="header_container"]/div[2]/div/span/select    hilo

Verify Broken Sort Alert
    Alert Should Be Present    Sorting is broken! This error has been reported to Backtrace.

Verify First Item at Product page
    [Arguments]    ${item_name}    ${item_desc}    ${item_img}    ${item_price}    ${item_btn}
    Element Text Should Be  xpath://*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/a/div  ${item_name} 
    Element Text Should Be    xpath://*[@id="inventory_container"]/div/div[1]/div[2]/div[1]/div   ${item_desc}
    Element Attribute Value Should Be    xpath://*[@id="inventory_container"]/div/div[1]/div[1]/a/img    src    ${item_img}
    Element Text Should Be    xpath://*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/div    ${item_price}
    Element Attribute Value Should Be    xpath://*[@id="inventory_container"]/div/div[1]/div[2]/div[2]/button    id    ${item_btn}

Verify Second Item at Product page
    [Arguments]    ${item_name}    ${item_desc}    ${item_img}    ${item_price}    ${item_btn}
    Element Text Should Be  xpath://*[@id="inventory_container"]/div/div[2]/div[2]/div[1]/a/div  ${item_name}
    Element Text Should Be    xpath://*[@id="inventory_container"]/div/div[2]/div[2]/div[1]/div    ${item_desc}
    Element Attribute Value Should Be    xpath://*[@id="inventory_container"]/div/div[2]/div[1]/a/img    src    ${item_img}
    Element Text Should Be    xpath://*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/div    ${item_price}
    Element Attribute Value Should Be    xpath://*[@id="inventory_container"]/div/div[2]/div[2]/div[2]/button    id    ${item_btn}

Verify Third Item at Product page
    [Arguments]    ${item_name}    ${item_desc}    ${item_img}    ${item_price}    ${item_btn}
    Element Text Should Be  xpath://*[@id="inventory_container"]/div/div[3]/div[2]/div[1]/a/div  ${item_name}
    Element Text Should Be    xpath://*[@id="inventory_container"]/div/div[3]/div[2]/div[1]/div    ${item_desc}
    Element Attribute Value Should Be    xpath://*[@id="inventory_container"]/div/div[3]/div[1]/a/img    src    ${item_img}
    Element Text Should Be    xpath://*[@id="inventory_container"]/div/div[3]/div[2]/div[2]/div    ${item_price}
    Element Attribute Value Should Be    xpath://*[@id="inventory_container"]/div/div[3]/div[2]/div[2]/button    id    ${item_btn}

Verify Fourth Item at Product page
    [Arguments]    ${item_name}    ${item_desc}    ${item_img}    ${item_price}    ${item_btn}
    Element Text Should Be  xpath://*[@id="inventory_container"]/div/div[4]/div[2]/div[1]/a/div  ${item_name}
    Element Text Should Be    xpath://*[@id="inventory_container"]/div/div[4]/div[2]/div[1]/div    ${item_desc}
    Element Attribute Value Should Be    xpath://*[@id="inventory_container"]/div/div[4]/div[1]/a/img    src    ${item_img}
    Element Text Should Be    xpath://*[@id="inventory_container"]/div/div[4]/div[2]/div[2]/div    ${item_price}
    Element Attribute Value Should Be    xpath://*[@id="inventory_container"]/div/div[4]/div[2]/div[2]/button    id    ${item_btn}

Verify Fifth Item at Product page
    [Arguments]    ${item_name}    ${item_desc}    ${item_img}    ${item_price}    ${item_btn}
    Element Text Should Be  xpath://*[@id="inventory_container"]/div/div[5]/div[2]/div[1]/a/div  ${item_name}
    Element Text Should Be    xpath://*[@id="inventory_container"]/div/div[5]/div[2]/div[1]/div    ${item_desc}
    Element Attribute Value Should Be    xpath://*[@id="inventory_container"]/div/div[5]/div[1]/a/img    src    ${item_img}
    Element Text Should Be    xpath://*[@id="inventory_container"]/div/div[5]/div[2]/div[2]/div    ${item_price}
    Element Attribute Value Should Be    xpath://*[@id="inventory_container"]/div/div[5]/div[2]/div[2]/button    id    ${item_btn}

Verify Sixth Item at Product page
    [Arguments]    ${item_name}    ${item_desc}    ${item_img}    ${item_price}    ${item_btn}
    Element Text Should Be  xpath://*[@id="inventory_container"]/div/div[6]/div[2]/div[1]/a/div  ${item_name}
    Element Text Should Be    xpath://*[@id="inventory_container"]/div/div[6]/div[2]/div[1]/div    ${item_desc}
    Element Attribute Value Should Be    xpath://*[@id="inventory_container"]/div/div[6]/div[1]/a/img    src    ${item_img}
    Element Text Should Be    xpath://*[@id="inventory_container"]/div/div[6]/div[2]/div[2]/div    ${item_price}
    Element Attribute Value Should Be    xpath://*[@id="inventory_container"]/div/div[6]/div[2]/div[2]/button    id    ${item_btn}

Verify Sorted Items A-Z
    [Arguments]    ${item1}    ${item2}    ${item3}    ${item4}    ${item5}    ${item6}
    # Verify sorted items order
    # Verify first item
    Verify First Item at Product page    ${item1}    ${ITEM1_DESC}    ${ITEM1_IMG}    ${ITEMS_PRICE}[0]    add-to-cart-sauce-labs-backpack
    # Verify second item
    Verify Second Item at Product page    ${item2}    ${ITEM2_DESC}    ${ITEM2_IMG}    ${ITEMS_PRICE}[1]    add-to-cart-sauce-labs-bike-light
    # Verify third item
    Verify Third Item at Product page    ${item3}    ${ITEM3_DESC}    ${ITEM3_IMG}    ${ITEMS_PRICE}[2]    add-to-cart-sauce-labs-bolt-t-shirt
    # Verify fourth item 
    Verify Fourth Item at Product page    ${item4}    ${ITEM4_DESC}    ${ITEM4_IMG}    ${ITEMS_PRICE}[3]    add-to-cart-sauce-labs-fleece-jacket
    # Verify fifth item
    Verify Fifth Item at Product page    ${item5}    ${ITEM5_DESC}    ${ITEM5_IMG}    ${ITEMS_PRICE}[4]    add-to-cart-sauce-labs-onesie
    # Verify sixth item
    Verify Sixth Item at Product page    ${item6}    ${ITEM6_DESC}    ${ITEM6_IMG}    ${ITEMS_PRICE}[5]    add-to-cart-test.allthethings()-t-shirt-(red)

Verify Sorted Items Z-A
    [Arguments]    ${item1}    ${item2}    ${item3}    ${item4}    ${item5}    ${item6}
    # Verify sorted items order
    # Verify first item
    Verify First Item at Product page    ${item6}    ${ITEM6_DESC}    ${ITEM6_IMG}    ${ITEMS_PRICE}[5]    add-to-cart-test.allthethings()-t-shirt-(red)
    # Verify second item
    Verify Second Item at Product page    ${item5}    ${ITEM5_DESC}    ${ITEM5_IMG}    ${ITEMS_PRICE}[4]    add-to-cart-sauce-labs-onesie
    # Verify third item
    Verify Third Item at Product page    ${item4}    ${ITEM4_DESC}    ${ITEM4_IMG}    ${ITEMS_PRICE}[3]    add-to-cart-sauce-labs-fleece-jacket
    # Verify fourth item
    Verify Fourth Item at Product page    ${item3}    ${ITEM3_DESC}    ${ITEM3_IMG}    ${ITEMS_PRICE}[2]    add-to-cart-sauce-labs-bolt-t-shirt
    # Verify fifth item
    Verify Fifth Item at Product page    ${item2}    ${ITEM2_DESC}    ${ITEM2_IMG}    ${ITEMS_PRICE}[1]    add-to-cart-sauce-labs-bike-light
    # Verify sixth item
    Verify Sixth Item at Product page    ${item1}    ${ITEM1_DESC}    ${ITEM1_IMG}    ${ITEMS_PRICE}[0]    add-to-cart-sauce-labs-backpack

Verify Sorted Items low-high
    [Arguments]    ${item1}    ${item2}    ${item3}    ${item4}    ${item5}    ${item6}
    # Verify sorted items order
    # Verify first item
    Verify First Item at Product page    ${item5}    ${ITEM5_DESC}    ${ITEM5_IMG}    ${ITEMS_PRICE}[4]    add-to-cart-sauce-labs-onesie
    # Verify second item
    Verify Second Item at Product page    ${item2}    ${ITEM2_DESC}    ${ITEM2_IMG}    ${ITEMS_PRICE}[1]    add-to-cart-sauce-labs-bike-light
    # Verify third item
    Verify Third Item at Product page    ${item3}    ${ITEM3_DESC}    ${ITEM3_IMG}    ${ITEMS_PRICE}[2]    add-to-cart-sauce-labs-bolt-t-shirt
    # Verify fourth item
    Verify Fourth Item at Product page    ${item6}    ${ITEM6_DESC}    ${ITEM6_IMG}    ${ITEMS_PRICE}[5]    add-to-cart-test.allthethings()-t-shirt-(red)
    # Verify fifth item
    Verify Fifth Item at Product page    ${item1}    ${ITEM1_DESC}    ${ITEM1_IMG}    ${ITEMS_PRICE}[0]    add-to-cart-sauce-labs-backpack
    # Verify sixth item
    Verify Sixth Item at Product page    ${item4}    ${ITEM4_DESC}    ${ITEM4_IMG}    ${ITEMS_PRICE}[3]    add-to-cart-sauce-labs-fleece-jacket

Verify Sorted Items high-low
    [Arguments]    ${item1}    ${item2}    ${item3}    ${item4}    ${item5}    ${item6}
    # Verify sorted items order
    # Verify first item
    Verify First Item at Product page    ${item4}    ${ITEM4_DESC}    ${ITEM4_IMG}    ${ITEMS_PRICE}[3]    add-to-cart-sauce-labs-fleece-jacket
    # Verify second item
    Verify Second Item at Product page    ${item1}    ${ITEM1_DESC}    ${ITEM1_IMG}    ${ITEMS_PRICE}[0]    add-to-cart-sauce-labs-backpack
    # Verify third item
    Verify Third Item at Product page    ${item3}    ${ITEM3_DESC}    ${ITEM3_IMG}    ${ITEMS_PRICE}[2]    add-to-cart-sauce-labs-bolt-t-shirt
    # Verify fourth item
    Verify Fourth Item at Product page    ${item6}    ${ITEM6_DESC}    ${ITEM6_IMG}    ${ITEMS_PRICE}[5]    add-to-cart-test.allthethings()-t-shirt-(red)
    # Verify fifth item
    Verify Fifth Item at Product page    ${item2}    ${ITEM2_DESC}    ${ITEM2_IMG}    ${ITEMS_PRICE}[1]    add-to-cart-sauce-labs-bike-light
    # Verify sixth item
    Verify Sixth Item at Product page    ${item5}    ${ITEM5_DESC}    ${ITEM5_IMG}    ${ITEMS_PRICE}[4]    add-to-cart-sauce-labs-onesie

Verify Sorted Items A-Z (problem user)
    [Arguments]    ${item1}    ${item2}    ${item3}    ${item4}    ${item5}    ${item6}
    # Verify sorted items order
    # Verify first item
    Verify First Item at Product page    ${item1}    ${ITEM1_DESC}    ${BROKEN_ITEM_IMG}    ${ITEMS_PRICE}[0]    add-to-cart-sauce-labs-backpack
    # Verify second item
    Verify Second Item at Product page    ${item2}    ${ITEM2_DESC}    ${BROKEN_ITEM_IMG}    ${ITEMS_PRICE}[1]    add-to-cart-sauce-labs-bike-light
    # Verify third item
    Verify Third Item at Product page    ${item3}    ${ITEM3_DESC}    ${BROKEN_ITEM_IMG}    ${ITEMS_PRICE}[2]    add-to-cart-sauce-labs-bolt-t-shirt
    # Verify fourth item 
    Verify Fourth Item at Product page    ${item4}    ${ITEM4_DESC}    ${BROKEN_ITEM_IMG}    ${ITEMS_PRICE}[3]    add-to-cart-sauce-labs-fleece-jacket
    # Verify fifth item
    Verify Fifth Item at Product page    ${item5}    ${ITEM5_DESC}    ${BROKEN_ITEM_IMG}    ${ITEMS_PRICE}[4]    add-to-cart-sauce-labs-onesie
    # Verify sixth item
    Verify Sixth Item at Product page    ${item6}    ${ITEM6_DESC}    ${BROKEN_ITEM_IMG}    ${ITEMS_PRICE}[5]    add-to-cart-test.allthethings()-t-shirt-(red)

Verify Sorted Items A-Z (visual user)
    [Arguments]    ${item1}    ${item2}    ${item3}    ${item4}    ${item5}    ${item6}
    # Verify sorted items order
    # Verify first item
    Verify First Item at Product page    ${item1}    ${ITEM1_DESC}    ${BROKEN_ITEM_IMG}    ${ITEMS_PRICE}[0]    add-to-cart-sauce-labs-backpack
    # Verify second item
    Verify Second Item at Product page    ${item2}    ${ITEM2_DESC}    ${ITEM2_IMG}    ${ITEMS_PRICE}[1]    add-to-cart-sauce-labs-bike-light
    # Verify third item
    Verify Third Item at Product page    ${item3}    ${ITEM3_DESC}    ${ITEM3_IMG}    ${ITEMS_PRICE}[2]    add-to-cart-sauce-labs-bolt-t-shirt
    # Verify fourth item 
    Verify Fourth Item at Product page    ${item4}    ${ITEM4_DESC}    ${ITEM4_IMG}    ${ITEMS_PRICE}[3]    add-to-cart-sauce-labs-fleece-jacket
    # Verify fifth item
    Verify Fifth Item at Product page    ${item5}    ${ITEM5_DESC}    ${ITEM5_IMG}    ${ITEMS_PRICE}[4]    add-to-cart-sauce-labs-onesie
    # Verify sixth item
    Verify Sixth Item at Product page    ${item6}    ${ITEM6_DESC}    ${ITEM6_IMG}    ${ITEMS_PRICE}[5]    add-to-cart-test.allthethings()-t-shirt-(red)

Verify Sorted Items Z-A (visual user)
    [Arguments]    ${item1}    ${item2}    ${item3}    ${item4}    ${item5}    ${item6}
    # Verify sorted items order
    # Verify first item
    Verify First Item at Product page    ${item6}    ${ITEM6_DESC}    ${BROKEN_ITEM_IMG}    ${ITEMS_PRICE}[5]    add-to-cart-test.allthethings()-t-shirt-(red)
    # Verify second item
    Verify Second Item at Product page    ${item5}    ${ITEM5_DESC}    ${ITEM5_IMG}    ${ITEMS_PRICE}[4]    add-to-cart-sauce-labs-onesie
    # Verify third item
    Verify Third Item at Product page    ${item4}    ${ITEM4_DESC}    ${ITEM4_IMG}    ${ITEMS_PRICE}[3]    add-to-cart-sauce-labs-fleece-jacket
    # Verify fourth item
    Verify Fourth Item at Product page    ${item3}    ${ITEM3_DESC}    ${ITEM3_IMG}    ${ITEMS_PRICE}[2]    add-to-cart-sauce-labs-bolt-t-shirt
    # Verify fifth item
    Verify Fifth Item at Product page    ${item2}    ${ITEM2_DESC}    ${ITEM2_IMG}    ${ITEMS_PRICE}[1]    add-to-cart-sauce-labs-bike-light
    # Verify sixth item
    Verify Sixth Item at Product page    ${item1}    ${ITEM1_DESC}    ${ITEM1_IMG}    ${ITEMS_PRICE}[0]    add-to-cart-sauce-labs-backpack

Verify Sorted Items low-high (visual user)
    [Arguments]    ${item1}    ${item2}    ${item3}    ${item4}    ${item5}    ${item6}
    # Verify sorted items order
    # Verify first item
    Verify First Item at Product page    ${item5}    ${ITEM5_DESC}    ${BROKEN_ITEM_IMG}    ${ITEMS_PRICE}[4]    add-to-cart-sauce-labs-onesie
    # Verify second item
    Verify Second Item at Product page    ${item2}    ${ITEM2_DESC}    ${ITEM2_IMG}    ${ITEMS_PRICE}[1]    add-to-cart-sauce-labs-bike-light
    # Verify third item
    Verify Third Item at Product page    ${item3}    ${ITEM3_DESC}    ${ITEM3_IMG}    ${ITEMS_PRICE}[2]    add-to-cart-sauce-labs-bolt-t-shirt
    # Verify fourth item
    Verify Fourth Item at Product page    ${item6}    ${ITEM6_DESC}    ${ITEM6_IMG}    ${ITEMS_PRICE}[5]    add-to-cart-test.allthethings()-t-shirt-(red)
    # Verify fifth item
    Verify Fifth Item at Product page    ${item1}    ${ITEM1_DESC}    ${ITEM1_IMG}    ${ITEMS_PRICE}[0]    add-to-cart-sauce-labs-backpack
    # Verify sixth item
    Verify Sixth Item at Product page    ${item4}    ${ITEM4_DESC}    ${ITEM4_IMG}    ${ITEMS_PRICE}[3]    add-to-cart-sauce-labs-fleece-jacket


Verify Sorted Items high-low (visual user)
    [Arguments]    ${item1}    ${item2}    ${item3}    ${item4}    ${item5}    ${item6}
    # Verify sorted items order
    # Verify first item
    Verify First Item at Product page    ${item4}    ${ITEM4_DESC}    ${BROKEN_ITEM_IMG}    ${ITEMS_PRICE}[3]    add-to-cart-sauce-labs-fleece-jacket
    # Verify second item
    Verify Second Item at Product page    ${item1}    ${ITEM1_DESC}    ${ITEM1_IMG}    ${ITEMS_PRICE}[0]    add-to-cart-sauce-labs-backpack
    # Verify third item
    Verify Third Item at Product page    ${item3}    ${ITEM3_DESC}    ${ITEM3_IMG}    ${ITEMS_PRICE}[2]    add-to-cart-sauce-labs-bolt-t-shirt
    # Verify fourth item
    Verify Fourth Item at Product page    ${item6}    ${ITEM6_DESC}    ${ITEM6_IMG}    ${ITEMS_PRICE}[5]    add-to-cart-test.allthethings()-t-shirt-(red)
    # Verify fifth item
    Verify Fifth Item at Product page    ${item2}    ${ITEM2_DESC}    ${ITEM2_IMG}    ${ITEMS_PRICE}[1]    add-to-cart-sauce-labs-bike-light
    # Verify sixth item
    Verify Sixth Item at Product page    ${item5}    ${ITEM5_DESC}    ${ITEM5_IMG}    ${ITEMS_PRICE}[4]    add-to-cart-sauce-labs-onesie

Buy Item at detail page 
    Click Button    id:add-to-cart
    Wait Until Element Is Visible    id:remove
    Element Should Not Be Visible    id:add-to-cart
    Element Text Should Be    id:remove    Remove

Buy Item at detail page (problem user)
    Click Button    id:add-to-cart
    Element Should Not Be Visible    id:remove
    Element Text Should Be    id:add-to-cart    Add to cart

Remove Item at detail page
    Click Button    id:remove
    # Add button should appear
    Wait Until Element Is Visible    id:add-to-cart
    Element Should Not Be Visible    id:remove
    Element Text Should Be    id:add-to-cart    Add to cart

Remove Item at detail page (error user)
    Click Button    id:remove
    Element Should Be Visible    id:remove
    Element Should Not Be Visible    id:add-to-cart
Buy Sauce Labs Backpack
    Click Button    id:add-to-cart-sauce-labs-backpack
    # Remove button should appear
    Wait Until Element Is Visible    id:remove-sauce-labs-backpack
    Element Should Not Be Visible    id:add-to-cart-sauce-labs-backpack
    Element Text Should Be    id:remove-sauce-labs-backpack    Remove

Remove Sauce Labs Backpack
    Click Button    id:remove-sauce-labs-backpack
    # Add button should appear
    Wait Until Element Is Visible    id:add-to-cart-sauce-labs-backpack
    Element Should Not Be Visible    id:remove-sauce-labs-backpack
    Element Text Should Be    id:add-to-cart-sauce-labs-backpack    Add to cart

Remove Sauce Labs Backpack (problem user)
    Click Button    id:remove-sauce-labs-backpack
    Element Should Be Visible    id:remove-sauce-labs-backpack
    Element Should Not Be Visible    id:add-to-cart-sauce-labs-backpack

Buy Sauce Labs Bike Light
    Click Button    id:add-to-cart-sauce-labs-bike-light
    # Remove button should appear
    Wait Until Element Is Visible    id:remove-sauce-labs-bike-light
    Element Should Not Be Visible    id:add-to-cart-sauce-labs-bike-light
    Element Text Should Be    id:remove-sauce-labs-bike-light    Remove

Remove Sauce Labs Bike Light
    Click Button    id:remove-sauce-labs-bike-light
    # Add button should appear
    Wait Until Element Is Visible    id:add-to-cart-sauce-labs-bike-light
    Element Should Not Be Visible    id:remove-sauce-labs-bike-light
    Element Text Should Be    id:add-to-cart-sauce-labs-bike-light    Add to cart

Remove Sauce Labs bike Light (problem user)
    Click Button    id:remove-sauce-labs-bike-light
    Element Should Be Visible    id:remove-sauce-labs-bike-light
    Element Should Not Be Visible    id:add-to-cart-sauce-labs-bike-light

Buy Sauce Labs Bolt T-Shirt
    Click Button    id:add-to-cart-sauce-labs-bolt-t-shirt
    # Remove button should appear
    Wait Until Element Is Visible    id:remove-sauce-labs-bolt-t-shirt
    Element Should Not Be Visible    id:add-to-cart-sauce-labs-bolt-t-shirt
    Element Text Should Be    id:remove-sauce-labs-bolt-t-shirt    Remove

Remove Sauce Labs Bolt T-Shirt
    Click Button    id:remove-sauce-labs-bolt-t-shirt
    # Add button should appear
    Wait Until Element Is Visible    id:add-to-cart-sauce-labs-bolt-t-shirt
    Element Should Not Be Visible    id:remove-sauce-labs-bolt-t-shirt
    Element Text Should Be    id:add-to-cart-sauce-labs-bolt-t-shirt    Add to cart

Buy Sauce Labs Bolt T-Shirt (problem user)
    Click Button    id:add-to-cart-sauce-labs-bolt-t-shirt
    Element Should Be Visible    id:add-to-cart-sauce-labs-bolt-t-shirt
    Element Should Not Be Visible    id:remove-sauce-labs-bolt-t-shirt

Buy Sauce Labs Fleece Jacket
    Click Button    id:add-to-cart-sauce-labs-fleece-jacket
    # Remove button should appear
    Wait Until Element Is Visible    id:remove-sauce-labs-fleece-jacket
    Element Should Not Be Visible    id:add-to-cart-sauce-labs-fleece-jacket
    Element Text Should Be    id:remove-sauce-labs-fleece-jacket    Remove

Remove Sauce Labs Fleece Jacket
    Click Button    id:remove-sauce-labs-fleece-jacket
    # Add button should appear
    Wait Until Element Is Visible    id:add-to-cart-sauce-labs-fleece-jacket
    Element Should Not Be Visible    id:remove-sauce-labs-fleece-jacket
    Element Text Should Be    id:add-to-cart-sauce-labs-fleece-jacket    Add to cart

Buy Sauce Labs Fleece Jacket (problem user)
    Click Button    id:add-to-cart-sauce-labs-fleece-jacket
    Element Should Be Visible    id:add-to-cart-sauce-labs-fleece-jacket
    Element Should Not Be Visible    id:remove-sauce-labs-fleece-jacket

Buy Sauce Labs Onesie
    Click Button    id:add-to-cart-sauce-labs-onesie
    # Remove button should appear
    Wait Until Element Is Visible    id:remove-sauce-labs-onesie
    Element Should Not Be Visible    id:add-to-cart-sauce-labs-onesie
    Element Text Should Be    id:remove-sauce-labs-onesie    Remove

Remove Sauce Labs Onesie
    Click Button    id:remove-sauce-labs-onesie
    # Add button should appear
    Wait Until Element Is Visible    id:add-to-cart-sauce-labs-onesie
    Element Should Not Be Visible    id:remove-sauce-labs-onesie
    Element Text Should Be    id:add-to-cart-sauce-labs-onesie    Add to cart

Remove Sauce Labs Onesie (problem user)
    Click Button    id:remove-sauce-labs-onesie
    Element Should Be Visible    id:remove-sauce-labs-onesie
    Element Should Not Be Visible    id:add-to-cart-sauce-labs-onesie

Buy Test.allTheThings() T-Shirt (Red)
    Click Button    id:add-to-cart-test.allthethings()-t-shirt-(red)
    # Remove button should appear
    Wait Until Element Is Visible    id:remove-test.allthethings()-t-shirt-(red)
    Element Should Not Be Visible    id:add-to-cart-test.allthethings()-t-shirt-(red)
    Element Text Should Be    id:remove-test.allthethings()-t-shirt-(red)    Remove

Remove Test.allTheThings() T-Shirt (Red)
    Click Button    id:remove-test.allthethings()-t-shirt-(red)
    # Add button should appear
    Wait Until Element Is Visible    id:add-to-cart-test.allthethings()-t-shirt-(red)
    Element Should Not Be Visible    id:remove-test.allthethings()-t-shirt-(red)
    Element Text Should Be    id:add-to-cart-test.allthethings()-t-shirt-(red)    Add to cart

Buy Test.allTheThings() T-Shirt (Red) (problem user)
    Click Button    id:add-to-cart-test.allthethings()-t-shirt-(red)
    Element Should Be Visible    id:add-to-cart-test.allthethings()-t-shirt-(red)
    Element Should Not Be Visible    id:remove-test.allthethings()-t-shirt-(red)


Cart Item Quantity
    [Arguments]    ${quantity}
    Element Text Should Be    xpath://*[@id="shopping_cart_container"]/a/span    ${quantity}

Verify Cart page
    Element Text Should Be    xpath://*[@id="header_container"]/div[2]/span    Your Cart
    Page Should Contain Element    id:checkout
    Page Should Contain Element    id:continue-shopping
    Page Should Contain    QTY
    Page Should Contain    Description

Go to cart
    Click Element    xpath://*[@id="shopping_cart_container"]/a
    Verify Cart page

Continue Shopping
    Click Button    id:continue-shopping
    Sleep    2
    Element Text Should Be    class:title    Products

Verify Remove button of Sauce Labs Backpack
    Page Should Contain Element    id:remove-sauce-labs-backpack
    Element Text Should Be    id:remove-sauce-labs-backpack    Remove

Verify Remove button of Sauce Labs Bike Light
    Page Should Contain Element    id:remove-sauce-labs-bike-light
    Element Text Should Be    id:remove-sauce-labs-bike-light    Remove

Verify Remove button of Sauce Labs Bolt T-Shirt
    Page Should Contain Element    id:remove-sauce-labs-bolt-t-shirt
    Element Text Should Be    id:remove-sauce-labs-bolt-t-shirt    Remove

Verify Remove button of Sauce Labs Fleece Jacket
    Page Should Contain Element    id:remove-sauce-labs-fleece-jacket
    Element Text Should Be    id:remove-sauce-labs-fleece-jacket    Remove

Verify Remove button of Sauce Labs Onesie
    Page Should Contain Element    id:remove-sauce-labs-onesie
    Element Text Should Be    id:remove-sauce-labs-onesie    Remove

Verify Remove button of Test.allTheThings() T-Shirt (Red)
    Page Should Contain Element    id:remove-test.allthethings()-t-shirt-(red)
    Element Text Should Be    id:remove-test.allthethings()-t-shirt-(red)    Remove

Verify First item in cart
    [Arguments]    ${item_name}    ${item_desc}    ${item_price}

    Element Text Should Be    xpath://*[@id="cart_contents_container"]/div/div[1]/div[3]/div[1]    1
    Element Text Should Be    xpath://*[@id="cart_contents_container"]/div/div[1]/div[3]/div[2]/a/div    ${item_name}
    Element Text Should Be    xpath://*[@id="cart_contents_container"]/div/div[1]/div[3]/div[2]/div[1]    ${item_desc}
    Element Text Should Be    xpath://*[@id="cart_contents_container"]/div/div[1]/div[3]/div[2]/div[2]/div    ${item_price}

Verify Second item in cart
    [Arguments]    ${item_name}    ${item_desc}    ${item_price}
    Element Text Should Be    xpath://*[@id="cart_contents_container"]/div/div[1]/div[4]/div[1]    1
    Element Text Should Be    xpath://*[@id="cart_contents_container"]/div/div[1]/div[4]/div[2]/a/div    ${item_name}
    Element Text Should Be    xpath://*[@id="cart_contents_container"]/div/div[1]/div[4]/div[2]/div[1]    ${item_desc}
    Element Text Should Be    xpath://*[@id="cart_contents_container"]/div/div[1]/div[4]/div[2]/div[2]/div    ${item_price}

Verify Third item in cart
    [Arguments]    ${item_name}    ${item_desc}    ${item_price}
    Element Text Should Be    xpath://*[@id="cart_contents_container"]/div/div[1]/div[5]/div[1]    1
    Element Text Should Be    xpath://*[@id="cart_contents_container"]/div/div[1]/div[5]/div[2]/a/div    ${item_name}
    Element Text Should Be    xpath://*[@id="cart_contents_container"]/div/div[1]/div[5]/div[2]/div[1]    ${item_desc}
    Element Text Should Be    xpath://*[@id="cart_contents_container"]/div/div[1]/div[5]/div[2]/div[2]/div    ${item_price}

Verify Broken item in cart
    [Arguments]    ${item_name}    ${item_desc}    ${item_price}
    Page Should Not Contain    ${item_name}
    Page Should Not Contain    ${item_desc}
    Page Should Not Contain    ${item_price}

Verify Item not existing in cart
    [Arguments]    ${item_name}    ${item_desc}
    Page Should Not Contain    ${item_name}
    Page Should Not Contain    ${item_desc}

Verify Fourth item in cart
    [Arguments]    ${item_name}    ${item_desc}    ${item_price}
    Element Text Should Be    xpath://*[@id="cart_contents_container"]/div/div[1]/div[6]/div[1]    1
    Element Text Should Be    xpath://*[@id="cart_contents_container"]/div/div[1]/div[6]/div[2]/a/div    ${item_name}
    Element Text Should Be    xpath://*[@id="cart_contents_container"]/div/div[1]/div[6]/div[2]/div[1]    ${item_desc}
    Element Text Should Be    xpath://*[@id="cart_contents_container"]/div/div[1]/div[6]/div[2]/div[2]/div    ${item_price}

Verify Fifth item in cart
    [Arguments]    ${item_name}    ${item_desc}    ${item_price}
    Element Text Should Be    xpath://*[@id="cart_contents_container"]/div/div[1]/div[7]/div[1]    1
    Element Text Should Be    xpath://*[@id="cart_contents_container"]/div/div[1]/div[7]/div[2]/a/div    ${item_name}
    Element Text Should Be    xpath://*[@id="cart_contents_container"]/div/div[1]/div[7]/div[2]/div[1]    ${item_desc}
    Element Text Should Be    xpath://*[@id="cart_contents_container"]/div/div[1]/div[7]/div[2]/div[2]/div    ${item_price}

Verify Sixth item in cart
    [Arguments]    ${item_name}    ${item_desc}    ${item_price}
    Element Text Should Be    xpath://*[@id="cart_contents_container"]/div/div[1]/div[8]/div[1]    1
    Element Text Should Be    xpath://*[@id="cart_contents_container"]/div/div[1]/div[8]/div[2]/a/div    ${item_name}
    Element Text Should Be    xpath://*[@id="cart_contents_container"]/div/div[1]/div[8]/div[2]/div[1]    ${item_desc}
    Element Text Should Be    xpath://*[@id="cart_contents_container"]/div/div[1]/div[8]/div[2]/div[2]/div    ${item_price}


Go to Sauce Labs Backpack detail page
    Click Element    id:item_4_title_link
    
Go to Sauce Labs Bike Light detail page
    Click Element    id:item_0_title_link

Go to Sauce Labs Bolt T-Shirt detail page
    Click Element    id:item_1_title_link

Go to Sauce Labs Fleece Jacket detail page
    Click Element    id:item_5_title_link

Go to Sauce Labs Onesie detail page
    Click Element    id:item_2_title_link

Go to Test.allTheThings() T-Shirt (Red) detail page
    Click Element    id:item_3_title_link

Remove Sauce Labs Backpack at cart
    Click Element    id:remove-sauce-labs-backpack
    Element Should Not Be Visible    id:remove-sauce-labs-backpack

Remove Sauce Labs Bike Light at cart
    Click Element    id:remove-sauce-labs-bike-light
    Element Should Not Be Visible    id:remove-sauce-labs-bike-light

Remove Sauce Labs Bolt T-Shirt at cart
    Click Element    id:remove-sauce-labs-bolt-t-shirt
    Element Should Not Be Visible    id:remove-sauce-labs-bolt-t-shirt

Remove Sauce Labs Fleece Jacket at cart
    Click Element    id:remove-sauce-labs-fleece-jacket
    Element Should Not Be Visible    id:remove-sauce-labs-fleece-jacket

Remove Sauce Labs Onesie at cart
    Click Element    id:remove-sauce-labs-onesie
    Element Should Not Be Visible    id:remove-sauce-labs-onesie

Remove Test.allTheThings() T-Shirt (Red) at cart
    Click Element    id:remove-test.allthethings()-t-shirt-(red)
    Element Should Not Be Visible    id:remove-test.allthethings()-t-shirt-(red)

Buy all Items
    Buy Sauce Labs Backpack
    Buy Sauce Labs Bike Light
    Buy Sauce Labs Bolt T-Shirt
    Buy Sauce Labs Fleece Jacket
    Buy Sauce Labs Onesie
    Buy Test.allTheThings() T-Shirt (Red)

Buy All Items (problem user)
    Buy Sauce Labs Backpack
    Buy Sauce Labs Bike Light
    Buy Sauce Labs Bolt T-Shirt (problem user)
    Buy Sauce Labs Fleece Jacket (problem user)
    Buy Sauce Labs Onesie
    Buy Test.allTheThings() T-Shirt (Red) (problem user)

Verify Add button of Sauce Labs Backpack
    Page Should Contain Element    id:add-to-cart-sauce-labs-backpack
    Element Text Should Be    id:add-to-cart-sauce-labs-backpack    Add to cart

Verify Add button of Sauce Labs Bike Light
    Page Should Contain Element    id:add-to-cart-sauce-labs-bike-light
    Element Text Should Be    id:add-to-cart-sauce-labs-bike-light    Add to cart

Verify Add button of Sauce Labs Bolt T-Shirt
    Page Should Contain Element    id:add-to-cart-sauce-labs-bolt-t-shirt
    Element Text Should Be    id:add-to-cart-sauce-labs-bolt-t-shirt    Add to cart

Verify Add button of Sauce Labs Fleece Jacket
    Page Should Contain Element    id:add-to-cart-sauce-labs-fleece-jacket
    Element Text Should Be    id:add-to-cart-sauce-labs-fleece-jacket    Add to cart

Verify Add button of Sauce Labs Onesie
    Page Should Contain Element    id:add-to-cart-sauce-labs-onesie
    Element Text Should Be    id:add-to-cart-sauce-labs-onesie    Add to cart

Verify Add button of Test.allTheThings() T-Shirt (Red)
    Page Should Contain Element    id:add-to-cart-test.allthethings()-t-shirt-(red)
    Element Text Should Be    id:add-to-cart-test.allthethings()-t-shirt-(red)    Add to cart

Verify Cart Icon position changed
    ${visual_cart_icon}=    Get Cart Icon Position
    Should Not Be Equal    int(${cart_icon})    int(${visual_cart_icon})


Verify Checkout button position changed
    ${visual_checkout_position}=    Get Checkout Button Position
    Should Not Be Equal    int(${checkout_position})    int(${visual_checkout_position})


Verify Update Cart when remove each item at cart page
    # Page should appear cart item number
    Cart Item Quantity    6
    # Remove each items at cart page and verify 
    Go to cart
    Cart Item Quantity    6
    Remove Sauce Labs Backpack at cart
    Verify Item not existing in cart    ${ITEMS}[0]    ${ITEM1_DESC}
    Cart Item Quantity    5
    Remove Sauce Labs Bike Light at cart
    Verify Item not existing in cart    ${ITEMS}[1]    ${ITEM2_DESC}
    Cart Item Quantity    4
    Remove Sauce Labs Bolt T-Shirt at cart
    Verify Item not existing in cart    ${ITEMS}[2]    ${ITEM3_DESC}
    Cart Item Quantity    3
    Remove Sauce Labs Fleece Jacket at cart
    Verify Item not existing in cart    ${ITEMS}[3]    ${ITEM4_DESC}
    Cart Item Quantity    2
    Remove Sauce Labs Onesie at cart
    Verify Item not existing in cart    ${ITEMS}[4]    ${ITEM5_DESC}
    Cart Item Quantity    1
    Remove Test.allTheThings() T-Shirt (Red) at cart
    Verify Item not existing in cart    ${ITEMS}[5]    ${ITEM6_DESC}
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span

Verify Update Cart when remove each item at product page
    # Page should appear cart item number
    Cart Item Quantity    6
    # Remove each items at cart page and verify 
    Remove Sauce Labs Backpack
    Go to cart
    Verify Item not existing in cart    ${ITEMS}[0]    ${ITEM1_DESC}
    Cart Item Quantity    5
    # Back to product page
    Continue Shopping
    Cart Item Quantity    5
    Verify Add button of Sauce Labs Backpack
    Remove Sauce Labs Bike Light
    Go to cart
    Verify Item not existing in cart    ${ITEMS}[1]    ${ITEM2_DESC}
    Cart Item Quantity    4
    # Back to product page
    Continue Shopping
    Cart Item Quantity    4
    Verify Add button of Sauce Labs Bike Light
    Remove Sauce Labs Bolt T-Shirt at cart
    Go to cart
    Verify Item not existing in cart    ${ITEMS}[2]    ${ITEM3_DESC}
    Cart Item Quantity    3
    # Back to product page
    Continue Shopping
    Cart Item Quantity    3
    Verify Add button of Sauce Labs Bolt T-Shirt
    Remove Sauce Labs Fleece Jacket at cart
    Go to cart
    Verify Item not existing in cart    ${ITEMS}[3]    ${ITEM4_DESC}
    Cart Item Quantity    2
    # Back to product page
    Continue Shopping
    Cart Item Quantity    2
    Verify Add button of Sauce Labs Fleece Jacket
    Remove Sauce Labs Onesie at cart
    Go to cart
    Verify Item not existing in cart    ${ITEMS}[4]    ${ITEM5_DESC}
    Cart Item Quantity    1
    # Back to product page
    Continue Shopping
    Cart Item Quantity    1
    Verify Add button of Sauce Labs Onesie
    Remove Test.allTheThings() T-Shirt (Red) at cart
    Go to cart
    Verify Item not existing in cart    ${ITEMS}[5]    ${ITEM6_DESC}
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span
    # Back to product page
    Continue Shopping
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span
    Verify Add button of Test.allTheThings() T-Shirt (Red)

Verify Update Cart when remove each item at detail page
    # Page should appear cart item number
    Cart Item Quantity    6
    # Remove each items at cart page and verify 
    Go to Sauce Labs Backpack detail page
    Remove Item at detail page
    Go to cart
    Verify Item not existing in cart    ${ITEMS}[0]    ${ITEM1_DESC}
    Cart Item Quantity    5
    # Back to product page
    Continue Shopping
    Cart Item Quantity    5
    Verify Add button of Sauce Labs Backpack
    Go to Sauce Labs Bike Light detail page
    Remove Item at detail page
    Go to cart
    Verify Item not existing in cart    ${ITEMS}[1]    ${ITEM2_DESC}
    Cart Item Quantity    4
    # Back to product page
    Continue Shopping
    Cart Item Quantity    4
    Verify Add button of Sauce Labs Bike Light
    Go to Sauce Labs Bolt T-Shirt detail page
    Remove Item at detail page
    Go to cart
    Verify Item not existing in cart    ${ITEMS}[2]    ${ITEM3_DESC}
    Cart Item Quantity    3
    # Back to product page
    Continue Shopping
    Cart Item Quantity    3
    Verify Add button of Sauce Labs Bolt T-Shirt
    Go to Sauce Labs Fleece Jacket detail page
    Remove Item at detail page
    Go to cart
    Verify Item not existing in cart    ${ITEMS}[3]    ${ITEM4_DESC}
    Cart Item Quantity    2
    # Back to product page
    Continue Shopping
    Cart Item Quantity    2
    Verify Add button of Sauce Labs Fleece Jacket
    Go to Sauce Labs Onesie detail page
    Remove Item at detail page
    Go to cart
    Verify Item not existing in cart    ${ITEMS}[4]    ${ITEM5_DESC}
    Cart Item Quantity    1
    # Back to product page
    Continue Shopping
    Cart Item Quantity    1
    Verify Add button of Sauce Labs Onesie
    Go to Test.allTheThings() T-Shirt (Red) detail page
    Remove Item at detail page
    Go to cart
    Verify Item not existing in cart    ${ITEMS}[5]    ${ITEM6_DESC}
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span
    # Back to product page
    Continue Shopping
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span
    Verify Add button of Test.allTheThings() T-Shirt (Red)

Verify Update Cart when remove each item at cart page (problem user)
    # Page should appear cart item number
    Cart Item Quantity    3
    # Remove each items at cart page and verify 
    Go to cart
    Cart Item Quantity    3
    Remove Sauce Labs Backpack at cart
    Verify Item not existing in cart    ${ITEMS}[0]    ${ITEM1_DESC}
    Cart Item Quantity    2
    Remove Sauce Labs Bike Light at cart
    Verify Item not existing in cart    ${ITEMS}[1]    ${ITEM2_DESC}
    Cart Item Quantity    1
    Remove Sauce Labs Onesie at cart
    Verify Item not existing in cart    ${ITEMS}[4]    ${ITEM5_DESC}
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span

Verify Update Cart when remove each item at product page (problem user)
    # Page should appear cart item number
    Cart Item Quantity    3
    # Broken items Add btn should not be change to Remove btn
    Verify Add button of Sauce Labs Bolt T-Shirt
    Verify Add button of Sauce Labs Fleece Jacket
    Verify Add button of Test.allTheThings() T-Shirt (Red)
    # Remove each items at cart page and verify 
    Remove Sauce Labs Backpack (problem user)
    Go to cart
    # Item should not be removed at cart page
    Verify First item in cart    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    Cart Item Quantity    3
    # Back to product page
    Continue Shopping
    Cart Item Quantity    3
    Verify Remove button of Sauce Labs Backpack
    # Remove another item at product page
    Remove Sauce Labs Bike Light (problem user)
    Go to cart
    # Item should not be removed at cart page
    Verify Second item in cart    ${ITEMS}[1]    ${ITEM2_DESC}    ${ITEMS_PRICE}[1]
    Cart Item Quantity    3
    # Back to product page
    Continue Shopping
    Cart Item Quantity    3
    Verify Remove button of Sauce Labs Bike Light
    # Remove another item
    Remove Sauce Labs Onesie (problem user)
    Go to cart
    Verify Third item in cart    ${ITEMS}[4]    ${ITEM5_DESC}    ${ITEMS_PRICE}[4]
    Cart Item Quantity    3
    # Back to product page
    Continue Shopping
    Cart Item Quantity    3
    Verify Remove button of Sauce Labs Onesie

Verify Update Cart when remove each item at detail page (problem user)
    # Page should appear cart item number
    Cart Item Quantity    3
    # Broken items Add btn should not be change to Remove btn
    Verify Add button of Sauce Labs Bolt T-Shirt
    Verify Add button of Sauce Labs Fleece Jacket
    Verify Add button of Test.allTheThings() T-Shirt (Red)
    # Remove each items at cart page and verify 
    Go to Sauce Labs Backpack detail page
    # The page should present not correctly,  not showing Remove btn
    Page Should Contain Element    id:add-to-cart
    Page Should Not Contain Element    id:remove
    Go to cart
    # Item should not be removed at cart page
    Verify First item in cart    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    Cart Item Quantity    3
    # Back to product page
    Continue Shopping
    Cart Item Quantity    3
    Verify Remove button of Sauce Labs Backpack
    # Remove another item at product page
    Go to Sauce Labs Bike Light detail page
    # The page should present not correctly,  not showing Remove btn
    Page Should Contain Element    id:add-to-cart
    Page Should Not Contain Element    id:remove
    Go to cart
    # Item should not be removed at cart page
    Verify Second item in cart    ${ITEMS}[1]    ${ITEM2_DESC}    ${ITEMS_PRICE}[1]
    Cart Item Quantity    3
    # Back to product page
    Continue Shopping
    Cart Item Quantity    3
    Verify Remove button of Sauce Labs Bike Light
    # Remove another item
    Go to Sauce Labs Onesie detail page
    # The page should present not correctly, not showing Remove btn
    Page Should Contain Element    id:add-to-cart
    Page Should Not Contain Element    id:remove
    Go to cart
    # Item should not be removed at cart page
    Verify Third item in cart    ${ITEMS}[4]    ${ITEM5_DESC}    ${ITEMS_PRICE}[4]
    Cart Item Quantity    3
    # Back to product page
    Continue Shopping
    Cart Item Quantity    3
    Verify Remove button of Sauce Labs Onesie

Verify Update Cart when remove each item at detail page (error user)
    # Page should appear cart item number
    Cart Item Quantity    3
    # Broken items Add btn should not be change to Remove btn
    Verify Add button of Sauce Labs Bolt T-Shirt
    Verify Add button of Sauce Labs Fleece Jacket
    Verify Add button of Test.allTheThings() T-Shirt (Red)
    # Remove each items at cart page and verify 
    Go to Sauce Labs Backpack detail page
    Page Should Contain Element    id:remove
    # The Remove btn at page not workable
    Remove Item at detail page (error user)
    Go to cart
    # Item should not be removed at cart page
    Verify First item in cart    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    Cart Item Quantity    3
    # Back to product page
    Continue Shopping
    Cart Item Quantity    3
    Verify Remove button of Sauce Labs Backpack
    # Remove another item at product page
    Go to Sauce Labs Bike Light detail page
    Page Should Contain Element    id:remove
    # The Remove btn at page not workable
    Remove Item at detail page (error user)
    Go to cart
    # Item should not be removed at cart page
    Verify Second item in cart    ${ITEMS}[1]    ${ITEM2_DESC}    ${ITEMS_PRICE}[1]
    Cart Item Quantity    3
    # Back to product page
    Continue Shopping
    Cart Item Quantity    3
    Verify Remove button of Sauce Labs Bike Light
    # Remove another item
    Go to Sauce Labs Onesie detail page
    Page Should Contain Element    id:remove
    # The Remove btn at page not workable
    Remove Item at detail page (error user)
    Go to cart
    # Item should not be removed at cart page
    Verify Third item in cart    ${ITEMS}[4]    ${ITEM5_DESC}    ${ITEMS_PRICE}[4]
    Cart Item Quantity    3
    # Back to product page
    Continue Shopping
    Cart Item Quantity    3
    Verify Remove button of Sauce Labs Onesie

Verify cart is empty
    Verify Item not existing in cart    ${ITEMS}[0]    ${ITEM1_DESC}
    Verify Item not existing in cart    ${ITEMS}[1]    ${ITEM2_DESC}
    Verify Item not existing in cart    ${ITEMS}[2]    ${ITEM3_DESC}
    Verify Item not existing in cart    ${ITEMS}[3]    ${ITEM4_DESC}
    Verify Item not existing in cart    ${ITEMS}[4]    ${ITEM5_DESC}
    Verify Item not existing in cart    ${ITEMS}[5]    ${ITEM6_DESC}
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span

Verify all Add button
    Verify Add button of Sauce Labs Backpack
    Verify Add button of Sauce Labs Bike Light
    Verify Add button of Sauce Labs Bolt T-Shirt
    Verify Add button of Sauce Labs Fleece Jacket
    Verify Add button of Sauce Labs Onesie
    Verify Add button of Test.allTheThings() T-Shirt (Red)

Verify First item in checkout
    [Arguments]    ${item_name}    ${item_desc}    ${item_price}

    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[1]/div[3]/div[1]    1
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[1]/div[3]/div[2]/a/div    ${item_name}
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[1]/div[3]/div[2]/div[1]    ${item_desc}
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[1]/div[3]/div[2]/div[2]/div    ${item_price}

Verify Second item in checkout
    [Arguments]    ${item_name}    ${item_desc}    ${item_price}
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[1]/div[4]/div[1]    1
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[1]/div[4]/div[2]/a/div    ${item_name}
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[1]/div[4]/div[2]/div[1]    ${item_desc}
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[1]/div[4]/div[2]/div[2]/div    ${item_price}

Verify Third item in checkout
    [Arguments]    ${item_name}    ${item_desc}    ${item_price}
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[1]/div[5]/div[1]    1
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[1]/div[5]/div[2]/a/div    ${item_name}
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[1]/div[5]/div[2]/div[1]    ${item_desc}
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[1]/div[5]/div[2]/div[2]/div    ${item_price}

Verify Fourth item in checkout
    [Arguments]    ${item_name}    ${item_desc}    ${item_price}
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[1]/div[6]/div[1]    1
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[1]/div[6]/div[2]/a/div    ${item_name}
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[1]/div[6]/div[2]/div[1]    ${item_desc}
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[1]/div[6]/div[2]/div[2]/div    ${item_price}

Verify Fifth item in checkout
    [Arguments]    ${item_name}    ${item_desc}    ${item_price}
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[1]/div[7]/div[1]    1
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[1]/div[7]/div[2]/a/div    ${item_name}
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[1]/div[7]/div[2]/div[1]    ${item_desc}
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[1]/div[7]/div[2]/div[2]/div    ${item_price}

Verify Sixth item in checkout
    [Arguments]    ${item_name}    ${item_desc}    ${item_price}
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[1]/div[8]/div[1]    1
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[1]/div[8]/div[2]/a/div    ${item_name}
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[1]/div[8]/div[2]/div[1]    ${item_desc}
    Element Text Should Be    xpath://*[@id="checkout_summary_container"]/div/div[1]/div[8]/div[2]/div[2]/div    ${item_price}

Verify product page
    Element Text Should Be    class:title    Products
    Page Should Contain Element    id=react-burger-menu-btn
    Page Should Contain Element    class:product_sort_container
    Page Should Contain Element    class:shopping_cart_container
    Verify Sorted Items A-Z    ${ITEMS}[0]    ${ITEMS}[1]    ${ITEMS}[2]    ${ITEMS}[3]    ${ITEMS}[4]    ${ITEMS}[5]

Click all items
    Click Button    id=react-burger-menu-btn
    Wait Until Element Is Visible    id=inventory_sidebar_link
    Click Element    id=inventory_sidebar_link   
