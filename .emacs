;;; el files ******************************************************************
(add-to-list 'load-path "~/.emacs.d/")
(load-file "~/.emacs.d/macros.el")
(load-file "~/.emacs.d/fonctions.el")
(load-file "~/.emacs.d/pg.el")
(load-file "~/.emacs.d/php-mode.el")

;;; Standard ******************************************************************
(put 'eval-expression 'disabled nil)
(setq column-number-mode t)
(setq line-number-mode t)
(setq require-final-newline t)
(display-time)
(set-language-environment 'UTF-8)

;;; Accents *******************************************************************
(load-library "iso-acc" )
(load-library "iso-insert" )
(iso-accents-customize "french")
(iso-accents-mode 1)

;;; ISpell ********************************************************************
(setq ispell-dictionary "francais")

;;; Text **********************************************************************
(add-hook 'text-mode-hook
	  (function (lambda ()
                      (iso-accents-mode t)
		      (turn-on-auto-fill))))

;;; Java **********************************************************************

(defun java-mode-cheat ()
  (c++-mode)
  (java-mode))

(autoload 'java-mode "java-mode" "Major mode for Java" t)

(setq java-mode-hook
      (lambda()
        (load-library "java-hilite")))

;;; MEC ***********************************************************************

(autoload 'mec-mode "mec-mode" "Major mode for MEC" t)

;;; SML ***********************************************************************

(autoload 'sml-mode "sml-mode" "Major mode for ML" t)
(autoload 'sml "sml-proc" "Run an inferior ML process" t)

(setq sml-mode-hook
      (lambda()
        (load-library "sml-hilite")
	(local-set-key "\^c\^f" 'sml-send-function)))

(setq inferior-sml-mode-hook
      (lambda()
	(sml-temp-threshold 512)))


;;; File Modes ****************************************************************

(setq auto-mode-alist
      (cons '("\\.c$"      . c-mode)
      (cons '("\\.h$"      . c++-mode)
      (cons '("\\.cc$"     . c++-mode)
      (cons '("\\.c++$"    . c++-mode)
      (cons '("\\.cpp$"    . c++-mode)
      (cons '("\\.java$"   . java-mode-cheat)
      (cons '("\\.stk$"    . scheme-mode)
      (cons '("\\.stklos$" . scheme-mode)
      (cons '("\\.ss$"     . mec-mode)
      (cons '("\\.st$"     . mec-mode)
      (cons '("\\.fpf$"    . mec-mode)
      (cons '("\\.calcul$" . mec-mode)
      (cons '("\\.sml$"    . sml-mode)
      (cons '("\\.ML$"     . sml-mode)
      (cons '("\\.html$"   . html-mode)
      (cons '("\\.tex$"    . tex-mode)
      auto-mode-alist)))))))))))))))))

;;; Keys **********************************************************************

(define-key global-map "\^x\^z" 'suspend-emacs)
(define-key global-map "\^z"    'suspend-emacs-old)
(define-key global-map "\eg"    'goto-line)
(define-key global-map "\^t"    'transpose-without-move)

(global-set-key [insert] 'overwrite-mode)
(global-set-key [delete] 'delete-char)
(global-set-key [home]   'beginning-of-line)
(global-set-key [end]    'end-of-line)

(global-set-key [S-right] 'forward-word)
(global-set-key [S-left]  'backward-word)

;; (global-set-key [f1]     'help-for-help)
;;utilisation de man par F1
(global-set-key [f1] (lambda () (interactive)  (manual-entry  (current-word))))
(global-set-key [f2]     'save-buffer)
(global-set-key [f3]     'find-file)
(global-set-key [f4]     'other-window)
(global-set-key [f5]     'delete-other-windows)
(global-set-key [f6]     'split-window-vertically)
(global-set-key [f7]     'split-window-horizontally)
(global-set-key [f8]     'next-error)
(global-set-key [f9]     'compile)
(global-set-key [f10]    'comment-region)
(global-set-key [f11]    'uncomment-region)
(global-set-key [f12]    'indent-region)

;;Navigation debut et fin du buffer
(global-set-key [C-prior]  'beginning-of-buffer)
(global-set-key [C-next]  'end-of-buffer)


;;; Misc **********************************************************************
(defun suspend-emacs-old () 
  (interactive)
  (message "Pour stopper emacs, taper C-x C-z"))

(defun transpose-without-move ()
  (interactive)
  (transpose-chars -1)
  (forward-char))
;;; Mettre tous les fichiers de sauvegarde dans un seul répertoire
(setq backup-directory-alist
      '(("." . "~/.emacs-backup-files/")))

;;; Pour ne pas avoir à taper en entier la réponse yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;;; Affichage des images et fichiers compressés
(setq auto-image-file-mode t)
(setq auto-compression-mode t)


;;; Look and Feel **************************************************************

(mode-jour)
(setq inhibit-startup-message t)
(line-number-mode t) 
(column-number-mode t) 
(tool-bar-mode nil)
(menu-bar-mode nil)
(scroll-bar-mode nil)
(global-font-lock-mode t)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

(setq frame-title-format '(buffer-file-name "Emacs: %b (%f)" "Emacs: %b"))

;;La region selectionnée est écrasée lorsque l'on tape du texte par dessus
(cond ((featurep 'xemacs) 
       (progn (require 'pending-del)
	      (custom-set-variables '(pending-delete-mode t t))
	      ))
      ((or window-system (string-match "21" emacs-version))
       (progn (delete-selection-mode 1) (transient-mark-mode 1)
	      ))
      )


(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;;Dictionnaire  **********************************************************************
(setq sgml-mode-hook
      '(lambda () "Défauts pour le mode SGML."
	 (ispell-change-dictionary "francais")
	 ))




;;SongBook  **********************************************************************
(setq load-path (cons "~/.config/emacs" load-path))
(setq auto-mode-alist (cons '("\\.sg$" . songbook-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.sbd$" . songbook-mode) auto-mode-alist))
(autoload 'songbook-mode "songbook" "Major mode for Patacrep's songbooks" t)


;;; Auto-insert  **********************************************************************
(require 'auto-insert-tkld)

(setq mail-self-address  "<benoit.gauzere@greyc.ensicaen.fr>")
(setq auto-insert-path (cons "~/.emacs.d/insert" auto-insert-path))
(setq auto-insert-automatically t)
(setq auto-insert-alist
      '(("\\.c$" . "C")			; C
	("\\.h$" . "Cinclude")		; C include
	("\\.cpp$" . "Cpp")		; C include
	("\\.tex$" . "Tex")		; Latex
	("[Mm]akefile$" . "Makefile")	; Makefile	 
	("[Rr]eadme$" . "Readme")	; Readme
	("README$" . "Readme")		;
	("\\.sh$" . "Shell")		; Shell
	("" . "Shell")			; Shell	  
	("")
	)
      )
(setq auto-insert-type-alist
      '(("C" . "insert.c")
	("Cpp" . "insert.cpp")
	("Cinclude" . "insert.h")
	("Readme" . "insert.readme")
	("Shell" . "insert.shell")
	("Tex" . "insert.tex")
	)
      )




;;; LUA mode **********************************************************************
(setq auto-mode-alist (cons '("\\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-hook 'lua-mode-hook 'turn-on-font-lock)

;;; Org mode **********************************************************************
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-agenda-files (list "~/org/work.org"
                             "~/org/home.org"))
(defun custom-startup ()
  (org-todo-list t)
  (switch-to-buffer "*Org Agenda*"))
(add-hook 'window-setup-hook 'custom-startup) 

