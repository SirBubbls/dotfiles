function emacs
   emacsclient -a "emacs" $argv >> /dev/null &;
   jobs >> /dev/null;
   disown %1;
end
