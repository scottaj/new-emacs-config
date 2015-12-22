;;;; RACER
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)

(eval-after-load 'rust-mode (lambda ()
                         (define-key rust-mode-map (kbd "s-b") 'racer-find-definition)))

(add-hook 'rust-mode-hook #'flycheck-rust-setup)
