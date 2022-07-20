Feature: Recuperacao de senha de usuario
    Como um usuário cadastrado no Raro Tube que esqueceu a senha de acesso ao sistema
    Desejo recuperar minha senha
    Para voltar a ter acesso ao material exclusivo do curso

    Background: Acesso a pagina de recuperaçao de senha
        Given que acessei a "https://rarotube.herokuapp.com/"
        And acessei a pagina de recuperação de senha "https://rarotube.herokuapp.com/recuperarsenha"

    Scenario: Solicitar codigo de recuperaçao de senha com sucesso
        When preencho o campo exibido com email cadastrado
        And solicito o envio do codigo
        Then recebo codigo para alterar a senha de login do RaroTube no email digitado

    Scenario: Solicitar codigo de recuperação de senha com email nao cadastrado
        When preencho o campo exibido com email nao cadastrado
        And solicito o envio do codigo
        Then visualizo a mensagem "Erro ao enviar o código. Tente novamente mais tarde"

    Scenario: Alterar senha cadastrada
        Given que ja solicitei o codigo para alterar a senha
        And fui redirecionado para a pagina de nova senha
        When coloco o codigo no campo "Código"
        And digito uma nova senha nos campos "Senha" e "Confirmação de senha"
        Then consigo alterar a senha com sucesso

    Scenario: Alterar senha com o codigo de acesso invalido
        Given que acessei a pagina de nova senha
        And preenchi os campos "Senha" e "Confirmação de senha"
        When preencho o campo "Codigo" com um codigo invalido
        Then nao consigo alterar a senha de cadastro
        And visualizo a mensagem "Erro ao enviar o código. Tente novamente mais tarde"

    Scenario: Alterar senha do cadastro com a confirmaçao de senha divergente da senha digitada
        Given que acessei a pagina de nova senha
        And preenchi os campos "Senha" e "Codigo" corretamente
        When preencho o campo "Confirmação de senha" com dados diferentes do campo "Senha"
        Then nao consigo alterar a senha de cadastro
        And visualizo a mensagem "As senhas devem ser iguais"

    Scenario: Visualizar senha digitada no formulario de alteração de senha
        When estou na pagina do formulario de nova senha
        Then visualizo no campo "senha" e "Confirmação de senha" um botao para exibir os caracteres escondidos

