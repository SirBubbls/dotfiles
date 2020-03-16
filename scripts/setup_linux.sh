if [[ "$(hostnamectl)" == *"Ubuntu"* ]]; then
    echo "Ubuntu";
    # Fish
    apt-get install fish;
    chsh -s /usr/bin/fish;
    curl -L https://get.oh-my.fish | fish;
    omf install bobthefish;

    # Emacs
    add-apt-repository ppa:kelleyk/emacs;
    apt update;
    apt install emacs26;
    git clone https://github.com/hlissner/doom-emacs ~/.emacs.d;
    ~/.emacs.d/bin/doom install;

    # Font
    apt-get install unzip;
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Iosevka.zip ~/Iosevka.zip;
    mkdir ~/.fonts;
    unzip ~/Iosevka.zip;
    mv ~/Iosevka/* ~/.fonts/;

    # Languages
    apt-get install cmake;
else
    echo "Unsupported";
fi
