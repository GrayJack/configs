(require 'package)

(setq
  package-archives
  '(("gnu"   . "https://elpa.gnu.org/packages/")
    ("melpa" . "https://melpa.org/packages/")
    ("melpa-stable" . "https://stable.melpa.org/packages/")
    ("org"   . "http://orgmode.org/elpa/")))

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; Theme
;; (use-package atom-one-dark-theme
;;   :ensure t)
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t)
  (doom-themes-treemacs-config))

;; Incremental completions
;; (require 'helm-config)
;; (use-package helm
;;   :ensure t
;;   :init
;;   (setq helm-mode-fuzzy-match t)
;;   (setq helm-completion-in-region-fuzzy-match t)
;;   (setq helm-candidate-number-limit 50))

(use-package ivy
  :ensure t
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  :init
  (ivy-mode 1)
  :bind
  (:map global-map
        ("C-s" . swiper)
        ("C-c C-r" . ivy-resume)
        ("<f6>" . ivy-resume)))

;; Command hints
(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " ")
  (setq which-key-prefix-prefix "+")
  :config
  (which-key-mode))

;; Project integration
(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  :bind
  (:map global-map
        ("C-c p" . projectile-command-map)))

;; Files tree-view
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-directory-name-transformer    #'identity
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-extension-regex          treemacs-last-period-regex-value
          treemacs-file-follow-delay             0.2
          treemacs-file-name-transformer         #'identity
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-move-forward-on-expand        nil
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-user-mode-line-format         nil
          treemacs-user-header-line-format       nil
          treemacs-width                         35)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x \\"    . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)

;; Modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-buffer-file-name-style 'truncate-upto-root)
  (setq doom-modeline-indent-info t)

  ;; Whether display icons in mode-line or not.
  ;; (setq doom-modeline-icon (display-graphic-p))

  ;; Whether display the icon for major mode. It respects `doom-modeline-icon'.
  (setq doom-modeline-major-mode-icon t)

  ;; Whether display color icons for `major-mode'. It respects
  ;; `doom-modeline-icon' and `all-the-icons-color-icons'.
  (setq doom-modeline-major-mode-color-icon t)

  ;; Whether display icons for buffer states. It respects `doom-modeline-icon'.
  (setq doom-modeline-buffer-state-icon t)

  ;; Whether display buffer modification icon. It respects `doom-modeline-icon'
  ;; and `doom-modeline-buffer-state-icon'.
  (setq doom-modeline-buffer-modification-icon t)

  ;; Whether display minor modes in mode-line or not.
  (setq doom-modeline-minor-modes (featurep 'minions))
  ;; If non-nil, a word count will be added to the selection-info modeline segment.
  (setq doom-modeline-enable-word-count nil)
  ;; Whether display environment version or not
  (setq doom-modeline-env-version t))


;; Tab bar
(use-package centaur-tabs
  :ensure t
  :demand
  :custom-face
  (centaur-active-bar-face ((t (:inherit doom-modeline-bar))))
  :config
  (setq centaur-tabs-style "bar"
   centaur-tabs-height 32
   centaur-tabs-set-icons t
   centaur-tabs-set-modified-marker t
   centaur-tabs-show-navigation-buttons t
   centaur-tabs-set-bar 'left)
        	  ;x-underline-at-descent-line t
        	  
  (centaur-tabs-headline-match)
   ;; (setq centaur-tabs-gray-out-icons 'buffer)
   ;; (centaur-tabs-enable-buffer-reordering)
   ;; (setq centaur-tabs-adjust-buffer-order t)
  (centaur-tabs-mode t)
  (setq uniquify-separator "/")
  (setq uniquify-buffer-name-style 'forward)
  (defun centaur-tabs-buffer-groups ()
    "`centaur-tabs-buffer-groups' control buffers' group rules.

 Group centaur-tabs with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
 All buffer name start with * will group to \"Emacs\".
 Other buffer group by `centaur-tabs-get-group-name' with project name."
    (list
     (cond
        	;; ((not (eq (file-remote-p (buffer-file-name)) nil))
        	;; "Remote")
            	((or (string-equal "*" (substring (buffer-name) 0 1))
                 (memq major-mode '(magit-process-mode
                                   magit-status-mode
                                   magit-diff-mode
                                   magit-log-mode
                                   magit-file-mode
                                   magit-blob-mode
                                   magit-blame-mode)))
        
             "Emacs")
            	((derived-mode-p 'prog-mode)
             "Editing")
            	((derived-mode-p 'dired-mode)
             "Dired")
            	((memq major-mode '(helpful-mode
                                help-mode))
             "Help")
            	((memq major-mode '(org-mode
                                org-agenda-clockreport-mode
                                org-src-mode
                                org-agenda-mode
                                org-beamer-mode
                                org-indent-mode
                                org-bullets-mode
                                org-cdlatex-mode
                                org-agenda-log-mode
                                diary-mode))
             "OrgMode")
            	(t
               (centaur-tabs-get-group-name (current-buffer))))))
  :hook
  (dashboard-mode . centaur-tabs-local-mode)
  (term-mode . centaur-tabs-local-mode)
  (calendar-mode . centaur-tabs-local-mode)
  (org-agenda-mode . centaur-tabs-local-mode)
  (helpful-mode . centaur-tabs-local-mode)
  :bind
  ("C-<prior>" . centaur-tabs-backward)
  ("C-<next>" . centaur-tabs-forward)
  ("C-c t s" . centaur-tabs-counsel-switch-group)
  ("C-c t p" . centaur-tabs-group-by-projectile-project)
  ("C-c t g" . centaur-tabs-group-buffer-groups))

;; Git gutter
(use-package git-gutter
  :ensure t
  :init
  (global-git-gutter-mode 1))


;; Parinfer
(use-package parinfer-rust-mode
  :load-path "~/.emacs.d/manual/parinfer-rust-mode")

;; Snippets
(use-package yasnippet
  :ensure t
  :config (yas-reload-all)
  :hook
  (prog-mode-hook . yas-minor-mod))

(use-package doom-snippets
  :load-path "~/.emacs.d/manual/doom-snippets"
  :after yasnippet)
