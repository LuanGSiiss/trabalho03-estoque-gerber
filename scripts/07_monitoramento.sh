#!/bin/bash
# Monitoramento de Saúde da Infraestrutura

LOG_FILE="/app/logs/07_monitoramento.log"
DATA_HORA=$(date +"%Y-%m-%d %H:%M:%S")

monitorar_sistema() {
    echo "========= COLETA DE MÉTRICAS - $DATA_HORA =========" | tee -a "$LOG_FILE"
    
    # Coletas básicas
    CPU_USO=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-8]*\..*\) id.*/\1/" | awk '{print 100 - $1}')
    RAM_USO=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    DISCO_USO=$(df / | grep / | awk '{print $5}' | sed 's/%//')
    
    echo "Uso de CPU: $CPU_USO%" | tee -a "$LOG_FILE"
    echo "Uso de Memória RAM: $RAM_USO%" | tee -a "$LOG_FILE"
    echo "Uso de Disco: $DISCO_USO%" | tee -a "$LOG_FILE"

    # Alertas
    if (( $(echo "$RAM_USO > 80.0" | bc -l) )); then
        echo "[ALERTA] Uso de memória acima de 80%!" | tee -a "$LOG_FILE"
    fi

    # Status Apache
    if ps aux | grep "apache2" | grep -v "grep" > /dev/null; then
        echo "[OK] Apache em execução" | tee -a "$LOG_FILE"
    else
        echo "[ALERTA] Apache NÃO ESTÁ em execução!" | tee -a "$LOG_FILE"
    fi
}

monitorar_sistema