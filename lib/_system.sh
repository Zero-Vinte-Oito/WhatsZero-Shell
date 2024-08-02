################################
#                              #
#       MENU MANUTENÇÃO        #
#                              #
################################
menu_manutencao() {
  print_banner
  print_voltar
  printf "${GREEN} Selecione uma opção Abaixo:"  
  printf "${GRAY_LIGHT}\n"
  printf " [1] Reiniciar os Serviços\n"
  printf " [2] Atualizar Servidor\n"
  printf " [3] Reiniciar Servidor\n"
  printf "\n\n"
  read -p "> " option

  case "${option}" in
    1) reiniciar_servicos ;;
    2) atualizar_server ;;
    3) reiniciar_servidor ;;
    *) inquiry_options ;;
  esac
}

################################
#                              #
#     ATUALIZAR SERVIDOR       #
#                              #
################################
atualizar_server(){
  print_banner
  print_cancelar
  printf "${GREEN} 💻 Atualizando servidor...${GRAY_LIGHT}\n\n"
  sleep 2
  sudo su - root <<EOF
  apt -y update && apt -y upgrade
EOF

  print_banner
  print_cancelar
  printf "${GREEN} 💻 Setando timezone...${GRAY_LIGHT}"
  sleep 2
  sudo su - root <<EOF
  timedatectl set-timezone America/Sao_Paulo
EOF

    print_banner
    print_voltar
    printf "${GREEN} ✔ Sistema Atualizado!${GRAY_LIGHT}\n\n"
    printf " Pressione enter para voltar\n\n"

    read -p "> " option
    case "${option}" in
        *) menu_manutencao ;;
    esac
}

################################
#                              #
#     REINICIAR SERVIÇOS       #
#                              #
################################
reiniciar_servicos() {
  print_banner
  print_cancelar
  reiniciar_pm2
  
  print_banner
  print_voltar
  printf "${GREEN} ✔ Serviços Reiniciados!${GRAY_LIGHT}\n\n"
  printf " Pressione enter para voltar\n\n"
  read -p "> " option

  case "${option}" in
    *) menu_manutencao ;;
  esac

}

################################
#                              #
#     COMANDO PM2 RESTART      #
#                              #
################################
reiniciar_pm2() {
  printf "${GREEN} 🛠️ Reiniciando os serviços... ${GRAY_LIGHT}\n\n"

  if [ "$(id -u)" -ne "0" ]; then
    echo "${YELLOW} Este script deve ser executado como root.\n"
    menu_manutencao
  fi

  sudo -u deployzdg pm2 restart all

  sleep 3
}

################################
#                              #
#     REINICIAR SERVIDOR  XX   #
#                              #
################################
reiniciar_servidor() {
  print_banner
  print_cancelar
  printf "${GREEN} 🛠️ Reiniciar Servidor ${GRAY_LIGHT}\n\n"
  alerta_reiniciar
  read -p " Tem certeza de que deseja reiniciar o servidor? (s/n): " confirmacao
  printf "\n\n"
  if [[ "$confirmacao" =~ ^[Ss]$ ]]; then
      echo " 🛠️ Reiniciando o servidor..."
      sudo reboot
      # Nota: Este código pode não ser alcançado se o comando for bem-sucedido, pois o servidor reiniciará.
      if [ $? -eq 0 ]; then
          echo "✔ O servidor foi reiniciado com sucesso."
      else
          echo "🚫 Falha ao reiniciar o servidor."
      fi
  else
      echo " 🚫 Operação Cancelada"
      sleep 2
      menu_manutencao
  fi
}