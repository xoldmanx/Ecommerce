*** Settings ***
Library    SeleniumLibrary

Library    XML
Library    String
Library    Collections
Library    ../Resources/Library/AjouterDate.py 
Library    DataDriver    ../Resources/Data/TestRegisterNominalDDT.xlsx           
Documentation    Tester la formulaire d'inscription avec un ensemble de donnees valides. Extraire les donnes valides du fichier excel TestRegisterNominalDDT.xlsx
Variables    ../Resources/Locators/Locators.py
Resource    ../Resources/Keywords/SetupTeardownKeywords.robot
Resource    ../Resources/Keywords/PageRegisterKeywords.robot
Resource    ../Resources/Keywords/PageMyAccountKeywords.robot
 
Suite Setup    Setup Ecommerce    ${url}    ${browser}    ${options}    ${langue_fr}   
Suite Teardown    Tear Down Ecommerce    ${timer_teardown}
Test Template    Creer Compte Nominal    

*** Variables ***
${url}    http://tutorialsninja.com/demo/index.php?route=common/home
${browser}    gc
${options}    options
${timer_teardown}    2
${langue_fr}    add_argument('--lang=fr')
${arobas}    @
${site_extension}    .ca    
${type_caracteres}    LOWER
${message_succes_changer_email_attendu}    Success: Your account has been successfully updated.
${nb_caracteres}    15
${message_succes_logout_attendu}    You have been logged off your account. It is now safe to leave the computer.

*** Test Cases ***
TestRegisterCompteNominal    ${prenom}    ${nom_famille}    ${email}    ${num_tele}    ${num_tele}    ${pass}    ${abonnement}    ${termes_conditions}
...    ${message_succes_inscription_attendu}    ${abonnement_vrai}


*** Keywords ***
Creer Compte Nominal
    [Arguments]    ${prenom}    ${nom_famille}    ${email}    ${num_tele}    ${num_tele}    ${pass}    ${abonnement}    ${termes_conditions}
    ...    ${message_succes_inscription_attendu}    ${abonnement_vrai}  
    # Naviguer vers la page Register 
    Wait Until Element Is Visible    ${menu_compte}
    Click Element    ${menu_compte}   
    Wait Until Element Is Visible    ${menu_register}
    Click Element    ${menu_register}
    Wait Until Element Is Visible    ${btn_continue}
    # Remplir le formulaire d'inscription
    Input Text    ${txt_prenom}    ${prenom}
    Input Text    ${txt_nom_famille}    ${nom_famille}
    Input Text    ${txt_email}    ${email}
    Input Text    ${txt_telephone}     ${num_tele}
    Input Password    ${txt_pass}    ${pass}
    Input Password    ${txt_pass_confirm}    ${pass}

    IF    "${abonnement}" == "${abonnement_vrai}"
        Click Element    ${checkbox_abonnement}
    END
    
    Select Checkbox    ${checkbox_agree_termes}
    Click Element    ${btn_continue}

    # Le message de succes doit safficher
    Wait Until Page Contains    ${message_succes_inscription_attendu}
    Page Should Contain    ${message_succes_inscription_attendu}

    #Critere de succes: Va verifier l'info du compte a le meme email que celui lors de l'inscription. Verifie aussi si l'abonnement est active.
    IF    "${abonnement}" == "${abonnement_vrai}"
        Valider Abonnement
    END

    Valider Compte    ${email}

    # Le systemene permet pas de supprimer compte donc faut changer email 
    # avec random string apres chaque creation de compte afin que le fichier excel soit reutilisable
    Changer Email    ${arobas}    ${site_extension}    ${nb_caracteres}    ${message_succes_changer_email_attendu}    ${type_caracteres}
    
    #Pour recommencer a 0
    Logout    ${message_succes_logout_attendu}




