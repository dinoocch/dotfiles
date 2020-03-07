;; rust (*.rs)

(use-package rust-mode
             :ensure t
             :mode "\\.rs\\'")

(use-package racer
             :ensure t
             :diminish racer-mode
             :config
             (setq company-tooltip-align-annotations t
                   racer-cmd (expand-file-name "~/.cargo/bin/racer"))
             (add-hook 'rust-mode-hook #'racer-mode)
             (add-hook 'racer-mode-hook #'eldoc-mode)
             (add-hook 'racer-mode-hook #'company-mode)
             (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
             :general
             (
              :keymaps 'rust-mode-map
              :states 'insert
              "TAB" #'company-indent-or-complete-common
              )
             )
