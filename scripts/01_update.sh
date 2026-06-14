#!/bin/bash
# Script para atualização de pacotes

LOG_FILE="/app/logs/01_update.log"

atualizar_sistema() {
    echo "========= INICIANDO ATUALIZAÇÃO DO SISTEMA DE ESTOQUE =========" | tee -a "$LOG_FILE"
    apt-get update && apt-get upgrade -y >> "$LOG_FILE" 2>&1
    
    if [ $? -eq 0 ]; then
        echo "[OK] Sistema de Estoque atualizado com sucesso!" | tee -a "$LOG_FILE"
    else
        echo "[ERRO] Falha na atualização do sistema." | tee -a "$LOG_FILE"
    fi
}

atualizar_sistema