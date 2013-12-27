(require 'anything-startup)

(setq
 ;; 候補を表示するまでの時間。デフォルト0.5秒
 anything-idle-delay 0.3
 ;; 候補がおおいときに体感速度を早く
 anything-quick-update t)

;(define-key global-map (kbd "C-:") 'anything-filelist+)
(define-key global-map (kbd "C-M-:") 'anything-resume)
(define-key global-map (kbd "C-x C-b") 'anything-for-buffers)

;; M-y で anything-show-kill-ring
(define-key global-map (kbd "M-y") 'anything-show-kill-ring)

;; anything-complete
(anything-read-string-mode 1)

(define-key emacs-lisp-mode-map "\C-\M-i" 'anything-lisp-complete-symbol-partial-match)
(define-key lisp-interaction-mode-map "\C-\M-i" 'anything-lisp-complete-symbol-partial-match)


(defun anything-spotlight ()
  (interactive)
  (anything-other-buffer '(anything-c-source-mac-spotlight)
                         "*anything spotlight*"))
(define-key global-map (kbd "C-M-;") 'anything-spotlight)
