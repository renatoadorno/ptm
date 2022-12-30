#!/bin/bash
ZIP='ptm.zip'
URL='https://github.com/RENATOADORNO/ptm/archive/refs/heads/main.zip'
DIR='ptm-main'
NAME='.ptm'

wget -O $ZIP $URL
unzip $ZIP -d $HOME/
mv $HOME/$DIR/$NAME $HOME/$NAME

if [ -f $ZIP ]
then
  rm $ZIP
fi

if [ -f $HOME/$DIR ]
then
  rm -R $HOME/$DIR
fi

BASHRC=$HOME/.bashrc
exec_bash() {
cat >> $BASHRC << EOF
# ptm
if [ -f $HOME/.ptm/ptm_aliases.sh ]; then
  . ~/.ptm/ptm_aliases.sh 
fi
EOF
}

ZSHRC=$HOME/.zshrc
exec_zsh() {
cat >> $ZSHRC << EOF
# ptm
if [ -f $HOME/.ptm/ptm_aliases.sh ]; then
  . ~/.ptm/ptm_aliases.sh 
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
  echo "ptm instalado com sucesso."
else
  echo "não foi posivel instalar o ptm"
fi

exit $?