#!/bin/sh

exec xautolock -time 10 -locker "~/.config/awesome/i3lock-fancy/lock" \
  -notify 30 \
  -notifier "notify-send -u critical -t 10000 -- 'LOCKING screen in 30 seconds'" \
  -detectsleep
