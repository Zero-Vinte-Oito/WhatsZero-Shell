alerta_reiniciar() {
    printf "${YELLOW} 🚫 🚫 🚫 🚫    A T E N Ç Ã O    🚫 🚫 🚫 🚫\n"
    printf " Após reiniciar o servidor, é necessário reiniciar os serviços \n para garantir que tudo funcione corretamente.${GRAY_LIGHT}\n\n\n"
}

alerta_snap() {
    printf "${RED} 🚫 🚫 🚫 🚫    A T E N Ç Ã O    🚫 🚫 🚫 🚫\n"
    printf " Esse procedimento pode causar danos ao servidor \n realize um ${YELLOW}SNAPSHOT${RED} de sua maquina para continuar${GRAY_LIGHT}\n\n\n"
}