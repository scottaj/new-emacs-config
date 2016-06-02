(require 'js2-refactor)
(require 'tern)

;;;; JS2 mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js2-mode-hook #'js2-refactor-mode)

(setq js2-global-externs '(
                           "describe"
                           "xdescribe"
                           "it"
                           "xit"
                           "before"
                           "beforeEach"
                           "after"
                           "afterEach"
                           ))



;;;; JSON mode
(add-to-list 'auto-mode-alist '("\\.json\\'" . json-mode))



;;;; Use correct version of node for nvm
(add-hook 'js2-mode-hook (lambda () (nvm-use-for (projectile-project-root))))


;;;; Emmet
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'web-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(setq emmet-move-cursor-between-quotes t) ;; default nil



;;;; Tern
;; Combine Tern and dumb-jump
(defun js-jump ()
  (interactive)
  (let ((current-file (buffer-file-name (current-buffer)))
        (current-line (what-line)))
    (tern-find-definition)
    (if (and (equal (buffer-file-name (current-buffer)) current-file)
             (equal (what-line) current-line))
        (dumb-jump-go)
      (message "Can't jump to definition"))))

(eval-after-load 'js (lambda ()
                       (add-hook 'js2-mode-hook (lambda () (tern-mode t)))
                       (define-key js-mode-map (kbd "s-b") 'js-jump)))





;;;; Debugger
(load-library "realgud")
