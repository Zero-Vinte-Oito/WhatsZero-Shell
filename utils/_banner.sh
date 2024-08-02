#!/bin/bash
#
# Print banner art.

#######################################
# Print a board. 
# Globals:
#   BG_BROWN
#   NC
#   WHITE
#   CYAN_LIGHT
#   RED
#   GREEN
#   YELLOW
# Arguments:
#   None
#######################################
print_banner() {
  clear
  printf "\n\n"
  printf "${NC}";
  printf "\n"
  printf "${CYAN_LIGHT}";
  printf " ████████  ███████  ██████    █████   ███████    █████ \n";
  printf "       ██  ██       ██  ██   ██   ██        ██  ██   ██\n";
  printf "   ████    █████    █████    ██   ██    ████    ███████\n";
  printf " ██        ██       ██  ██   ██   ██  ██        ██   ██\n";
  printf " ████████  ███████  ██   ██   █████   ███████    █████ \n";
  printf "${NC}";
  printf "\n"
  printf "${CYAN_LIGHT} @ 028 - zero28.com.br"
  printf "${NC}";
  printf "\n\n"

}