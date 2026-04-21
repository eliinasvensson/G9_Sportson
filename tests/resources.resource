*** Settings ***
Documentation    Gemensamma variabler och nyckelord för hela projektet.
Library          SeleniumLibrary

*** Variables ***

${URL}               http://localhost:5173/login //
${BROWSER}           firefox

${INPUT_USERNAME}    id=email-field
${INPUT_PASSWORD}    id=password-field
${BTN_LOGIN}         css=.login-button

*** Keywords ***
User is on login page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${INPUT_USERNAME}    timeout=5s

User enters credentials
    [Arguments]    ${email}    ${password}
    Input Text    ${INPUT_USERNAME}    ${email}
    Input Text    ${INPUT_PASSWORD}    ${password}

Clicks the login button
    Click Element    ${BTN_LOGIN}

Close test browser
    Close Browser