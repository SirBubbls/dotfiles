#! /bin/bash

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P );
cd "$parent_path";

# .spacemacs file
rm ~/.spacemacs || true;
ln -s "$parent_path"/spacemacs/.spacemacs ~/.spacemacs;

# .doom files
rm -r ~/.doom.d || true;
ln -s "$parent_path"/doom/doom.d ~/.doom.d;

# personal dict
rm ~/.emacs.d/personal_dict || true;
ln -s "$parent_path"/spacemacs/personal_dict ~/.emacs.d/personal_dict || true;

# Removing and replacing snippets folder
rm -r ~/.emacs.d/private/snippets || true;
ln -s "$parent_path"/spacemacs/.emacs.d/private/snippets ~/.emacs.d/private/snippets || true;

# Install Fish Config
rm -r ~/.config/fish || true;
ln -s "$parent_path"/fish ~/.config/fish || true;
