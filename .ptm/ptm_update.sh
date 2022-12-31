ARCHIVE="ptm_aliases.sh"
NAME='.ptm'

ptm-up() {
  echo " \033[0;33m Starting update.... \033[0m "
  echo " \033[0;33m Checking files.... \033[0m "

  # Verifica se o diretorio existe
  if [ -d $HOME/$NAME ]
  then
    echo
    echo " \033[0;32m Dir Ok \033[0m "
  else
    echo
    echo " \033[0;31m Dir not found..... \033[0m "
    echo " \033[0;32m Updating..... \033[0m "
    echo
    mkdir $HOME/$NAME
    echo
    echo " \033[0;32m Dir Ok \033[0m "
  fi

  # Verifica se o arquivo "ptm_aliases.sh" existe
  if [ -f $HOME/$NAME/$ARCHIVE ]
  then
    echo
    echo " \033[0;32m Updating..... \033[0m "
    rm $HOME/$NAME/$ARCHIVE
    curl https://raw.githubusercontent.com/RENATOADORNO/ptm/main/.ptm/ptm_aliases.sh --output $ARCHIVE
    echo
    echo " \033[0;32m Update successfully \033[0m "
  else
    echo
    echo " \033[0;31m File not found..... \033[0m "
    echo " \033[0;32m Updating..... \033[0m "
    echo
    curl https://raw.githubusercontent.com/RENATOADORNO/ptm/main/.ptm/ptm_aliases.sh --output $ARCHIVE
    echo
    echo " \033[0;32m Update successfully \033[0m "
  fi
}
