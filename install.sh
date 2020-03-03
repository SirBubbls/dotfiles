#! /bin/bash

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P );
cd "$parent_path";

# .spacemacs file
rm ~/.spacemacs;
ln -s "$parent_path"/spacemacs/.spacemacs ~/.spacemacs;

# .doom files
rm -r ~/.doom.d;
ln -s "$parent_path"/doom/doom.d ~/.doom.d;

# personal dict
ln -s "$parent_path"/spacemacs/personal_dict ~/.emacs.d/personal_dict;

# Removing and replacing snippets folder
rm -r ~/.emacs.d/private/snippets;
ln -s "$parent_path"/spacemacs/.emacs.d/private/snippets ~/.emacs.d/private/snippets;

# Install Fish Config
rm -r ~/.config/fish;
ln -s "$parent_path"/fish ~/.config/fish;
