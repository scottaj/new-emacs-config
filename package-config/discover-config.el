(require 'js2-refactor)
(require 'makey)

(defadvice makey-key-mode-get-key-map (after add-escape (arg))
  "Add escape to all makey maps to quit them"
  (define-key ad-return-value [escape] (lambda nil (interactive) (makey-key-mode-command nil))))
(ad-activate 'makey-key-mode-get-key-map)

(defun open-command-menu ()
  (interactive)
  (discover-show-context-menu 'keymap))

(defun open-language-menu ()
  (interactive)
  (discover-show-context-menu 'languages))

(define-key evil-normal-state-map (kbd ",") 'open-command-menu)
(define-key evil-normal-state-map (kbd "SPC") 'open-language-menu)
(define-key evil-visual-state-map (kbd ",") 'open-command-menu)
(define-key evil-visual-state-map (kbd "SPC") 'open-language-menu)

(defun insert-yassnippet ()
  (interactive)
  (evil-insert-state)
  (yas-insert-snippet))

(defun open-git-menu ()
  (interactive)
  (discover-show-context-menu 'git))
(defun open-project-menu ()
  (interactive)
  (discover-show-context-menu 'project))
(defun open-flyspell-menu ()
  (interactive)
  (discover-show-context-menu 'flyspell))


;;;; Main nav, activated by ,
(discover-add-context-menu
 :context-menu '(keymap
              (description "Top level commands (q to quit)")
              (lisp-switches)
              (lisp-arguments)
              (actions
               ("Sub Menu"
                ("p" "Project commands" open-project-menu)
                ("g" "Git commands" open-git-menu)
                ("s" "Spellcheck commands" open-flyspell-menu))

               ("File"
                ("," "switch to another open file" helm-mini)
                ("t" "Find file in project" helm-projectile-find-file)
                ("e" "Find file in current directory" helm-find-files)
                ("a" "Grep project" projectile-ag)
                ("n" "Open directory browser" neotree-toggle)
                ("T" "Clear project file cache" projectile-invalidate-cache))

               ("Text manipulation"
                ("/" "Comment current line or region" comment-or-uncomment-region)
                ("." "Toggle code folding" hs-toggle-hiding)
                (">" "Fold all code" hs-hide-all)
                ("w" "Toggle visible whitespace" whitespace-mode)
                ("_" "Toggle word wrap" toggle-truncate-lines))

                ("Misc"
                ("SPC" "Expand code template" insert-yassnippet)
                ("d" "Browse documentation" dash-at-point)
                ("u" "Show undo tree" undo-tree-visualize)
                )
               )))

(discover-add-context-menu
 :context-menu '(git
              (description "Git commands (q to quit)")
              (lisp-switches)
              (lisp-arguments)
              (actions
               ("Git"
                ("s" "Show git status" magit-status)
                ("g" "Git grep" vc-git-grep)
                ("b" "Blame current file (q to quit)" magit-blame)
                ("h" "History for current file" magit-log-buffer-file)
                )
               )))

(discover-add-context-menu
 :context-menu '(project
              (description "Project commands (q to quit)")
              (lisp-switches)
              (lisp-arguments)
              (actions
               ("Project"
                ("c" "Compile project" projectile-compile-project)
                ("r" "Run project" projectile-run-project)
                ("t" "Test project" projectile-test-project)
                ("s" "Search project" helm-do-ag-project-root)
                ("f" "Search current file" helm-do-ag-this-file)
                ("!" "Run shell command" projectile-run-shell-command-in-root)
                ("&" "Run aync shell command" projectile-run-async-shell-command-in-root)
                )
               )))

(discover-add-context-menu
 :context-menu '(flyspell
              (description "Spellcheck commands (q to quit)")
              (lisp-switches)
              (lisp-arguments)
              (actions
               ("Spellcheck"
                ("e" "Enable/disable spellcheck" flyspell-mode)
                ("b" "Check current buffer" flyspell-buffer)
                ("w" "Check-current-word" flyspell-word)
                ("c" "Correct word" flyspell-correct-word-before-point)
                )
               )))



;;;; Languages nav, activated by SPACE
(defun open-javascript-menu ()
  (interactive)
  (discover-show-context-menu 'javascript))
(defun open-javascript-test-menu ()
  (interactive)
  (discover-show-context-menu 'javascript-test))
(defun open-rust-menu ()
  (interactive)
  (discover-show-context-menu 'rust))
(defun open-elisp-menu ()
  (interactive)
  (discover-show-context-menu 'elisp))

(discover-add-context-menu
 :context-menu '(languages
              (description "Programming language commands (q to quit)")
              (lisp-switches)
              (lisp-arguments)
              (actions
               ("Languages"
                ("j" "JavaScript" open-javascript-menu)
                ("r" "Rust" open-rust-menu)
                ("e" "Emacs Lisp" open-elisp-menu)
                )
               )))

(discover-add-context-menu
 :context-menu '(javascript
              (description "JavaScript (q to quit)")
              (lisp-switches)
              (lisp-arguments)
              (actions
               ("Navigation"
                ("d" "Jump to definition" tern-pop-find-definition)
                ("e" "Search for definition" tern-find-definition)
                )
               ("Testing"
                ("t" "Open test menu" open-javascript-test-menu)
                )
               ("REPL"
                ("R" "Open NodeJS REPL" nodejs-repl)
                )
               ("Completion"
                ("c" "Complete at point" tern-completion-at-point)
                ("h" "Show argument hints" tern-show-argument-hints)
                )
               ("Refactoring"
                ("f" "Extract function" js2r-extract-function)
                ("m" "Extract method" js2r-extract-method)
                ("v" "Extract variable" js2r-extract-var)
                ("i" "Inline variable" js2r-inline-var)
                ("r" "Rename variable" js2r-rename-var)
                ("a" "Contract array" js2r-contract-array)
                ("A" "Expand array" js2r-expand-array)
                ("o" "Contract object" js2r-contract-object)
                ("O" "Expand object" js2r-expand-object)
                )
               )))

(discover-add-context-menu
 :context-menu '(javascript-test
              (description "JavaScript Testing (q to quit)")
              (lisp-switches)
              (lisp-arguments)
              (actions
               ("Testing"
                ("s" "Test at point" mocha-test-at-point)
                ("f" "Test current file" mocha-test-file)
                ("p" "Test project" mocha-test-project)
                )
               )))

(discover-add-context-menu
 :context-menu '(rust
              (description "Rust (q to quit)")
              (lisp-switches)
              (lisp-arguments)
              (actions
               ("Navigation"
                ("f" "Find definition" racer-find-definition)
                )
               )))

(discover-add-context-menu
 :context-menu '(elisp
              (description "Emacs Lisp (q to quit)")
              (lisp-switches)
              (lisp-arguments)
              (actions
               ("Misc"
                ("d" "Toggle eldoc" eldoc-mode)
                )
               )))
