versao_sistema(){
    local_repo_version="DEMO ALPHA"
}
################################
#                              #
#       SOBRE O SISTEMA        #
#                              #
################################
sobre_sistema() {
    versao_sistema
    print_banner
    print_voltar
    printf "${GREEN} WhatsZero Shell\n"  
    printf "${YELLOW} Versão: "
    printf "${GRAY_LIGHT} ${local_repo_version} "
    printf "\n"
    printf "${YELLOW} Autor: "
    printf "${GRAY_LIGHT} @028 - zero28.com.br "
    printf "\n"
    printf "${YELLOW} WhatsApp: "
    printf "${GRAY_LIGHT} +55 28 99991-0084"
    printf "\n"
    printf "${YELLOW} Página: "
    printf "${GRAY_LIGHT} https://shell.whatszero.com/"
    printf "\n"
    printf "\n\n"
    read -p "> " option

    case "${option}" in
        *) inquiry_options ;;
    esac
}