print_menuprincipal() {
    printf "${CYAN_LIGHT}=========================================================\n"
    printf "█ "
    printf "      VERSÃO DEMO       "
    printf " █ "
    printf "       [i] Sobre 📄       "
    printf " █\n"
    printf "=========================================================\n\n${GRAY_LIGHT}"
}

print_voltar() {
    printf "${CYAN_LIGHT}=========================================================\n"
    printf "█ "
    printf "  [X] Voltar                   "
    printf ">>>"
    printf "${WHITE} ${breadcrumb} ${CYAN_LIGHT}<<<\n"
    printf "=========================================================\n\n${GRAY_LIGHT}"
}

print_cancelar() {
    printf "${CYAN_LIGHT}=========================================================\n"
    printf "█ "
    printf "                         [Ctrl+C] Cancelar o Processo"
    printf " █ \n"
    printf "=========================================================${GRAY_LIGHT}\n\n"
}