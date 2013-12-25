;; gocode
(require 'go-autocomplete)
(add-to-list 'ac-modes 'go-mode)

;; goflymake
(require 'go-flymake)

(setenv "GOPATH" (expand-file-name "~/dev/go_lib"))

;; go-eldoc
(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)

;; gofmt
(add-hook 'before-save-hook 'gofmt-before-save)

(defun run-go-file()
  (interactive)
  (shell-command (concat "go run " (buffer-file-name)) 
                 "*go output*")
)

(defun run-go-file-with-args (word)
  (interactive (list
                (read-string "Args: "
                             "input.txt")))
  (shell-command (concat "go run " (buffer-file-name) " " word ))
  "*go output*")


;; keybinds
(add-hook 'go-mode-hook
          '(lambda()
             (setq c-basic-offset 4)
             (setq indent-tabs-mode t)
             (local-set-key (kbd "M-.") 'godef-jump)
             (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
             (local-set-key (kbd "C-c a") 'go-import-add)
             (local-set-key (kbd "C-c d") 'godoc)
             (local-set-key (kbd "M-s-l") 'gofmt)
             (local-set-key (kbd "C-S-<f10>") 'run-go-file-with-args)
             (local-set-key (kbd "S-<f10>") 'run-go-file)))
