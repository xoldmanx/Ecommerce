*** Settings ***
Library    SeleniumLibrary 
Variables    ../Locators/Locators.py
Library    String




*** Keywords ***
# Le site ecommerce ne permet pas la supression de compte donc lalternatif est de changer l'email 
# avec random string afin que DDT test soit reutilisable. (sinon il donnera une erreur si lemail est deja dans le systeme lors de l'inscription)
Changer Email 
    [Arguments]    ${arobas}    ${site_extension}    ${nb_caracteres}    ${message_succes_changer_email_attendu}    ${type_caracteres}
    ${email1}    Generate Random String    ${nb_caracteres}    [${type_caracteres}]
    ${email2}    Generate Random String    ${nb_caracteres}    [${type_caracteres}]
    Set Suite Variable    ${nouveau_email}    ${email1}${arobas}${email2}${site_extension}
    Wait Until Element Is Visible    ${menu_compte}
    Click Element    ${menu_compte}  
    Wait Until Element Is Visible    ${option_mon_compte}
    Click Element    ${option_mon_compte}
    Wait Until Element Is Enabled    ${lien_modifier_compte_info}
    Click Element    ${lien_modifier_compte_info}
    Wait Until Element Is Visible    ${btn_continue}
    Clear Element Text    ${txt_email}
    Input Text    ${txt_email}    ${nouveau_email}
    Click Element    ${btn_continue}
    Wait Until Page Contains    ${message_succes_changer_email_attendu}
    Page Should Contain    ${message_succes_changer_email_attendu}

    #Criteres de succes: Le nouveau email saffiche dans le champ texte email sur la page mon compte
    Wait Until Element Is Visible    ${menu_compte}
    Click Element    ${menu_compte}
    Wait Until Element Is Visible    ${option_mon_compte}
    Click Element    ${option_mon_compte}
    Wait Until Element Is Enabled    ${lien_modifier_compte_info}
    Click Element    ${lien_modifier_compte_info}
    Wait Until Element Is Visible    ${txt_email1}${nouveau_email}${txt_email2}
    Page Should Contain Element    ${txt_email1}${nouveau_email}${txt_email2}

Logout
    [Arguments]    ${message_succes_logout_attendu}
    #Naviguer vers l'option logout et logout
    Wait Until Element Is Visible    ${menu_compte}
    Click Element    ${menu_compte}
    Wait Until Element Is Visible    ${option_logout}
    Click Element    ${option_logout}
    Wait Until Page Contains    ${message_succes_logout_attendu}
    Page Should Contain    ${message_succes_logout_attendu}

    #Criteres de succes: Option login doit safficher
    Wait Until Element Is Visible    ${lien_continue}
    Click Element    ${lien_continue}
    Wait Until Page Contains Element    ${lien_login}
    Page Should Contain Element    ${lien_login}


Valider Abonnement
    # Abonnement doit etre coche sur la page moncompte newsletter
    Wait Until Element Is Visible    ${menu_compte}
    Click Element    ${menu_compte}
    Wait Until Element Is Visible    ${option_mon_compte}
    Click Element    ${option_mon_compte}
    Wait Until Element Is Visible    ${lien_modifier_newsletter}
    Click Element    ${lien_modifier_newsletter}
    Wait Until Element Is Visible    ${checkbox_newsletter}
    Page Should Contain Element    ${checkbox_newsletter}

Valider Compte
    [Arguments]    ${email}
    # Compte doit avoir le meme email que lors de linscription/login
    Wait Until Element Is Visible    ${menu_compte}
    Click Element    ${menu_compte}  
    Wait Until Element Is Visible    ${option_mon_compte}
    Click Element    ${option_mon_compte}
    Wait Until Element Is Enabled    ${lien_modifier_compte_info}
    Click Element    ${lien_modifier_compte_info}
    Wait Until Element Is Visible    ${txt_email1}${email}${txt_email2}
    Page Should Contain Element    ${txt_email1}${email}${txt_email2}






