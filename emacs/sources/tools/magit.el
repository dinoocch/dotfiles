;; Better git support


(use-package magit
             :ensure t :pin melpa
             :bind ("C-c g" . magit-status)
             :config
             (setf magit-completing-read-function 'magit-ido-completing-read)
             (setq magit-completing-read-function 'ivy-completing-read))

(use-package gist
             :ensure t :pin melpa)
