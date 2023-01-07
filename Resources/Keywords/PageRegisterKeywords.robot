*** Settings ***
Library    SeleniumLibrary
Library    String
Library    Collections
Library    ../Library/AjouterDate.py    
Variables    ../Locators/Locators.py





*** Keywords ***
Creer Compte
    [Arguments]    ${pass}    ${prenom}    ${prenom_low}    ${nom_famille}    ${num_tele}    ${arobas}    ${site_extension}
    ...    ${message_succes_inscription_attendu}
    #Naviguer vers page d'inscription
    Wait Until Element Is Visible    ${menu_compte}
    Click Element    ${menu_compte}   
    Wait Until Element Is Visible    ${menu_register}
    Click Element    ${menu_register}
    Wait Until Element Is Visible    ${btn_continue}
    #Ajoute date courant pour que le compte soit unique et inutile de le supprimer avant chaque test
    ${date}    Get Date
    Set Suite Variable    ${email}       ${prenom_low}${date}${arobas}${prenom_low}${site_extension}
    #Remplir formulaire d'inscription
    Input Text    ${txt_prenom}    ${prenom}    # charactere 1 a 32 nimporte quel string
    Input Text    ${txt_nom_famille}    ${nom_famille}    #charactere 1 a 32 nimporte quel string
    Input Text    ${txt_email}    ${email}        # doit avoir le format X@X.X . ne peut pas avoir de caracteres speciaux apres le @. ne doit pas etre deja inscrit
    Input Text    ${txt_telephone}     ${num_tele}     # 3 a 32 caracteres nimporte quel sting
    Input Password    ${txt_pass}    ${pass}  # systeme dit 4 a 20 mais reellement 4 a 40  nimporte quel string
    Input Password    ${txt_pass_confirm}    ${pass}     # systeme dit 4 a 20 mais reellement 4 a 40  nimporte quel string
    Select Checkbox    ${checkbox_agree_termes}
    Click Element    ${btn_continue}
    Wait Until Element Is Visible    ${menu_compte}
    Page Should Contain    ${message_succes_inscription_attendu}

    #Criteres de succes: Assurez que l'email est le meme qu'inscrit
    Click Element    ${menu_compte}  
    Wait Until Element Is Visible    ${option_mon_compte}
    Click Element    ${option_mon_compte}
    Wait Until Element Is Enabled    ${lien_modifier_compte_info}
    Click Element    ${lien_modifier_compte_info}
    Wait Until Element Is Visible    ${txt_email1}${email}${txt_email2}
    Page Should Contain Element    ${txt_email1}${email}${txt_email2}


# Verifier Compte Doublon Disponible
#     [Arguments]    ${message_succes_logout_attendu}
#     Wait Until Element Is Visible    //span[text()='My Account']
#     Click Element    //span[text()='My Account']   
#     Wait Until Element Is Visible    //a[text()='Register']
#     Click Element    //a[text()='Register']
#     Wait Until Element Is Visible    //input[@value='Continue']
#     ${prenom}    Generate Random String     5    [LOWER] 
#     ${nom_famille}    Generate Random String     10    [LOWER]
#     Set Local Variable    ${email}    don003@gmail.com
#     ${num_tele}    Generate Random String   10    [NUMBERS]
#     Set Suite Variable    ${pass}    1234    
#     Input Text    //input[@id='input-firstname']    ${prenom}
#     Input Text    //input[@id='input-lastname']    ${nom_famille}
#     Input Text    //input[@id='input-email']    ${email}
#     Input Text    //input[@id='input-telephone']     ${num_tele}
#     Input Password    //input[@id='input-password']    ${pass}
#     Input Password    //input[@id='input-confirm']    ${pass}
#     Select Checkbox    //input[@name='agree']
#     Click Element    //input[@value='Continue']
#     ${email_deja_existant}    Run Keyword And Return Status    Page Should Contain     Warning: E-Mail Address is already registered!

    
#     IF    not ${email_deja_existant}
#     Click Element    //span[text()='My Account']  
#     Wait Until Element Is Visible    //ul[@class='dropdown-menu dropdown-menu-right']//a[text()='My Account']
#     Click Element    //ul[@class='dropdown-menu dropdown-menu-right']//a[text()='My Account']
#     Wait Until Element Is Enabled    //a[text()='Edit your account information']
#     Click Element    //a[text()='Edit your account information']
#     Wait Until Element Is Visible    //input[@name='email'][@value='${email}']
#     Page Should Contain Element    //input[@name='email'][@value='${email}']
#     Logout    ${message_succes_logout_attendu}    
#     END

Verifier Que Doublon A Bloque Inscription
     [Arguments]    ${email}    ${message_echec_email_deja_inscrit}    ${email_doublon}
     # Doit afficher le message d'echec si email deja inscript 
    IF    "${email}" == "${email_doublon}"
        Wait Until Page Contains     ${message_echec_email_deja_inscrit}
        Page Should Contain    ${message_echec_email_deja_inscrit}  
    END