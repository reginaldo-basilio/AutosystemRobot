*** Settings ***
Library    SikuliLibrary
Library    OperatingSystem
Library    AutoItLibrary
Library    ImageHorizonLibrary


*** Variables ***
#${IMAGE_DIR}      ${CURDIR}\\img
${num_cartao}    4551820000009478
${validade_cartao}    1123
${cod_seguranca}    123

*** Keywords ***    
Dado que inicio uma venda com F5 
    ${window_title}    Set Variable    AutoSystem PRO - Frente de Caixa
    WinActivate    ${window_title}
    Press Special Key    F5


MAS não adiciono voucher 
    Sleep    2
    SikuliLibrary.Click    btn-nao.png


MAS não informo forma de pagamento e nem cliente
    SikuliLibrary.Click    btn-confirmar.png


E informo um produto do tipo combustível
    SikuliLibrary.Click    btn-info-produto.png
    Input Text    txt-bico-produto.png    01
    SikuliLibrary.Click    btn-confirmar.png


E informo um produto do tipo mercadoria
    Sleep    1
    SikuliLibrary.Click    btn-info-produto.png
    Input Text    txt-produto.png    2032
    SikuliLibrary.Click    btn-confirmar.png


Quando finalizo a venda com F5
    Sleep    2
    Press Special Key    F5
    Wait until screen contain    tela-resumo-venda.png    2

E informo parte do pagamento em dinheiro
    SikuliLibrary.Click    txt-forma-pagto.png
    Type    \t
    Type    \t
    Type    10
    Type    \t
    SikuliLibrary.Click    btn-confirmar.png


E informo parte do pagamento em cartão
    Input Text    txt-forma-pagto.png    243
    Type    \t
    Type    \t
    Type    \t
    Type    \t
    Type    \t
    Type    243
    Type    \t
    Type    \t
    Type    1
    SikuliLibrary.Click    btn-confirmar.png
    SikuliLibrary.Click    btn-finalizar.png
    Wait until screen contain    tela-num-cartao.png    10 
    Input Text    txt-num-cartao.png    ${num_cartao}
    SikuliLibrary.Click    btn-confirmar.png
    Input Text    txt-validade-cartao.png    ${validade_cartao}
    SikuliLibrary.Click    btn-confirmar.png
    Input Text    txt-cod-seguranca.png    ${cod_seguranca}
    SikuliLibrary.Click    btn-confirmar.png
    Wait until screen contain    tela-parc-avista.png    7 
    SikuliLibrary.Click    btn-confirmar.png
    Sleep    2


Então o pagamento é realizado
    Wait until screen contain    tela-nfce-autorizada.png    15
    SikuliLibrary.Click    btn-nao.png    
    Wait until screen contain    tela-caixa-livre.png    5
    ${window_title1}    Set Variable    Imprimir em Documento PDF - Foxit Reader PDF Printer
    WinActivate    ${window_title1}
    Wait until screen contain    tela-cancelar-comprovante.png    5
    SikuliLibrary.Click    btn-cancelar-window.png
    Press Special Key    ESC
    Press Special Key    ESC
    Press Special Key    ESC
    Press Special Key    ESC

E informo a forma de pagamento e o cliente
    Input Text    txt-forma-pgto.png    1
    Input Text    txt-identificacao.png    432
    Confirmar regra de preco
    SikuliLibrary.Click    btn-confirmar.png


Confirmar regra de preco
    Wait until screen contain    text-regra-preco.png    5


E confirmo o pagamento
    SikuliLibrary.Click    btn-confirmar.png
    SikuliLibrary.Click    btn-finalizar.png


E informo pagamento em dinheiro com valor maior
    SikuliLibrary.Click    txt-forma-pagto.png
    Type    \t
    Type    \t
    Type    50
    Type    \t
    SikuliLibrary.Click    btn-confirmar.png
    Wait until screen contain    tela-resumo-venda.png    2
    Wait until screen contain    text-troco-dinheiro.png    2


Dado que estou no caixa e teclo F10 para abir a tela de caixa
    ${window_title}    Set Variable    AutoSystem PRO - Frente de Caixa
    WinActivate    ${window_title}
    Press Special Key    F10

Quando acesso a rotina Operações > Cancelar última venda
    SikuliLibrary.Click    menu-operacoes.png
    Wait until screen contain    menu-canc-ult-venda.png    2
    SikuliLibrary.Click    menu-canc-ult-venda.png

Então é exibida uma mensagem para confirmar o cancelamento
    Wait until screen contain    tela-canc-ult-venda.png    2    

Quando clico em 'Sim'
    SikuliLibrary.Click    btn-sim.png

E informo o motivo e confirmo
    Input Text    txt-motivo-cancelamento.png    Teste de cancelamento de venda
    SikuliLibrary.Click    btn-confirmar.png

Entao a venda é cancelada com sucesso
    Wait until screen contain    tela-canc-confirmado.png    10
    SikuliLibrary.Click    btn-ok.png
    Press Special Key    ESC
    Wait until screen contain    tela-caixa-livre.png    5


Quando acesso a rotina Operações > Suprimento de caixa
    SikuliLibrary.Click    menu-operacoes.png
    Press Special Key    DOWN
    Press Special Key    DOWN
    Press Special Key    ENTER
    #Wait until screen contain    menu-suprimento-caixa.png    2
    #SikuliLibrary.Click    menu-suprimento-caixa.png

Então é exibida a tela de suprimento para informar o valor
    Wait until screen contain    tela-suprimento.png    5

Quando informo o valor e confirmo
    Type    \t
    Type    50
    #Input Text    txt-valor-suprimento.png    50
    SikuliLibrary.Click    btn-confirmar.png

Então o suprimento é realizado com sucesso
    ${window_title1}    Set Variable    Imprimir em Documento PDF - Foxit Reader PDF Printer
    WinActivate    ${window_title1}
    Wait until screen contain    tela-cancelar-comprovante.png    5
    SikuliLibrary.Click    btn-cancelar-window.png
    Wait until screen contain    tela-conf-suprimento.png    5
    SikuliLibrary.Click    btn-ok.png
    Press Special Key    ESC
    Wait until screen contain    tela-caixa-livre.png    5


Quando acesso a rotina Operações > Sangria > Dinheiro
    SikuliLibrary.Click    menu-operacoes.png
    Press Special Key    DOWN
    Press Special Key    DOWN
    Press Special Key    DOWN
    Press Special Key    RIGHT
    Press Special Key    ENTER

Então é exibida a tela de sangria para informar o valor
    Wait until screen contain    tela-sangria.png    5

Quando informo o valor da sangria e confirmo
    Type    50
    SikuliLibrary.Click    btn-confirmar.png

Então a sangria é realizada com sucesso
    ${window_title1}    Set Variable    Imprimir em Documento PDF - Foxit Reader PDF Printer
    WinActivate    ${window_title1}
    Wait until screen contain    tela-cancelar-comprovante.png    5
    SikuliLibrary.Click    btn-cancelar-window.png
    Wait until screen contain    tela-conf-sangria.png    5
    SikuliLibrary.Click    btn-ok.png
    Press Special Key    ESC
    Wait until screen contain    tela-caixa-livre.png    5

Dado que estou no módulo Gerencial
    ${window_title}    Set Variable    AutoSystem PRO - Sistema para Gestão e Automação de Postos de Combustível
    WinActivate    ${window_title}

E acesso a rotina Financeiro > Contas a pagar > Contas a pagar
    SikuliLibrary.Click    menu-financeiro.png
    Press Special Key    DOWN
    Press Special Key    DOWN
    Press Special Key    DOWN
    Press Special Key    DOWN
    Press Special Key    DOWN
    Press Special Key    RIGHT
    Press Special Key    ENTER
    Wait until screen contain    tela-contas-pagar.png    2
    

Quando inicio a criação de uma nova conta
    SikuliLibrary.Click    btn-confirmar.png
    SikuliLibrary.Click    btn-novoContasPagar.png
    Wait until screen contain    tela-motivo-movimentacao-contasPagar.png    2

E seleciono o motivo de movimentação
    SikuliLibrary.Click    opcao-movto-movimentacao-contasPagar.png
    SikuliLibrary.Click    btn-confirmar.png

E informo o Documento, Pessoa e Valor
    Wait until screen contain    tela-movimentacao-financ-contasPagar.png    2
    Input Text    txt-num-documento-contasPagar.png    12345
    Press Special Key    DOWN
    Type    3696
    Press Special Key    DOWN
    Type    \t
    Type    100

Então a conta a pagar é criada com sucesso
    SikuliLibrary.Click    btn-confirmar.png
    Wait until screen contain    tela-movimentacao-financ-contasPagar.png    2
    Press Special Key    ESC
    Sleep    1
    Press Special Key    ESC

E informo o fornecedor e confirmo
    Input Text    txt-fornecedor.png    3696
    Type    \t
    SikuliLibrary.Click    btn-confirmar.png

Quando seleciono uma conta a pagar
    E seleciono uma conta

E clico no botão Baixar
    SikuliLibrary.Click    btn-baixar.png
    Wait until screen contain    tela-contasapagar-baixar.png    2

E informo a forma de pagamento
    SikuliLibrary.Click    btn-icone-mais.png
    SikuliLibrary.Click    opcao-motivo-12.png
    SikuliLibrary.Click    btn-confirmar.png
    Wait until screen contain    tela-confirma-dados.png    2
    SikuliLibrary.Click    btn-confirmar.png

Então a baixa é realizada com sucesso
    SikuliLibrary.Click    btn-confirmar.png
    Quando navego até a aba Pagas
    Wait until screen contain    registro-conta-paga.png    2
    Press Special Key    ESC

Quando navego até a aba Pagas
    SikuliLibrary.Click    aba-pagas.png

E seleciono uma conta
    SikuliLibrary.Click    flag-marcar.png

E realizo a exclusão
    SikuliLibrary.Click    btn-icone-excluir.png
    SikuliLibrary.Click    btn-excluir.png
    SikuliLibrary.Click    btn-sim.png
    SikuliLibrary.Click    btn-sim.png

Quando navego até a aba A Pagar
    SikuliLibrary.Click    aba-a-pagar.png
    Wait until screen contain    registro-conta-a-pagar.png    2
    Press Special Key    ESC
    