################################
#                              #
#        MENU DOCKER           #
#                              #
################################
menu_docker_028() {
  print_banner
  print_voltar
  printf "${GREEN} Selecione uma opção Abaixo:"  
  printf "${WHITE}\n"
  printf " [1] Exibir containers\n"
  printf " [2] Reiniciar Portainer\n"
  printf " [3] Reiniciar Postgres\n"
  printf " [4] Reiniciar Redis\n"
  printf "\n\n"
  read -p "> " option

  case "${option}" in
    1) exibir_containers ;;
    2) reiniciar_portainer ;;
    3) reiniciar_postgres ;;
    4) reiniciar_redis ;;
    *) inquiry_options ;;
  esac
}

################################
#                              #
#      EXIBIR CONTAINERS       #
#                              #
################################
exibir_containers() {
  print_banner
  print_cancelar
  printf "${GREEN} 🐳 Contêineres Docker 🐳 ${GRAY_LIGHT}\n\n\n"

  docker ps

  printf "\n\n\n"
  printf " Pressione enter para voltar\n\n"
  read -p "> " option

  case "${option}" in
    *) menu_docker_028 ;;
  esac
}

################################
#                              #
#     REINICIAR PORTAINER      #
#                              #
################################
reiniciar_portainer() {
  print_banner
  print_cancelar
  printf "${GREEN} 🛠️ Reiniciando o contêiner Portainer...${GRAY_LIGHT}\n\n\n"

  if [ "$(id -u)" -ne 0 ]; then
    printf "${RED} Erro: Esta operação deve ser executada como root.${GRAY_LIGHT}\n"
    sleep 2
    menu_docker_028
  fi

  printf "${YELLOW} ❌ Parando o contêiner Portainer...${RESET}\n"

  docker stop portainer

  if [ $? -ne 0 ]; then
    printf "${RED} Erro ao parar o contêiner Portainer.${RESET}\n"
    sleep 3
    menu_docker_028
  fi

  sleep 1

  printf "${WHITE} ... ${RESET}\n"

  sleep 3

  printf "${GREEN} 🖥💻 Iniciando o contêiner Portainer...${RESET}\n"

  docker start portainer

  sleep 3

  if [ $? -ne 0 ]; then
    printf "${RED} Erro ao iniciar o contêiner Portainer.${RESET}\n"
    sleep 2
    menu_docker_028
  fi

  print_banner
  print_voltar
  printf "${GREEN} ✔ Portainer Reiniciado!${GRAY_LIGHT}\n\n"
  printf " Pressione enter para voltar\n\n"
  read -p "> " option

  case "${option}" in
    *) menu_docker_028 ;;
  esac
}

################################
#                              #
#     REINICIAR POSTGRES       #
#                              #
################################
reiniciar_postgres() {
  print_banner
  print_cancelar
  printf "${GREEN} 🛠️ Reiniciando o contêiner Postgres...${GRAY_LIGHT}\n\n\n"

  if [ "$(id -u)" -ne 0 ]; then
    printf "${RED} Erro: Esta operação deve ser executada como root.${GRAY_LIGHT}\n"
    sleep 2
    menu_docker_028
  fi

  printf "${YELLOW} ❌ Parando o contêiner Postgres...${RESET}\n"

  docker stop postgresql

  if [ $? -ne 0 ]; then
    printf "${RED} Erro ao parar o contêiner Postgres.${RESET}\n"
    sleep 3
    menu_docker_028
  fi

  sleep 1

  printf "${WHITE} ... ${RESET}\n"

  sleep 3

  printf "${GREEN} 🖥💻 Iniciando o contêiner Postgres...${RESET}\n"

  docker start postgresql

  sleep 3

  if [ $? -ne 0 ]; then
    printf "${RED} Erro ao iniciar o contêiner Postgres.${RESET}\n"
    sleep 2
    menu_docker_028
  fi

  print_banner
  print_voltar
  printf "${GREEN} ✔ Postgres Reiniciado!${GRAY_LIGHT}\n\n"
  printf " Pressione enter para voltar\n\n"
  read -p "> " option
  
  case "${option}" in
    *) menu_docker_028 ;;
  esac
}

################################
#                              #
#     REINICIAR REDIS          #
#                              #
################################
reiniciar_redis(){
  print_banner
  print_cancelar
  printf "${GREEN} 🛠️ Reiniciando o contêiner Redis...${GRAY_LIGHT}\n\n\n"

  if [ "$(id -u)" -ne 0 ]; then
    printf "${RED} Erro: Esta operação deve ser executada como root.${GRAY_LIGHT}\n"
    sleep 2
    menu_docker_028
  fi

  printf "${YELLOW} ❌ Parando o contêiner Redis...${RESET}\n"

  docker stop redis-zpro

  if [ $? -ne 0 ]; then
    printf "${RED} Erro ao parar o contêiner Redis.${RESET}\n"
    sleep 3
    menu_docker_028
  fi

  sleep 1

  printf "${WHITE} ... ${RESET}\n"

  sleep 3

  printf "${GREEN} 🖥💻 Iniciando o contêiner Redis...${RESET}\n"

  docker start redis-zpro

  sleep 3

  if [ $? -ne 0 ]; then
    printf "${RED} Erro ao iniciar o contêiner Redis.${RESET}\n"
    sleep 2
    menu_docker_028
  fi

  print_banner
  print_voltar
  printf "${GREEN} ✔ Redis Reiniciado!${GRAY_LIGHT}\n\n"
  printf " Pressione enter para voltar\n\n"
  read -p "> " option

  case "${option}" in
    *) menu_docker_028 ;;
  esac
}