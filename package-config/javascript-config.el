;;;; JS2 mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(setq js2-global-externs '())



;;;; JSON mode
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))



;;;; Emmet
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'web-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(setq emmet-move-cursor-between-quotes t) ;; default nil



;;;; Tern
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'js (lambda ()
                       (define-key js-mode-map (kbd "s-b") 'tern-find-definition)))
