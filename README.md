# Finance Flow

O projeto Finance Flow é uma aplicação Rails que visa ajudar o usuário a controlar suas finanças pessoais. Com ele, é possível anotar pagamentos, contas e categorizá-los de acordo com suas necessidades.


## Dependências e versões
O projeto Finance Flow utiliza as seguintes dependências:

* Ruby: versão 3.0.2
* Rails: versão 6.1.7
* PostgreSQL: versão 1.1
* Puma: versão 5.0

## Instalação

Para instalar o Finance Flow em sua máquina, siga os seguintes passos:

1. Clone o repositório para sua máquina local: <br />
`git clone https://github.com/JonathanMuller-bit/finance-flow.git`

2. Entre no diretório do projeto: <br />
`cd finance-flow`

3. Instale as dependencias: <br />
`bundle install`

4. Crie o banco de dados: <br />
`rails db:create`

5. Execute as migrações do banco: <br />
`rails db:migrate`

6. Execute o servidor: <br />
`rails server`

Agora, você pode acessar o Finance Flow em http://localhost:3000.

## Modelos
O projeto Finance Flow conta com os seguintes modelos:

* User: representa o usuário que utiliza o aplicativo.
* Entry: representa uma entrada financeira, que pode ser uma despesa (Expense) ou uma receita (Incoming).
* Expense: representa uma despesa financeira, que é uma subclasse de Entry.
* Incoming: representa uma receita financeira, que é uma subclasse de Entry.
* Category: representa uma categoria para as entradas financeiras (Expense ou Incoming).

## Testes

O projeto Finance Flow conta com testes escritos em RSpec. Para executá-los, basta rodar o seguinte comando: <br />
`rspec`

## Contribuição

Se você deseja contribuir para o projeto Finance Flow, basta seguir os seguintes passos:

1. Faça um fork do projeto.
2. Crie uma branch para suas alterações: 
3. Faça suas alterações e adicione-as ao commit:
4. Envie suas alterações para o seu repositório forkado: <br />
5. Crie um pull request para o projeto original.

Agradecemos qualquer contribuição para o Finance Flow!

