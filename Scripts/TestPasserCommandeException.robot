*** Settings ***
Library    SeleniumLibrary

Library    XML
Library    String
Library    Collections
Library    ../Resources/Library/AjouterDate.py          
Documentation    Tester la fonctionalite de passer la comande. Le systeme doit bloquer le commencement de processus d'une commande 
...    si le panier possede un produit invalide.
Variables    ../Resources/Locators/Locators.py
Resource    ../Resources/Keywords/SetupTeardownKeywords.robot
Resource    ../Resources/Keywords/PageRegisterKeywords.robot
Resource    ../Resources/Keywords/PageSearchKeywords.robot
Resource    ../Resources/Keywords/PageCommandeKeywords.robot
Resource    ../Resources/Keywords/PageLoginKeywords.robot
Resource    ../Resources/Keywords/PageMyAccountKeywords.robot


Test Setup    Setup Ecommerce    ${url}    ${browser}    ${options}    ${langue_fr}
Test Teardown    Tear Down Ecommerce    ${timer_teardown}

*** Variables ***
${url}    http://tutorialsninja.com/demo/index.php?route=common/home
${browser}    gc
${options}    options
${langue_fr}    add_argument('--lang=fr')
${message_succes_logout_attendu}    You have been logged off your account. It is now safe to leave the computer.
${timer_teardown}    2
${pass}    1234   
${prenom}   Ken
${prenom_low}    ken 
${nom_famille}    Will
${num_tele}    5146860517
${arobas}    @
${site_extension}    .com
${message_succes_inscription_attendu}    Congratulations! Your new account has been successfully created!
${produit}    iMac
${produit_invalide}    iMac
${produit_valide}    Sony VAIO
${adresse}    1235 bdeb
${ville}    Montreal
${code_postal}    h1a1a1
${pays}    Canada
${province}    Québec
${quantite_produit}    2
${message_non_disponible}    Products marked with *** are not available in the desired quantity or not in stock!    
${sous_total_imac}    $200.00
${sous_total_sony}    $2,000.00
${prix_commande}    $2,005.00
${timer_bug}    1
${message_commande_reussi}    Your order has been placed!
${message_echec_paiement_bug}    Warning: Payment method required!
${message_echec_shipping_bug}    No Shipping
${text_login_succes_attendu}    View your order history




*** Test Cases ***
TestPasserCommandeException
    Creer Compte    ${pass}    ${prenom}    ${prenom_low}    ${nom_famille}    ${num_tele}    ${arobas}    ${site_extension}    
    ...    ${message_succes_inscription_attendu}
    Logout    ${message_succes_logout_attendu}
    Login    ${pass}    ${email}    ${text_login_succes_attendu}
    Ajouter Au Panier    ${produit}    ${quantite_produit}    ${produit_valide}    ${produit_invalide}    ${sous_total_sony}    ${sous_total_imac} 
    Passer Commande    ${prenom}    ${nom_famille}    ${adresse}    ${ville}    ${code_postal}    ${pays}    ${province}         
    ...    ${produit}    ${produit_valide}    ${produit_invalide}    ${message_non_disponible}    ${prix_commande}    ${timer_bug}
    ...    ${message_commande_reussi}    ${message_echec_paiement_bug}    ${message_echec_shipping_bug}

    