#!/bin/bash
# Instalação e validação do Apache para o ambiente de estoque

LOG_FILE="/app/logs/02_apache.log"

instalar_apache() {
    echo "Instalando Apache2..." >> "$LOG_FILE"
    apt-get install -y apache2 >> "$LOG_FILE" 2>&1
}

verificar_apache() {
    if dpkg -l | grep -q apache2; then
        echo "[OK] Apache instalado com sucesso!" | tee -a "$LOG_FILE"
    else
        echo "[ERRO] Apache não encontrado." | tee -a "$LOG_FILE"
    fi
}

versao_apache() {
    echo "Versão do Apache instalada:" | tee -a "$LOG_FILE"
    apache2 -v | tee -a "$LOG_FILE"
}

# Execução
echo "========= INSTALANDO SERVIÇO WEB DE ESTOQUE ========="
instalar_apache
verificar_apache
versao_apache