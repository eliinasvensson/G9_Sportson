*** Settings ***
Resource    Frontend_Tester.resource
Suite Setup    Öppna Hemsidan

*** Test Cases ***
TC09_Detailed news item view
    Given The User Sees A Short Description Of A News Item
    When The User Clicks On The News Item
    Then The User Should See A Detailed View Appear In A Modal
