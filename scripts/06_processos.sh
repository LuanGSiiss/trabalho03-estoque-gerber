#!/bin/bash
# Processos do Sistema

listar_processos() {
    echo "=== PROCESSOS ATIVOS NO CONTAINER ==="
    ps aux
}

buscar_processo() {
    if [ -z "$1" ]; then
        echo "[AVISO] Informe um termo de busca. Ex: $0 buscar apache"
        return 1
    fi
    echo "=== BUSCANDO POR: $1 ==="
    ps aux | grep -i "$1" | grep -v "grep"
}

matar_processo() {
    # Impede encerramento sem PID
    if [ -z "$1" ]; then
        echo "[ERRO] Código de Segurança: Você precisa informar um PID para encerrar. Ex: $0 matar 1234"
        return 1
    fi
    echo "Encerrando processo PID: $1"
    kill -9 "$1" 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "[OK] Processo $1 finalizado."
    else
        echo "[ERRO] Não foi possível matar o processo $1."
    fi
}

# Tratamento dos parâmetros de execução
case "$1" in
    listar) listar_processos ;;
    buscar) buscar_processo "$2" ;;
    matar)  matar_processo "$2" ;;
    *) echo "Uso correto: $0 {listar|buscar <nome>|matar <PID>}" ;;
esac