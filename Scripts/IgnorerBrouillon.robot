# *** Settings ***
# Library    SeleniumLibrary

# Library    XML
# Library    String
# Library    Collections
# Library    ../Resources/Library/AjouterDate.py        
# Documentation    Fichiers de cas de tests Ecommerce
# Variables    ../Resources/Locators/Locators.py
# Resource    ../Resources/Keywords/SetupTeardownKeywords.robot
# Resource    ../Resources/Keywords/PageRegisterKeywords.robot
# Resource    ../Resources/Keywords/PageMyAccountKeywords.robot
# Resource    ../Resources/Keywords/PageLoginKeywords.robot
# #Variables    ../Resources/Library/AjouterDate.py   
# Test Setup    Setup Ecommerce    ${url}    ${browser}    ${options}    ${langue_fr}
# #Test Teardown    Tear Down Ecommerce    ${timer_teardown}    

# *** Variables ***

# ${url}    http://tutorialsninja.com/demo/index.php?route=common/home
# ${browser}    gc
# ${options}    options
# ${timer_teardown}    2
# ${langue_fr}    add_argument('--lang=fr')
# ${pass}    1234   
# ${prenom}   Ken
# ${prenom_low}    ken 
# ${nom_famille}    Will
# ${num_tele}    5146860517
# ${arobas}    @
# ${site_extension}    .com
# ${message_succes_inscription_attendu}    Congratulations! Your new account has been successfully created!
# ${new_pass}    1234
# ${produit}    IMAC
# ${produit_invalide}    samsungg
# ${produit_commande}    nano
# ${adresse}    1235 bdeb
# ${ville}    Montreal
# ${code_postal}    h1a1a1
# ${pays}    Canada
# ${province}    Québec
# ${produit_commande_invalide}    imac
# ${nb_caracteres}    5
# ${message_succes_changer_email_attendu}     Success: Your account has been successfully updated.
# ${message_succes_logout_attendu}    You have been logged off your account. It is now safe to leave the computer.
# ${text_login_succes_attendu}    View your order history
# ${type_caracteres}    LOWER
# ${url_login}    http://tutorialsninja.com/demo/index.php?route=account/login

    
    


# *** Test Cases ***
# Test Creer Compte
#     Creer Compte    ${pass}    ${prenom}    ${prenom_low}    ${nom_famille}    ${num_tele}    ${arobas}    ${site_extension}
#     ...    ${message_succes_inscription_attendu}
#     #Changer Email    ${arobas}    ${site_extension}    ${nb_caracteres}    ${message_succes_changer_email_attendu}    ${type_caracteres}
#     Logout    ${message_succes_logout_attendu}
#     #Login    ${pass}    ${email}    ${text_login_succes_attendu}
#     Reinitialiser Password    ${email}






# TestInscrireTousChamps
#     Maximize Browser Window
#     Wait Until Element Is Visible    //span[text()='My Account']
#     Click Element    //span[text()='My Account']   
#     Wait Until Element Is Visible    //a[text()='Register']
#     Click Element    //a[text()='Register']
#     Wait Until Element Is Visible    //input[@value='Continue']
#     #${prenom}    Generate Random String     5    [LOWER] 
#     # ${nom_famille}    Generate Random String     10    [LOWER]
#     # ${email1}    Generate Random String    5    [LOWER]
#     # ${email2}    Generate Random String    5    [LOWER]
#     # ${num_tele}    Generate Random String   10    [NUMBERS] 
#     # Set Local Variable    ${email}       ${email1}${arobas}${email2}${site_extension}
#     ${date}    Set Date
#     Set Local Variable    ${email}       ${prenom_low}${date}${arobas}${prenom_low}${site_extension}
#     Input Text    //input[@id='input-firstname']    ${prenom}
#     Input Text    //input[@id='input-lastname']    ${nom_famille}
#     Input Text    //input[@id='input-email']    ${email}
#     Input Text    //input[@id='input-telephone']     ${num_tele}
#     Input Password    //input[@id='input-password']    ${pass}
#     Input Password    //input[@id='input-confirm']    ${pass}
#     Select Checkbox    //input[@name='agree']
#     Click Element    //input[@value='Continue']
#     Wait Until Element Is Visible    //span[text()='My Account']
#     Page Should Contain    Congratulations! Your new account has been successfully created!
#     #Critere de succes
#     Click Element    //span[text()='My Account']  
#     Wait Until Element Is Visible    //ul[@class='dropdown-menu dropdown-menu-right']//a[text()='My Account']
#     Click Element    //ul[@class='dropdown-menu dropdown-menu-right']//a[text()='My Account']
#     Wait Until Element Is Enabled    //a[text()='Edit your account information']
#     Click Element    //a[text()='Edit your account information']
#     Wait Until Element Is Visible    //input[@name='email'][@value='${email}']
#     Page Should Contain Element    //input[@name='email'][@value='${email}']

# TestInscrireAbonnement
#     Maximize Browser Window
#     Wait Until Element Is Visible    //span[text()='My Account']
#     Click Element    //span[text()='My Account']   
#     Wait Until Element Is Visible    //a[text()='Register']
#     Click Element    //a[text()='Register']
#     Wait Until Element Is Visible    //input[@value='Continue']
#     # ${prenom}    Generate Random String     5    [LOWER] 
#     # ${nom_famille}    Generate Random String     10    [LOWER]
#     # ${email1}    Generate Random String    5    [LOWER]
#     # ${email2}    Generate Random String    5    [LOWER]
#     # ${num_tele}    Generate Random String   10    [NUMBERS] 
#     # Set Local Variable    ${email}       ${email1}${arobas}${email2}${site_extension}
#     ${date}    Set Date
#     Set Local Variable    ${email}       ${prenom_low}${date}${arobas}${prenom_low}${site_extension}
#     Input Text    //input[@id='input-firstname']    ${prenom}
#     Input Text    //input[@id='input-lastname']    ${nom_famille}
#     Input Text    //input[@id='input-email']    ${email}
#     Input Text    //input[@id='input-telephone']     ${num_tele}
#     Input Password    //input[@id='input-password']    ${pass}
#     Input Password    //input[@id='input-confirm']    ${pass}
#     Click Element    //label[@class='radio-inline']/input[@value='1']
#     Select Checkbox    //input[@name='agree']
#     Click Element    //input[@value='Continue']
#     Wait Until Element Is Visible    //span[text()='My Account']
#     Page Should Contain    Congratulations! Your new account has been successfully created!
#     #Criteres de succes
#     Click Element    //span[text()='My Account']
#     Wait Until Element Is Visible    //ul[@class='dropdown-menu dropdown-menu-right']//a[text()='My Account']
#     Click Element    //ul[@class='dropdown-menu dropdown-menu-right']//a[text()='My Account']
#     Wait Until Element Is Visible    //a[text()='Subscribe / unsubscribe to newsletter']
#     Click Element    //a[text()='Subscribe / unsubscribe to newsletter']
#     Wait Until Element Is Visible    //label[@class='radio-inline']/input[@value='1'][@checked='checked']
#     Page Should Contain Element    //label[@class='radio-inline']/input[@value='1'][@checked='checked']




# TestInscrireSiteDoublon
#     Maximize Browser Window
#     Wait Until Element Is Visible    //span[text()='My Account']
#     Click Element    //span[text()='My Account']   
#     Wait Until Element Is Visible    //a[text()='Register']
#     Click Element    //a[text()='Register']
#     Wait Until Element Is Visible    //input[@value='Continue']
#     ${prenom}    Generate Random String     5    [LOWER] 
#     ${nom_famille}    Generate Random String     10    [LOWER]
#     ${email1}    Generate Random String    5    [LOWER]
#     ${email2}    Generate Random String    5    [LOWER]
#     ${num_tele}    Generate Random String   10    [NUMBERS] 
#     Set Local Variable    ${email}       ${email1}${arobas}${email2}${site_extension}
#     Input Text    //input[@id='input-firstname']    ${prenom}
#     Input Text    //input[@id='input-lastname']    ${nom_famille}
#     Input Text    //input[@id='input-email']    ${email}
#     Input Text    //input[@id='input-telephone']     ${num_tele}
#     Input Password    //input[@id='input-password']    ${pass}
#     Input Password    //input[@id='input-confirm']    ${pass}
#     Select Checkbox    //input[@name='agree']
#     Click Element    //input[@value='Continue']

#     #Verfier dans la page principale
#     Wait Until Element Is Visible    //span[text()='My Account']
#     ${url_succes_inscription_obtenu}    Get Location
#     Page Should Contain    Congratulations! Your new account has been successfully created!
#     #Critere de succes
#     Click Element    //span[text()='My Account']  
#     Wait Until Element Is Visible    //ul[@class='dropdown-menu dropdown-menu-right']//a[text()='My Account']
#     Click Element    //ul[@class='dropdown-menu dropdown-menu-right']//a[text()='My Account']
#     Wait Until Element Is Enabled    //a[text()='Edit your account information']
#     Click Element    //a[text()='Edit your account information']
#     Wait Until Element Is Visible    //input[@name='email'][@value='${email}']
#     Page Should Contain Element    //input[@name='email'][@value='${email}']

#     #Logout
#     Wait Until Element Is Visible    //span[text()='My Account']
#     Click Element    //span[text()='My Account']
#     Wait Until Element Is Visible    //ul[@class='dropdown-menu dropdown-menu-right']//a[text()='Logout']
#     Click Element    //ul[@class='dropdown-menu dropdown-menu-right']//a[text()='Logout']
#     Wait Until Page Contains Element    //p[contains(text(),'You have been logged off your account.')]

#     #Redo
#     Wait Until Element Is Visible    //span[text()='My Account']
#     Click Element    //span[text()='My Account']   
#     Wait Until Element Is Visible    //a[text()='Register']
#     Click Element    //a[text()='Register']
#     Wait Until Element Is Visible    //input[@value='Continue']
#     Input Text    //input[@id='input-firstname']    ${prenom}
#     Input Text    //input[@id='input-lastname']    ${nom_famille}
#     Input Text    //input[@id='input-email']    ${email}
#     Input Text    //input[@id='input-telephone']     ${num_tele}
#     Input Password    //input[@id='input-password']    ${pass}
#     Input Password    //input[@id='input-confirm']    ${pass}
#     Select Checkbox    //input[@name='agree']
#     Click Element    //input[@value='Continue']

#     #Verfier si exception
#     Wait Until Page Contains Element    //div[@class='alert alert-danger alert-dismissible'][contains(text(),'already registered')]
#     Page Should Contain Element    //h1[text()='Register Account']


# TestConnecterCompteNominal
#     Maximize Browser Window
#     Wait Until Element Is Visible    //span[text()='My Account']
#     Click Element    //span[text()='My Account']   
#     Wait Until Element Is Visible    //a[text()='Register']
#     Click Element    //a[text()='Register']
#     Wait Until Element Is Visible    //input[@value='Continue']
#     ${prenom}    Generate Random String     5    [LOWER] 
#     ${nom_famille}    Generate Random String     10    [LOWER]
#     ${email1}    Generate Random String    5    [LOWER]
#     ${email2}    Generate Random String    5    [LOWER]
#     ${num_tele}    Generate Random String   10    [NUMBERS] 
#     Set Local Variable    ${email}       ${email1}${arobas}${email2}${site_extension}
#     Input Text    //input[@id='input-firstname']    ${prenom}
#     Input Text    //input[@id='input-lastname']    ${nom_famille}
#     Input Text    //input[@id='input-email']    ${email}
#     Input Text    //input[@id='input-telephone']     ${num_tele}
#     Input Password    //input[@id='input-password']    ${pass}
#     Input Password    //input[@id='input-confirm']    ${pass}
#     Select Checkbox    //input[@name='agree']
#     Click Element    //input[@value='Continue']
#     Wait Until Element Is Visible    //span[text()='My Account']
#     ${url_succes_inscription_obtenu}    Get Location
#     Page Should Contain    Congratulations! Your new account has been successfully created!

#     #Critere de succes
#     Click Element    //span[text()='My Account']  
#     Wait Until Element Is Visible    //ul[@class='dropdown-menu dropdown-menu-right']//a[text()='My Account']
#     Click Element    //ul[@class='dropdown-menu dropdown-menu-right']//a[text()='My Account']
#     Wait Until Element Is Enabled    //a[text()='Edit your account information']
#     Click Element    //a[text()='Edit your account information']
#     Wait Until Element Is Visible    //input[@name='email'][@value='${email}']
#     Page Should Contain Element    //input[@name='email'][@value='${email}']

#     #Logout
#     Wait Until Element Is Visible    //span[text()='My Account']
#     Click Element    //span[text()='My Account']
#     Wait Until Element Is Visible    //ul[@class='dropdown-menu dropdown-menu-right']//a[text()='Logout']
#     Click Element    //ul[@class='dropdown-menu dropdown-menu-right']//a[text()='Logout']
#     Wait Until Page Contains Element    //p[contains(text(),'You have been logged off your account.')]

#     #Login
#     Wait Until Element Is Visible    //span[text()='My Account']
#     Click Element    //span[text()='My Account']
#     Wait Until Element Is Visible    //ul[@class='dropdown-menu dropdown-menu-right']//a[text()='Login']
#     Click Element    //ul[@class='dropdown-menu dropdown-menu-right']//a[text()='Login']
#     Wait Until Element Is Visible    //input[@value='Login']
#     Input Text    //input[@id='input-email']    ${email}
#     Input Text    //input[@id='input-password']    ${pass}
#     Click Element    //input[@value='Login']

#     #Verifier succes login
#     Wait Until Location Contains    http://tutorialsninja.com/demo/index.php?route=account/account
#     Location Should Be    http://tutorialsninja.com/demo/index.php?route=account/account

#     #Critere de succes
#     Click Element    //span[text()='My Account']  
#     Wait Until Element Is Visible    //ul[@class='dropdown-menu dropdown-menu-right']//a[text()='My Account']
#     Click Element    //ul[@class='dropdown-menu dropdown-menu-right']//a[text()='My Account']
#     Wait Until Element Is Enabled    //a[text()='Edit your account information']
#     Click Element    //a[text()='Edit your account information']
#     Wait Until Element Is Visible    //input[@name='email'][@value='${email}']
#     Page Should Contain Element    //input[@name='email'][@value='${email}']


# TestReinitialiserPass
#     Maximize Browser Window
#     Wait Until Element Is Visible    //span[text()='My Account']
#     Click Element    //span[text()='My Account']   
#     Wait Until Element Is Visible    //a[text()='Register']
#     Click Element    //a[text()='Register']
#     Wait Until Element Is Visible    //input[@value='Continue']
#     ${prenom}    Generate Random String     5    [LOWER] 
#     ${nom_famille}    Generate Random String     10    [LOWER]
#     ${email1}    Generate Random String    5    [LOWER]
#     ${email2}    Generate Random String    5    [LOWER]
#     ${num_tele}    Generate Random String   10    [NUMBERS] 
#     Set Local Variable    ${email}       ${email1}${arobas}${email2}${site_extension}
#     Input Text    //input[@id='input-firstname']    ${prenom}
#     Input Text    //input[@id='input-lastname']    ${nom_famille}
#     Input Text    //input[@id='input-email']    ${email}
#     Input Text    //input[@id='input-telephone']     ${num_tele}
#     Input Password    //input[@id='input-password']    ${pass}
#     Input Password    //input[@id='input-confirm']    ${pass}
#     Select Checkbox    //input[@name='agree']
#     Click Element    //input[@value='Continue']
#     Wait Until Element Is Visible    //span[text()='My Account']
#     ${url_succes_inscription_obtenu}    Get Location
#     Page Should Contain    Congratulations! Your new account has been successfully created!

#     #Critere de succes
#     Click Element    //span[text()='My Account']  
#     Wait Until Element Is Visible    //ul[@class='dropdown-menu dropdown-menu-right']//a[text()='My Account']
#     Click Element    //ul[@class='dropdown-menu dropdown-menu-right']//a[text()='My Account']
#     Wait Until Element Is Enabled    //a[text()='Edit your account information']
#     Click Element    //a[text()='Edit your account information']
#     Wait Until Element Is Visible    //input[@name='email'][@value='${email}']
#     Page Should Contain Element    //input[@name='email'][@value='${email}']

#     #Logout
#     Wait Until Element Is Visible    //span[text()='My Account']
#     Click Element    //span[text()='My Account']
#     Wait Until Element Is Visible    //ul[@class='dropdown-menu dropdown-menu-right']//a[text()='Logout']
#     Click Element    //ul[@class='dropdown-menu dropdown-menu-right']//a[text()='Logout']
#     Wait Until Page Contains Element    //p[contains(text(),'You have been logged off your account.')]

#     #Reinstaliser mot de passe
#     Wait Until Element Is Visible    //span[text()='My Account']
#     Click Element    //span[text()='My Account']
#     Wait Until Element Is Visible    //ul[@class='dropdown-menu dropdown-menu-right']//a[text()='Login']
#     Click Element    //ul[@class='dropdown-menu dropdown-menu-right']//a[text()='Login']
#     Wait Until Element Is Visible    //div[@class='form-group']//a[text()='Forgotten Password']
#     Click Element    //div[@class='form-group']//a[text()='Forgotten Password']
#     Input Text    //input[@id='input-email']    ${email}
#     Wait Until Element Is Visible    //input[@value='Continue']
#     Click Element    //input[@value='Continue']
#     Wait Until Element Is Visible    //div[@class='alert alert-success alert-dismissible'][contains(text(),'email with a confirmation')]
#     Location Should Be    http://tutorialsninja.com/demo/index.php?route=account/login


# TestRechercherProduitNominal
#     Maximize Browser Window
#     Wait Until Element Is Visible    //span[text()='My Account']
#     Click Element    //span[text()='My Account']   
#     Wait Until Element Is Visible    //a[text()='Register']
#     Click Element    //a[text()='Register']
#     Wait Until Element Is Visible    //input[@value='Continue']
#     ${prenom}    Generate Random String     5    [LOWER] 
#     ${nom_famille}    Generate Random String     10    [LOWER]
#     ${email1}    Generate Random String    5    [LOWER]
#     ${email2}    Generate Random String    5    [LOWER]
#     ${num_tele}    Generate Random String   10    [NUMBERS] 
#     Set Local Variable    ${email}       ${email1}${arobas}${email2}${site_extension}
#     Input Text    //input[@id='input-firstname']    ${prenom}
#     Input Text    //input[@id='input-lastname']    ${nom_famille}
#     Input Text    //input[@id='input-email']    ${email}
#     Input Text    //input[@id='input-telephone']     ${num_tele}
#     Input Password    //input[@id='input-password']    ${pass}
#     Input Password    //input[@id='input-confirm']    ${pass}
#     Select Checkbox    //input[@name='agree']
#     Click Element    //input[@value='Continue']
#     Wait Until Element Is Visible    //span[text()='My Account']
#     ${url_succes_inscription_obtenu}    Get Location
#     Page Should Contain    Congratulations! Your new account has been successfully created!

#     #Rechercher produit
#     Wait Until Element Is Visible    //input[@placeholder='Search']
#     Clear Element Text    //input[@placeholder='Search']
#     Input Text    //input[@placeholder='Search']    ${produit}
#     Click Button    //button[@class='btn btn-default btn-lg']

#     ${produit}    Convert To Lower Case    ${produit} 

#     IF    "${produit}" == "ipod" or "${produit}" == "nano" or "${produit}" == "i" or "${produit}" == "nan" or "${produit}" == "od"    
#         Wait Until Element Is Visible    //a[text()='iPod Nano']
#         Page Should Contain    Video in your pocket. Its the small iPod
#         #Critere de succes
#         Click Element    //a[text()='iPod Nano'] 
#         Wait Until Element Is Visible    //button[@id='button-cart']
#         Page Should Contain    Video in your pocket. Its the small iPod

#     ELSE IF    "${produit}" == "samsung" or "${produit}" == "sam" or "${produit}" == "s" or "${produit}" == "sung"
#         Wait Until Element Is Visible    //a[text()='Samsung SyncMaster 941BW']
#         Page Should Contain    The big 19" 941BW monitor combines
#         #Critere de succes
#         Click Element    //a[text()='Samsung SyncMaster 941BW']
#         Wait Until Element Is Visible    //button[@id='button-cart']
#         Page Should Contain    The big 19" 941BW monitor combines

#     ELSE IF    "${produit}" == "htc" or "${produit}" == "h" or "${produit}" == "tc"
#         Wait Until Element Is Visible    //a[text()='HTC Touch HD']
#         Page Should Contain    HTC Touch - in High Definition
#         #Critere de succes
#         Click Element    //a[text()='HTC Touch HD']
#         Wait Until Element Is Visible    //button[@id='button-cart']
#         Page Should Contain    HTC Touch - in High Definition

#     ELSE IF    "${produit}" == "mac" or "${produit}" == "imac" or "${produit}" == "m" or "${produit}" == "ac"
#         Wait Until Element Is Visible    //a[text()='iMac']
#         Page Should Contain    Just when you thought iMac had everything
#         #Critere de succes
#         Click Element    //a[text()='iMac']
#         Wait Until Element Is Visible    //button[@id='button-cart']
#         Page Should Contain    Just when you thought iMac had everything     
#     END 


# TestRechercherProduitException
#     Maximize Browser Window
#     Wait Until Element Is Visible    //span[text()='My Account']
#     Click Element    //span[text()='My Account']   
#     Wait Until Element Is Visible    //a[text()='Register']
#     Click Element    //a[text()='Register']
#     Wait Until Element Is Visible    //input[@value='Continue']
#     ${prenom}    Generate Random String     5    [LOWER] 
#     ${nom_famille}    Generate Random String     10    [LOWER]
#     ${email1}    Generate Random String    5    [LOWER]
#     ${email2}    Generate Random String    5    [LOWER]
#     ${num_tele}    Generate Random String   10    [NUMBERS] 
#     Set Local Variable    ${email}       ${email1}${arobas}${email2}${site_extension}
#     Input Text    //input[@id='input-firstname']    ${prenom}
#     Input Text    //input[@id='input-lastname']    ${nom_famille}
#     Input Text    //input[@id='input-email']    ${email}
#     Input Text    //input[@id='input-telephone']     ${num_tele}
#     Input Password    //input[@id='input-password']    ${pass}
#     Input Password    //input[@id='input-confirm']    ${pass}
#     Select Checkbox    //input[@name='agree']
#     Click Element    //input[@value='Continue']
#     Wait Until Element Is Visible    //span[text()='My Account']
#     ${url_succes_inscription_obtenu}    Get Location
#     Page Should Contain    Congratulations! Your new account has been successfully created!

#     #Rechercher produit
#     Wait Until Element Is Visible    //input[@placeholder='Search']
#     Clear Element Text    //input[@placeholder='Search']
#     Input Text    //input[@placeholder='Search']    ${produit_invalide}
#     Click Button    //button[@class='btn btn-default btn-lg'] 

#     IF    "${produit_invalide}" == "samsungg" or "${produit_invalide}" == "samm" or "${produit_invalide}" == "iphonee" or "${produit_invalide}" == "iphoo" or "${produit_invalide}" == "macc" or "${produit_invalide}" == "imacc" or "${produit_invalide}" == "htcc" or "${produit_invalide}" == "htt"
#         Wait Until Page Contains    There is no product that matches the search criteria.
#         Page Should Contain    There is no product that matches the search criteria.
#         #Criteres de succes
#         Click Button    //button[@class='btn btn-default btn-lg']
#         Wait Until Page Contains    There is no product that matches the search criteria.
#         Page Should Contain    There is no product that matches the search criteria.
#     END


# TestPasserCommande
#     Maximize Browser Window
#     Wait Until Element Is Visible    //span[text()='My Account']
#     Click Element    //span[text()='My Account']   
#     Wait Until Element Is Visible    //a[text()='Register']
#     Click Element    //a[text()='Register']
#     Wait Until Element Is Visible    //input[@value='Continue']
#     # ${prenom}    Generate Random String     5    [LOWER] 
#     # ${nom_famille}    Generate Random String     10    [LOWER]
#     # ${email1}    Generate Random String    5    [LOWER]
#     # ${email2}    Generate Random String    5    [LOWER]
#     # ${num_tele}    Generate Random String   10    [NUMBERS] 
#     # Set Local Variable    ${email}       ${email1}${arobas}${email2}${site_extension}
#     ${date}    Set Date
#     Set Local Variable    ${email}       ${prenom_low}${date}${arobas}${prenom_low}${site_extension}
#     Input Text    //input[@id='input-firstname']    ${prenom}
#     Input Text    //input[@id='input-lastname']    ${nom_famille}
#     Input Text    //input[@id='input-email']    ${email}
#     Input Text    //input[@id='input-telephone']     ${num_tele}
#     Input Password    //input[@id='input-password']    ${pass}
#     Input Password    //input[@id='input-confirm']    ${pass}
#     Select Checkbox    //input[@name='agree']
#     Click Element    //input[@value='Continue']
#     Wait Until Element Is Visible    //span[text()='My Account']
#     ${url_succes_inscription_obtenu}    Get Location
#     Page Should Contain    Congratulations! Your new account has been successfully created!

#     #Rechercher produit
#     Wait Until Element Is Visible    //input[@placeholder='Search']
#     Clear Element Text    //input[@placeholder='Search']
#     Input Text    //input[@placeholder='Search']    ${produit_commande}
#     Click Button    //button[@class='btn btn-default btn-lg']
#     Wait Until Element Is Visible    //a[text()='iPod Nano']
#     Click Element    //a[text()='iPod Nano']
#     Wait Until Element Is Visible    //input[@id='input-quantity']
#     Input Text    //input[@id='input-quantity']    938
#     Click Element    //button[@id='button-cart']
#     Wait Until Page Contains    You have added
#     Page Should Contain    You have added
#     Wait Until Element Is Visible    //span[text()='Shopping Cart']
#     Click Element    //span[text()='Shopping Cart']
#     Wait Until Element Is Visible    //a[@class='btn btn-primary']
#     Click Element    //a[@class='btn btn-primary']
#     Wait Until Element Is Visible    //input[@id='button-payment-address']
#     Input Text    //input[@id='input-payment-firstname']    ${prenom}
#     Input Text    //input[@id='input-payment-lastname']    ${nom_famille}
#     Input Text    //input[@id='input-payment-address-1']    ${adresse}
#     Input Text    //input[@id='input-payment-city']    ${ville}
#     Input Text    //input[@id='input-payment-postcode']    ${code_postal}
#     Select From List By Label    //select[@id='input-payment-country']    ${pays}   
#     Select From List By Label    //select[@id='input-payment-zone']    ${province}
#     Click Element    //input[@id='button-payment-address']
#     Wait Until Element Is Visible    //input[@id='button-payment-method']
#     Click Element    //input[@name='agree']
#     Click Element    //input[@id='button-payment-method']

# TestPasserCommandeException
#     Maximize Browser Window
#     Wait Until Element Is Visible    //span[text()='My Account']
#     Click Element    //span[text()='My Account']   
#     Wait Until Element Is Visible    //a[text()='Register']
#     Click Element    //a[text()='Register']
#     Wait Until Element Is Visible    //input[@value='Continue']
#     # ${prenom}    Generate Random String     5    [LOWER] 
#     # ${nom_famille}    Generate Random String     10    [LOWER]
#     # ${email1}    Generate Random String    5    [LOWER]
#     # ${email2}    Generate Random String    5    [LOWER]
#     # ${num_tele}    Generate Random String   10    [NUMBERS] 
#     # Set Local Variable    ${email}       ${email1}${arobas}${email2}${site_extension}
#     ${date}    Set Date
#     Set Local Variable    ${email}       ${prenom_low}${date}${arobas}${prenom_low}${site_extension}
#     Input Text    //input[@id='input-firstname']    ${prenom}
#     Input Text    //input[@id='input-lastname']    ${nom_famille}
#     Input Text    //input[@id='input-email']    ${email}
#     Input Text    //input[@id='input-telephone']     ${num_tele}
#     Input Password    //input[@id='input-password']    ${pass}
#     Input Password    //input[@id='input-confirm']    ${pass}
#     Select Checkbox    //input[@name='agree']
#     Click Element    //input[@value='Continue']
#     Wait Until Element Is Visible    //span[text()='My Account']
#     ${url_succes_inscription_obtenu}    Get Location
#     Page Should Contain    Congratulations! Your new account has been successfully created!

#     #Rechercher produit
#     Wait Until Element Is Visible    //input[@placeholder='Search']
#     Clear Element Text    //input[@placeholder='Search']
#     Input Text    //input[@placeholder='Search']    ${produit_commande_invalide}
#     Click Button    //button[@class='btn btn-default btn-lg']
#     Wait Until Element Is Visible    //a[text()='iMac']
#     Page Should Contain    Just when you thought iMac had everything
#     #Critere de succes
#     Click Element    //a[text()='iMac']
#     Wait Until Element Is Visible    //button[@id='button-cart']
#     Page Should Contain    Out Of Stock
#     Click Element    //button[@id='button-cart']
#     Wait Until Page Contains    You have added
#     Page Should Contain    You have added
#     Click Element    //span[text()='Shopping Cart']
#     Wait Until Page Contains     Products marked with *** are not available in the desired quantity or not in stock!
#     Page Should Contain Element    //span[@class='text-danger']
#     Page Should Contain Element    //div[@class='table-responsive']//a[text()='iMac']
#     #Critere de sucess
#     Click Element    //a[@class='btn btn-primary']
#     Wait Until Page Contains     Products marked with *** are not available in the desired quantity or not in stock!
#     Page Should Contain Element    //span[@class='text-danger']
#     Page Should Contain Element    //div[@class='table-responsive']//a[text()='iMac']








        




    
    
    







    
        











