Feature: Visualizar materiais postados
    Como um usuário do Raro Tube
    Desejo visualizar os materiais postados
    Para consultar as lições disponíveis

    Background: Acesso ao site
        Given que acessei o site "https://rarotube.herokuapp.com/"

    Scenario: Acesso aos Auloes sem usuario autenticado
        And nao estou logado como usuario autenticado
        When estou na tela de inicio
        And visualizo a Thumbnail dos Auloes
        Then posso assistir os videos completos

    Scenario: Acesso a todo o conteudo com usuario autenticado
        And estou logado como usuario autenticado
        When estou na tela de inicio
        Then tenho acesso a uma prévia de materiais relacionados às aulas do curso e vídeos favoritos