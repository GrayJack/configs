
;; loading my interface configuration file

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" default)))
 '(org-agenda-files nil)
 '(package-selected-packages
   (quote
    (rust-mode dashboard dasboard org-bullets auto-complete treemacs-evil evil julia-mode beacon doom-themes yasnippet ivy-posframe doom-modeline centaur-tabs treemacs-persp treemacs-magit treemacs-icons-dired treemacs-projectile treemacs which-key help use-package helm)))
 '(tool-bar-mode nil))


;(display-line-numbers-mode)	
(setq display-line-numbers 'relative)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Fira Code" :foundry "CTDB" :slant normal :weight normal :height 120 :width normal))))
 '(centaur-active-bar-face ((t (:inherit doom-modeline-bar)))))

(require 'org)
(org-babel-load-file (expand-file-name (concat user-emacs-directory "config.org")))
