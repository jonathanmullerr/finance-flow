# Finance Flow

O projeto Finance Flow é uma aplicação Rails que visa ajudar o usuário a controlar suas finanças pessoais. Com ele, é possível anotar pagamentos, contas e categorizá-los de acordo com suas necessidades.

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
Entry: representa uma entrada financeira, que pode ser uma despesa (Expense) ou uma receita (Incoming).
Expense: representa uma despesa financeira, que é uma subclasse de Entry.
Incoming: representa uma receita financeira, que é uma subclasse de Entry.
Category: representa uma categoria para as entradas financeiras (Expense ou Incoming).



sudo -u postgres psql

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version: 3.0.2
- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...
