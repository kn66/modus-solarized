;;; modus-solarized-test.el --- Tests for Modus Solarized -*- lexical-binding: t; -*-

;; SPDX-License-Identifier: MIT

;;; Code:

(require 'ert)
(require 'modus-solarized-light-theme)
(require 'modus-solarized-dark-theme)

(defconst modus-solarized-test-canonical-colors
  '("#002B36" "#073642" "#586E75" "#657B83"
    "#839496" "#93A1A1" "#EEE8D5" "#FDF6E3"
    "#B58900" "#CB4B16" "#DC322F" "#D33682"
    "#6C71C4" "#268BD2" "#2AA198" "#859900")
  "The canonical sixteen-color Solarized palette.")

(defun modus-solarized-test--palette (theme)
  "Return the generated palette for THEME."
  (symbol-value (nth 2 (modus-solarized--theme-spec theme))))

(defun modus-solarized-test--resolve-color (theme name)
  "Resolve palette NAME to a literal color for THEME."
  (modus-solarized--resolve-color
   name (modus-solarized-test--palette theme)))

(defun modus-solarized-test--face-attributes (theme face)
  "Return the last custom THEME attribute list for FACE."
  (let* ((settings
          (seq-filter
           (lambda (setting)
             (and (eq (car setting) 'theme-face)
                  (eq (cadr setting) face)))
           (get theme 'theme-settings)))
         (setting (car (last settings)))
         (clause (and setting (car (nth 3 setting)))))
    (when clause
      (if (keywordp (cadr clause))
          (cdr clause)
        (cadr clause)))))

(ert-deftest modus-solarized-test-metadata ()
  "Both themes have the expected Modus metadata."
  (dolist (case '((modus-solarized-light
                   light
                   modus-solarized-light-palette)
                  (modus-solarized-dark
                   dark
                   modus-solarized-dark-palette)))
    (let ((properties (get (car case) 'theme-properties)))
      (should (eq (plist-get properties :background-mode) (nth 1 case)))
      (should (eq (plist-get properties :family)
                  modus-solarized-theme-family))
      (should (eq (plist-get properties :modus-core-palette)
                  (nth 2 case))))))

(ert-deftest modus-solarized-test-only-uses-solarized-colors ()
  "Both generated palettes use only canonical Solarized literals."
  (dolist (theme '(modus-solarized-light modus-solarized-dark))
    (dolist (entry (modus-solarized-test--palette theme))
      (when (stringp (cadr entry))
        (should (member (upcase (cadr entry))
                        modus-solarized-test-canonical-colors))))))

(ert-deftest modus-solarized-test-neutral-colors ()
  "Light and Dark use the corresponding Solarized neutral scales."
  (dolist (case '((modus-solarized-light "#FDF6E3" "#657B83" "#EEE8D5")
                  (modus-solarized-dark "#002B36" "#839496" "#073642")))
    (should (equal (modus-solarized-test--resolve-color (car case) 'bg-main)
                   (nth 1 case)))
    (should (equal (modus-solarized-test--resolve-color (car case) 'fg-main)
                   (nth 2 case)))
    (should (equal (modus-solarized-test--resolve-color (car case) 'bg-dim)
                   (nth 3 case)))))

(ert-deftest modus-solarized-test-outer-borders-match-main-foreground ()
  "Popup and child-frame borders use the normal text color."
  (dolist (theme '(modus-solarized-light modus-solarized-dark))
    (let ((foreground
           (modus-solarized-test--resolve-color theme 'fg-main)))
      (should (equal (modus-solarized-test--resolve-color theme 'border)
                     foreground))
      (dolist (face '(corfu-border
                      child-frame-border
                      eldoc-box-border
                      ivy-posframe-border
                      quick-peek-border-face))
        (should
         (equal
          (plist-get
           (modus-solarized-test--face-attributes theme face)
           :background)
          foreground))))))

(ert-deftest modus-solarized-test-regions-are-inverted ()
  "Range selections invert each theme's normal colors."
  (dolist (case '((modus-solarized-light "#657B83" "#FDF6E3")
                  (modus-solarized-dark "#839496" "#002B36")))
    (modus-solarized--define-theme (car case))
    (should (equal (modus-solarized-test--resolve-color
                    (car case) 'bg-region)
                   (nth 1 case)))
    (should (equal (modus-solarized-test--resolve-color
                    (car case) 'fg-region)
                   (nth 2 case)))
    (dolist (face modus-solarized-inverted-region-faces)
      (let ((attributes
             (modus-solarized-test--face-attributes (car case) face)))
        (should (equal (plist-get attributes :background) (nth 1 case)))
        (should (equal (plist-get attributes :foreground) (nth 2 case)))
        (should-not (plist-get attributes :underline))
        (should-not (plist-get attributes :box))))))

(ert-deftest modus-solarized-test-neutral-surfaces ()
  "Org blocks and semantic surfaces use neutral backgrounds."
  (dolist (case '((modus-solarized-light "#FDF6E3" "#EEE8D5")
                  (modus-solarized-dark "#002B36" "#073642")))
    (dolist (role '(bg-prose-block-delimiter
                    bg-prose-block-contents
                    bg-added-refine
                    bg-removed-refine
                    bg-changed-refine))
      (should (equal (modus-solarized-test--resolve-color (car case) role)
                     (nth 1 case))))
    (dolist (role '(bg-hl-line
                    bg-completion
                    bg-hover
                    bg-hover-secondary
                    bg-diff-context))
      (should (equal (modus-solarized-test--resolve-color (car case) role)
                     (nth 2 case))))))

(ert-deftest modus-solarized-test-search-matches-use-backgrounds ()
  "Search matches use Solarized backgrounds with the normal background text."
  (dolist (theme '(modus-solarized-light modus-solarized-dark))
    (dolist (case '((bg-search-current "#B58900")
                    (bg-search-lazy "#2AA198")
                    (bg-search-static "#D33682")
                    (bg-search-replace "#DC322F")
                    (bg-search-rx-group-0 "#268BD2")
                    (bg-search-rx-group-1 "#859900")
                    (bg-search-rx-group-2 "#DC322F")
                    (bg-search-rx-group-3 "#D33682")))
      (let ((background-role (nth 0 case))
            (expected-background (nth 1 case))
            (foreground-role
             (intern (replace-regexp-in-string
                      "^bg-" "fg-" (symbol-name (nth 0 case))))))
        (should (equal (modus-solarized-test--resolve-color
                        theme background-role)
                       expected-background))
        (should (equal (modus-solarized-test--resolve-color
                        theme foreground-role)
                       (modus-solarized-test--resolve-color
                        theme 'bg-main)))
        (should-not (equal expected-background
                           (modus-solarized-test--resolve-color
                            theme 'bg-main)))))))

(ert-deftest modus-solarized-test-diff-foregrounds ()
  "Diff meaning remains visible through Solarized accent foregrounds."
  (dolist (theme '(modus-solarized-light modus-solarized-dark))
    (should (equal (modus-solarized-test--resolve-color theme 'fg-added)
                   "#859900"))
    (should (equal (modus-solarized-test--resolve-color theme 'fg-changed)
                   "#B58900"))
    (should (equal (modus-solarized-test--resolve-color theme 'fg-removed)
                   "#DC322F"))))

(ert-deftest modus-solarized-test-shared-color-remaps ()
  "Accent remapping applies to both themes without recoloring comments."
  (let ((original-remaps modus-solarized-color-remaps))
    (unwind-protect
        (progn
          (customize-set-variable
           'modus-solarized-color-remaps '((green . yellow)))
          (dolist (theme '(modus-solarized-light modus-solarized-dark))
            (should (equal (modus-solarized-test--resolve-color theme 'green)
                           "#B58900"))
            (should (equal (modus-solarized-test--resolve-color theme 'fg-added)
                           "#B58900")))
          (should (equal (modus-solarized-test--resolve-color
                          'modus-solarized-light 'comment)
                         "#93A1A1"))
          (should (equal (modus-solarized-test--resolve-color
                          'modus-solarized-dark 'comment)
                         "#586E75")))
      (customize-set-variable 'modus-solarized-color-remaps original-remaps))))

(ert-deftest modus-solarized-test-loadable ()
  "Both themes can be enabled and disabled."
  (unwind-protect
      (dolist (theme '(modus-solarized-light modus-solarized-dark))
        (load-theme theme t)
        (should (custom-theme-enabled-p theme))
        (disable-theme theme))
    (mapc (lambda (theme)
            (when (custom-theme-enabled-p theme)
              (disable-theme theme)))
          '(modus-solarized-light modus-solarized-dark))))

(provide 'modus-solarized-test)

;;; modus-solarized-test.el ends here
