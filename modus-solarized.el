;;; modus-solarized.el --- Solarized themes for Modus -*- lexical-binding: t; -*-

;; Copyright (C) 2026 nobu43

;; Author: nobu43
;; URL: https://github.com/kn66/modus-solarized
;; Version: 1.0.0
;; Package-Requires: ((emacs "28.1") (modus-themes "5.0.0"))
;; Keywords: faces, theme
;; SPDX-License-Identifier: MIT

;;; Commentary:

;; Solarized Light and Dark implemented as derivatives of `modus-themes'.
;; Both generated palettes are constrained to Solarized's canonical sixteen
;; colors and share the same accent remapping options.

;;; Code:

(require 'modus-themes)

(defgroup modus-solarized nil
  "Solarized derivative themes powered by Modus Themes."
  :group 'faces
  :group 'modus-themes
  :prefix "modus-solarized-")

(defconst modus-solarized-theme-family 'modus-solarized-themes
  "Theme family symbol for Modus Solarized themes.")

(defconst modus-solarized-theme-specs
  '((modus-solarized-light
     light
     modus-solarized-light-palette
     "Solarized Light colors with the face coverage of Modus Themes.")
    (modus-solarized-dark
     dark
     modus-solarized-dark-palette
     "Solarized Dark colors with the face coverage of Modus Themes."))
  "Metadata for each Modus Solarized theme.")

(defconst modus-solarized-common-palette
  '((solarized-base03 "#002B36")
    (solarized-base02 "#073642")
    (solarized-base01 "#586E75")
    (solarized-base00 "#657B83")
    (solarized-base0 "#839496")
    (solarized-base1 "#93A1A1")
    (solarized-base2 "#EEE8D5")
    (solarized-base3 "#FDF6E3")
    (solarized-yellow "#B58900")
    (solarized-orange "#CB4B16")
    (solarized-red "#DC322F")
    (solarized-magenta "#D33682")
    (solarized-violet "#6C71C4")
    (solarized-blue "#268BD2")
    (solarized-cyan "#2AA198")
    (solarized-green "#859900")

    (red "#DC322F")
    (red-intense "#DC322F")
    (red-faint "#DC322F")
    (red-warmer "#CB4B16")
    (red-cooler "#D33682")
    (yellow "#B58900")
    (yellow-intense "#B58900")
    (yellow-faint "#B58900")
    (yellow-warmer "#CB4B16")
    (yellow-cooler "#859900")
    (green "#859900")
    (green-intense "#859900")
    (green-faint "#859900")
    (green-warmer "#B58900")
    (green-cooler "#2AA198")
    (blue "#268BD2")
    (blue-intense "#268BD2")
    (blue-faint "#268BD2")
    (blue-warmer "#6C71C4")
    (blue-cooler "#2AA198")
    (magenta "#D33682")
    (magenta-intense "#D33682")
    (magenta-faint "#D33682")
    (magenta-warmer "#DC322F")
    (magenta-cooler "#6C71C4")
    (cyan "#2AA198")
    (cyan-intense "#2AA198")
    (cyan-faint "#2AA198")
    (cyan-warmer "#859900")
    (cyan-cooler "#268BD2")
    (olive "#859900")

    ;; Colored surfaces stay neutral while their foregrounds carry meaning.
    (bg-red-nuanced bg-main)
    (bg-red-subtle bg-main)
    (bg-red-intense bg-main)
    (bg-green-nuanced bg-main)
    (bg-green-subtle bg-main)
    (bg-green-intense bg-main)
    (bg-yellow-nuanced bg-main)
    (bg-yellow-subtle bg-main)
    (bg-yellow-intense bg-main)
    (bg-blue-nuanced bg-main)
    (bg-blue-subtle bg-main)
    (bg-blue-intense bg-main)
    (bg-magenta-nuanced bg-main)
    (bg-magenta-subtle bg-main)
    (bg-magenta-intense bg-main)
    (bg-cyan-nuanced bg-main)
    (bg-cyan-subtle bg-main)
    (bg-cyan-intense bg-main)

    (rust "#CB4B16")
    (gold "#B58900")
    (slate "#268BD2")
    (indigo "#6C71C4")
    (maroon "#D33682")
    (pink "#D33682")
    (bg-clay bg-main)
    (fg-clay "#CB4B16")
    (bg-ochre bg-main)
    (fg-ochre "#B58900")
    (bg-lavender bg-main)
    (fg-lavender "#6C71C4")
    (bg-sage bg-main)
    (fg-sage "#2AA198")

    (bg-graph-red-0 "#DC322F")
    (bg-graph-red-1 "#CB4B16")
    (bg-graph-green-0 "#859900")
    (bg-graph-green-1 "#2AA198")
    (bg-graph-yellow-0 "#B58900")
    (bg-graph-yellow-1 "#CB4B16")
    (bg-graph-blue-0 "#268BD2")
    (bg-graph-blue-1 "#6C71C4")
    (bg-graph-magenta-0 "#D33682")
    (bg-graph-magenta-1 "#6C71C4")
    (bg-graph-cyan-0 "#2AA198")
    (bg-graph-cyan-1 "#268BD2")
    (bg-popup bg-main)
    (bg-added-fringe "#859900")
    (bg-changed-fringe "#B58900")
    (bg-removed-fringe "#DC322F")
    (bg-diff-context bg-dim))
  "Solarized colors and shared Modus palette roles.")

(defconst modus-solarized-light-neutral-palette
  '((bg-main "#FDF6E3")
    (bg-dim "#EEE8D5")
    (bg-alt "#EEE8D5")
    (bg-active "#EEE8D5")
    (bg-inactive "#EEE8D5")
    (fg-main "#657B83")
    (fg-dim "#839496")
    (fg-alt "#93A1A1")
    (border "#93A1A1"))
  "Neutral roles for Solarized Light.")

(defconst modus-solarized-dark-neutral-palette
  '((bg-main "#002B36")
    (bg-dim "#073642")
    (bg-alt "#073642")
    (bg-active "#073642")
    (bg-inactive "#073642")
    (fg-main "#839496")
    (fg-dim "#657B83")
    (fg-alt "#586E75")
    (border "#586E75"))
  "Neutral roles for Solarized Dark.")

(defconst modus-solarized-palette-mappings
  '((cursor blue)
    (comment fg-alt)
    (docstring fg-alt)
    (docmarkup fg-alt)
    (bg-hl-line bg-dim)
    (bg-paren-match bg-dim)
    (bg-completion bg-dim)
    (bg-hover bg-dim)
    (bg-hover-secondary bg-dim)
    (bg-region fg-main)
    (fg-region bg-main)
    (bg-prose-block-delimiter bg-main)
    (bg-prose-block-contents bg-main)
    (bg-mode-line-active bg-dim)
    (fg-mode-line-active yellow)
    (border-mode-line-active yellow))
  "Semantic mappings shared by both themes.")

(defconst modus-solarized-inverted-region-faces
  '(region secondary-selection rectangle-preview)
  "Standard range-selection faces that invert normal colors.")

(defconst modus-solarized-accent-colors
  '((red . "#DC322F")
    (orange . "#CB4B16")
    (yellow . "#B58900")
    (green . "#859900")
    (cyan . "#2AA198")
    (blue . "#268BD2")
    (violet . "#6C71C4")
    (magenta . "#D33682"))
  "Solarized accent names and their canonical color values.")

(defvar modus-solarized-light-palette nil
  "Complete palette used by `modus-solarized-light'.")

(defvar modus-solarized-dark-palette nil
  "Complete palette used by `modus-solarized-dark'.")

(defvar modus-solarized-color-remaps)

(defun modus-solarized--theme-spec (theme)
  "Return metadata for THEME."
  (assq theme modus-solarized-theme-specs))

(defun modus-solarized--neutral-palette (mode)
  "Return the neutral palette for background MODE."
  (if (eq mode 'dark)
      modus-solarized-dark-neutral-palette
    modus-solarized-light-neutral-palette))

(defun modus-solarized--remap-color (color)
  "Return the customized replacement for Solarized accent COLOR."
  (let* ((source-entry (rassoc color modus-solarized-accent-colors))
         (target-name
          (and source-entry
               (alist-get (car source-entry) modus-solarized-color-remaps)))
         (target-color
          (and target-name
               (alist-get target-name modus-solarized-accent-colors))))
    (or target-color color)))

(defun modus-solarized--color-family (name)
  "Return the Modus accent family represented by palette NAME."
  (seq-find
   (lambda (family)
     (let ((family-name (symbol-name family))
           (name-string (symbol-name name)))
       (or (eq name family)
           (string-prefix-p (concat family-name "-") name-string))))
   '(red green yellow blue magenta cyan)))

(defun modus-solarized--apply-color-remaps (palette)
  "Apply `modus-solarized-color-remaps' to PALETTE."
  (mapcar
   (lambda (entry)
     (if (stringp (cadr entry))
         (let* ((family (modus-solarized--color-family (car entry)))
                (family-target
                 (and family
                      (alist-get family modus-solarized-color-remaps)))
                (family-target-color
                 (and family-target
                      (alist-get family-target
                                 modus-solarized-accent-colors))))
           (list (car entry)
                 (or family-target-color
                     (modus-solarized--remap-color (cadr entry)))))
       entry))
   palette))

(defun modus-solarized--materialize-base-palette (palette)
  "Replace symbolic references in base PALETTE with literal colors."
  (mapcar
   (lambda (entry)
     (let ((value (cadr entry)))
       (while (and (symbolp value) (assq value palette))
         (setq value (cadr (assq value palette))))
       (list (car entry) value)))
   palette))

(defun modus-solarized--make-palette (mode)
  "Build a Solarized palette for background MODE."
  (let ((base-palette
         (append (modus-solarized--neutral-palette mode)
                 modus-solarized-common-palette)))
    (modus-solarized--apply-color-remaps
     (modus-themes-generate-palette
      (modus-solarized--materialize-base-palette base-palette)
      'warm
      nil
      modus-solarized-palette-mappings))))

(defun modus-solarized--rebuild-palettes ()
  "Rebuild the Light and Dark palettes."
  (setq modus-solarized-light-palette
        (modus-solarized--make-palette 'light)
        modus-solarized-dark-palette
        (modus-solarized--make-palette 'dark)))

(defun modus-solarized--set-palette-option (symbol value)
  "Set SYMBOL to VALUE and rebuild initialized palettes."
  (set-default symbol value)
  (when (or modus-solarized-light-palette modus-solarized-dark-palette)
    (modus-solarized--rebuild-palettes)))

(defcustom modus-solarized-color-remaps nil
  "Remap Solarized accents in both generated palettes.

Each element has the form (SOURCE . TARGET).  SOURCE and TARGET are
Solarized accent names.  Remapping is simultaneous rather than
cascading, so reciprocal exchanges are supported.  Modus variants such
as `green-warmer' and `green-cooler' are included in their base family.
After changing this in an active session, call
`modus-solarized-refresh' to reapply enabled themes."
  :group 'modus-solarized
  :package-version '(modus-solarized . "1.0.0")
  :set #'modus-solarized--set-palette-option
  :type '(repeat
          (cons
           :tag "Color remapping"
           (choice
            :tag "From"
            (const red) (const orange) (const yellow) (const green)
            (const cyan) (const blue) (const violet) (const magenta))
           (choice
            :tag "To"
            (const red) (const orange) (const yellow) (const green)
            (const cyan) (const blue) (const violet) (const magenta)))))

(defcustom modus-solarized-palette-overrides nil
  "Overrides applied to both Modus Solarized palettes.

Each element has the form (NAME VALUE), where NAME is a palette entry
and VALUE is another palette symbol or a color string."
  :group 'modus-solarized
  :package-version '(modus-solarized . "1.0.0")
  :set #'modus-solarized--set-palette-option
  :type '(repeat (list symbol (choice symbol string))))

(modus-solarized--rebuild-palettes)

(defun modus-solarized--ensure-theme-metadata (theme)
  "Declare metadata for THEME when it is not already registered."
  (let* ((spec (modus-solarized--theme-spec theme))
         (mode (nth 1 spec))
         (palette-symbol (nth 2 spec))
         (description (nth 3 spec)))
    (unless (plist-get (get theme 'theme-properties) :modus-core-palette)
      (modus-themes-declare
       theme
       modus-solarized-theme-family
       description
       mode
       palette-symbol
       nil
       'modus-solarized-palette-overrides)
      (modus-themes-register theme))))

(defun modus-solarized--resolve-color (name palette)
  "Resolve palette NAME to a literal color in PALETTE."
  (let ((value (cadr (assq name palette))))
    (if (and (symbolp value) (assq value palette))
        (modus-solarized--resolve-color value palette)
      value)))

(defun modus-solarized--face-specs (faces attributes)
  "Return theme specifications for FACES using ATTRIBUTES."
  (mapcar (lambda (face) `(,face ((t ,attributes)))) faces))

(defun modus-solarized--define-theme (theme)
  "Define Modus Solarized THEME from its current generated palette."
  (let ((spec (modus-solarized--theme-spec theme)))
    (unless spec
      (error "Unknown Modus Solarized theme: %S" theme))
    (let* (
         (mode (nth 1 spec))
         (palette-symbol (nth 2 spec))
         (description (nth 3 spec))
         (palette (symbol-value palette-symbol))
         (region-background
          (modus-solarized--resolve-color 'fg-main palette))
         (region-foreground
          (modus-solarized--resolve-color 'bg-main palette)))
      (modus-solarized--ensure-theme-metadata theme)
      (put theme 'theme-settings nil)
      (apply
       #'custom-theme-set-faces
       theme
       (modus-solarized--face-specs
        modus-solarized-inverted-region-faces
        `(:background ,region-background :foreground ,region-foreground
          :underline nil :box nil)))
      (modus-themes-theme
       theme
       modus-solarized-theme-family
       description
       mode
       palette-symbol
       nil
       'modus-solarized-palette-overrides))))

(defun modus-solarized-refresh ()
  "Rebuild and reapply enabled Modus Solarized themes."
  (interactive)
  (let ((enabled-themes
         (seq-filter #'custom-theme-enabled-p
                     (mapcar #'car modus-solarized-theme-specs))))
    (mapc #'disable-theme enabled-themes)
    (modus-solarized--rebuild-palettes)
    (dolist (spec modus-solarized-theme-specs)
      (modus-solarized--define-theme (car spec)))
    (mapc #'enable-theme (reverse enabled-themes))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory
                (file-name-directory load-file-name))))

(provide 'modus-solarized)

;;; modus-solarized.el ends here
