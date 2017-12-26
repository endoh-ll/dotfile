#!/bin/zsh

host=$@;
while true;
  do rslt=`ping -c 1 $host | grep 'bytes from '`;
    if [ $? -gt 0 ];
      then echo -e "`date +'%Y-%m-%d %H:%M:%S'` $host Request timed out.";
      else echo "`date +'%Y-%m-%d %H:%M:%S'` $host`echo $rslt | cut -d  ':' -f 2`";
      sleep 1;
    fi;
  done;
