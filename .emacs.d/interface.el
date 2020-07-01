;; Remove initial text
(setq inhibit-startup-message t)

;; Remove tool bar and scroll bar
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

;; Line hl
(global-hl-line-mode t)
(line-number-mode t)
(global-display-line-numbers-mode 1)                            	

;'; SmartTab https://www.emacswiki.org/emacs/TabCompletion#SmartTab
(define-key read-expression-map [(tab)] 'hippie-expand)
(defun hippie-unexpand ()
  (interactive)
  (hippie-expand 0))

(define-key read-expression-map [(shift tab)] 'hippie-unexpand)

;; Built-in autocomplete for elisp
(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)
