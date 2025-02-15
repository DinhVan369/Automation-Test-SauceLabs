*** Settings ***
Resource    ../resources.robot


*** Test Cases ***
Verify Buy Items with standard user
    Open Browser to Login
    Maximize Browser Window
    Login with standard user
    # Cart icon number should not be appeard
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span
    # Add each item and verify the change of number in cart (cart icon number change)
    Buy Sauce Labs Backpack
    Cart Item Quantity    1
    Buy Sauce Labs Bike Light
    Cart Item Quantity    2
    Buy Sauce Labs Bolt T-Shirt
    Cart Item Quantity    3
    Buy Sauce Labs Fleece Jacket
    Cart Item Quantity    4
    Buy Sauce Labs Onesie
    Cart Item Quantity    5
    Buy Test.allTheThings() T-Shirt (Red)
    Cart Item Quantity    6
    Close Browser

Verify Buy Items at detail page with standard user
    Open Browser to Login
    Maximize Browser Window
    Login with standard user
    # Cart icon number should not be appeard
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span
    # Add each item and verify the change of number in cart (cart icon number change)
    Go to Sauce Labs Backpack detail page
    Buy Item at detail page
    Cart Item Quantity    1
    Click Back to Products
    Cart Item Quantity    1
    Verify Remove button of Sauce Labs Backpack
    # Add another item
    Go to Sauce Labs Bike Light detail page
    Buy Item at detail page
    Cart Item Quantity    2
    Click Back to Products
    Cart Item Quantity    2
    Verify Remove button of Sauce Labs Bike Light
    # Add another item
    Go to Sauce Labs Bolt T-Shirt detail page
    Buy Item at detail page
    Cart Item Quantity    3
    Click Back to Products
    Cart Item Quantity    3
    Verify Remove button of Sauce Labs Bolt T-Shirt
    # Add another item
    Go to Sauce Labs Fleece Jacket detail page
    Buy Item at detail page
    Cart Item Quantity    4
    Click Back to Products
    Cart Item Quantity    4
    Verify Remove button of Sauce Labs Fleece Jacket
    # Add another item
    Go to Sauce Labs Onesie detail page
    Buy Item at detail page
    Cart Item Quantity    5
    Click Back to Products
    Cart Item Quantity    5
    Verify Remove button of Sauce Labs Onesie
    # Add another item
    Go to Test.allTheThings() T-Shirt (Red) detail page
    Buy Item at detail page
    Cart Item Quantity    6
    Click Back to Products
    Cart Item Quantity    6
    # Close
    Close Browser


Verify Buy Items with performance glitch user
    Open Browser to Login
    Maximize Browser Window
    Login with performance glitch user
    # Cart icon number should not be appeard
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span
    # Add each item and verify the change of number in cart (cart icon number change)
    Buy Sauce Labs Backpack
    Cart Item Quantity    1
    Buy Sauce Labs Bike Light
    Cart Item Quantity    2
    Buy Sauce Labs Bolt T-Shirt
    Cart Item Quantity    3
    Buy Sauce Labs Fleece Jacket
    Cart Item Quantity    4
    Buy Sauce Labs Onesie
    Cart Item Quantity    5
    Buy Test.allTheThings() T-Shirt (Red)
    Cart Item Quantity    6
    Close Browser

Verify Buy Items at detail page with performance glitch user
    Open Browser to Login
    Maximize Browser Window
    Login with performance glitch user
    # Cart icon number should not be appeard
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span
    # Add each item and verify the change of number in cart (cart icon number change)
    Go to Sauce Labs Backpack detail page
    Buy Item at detail page
    Cart Item Quantity    1
    Click Back to Products
    Cart Item Quantity    1
    Verify Remove button of Sauce Labs Backpack
    # Add another item
    Go to Sauce Labs Bike Light detail page
    Buy Item at detail page
    Cart Item Quantity    2
    Click Back to Products
    Cart Item Quantity    2
    Verify Remove button of Sauce Labs Bike Light
    # Add another item
    Go to Sauce Labs Bolt T-Shirt detail page
    Buy Item at detail page
    Cart Item Quantity    3
    Click Back to Products
    Cart Item Quantity    3
    Verify Remove button of Sauce Labs Bolt T-Shirt
    # Add another item
    Go to Sauce Labs Fleece Jacket detail page
    Buy Item at detail page
    Cart Item Quantity    4
    Click Back to Products
    Cart Item Quantity    4
    Verify Remove button of Sauce Labs Fleece Jacket
    # Add another item
    Go to Sauce Labs Onesie detail page
    Buy Item at detail page
    Cart Item Quantity    5
    Click Back to Products
    Cart Item Quantity    5
    Verify Remove button of Sauce Labs Onesie
    # Add another item
    Go to Test.allTheThings() T-Shirt (Red) detail page
    Buy Item at detail page
    Cart Item Quantity    6
    Click Back to Products
    Cart Item Quantity    6
    # Close
    Close Browser

Verify Buy Items with visual user
    Open Browser to Login
    Maximize Browser Window
    Login with visual user
    # Verify visual change
    Verify Cart Icon position changed
    # Cart icon number should not be appeard
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span
    # Add each item and verify the change of number in cart (cart icon number change)
    Buy Sauce Labs Backpack
    Cart Item Quantity    1
    Buy Sauce Labs Bike Light
    Cart Item Quantity    2
    Buy Sauce Labs Bolt T-Shirt
    Cart Item Quantity    3
    Buy Sauce Labs Fleece Jacket
    Cart Item Quantity    4
    Buy Sauce Labs Onesie
    Cart Item Quantity    5
    Buy Test.allTheThings() T-Shirt (Red)
    Cart Item Quantity    6
    Close Browser

Verify Buy Items at detail page with visual user
    Open Browser to Login
    Maximize Browser Window
    Login with visual user
    # Verify visual change at product page
    Verify Cart Icon position changed
    # Cart icon number should not be appeard
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span
    # Add each item and verify the change of number in cart (cart icon number change)
    Go to Sauce Labs Backpack detail page
    # Verify visual change at detail page
    Verify Cart Icon position changed
    Buy Item at detail page
    Cart Item Quantity    1
    Click Back to Products
    # Verify visual change at product page
    Verify Cart Icon position changed
    Cart Item Quantity    1
    Verify Remove button of Sauce Labs Backpack
    # Add another item
    Go to Sauce Labs Bike Light detail page
    # Verify visual change at detail page
    Verify Cart Icon position changed
    Buy Item at detail page
    Cart Item Quantity    2
    Click Back to Products
    # Verify visual change at product page
    Verify Cart Icon position changed
    Cart Item Quantity    2
    Verify Remove button of Sauce Labs Bike Light
    # Add another item
    Go to Sauce Labs Bolt T-Shirt detail page
    # Verify visual change at detail page
    Verify Cart Icon position changed
    Buy Item at detail page
    Cart Item Quantity    3
    Click Back to Products
    # Verify visual change at product page
    Verify Cart Icon position changed
    Cart Item Quantity    3
    Verify Remove button of Sauce Labs Bolt T-Shirt
    # Add another item
    Go to Sauce Labs Fleece Jacket detail page
    # Verify visual change at detail page
    Verify Cart Icon position changed
    Buy Item at detail page
    Cart Item Quantity    4
    Click Back to Products
    # Verify visual change at product page
    Verify Cart Icon position changed
    Cart Item Quantity    4
    Verify Remove button of Sauce Labs Fleece Jacket
    # Add another item
    Go to Sauce Labs Onesie detail page
    # Verify visual change at detail page
    Verify Cart Icon position changed
    Buy Item at detail page
    Cart Item Quantity    5
    Click Back to Products
    # Verify visual change at product page
    Verify Cart Icon position changed
    Cart Item Quantity    5
    Verify Remove button of Sauce Labs Onesie
    # Add another item
    Go to Test.allTheThings() T-Shirt (Red) detail page
    # Verify visual change at detail page
    Verify Cart Icon position changed
    Buy Item at detail page
    Cart Item Quantity    6
    Click Back to Products
    # Verify visual change at product page
    Verify Cart Icon position changed
    Cart Item Quantity    6
    # Close
    Close Browser


Verify Buy Items with problem user
    Open Browser to Login
    Maximize Browser Window
    Login with problem user
    # Cart icon number should not be appeard
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span
    # Add each item and verify the change of number in cart (cart icon number change)
    Buy Sauce Labs Backpack
    Cart Item Quantity    1
    Buy Sauce Labs Bike Light
    Cart Item Quantity    2
    # Buy broken item
    Buy Sauce Labs Bolt T-Shirt (problem user)
    # Cart number should not change
    Cart Item Quantity    2
    # Buy broken item
    Buy Sauce Labs Fleece Jacket (problem user)
    # Cart number should not change
    Cart Item Quantity    2
    Buy Sauce Labs Onesie
    Cart Item Quantity    3
    # Buy broken item
    Buy Test.allTheThings() T-Shirt (Red) (problem user)
    # Cart number should not change
    Cart Item Quantity    3
    Close Browser

Verify Buy Items at detail page with problem user
    Open Browser to Login
    Maximize Browser Window
    Login with problem user
    # Cart icon number should not be appeard
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span
    # Add each item and verify the change of number in cart (cart icon number change)
    Go to Sauce Labs Backpack detail page
    Buy Item at detail page (problem user)
    # Cart number should not change
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span
    Click Back to Products
    # Cart number should not change
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span
    Verify Add button of Sauce Labs Backpack
    # Add another item
    Go to Sauce Labs Bike Light detail page
    Buy Item at detail page (problem user)
    # Cart number should not change
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span
    Click Back to Products
    # Cart number should not change
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span
    Verify Add button of Sauce Labs Bike Light
    # Add another item
    Go to Sauce Labs Bolt T-Shirt detail page
    Buy Item at detail page
    Cart Item Quantity    1
    Click Back to Products
    Cart Item Quantity    1
    Verify Remove button of Sauce Labs Onesie
    # Add another item
    Go to Sauce Labs Fleece Jacket detail page
    Buy Item at detail page
    Cart Item Quantity    2
    Click Back to Products
    Cart Item Quantity    2
    Verify Add button of Sauce Labs Fleece Jacket
    # Add another item
    Go to Sauce Labs Onesie detail page
    Buy Item at detail page (problem user)
    # Cart icon number should not change
    Cart Item Quantity    2
    Click Back to Products
    Cart Item Quantity    2
    # Add another item
    Go to Test.allTheThings() T-Shirt (Red) detail page
    Buy Item at detail page
    Cart Item Quantity    3
    Click Back to Products
    Cart Item Quantity    3
    Verify Remove button of Sauce Labs Backpack
    # Close
    Close Browser

*** Test Cases ***
Verify Buy Items with error user
    Open Browser to Login
    Maximize Browser Window
    Login with error user
    # Cart icon number should not be appeard
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span
    # Add each item and verify the change of number in cart (cart icon number change)
    Buy Sauce Labs Backpack
    Cart Item Quantity    1
    Buy Sauce Labs Bike Light
    Cart Item Quantity    2
    # Buy broken item
    Buy Sauce Labs Bolt T-Shirt (problem user)
    # Cart number should not change
    Cart Item Quantity    2
    # Buy broken item
    Buy Sauce Labs Fleece Jacket (problem user)
    # Cart number should not change
    Cart Item Quantity    2
    Buy Sauce Labs Onesie
    Cart Item Quantity    3
    # Buy broken item
    Buy Test.allTheThings() T-Shirt (Red) (problem user)
    # Cart number should not change
    Cart Item Quantity    3
    Close Browser

Verify Buy Items at detail page with error user
    Open Browser to Login
    Maximize Browser Window
    Login with error user
    # Cart icon number should not be appeard
    Element Should Not Be Visible    xpath://*[@id="shopping_cart_container"]/a/span
    # Add each item and verify the change of number in cart (cart icon number change)
    Go to Sauce Labs Backpack detail page
    Buy Item at detail page
    Cart Item Quantity    1
    Click Back to Products
    Cart Item Quantity    1
    Verify Remove button of Sauce Labs Backpack
    # Add another item
    Go to Sauce Labs Bike Light detail page
    Buy Item at detail page
    Cart Item Quantity    2
    Click Back to Products
    Cart Item Quantity    2
    Verify Remove button of Sauce Labs Bike Light
    # Add broken item
    Go to Sauce Labs Bolt T-Shirt detail page
    Buy Item at detail page (problem user)
    # Cart number should not change
    Cart Item Quantity    2
    Click Back to Products
    Cart Item Quantity    2
    Verify Add button of Sauce Labs Bolt T-Shirt
    # Add broken item
    Go to Sauce Labs Fleece Jacket detail page
    Buy Item at detail page (problem user)
    # Cart number should not change
    Cart Item Quantity    2
    Click Back to Products
    Cart Item Quantity    2
    Verify Add button of Sauce Labs Fleece Jacket
    # Add another item
    Go to Sauce Labs Onesie detail page
    Buy Item at detail page
    Cart Item Quantity    3
    Click Back to Products
    Cart Item Quantity    3
    Verify Remove button of Sauce Labs Onesie
    # Add broken item
    Go to Test.allTheThings() T-Shirt (Red) detail page
    Buy Item at detail page (problem user)
    # Cart number should not change
    Cart Item Quantity    3
    Click Back to Products
    Cart Item Quantity    3
    # Close
    Close Browser