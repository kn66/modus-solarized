;;; modus-solarized-light-theme.el --- Modus Solarized Light theme -*- lexical-binding: t; -*-

;; Copyright (C) 2026 nobu43
;; URL: https://github.com/kn66/modus-solarized
;; Version: 1.0.0
;; Package-Requires: ((emacs "28.1") (modus-themes "5.0.0"))
;; Keywords: faces, theme
;; SPDX-License-Identifier: MIT

;;; Commentary:

;; Theme entry point for `modus-solarized-light'.

;;; Code:

(require 'modus-solarized)

;;;###theme-autoload
(modus-solarized--define-theme 'modus-solarized-light)

(provide-theme 'modus-solarized-light)
(provide 'modus-solarized-light-theme)

;;; modus-solarized-light-theme.el ends here
