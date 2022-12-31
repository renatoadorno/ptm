#!/bin/bash

echo "🏷️ Starting ptm installation...."

ARCHIVE_UP="ptm_update.sh"
ARCHIVE="ptm_aliases.sh"
URL_UPDATE="https://raw.githubusercontent.com/RENATOADORNO/ptm/main/.ptm/ptm_update.sh"
URL_ARCHIVE="https://raw.githubusercontent.com/RENATOADORNO/ptm/main/.ptm/ptm_aliases.sh"
NAME='.ptm'

# Verifica se o diretorio existe
if [ -d $HOME/$NAME ] && [ -f $HOME/$NAME/$ARCHIVE  ] && [ -f $HOME/$NAME/$ARCHIVE_UP  ]
then
  echo
  echo -e "✅ ptm is already installed"
else
  echo
  mkdir $HOME/$NAME
  curl $URL_ARCHIVE  --output $HOME/$NAME/$ARCHIVE
  curl $URL_UPDATE  --output $HOME/$NAME/$ARCHIVE_UP
fi

BASHRC=$HOME/.bashrc
exec_bash() {
cat >> $BASHRC << EOF
# ptm ----
if [ -f $HOME/.ptm/ptm_aliases.sh ]; then
  . $HOME/.ptm/ptm_aliases.sh
  . $HOME/.ptm/ptm_update.sh
fi
EOF
}

ZSHRC=$HOME/.zshrc
exec_zsh() {
cat >> $ZSHRC << EOF
# ptm ----
if [ -f $HOME/.ptm/ptm_aliases.sh ]; then
  . $HOME/.ptm/ptm_aliases.sh
  . $HOME/.ptm/ptm_update.sh
fi
EOF
}

if [ -f ~/.zshrc ]; then
  exec_zsh
fi

if [ -f ~/.bashrc ]; then
  exec_bash
fi

# Teste o código de retorno para constatar se o arquivo foi criado ou não
if [ $? -eq 0 ]; then
  echo
  echo "✅ Installation successfully \033[0m "
else
  echo
  echo "🚫 Error installing ptm \033[0m "
fi

exit $?