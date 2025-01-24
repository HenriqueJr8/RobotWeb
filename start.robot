*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${START_MAXIMIZED}    --start-maximized
${LOG_LEVEL}          --log-level=3

*** Test Cases ***
Acessar um site e logar com usuario e senha corretos
    # Criar uma instância de ChromeOptions
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    ${START_MAXIMIZED}
    Call Method    ${options}    add_argument    ${LOG_LEVEL}

    # Usar o parâmetro correto `options` no Create WebDriver
    Create WebDriver    Chrome    options=${options}
    Go To               https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
    Sleep               5
    Capture Page Screenshot
    Input Text          //input[@name="username"]   Admin
    Capture Page Screenshot
    Input Text          //input[@name="password"]   admin123
    Capture Page Screenshot
    Wait Until Element Is Visible    //button[@class="oxd-button oxd-button--medium oxd-button--main orangehrm-login-button"]    10s
    Click Button        //button[contains(.,"Login")]
    Sleep               5
