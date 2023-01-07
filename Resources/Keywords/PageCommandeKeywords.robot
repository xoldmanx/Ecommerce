*** Settings ***
Library    SeleniumLibrary 
Variables    ../Locators/Locators.py


*** Keywords ***
Passer Commande
    [Arguments]    ${prenom}    ${nom_famille}    ${adresse}    ${ville}    ${code_postal}    ${pays}    ${province}    ${produit}
    ...    ${produit_valide}    ${produit_invalide}    ${message_non_disponible}    ${prix_commande}    ${timer_bug} 
    ...    ${message_commande_reussi}    ${message_echec_paiement_bug}    ${message_echec_shipping_bug}
    # Naviguer vers la page Commande      
    Wait Until Element Is Visible    ${menu_panier}
    Click Element    ${menu_panier}
    Wait Until Element Is Visible    ${btn_checkout}
    Click Element    ${btn_checkout}

    # remplir la formulaire de facturation
    IF    "${produit}" == "${produit_valide}"
        Wait Until Element Is Visible    ${btn_enregistrer_factuation_info}
        Input Text    ${txt_facturation_prenom}    ${prenom}
        Input Text    ${txt_facturation_nom_famille}    ${nom_famille}
        Input Text    ${txt_facturation_adresse}    ${adresse}
        Input Text    ${txt_facturation_ville}    ${ville}
        Input Text    ${txt_facturation_code_postal}    ${code_postal}
        Wait Until Element Is Visible    ${liste_facturation_pays}
        Select From List By Label    ${liste_facturation_pays}    ${pays}
        Wait Until Element Is Visible    ${liste_facturation_region} 
        # Liste deroulante de zone bug des fois 
        FOR    ${index}    IN RANGE    1    10
            TRY
                Select From List By Label    ${liste_facturation_region}    ${province}
                BREAK
            EXCEPT
                Log    Alternatif pour contourner le bug de la liste deroulante Province au lieu d'utiliser Sleep
            END   
        END
        Click Element    ${btn_enregistrer_factuation_info}
        Wait Until Element Is Visible    ${btn_enregistrer_expedition_info}
        Scroll Element Into View    ${btn_enregistrer_expedition_info}
        Click Element    ${btn_enregistrer_expedition_info}
        Wait Until Element Is Visible    ${btn_enregistrer_expedition_methode}
        Scroll Element Into View    ${btn_enregistrer_expedition_methode}
        Click Element    ${btn_enregistrer_expedition_methode}

        # La formulaire affiche des fois un bug bloquant dans la partie shipping donc doit recommencer 50% du formulaire si TRUE
        ${message_echec_shipping_bug_present}    Run Keyword And Return Status    Wait Until Page Contains    ${message_echec_shipping_bug}    ${timer_bug}    

        WHILE    ${message_echec_shipping_bug_present}
            Reload Page
            Wait Until Element Is Visible    ${btn_enregistrer_factuation_info}
            Click Element    ${btn_enregistrer_factuation_info}
            Wait Until Element Is Visible    ${btn_enregistrer_expedition_info}
            Scroll Element Into View    ${btn_enregistrer_expedition_info}
            Click Element    ${btn_enregistrer_expedition_info}
            Wait Until Element Is Visible    ${btn_enregistrer_expedition_methode}
            Scroll Element Into View    ${btn_enregistrer_expedition_methode}
            Click Element    ${btn_enregistrer_expedition_methode}
            ${message_echec_shipping_bug_present}    Run Keyword And Return Status    Wait Until Page Contains    ${message_echec_shipping_bug}    ${timer_bug}    
        END

        Wait Until Element Is Visible    ${checkbox_agree_paiement_methode}
        Click Element    ${checkbox_agree_paiement_methode}
        Wait Until Element Is Visible    ${btn_enregistrer_paiement_methode}
        Scroll Element Into View    ${btn_enregistrer_paiement_methode}
        Click Element    ${btn_enregistrer_paiement_methode}

        # La formulaire affiche des fois un bug bloquant dans la partie facturation donc doit recommencer 50% du formulaire si TRUE
        ${message_echec_paiement_bug_present}    Run Keyword And Return Status    Wait Until Page Contains    ${message_echec_paiement_bug}    ${timer_bug}    

        WHILE    ${message_echec_paiement_bug_present}
            Reload Page
            Wait Until Element Is Visible    ${btn_enregistrer_factuation_info}
            Click Element    ${btn_enregistrer_factuation_info}
            Wait Until Element Is Visible    ${btn_enregistrer_expedition_info}
            Scroll Element Into View    ${btn_enregistrer_expedition_info}
            Click Element    ${btn_enregistrer_expedition_info}
            Wait Until Element Is Visible    ${btn_enregistrer_expedition_methode}
            Scroll Element Into View    ${btn_enregistrer_expedition_methode}
            Click Element    ${btn_enregistrer_expedition_methode}
            Wait Until Element Is Visible    ${checkbox_agree_paiement_methode}
            Click Element    ${checkbox_agree_paiement_methode}
            Wait Until Element Is Visible    ${btn_enregistrer_paiement_methode}
            Scroll Element Into View    ${btn_enregistrer_paiement_methode}
            Click Element    ${btn_enregistrer_paiement_methode}
            ${message_echec_paiement_bug_present}    Run Keyword And Return Status    Wait Until Page Contains    ${message_echec_paiement_bug}    ${timer_bug}    
        END

        Wait Until Element Is Visible    ${btn_confirm_commande}
        Page Should Contain    ${produit} 
        Page Should Contain    ${prix_commande}
        Scroll Element Into View    ${btn_confirm_commande}
        Click Element    ${btn_confirm_commande} 
        Wait Until Page Contains    ${message_commande_reussi}
        Page Should Contain    ${message_commande_reussi} 

        #Criteres de succes: Le panier doit etre vide et le cout de commande doit safficher dans lhistorique de commandes 
        Wait Until Element Is Visible    ${lien_commande_historique} 
        Click Element    ${lien_commande_historique}
        Wait Until Page Contains    ${prix_commande}
        Wait Until Page Contains Element    ${total_produit_panier_vide}
        Page Should Contain    ${prix_commande}
        Page Should Contain Element    ${total_produit_panier_vide}

    # Si produit est invalide, la page commande ne va pas accepter le produit dans la commande
    ELSE IF    "${produit}" == "${produit_invalide}" 
            Wait Until Page Contains     ${message_non_disponible}
            Page Should Contain    ${message_non_disponible}
            Wait Until Element Is Visible    ${message_echec_produit_commande}
            Page Should Contain Element    ${message_echec_produit_commande}
            Page Should Contain Element    ${lien_produit_panier}

            #Criteres de succes: le message d'echec reste sur la page comme le produit est encore dans le panier
            Reload Page
            Wait Until Page Contains     ${message_non_disponible}
            Page Should Contain    ${message_non_disponible}
    END

