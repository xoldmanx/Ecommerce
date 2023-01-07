*** Settings ***
Library    SeleniumLibrary

Library    XML
Library    String
Library    Collections
Library    ../Resources/Library/AjouterDate.py 
Library    DataDriver    ../Resources/Data/TestLoginNominalDDT.xlsx           
Documentation    Tester la fonctionalite de connexion nominal de Ecommerce avec les comptes sur excel
Variables    ../Resources/Locators/Locators.py
Resource    ../Resources/Keywords/SetupTeardownKeywords.robot


Suite Setup    Setup Ecommerce    ${url}    ${browser}    ${options}    ${langue_fr}
Suite Teardown    Tear Down Ecommerce    ${timer_teardown}
Test Template    Login Compte Nominal  


*** Variables ***
${url}    http://tutorialsninja.com/demo/index.php?route=common/home
${browser}    gc
${options}    options
${langue_fr}    add_argument('--lang=fr')
${timer_teardown}    2
${message_succes_logout_attendu}    You have been logged off your account. It is now safe to leave the computer.   

*** Test Cases ***
TestLoginNominal    ${email}    ${pass}    ${text_login_succes_attendu}       



*** Keywords ***
Login Compte Nominal    
    [Arguments]    ${email}    ${pass}    ${text_login_succes_attendu}
    #Remplir formulaire page login
    Wait Until Element Is Visible    ${menu_compte}
    Click Element    ${menu_compte}  
    Wait Until Element Is Visible    ${option_login}
    Click Element    ${option_login}
    Wait Until Element Is Visible    ${btn_login}
    Input Text    ${txt_email}    ${email}    
    Input Password    ${txt_pass}    ${pass}
    Click Element    ${btn_login}
    Wait Until Page Contains    ${text_login_succes_attendu}
    Page Should Contain    ${text_login_succes_attendu}
    
    #Criteres de succes: Verifier que l'email est le meme que celui du formulaire
    Wait Until Element Is Visible    ${menu_compte}
    Click Element    ${menu_compte}  
    Wait Until Element Is Visible    ${option_mon_compte}
    Click Element    ${option_mon_compte}
    Wait Until Element Is Enabled    ${lien_modifier_compte_info}
    Click Element    ${lien_modifier_compte_info}
    Wait Until Element Is Visible    ${txt_email1}${email}${txt_email2}
    Page Should Contain Element    ${txt_email1}${email}${txt_email2}
    
    #Se deconnecter
    Logout    ${message_succes_logout_attendu}