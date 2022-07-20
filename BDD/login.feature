Feature: Login com usuário cadastrado
    Como um usuário cadastrado no Raro Tube
    Desejo realizar minha autenticação no sistema
    Para ter acesso ao material exclusivo do curso.

    Background: Acesso a baseUrl
        Given Que acessei a "https://rarotube.herokuapp.com/"
        And acessei a pagina de login "https://rarotube.herokuapp.com/login"

    Scenario: Login realizado com sucesso
        When informo um email cadastrado com a respectiva senha cadastrada
        And clico em Login
        Then consigo logar no sistema com sucesso

    Scenario: Login com senha incorreta
        When informo email cadastrado e senha incorreta
        And clico em Login
        Then não consigo efetuar login

    Scenario: Login sem senha
        When informo email cadastrado e não informo a senha
        And clico em Login
        Then não consigo efetuar login

    Scenario: Login sem email
        When não informo email e informo a senha cadastrada
        And clico em Login
        Then não consigo efetuar login

    Scenario: Login com email não cadastrado
        When informo email e senha não cadastrados
        And clico em Login
        Then não consigo efetuar login

    Scenario: Login com email com formato inválido
        When informo email com formato inválido e senha valida
        And clico em Login
        Then não consigo efetuar login
