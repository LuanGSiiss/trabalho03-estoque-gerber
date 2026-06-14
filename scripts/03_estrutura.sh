#!/bin/bash
# Estrutura de diretórios

LOG_FILE="/app/logs/03_estrutura.log"

criar_estrutura_estoque() {
    echo "========= CRIANDO DIRETÓRIOS DO SISTEMA DE ESTOQUE =========" | tee -a "$LOG_FILE"
    
    # Limpeza segura de estruturas antigas
    rm -rf /app/estoque
    
    # Criação de subpastas
    mkdir -p /app/estoque/produtos
    mkdir -p /app/estoque/fornecedores
    mkdir -p /app/estoque/pedidos
    mkdir -p /app/estoque/inventario_logs
    
    # Criando arquivos iniciais simulados
    echo "PROD001,Smartphone,10" > /app/estoque/produtos/lista.csv
    echo "FORN001,Distribuidora Tech,SP" > /app/estoque/fornecedores/ativos.txt
    
    echo "[OK] Estrutura do Estoque Gerber criada com sucesso em /app/estoque/." | tee -a "$LOG_FILE"
}

criar_estrutura_estoque