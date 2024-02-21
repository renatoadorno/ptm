#!/bin/bash

init() {
  clear
  echo -e "  "
}

apply_style() {
  local style_code="$1" # Código do estilo (cor, negrito, etc.)
  local text="$2"       # Texto a ser estilizado
  echo -e "${style_code}${text}\033[0m"
}

title() {
  apply_style "\033[1;33m" "$1"
}

text() {
  echo -e "\033[36m$1\033[0m"
}

text_white() {
  echo -e "\033[37m$1\033[0m"
}

success_bold() {
  apply_style "\033[1;32m" "✔︎ $1"
}

erro_bold() {
  apply_style "\033[1;31m" "✕ $1"
}


init
title "  ██████       ██▓███   ██▀███   ██▓ ██▒   █▓ ▄▄▄      ▄▄▄█████▓▓█████ "
title "▒██    ▒      ▓██░  ██▒▓██ ▒ ██▒▓██▒▓██░   █▒▒████▄    ▓  ██▒ ▓▒▓█   ▀ "
title "░ ▓██▄        ▓██░ ██▓▒▓██ ░▄█ ▒▒██▒ ▓██  █▒░▒██  ▀█▄  ▒ ▓██░ ▒░▒███   "
title "  ▒   ██▒     ▒██▄█▓▒ ▒▒██▀▀█▄  ░██░  ▒██ █░░░██▄▄▄▄██ ░ ▓██▓ ░ ▒▓█  ▄ "
title "▒██████▒▒ ██▓ ▒██▒ ░  ░░██▓ ▒██▒░██░   ▒▀█░   ▓█   ▓██▒  ▒██▒ ░ ░▒████▒"
title "▒ ▒▓▒ ▒ ░ ▒▓▒ ▒▓▒░ ░  ░░ ▒▓ ░▒▓░░▓     ░ ▐░   ▒▒   ▓▒█░  ▒ ░░   ░░ ▒░ ░"
title "░ ░▒  ░ ░ ░▒  ░▒ ░       ░▒ ░ ▒░ ▒ ░   ░ ░░    ▒   ▒▒ ░    ░     ░ ░  ░"
title "░  ░  ░   ░   ░░         ░░   ░  ▒ ░     ░░    ░   ▒     ░         ░   "
title "      ░    ░              ░      ░        ░        ░  ░            ░  ░"
title "           ░                             ░                             "
# title " ________            ________    ________      ___      ___      ___  ________      _________    _______      "
# title "|\   ____\          |\   __  \  |\   __  \    |\  \    |\  \    /  /||\   __  \    |\___   ___\ |\  ___ \     "
# title "\ \  \___|_         \ \  \|\  \ \ \  \|\  \   \ \  \   \ \  \  /  / /\ \  \|\  \   \|___ \  \_| \ \   __/|    "
# title " \ \_____  \         \ \   ____\ \ \   _  _\   \ \  \   \ \  \/  / /  \ \   __  \       \ \  \   \ \  \_|/__  "
# title "  \|____|\  \   ___   \ \  \___|  \ \  \\  \|   \ \  \   \ \    / /    \ \  \ \  \       \ \  \   \ \  \_|\ \ "
# title "    ____\_\  \ |\__\   \ \__\      \ \__\\ _\    \ \__\   \ \__/ /      \ \__\ \__\       \ \__\   \ \_______\ "
# title "   |\_________\\|__|    \|__|       \|__|\|__|    \|__|    \|__|/        \|__|\|__|        \|__|    \|_______| "
# title "   \|_________|                                                                                               "
# title "                                                                                                               "
# title "                                                                                                               "


title "► Execute scripts de instalaçãp privados, direto do GitHub token dos scripts do github geralmente ficam na url"
title "► Token dos scripts do github geralmente ficam na url"

# Solicita ao usuário a URL do script
text "➤ Insira a URL do script:"
read SCRIPT_URL

# Solicita ao usuário o token de acesso pessoal
text "➤ Insira seu token de acesso pessoal (Personal Access Token):"
read -s TOKEN # O '-s' é para não ecoar o input

# Confirma as entradas com o usuário
text "URL: $SCRIPT_URL"
text "Token: [OCULTO]"
text_white "Continuar? (s/n)"
read CONFIRMACAO

if [ "$CONFIRMACAO" != "s" ]; then
  erro_bold "Execução cancelada"
  exit 0
fi

# Baixa o script usando curl com autenticação via token
curl -H "Authorization: token $TOKEN" -o install.sh $SCRIPT_URL

# Verifica se o download foi bem-sucedido
if [ $? -eq 0 ]; then
    success_bold "Download concluído com sucesso."

    # Solicita ao usuário confirmação antes de executar o script
    text_white "Deseja executar o script baixado? (s/n)"
    read EXECUTAR

    if [ "$EXECUTAR" = "s" ]; then
        # Executa o script
        bash install.sh
        # Ou use "zsh temp_script.sh" se o script for específico para zsh

        # Limpa o script baixado
        rm install.sh
    else
        erro_bold "Execução cancelada"
        # Limpa o script baixado
        rm install.sh

        exit 0
    fi
else
  erro_bold "Erro ao executar, script.........."
fi

title "► Finalizando.........."
exit 0