#!/bin/bash

################################
#                              #
#             MENU             #
#                              #
################################
inquiry_options() {
  print_banner
  print_menuprincipal
  printf "${GREEN} Selecione uma opção Abaixo:"  
  printf "${WHITE}\n"
  printf " [1] Manutenção\n"
  printf " [2] Docker\n\n"
  printf " [0] Chave de Acesso\n"
  printf "\n\n"
  read -p "> " option

  case "${option}" in
    i) sobre ;;
    1) manutencao ;;
    2) docker_028 ;;
    0) chave_acesso ;;
    *) printf "\n${RED}Opção inválida. Tente novamente.\n" ; sleep 1 ; inquiry_options ;;
  esac
}

manutencao() {
  breadcrumb="Manutenção"
  menu_manutencao
  reiniciar_servicos
  atualizar_server
  reiniciar_servidor
  reiniciar_pm2
}

docker_028() {
  breadcrumb="Docker"
  menu_docker_028
  exibir_containers
  reiniciar_portainer
  reiniciar_postgres
  reiniciar_redis
}

sobre() {
  breadcrumb="Sobre"
  sobre_sistema
  atualizar_shell
  versao_sistema
}

chave_acesso() {
  breadcrumb="Chave do Sistema"
  menu_key
  gerar_key
  exibir_key
}