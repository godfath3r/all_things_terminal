#!/bin/bash
# Play your favourite radio station with mplayer
# 

PS3='Please Choose a radio station to play: '
options=("Pepper 96.6" "Red 96.3" "Quit")
select opt in "${options[@]}"
do
   case $opt in
      "Pepper 96.6")
         echo -e "\e[00;31m Now playing Pepper 96.6 Fm\e[00m"
         mplayer http://pepper966.live24.gr:80/pepper9660
         ;;
      "Red 96.3")
         echo -e "\e[00;31m Now playing RedFm 96.3\e[00m"
         mplayer http://radioskaigroup-lh.akamaihd.net/i/RedFM_1@178672/master.m3u8
         ;;
      "Quit")
         break
         ;;
      *) echo invalid option;;
   esac
done

