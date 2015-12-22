;; Install packages
(require 'package)
(package-initialize)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")))

(defvar base-packages '(
                         evil
                         color-theme-sanityinc-solarized
                         magit
                         helm
                         projectile
                         helm-projectile
                         neotree
                         editorconfig
                         hideshowvis
                         company
                         company-statistics
                         flycheck
                         ))

(defvar javascript-packages '(
                              js2-mode
                              js2-refactor
                              json-mode
                              nodejs-repl
                              nvm
                              tern
                              company-tern
                              ))

(defvar extra-packages (append base-packages
                               javascript-packages
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
