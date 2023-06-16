*** Settings ***
Library    SikuliLibrary
Library    OperatingSystem
Library    AutoItLibrary
Library    ImageHorizonLibrary
Resource    resource.robot
Test Setup        Add Needed Image Path

    

*** Variables ***
${IMAGE_DIR}      ${CURDIR}\\img


*** Test Cases ***
Venda com pagamento em dinheiro e cartão
    Dado que inicio uma venda com F5
    MAS não adiciono voucher
    MAS não informo forma de pagamento e nem cliente
    E informo um produto do tipo combustível
    E informo um produto do tipo mercadoria
    Quando finalizo a venda com F5
    E informo parte do pagamento em dinheiro
    E informo parte do pagamento em cartão
    Então o pagamento é realizado


Venda de produto com regra de preço
    Dado que inicio uma venda com F5
    MAS não adiciono voucher
    E informo a forma de pagamento e o cliente
    E informo um produto do tipo mercadoria
    Quando finalizo a venda com F5
    E confirmo o pagamento
    Então o pagamento é realizado

Venda com troco em dinheiro
    Dado que inicio uma venda com F5
    MAS não adiciono voucher
    MAS não informo forma de pagamento e nem cliente
    E informo um produto do tipo combustível
    E informo um produto do tipo mercadoria
    Quando finalizo a venda com F5
    E informo pagamento em dinheiro com valor maior
    E confirmo o pagamento
    Então o pagamento é realizado




*** Keywords ***
Add Needed Image Path 
    Add Image Path    ${IMAGE_DIR}


       
