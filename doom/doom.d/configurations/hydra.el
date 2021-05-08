;;; ../Dropbox/Configurations/dotfiles/doom/doom.d/hydra.el -*- lexical-binding: t; -*-

 (defhydra hydra-window ()
   "
Movement^^        ^Split^              ^Switch^              ^Resize^
----------------------------------------------------------------
_h_ ←             _v_ertical           _b_uffer              _H_ X←
_n_ ↓             _s_ horizontal       _a_ce 1               _N_ X↓
_e_ ↑             _z_ undo                                 _E_ X↑
_i_ →             _Z_ reset                                _I_ X→
_F_ollow          _D_lt Other          _S_ave
_SPC_ cancel      _o_nly this          _d_elete
"
   ("h" windmove-left :color blue)
   ("n" windmove-down :color blue)
   ("e" windmove-up :color blue)
   ("i" windmove-right :color blue)
   ("H" hydra-move-splitter-left)
   ("N" hydra-move-splitter-down)
   ("E" hydra-move-splitter-up)
   ("I" hydra-move-splitter-right)
   ("b" helm-mini)
   ("F" follow-mode)
   ("a" (lambda ()
          (interactive)
          (ace-window 1)
          (add-hook 'ace-window-end-once-hook
                    'hydra-window/body))
       )
   ("v" (lambda ()
          (interactive)
          (split-window-right)
          (windmove-right)) :color blue
       )
   ("s" (lambda ()
          (interactive)
          (split-window-below)
          (windmove-down)) :color blue
       )
   ("S" save-buffer)
   ("d" delete-window :color blue)
   ("D" (lambda ()
          (interactive)
          (ace-window 16)
          (add-hook 'ace-window-end-once-hook
                    'hydra-window/body))
       )
   ("o" delete-other-windows)
   ("z" (progn
          (winner-undo)
          (setq this-command 'winner-undo))
   )
   ("Z" winner-redo)
   ("SPC" nil)
   )


(defhydra hydra-gist ()
   "
^List^               ^New Gist^                   ^Action^
--------------------------------------------------------------------------
_l_ist               _b_ From Buffer              _S_tar
_s_tarred            _r_ From Region
"
   ("l" gist-list)
   ("b" gist-buffer :color blue)
   ("r" gist-region :color blue)
   ("s" gist-list-starred)
   ("S" gist-star)
  )

(defhydra hydra-smerge ()
  "
^Move^                      ^Resolve^              ^Other^
----------------------------------------------------------------------
_n_ext                      _m_ine                 _A_utomatic combine
pr_e_vious                  _l_ower                _R_esolve all
                          _b_ase
                          _c_urrent
                          _a_utomatic
"
("n" smerge-next)
("e" smerge-prev)

("m" smerge-keep-mine)
("l" smerge-keep-lower)
("b" smerge-keep-base)
("c" smerge-keep-current)
("a" smerge-resolve)

("A" smerge-auto-combine)
("R" smerge-resolve-all)
  )

(map!
 (:leader
  (:prefix "g"
   :desc "SMerge" "m" #'hydra-smerge/body
   :desc "Gists" "i" #'hydra-gist/body)

 
  :desc "Window Management" "w" #'hydra-window/body
  ))

(defhydra hydra-noter ()
  "
^Note^                            ^Other^
----------------------------------------------------------------------
_i_nsert                          _K_ill Session
insert _p_ercise                  create _S_keleton
_n_ext note
pr_e_vious note
"
("i" org-noter-insert-note :color blue)
("p" org-noter-insert-precise-note :color blue)

("n" org-noter-sync-next-note :color red)
("e" org-noter-sync-prev-note :color red)

("S" org-noter-create-skeleton :color blue)
("K" org-noter-kill-session :color blue))

(map!
 :after org-noter
 :map org-noter-doc-mode-map
 :g (kbd "s-n") 'hydra-noter/body
 :map org-noter-notes-mode-map
 :g (kbd "s-n") 'hydra-noter/body
 )
