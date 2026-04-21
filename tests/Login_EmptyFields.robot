*** Settings ***
Documentation    Test Suite for Empty Field Login Attempt (TC05)
Resource         resources.resource

Test Teardown    Close test browser

*** Variables ***
${ERROR_CONTAINER}    css=.validation-error

*** Test Cases ***
Verify Login With Empty Fields Displays Error
    [Documentation]    Verifies that leaving fields empty triggers validation errors and prevents login.
    [Tags]             Login    Negative    TC05

    Given User is on login page
    When User enters credentials    ${EMPTY}    ${EMPTY}
    And Clicks the login button
    Then System displays validation errors

*** Keywords ***
System displays validation errors
    Wait Until Element Is Visible    ${ERROR_CONTAINER}    timeout=5s

    Element Should Contain    ${ERROR_CONTAINER}    The Email field is not a valid e-mail address.

    Location Should Contain    /login