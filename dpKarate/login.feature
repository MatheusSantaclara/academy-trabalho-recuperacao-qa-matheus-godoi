Feature: Login com usuário cadastrado
    Como um usuário cadastrado no Raro Tube
    Desejo realizar minha autenticação no sistema
    Para ter acesso ao material exclusivo do curso.
    
    Background: Base url
        * call read("hook.feature@cadastroUsuario")
        * def payload = read("payloadUsuario.json")

        Given url "https://rarotube.herokuapp.com/"
        Given path "login"

    Scenario: Login com sucesso
        And form field email = payload.email
        And form field password = payload.password
        When method post
        Then status 201

        