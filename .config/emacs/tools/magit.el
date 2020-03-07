;; Better git support


(use-package magit
  :ensure t
  :config
  (setf magit-completing-read-function 'magit-ido-completing-read)
  (setq magit-completing-read-function 'ivy-completing-read)
  :general
  (
   :states 'normal
   :prefix ","
   "g" 'magit-status
   )
  )

(use-package gist :ensure t)
