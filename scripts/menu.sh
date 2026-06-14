#!/bin/bash
# Painel de Controle - Estoque Gerber

AUTOR="Luan Gerber Siiss"

exibir_menu() {
    clear
    echo "============================================="
    echo "Criado por: $AUTOR"
    echo "Instituição: UNIDAVI"
    echo "Tema: Gestão de Estoque para Lojas"
    echo "============================================="
    echo "              MENU DEVOPS CLOUD              "
    echo "============================================="
    echo " 1) Atualizar sistema"
    echo " 2) Instalar Apache"
    echo " 3) Criar estrutura do projeto"
    echo " 4) Realizar backup"
    echo " 5) Fazer deploy"
    echo " 6) Ver processos (Listar)"
    echo " 7) Monitorar sistema"
    echo " 8) Configurar usuários e permissões"
    echo " 9) Gerar relatório"
    echo " 0) Sair"
    echo "============================================="
    echo -n "Escolha uma opção: "
}

while true; do
    exibir_menu
    read -r opcao
    case $opcao in
        1) /app/scripts/01_update.sh ;;
        2) /app/scripts/02_apache.sh ;;
        3) /app/scripts/03_estrutura.sh ;;
        4) /app/scripts/04_backup.sh ;;
        5) /app/scripts/05_deploy.sh ;;
        6) /app/scripts/06_processos.sh listar ;;
        7) /app/scripts/07_monitoramento.sh ;;
        8) /app/scripts/08_usuarios_permissoes.sh ;;
        9) /app/scripts/09_relatorio.sh ;;
        0) echo "Saindo..."; exit 0 ;;
        *) echo "Opção inválida!" ;;
    esac
    echo -n "Pressione [ENTER] para continuar..."
    read -r
done