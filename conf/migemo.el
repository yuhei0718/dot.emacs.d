;https://github.com/emacs-jp/migemo
(when (and (executable-find "cmigemo")
           (require 'migemo nil t))
  (setq migemo-options '("-q" "--emacs"))

  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (load-library "migemo")
  (migemo-init)
)


(defvar darwin-p (eq system-type 'darwin))
(defvar linux-p (eq system-type 'gnu/linux))

(when darwin-p
    (progn
      (setq migemo-command "/usr/local/bin/cmigemo")
      (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
      )
  )
(when linux-p
  (progn
    (setq migemo-command "cmigemo")
    (setq migemo-dictionary "/usr/share/cmigemo/utf-8/migemo-dict")
    )
  )
