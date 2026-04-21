
*** Settings ***
Documentation    Test suite for Employee Login functionality.
Resource         resources.resource

Test Teardown    Close test browser

*** Variables ***
${EMPLOYEE_USERNAME}    jademployee@sportson.se
${EMPLOYEE_PASSWORD}    Arbete123!
${EMPLOYEE_DASHBOARD}   xpath=//h1[text()='Employee Dashboard']

*** Test Cases ***
Verify Employee Login Navigate To Dashboard
    [Documentation]    Verifies that an existing employee can log in successfully.
    [Tags]             Login    Employee

    Given User is on login page
    When User enters credentials    ${EMPLOYEE_USERNAME}    ${EMPLOYEE_PASSWORD}
    And Clicks the login button
    Then User is navigated to employee dashboard

*** Keywords ***
User is navigated to employee dashboard
    Wait Until Element Is Visible    ${EMPLOYEE_DASHBOARD}    timeout=5s
    Location Should Contain    /employee