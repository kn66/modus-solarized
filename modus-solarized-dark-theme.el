;;; modus-solarized-dark-theme.el --- Modus Solarized Dark theme -*- lexical-binding: t; -*-

;; Copyright (C) 2026 nobu43
;; URL: https://github.com/kn66/modus-solarized
;; Version: 1.0.0
;; Package-Requires: ((emacs "28.1") (modus-themes "5.0.0"))
;; Keywords: faces, theme
;; SPDX-License-Identifier: MIT

;;; Commentary:

;; Theme entry point for `modus-solarized-dark'.

;;; Code:

(require 'modus-solarized)

;;;###theme-autoload
(modus-solarized--define-theme 'modus-solarized-dark)

(provide-theme 'modus-solarized-dark)
(provide 'modus-solarized-dark-theme)

;;; modus-solarized-dark-theme.el ends here
