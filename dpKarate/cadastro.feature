Feature: Criação de usuário
    Como um utilizador do Raro Tube
    Desejo realizar meu cadastro
    Para ter acesso aos materiais exclusivos do curso.

    Background: Base UrL
        Given url "https://rarotube.herokuapp.com/"
        And path "cadastro"

    Scenario: Informaçoes da realizacao de cadastro
        * def name = java.util.UUID.randomUUID() + "user"
        * def email = java.util.UUID.randomUUID() + "@teste.com"
        * def password = "12345"
        * def codigo = java.util.UUID.randomUUID()
        * def payload = read("payloadUsuario.json")

        And request { name: "#(payload.name)", email: "#(payload.email)", password: "#(payload.password)", codigo: "#(payload.codigo)"}
        When method post
        Then status 201

