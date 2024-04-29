# Projeto DBT - Análise de Dados do Airbnb no Rio de Janeiro


Bem-vindo ao repositório do projeto de Engenharia de Dados da Ada Tech, focado na análise dos dados do Airbnb na cidade do Rio de Janeiro. Este projeto foi desenvolvido como parte do módulo de Analytics Engineering.

## Sobre o Projeto

O objetivo deste projeto é explorar e analisar os dados do Airbnb no Rio de Janeiro para extrair insights valiosos que possam ser úteis para diversos fins, como tomada de decisão, planejamento estratégico e análises de mercado. O conjunto de dados consiste em três tabelas principais:

1. Listings (Anúncios): Esta tabela contém informações detalhadas sobre os anúncios de propriedades disponíveis no Airbnb no Rio de Janeiro, incluindo características, localização, comodidades e preços.


2. Reviews (Comentários): Aqui, encontram-se os comentários deixados pelos usuários que se hospedaram nas propriedades listadas no Airbnb no Rio de Janeiro. Esses comentários podem fornecer insights sobre a qualidade das propriedades e a experiência dos hóspedes.


3. Calendar (Calendário): Esta tabela armazena dados históricos sobre os preços das propriedades ao longo do tempo. Isso permite uma análise temporal dos preços e padrões sazonais.


## Estrutura do Projeto DBT

O projeto DBT foi organizado em três camadas principais, seguindo a metodologia de ingestão de dados em bronze, prata e ouro:

1. Staging (Bronze): Nesta camada, os dados brutos são carregados diretamente das fontes de dados originais. Aqui, ocorre a ingestão inicial e a limpeza básica dos dados.

2. Intermediate (Prata): Na camada intermediária, os dados são refinados e transformados para prepará-los para análises mais aprofundadas. Isso inclui a normalização de esquemas, a agregação de dados e a aplicação de regras de negócio.

3. Mart (Ouro): Finalmente, na camada Mart, os dados são modelados de forma otimizada para consulta e análise. Aqui, são criadas estruturas dimensionais e fato para suportar diferentes tipos de consultas e análises.


## Contribuições

Este projeto foi desenvolvido pelos alunos do curso de Engenharia de Dados da Ada Tech, com a orientação de instrutores e mentores. Se você encontrar qualquer problema, tiver sugestões de melhoria ou desejar contribuir, sinta-se à vontade para abrir uma issue ou enviar um pull request.


## Como Executar

Para executar o projeto DBT localmente, siga as instruções abaixo:

1. Clone este repositório para o seu ambiente local.

2. Certifique-se de ter o DBT instalado em seu sistema. Para mais informações sobre como instalar o DBT, consulte a documentação oficial em DBT Docs.

3. Navegue até o diretório raiz do projeto e execute os comandos DBT apropriados para construir as camadas bronze, prata e ouro do projeto.

4. Após a conclusão da execução do DBT, você estará pronto para explorar e analisar os dados processados e modelados.