*** Settings ***
Resource    ../resources.robot


*** Test Cases ***
Verify Login Page 
    Open Browser to Login
    Maximize Browser Window
    # Page should contain all elemnt at login page
    Verify Login Page
    Close Browser
Verify Login With standard user
    Open Browser to Login
    Login with standard user
    Close Browser

Verify Login With locked out user
    Open Browser to Login
    Login with locked out user
    Close Browser

Verify Login With problem user
    Open Browser to Login
    Login with problem user
    Close Browser

Verify Login With performance glitch user
    Open Browser to Login
    Login with performance glitch user
    Close Browser

Verify Login With error user
    Open Browser to Login
    Login with error user
    Close Browser

Verify Login With visual user
    Open Browser to Login
    Login with visual user
    Close Browser

Login With Wrong Username and Password
    Open Browser to Login
    # Login with username and password
    Input Text    id=user-name    wrong_user
    Input Text    id=password    wrong_password
    Click Button    css=.btn_action
    Sleep    2
    # Verify Error Message
    Page Should Contain    Epic sadface: Username and password do not match any user in this service
    Close Browser

Login With Wrong Username and Correct Password
    Open Browser to Login
    # Login with username and password
    Input Text    id=user-name    wrong_user
    Input Text    id=password    ${PASSWORD}
    Click Button    css=.btn_action
    Sleep    2
    # Verify Error Message
    Page Should Contain    Epic sadface: Username and password do not match any user in this service
    Close Browser

Login With Correct Username and Wrong Password
    Open Browser to Login
    # Login with username and password
    Input Text    id=user-name    ${STANDARD_USER}
    Input Text    id=password    wrong_password
    Click Button    css=.btn_action
    Sleep    2
    # Verify Error Message
    Page Should Contain    Epic sadface: Username and password do not match any user in this service
    Close Browser

Login With Empty Username and Password
    Open Browser to Login
    # Login with username and password
    Click Button    css=.btn_action
    Sleep    2
    # Verify Error Message
    Page Should Contain    Epic sadface: Username is required
    Close Browser

Login With Empty Username and Correct Password
    Open Browser to Login
    # Login with username and password
    Input Text    id=password    ${PASSWORD}
    Click Button    css=.btn_action
    Sleep    2
    # Verify Error Message
    Page Should Contain    Epic sadface: Username is required
    Close Browser

Login With Correct Username and Empty Password
    Open Browser to Login
    # Login with username and password
    Input Text    id=user-name    ${STANDARD_USER}
    Click Button    css=.btn_action
    Sleep    2
    # Verify Error Message
    Page Should Contain    Epic sadface: Password is required
    Close Browser

Login With Correct Username and Password but UPPERCASE Username
    Open Browser to Login
    # Login with username and password
    Input Text    id=user-name    STANDARD_USER
    Input Text    id=password    ${PASSWORD}
    Click Button    css=.btn_action
    Sleep    2
    # Verify Error Message
    Page Should Contain    Epic sadface: Username and password do not match any user in this service
    Close Browser

Login with Correct Username and Password but UPPERCASE Password
    Open Browser to Login
    # Login with username and password
    Input Text    id=user-name    ${STANDARD_USER}
    Input Text    id=password    SECRET_SAUCE
    Click Button    css=.btn_action
    Sleep    2
    # Verify Error Message
    Page Should Contain    Epic sadface: Username and password do not match any user in this service
    Close Browser

Login with very long Username
    Open Browser to Login
    # Login with username and password
    Input Text    id=user-name    qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnmmnbvcxzlkjhgfdsaopiuytrewqsd
    Input Text    id=password    ${PASSWORD}
    Click Button    css=.btn_action
    Sleep    2
    # Verify Error Message
    Page Should Contain    Epic sadface: Username and password do not match any user in this service
    Close Browser

Login with very long Password
    Open Browser to Login
    # Login with username and password
    Input Text    id=user-name    ${STANDARD_USER}
    Input Text    id=password    qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghjklzxcvbnmmnbvcxzlkjhgfdsaopiuytrewqsd
    Click Button    css=.btn_action
    Sleep    2
    # Verify Error Message
    Page Should Contain    Epic sadface: Username and password do not match any user in this service
    Close Browser

Login with special characters in Username
    Open Browser to Login
    # Login with username and password
    Input Text    id=user-name    !@#$%^&*()
    Input Text    id=password    ${PASSWORD}
    Click Button    css=.btn_action
    Sleep    2
    # Verify Error Message
    Page Should Contain    Epic sadface: Username and password do not match any user in this service
    Close Browser

Login with special characters in Password
    Open Browser to Login
    # Login with username and password
    Input Text    id=user-name    ${STANDARD_USER}
    Input Text    id=password    !@#$%^&*()
    Click Button    css=.btn_action
    Sleep    2
    # Verify Error Message
    Page Should Contain    Epic sadface: Username and password do not match any user in this service
    Close Browser

Login with Correct Username and Password but press Enter instead of click submit button
    Open Browser to Login
    # Login with username and password
    Input Text    id=user-name    ${STANDARD_USER}
    Input Text    id=password    ${PASSWORD}
    Press Keys    css=.btn_action    \13
    Sleep    2
    # Verify Error Message
    Page Should Contain    Products
    Logout the page
    Close Browser


Turn off Error Message
    Open Browser to Login
    # Login with username and password
    Input Text    id=user-name    wronguser
    Input Text    id=password    wrongpass
    Click Button    css=.btn_action
    Sleep    2
    # Verify Error Message
    Page Should Contain    Epic sadface: Username and password do not match any user in this service
    # Click turn off error message button
    Click Button    class:error-button
    Wait Until Element Is Not Visible    class:error-message-container error
    Page Should Not Contain    Epic sadface: Username and password do not match any user in this service
    Close Browser

#################################### Security Test ####################################
Login with SQL Injection
    Open Browser to Login
    # Login with username and password
    Input Text    id=user-name    ' OR '1'='1
    Input Text    id=password    ' OR '1'='1
    Click Button    css=.btn_action
    Sleep    2
    # Verify Error Message
    Page Should Contain    Epic sadface: Username and password do not match any user in this service
    Close Browser

Login with XXS 
    Open Browser to Login
    # Login with username and password
    Input Text    id=user-name    <script>alert('Hello')</script>
    Input Text    id=password    <script>alert('Hello')</script>
    Click Button    css=.btn_action
    Sleep    2
    # Verify Error Message
    Page Should Contain    Epic sadface: Username and password do not match any user in this service
    Close Browser

Verify Password type
    Open Browser to Login
    # Verify Password type
    Input Text    id=user-name    ${STANDARD_USER}
    Input Text    id=password    ${PASSWORD}
    Element Attribute Value Should Be  id=password    type    password
    Sleep    2
    Close Browser     

Go direct to Home Page without Login
    Open Browser to Home Page
    # Verify Error Message
    Page Should Contain    Epic sadface: You can only access '/inventory.html' when you are logged in.
    Close Browser

Go direct to Cart Page without Login
    Open Browser to Cart Page
    # Verify Error Message
    Page Should Contain    Epic sadface: You can only access '/cart.html' when you are logged in.
    Close Browser

Go direct to Checkout Page step 1 without Login
    Open Browser to Checkout Page step 1
    # Verify Error Message
    Page Should Contain    Epic sadface: You can only access '/checkout-step-one.html' when you are logged in.
    Close Browser

Go direct to Checkout Page step 2 without Login
    Open Browser to Checkout Page step 2
    # Verify Error Message
    Page Should Contain    Epic sadface: You can only access '/checkout-step-two.html' when you are logged in.
    Close Browser

Go direct to Checkout Complete Page without Login
    Open Browser to Checkout Complete Page
    # Verify Error Message
    Page Should Contain    Epic sadface: You can only access '/checkout-complete.html' when you are logged in.
    Close Browser