*** Settings ***
Library    SeleniumLibrary

Library    XML
Library    String
Library    Collections
Library    ../Resources/Library/AjouterDate.py 
Library    DataDriver    ../Resources/Data/TestRechercherProduitExceptionDDT.xlsx           
Documentation    Tester la fonctionalite de rechercher un produit. Le systeme ne doit pas afficher le resultat d'un produit si c'est mal ecrit ou non-existant.
...    Extraire les nom de produits mal ecrits ou non-existants du fichier excel TestRechercherProduitExceptionDDT.xlsx.
Variables    ../Resources/Locators/Locators.py
Resource    ../Resources/Keywords/SetupTeardownKeywords.robot


Suite Setup    Preconditions Pour TestRechercherProduit    ${url}    ${browser}    ${options}    ${langue_fr}    ${prenom}    
...    ${prenom_low}    ${nom_famille}    ${num_tele}    ${message_succes_inscription_attendu}    ${pass}    ${arobas}    ${site_extension}
...    ${message_succes_logout_attendu}    ${text_login_succes_attendu}
Suite Teardown    Tear Down Ecommerce    ${timer_teardown}
Test Template    Rechercher Produit Exception

*** Variables ***
${url}    http://tutorialsninja.com/demo/index.php?route=common/home
${browser}    gc
${options}    options
${langue_fr}    add_argument('--lang=fr')
${timer_teardown}    2
${langue_fr}    add_argument('--lang=fr')
${pass}    1234   
${prenom}   Ken
${prenom_low}    ken 
${nom_famille}    Will
${num_tele}    5146860517
${arobas}    @
${site_extension}    .com
${message_succes_inscription_attendu}    Congratulations! Your new account has been successfully created!
${message_succes_logout_attendu}    You have been logged off your account. It is now safe to leave the computer.
${text_login_succes_attendu}    View your order history       


*** Test Cases ***
TestRechercherProduitException    ${produit}    ${message_produit_invalide}


*** Keywords ***
Rechercher Produit Exception
    [Arguments]    ${produit}    ${message_produit_invalide}
    # Rechercher le produit invalide et produire un message d'echec
    Wait Until Element Is Visible    ${txt_recherche}
    Clear Element Text    ${txt_recherche}
    Input Text    ${txt_recherche}    ${produit}
    Click Button    ${btn_recherche}
    Wait Until Page Contains    ${message_produit_invalide}
    Page Should Contain    ${message_produit_invalide}

    #Criteres de succes: Rafraihir afin de verifier si le message est encore present.
    Reload Page
    Wait Until Page Contains    ${message_produit_invalide}
    Page Should Contain    ${message_produit_invalide}