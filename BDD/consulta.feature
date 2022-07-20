Feature: Consulta de material
    Como um usuário do Raro Tube
    Desejo consultar determinado material postado
    Para ter acesso ao conteúdo das aulas

    Background: Acesso a pagina inicial
        Given que acessei o site "https://rarotube.herokuapp.com/"
        When clico em uma videoaula

    Scenario: Visualizar comentarios postados na aula
        Then visualizo a area de comentarios postados

    Scenario: Visualizar painel de sugestao de proximos videos
        Then visualizo o painel de sugestao de proximos videos

    Scenario: Visualizar propriedades das videoaulas
        Then visualizo todas as propriedades da videoaula:nome, url do vídeo, thumbnail, descrição e data de publicação

