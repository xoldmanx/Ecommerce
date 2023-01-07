*** Settings ***
Library    SeleniumLibrary

Library    XML
Library    String
Library    Collections
Library    DataDriver    ../Resources/Data/TestReinitialiserPasswordNominalDDT.xlsx           
Documentation    Tester la fonctionalite de reinitialisation de mot de passe apres l'avoir oublie. Extraire les donnes valides
...    du fichier excel TestReinitialiserPasswordNominalDDT.xlsx
Variables    ../Resources/Locators/Locators.py
Resource    ../Resources/Keywords/SetupTeardownKeywords.robot


Suite Setup    Setup Ecommerce    ${url}    ${browser}    ${options}    ${langue_fr}
Suite Teardown    Tear Down Ecommerce    ${timer_teardown}
Test Template    Reinitialiser Password

*** Variables ***
${url}    http://tutorialsninja.com/demo/index.php?route=common/home
${browser}    gc
${options}    options
${timer_teardown}    2
${langue_fr}    add_argument('--lang=fr')

*** Test Cases ***
TestReinitialiserPassword    ${email}    ${message_succes_changer_pass}

*** Keywords ***
Reinitialiser Password
    [Arguments]    ${email}    ${message_succes_changer_pass}
    # Naviguer vers Page Login
    Wait Until Element Is Visible    ${menu_compte}
    Click Element    ${menu_compte}  
    Wait Until Element Is Visible    ${option_login}
    Click Element    ${option_login}
    Wait Until Element Is Visible    ${lien_pass_oublie}
    Click Element    ${lien_pass_oublie}
    # Entrer email d'un compte deja existant
    Input Text    ${txt_email}    ${email}
    Wait Until Element Is Visible    ${btn_continue}
    Click Element    ${btn_continue}
    Wait Until Element Is Visible    ${message_succes_changer_pass}
    Page Should Contain Element    ${message_succes_changer_pass}
    #Pas de critere de succes  car il nenvoie pas d'email de reinitialisation au courriel donne >:(
   
