#!/bin/bash
# Controle de acesso e permissões de operadores de estoque

LOG_FILE="/app/logs/08_permissoes.log"

configurar_usuarios() {
    echo "========= CONFIGURANDO PERMISSÕES DE ACESSO =========" | tee -a "$LOG_FILE"
    
    # Cria grupo se não existir
    if ! getent group estoque_ops > /dev/null; then
        groupadd estoque_ops >> "$LOG_FILE" 2>&1
        echo "Grupo 'estoque_ops' criado." | tee -a "$LOG_FILE"
    fi

    # Criar usuário se não existir
    if ! id -u gerente_estoque > /dev/null 2>&1; then
        useradd -m -g estoque_ops -s /bin/bash gerente_estoque >> "$LOG_FILE" 2>&1
        echo "Usuário 'gerente_estoque' criado." | tee -a "$LOG_FILE"
    fi

    # Aplicação segura de chown e chmod nas pastas temáticas
    chown -R gerente_estoque:estoque_ops /app/estoque
    chmod -R 750 /app/estoque
    
    echo "[OK] Permissões e donos definidos com segurança (Modo 750)!" | tee -a "$LOG_FILE"
}

configurar_usuarios