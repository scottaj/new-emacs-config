;; Install packages
(require 'package)
(package-initialize)

(setq package-archives '(
                         ("melpa-stable" . "http://stable.melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ))

(defvar base-packages '(
                         evil
			 evil-collection
                         evil-surround
                         dracula-theme
                         magit
			 forge
                         helm
                         projectile
                         helm-ag
                         helm-projectile
                         neotree
                         editorconfig
                         company
                         company-statistics
                         flycheck
                         flycheck-cask
                         flycheck-color-mode-line
                         dash-at-point
                         markdown-mode
                         ag
                         ack
                         idle-highlight-mode
                         popup-kill-ring
                         nyan-mode
                         yasnippet
                         engine-mode
                         feature-mode
                         emojify
                         dumb-jump
                         linum-relative
                         ))

(defvar discover-packages '(discover))

(defvar javascript-packages '(
                              js2-mode
                              js2-refactor
                              json-mode
                              nodejs-repl
                              nvm
                              emmet-mode
                              web-mode
                              coffee-mode
                              angular-snippets
                              ember-yasnippets
                              react-snippets
                              mocha-snippets
                              mocha
                              realgud
                              ))

(defvar css-packages '(
                       scss-mode
                       ))


(defvar rust-packages '(
                        rust-mode
                        flycheck-rust
                        racer
                        ))

(defvar fsharp-packages '(
                          fsharp-mode
                          ))

(defvar extra-packages (append base-packages
                               discover-packages
                               javascript-packages
                               css-packages
                               rust-packages
                               fsharp-packages
                        ))

(defun extra-packages-installed-p ()
  (dolist (p extra-packages)
        (if (package-installed-p p) t nil)))

(unless (extra-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p extra-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(defun load-directory (directory)
  "Load recursively all `.el' files in DIRECTORY."
  (dolist (element (directory-files-and-attributes directory nil nil nil))
    (let* ((path (car element))
           (fullpath (concat directory "/" path))
           (isdir (car (cdr element)))
           (ignore-dir (or (string= path ".") (string= path ".."))))
      (cond
       ((and (eq isdir t) (not ignore-dir))
        (load-directory fullpath))
       ((and (eq isdir nil) (string= (substring path -3) ".el"))
        (load (file-name-sans-extension fullpath)))))))
