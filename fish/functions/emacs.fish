function emacs
   emacsclient -a "emacs" $argv &;
   jobs;
   disown %1;
end
