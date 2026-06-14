#!/bin/bash
# Backup automatizado dos dados

ORIGEM="/app/estoque"
DESTINO="/app/backups"
LOG_FILE="/app/logs/04_backup.log"
DATA_HORA=$(date +"%Y-%m-%d_%H-%m")
NOME_ARQUIVO="backup_estoque_${DATA_HORA}.tar.gz"

realizar_backup() {
    echo "========= EXECUTANDO BACKUP DO INVENTÁRIO =========" | tee -a "$LOG_FILE"
    
    if [ ! -d "$ORIGEM" ]; then
        echo "[ERRO] Diretório de origem $ORIGEM não existe. Execute o script 03 primeiro." | tee -a "$LOG_FILE"
        return 1
    fi

    tar -czf "${DESTINO}/${NOME_ARQUIVO}" -C "$ORIGEM" . >> "$LOG_FILE" 2>&1
    
    # Validação do backup
    if [ -f "${DESTINO}/${NOME_ARQUIVO}" ]; then
        echo "[OK] Backup gerado com sucesso: ${DESTINO}/${NOME_ARQUIVO}" | tee -a "$LOG_FILE"
    else
        echo "[ERRO] Falha ao criar arquivo de backup." | tee -a "$LOG_FILE"
    fi
}

realizar_backup