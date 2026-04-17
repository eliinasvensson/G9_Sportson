*** Settings ***
Documentation    Test suite for Admin Login functionality based on TC03.
Resource         resources.robot

Test Teardown    Close test browser

*** Variables ***
${ADMIN_USERNAME}    jadadmin@sportson.se
${ADMIN_PASSWORD}    SuperSecret123!
${ADMIN_DASHBOARD}   xpath=//h1[text()='Admin Dashboard']

*** Test Cases ***
TC03 Verify Admin Login Navigate To Dashboard
    [Tags]    Login    Admin    TC03

    Given User is on login page
    When User enters credentials    ${ADMIN_USERNAME}    ${ADMIN_PASSWORD}
    And Clicks the login button
    Then User is navigated to admin dashboard

*** Keywords ***
User is navigated to admin dashboard
    Wait Until Element Is Visible    ${ADMIN_DASHBOARD}    timeout=5s
    Location Should Contain    /dashboard