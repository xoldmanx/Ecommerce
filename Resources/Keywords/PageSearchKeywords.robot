*** Settings ***
Library    SeleniumLibrary 
Variables    ../Locators/Locators.py


*** Keywords ***
Ajouter Au Panier
    [Arguments]    ${produit}    ${quantite_produit}    ${produit_valide}    ${produit_invalide}    ${sous_total_sony}    ${sous_total_imac}
    # Saisir produit dans la barre de recherche    
    Wait Until Element Is Visible    ${txt_recherche}
    Clear Element Text    ${txt_recherche}
    Input Text    ${txt_recherche}    ${produit}
    Click Button    ${btn_recherche}
    
    # Ajouter produit valide au panier
    IF    "${produit}" == "${produit_valide}"
        Wait Until Element Is Visible    ${lien_produit_sony}
        Click Element    ${lien_produit_sony}
        Wait Until Element Is Visible    ${txt_qte_produit}
        Clear Element Text    ${txt_qte_produit}
        Input Text    ${txt_qte_produit}    ${quantite_produit}
        Wait Until Element Is Visible    ${btn_panier_produits}
        Click Element    ${btn_panier_produits}
        Wait Until Page Contains Element    ${total_produit_panier_sony}
        Page Should Contain Element    ${total_produit_panier_sony}

        #Criteres de succes: Doit afficher le bon sous-total dans la partie panier de la page
        Wait Until Element Is Visible    ${menu_panier}
        Click Element    ${menu_panier}
        Wait Until Page Contains    ${sous_total_sony}
        Wait Until Page Contains    ${produit}
        Page Should Contain    ${sous_total_sony}
        Page Should Contain    ${produit}

    # Ajouter produit invalide au panier
    ELSE IF    "${produit}" == "${produit_invalide}"
        Wait Until Element Is Visible    ${lien_produit_imac}
        Click Element    ${lien_produit_imac}
        Wait Until Element Is Visible    ${txt_qte_produit}
        Clear Element Text    ${txt_qte_produit}
        Input Text    ${txt_qte_produit}    ${quantite_produit}
        Wait Until Element Is Visible    ${btn_panier_produits}
        Click Element    ${btn_panier_produits}
        Wait Until Page Contains Element    ${total_produit_panier_imac}
        Page Should Contain Element    ${total_produit_panier_imac}
    
        #Criteres de succes: Doit afficher le bon sous-total dans la partie panier de la page
        Wait Until Element Is Visible    ${menu_panier}
        Click Element    ${menu_panier}
        Wait Until Page Contains    ${produit}
        Page Should Contain    ${produit}
        Wait Until Page Contains    ${sous_total_imac}
        Page Should Contain    ${sous_total_imac}

    END


                    

