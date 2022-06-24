*** Settings ***
Library         SeleniumLibrary


*** Variables ***
${input_name}               id:user_name
${input_sobrenome}          id:user_lastname
${input_email}              id:user_email
${input_endereco}           id:user_address
${input_uni}                id:user_university
${input_profissao}          id:user_profile
${input_genero}             id:user_gender
${input_number}             id:user_age
${button_submit}            name:commit
${mensagem}                 id:notice



*** Keywords ***
open browser and access the website
    Open Browser    https://automacaocombatista.herokuapp.com/users/new     CHROME
    Maximize Browser Window

Fill all fields
    Input Text      ${input_name}       rodrigo
    Sleep           0.5s
    Input Text      ${input_sobrenome}  silva
    Sleep           0.5s
    Input Text      ${input_email}      rodrigo13329@gmail.com
    Sleep           0.5s
    Input Text      ${input_endereco}   endereço
    Sleep           0.5s
    Input Text      ${input_uni}        fametro
    Sleep           0.5s
    Input Text      ${input_profissao}  analista
    Sleep           0.5s
    Input Text      ${input_genero}     masculino
    Sleep           0.5s
    Input Text      ${input_number}     24
    Sleep           0.5s
    

click create
    Click Element   ${button_submit}

alert message
    Element Should Be Visible   ${mensagem}

close the browser
    Close Browser

#==================================================

Fill in all fields except the name field
    Input Text      ${input_sobrenome}  silva
    Sleep           0.5s
    Input Text      ${input_email}      rodrigo13329@gmail.com
    Sleep           0.5s
    Input Text      ${input_endereco}   endereço
    Sleep           0.5s
    Input Text      ${input_uni}        fametro
    Sleep           0.5s
    Input Text      ${input_profissao}  analista
    Sleep           0.5s
    Input Text      ${input_genero}     masculino
    Sleep           0.5s
    Input Text      ${input_number}     24
    Sleep           0.5s


error message with empty name field
    Element Should Be Visible       xpath=//div[@id="error_explanation"]//li[text()="Name translation missing: pt-BR.activerecord.errors.models.user.attributes.name.blank"]

#================================================================

Fill in all fields except the email field
    Input Text      ${input_name}       rodrigo
    Sleep           0.5s
    Input Text      ${input_sobrenome}  silva
    Sleep           0.5s
    Input Text      ${input_endereco}   endereço
    Sleep           0.5s
    Input Text      ${input_uni}        fametro
    Sleep           0.5s
    Input Text      ${input_profissao}  analista
    Sleep           0.5s
    Input Text      ${input_genero}     masculino
    Sleep           0.5s
    Input Text      ${input_number}     24
    Sleep           0.5s

error message with empty email field
    Element Should Be Visible       xpath=//div[@id="error_explanation"]//li[text()="Email translation missing: pt-BR.activerecord.errors.models.user.attributes.email.blank"]

#======================================================

Fill all fields with incorrect email
    Input Text      ${input_name}       rodrigo
    Sleep           0.5s
    Input Text      ${input_sobrenome}  silva
    Sleep           0.5s
    Input Text      ${input_email}      rodrigo13329@gmail
    Sleep           0.5s
    Input Text      ${input_endereco}   endereço
    Sleep           0.5s
    Input Text      ${input_uni}        fametro
    Sleep           0.5s
    Input Text      ${input_profissao}  analista
    Sleep           0.5s
    Input Text      ${input_genero}     masculino
    Sleep           0.5s
    Input Text      ${input_number}     24
    Sleep           0.5s

error message with invalid email field
    Element Should Be Visible       xpath=//div[@id="error_explanation"]//li[text()="Email translation missing: pt-BR.activerecord.errors.models.user.attributes.email.invalid"]



*** Test Cases ***
Scenario 1: Register user successfully
    open browser and access the website
    Fill all fields
    click create
    alert message
    close the browser

Scenario 2: Register unnamed user
    open browser and access the website
    Fill in all fields except the name field
    click create
    error message with empty name field
    close the browser

Scenario 3: Register user without email
    open browser and access the website
    Fill in all fields except the email field
    click create
    error message with empty email field
    close the browser

Scenario 4: Register user with invalid email
    open browser and access the website
    Fill all fields with incorrect email
    click create
    error message with invalid email field
    close the browser