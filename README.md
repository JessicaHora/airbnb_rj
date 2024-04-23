# Airbnb dbt analytics engineering

## Como rodar

- Criar uma pasta `data` e colocar os 3 csv dentro (professor mandou no email)
- Copiar o arquivo `profiles.yml` para a pasta `c:/usuarios/<seu-nome>/.dbt` (se nao tiver cria uma pasta com esse nome)
- Configurar o arquivo `profiles.yml` para seu banco de dados (na sua maquina)
- Configurar o script para fazer carga das tabelas no postgres (mudar a engine)
  `postgresql://<user>:<password>@<host>/<database>`
- Rodar o script
- entrar no dbt (`cd airbnb_rj`)
- testar a conexao (`dbt debug`) (Espera fica verde)
- rodar o projeto (`dbt run`)
- rodar os testes (`dbt test`)