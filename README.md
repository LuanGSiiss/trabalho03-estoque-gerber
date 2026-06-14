# Trabalho 03 - Linux, Shell Script e Automação Operacional aplicada à Cloud
**Disciplina:** Cloud Computing  
**Instituição:** UNIDAVI  

## Aluno
* **Nome do Aluno:** Luan Gerber Siiss

## Tema
* **Sistema de Gestão de Estoque para uma Loja (Estoque Gerber)**

---

## Descrição do Projeto
Este projeto simula um ambiente prático de operação, automação e administração de servidores Linux voltados para a infraestrutura de varejo. O cenário consiste em um painel web (`Estoque Gerber`) rodando em um servidor Apache containerizado. Toda a rotina operacional — desde a atualização de pacotes, controle de acessos de funcionários, rotinas de backup de inventários, monitoramento de recursos e deploy — foi automatizada utilizando Shell Script.

---

## Tecnologias Utilizadas
* **Sistema Operacional:** Linux Ubuntu 22.04 LTS
* **Containerização:** Docker & Docker Compose
* **Servidor Web:** Apache2
* **Linguagem de Automação:** Shell Script (Bash)
* **Controle de Versão e Imagens:** GitHub & DockerHub

---

## Estrutura do Projeto
```text
trabalho03-estoque-gerber/
├── Dockerfile
├── docker-compose.yml
├── README.md
├── scripts/
│   ├── 01_update.sh
│   ├── 02_apache.sh
│   ├── 03_estrutura.sh
│   ├── 04_backup.sh
│   ├── 05_deploy.sh
│   ├── 06_processos.sh
│   ├── 07_monitoramento.sh
│   ├── 08_usuarios_permissoes.sh
│   ├── 09_relatorio.sh
│   └── menu.sh
├── source/
│   ├── index.html
│   ├── sobre.html
│   └── assets/
├── backups/
├── logs/
└── evidencias/
```

## Scripts Disponíveis

* O script `01_update.sh` possui a função `atualizar_sistema` que aplica patches de segurança via `apt-get update && apt-get upgrade -y` gerando logs detalhados, podendo ser chamado individualmente com `./01_update.sh`. 
* O script `02_apache.sh` executa as funções `instalar_apache`, `verificar_apache` e `versao_apache` para provisionar e auditar o servidor web através do comando `./02_apache.sh`. 
* O `03_estrutura.sh` utiliza a função `criar_estrutura_estoque` para limpar registros antigos com segurança e estruturar as pastas do negócio em `/app/estoque/` (produtos, pedidos, fornecedores), rodando via `./03_estrutura.sh`. 
* O `04_backup.sh` contém a função `realizar_backup` que compacta os dados em um pacote `.tar.gz` carimbado dinamicamente com data e hora atual e o move para a pasta persistente através do comando `./04_backup.sh`. 
* O `05_deploy.sh` utiliza a função `executar_deploy` para limpar o diretório público e transferir as páginas do estoque para a raiz do Apache, validado individualmente com `./05_deploy.sh`. 
* O script `06_processos.sh` implementa as funções `listar_processos`, `buscar_processo` e `matar_processo` com travas de segurança contra execução nula, aceitando parâmetros posicionais diretamente no terminal como `./06_processos.sh listar`, `./06_processos.sh buscar apache` ou `./06_processos.sh matar <PID>`. 
* O `07_monitoramento.sh` possui a função `monitorar_sistema` que filtra o consumo de CPU, RAM, disco e o estado do Apache, gerando tags textuais de alerta caso os limites rompam 80%, executado com `./07_monitoramento.sh`. 
* O script `08_usuarios_permissoes.sh` aciona a função `configurar_usuarios` para criar de forma segura o grupo `estoque_ops`, o usuário corporativo `gerente_estoque` e aplicar o modo restritivo de permissão UNIX 750, disparado por `./08_usuarios_permissoes.sh`. 
* O `09_relatorio.sh` executa a função `gerar_relatorio` para consolidar o status total do servidor gerando o painel de auditoria em `/app/logs/relatorio_execucao.txt` através do comando `./09_relatorio.sh`.
* O script `menu.sh` utiliza a função `exibir_menu` sob um laço estruturado para unificar todas as opções anteriores em um painel interativo CLI acionado por `./menu.sh`.


## Como Executar

1. Execute na raiz do diretório o comando `docker compose up -d --build`. 
2. Após a inicialização, acesse o terminal interativo do Linux digitando `docker exec -it trabalho03-estoque-gerber bash`.
3. Navegue até a pasta de automação com o comando `cd /app/scripts`, conceda de forma explícita as permissões de execução para os componentes digitando `chmod +x *.sh` e inicialize a interface executando `./menu.sh`. Com ela será possível executar todos os scripts.
4. Para acessar o site, é necessário que os scritps '01_update.sh', '02_apache.sh', '03_estrutura.sh' e '05_deploy.sh' estejam executados, certifique-se de que o servidor web está ativo digitando `service apache2 start`. Com isso feito, acesse o endereço local http://localhost:8080.


## Evidências
/app/evidencias/


## DockerHub
https://hub.docker.com/repository/docker/luansiiss/trabalho03-estoque-gerber/general


## Uso de IA
O modelo de Inteligência Artificial foi utilizado como ferramenta de apoio. A mesma foi utilizada para criação do site de estoque e para validação dos comandos utilizados.


## Dificuldades Encontradas
A propria criação dos scritps sh por por ser diferente do oque estou acostumado.
