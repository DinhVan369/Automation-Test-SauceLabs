*** Settings ***
Resource    ../resources.robot


*** Test Cases ***
Verify Cart will be update when buy items with standard user
    Open Browser to Login
    # Login
    Login with standard user
    Maximize Browser Window
    # Buy an item
    Buy Sauce Labs Backpack
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    1
    # Go to Cart page
    Go to cart
    # Get checkout btn position for later usage
    ${checkout_button_position}=    Get Checkout Button Position
    Log To Console    ${checkout_button_position}
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    1
    # Verify item in cart
    Verify First item in cart    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    Verify Remove button of Sauce Labs Backpack
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Backpack
    # Buy another item
    Buy Sauce Labs Bike Light
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    2
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    2
    # Verify item in cart
    Verify Second item in cart    ${ITEMS}[1]    ${ITEM2_DESC}    ${ITEMS_PRICE}[1]
    Verify Remove button of Sauce Labs Bike Light
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Bike Light
    # Buy another item
    Buy Sauce Labs Bolt T-Shirt
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    3
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    3
    # Verify item in cart
    Verify Third item in cart    ${ITEMS}[2]    ${ITEM3_DESC}    ${ITEMS_PRICE}[2]
    Verify Remove button of Sauce Labs Bolt T-Shirt
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Bolt T-Shirt
    # Buy another item
    Buy Sauce Labs Fleece Jacket
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    4
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    4
    # Verify item in cart
    Verify Fourth item in cart    ${ITEMS}[3]    ${ITEM4_DESC}    ${ITEMS_PRICE}[3]
    Verify Remove button of Sauce Labs Fleece Jacket
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Fleece Jacket
    # Buy another item
    Buy Sauce Labs Onesie
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    5
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    5
    # Verify item in cart
    Verify Fifth item in cart    ${ITEMS}[4]    ${ITEM5_DESC}    ${ITEMS_PRICE}[4]
    Verify Remove button of Sauce Labs Onesie
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Onesie
    # Buy another item
    Buy Test.allTheThings() T-Shirt (Red)
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    6
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    6
    # Verify item in cart
    Verify Sixth item in cart    ${ITEMS}[5]    ${ITEM6_DESC}    ${ITEMS_PRICE}[5]
    Verify Remove button of Test.allTheThings() T-Shirt (Red)
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Test.allTheThings() T-Shirt (Red)
    # Logout
    Logout the page
    Close Browser

Verify Cart will be update when buy items at theirs detail page with standard user
    Open Browser to Login
    # Login
    Login with standard user
    Maximize Browser Window
    # Buy an item
    Go to Sauce Labs Backpack detail page
    Buy Item at detail page
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    1
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    1
    # Verify item in cart
    Verify First item in cart    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    Verify Remove button of Sauce Labs Backpack
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Backpack
    # Buy another item
    Go to Sauce Labs Bike Light detail page
    Buy Item at detail page
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    2
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    2
    # Verify item in cart
    Verify Second item in cart    ${ITEMS}[1]    ${ITEM2_DESC}    ${ITEMS_PRICE}[1]
    Verify Remove button of Sauce Labs Bike Light
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Bike Light
    # Buy another item
    Go to Sauce Labs Bolt T-Shirt detail page
    Buy Item at detail page
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    3
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    3
    # Verify item in cart
    Verify Third item in cart    ${ITEMS}[2]    ${ITEM3_DESC}    ${ITEMS_PRICE}[2]
    Verify Remove button of Sauce Labs Bolt T-Shirt
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Bolt T-Shirt
    # Buy another item
    Go to Sauce Labs Fleece Jacket detail page
    Buy Item at detail page
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    4
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    4
    # Verify item in cart
    Verify Fourth item in cart    ${ITEMS}[3]    ${ITEM4_DESC}    ${ITEMS_PRICE}[3]
    Verify Remove button of Sauce Labs Fleece Jacket
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Fleece Jacket
    # Buy another item
    Go to Sauce Labs Onesie detail page
    Buy Item at detail page
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    5
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    5
    # Verify item in cart
    Verify Fifth item in cart    ${ITEMS}[4]    ${ITEM5_DESC}    ${ITEMS_PRICE}[4]
    Verify Remove button of Sauce Labs Onesie
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Onesie
    # Buy another item
    Go to Test.allTheThings() T-Shirt (Red) detail page
    Buy Item at detail page
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    6
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    6
    # Verify item in cart
    Verify Sixth item in cart    ${ITEMS}[5]    ${ITEM6_DESC}    ${ITEMS_PRICE}[5]
    Verify Remove button of Test.allTheThings() T-Shirt (Red)
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Test.allTheThings() T-Shirt (Red)
    # Logout
    Logout the page
    Close Browser

Verify Cart will be update when buy items with problem user
    Open Browser to Login
    # Login
    Login with problem user
    Maximize Browser Window
    # Buy an item
    Buy Sauce Labs Backpack
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    1
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    1
    # Verify item in cart
    Verify First item in cart    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Backpack
    # Buy another item
    Buy Sauce Labs Bike Light
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    2
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    2
    # Verify item in cart
    Verify Second item in cart    ${ITEMS}[1]    ${ITEM2_DESC}    ${ITEMS_PRICE}[1]
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Bike Light
    # Buy another item (broken item)
    Buy Sauce Labs Bolt T-Shirt (problem user)
    # Cart icon should appear the number of items in the cart is not changed
    Cart Item Quantity    2
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart not changed at cart page
    Cart Item Quantity    2
    # Verify item in cart
    Verify Broken item in cart    ${ITEMS}[2]    ${ITEM3_DESC}    ${ITEMS_PRICE}[2]
    # Back to products page
    Continue Shopping
    # Buy another item (Broken item)
    Buy Sauce Labs Fleece Jacket (problem user)
    # Cart icon should appear the number of items in the cart is not changed
    Cart Item Quantity    2
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart is not changed at cart page
    Cart Item Quantity    2
    # Verify item in cart
    Verify Broken item in cart    ${ITEMS}[3]    ${ITEM4_DESC}    ${ITEMS_PRICE}[3]
    # Back to products page
    Continue Shopping
    # Buy another item
    Buy Sauce Labs Onesie
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    3
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    3
    # Verify item in cart
    Verify Third item in cart    ${ITEMS}[4]    ${ITEM5_DESC}    ${ITEMS_PRICE}[4]
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Onesie
    # Buy another item
    Buy Test.allTheThings() T-Shirt (Red) (problem user)
    # Cart icon should appear the number of items in the cart is not changed
    Cart Item Quantity    3
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart is not changed at cart page
    Cart Item Quantity    3
    # Verify item in cart
    Verify Broken item in cart   ${ITEMS}[5]    ${ITEM6_DESC}    ${ITEMS_PRICE}[5]
    # Back to products page
    Continue Shopping
    # Logout
    Logout the page
    Close Browser

Verify Cart will be update when buy items at theirs detail page with problem user
    Open Browser to Login
    # Login
    Login with problem user
    Maximize Browser Window
    # Buy an item
    Go to Sauce Labs Backpack detail page
    Buy Item at detail page (problem user)
    # Cart icon should not appear any number
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span
    # Go to Cart page
    Go to cart
    # Cart icon should not appear any number at the cart page
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span
    # Verify item in cart
    Verify Item not existing in cart    ${ITEMS}[0]    ${ITEM1_DESC}
    # Back to products page, verify add to cart button still visible
    Continue Shopping
    Verify Add button of Sauce Labs Backpack
    # Buy another item
    Go to Sauce Labs Bike Light detail page
    Buy Item at detail page (problem user)
    # Cart icon should not appear any number
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span
    # Go to Cart page
    Go to cart
    # Cart icon should not appear any number at the cart page
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span
    # Verify item in cart
    Verify Item not existing in cart    ${ITEMS}[1]    ${ITEM2_DESC}
    # Back to products page, verify add button still visible
    Continue Shopping
    Verify Add button of Sauce Labs Bike Light
    # Buy another item 
    Go to Sauce Labs Bolt T-Shirt detail page
    Buy Item at detail page
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    1
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    1
    # Verify item in cart
    Verify Broken item in cart    ${ITEMS}[2]    ${ITEM3_DESC}    ${ITEMS_PRICE}[2]
    # Item should not add correctly, add another item instead
    Verify First item in cart    ${ITEMS}[4]    ${ITEM5_DESC}    ${ITEMS_PRICE}[4]
    # Back to products page
    Continue Shopping
    Verify Add button of Sauce Labs Bolt T-Shirt
    Verify Remove button of Sauce Labs Onesie
    # Buy another item 
    Go to Sauce Labs Onesie detail page
    Buy Item at detail page (problem user)
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    1
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    1
    # Verify item in cart
    Verify Broken item in cart    ${ITEMS}[3]    ${ITEM4_DESC}    ${ITEMS_PRICE}[3]
    # Back to products page
    Continue Shopping
    # Buy another item
    Go to Test.allTheThings() T-Shirt (Red) detail page
    Buy Item at detail page
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    2
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    2
    # Verify item in cart
    Verify Second item in cart    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    # Back to products page, verify add button still visible
    Continue Shopping
    Verify Add button of Test.allTheThings() T-Shirt (Red)
    Verify Remove button of Sauce Labs Backpack
    # Logout
    Logout the page
    Close Browser

Verify Cart will be update when buy a broken item at theirs detail page with problem user
    Open Browser to Login
    # Login
    Login with problem user
    Maximize Browser Window
    # Buy a broken item at detail page
    Go to Sauce Labs Fleece Jacket detail page
    Buy Item at detail page
    # Cart icon appear number item in cart
    Cart Item Quantity    1
    # Go to Cart page
    Click Element    xpath://*[@id="shopping_cart_container"]/a
    # Verify Error Page
    Page Should Not Contain    Your Cart
    Element Should Not Be Visible    id:shopping_cart_container
    Capture Page Screenshot
    Close Browser

Verify Cart will be update when buy items with error user
    Open Browser to Login
    # Login
    Login with error user
    Maximize Browser Window
    # Buy an item
    Buy Sauce Labs Backpack
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    1
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    1
    # Verify item in cart
    Verify First item in cart    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Backpack
    # Buy another item
    Buy Sauce Labs Bike Light
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    2
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    2
    # Verify item in cart
    Verify Second item in cart    ${ITEMS}[1]    ${ITEM2_DESC}    ${ITEMS_PRICE}[1]
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Bike Light
    # Buy another item (broken item)
    Buy Sauce Labs Bolt T-Shirt (problem user)
    # Cart icon should appear the number of items in the cart is not changed
    Cart Item Quantity    2
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart not changed at cart page
    Cart Item Quantity    2
    # Verify item in cart
    Verify Broken item in cart    ${ITEMS}[2]    ${ITEM3_DESC}    ${ITEMS_PRICE}[2]
    # Back to products page
    Continue Shopping
    # Buy another item (Broken item)
    Buy Sauce Labs Fleece Jacket (problem user)
    # Cart icon should appear the number of items in the cart is not changed
    Cart Item Quantity    2
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart is not changed at cart page
    Cart Item Quantity    2
    # Verify item in cart
    Verify Broken item in cart    ${ITEMS}[3]    ${ITEM4_DESC}    ${ITEMS_PRICE}[3]
    # Back to products page
    Continue Shopping
    # Buy another item
    Buy Sauce Labs Onesie
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    3
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    3
    # Verify item in cart
    Verify Third item in cart    ${ITEMS}[4]    ${ITEM5_DESC}    ${ITEMS_PRICE}[4]
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Onesie
    # Buy another item
    Buy Test.allTheThings() T-Shirt (Red) (problem user)
    # Cart icon should appear the number of items in the cart is not changed
    Cart Item Quantity    3
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart is not changed at cart page
    Cart Item Quantity    3
    # Verify item in cart
    Verify Broken item in cart   ${ITEMS}[5]    ${ITEM6_DESC}    ${ITEMS_PRICE}[5]
    # Back to products page
    Continue Shopping
    # Logout
    Logout the page
    Close Browser

Verify Cart will be update when buy items at theirs detail page with error user
    Open Browser to Login
    # Login
    Login with error user
    Maximize Browser Window
    # Buy an item
    Go to Sauce Labs Backpack detail page
    Buy Item at detail page
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    1
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    1
    # Verify item in cart
    Verify First item in cart    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Backpack
    # Buy another item
    Go to Sauce Labs Bike Light detail page
    Buy Item at detail page
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    2
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    2
    # Verify item in cart
    Verify Second item in cart    ${ITEMS}[1]    ${ITEM2_DESC}    ${ITEMS_PRICE}[1]
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Bike Light
    # Buy another item (broken item)
    Go to Sauce Labs Bolt T-Shirt detail page
    Buy Item at detail page (problem user)
    # Cart icon should appear the number of items in the cart is not changed
    Cart Item Quantity    2
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart not changed at cart page
    Cart Item Quantity    2
    # Verify item not in cart
    Verify Broken item in cart   ${ITEMS}[2]    ${ITEM3_DESC}    ${ITEMS_PRICE}[2]
    # Back to products page, verify add button still visible
    Continue Shopping
    Verify Add button of Sauce Labs Bolt T-Shirt
    # Buy another item (Broken item)
    Go to Sauce Labs Fleece Jacket detail page
    Buy Item at detail page (problem user)
    # Cart icon should appear the number of items in the cart is not changed
    Cart Item Quantity    2
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart is not changed at cart page
    Cart Item Quantity    2
    # Verify item not in cart
    Verify Broken item in cart    ${ITEMS}[3]    ${ITEM4_DESC}    ${ITEMS_PRICE}[3]
    # Back to products page, verify add button still visible
    Continue Shopping
    Verify Add button of Sauce Labs Fleece Jacket 
    # Buy another item
    Go to Sauce Labs Onesie detail page
    Buy Item at detail page
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    3
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    3
    # Verify item in cart
    Verify Third item in cart    ${ITEMS}[4]    ${ITEM5_DESC}    ${ITEMS_PRICE}[4]
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Onesie
    # Buy another item
    Go to Test.allTheThings() T-Shirt (Red) detail page
    Buy Item at detail page (problem user)
    # Cart icon should appear the number of items in the cart is not changed
    Cart Item Quantity    3
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart is not changed at cart page
    Cart Item Quantity    3
    # Verify item in cart
    Verify Broken item in cart   ${ITEMS}[5]    ${ITEM6_DESC}    ${ITEMS_PRICE}[5]
    # Back to products page
    Continue Shopping
    Verify Add button of Test.allTheThings() T-Shirt (Red)
    # Logout
    Logout the page
    Close Browser

Verify Cart will be update when buy items with performance glitch user
    Open Browser to Login
    # Login
    Login with performance glitch user
    Maximize Browser Window
    # Buy an item
    Buy Sauce Labs Backpack
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    1
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    1
    # Verify item in cart
    Verify First item in cart    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    # Back to products page, verify remove button still visible
    Continue Shopping
    Sleep    3
    Verify Remove button of Sauce Labs Backpack
    # Buy another item
    Buy Sauce Labs Bike Light
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    2
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    2
    # Verify item in cart
    Verify Second item in cart    ${ITEMS}[1]    ${ITEM2_DESC}    ${ITEMS_PRICE}[1]
    # Back to products page, verify remove button still visible
    Continue Shopping
    Sleep    3
    Verify Remove button of Sauce Labs Bike Light
    # Buy another item
    Buy Sauce Labs Bolt T-Shirt
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    3
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    3
    # Verify item in cart
    Verify Third item in cart    ${ITEMS}[2]    ${ITEM3_DESC}    ${ITEMS_PRICE}[2]
    # Back to products page, verify remove button still visible
    Continue Shopping
    Sleep    3
    Verify Remove button of Sauce Labs Bolt T-Shirt
    # Buy another item
    Buy Sauce Labs Fleece Jacket
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    4
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    4
    # Verify item in cart
    Verify Fourth item in cart    ${ITEMS}[3]    ${ITEM4_DESC}    ${ITEMS_PRICE}[3]
    # Back to products page, verify remove button still visible
    Continue Shopping
    Sleep    3
    Verify Remove button of Sauce Labs Fleece Jacket
    # Buy another item
    Buy Sauce Labs Onesie
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    5
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    5
    # Verify item in cart
    Verify Fifth item in cart    ${ITEMS}[4]    ${ITEM5_DESC}    ${ITEMS_PRICE}[4]
    # Back to products page, verify remove button still visible
    Continue Shopping
    Sleep    3
    Verify Remove button of Sauce Labs Onesie
    # Buy another item
    Buy Test.allTheThings() T-Shirt (Red)
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    6
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    6
    # Verify item in cart
    Verify Sixth item in cart    ${ITEMS}[5]    ${ITEM6_DESC}    ${ITEMS_PRICE}[5]
    # Back to products page, verify remove button still visible
    Continue Shopping
    Sleep    3
    Verify Remove button of Test.allTheThings() T-Shirt (Red)
    # Logout
    Logout the page
    Close Browser

Verify Cart will be update when buy items at theirs detail page with performance glitch user
    Open Browser to Login
    # Login
    Login with performance glitch user
    Maximize Browser Window
    # Buy an item
    Go to Sauce Labs Backpack detail page
    Buy Item at detail page
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    1
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    1
    # Verify item in cart
    Verify First item in cart    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    Verify Remove button of Sauce Labs Backpack
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Backpack
    # Buy another item
    Go to Sauce Labs Bike Light detail page
    Buy Item at detail page
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    2
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    2
    # Verify item in cart
    Verify Second item in cart    ${ITEMS}[1]    ${ITEM2_DESC}    ${ITEMS_PRICE}[1]
    Verify Remove button of Sauce Labs Bike Light
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Bike Light
    # Buy another item
    Go to Sauce Labs Bolt T-Shirt detail page
    Buy Item at detail page
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    3
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    3
    # Verify item in cart
    Verify Third item in cart    ${ITEMS}[2]    ${ITEM3_DESC}    ${ITEMS_PRICE}[2]
    Verify Remove button of Sauce Labs Bolt T-Shirt
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Bolt T-Shirt
    # Buy another item
    Go to Sauce Labs Fleece Jacket detail page
    Buy Item at detail page
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    4
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    4
    # Verify item in cart
    Verify Fourth item in cart    ${ITEMS}[3]    ${ITEM4_DESC}    ${ITEMS_PRICE}[3]
    Verify Remove button of Sauce Labs Fleece Jacket
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Fleece Jacket
    # Buy another item
    Go to Sauce Labs Onesie detail page
    Buy Item at detail page
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    5
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    5
    # Verify item in cart
    Verify Fifth item in cart    ${ITEMS}[4]    ${ITEM5_DESC}    ${ITEMS_PRICE}[4]
    Verify Remove button of Sauce Labs Onesie
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Onesie
    # Buy another item
    Go to Test.allTheThings() T-Shirt (Red) detail page
    Buy Item at detail page
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    6
    # Go to Cart page
    Go to cart
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    6
    # Verify item in cart
    Verify Sixth item in cart    ${ITEMS}[5]    ${ITEM6_DESC}    ${ITEMS_PRICE}[5]
    Verify Remove button of Test.allTheThings() T-Shirt (Red)
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Test.allTheThings() T-Shirt (Red)
    # Logout
    Logout the page
    Close Browser

Verify Cart will be update when buy items with visual user
    Open Browser to Login
    # Login
    Login with visual user
    Maximize Browser Window
    # Verify the location of cart icon change
    Verify Cart Icon position changed
    # Buy an item
    Buy Sauce Labs Backpack
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    1
    # Go to Cart page
    Go to cart
    # Verify change of the visual
    Verify Cart Icon position changed
    Verify Checkout button position changed
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    1
    # Verify item in cart
    Verify First item in cart    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    Verify Remove button of Sauce Labs Backpack
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Backpack
    # Buy another item
    Buy Sauce Labs Bike Light
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    2
    # Go to Cart page
    Go to cart
    # Verify change of the visual
    Verify Cart Icon position changed
    Verify Checkout button position changed
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    2
    # Verify item in cart
    Verify Second item in cart    ${ITEMS}[1]    ${ITEM2_DESC}    ${ITEMS_PRICE}[1]
    Verify Remove button of Sauce Labs Bike Light
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Bike Light
    # Buy another item
    Buy Sauce Labs Bolt T-Shirt
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    3
    # Go to Cart page
    Go to cart
    # Verify change of the visual
    Verify Cart Icon position changed
    Verify Checkout button position changed
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    3
    # Verify item in cart
    Verify Third item in cart    ${ITEMS}[2]    ${ITEM3_DESC}    ${ITEMS_PRICE}[2]
    Verify Remove button of Sauce Labs Bolt T-Shirt
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Bolt T-Shirt
    # Buy another item
    Buy Sauce Labs Fleece Jacket
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    4
    # Go to Cart page
    Go to cart
    # Verify change of the visual
    Verify Cart Icon position changed
    Verify Checkout button position changed
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    4
    # Verify item in cart
    Verify Fourth item in cart    ${ITEMS}[3]    ${ITEM4_DESC}    ${ITEMS_PRICE}[3]
    Verify Remove button of Sauce Labs Fleece Jacket
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Fleece Jacket
    # Buy another item
    Buy Sauce Labs Onesie
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    5
    # Go to Cart page
    Go to cart
    # Verify change of the visual
    Verify Cart Icon position changed
    Verify Checkout button position changed
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    5
    # Verify item in cart
    Verify Fifth item in cart    ${ITEMS}[4]    ${ITEM5_DESC}    ${ITEMS_PRICE}[4]
    Verify Remove button of Sauce Labs Onesie
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Onesie
    # Buy another item
    Buy Test.allTheThings() T-Shirt (Red)
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    6
    # Go to Cart page
    Go to cart
    # Verify change of the visual
    Verify Cart Icon position changed
    Verify Checkout button position changed
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    6
    # Verify item in cart
    Verify Sixth item in cart    ${ITEMS}[5]    ${ITEM6_DESC}    ${ITEMS_PRICE}[5]
    Verify Remove button of Test.allTheThings() T-Shirt (Red)
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Test.allTheThings() T-Shirt (Red)
    # Logout
    Logout the page
    Close Browser

Verify Cart will be update when buy items at theirs detail page with visual user
    Open Browser to Login
    # Login
    Login with visual user
    Maximize Browser Window
    # Buy an item, verify visual change
    Go to Sauce Labs Backpack detail page
    Verify Cart Icon position changed
    Buy Item at detail page
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    1
    # Go to Cart page
    Go to cart
    # Verify change of the visual
    Verify Cart Icon position changed
    Verify Checkout button position changed
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    1
    # Verify item in cart
    Verify First item in cart    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    Verify Remove button of Sauce Labs Backpack
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Backpack
    # Buy another item
    Go to Sauce Labs Bike Light detail page
    Verify Cart Icon position changed
    Buy Item at detail page
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    2
    # Go to Cart page
    Go to cart
    # Verify change of the visual
    Verify Cart Icon position changed
    Verify Checkout button position changed
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    2
    # Verify item in cart
    Verify Second item in cart    ${ITEMS}[1]    ${ITEM2_DESC}    ${ITEMS_PRICE}[1]
    Verify Remove button of Sauce Labs Bike Light
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Bike Light
    # Buy another item
    Go to Sauce Labs Bolt T-Shirt detail page
    Verify Cart Icon position changed
    Buy Item at detail page
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    3
    # Go to Cart page
    Go to cart
    # Verify change of the visual
    Verify Cart Icon position changed
    Verify Checkout button position changed
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    3
    # Verify item in cart
    Verify Third item in cart    ${ITEMS}[2]    ${ITEM3_DESC}    ${ITEMS_PRICE}[2]
    Verify Remove button of Sauce Labs Bolt T-Shirt
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Bolt T-Shirt
    # Buy another item
    Go to Sauce Labs Fleece Jacket detail page
    Verify Cart Icon position changed
    Buy Item at detail page
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    4
    # Go to Cart page
    Go to cart
    # Verify change of the visual
    Verify Cart Icon position changed
    Verify Checkout button position changed
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    4
    # Verify item in cart
    Verify Fourth item in cart    ${ITEMS}[3]    ${ITEM4_DESC}    ${ITEMS_PRICE}[3]
    Verify Remove button of Sauce Labs Fleece Jacket
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Fleece Jacket
    # Buy another item
    Go to Sauce Labs Onesie detail page
    Verify Cart Icon position changed
    Buy Item at detail page
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    5
    # Go to Cart page
    Go to cart
    # Verify change of the visual
    Verify Cart Icon position changed
    Verify Checkout button position changed
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    5
    # Verify item in cart
    Verify Fifth item in cart    ${ITEMS}[4]    ${ITEM5_DESC}    ${ITEMS_PRICE}[4]
    Verify Remove button of Sauce Labs Onesie
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Sauce Labs Onesie
    # Buy another item
    Go to Test.allTheThings() T-Shirt (Red) detail page
    Verify Cart Icon position changed
    Buy Item at detail page
    # Cart icon should appear the number of items in the cart
    Cart Item Quantity    6
    # Go to Cart page
    Go to cart
    # Verify change of the visual
    Verify Cart Icon position changed
    Verify Checkout button position changed
    # Cart icon should appear the number of items in the cart at cart page
    Cart Item Quantity    6
    # Verify item in cart
    Verify Sixth item in cart    ${ITEMS}[5]    ${ITEM6_DESC}    ${ITEMS_PRICE}[5]
    Verify Remove button of Test.allTheThings() T-Shirt (Red)
    # Back to products page, verify remove button still visible
    Continue Shopping
    Verify Remove button of Test.allTheThings() T-Shirt (Red)
    # Logout
    Logout the page
    Close Browser

Verify Cart will be update when remove items at the cart page with standard user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with standard user
    # Buy all items
    Buy All Items
    # Remove each item in cart and verify update cart
    Verify Update Cart when remove each item at cart page
    # Logout
    Logout the page
    Close Browser

Verify Cart will be update when remove items at the product page with standard user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with standard user
    # Buy all items
    Buy All Items
    # Remove each items at product page and verify update cart
    Verify Update Cart when remove each item at product page
    # Logout
    Logout the page
    Close Browser

Verify Cart will be update when remove items at theirs detail page with standard user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with standard user
    # Buy all items
    Buy All Items
    # Remove each items at detail page and verify update cart
    Verify Update Cart when remove each item at detail page
    # Logout
    Logout the page
    Close Browser


Verify Cart will be update when remove items at the cart page with performance glitch user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with performance glitch user
    # Buy all items
    Buy All Items
    # Remove each item in cart and verify update cart
    Verify Update Cart when remove each item at cart page
    # Logout
    Logout the page
    Close Browser

Verify Cart will be update when remove items at the product page with performance glitch user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with performance glitch user
    # Buy all items
    Buy All Items
    # Remove each items at product page and verify update cart
    Verify Update Cart when remove each item at product page
    # Logout
    Logout the page
    Close Browser

Verify Cart will be update when remove items at theirs detail page with performance glitch user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with performance glitch user
    # Buy all items
    Buy All Items
    # Remove each items at detail page and verify update cart
    Verify Update Cart when remove each item at detail page
    # Logout
    Logout the page
    Close Browser

Verify Cart will be update when remove items at the cart page with visual user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with visual user
    # Buy all items
    Buy All Items
    # Remove each item in cart and verify update cart
    Verify Update Cart when remove each item at cart page
    # Logout
    Logout the page
    Close Browser

Verify Cart will be update when remove items at the product page with visual user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with visual user
    # Buy all items
    Buy All Items
    # Remove each items at product page and verify update cart
    Verify Update Cart when remove each item at product page
    # Logout
    Logout the page
    Close Browser

Verify Cart will be update when remove items at theirs detail page with visual user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with visual user
    # Buy all items
    Buy All Items
    # Remove each items at detail page and verify update cart
    Verify Update Cart when remove each item at detail page
    # Logout
    Logout the page
    Close Browser


Verify Cart will be update when remove items at the cart page with problem user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with problem user
    # Buy all items (contain broken items)
    Buy All Items (problem user)
    # Verify cart will only contain item not broken
    Go to cart
    Verify First item in cart    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    Verify Second item in cart    ${ITEMS}[1]    ${ITEM2_DESC}    ${ITEMS_PRICE}[1]
    Verify Third item in cart    ${ITEMS}[4]    ${ITEM5_DESC}    ${ITEMS_PRICE}[4]
    Verify Broken item in cart    ${ITEMS}[2]    ${ITEM3_DESC}    ${ITEMS_PRICE}[2]
    Verify Broken item in cart    ${ITEMS}[3]    ${ITEM4_DESC}    ${ITEMS_PRICE}[3]
    Verify Broken item in cart    ${ITEMS}[5]    ${ITEM6_DESC}    ${ITEMS_PRICE}[5]
    # Remove each item in cart and cart will be updated
    Verify Update Cart when remove each item at cart page (problem user)
    # Logout
    Logout the page
    Close Browser

Verify Cart will be update when remove items at the product page with problem user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with problem user
    # Buy all items (contain broken items)
    Buy All Items (problem user)
    # Verify cart will only contain item not broken
    Go to cart
    Verify First item in cart    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    Verify Second item in cart    ${ITEMS}[1]    ${ITEM2_DESC}    ${ITEMS_PRICE}[1]
    Verify Third item in cart    ${ITEMS}[4]    ${ITEM5_DESC}    ${ITEMS_PRICE}[4]
    Verify Broken item in cart    ${ITEMS}[2]    ${ITEM3_DESC}    ${ITEMS_PRICE}[2]
    Verify Broken item in cart    ${ITEMS}[3]    ${ITEM4_DESC}    ${ITEMS_PRICE}[3]
    Verify Broken item in cart    ${ITEMS}[5]    ${ITEM6_DESC}    ${ITEMS_PRICE}[5]
    Continue Shopping
    # Remove each items at product page and verify update cart
    Verify Update Cart when remove each item at product page (problem user)
    # Logout
    Logout the page
    Close Browser

Verify Cart will be update when remove items at theirs detail page with problem user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with problem user
    # Buy all items
    Buy All Items (problem user)
    # Verify cart will only contain item not broken
    Go to cart
    Verify First item in cart    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    Verify Second item in cart    ${ITEMS}[1]    ${ITEM2_DESC}    ${ITEMS_PRICE}[1]
    Verify Third item in cart    ${ITEMS}[4]    ${ITEM5_DESC}    ${ITEMS_PRICE}[4]
    Verify Broken item in cart    ${ITEMS}[2]    ${ITEM3_DESC}    ${ITEMS_PRICE}[2]
    Verify Broken item in cart    ${ITEMS}[3]    ${ITEM4_DESC}    ${ITEMS_PRICE}[3]
    Verify Broken item in cart    ${ITEMS}[5]    ${ITEM6_DESC}    ${ITEMS_PRICE}[5]
    Continue Shopping
    # Remove each items at detail page and verify update cart
    Verify Update Cart when remove each item at detail page (problem user)
    # Logout
    Logout the page
    Close Browser

Verify Cart will be update when remove items at the cart page with error user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with error user
    # Buy all items (contain broken items)
    Buy All Items (problem user)
    # Verify cart will only contain item not broken
    Go to cart
    Verify First item in cart    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    Verify Second item in cart    ${ITEMS}[1]    ${ITEM2_DESC}    ${ITEMS_PRICE}[1]
    Verify Third item in cart    ${ITEMS}[4]    ${ITEM5_DESC}    ${ITEMS_PRICE}[4]
    Verify Broken item in cart    ${ITEMS}[2]    ${ITEM3_DESC}    ${ITEMS_PRICE}[2]
    Verify Broken item in cart    ${ITEMS}[3]    ${ITEM4_DESC}    ${ITEMS_PRICE}[3]
    Verify Broken item in cart    ${ITEMS}[5]    ${ITEM6_DESC}    ${ITEMS_PRICE}[5]
    # Remove each item in cart and cart will be updated
    Verify Update Cart when remove each item at cart page (problem user)
    # Logout
    Logout the page
    Close Browser

Verify Cart will be update when remove items at the product page with error user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with error user
    # Buy all items (contain broken items)
    Buy All Items (problem user)
    # Verify cart will only contain item not broken
    Go to cart
    Verify First item in cart    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    Verify Second item in cart    ${ITEMS}[1]    ${ITEM2_DESC}    ${ITEMS_PRICE}[1]
    Verify Third item in cart    ${ITEMS}[4]    ${ITEM5_DESC}    ${ITEMS_PRICE}[4]
    Verify Broken item in cart    ${ITEMS}[2]    ${ITEM3_DESC}    ${ITEMS_PRICE}[2]
    Verify Broken item in cart    ${ITEMS}[3]    ${ITEM4_DESC}    ${ITEMS_PRICE}[3]
    Verify Broken item in cart    ${ITEMS}[5]    ${ITEM6_DESC}    ${ITEMS_PRICE}[5]
    Continue Shopping
    # Remove each items at product page and verify update cart
    Verify Update Cart when remove each item at product page (problem user)
    # Logout
    Logout the page
    Close Browser

Verify Cart will be update when remove items at theirs detail page with error user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with error user
    # Buy all items
    Buy All Items (problem user)
    # Verify cart will only contain item not broken
    Go to cart
    Verify First item in cart    ${ITEMS}[0]    ${ITEM1_DESC}    ${ITEMS_PRICE}[0]
    Verify Second item in cart    ${ITEMS}[1]    ${ITEM2_DESC}    ${ITEMS_PRICE}[1]
    Verify Third item in cart    ${ITEMS}[4]    ${ITEM5_DESC}    ${ITEMS_PRICE}[4]
    Verify Broken item in cart    ${ITEMS}[2]    ${ITEM3_DESC}    ${ITEMS_PRICE}[2]
    Verify Broken item in cart    ${ITEMS}[3]    ${ITEM4_DESC}    ${ITEMS_PRICE}[3]
    Verify Broken item in cart    ${ITEMS}[5]    ${ITEM6_DESC}    ${ITEMS_PRICE}[5]
    Continue Shopping
    # Remove each items at detail page and verify update cart
    Verify Update Cart when remove each item at detail page (error user)
    # Logout
    Logout the page
    Close Browser