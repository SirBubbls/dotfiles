;;; ~/.doom.d/bindings.el -*- lexical-binding: t; -*-

(map! :n "t" 'evil-insert
      :n "T" 'evil-insert-line
      :n "l" 'evil-open-below
      :n "L" 'evil-open-above
      :n "f" 'evil-ex-search-next
      :n "F" 'evil-ex-search-previous
      :n "h" 'evil-backward-char
      :n "n" 'evil-next-line
      :n "e" 'evil-previous-line
      :n "i" 'evil-forward-char
      )
