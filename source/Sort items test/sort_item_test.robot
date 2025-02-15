*** Settings ***
Resource    ../resources.robot

*** Test Cases ***
Verify Sort Products with standard user
    Open Browser to Login
    # Login
    Login with standard user
    # Maximize window
    Maximize Browser Window
    # Click sort items follow order A-Z
    Sort item A-Z
    # Option Sort should be chosed
    Element Text Should Be    xpath://*[@id="header_container"]/div[2]/div/span/span    Name (A to Z)
    # Products should be sorted
    Verify Sorted Items A-Z    ${ITEMS}[0]    ${ITEMS}[1]    ${ITEMS}[2]    ${ITEMS}[3]    ${ITEMS}[4]    ${ITEMS}[5]
    # Click sort item follow order Z-A
    Sort item Z-A
    # Option Sort should be chosed
    Element Text Should Be    xpath://*[@id="header_container"]/div[2]/div/span/span    Name (Z to A)
    # Products should be sorted
    Verify Sorted Items Z-A    ${ITEMS}[0]    ${ITEMS}[1]    ${ITEMS}[2]    ${ITEMS}[3]    ${ITEMS}[4]    ${ITEMS}[5]
    # Click sort item follow price's order low-high
    Sort item low-high
    # Option Sort should be chosed
    Element Text Should Be    xpath://*[@id="header_container"]/div[2]/div/span/span    Price (low to high)
    # Products should be sorted
    Verify Sorted Items low-high    ${ITEMS}[0]    ${ITEMS}[1]    ${ITEMS}[2]    ${ITEMS}[3]    ${ITEMS}[4]    ${ITEMS}[5]
    # Click sort item follow price's order high-low
    Sort item high-low
    # Option Sort should be chosed
    Element Text Should Be    xpath://*[@id="header_container"]/div[2]/div/span/span    Price (high to low)
    # Products should be sorted
    Verify Sorted Items high-low    ${ITEMS}[0]    ${ITEMS}[1]    ${ITEMS}[2]    ${ITEMS}[3]    ${ITEMS}[4]    ${ITEMS}[5]
    Close Browser

Verify Sort Products with problem user
    Open Browser to Login
    # Login
    Login with problem user
    # Maximize window
    Maximize Browser Window
    # Click sort items follow order A-Z
    Sort item A-Z
    # Option Sort should not be changed (keep Name (A to Z))
    Element Text Should Be    xpath://*[@id="header_container"]/div[2]/div/span/span    Name (A to Z)
    # Products's order should not be change (keep A-Z order)
    Verify Sorted Items A-Z (problem user)    ${ITEMS}[0]    ${ITEMS}[1]    ${ITEMS}[2]    ${ITEMS}[3]    ${ITEMS}[4]    ${ITEMS}[5]
    # Click sort item follow order Z-A
    Sort item Z-A
    # Option Sort should not be changed (keep Name (A to Z))
    Element Text Should Be    xpath://*[@id="header_container"]/div[2]/div/span/span    Name (A to Z)
    # Products's order should not be change (keep A-Z order)
    Verify Sorted Items A-Z (problem user)   ${ITEMS}[0]    ${ITEMS}[1]    ${ITEMS}[2]    ${ITEMS}[3]    ${ITEMS}[4]    ${ITEMS}[5]
    # Click sort item follow price's order low-high
    Sort item low-high
    # Option Sort should not be changed (keep Name (A to Z))
    Element Text Should Be   xpath://*[@id="header_container"]/div[2]/div/span/span    Name (A to Z)
    # Products's order should not be change (keep A-Z order)
    Verify Sorted Items A-Z (problem user)    ${ITEMS}[0]    ${ITEMS}[1]    ${ITEMS}[2]    ${ITEMS}[3]    ${ITEMS}[4]    ${ITEMS}[5]
    # Click sort item follow price's order high-low
    Sort item high-low
    # Option Sort should not be changed (keep Name (A to Z))
    Element Text Should Be    xpath://*[@id="header_container"]/div[2]/div/span/span    Name (A to Z)
    # Products's order should not be change (keep A-Z order)
    Verify Sorted Items A-Z (problem user)    ${ITEMS}[0]    ${ITEMS}[1]    ${ITEMS}[2]    ${ITEMS}[3]    ${ITEMS}[4]    ${ITEMS}[5]
    Close Browser

Verify Sort Products with performance glitch user
    Open Browser to Login
    # Login
    Login with performance glitch user
    # Maximize window
    Maximize Browser Window
    # Click sort items follow order A-Z
    Sort item A-Z
    Sleep    5
    # Option Sort should be chosed
    Element Text Should Be    xpath://*[@id="header_container"]/div[2]/div/span/span    Name (A to Z)
    # Products should be sorted
    Verify Sorted Items A-Z    ${ITEMS}[0]    ${ITEMS}[1]    ${ITEMS}[2]    ${ITEMS}[3]    ${ITEMS}[4]    ${ITEMS}[5]
    # Click sort item follow order Z-A
    Sort item Z-A
    Sleep    5
    # Option Sort should be chosed
    Element Text Should Be    xpath://*[@id="header_container"]/div[2]/div/span/span    Name (Z to A)
    # Products should be sorted
    Verify Sorted Items Z-A    ${ITEMS}[0]    ${ITEMS}[1]    ${ITEMS}[2]    ${ITEMS}[3]    ${ITEMS}[4]    ${ITEMS}[5]
    # Click sort item follow price's order low-high
    Sort item low-high
    Sleep    5
    # Option Sort should be chosed
    Element Text Should Be    xpath://*[@id="header_container"]/div[2]/div/span/span    Price (low to high)
    # Products should be sorted
    Verify Sorted Items low-high    ${ITEMS}[0]    ${ITEMS}[1]    ${ITEMS}[2]    ${ITEMS}[3]    ${ITEMS}[4]    ${ITEMS}[5]
    # Click sort item follow price's order high-low
    Sort item high-low
    Sleep    5
    # Option Sort should be chosed
    Element Text Should Be    xpath://*[@id="header_container"]/div[2]/div/span/span    Price (high to low)
    # Products should be sorted
    Verify Sorted Items high-low    ${ITEMS}[0]    ${ITEMS}[1]    ${ITEMS}[2]    ${ITEMS}[3]    ${ITEMS}[4]    ${ITEMS}[5]
    Close Browser

Verify Sort Products with error user
    Open Browser to Login
    # Login
    Login with error user
    # Maximize window
    Maximize Browser Window
    # Click sort items follow order A-Z
    Sort item A-Z
    # Option Sort should not be changed (keep Name (A to Z))
    Element Text Should Be    xpath://*[@id="header_container"]/div[2]/div/span/span    Name (A to Z)
    # Products's order should not be change (keep A-Z order)
    Verify Sorted Items A-Z    ${ITEMS}[0]    ${ITEMS}[1]    ${ITEMS}[2]    ${ITEMS}[3]    ${ITEMS}[4]    ${ITEMS}[5]
    # Click sort item follow order Z-A
    Sort item Z-A
    # Page should appear alert
    Verify Broken Sort Alert
    # Option Sort should not be changed (keep Name (A to Z))
    Element Text Should Be    xpath://*[@id="header_container"]/div[2]/div/span/span    Name (A to Z)
    # Products's order should not be change (keep A-Z order)
    Verify Sorted Items A-Z   ${ITEMS}[0]    ${ITEMS}[1]    ${ITEMS}[2]    ${ITEMS}[3]    ${ITEMS}[4]    ${ITEMS}[5]
    # Click sort item follow price's order low-high
    Sort item low-high
    # Page should appear alert
    Verify Broken Sort Alert
    # Option Sort should not be changed (keep Name (A to Z))
    Element Text Should Be   xpath://*[@id="header_container"]/div[2]/div/span/span    Name (A to Z)
    # Products's order should not be change (keep A-Z order)
    Verify Sorted Items A-Z    ${ITEMS}[0]    ${ITEMS}[1]    ${ITEMS}[2]    ${ITEMS}[3]    ${ITEMS}[4]    ${ITEMS}[5]
    # Click sort item follow price's order high-low
    Sort item high-low
    # Page should appear alert
    Verify Broken Sort Alert
    # Option Sort should not be changed (keep Name (A to Z))
    Element Text Should Be    xpath://*[@id="header_container"]/div[2]/div/span/span    Name (A to Z)
    # Products's order should not be change (keep A-Z order)
    Verify Sorted Items A-Z    ${ITEMS}[0]    ${ITEMS}[1]    ${ITEMS}[2]    ${ITEMS}[3]    ${ITEMS}[4]    ${ITEMS}[5]
    Close Browser

Verify Sort Products with visual user
    Open Browser to Login
    # Login
    Login with visual user
    # Maximize window
    Maximize Browser Window
    # Click sort items follow order A-Z
    Sort item A-Z
    # Option Sort should be chosed
    Element Text Should Be    xpath://*[@id="header_container"]/div[2]/div/span/span    Name (A to Z)
    # Products should be sorted
    Verify Sorted Items A-Z (visual user)    ${ITEMS}[0]    ${ITEMS}[1]    ${ITEMS}[2]    ${ITEMS}[3]    ${ITEMS}[4]    ${ITEMS}[5]
    # Click sort item follow order Z-A
    Sort item Z-A
    # Option Sort should be chosed
    Element Text Should Be    xpath://*[@id="header_container"]/div[2]/div/span/span    Name (Z to A)
    # Products should be sorted
    Verify Sorted Items Z-A (visual user)    ${ITEMS}[0]    ${ITEMS}[1]    ${ITEMS}[2]    ${ITEMS}[3]    ${ITEMS}[4]    ${ITEMS}[5]
    # Click sort item follow price's order low-high
    Sort item low-high
    # Option Sort should be chosed
    Element Text Should Be    xpath://*[@id="header_container"]/div[2]/div/span/span    Price (low to high)
    # Products should be sorted
    Verify Sorted Items low-high (visual user)    ${ITEMS}[0]    ${ITEMS}[1]    ${ITEMS}[2]    ${ITEMS}[3]    ${ITEMS}[4]    ${ITEMS}[5]
    # Click sort item follow price's order high-low
    Sort item high-low
    # Option Sort should be chosed
    Element Text Should Be    xpath://*[@id="header_container"]/div[2]/div/span/span    Price (high to low)
    # Products should be sorted
    Verify Sorted Items high-low (visual user)    ${ITEMS}[0]    ${ITEMS}[1]    ${ITEMS}[2]    ${ITEMS}[3]    ${ITEMS}[4]    ${ITEMS}[5]
    Close Browser