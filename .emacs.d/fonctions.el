(defun numerote ( )
  "Numerote toute les lignes du buffer"
  (interactive)
  (beginning-of-buffer)
  (let ((counter 0))
    (while (< (point) (point-max))
      (beginning-of-line)
      (setq counter (+ counter 1))
      (insert-string counter "\t")
      (next-line ) )))

(defun truc ( )
  "Numerote toute les lignes du buffer"
  (interactive)
  (beginning-of-buffer)
  (let ((counter 0))
    (while (< (point) (point-max))
      (beginning-of-line)
      (insert-string "wget ")
      (next-line ) )))

(defun denumerote ( )
  "Défait le numerotage"
  (interactive)
  (beginning-of-buffer)
  (while (< (point) (point-max))
    (beginning-of-line)
    (replace-regexp "[-]*" "")
    (next-line ) ))

(defun indeter(debut, fin)
  "Rajoute une tabulation au début de toutes les lignes de la region"
  (interactive "r")
  (if (> (point)  (mark))
      (exchange-point-and-mark) 
    )
  (if (< (point)  (mark))
      (while (< (point) (mark))
	(beginning-of-line)
	(insert-string (format "\t"))
	(next-line 1) )
    )
  )

;;Exemple fonction simple
(defun bonjour (quelquun)
  "Dites bonjour à quelqu'un avec la commande M-x bonjour."
  (interactive "À qui voulez-vous dire bonjour ? ")
  (message "Bonjour %s!" quelquun))

;;Permet d'insérer la date ...
(defun insert-current-date ()
  "Insere la date du jour"
  (interactive)
  (insert (format-time-string "%d-%m-%Y")))
;;Plus agreable à l'oeil la nuit 	
(defun mode-nuit () 
  "Change les couleurs pour qu'elles soient plus agréables a l'oeil lors du travail avec peu de lumiere"
  (interactive)
  (set-background-color "gray")
  (set-foreground-color "ghost white")
  (set-cursor-color "green"))
;;Plus agreable à l'oeil le jour	
(defun mode-jour () 
  "Change les couleurs pour qu'elles soient plus agréables a l'oeil lors du travail avec beaucoup de lumiere"
  (interactive)
  (set-background-color "ghost white")
  (set-foreground-color "black")
  (set-cursor-color "dodger blue"))

(defun c-init-header-file()
  "Ajoute les entetes #ifndef NOM_H ..."
  (interactive)
  (setq nomfichier  (upcase (substring(file-name-nondirectory buffer-file-name) 0 -2)))
  (beginning-of-buffer)
  (insert (format "#ifndef %s_H\n" nomfichier))
  (insert (format "#define %s_H\n" nomfichier))
  (end-of-buffer)  
  (insert (format "\n#endif\n")))


(defun test(debut, fin)
  "fonction de test ..."
  (interactive "r")
  (message "%d"(mark))
  )

;;; First version; has bugs!
(defun count-words-region (beginning end)
  "Print number of words in the region.
Words are defined as at least one word-constituent
character followed by at least one character that
is not a word-constituent.  The buffer's syntax
table determines which characters these are."
  (interactive "r")
  (message "Counting words in region ... ")

;;; 1. Set up appropriate conditions.
  (save-excursion
    (goto-char beginning)
    (let ((count 0))

;;; 2. Run the while loop.
      (while (< (point) end)
        (re-search-forward "\\w+\\W*")
        (setq count (1+ count)))

;;; 3. Send a message to the user.
      (cond ((zerop count)
             (message
              "The region does NOT have any words."))
            ((= 1 count)
             (message
              "The region has 1 word."))
            (t
             (message
              "The region has %d words." count))))))

(defun indent ()
  (interactive)
  (setq indent-tabs-mode 'nil)
  (point-to-register 'a)
  (indent-region (point-min) (point-max) 'nil)
  (register-to-point 'a))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(default-input-method "UTF-8")
 '(display-time-mode t)
 '(global-font-lock-mode t nil (font-lock))
 '(pc-select-meta-moves-sexps t)
 '(pc-select-selection-keys-only t)
 '(pc-selection-mode t)
 '(save-place t nil (saveplace))
 '(show-paren-mode t nil (paren))
 '(text-mode-hook (quote ((lambda nil (iso-accents-mode t) (turn-on-auto-fill)) turn-on-auto-fill text-mode-hook-identify))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t(:inherit nil :stipple nil :background "ghost white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))
