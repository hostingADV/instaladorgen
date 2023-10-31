#!/bin/bash
negro="\e[1;30m" && azul="\e[1;34m" && verde="\e[1;32m" && cian="\e[1;36m" && rojo="\e[1;31m" && purpura="\e[1;35m" && amarillo="\e[1;33m" && blanco="\e[1;37m" && sp="${verde}[✓]" && sx="${rojo}[✗]" && own="\e[1;32m＠\e[1;33mｄ\e[1;35mｒ\e[1;36mｏ\e[1;31mｗ\e[1;32mｋ\e[1;35mｉ\e[1;31mｄ\e[1;33m０\e[1;36m１\e[0m" && bar="${cian}════════════════════════════════════"
menu(){
local options=${#@} && local array && for((num=1; num<=$options; num++)); do
echo -ne "  $(echo -e "\e[1;34m 〔\e[1;32m$num\e[1;34m〕\e[1;36m➣➢") "
 array=(${!num})
 case ${array[0]} in
  *)echo -e "\033[1;37m${array[@]}";;
 esac
done
}

function linea(){
echo -e "${rojo}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${blanco}"
}

clear && clear
linea
echo -e "
	╻┏┓╻┏━┓╺┳╸┏━╸┏━╸┏┓╻
	┃┃┗┫┗━┓ ┃ ┃╺┓┣╸ ┃┗┫
	╹╹ ╹┗━┛ ╹ ┗━┛┗━╸╹ ╹"
linea
menu "crear instalador" "ver instaladores guardados" "soporte"
linea
echo -e "\e[1;30m"
read -p " ╰► Seleccione su opción: " x
case $x in
1)
linea
read -p "nombre de usuario: " name
read -p "nombre del repositorio: " repo
read -p "nombre de la rama: " rama
read -p "nombre del archivo: " arch
read -p "¿desea guardar el instalador y verlo más tarde? | responda: [s/n]: " w
 [[ $w = @(s|S|Si|si|y|Yes|yes|SI|yes) ]] && {
  read -p "ingrese un apodo con el cual usted pueda reconocerlo facilmente: " aLiaS
  linea && echo -e "${amarillo} SU INSTALADOR ES: ${blanco}apt-get update -y;apt-get upgrade -y;wget https://raw.githubusercontent.com/${name}/${repo}/${rama}/${arch};chmod +x ${arch};./${arch}"
  echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━\n \033[1;33mINSTALADOR \e[1;32m${aLiaS}: \n \033[0mapt-get update -y;apt-get upgrade -y;wget https://raw.githubusercontent.com/${name}/${repo}/${rama}/${arch};chmod +x ${arch};./${arch} \n \033[1;31m━━━━━━━━━━━━━━━━━━\033[0m">>.instaladores.log
 } || {
  echo -e "(⁠◔⁠‿⁠◔⁠) OK (⁠◔⁠‿⁠◔⁠)" && echo -e "${amarillo} SU INSTALADOR ES: ${blanco}apt-get update -y;apt-get upgrade -y;wget https://raw.githubusercontent.com/${name}/${repo}/${rama}/${arch};chmod +x ${arch};./${arch}"
 }
;;
2)
if [ ! -e './.instaladores.log' ]; then
cat .instaladores.log
echo -e "${rojo}[✗] Aún no ha guardado ningún instalador: "
fi
cat .instaladores.log
;;
3)
echo -e "via wa broxd"
;;
esac
