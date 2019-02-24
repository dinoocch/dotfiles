(setf user-full-name "Dino Occhialini"
      user-mail-address "dino.occhialini@gmail.com")

(setf backup-directory-alist '((".*" . "~/.emacs.d/backups/")))

(setf inhibit-splash-screen t
      inhibit-startup-message t
      initial-major-mode #'fundamental-mode
      initial-scratch-message nil)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode 1)

(setf echo-keystrokes 0.1
      visible-bell 1)

(prefer-coding-system 'utf-8-unix)

(setq-default indent-tabs-mode nil)

(add-to-list 'load-path "~/.emacs_sources/")
(load "packages")
