#!/bin/bash
# Deploy das páginas estáticas

SOURCE_DIR="/app/source"
TARGET_DIR="/var/www/html"
LOG_FILE="/app/logs/05_deploy.log"

executar_deploy() {
    echo "========= INICIANDO DEPLOY DO ESTOQUEMASTER =========" | tee -a "$LOG_FILE"
    
    # Limpa destino
    rm -rf ${TARGET_DIR}/*
    
    # Copia arquivos
    cp -r ${SOURCE_DIR}/* ${TARGET_DIR}/
    
    # Valida index.html
    if [ -f "${TARGET_DIR}/index.html" ]; then
        echo "[OK] Deploy realizado com sucesso no Apache!" | tee -a "$LOG_FILE"
        echo "Arquivos publicados:" | tee -a "$LOG_FILE"
        ls -lh ${TARGET_DIR} | tee -a "$LOG_FILE" # Listar arquivos publicados
    else
        echo "[ERRO] Erro crítico: index.html não foi encontrado no destino." | tee -a "$LOG_FILE"
    fi
}

executar_deploy