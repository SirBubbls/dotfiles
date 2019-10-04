#! bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"

# .spacemacs file
rm ~/.spacemacs
ln -s "$parent_path"/spacemacs/.spacemacs ~/.spacemacs

# personal dict
ln -s "$parent_path"/spacemacs/personal_dict ~/.emacs.d/personal_dict


# ln -s "$parent_path/spacemacs/.emacs.d/private/snippets/org-mode ~/.emacs.d/private/snippets/org-mode
# ln -s "$parent_path/spacemacs/.emacs.d/private/snippets/python-mode" "~/.emacs.d/private/snippets/python-mode"
