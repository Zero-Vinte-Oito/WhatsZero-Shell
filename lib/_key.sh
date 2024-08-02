################################
#                              #
#       MENU CHAVE KEY         #
#                              #
################################
menu_key() {
  print_banner
  print_voltar
  printf "${GREEN} Selecione uma opção Abaixo:"  
  printf "${WHITE}\n"
  printf " [1] Criar/Alterar Key\n"
  printf " [2] Exibir Key\n"
  printf "\n\n"
  read -p "> " option

  case "${option}" in
    1) gerar_key ;;
    2) exibir_key ;;
    *) inquiry_options ;;
  esac
}


################################
#                              #
#       GERAR CHAVE KEY        #
#                              #
################################
gerar_key() {
  print_banner
  print_cancelar

  #Verificando se chave ja existe
  local chave_ssh="$HOME/.ssh/id_rsa"
  if [ -f "$chave_ssh" ]; then
    printf "${YELLOW} A chave SSH já existe, deseja alterar? (S/N) .${GRAY_LIGHT}\n\n"
    read -p "> " option

    case "${option}" in
      s) ;;
      S) ;;
      *) menu_key;;
    esac
  fi

  print_banner
  print_cancelar

  printf "${GREEN} 🔑 Gerando nova chave SSH!${GRAY_LIGHT}\n\n"
  read -p " Digite seu e-mail para a chave SSH: " email
 
  if [ -f "$chave_ssh" ]; then
    printf "${YELLOW} Alterando a chave...${GRAY_LIGHT}\n"
    rm -f "$chave_ssh"
    rm -f "$chave_ssh.pub"
  fi

  ssh-keygen -t rsa -b 4096 -C "$email" -f "$chave_ssh" -N "" -q

  if [ $? -ne 0 ]; then
    printf "${RED} Erro ao gerar a chave SSH.${GRAY_LIGHT}\n"
    return 1
  fi

  sleep 3

  print_banner
  print_voltar
  printf "${GREEN} 🔑 Chave Gerada com Sucesso!${GRAY_LIGHT}\n\n"
  printf " Sua nova chave pública é:\n"
  printf "${RED}\n"
  cat "$HOME/.ssh/id_rsa.pub"
  printf "${GREEN}\n Copie essa chave em um local seguro!${GRAY_LIGHT}\n"
  printf "\n\n"
  read -p "> " option

  case "${option}" in
    *) menu_key ;;
  esac
}

################################
#                              #
#      EXIBIR CHAVE KEY        #
#                              #
################################
exibir_key() {
  print_banner
  print_voltar
  printf " Sua nova pública é:\n"
  printf "${RED}\n"
  cat "$HOME/.ssh/id_rsa.pub"
  printf "${GREEN}\n Copie essa chave em um local seguro!${GRAY_LIGHT}\n"
  printf "\n\n"
  read -p "> " option

    case "${option}" in
    *) menu_key ;;
  esac
}