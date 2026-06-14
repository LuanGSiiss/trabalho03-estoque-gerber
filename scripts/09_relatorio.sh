#!/bin/bash
# Geração automatizada do Relatório Operacional Geral

RELATORIO="/app/logs/relatorio_execucao.txt"
DATA_HORA=$(date +"%Y-%m-%d %H:%M:%S")

gerar_relatorio() {
    echo "Gerando Relatório Operacional..."
    
    echo "=============================================" > "$RELATORIO"
    echo "RELATÓRIO OPERACIONAL AUTOMATIZADO - INFRA CLOUD" >> "$RELATORIO"
    echo "Data/Hora: $DATA_HORA" >> "$RELATORIO"
    echo "Projeto: Estoque Gerber Cloud" >> "$RELATORIO"
    echo "Tema: Sistema de Gestão de Estoque para Lojas" >> "$RELATORIO"
    echo "=============================================" >> "$RELATORIO"
    
    echo -e "\n[ESPAÇO EM DISCO]" >> "$RELATORIO"
    df -h / >> "$RELATORIO"
    
    echo -e "\n[STATUS DO APACHE]" >> "$RELATORIO"
    if ps aux | grep "apache2" | grep -v "grep" > /dev/null; then
        echo "Status: ONLINE" >> "$RELATORIO"
    else
        echo "Status: OFFLINE" >> "$RELATORIO"
    fi
    
    echo -e "\n[ÚLTIMOS BACKUPS]" >> "$RELATORIO"
    ls -lh /app/backups/ | tail -n 5 >> "$RELATORIO"
    
    echo -e "\n[DIRETÓRIOS E PERMISSÕES DO ESTOQUE]" >> "$RELATORIO"
    ls -la /app/estoque >> "$RELATORIO"
    
    echo "=============================================" >> "$RELATORIO"
    echo "[OK] Relatório exportado com sucesso para $RELATORIO"
}

gerar_relatorio