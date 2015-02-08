#!/bin/bash
# Play your favourite radio station with mplayer
# 

PS3='Please Choose a radio station to play: '
options=("My Music" "Pepper 96.6" "Red 96.3" "Athens RockFm 96.9" "Quit")
select opt in "${options[@]}"
do
   case $opt in
      "My Music")
         echo -e "\e[00;31m Now playing Home Music!!!\e[00m"
         mplayer -cache 1906 -cache-min 15 http://kermit:8001/
         ;;
      "Pepper 96.6")
         echo -e "\e[00;31m Now playing Pepper 96.6 Fm\e[00m"
         mplayer -cache 1906 http://pepper966.live24.gr:80/pepper9660
         ;;
      "Red 96.3")
         echo -e "\e[00;31m Now playing RedFm 96.3\e[00m"
         mplayer -cache 2906 http://radioskaigroup-lh.akamaihd.net/i/RedFM_1@178672/master.m3u8
         ;;
      "Athens RockFm 96.9")
         echo -e "\e[00;31m Now playing Athens RockFm 96.9\e[00m"
         mplayer -cache 1906 http://91.132.6.21:8003/
         ;;
      "Quit")
         break
         ;;
      *) echo invalid option;;
   esac
done

