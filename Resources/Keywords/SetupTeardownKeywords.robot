*** Settings ***
Library    SeleniumLibrary 
Variables    ../Locators/Locators.py
Resource    ./PageMyAccountKeywords.robot
Resource    ./PageRegisterKeywords.robot
Resource    ./PageLoginKeywords.robot



*** Keywords ***
Setup Ecommerce
    # Ouvrir browser avec driver et aller au page d'accueil
    [Arguments]    ${url}    ${browser}    ${options}    ${langue_fr} 
    Open Browser    ${url}   ${browser}    ${options}=${langue_fr}
    Maximize Browser Window
    Wait Until Page Contains Element    ${lien_your_store}
    Page Should Contain Element    ${lien_your_store}


Tear Down Ecommerce
    # Fermer browser avec temps attente a la fin afin de voir le critere de succes
    [Arguments]    ${timer_teardown}
    Sleep    ${timer_teardown}
    Close Browser



Preconditions Pour TestRechercherProduit
    [Arguments]    ${url}    ${browser}    ${options}    ${langue_fr}    ${prenom}    ${prenom_low}    ${nom_famille}   
    # Peut juste mettre un keyword dans la partie suite/test setup donc forcer de creer un keyword avec des sous-keywords 
    ...    ${num_tele}    ${message_succes_inscription_attendu}    ${pass}    ${arobas}    ${site_extension}    ${message_succes_logout_attendu}
    ...    ${text_login_succes_attendu}
    Setup Ecommerce    ${url}    ${browser}    ${options}    ${langue_fr}
    Creer Compte    ${pass}    ${prenom}    ${prenom_low}    ${nom_famille}    ${num_tele}    ${arobas}    ${site_extension}
    ...    ${message_succes_inscription_attendu}
    Logout    ${message_succes_logout_attendu}
    Login    ${pass}    ${email}    ${text_login_succes_attendu}






