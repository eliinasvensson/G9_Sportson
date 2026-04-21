*** Settings ***
Documentation    Test Suite for News functionality (TC08, TC09)
Resource         resources.resource


Test Teardown    Close test browser

*** Variables ***
${NEWS_URL}            http://localhost:5173/nyheter

${PAGE_HEADER}         xpath=//h1[text()='Nyheter']
${NEWS_CARD}           css=.news-card
${NEWS_TITLE}          css=.news-title
${NEWS_META}           css=.news-meta

${NEWS_MODAL}          css=.news-modal
${NEWS_MODAL_CLOSE}    css=.news-modal-close



*** Test Cases ***
TC08 Verify News Items Display Short Description
    [Documentation]    Verifies that news items are displayed in a layout with a short description.
    [Tags]             News    TC08

    Given User is on the news page
    Then Each news item should display a short description

TC09 Verify Clicking News Item Opens Detailed Modal
    [Documentation]    Verifies that clicking a news item opens a modal with detailed information.
    [Tags]             News    TC09

    Given User is on the news page
    When User clicks on a news item
    Then A detailed news view is shown in a modal

*** Keywords ***
User is on the news page
    Open Browser    ${NEWS_URL}    ${BROWSER}
    Set Selenium Speed    0.5s
    Maximize Browser Window

    Wait Until Element Is Visible    ${PAGE_HEADER}    timeout=5s
    Element Text Should Be           ${PAGE_HEADER}    Nyheter

    Wait Until Element Is Visible    ${NEWS_CARD}    timeout=5s

Each news item should display a short description
    Page Should Contain Element    ${NEWS_CARD}
    Element Should Be Visible      ${NEWS_META}

User clicks on a news item

    Click Element    ${NEWS_CARD}

A detailed news view is shown in a modal
    Wait Until Element Is Visible    ${NEWS_MODAL}    timeout=5s
