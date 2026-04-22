*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SportsonView}    http://localhost:5173
${Browser}    Chrome

*** Keywords ***
Öppna hemsidan
    Set Selenium Speed    1
    Open browser    ${SportsonView}    ${Browser}
    Maximize Browser Window
Given the user sees a short description of a news item
    Click Element    //*[@id="root"]/header/nav/a[2]
    Element Should Be Visible    //*[@id="root"]/main/h1
When the user clicks on the new item
    Click Element    //*[@id="root"]/main/div/section/section[2]/article[2]
Then the user should see a detailed view appear in a modal
    Element Should Be Visible    //*[@id="root"]/main/div[2]/article/button



