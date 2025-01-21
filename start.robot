*** Settings ***
Library             SeleniumLibrary

*** Test Cases ***
Acessar um site
    Open Browser    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login    chrome    options=add_argument("--start-maximized")
    Sleep           5
    Capture Page Screenshot
    Input Text      //input[@name="username"]   Admin
    Capture Page Screenshot
    Input Text      //input[@name="password"]   admin123
    Capture Page Screenshot
    Wait Until Element Is Visible    //button[@class="oxd-button oxd-button--medium oxd-button--main orangehrm-login-button"]    10s
    Click button    //button[@class="oxd-button oxd-button--medium oxd-button--main orangehrm-login-button"]
    Sleep           5
    Capture Page Screenshot
