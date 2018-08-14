#!/bin/sh

sleep 3 #time (in s) for the DE to start; use ~20 for Gnome or KDE, less for Xfce/LXDE etc
conky -d & # the main conky with rings
sleep 3 #time for the main conky to start; needed so that the smaller ones draw above not below (probably can be lower, but we still have to wait 5s for the rings to avoid segfaults)
conky -d -c ~/.conky/conkyrc-kde
