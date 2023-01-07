*** Settings ***
Library    SeleniumLibrary 
Variables    ../Locators/Locators.py



*** Keywords ***
Login 
    [Arguments]    ${pass}    ${email}    ${text_login_succes_attendu}    
    # Remplir formulaire page login
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
    
    # Criteres de succes: Verifier que l'email est le meme que celui du formulaire
    Wait Until Element Is Visible    ${menu_compte}
    Click Element    ${menu_compte}  
    Wait Until Element Is Visible    ${option_mon_compte}
    Click Element    ${option_mon_compte}
    Wait Until Element Is Enabled    ${lien_modifier_compte_info}
    Click Element    ${lien_modifier_compte_info}
    Wait Until Element Is Visible    ${txt_email1}${email}${txt_email2}
    Page Should Contain Element    ${txt_email1}${email}${txt_email2}


Reinitialiser Password
    [Arguments]    ${email}
    # Naviguer vers page de oublier pass, saisir email et puis devrait avoir un message de succes de reinitilisation  
    Wait Until Element Is Visible    ${menu_compte}
    Click Element    ${menu_compte}  
    Wait Until Element Is Visible    ${option_login}
    Click Element    ${option_login}
    Wait Until Element Is Visible    ${lien_pass_oublie}
    Click Element    ${lien_pass_oublie}
    Input Text    ${txt_email}    ${email}
    Wait Until Element Is Visible    ${btn_continue}
    Click Element    ${btn_continue}
    Wait Until Element Is Visible    ${message_succes_changer_pass}
    Page Should Contain Element    ${message_succes_changer_pass}
    #Pas de critere de succes car il nenvoie pas d'email de reinitialisation
   




