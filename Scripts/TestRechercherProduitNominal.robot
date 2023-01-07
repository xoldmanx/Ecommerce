*** Settings ***
Library    SeleniumLibrary

Library    XML
Library    String
Library    Collections
Library    ../Resources/Library/AjouterDate.py 
Library    DataDriver    ../Resources/Data/TestRechercherProduitNominalDDT.xlsx           
Documentation    Tester la fonctionalite de rechercher un produit. Le systeme doit afficher les resultats de recherche d'un produit valide. Extraire 
...    le nom des produits valides du fichier excel TestRechercherProduitNominalDDT.xlsx
Variables    ../Resources/Locators/Locators.py
Resource    ../Resources/Keywords/SetupTeardownKeywords.robot
Resource    ../Resources/Keywords/PageRegisterKeywords.robot


Suite Setup    Preconditions Pour TestRechercherProduit    ${url}    ${browser}    ${options}    ${langue_fr}    ${prenom}    
...    ${prenom_low}    ${nom_famille}    ${num_tele}    ${message_succes_inscription_attendu}    ${pass}    ${arobas}    ${site_extension}
...    ${message_succes_logout_attendu}    ${text_login_succes_attendu}
Suite Teardown    Tear Down Ecommerce    ${timer_teardown}
Test Template    Rechercher Produit Nominal 


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
${prix_commande}    $2,005.00
${message_succes_logout_attendu}    You have been logged off your account. It is now safe to leave the computer.
${text_login_succes_attendu}    View your order history


*** Test Cases ***
TestRechercherProduitNominal    ${produit}    ${lien_produit}    ${description_attendu}    ${nom_produit_exact} 


*** Keywords ***
Rechercher Produit Nominal
    [Arguments]    ${produit}    ${lien_produit}    ${description_attendu}    ${nom_produit_exact}
    # Rechercher produit valide
    Wait Until Element Is Visible    ${txt_recherche}
    Clear Element Text    ${txt_recherche}
    Input Text    ${txt_recherche}    ${produit}
    Click Button    ${btn_recherche}
    
    #Convertir le text en lowercase afin de verifier si il est associe au nom de produit voulu
    ${produit}    Convert To Lower Case    ${produit} 
    
    # Le nom exact du produit doit contenir le nom du produit saisi de la boite de recherche
    IF    "${produit}" in "${nom_produit_exact}"    
        Wait Until Element Is Visible    ${lien_produit}
        Page Should Contain    ${description_attendu}
        #Critere de succes: naviguer vers la page du produit et sa description doit correspondre a ce qui est voulue
        Click Element    ${lien_produit} 
        Wait Until Element Is Visible    ${btn_panier_produits}
        Page Should Contain    ${description_attendu}

    END 