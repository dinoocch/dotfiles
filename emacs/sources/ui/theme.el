


;;; Colorize color names in buffers
(use-package rainbow-mode
             :ensure t
             :diminish rainbow-mode
             :config (add-hook 'prog-mode-hook #'rainbow-mode)
             )

;; Colorize matching delimiters
(use-package rainbow-delimiters
             :ensure t
             :config (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
             )


;; Indent Guides
(use-package highlight-indent-guides
             :ensure t
             :commands (highlight-indent-guides-mode)
             :config (add-hook 'prog-mode-hook #'highlight-indent-guides-mode))

;; Dark colors
(use-package srcery-theme
             :ensure t
             :config (load-theme 'srcery t))

;; Show match num/count
(use-package anzu
             :ensure t
             :demand
             :diminish anzu-mode
             :config (global-anzu-mode 1))

;; Fancy mode line
(use-package smart-mode-line
             :ensure t
             :config
             (setf sml/theme 'dark)
             (setq sml/no-confirm-load-theme t)
             (add-hook 'after-init-hook 'sml/setup))
