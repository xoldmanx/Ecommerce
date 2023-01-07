*** Settings ***
Library    SeleniumLibrary

Library    XML
Library    String
Library    Collections
Library    ../Resources/Library/AjouterDate.py 
Library    DataDriver    ../Resources/Data/TestRegisterExceptionDDT.xlsx           
Documentation    Tester le formulaire d'inscription avec une donnee invalide. Le systeme doit bloque l'inscription du compte.
...    Extraire les donnees du fichier excel TestRegisterExceptionDDT.xlsx.
Variables    ../Resources/Locators/Locators.py
Resource    ../Resources/Keywords/SetupTeardownKeywords.robot
Resource    ../Resources/Keywords/PageRegisterKeywords.robot
 
Suite Setup    Setup Ecommerce    ${url}    ${browser}    ${options}    ${langue_fr}
Suite Teardown    Tear Down Ecommerce    ${timer_teardown}
Test Template    Creer Compte Exception    

***Variables***
${timer_teardown}    2
${url}    http://tutorialsninja.com/demo/index.php?route=common/home
${browser}    gc
${options}    options
${langue_fr}    add_argument('--lang=fr')
${email_doublon}    don003@gmail.com


*** Test Cases ***
TestRegisterException    ${prenom}    ${nom_famille}    ${email}    ${num_tele}    ${num_tele}    ${pass}    ${abonnement}    ${termes_conditions}
...    ${message_succes_inscription_inattendu}    ${message_echec_email_deja_inscrit}    ${abonnement_termes_vrai}    ${header_register_account}


*** Keywords ***
Creer Compte Exception
    [Arguments]    ${prenom}    ${nom_famille}    ${email}    ${num_tele}    ${num_tele}    ${pass}    ${abonnement}    ${termes_conditions}    
    ...    ${message_succes_inscription_inattendu}    ${message_echec_email_deja_inscrit}    ${abonnement_termes_vrai}    ${header_register_account}
    # Naviguer vers la page Register
    Wait Until Element Is Visible    ${menu_compte}
    Click Element    ${menu_compte}   
    Wait Until Element Is Visible    ${menu_register}
    Click Element    ${menu_register}
    Wait Until Element Is Visible    ${btn_continue}
    # Remplir le formulaire d'inscription
    Clear Element Text    ${txt_prenom}
    Input Text    ${txt_prenom}    ${prenom}
    Clear Element Text    ${txt_nom_famille}
    Input Text    ${txt_nom_famille}    ${nom_famille}
    Clear Element Text    ${txt_email}    
    Input Text    ${txt_email}    ${email}
    Clear Element Text     ${txt_telephone}    
    Input Text    ${txt_telephone}     ${num_tele}
    Clear Element Text    ${txt_pass}
    Input Text    ${txt_pass}    ${pass}
    Clear Element Text    ${txt_pass_confirm}
    Input Text    ${txt_pass_confirm}    ${pass}

    IF    "${abonnement}" == "${abonnement_termes_vrai}"
        Click Element    ${checkbox_abonnement}
    END

    IF    "${termes_conditions}" == "${abonnement_termes_vrai}"
        Select Checkbox    ${checkbox_agree_termes}
    END
    
    Click Element    ${btn_continue}
    
    # Doit rester sur la meme page qui a le header Register Account
    Page Should Contain    ${header_register_account}
    
    # Message d'echec d'email deja existant (comme demander dans les exigences du project)
    Verifier Que Doublon A Bloque Inscription    ${email}    ${message_echec_email_deja_inscrit}    ${email_doublon}    
    
    #Criteres de succes: Page ne doit pas contenir lien logout et message d'inscription succes 
    Page Should Not Contain Element    ${lien_logout}
    Page Should Not Contain    ${message_succes_inscription_inattendu}

      



