Feature: Criação de usuário
    Como um utilizador do Raro Tube
    Desejo realizar meu cadastro
    Para ter acesso aos materiais exclusivos do curso.

    Background: Acesso a tela de cadastro
        Given que acessei o site "https://rarotube.herokuapp.com/"
        And acessei a tela de cadastro "https://rarotube.herokuapp.com/cadastro"

    Scenario Outline: Informaçoes da realizacao de cadastro
        Given que informei <nome>
        And informei <email>
        And informei <senha>
        And informei <confirmaSenha>
        And informei <codigoTurma>
        When finalizo o cadastro
        Then recebo a mensagem <mensagem>

    Example: Informações do cadastro
            | nome      | email                | senha | confirmaSenha | codigoTurma                          | mensagem                       |
            | "Joao"    | teste@gmail.com      | 1234  | 1234          | 0fd9cf00-61c5-41ea-bcd8-6057930956af | usuario cadastrado com sucesso |
            | ""        | mari@hotmail.com     | 1020  | 1020          | f790b080-f41b-47f6-a4b0-32b71deb2c6b | campo obrigatorio              |
            | "Antonio" | antoniocarlos.com.br | 8822  | 8822          | 26610160-e496-42b4-932c-9796579a2715 | email invalido                 |
            | "Paulo"   | carsist@inove.com.br | 6752  | 6743          | ca368671-e6ce-4d49-87ce-b5cdc506d993 | as senhas devem ser iguais     |
            | "Ana"     | anna22@uol.com       | 0057  | 0057          | 123456789                            | codigo de turma invalido       |

    Scenario: Visualizar senha digitada no cadastro
        Then visualizo no campo senha um botao para exibir os caracteres escondidos

    Scenario: Informar email ja cadastrado na tela de cadastro
        When informo email ja cadastrado anteriormente na tela de cadastro
        And finalizo o cadastro
        Then nao consigo concluir o cadastro com sucesso
        And recebo a mensagem "Usuario ja cadastrado"

