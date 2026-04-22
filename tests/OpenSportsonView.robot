*** Settings ***
Resource    Frontend_Tester.resource
Suite Setup    Öppna Hemsidan

*** Test Cases ***
Test1 nyheter
    Given The User Sees A Short Description Of A News Item
    When The User Clicks On The New Item
    Then The User Should See A Detailed View Appear In A Modal
