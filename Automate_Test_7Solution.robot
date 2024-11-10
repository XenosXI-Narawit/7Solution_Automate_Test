*** Settings ***
Documentation     Basic Web Test Example
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        chrome
${URL}            https://xn--m3ca1athe9asc7b2b6iqe.com/
${NOKCASH_BUTTON}    xpath://button[@data-testid='nok-more-nok-cash-icon']
${LOGIN_CHECK_ELEMENT}    xpath=//*[contains(@class, 'text-caption') and contains(@class, 'font-semibold')]
${NOKCASH_INPUT_CASH}    xpath://input[@data-testid='nok-cash-amount-input']
${NOKCASH_PAYMENT_BUTTON}    xpath://button[@data-testid='nok-cash-top-up-button']
# ${NOKCASH_SELECT_PICTURE_BUTTON}    xpath://label[@for='slip-payment']
${NOKCASH_CANCEL_ORDER_BUTTON}    xpath://button[@data-testid='cancel-order-button']
${NOKCASH_CONFIRM_CANCEL_ORDER_BUTTON}    xpath://button[@data-testid='option-modal-cancel-button']
${COOKIE_ACCEPT_BUTTON}    xpath=//span[contains(@class, 'text-body') and contains(@class, 'font-semibold') and text()='ยอมรับทั้งหมด']

*** Test Cases ***
Open Browser Test
    [Documentation]    Test Cancel Order
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    30s 
    Wait Until Element Is Visible    ${LOGIN_CHECK_ELEMENT}    timeout=20s
    Execute Javascript    window.scrollTo(0, 0)
    Wait Until Element Is Visible    ${COOKIE_ACCEPT_BUTTON}    timeout=10s
    Click Element    ${COOKIE_ACCEPT_BUTTON}
    Wait Until Element Is Visible    ${NOKCASH_BUTTON}    timeout=20s
    Click Element    ${NOKCASH_BUTTON}
    Sleep    3s
    Wait Until Element Is Visible    ${NOKCASH_INPUT_CASH}    timeout=20s
    Input text  ${NOKCASH_INPUT_CASH}    105
    Sleep    3s
    Wait Until Element Is Visible    ${NOKCASH_PAYMENT_BUTTON}    timeout=20s
    Click Element    ${NOKCASH_PAYMENT_BUTTON}
    Sleep    3s
    # Wait Until Element Is Visible    ${NOKCASH_SELECT_PICTURE_BUTTON}    timeout=20s
    # Click Element    ${NOKCASH_SELECT_PICTURE_BUTTON}
    Wait Until Element Is Visible    ${NOKCASH_CANCEL_ORDER_BUTTON}    timeout=20s
    Click Element    ${NOKCASH_CANCEL_ORDER_BUTTON}
    Sleep    8s
    Wait Until Element Is Visible    ${NOKCASH_CONFIRM_CANCEL_ORDER_BUTTON}    timeout=20s
    Click Element    ${NOKCASH_CONFIRM_CANCEL_ORDER_BUTTON}
    Sleep    5s