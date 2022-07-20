Feature: Hook list

    @cadastroUsuario
    Scenario: Informaçoes da realizacao de cadastro
        * def name = java.util.UUID.randomUUID() + "user"
        * def email = java.util.UUID.randomUUID() + "@teste.com"
        * def password = "12345"
        * def codigo = java.util.UUID.randomUUID()
        * def payload = read("payloadUsuario.json")

        And request { name: "#(payload.name)", email: "#(payload.email)", password: "#(payload.password)", codigo: "#(payload.codigo)"}
        When method post
        Then status 201


    @login
    Scenario: Login
        * call read("hook.feature@cadastroUsuario")
        * def payload = read("payloadUsuario.json")

        Given url "https://rarotube.herokuapp.com/"
        Given path "login"
        And form field email = payload.email
        And form field password = payload.password
        When method post
        Then status 201
