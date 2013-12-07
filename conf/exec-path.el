(setq shell-file-name "/bin/zsh")

(let*
    ((path (list "/usr/local/bin"
                 "/usr/local/go/bin"
                 "~/dev/go_lib/bin")))
  (dolist (p path)
    (add-to-list 'exec-path (expand-file-name p))
    (setenv "PATH" (concat (expand-file-name p) ":" (getenv "PATH")))))
