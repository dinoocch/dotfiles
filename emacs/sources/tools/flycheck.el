;; Flycheck provides on-the-fly code checking
(use-package flycheck
             :ensure t :pin melpa
             :config (global-flycheck-mode 1))

;;; rust
(use-package flycheck-rust
             :ensure t
             :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;;; python
(use-package flycheck-pycheckers
             :ensure t
             :config (add-hook 'flycheck-mode-hook #'flycheck-pycheckers-setup))
