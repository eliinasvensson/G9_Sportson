*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SportsonView}    http://localhost:5173/nyheter
${Browser}    Chrome

*** Keywords ***
Öppna hemsidan
    Set Selenium Speed    2
    Open browser    ${SportsonView}    ${Browser}
    Click Element    //*[@id="root"]/header/nav/a[2]
    Element Should Be Visible    //*[@id="root"]/main/h1
    Click Element    //*[@id="root"]/main/div/section/section[2]/article[2]
    Element Should Be Visible    //*[@id="root"]/main/div[2]/article/button


