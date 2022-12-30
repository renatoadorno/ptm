#!/bin/bash
ZIP='pcm.zip'
URL='https://github.com/RENATOADORNO/pcm/archive/refs/heads/aliases.zip'
DIR='pcm-aliases'
NAME='.pcm'

wget -O $ZIP $URL
unzip $ZIP -d $HOME/
mv $HOME/$DIR $HOME/$NAME

if [ -f $ZIP ]
then
  rm $ZIP
fi

BASHRC=$HOME/.bashrc
exec_bash() {
cat >> $BASHRC << EOF
# pcm
if [ -f ~/.pcm/pcm_aliases  ]; then
  . ~/.pcm/pcm_aliases 
fi
EOF
}

ZSHRC=$HOME/.zshrc
exec_zsh() {
cat >> $ZSHRC << EOF
# pcm
if [ -f ~/.pcm/pcm_aliases  ]; then
  . ~/.pcm/pcm_aliases 
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
  echo "pcm instalado com sucesso."
else
  echo "não foi posivel instalar o pcm"
fi

exit $?