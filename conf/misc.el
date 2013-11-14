;; vc-mode 使わないのでoffに
(setq vc-handled-backends ())

;; 開いてるバッファを開き直す Emacs 23.4 の cc-mode でなぜか indent が効かなくなったときに使う、、
(defun reopen-buffer ()
  (interactive)
  (let ((file-name (buffer-file-name))
        (pos (point)))
    (progn
      (or file-name (error "this buffer is memory only buffer!"))
      (kill-buffer)
      (find-file file-name)
      (goto-char pos))))


(require 'open-junk-file)
(global-set-key (kbd "C-x C-z") 'open-junk-file)


(require 'expand-region)
(global-set-key (kbd "C-@") 'er/expand-region)
(global-set-key (kbd "C-M-@") 'er/contract-region)


(global-set-key (kbd "<C-s-left>")  'windmove-left)
(global-set-key (kbd "<C-s-down>")  'windmove-down)
(global-set-key (kbd "<C-s-up>")    'windmove-up)
(global-set-key (kbd "<C-s-right>") 'windmove-right)



(require 'gist)
