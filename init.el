(load-file "~/.emacs.d/package-setup.el")

(load-directory "~/.emacs.d/package-config")

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(load-file "~/.emacs.d/user.el")
