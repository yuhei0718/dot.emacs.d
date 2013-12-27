(add-to-list 'load-path (concat user-emacs-directory "el-get/el-get"))

(setq
 el-get-dir (concat user-emacs-directory "el-get")
 el-get-verbose t
 el-get-user-package-directory (concat user-emacs-directory "conf/init")
 el-get-generate-autoloads nil)

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch el-get-install-skip-emacswiki-recipes)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(add-to-list 'el-get-recipe-path (concat user-emacs-directory "recipes"))

(el-get 'sync
        '(el-get
          anything
          anything-project
;          anything-c-moccur
;          auto-save-buffers-enhanced
;          cperl-mode
;          perl-completion
;          perl-debug
          markdown-mode
;          clmemo
 ;         ee
;          git-gutter
          open-junk-file
;          emacs-w3m
          auto-complete
;          ddskk
          go-mode
          go-eldoc
;          scss-mode
;          org-mode
;          lua-mode
          expand-region
          yasnippet
          gist
          ag
          helm
          helm-ag
          helm-descbinds
          helm-migemo
          helm-project
          migemo
          ))

;; (if (eq system-type 'darwin)
;;     (el-get 'sync '(clang-complete-async-osx))
;;   (if (locate-file "llvm-config" exec-path)
;;       (el-get 'sync '(clang-complete-async))
;    (message "** Install llvm to complete to install clang-complete-async **")))
