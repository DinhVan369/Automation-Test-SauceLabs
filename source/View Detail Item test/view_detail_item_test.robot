*** Settings ***
Resource    ../resources.robot

*** Test Cases ***
Verify View all Items for standard user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with standard user
    # Get location of cart icon for later usage
    ${cart_icon}=    Get Cart Icon Position
    Log To Console    ${cart_icon}
    # Verify View All Items
    View all Items
    # Logout
    Logout the page
    Close Browser

Verify View all Items for problem user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with problem user
    # Verify View All Items
    View all Items (problem user)
    # Logout
    Logout the page
    Close Browser

Verify View all Items for performance glitch user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with performance glitch user
    # Verify View All Items
    View all Items (performance glitch user)
    # Logout
    Logout the page
    Close Browser

Verify View all Items for error user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with error user
    # Verify View All Items
    View all Items (error_user)
    # Logout
    Logout the page
    Close Browser

Verify View all Items for visual user
    Open Browser to Login
    Maximize Browser Window
    # Login
    Login with visual user
    # Verify the location of cart icon change
    ${visual_cart_icon}=    Get Cart Icon Position
    Should Not Be Equal    int(${cart_icon})    int(${visual_cart_icon})
    # Verify View All Items
    View all Items (visual user)
    # Logout
    Logout the page
    Close Browser



