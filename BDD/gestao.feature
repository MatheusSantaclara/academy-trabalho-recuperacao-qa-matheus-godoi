Feature: Gestao de turmas
    Como um usuário administrador
    Desejo gerenciar as turmas do Raro Tube
    Para ter controle sobre a matrícula de alunos e conteúdos do curso.

    Background: Acesso a baseUrl
        Given que acessei a baseUrl "https://rarotube.herokuapp.com/"
        And efetuei o login com uma conta de administrador

    Scenario: Criar nova turma
        When acesso a rota "https://rarotube.herokuapp.com/turmas"
        And envio uma requisição post com as informaçoes de turma
        Then consigo criar uma nova turma

    Scenario: Consultar turma cadastrada com id
        When acesso a rota "https://rarotube.herokuapp.com/turmas/{id}"
        And envio uma requisiçao get com id da turma cadastrada
        Then consigo visualizar a turma procurada

    Scenario: Consultar id de turma nao cadastrada
        When acesso a rota "https://rarotube.herokuapp.com/turmas/{id}"
        And envio uma requisiçao get com id da turma nao cadastrada
        Then nao consigo visualizar nenhuma turma

    Scenario: Atualizar turma cadastrada
        When acesso a rota "https://rarotube.herokuapp.com/turmas/{id}"
        And  envio uma requisição patch com id da turma
        Then consigo alterar as informaçoes da turma

    Scenario: Deletar turma cadastrada
        When acesso a rota "https://rarotube.herokuapp.com/turmas/{id}"
        And  envio uma requisição delete com id da turma
        Then consigo apagar a turma do banco de dados

    Scenario: Gerenciar turmas sem autenticação
        When envio uma requisição para as rotas de gerenciamento de turma
        And nao estou logado com usuario administrador e autenticado
        Then nao consigo realizar nenhuma interação
