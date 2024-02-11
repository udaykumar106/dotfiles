;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Uday"
      user-mail-address "udaykumar@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
(setq doom-font (font-spec :family "Inconsolata" :size 14))

(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
;;
(setq company-idle-delay 0.2
      company-minimum-prefix-length 2)
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tomorrow-night)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


;; Tell org to look for agenda files that end with .org suffix
;; recursively under the folder
;;(after! org
;;      (setq org-agenda-files (directory-files-recursively "~/Dropbox/org/" "\.org$")
;;      org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "BLOCKED(b)" "DOING(i)" "|" "DONE(d)" "CANCELLED(c)"))
;;      org-log-done-with-time t
;;      org-log-done 'note
;;      org-hide-emphasis-markers t
;;      ))



(after! org
  (setq org-agenda-files (directory-files-recursively "~/Dropbox/org/" "\.org$")
        org-todo-keywords
        '((sequence "TODO" "WAITING" "DOING" "|" "DONE" "CANCELLED"))
        org-log-done 'time
        org-log-done 'note))

(use-package! org-super-agenda
  :after org-agenda
  :config
  (org-super-agenda-mode)
  (setq org-agenda-time-grid '((daily today require-timed) (0000 2400) "..........." "----------------------" )
        org-agenda-skip-scheduled-if-done t
        org-agenda-skip-deadline-if-done t
        org-agenda-include-deadlines t
        org-agenda-compact-blocks t
        org-agenda-start-with-log-mode t
        org-agenda-start-day nil
        org-agenda-custom-commands
        '(("z" "Super view"
           ((agenda "" ((org-agenda-span 'day)
                        (org-super-agenda-groups
                         '((:name "Today"
                            :time-grid t
                            :date today
                            :order 1)))))
            (alltodo "" ((org-agenda-overriding-header "")
                         (org-super-agenda-groups
                          '((:name "Important"
                             :tag "Important"
                             :priority "A"
                             :order 3)
                            (:name "Due Today"
                             :scheduled today
                             :deadline today
                             :order 2)
                            (:name "Due Soon"
                             :deadline future
                             :order 5)
                            (:name "Overdue"
                             :deadline past
                             :order 4))))))))))





(after! org-roam
  (setq org-roam-directory "~/Dropbox/org/roam/"))

;; Define org capture templates
;; These are copied from https://github.com/james-stoup/emacs-org-mode-tutorial#readme
(after! org-capture
      (setq org-capture-templates
          '(
            ("m" "Meeting"
             entry (file+datetree "~/Dropbox/org/meetings.org")
             "* %? :meeting:%^g \n:Created: %T\n** Attendees\n*** \n** Notes\n** Action Items\n*** TODO [#A] "
             :tree-type week
             :clock-in t
             :clock-resume t
             :empty-lines 0)
            ("j" "Journal Entry"
             entry (file+datetree "~/Dropbox/org/journal.org")
             "* %?"
             :empty-lines 0)
            ("p" "Passcode"
             entry (file+headline "~/Dropbox/org/notes.org" "Pass codes")
             :empty-lines 0)
            ("n" "Note"
             entry (file+headline "~/Dropbox/org/notes.org" "Notes")
             "** %?"
             :empty-lines 0)
            ("t" "Todo"
             entry (file+headline "~/Dropbox/org/todos.org" "Todo")
             "* TODO [#B] %?\nCreated: %T\n"
             :empty-lines 0))
            )
  )



;; Configuration for org-roam-ui
(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))


(use-package! lsp-java
  :config
  (setq lsp-java-vmargs
        '("-javaagent:/Users/uday/.m2/repository/org/projectlombok/lombok/1.18.16/lombok-1.18.16.jar")))
