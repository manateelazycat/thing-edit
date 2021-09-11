;;; thing-edit.el --- Extension thing edit

;; Author: Andy Stewart <lazycat.manatee@gmail.com>
;; Maintainer: Andy Stewart <lazycat.manatee@gmail.com>
;; Copyright (C) 2008, 2009, Andy Stewart, all rights reserved.
;; Copyright (C) 2014, Arthur Miller <arthur.miller@live.com>, all rights reserved.
;; Created: 2008-06-08 00:42:07
;; Version: 2.1
;; Last-Updated: 2020-04-26 10:04:48
;; URL: http://www.emacswiki.org/emacs/download/thing-edit.el
;; Keywords: thingatpt, edit
;; Compatibility: GNU Emacs 23.0.60.1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.

;; Features that might be required by this library:
;;
;; `thingatpt'
;;

;;; Commentary:
;;
;; This package is some useful functions that base on `thingatpt.el'.
;; Those function can copy or cut special data object quickly
;; and don't need to move cursor.
;; Just binding your like keystroke to those functions.
;;
;; thing-cut-sexp                    cut sexp around cursor.
;; thing-copy-sexp                   copy sexp around cursor.
;; thing-replace-sexp                replace sexp around cursor with content of kill-ring.
;;
;; thing-cut-email                   cut email string around cursor
;; thing-copy-email                  copy email string around cursor.
;; thing-replace-email               replace email string around cursor with content of kill-ring.
;;
;; thing-cut-filename                cut filename string around cursor.
;; thing-copy-filename               copy filename string around cursor.
;; thing-replace-filename            replace filename string around cursor with content of kill-ring.
;;
;; thing-cut-url                     cut url string around cursor.
;; thing-copy-url                    copy url string around cursor.
;; thing-replace-url                 replace url string around cursor with content of kill-ring.
;;
;; thing-cut-word                    cut word string around cursor.
;; thing-copy-word                   copy word string around cursor.
;; thing-replace-word                replace word string around cursor with content of kill-ring.
;;
;; thing-cut-symbol                  cut symbol string around cursor.
;; thing-copy-symbol                 copy symbol string around cursor.
;; thing-replace-symbol              replace symbol string around cursor with content of kill-ring.
;;
;; thing-cut-defun                   cut function string around cursor.
;; thing-copy-defun                  copy function string around cursor.
;; thing-replace-defun               replace function string around cursor with content of kill-ring.
;;
;; thing-cut-list                    cut list string around cursor.
;; thing-copy-list                   copy list string around cursor.
;; thing-replace-list                replace list string around cursor with content of kill-ring.
;;
;; thing-cut-sentence                cut sentence string around cursor.
;; thing-copy-sentence               copy sentence string around cursor.
;; thing-replace-sentence            replace sentence string around cursor with content of kill-ring.
;;
;; thing-cut-whitespace              cut whitespace string around cursor.
;; thing-copy-whitespace             copy whitespace string around cursor.
;; thing-replace-whitespace          replace whitespace string around cursor with content of kill-ring.
;;
;; thing-cut-page                    cut page string around cursor.
;; thing-copy-page                   copy page string around cursor.
;; thing-replace-page                replace page string around cursor with content of kill-ring.
;;
;; thing-cut-line                    cut current line.
;; thing-copy-line                   copy current line.
;; thing-replace-line                replace current line with content of kill-ring.
;;
;; thing-cut-region-or-line          cut current region or line.
;; thing-copy-region-or-line         copy current region or line.
;; thing-replace-region-or-line      replace current region or line with content of kill-ring.
;;
;; thing-cut-to-line-end             cut string to end of line.
;; thing-copy-to-line-end            copy string to end of line.
;; thing-replace-to-line-end         replace string to end of line with content of kill-ring.
;;
;; thing-cut-to-line-beginning       cut string to beginning of line.
;; thing-copy-to-line-beginning      copy string to beginning of line.
;; thing-replace-to-line-beginning   replace string to beginning of line with content of kill-ring.
;;
;; thing-cut-comment                 cut comment.
;; thing-copy-comment                copy comment.
;; thing-replace-comment             replace comment with content of kill-ring.
;;
;; thing-cut-paragrap                cut paragraph around cursor.
;; thing-copy-paragrap               copy paragraph around cursor.
;; thing-replace-paragrap            replace paragraph around cursor with content of kill-ring.
;;
;; thing-cut-parentheses             cut parentheses around cursor.
;; thing-copy-parentheses            copy parentheses around cursor.
;; thing-replace-parentheses         replace parentheses around cursor with content of kill-ring.
;;
;; thing-cut-number                  cut number around cursor.
;; thing-copy-number                 copy number around cursor.
;; thing-replace-number              replace number around cursor with content of kill-ring.
;;
;; thing-cut-whole-buffer            cut whole buffer
;; thing-copy-whole-buffer           copy whole buffer
;; thing-replace-whole-buffer        replace whole buffer with content of kill-ring.
;;

;;; Installation:
;;
;; Copy thing-edit.el to your load-path and add to your ~/.emacs
;;
;;      (require 'thing-edit)
;;
;; No more need

;;; Change log:
;;
;; 2020/14/26
;;      * Fix `thing-replace-region-or-line' no region here error
;;
;; 2018/12/28
;;      * Add `thing-*-number' functions.
;;
;; 2018/12/27
;;      * Use `pulse-momentary-highlight-region' instead `thing-edit-flash-line'.
;;      * Fix `comment-copy' not found.
;;      * Add `thing-*-region-or-line' functions.
;;      * Add `thing-*-whole-buffer' functions.
;;
;; 2018/12/23
;;      * Simplified code format.
;;      * Range highlighting reminder when copying operation.
;;
;; 2018/12/22
;;      * Add docs.
;;
;; 2018/12/20
;;      * Add `thing-replace-xxx' function. These functions can replace current thing with the content of `kill-ring'.
;;
;; 2014/04/09
;;      * Merge Arthur's new functions `thing-copy-paragraph' and `thing-cut-paragraph', thanks!
;;      * Merge Arthur's autoload patch, thanks a lot!
;;
;; 2009/01/13
;;      * Add many functions.
;;
;; 2009/01/09
;;      * Move functions `thing-cut-parentheses' and `thing-copy-parentheses'
;;        to file `thing-edit-extension.el', avoid this package depend `paredit'.
;;
;; 2008/09/26
;;      * Rebuild program framework, make code more clearly.
;;
;; 2008/07/28
;;      * Modified function `lazy-search-mark-object' use paredit's function to
;;        select content between parenthesis.
;;
;; 2008/06/19
;;      * Modified search method of `thing-copy-parentheses' and `thing-cut-parentheses'.
;;
;; 2008/06/08
;;      * Add edit of `url', `filename', `email', `sexp'
;;      * And ignore `defun', `page', `whitespace', `list' `sentence'.
;;      * Add basal function that apply thingatpt library.
;;      * Complete that `word', `symbol', `line', `line-to-beg', `line-to-end'
;;      * Comment is not use `thingatpt', but operate is allied.
;;

;;; Acknowledgments:
;;
;; Not yet
;;

;;; TODO
;;
;; None
;;

;;; Require
(require 'thingatpt)

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Customize ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defgroup thing-edit nil
  "Thing edit."
  :group 'term)

(defcustom thing-edit-show-message-p t
  "Set this option to nil if want thing-edit work silencely.
Default is nil."
  :type 'boolean
  :group 'thing-edit)

(defcustom thing-edit-flash-line-delay .3
  "How many seconds to flash `thing-edit-font-lock-flash' after navigation.

Setting this to nil or 0 will turn off the indicator."
  :type 'number
  :group 'thing-edit)

(defface thing-edit-font-lock-action
  '((t (:foreground "Gold" :bold t)))
  "Face for action"
  :group 'thing-edit)

(defface thing-edit-font-lock-flash
  '((t (:inherit highlight)))
  "Face to flash the current line."
  :group 'thing-edit)

(defun thing-edit-internal (object-beg object-end &optional kill-conditional)
  "A fast edit complexes object.
Argument OBJECT-BEG the begin position that object.
Argument OBJECT-END the end position of object.
Optional argument KILL-CONDITIONAL default is do copy handle, if KILL-CONDITIONAL is non-nil do cut handle."
  (interactive)
  (let ((pulse-iterations 1)
        (pulse-delay thing-edit-flash-line-delay))
    (cond (kill-conditional
           (when thing-edit-show-message-p
             (message "%s [ %s ]"
                      (propertize "Cut" 'face 'thing-edit-font-lock-action)
                      (buffer-substring object-beg object-end)))
           (kill-region object-beg object-end))
          (t
           (when thing-edit-show-message-p
             (message "%s [ %s ]"
                      (propertize "Copy" 'face 'thing-edit-font-lock-action)
                      (buffer-substring object-beg object-end)))
           ;; Flash before real copy operation.
           (pulse-momentary-highlight-region object-beg object-end 'thing-edit-font-lock-flash)
           (kill-ring-save object-beg object-end)))))

(defun thing-edit (thing &optional kill-conditional)
  "This function is a simple interface for `thing-edit-internal'.
If `KILL-CONDITIONAL' is non-nil, kill object,
otherwise copy object."
  (save-excursion
    (thing-edit-internal (beginning-of-thing thing)
                         (end-of-thing thing)
                         kill-conditional)))

(defun thing-replace-internal (object-beg object-end)
  "A fast replace complexes object.
Argument OBJECT-BEG the begin position that object.
Argument OBJECT-END the end position of object."
  (interactive)
  (goto-char object-beg)
  (delete-char (- object-end object-beg))
  (yank))

(defun thing-replace (thing)
  "This function is a simple interface for `thing-replace-internal'"
  (save-excursion
    (thing-replace-internal (beginning-of-thing thing)
                            (end-of-thing thing))))

;;;###autoload
(defun thing-cut-sexp ()
  "Cut sexp at current point."
  (interactive)
  (thing-edit 'sexp t))

;;;###autoload
(defun thing-copy-sexp (kill-conditional)
  "Copy sexp at current point.
With the universal argument, the text will also be killed."
  (interactive "P")
  (thing-edit 'sexp kill-conditional))

;;;###autoload
(defun thing-replace-sexp ()
  "Replace sexp at current point with the content of kill-ring."
  (interactive)
  (thing-replace 'sexp))

;;;###autoload
(defun thing-cut-email ()
  "Cut email at current point."
  (interactive)
  (save-excursion
    (backward-sexp)     ;make sure `thing-at-point-email-regexp' works
    (thing-edit 'email t)))

;;;###autoload
(defun thing-copy-email (kill-conditional)
  "Copy email at current point.
With the universal argument, the text will also be killed"
  (interactive "P")
  (save-excursion
    (backward-sexp)     ;make sure `thing-at-point-email-regexp' works
    (thing-edit 'email kill-conditional)))

;;;###autoload
(defun thing-replace-email ()
  "Replace email at current point with the content kill ring."
  (interactive)
  (save-excursion
    (backward-sexp)     ;make sure `thing-at-point-email-regexp' works
    (thing-replace 'email)))

;;;###autoload
(defun thing-cut-filename ()
  "Cut filename at current point."
  (interactive)
  (thing-edit 'filename t))

;;;###autoload
(defun thing-copy-filename (kill-conditional)
  "Copy filename at current point.
With the universal argument, the text will also be killed"
  (interactive "P")
  (thing-edit 'filename kill-conditional))

;;;###autoload
(defun thing-replace-filename ()
  "Replace filename at current point with kill ring."
  (interactive)
  (thing-replace 'filename))

;;;###autoload
(defun thing-cut-url ()
  "Cut url at current point."
  (interactive)
  (thing-edit 'url t))

;;;###autoload
(defun thing-copy-url (kill-conditional)
  "Copy url at current point.
With the universal argument, the text will also be killed"
  (interactive "P")
  (thing-edit 'url kill-conditional))

;;;###autoload
(defun thing-replace-url ()
  "Replace url at current point with kill ring."
  (interactive)
  (thing-replace 'url))

;;;###autoload
(defun thing-cut-word ()
  "Cut words at point."
  (interactive)
  (thing-edit 'word t))

;;;###autoload
(defun thing-copy-word (kill-conditional)
  "Copy words at point.
With the universal argument, the text will also be killed"
  (interactive "P")
  (thing-edit 'word kill-conditional))

;;;###autoload
(defun thing-replace-word ()
  "Replace words at point with kill ring."
  (interactive)
  (thing-replace 'word))

;;;###autoload
(defun thing-cut-symbol ()
  "Cut symbol around point."
  (interactive)
  (thing-edit 'symbol t))

;;;###autoload
(defun thing-copy-symbol (kill-conditional)
  "Copy symbol around point.
 With the universal argument, the text will also be killed"
  (interactive "P")
  (thing-edit 'symbol kill-conditional))

;;;###autoload
(defun thing-replace-symbol ()
  "Replace symbol around point with kill ring."
  (interactive)
  (thing-replace 'symbol))

;;;###autoload
(defun thing-cut-line ()
  "Cut current line into Kill-Ring without mark the line."
  (interactive)
  (thing-edit 'line t))

;;;###autoload
(defun thing-copy-line (kill-conditional)
  "Copy current line into Kill-Ring without mark the line.
 With the universal argument, the text will also be killed"
  (interactive "P")
  (thing-edit 'line kill-conditional))

;;;###autoload
(defun thing-replace-line ()
  "Replace current line with kill ring"
  (interactive)
  (thing-replace 'line))

;;;###autoload
(defun thing-copy-paragraph (kill-conditional)
  "Copy current paragraph around the point.
With the universal argument, the text will also be killed"
  (interactive "P")
  (thing-edit 'paragraph kill-conditional))

;;;###autoload
(defun thing-replace-paragraph ()
  "Replace current paragraph around the point with the content of kill ring."
  (interactive)
  (thing-replace 'paragraph))

;;;###autoload
(defun thing-cut-paragraph (&optional kill-conditional)
  "Cut current paragraph around the point"
  (interactive)
  (thing-edit 'paragraph t))

;;;###autoload
(defun thing-cut-defun ()
  "Cut function around point."
  (interactive)
  (thing-edit 'defun t))

;;;###autoload
(defun thing-copy-defun (kill-conditional)
  "Cut function around point.
 With the universal argument, the text will also be killed"
  (interactive "P")
  (thing-edit 'defun kill-conditional))

;;;###autoload
(defun thing-replace-defun ()
  "Replace function around point with the content of kill ring."
  (interactive)
  (thing-replace 'defun))

;;;###autoload
(defun thing-cut-list ()
  "Cut list around point."
  (interactive)
  (thing-edit 'list t))

;;;###autoload
(defun thing-copy-list (kill-conditional)
  "Cut list around point.
 With the universal argument, the text will also be killed"
  (interactive "P")
  (thing-edit 'list kill-conditional))

;;;###autoload
(defun thing-replace-list ()
  "Replace list around point with the content of kill ring."
  (interactive)
  (thing-replace 'list))

;;;###autoload
(defun thing-cut-sentence ()
  "Cut sentence around point."
  (interactive)
  (thing-edit 'sentence t))

;;;###autoload
(defun thing-copy-sentence (kill-conditional)
  "Cut sentence around point.
 With the universal argument, the text will also be killed"
  (interactive "P")
  (thing-edit 'sentence kill-conditional))

;;;###autoload
(defun thing-replace-sentence ()
  "Replace sentence around point with the content of currnt line."
  (interactive)
  (thing-replace 'sentence))

;;;###autoload
(defun thing-cut-whitespace ()
  "Cut whitespace around point."
  (interactive)
  (thing-edit 'whitespace t))

;;;###autoload
(defun thing-copy-whitespace (kill-conditional)
  "Cut whitespace around point.
 With the universal argument, the text will also be killed"
  (interactive "P")
  (thing-edit 'whitespace kill-conditional))

;;;###autoload
(defun thing-replace-whitespace ()
  "Replace whitespace around point with the content of currnt line."
  (interactive)
  (thing-replace 'whitespace))

;;;###autoload
(defun thing-cut-page ()
  "Cut page around point."
  (interactive)
  (thing-edit 'page t))

;;;###autoload
(defun thing-copy-page (kill-conditional)
  "Cut page around point.
 With the universal argument, the text will also be killed"
  (interactive "P")
  (thing-edit 'page kill-conditional))

;;;###autoload
(defun thing-replace-page ()
  "Replace page around point with the content of currnt line."
  (interactive)
  (thing-replace 'page))

;; Below function is not base on thingatpt, but it's effect like above function.
;; So i add to this package.
;;;###autoload
(defun thing-cut-to-line-end ()
  "Cut content from current point to line end."
  (interactive)
  (thing-copy-to-line-end t))

;;;###autoload
(defun thing-copy-to-line-end (&optional kill-conditional)
  "Copy content from current point to line end.
If `KILL-CONDITIONAL' is non-nil, kill object,
otherwise copy object."
  (interactive)
  (save-excursion
    (thing-edit-internal (point)
                         (line-end-position)
                         kill-conditional)))

;;;###autoload
(defun thing-cut-to-line-beginning ()
  "Cut content from current point to line beginning."
  (interactive)
  (thing-copy-to-line-beginning t))

;;;###autoload
(defun thing-copy-to-line-beginning (&optional kill-conditional)
  "Copy content from current point tot line beginning.
If `KILL-CONDITIONAL' is non-nil, kill object,
otherwise copy object."
  (interactive)
  (save-excursion
    (thing-edit-internal (line-beginning-position)
                         (point)
                         kill-conditional)))

;;;###autoload
(defun thing-cut-comment ()
  "Cut the comment around line.
If mark is active, it can cut all comment that in mark."
  (interactive)
  (thing-copy-comment t))

;;;###autoload
(defun thing-copy-comment (&optional kill-conditional)
  "Copy the comment around line.
If mark is active, it can copy all comment that in mark.
If `KILL-CONDITIONAL' is non-nil, kill object,
otherwise copy object."
  (interactive)
  (let ((beg (line-beginning-position))
        (end (line-end-position)))
    (when mark-active
      (setq beg (region-beginning))
      (setq end (region-end))
      (deactivate-mark))
    (save-excursion
      (setq end (copy-marker end))
      (goto-char beg)
      (while (< (point) end)
        (if (comment-search-forward end t)
            (if kill-conditional
                (call-interactively 'comment-kill)
              (call-interactively 'thing-comment-copy))
          (goto-char end))))))

(defun thing-comment-copy (arg)
  "Copy the first comment on this line, if any.
With prefix ARG, copy comments on that many lines starting with this one."
  (interactive "P")
  (comment-normalize-vars)
  (dotimes (_ (prefix-numeric-value arg))
    (save-excursion
      (beginning-of-line)
      (let ((cs (comment-search-forward (line-end-position) t)))
        (when cs
          (goto-char cs)
          (skip-syntax-backward " ")
          (setq cs (point))
          (comment-forward)
          (kill-ring-save cs (if (bolp) (1- (point)) (point)))
          (indent-according-to-mode))))
    (if arg (forward-line 1))))

;;;###autoload
(defun thing-cut-number ()
  "Cut number at point."
  (interactive)
  (thing-copy-number t))

;;;###autoload
(defun thing-copy-number (kill-conditional)
  "Copy number at point.
With the universal argument, the text will also be killed"
  (interactive "P")
  (save-excursion
    (when (thing-at-point-looking-at "-?[0-9]+\\.?[0-9]*" 500)
      (thing-edit-internal
       (match-beginning 0)
       (match-end 0)
       kill-conditional))))

;;;###autoload
(defun thing-replace-number ()
  "Replace number at point with kill ring."
  (interactive)
  (save-excursion
    (when (thing-at-point-looking-at "-?[0-9]+\\.?[0-9]*" 500)
      (thing-replace-internal
       (match-beginning 0)
       (match-end 0)))))

(defun thing-cut-parentheses ()
  "Cut content in match parentheses."
  (interactive)
  (thing-copy-parentheses t))

(defun thing-copy-parentheses (kill-conditional)
  "Copy content in match parentheses.
If `KILL-CONDITIONAL' is non-nil, kill object,
otherwise copy object."
  (interactive "P")
  (save-excursion
    (if (thing-edit-in-string-p)
        (thing-edit-internal
         (1+ (car (thing-edit-string-start+end-points)))
         (cdr (thing-edit-string-start+end-points))
         kill-conditional)
      (thing-edit-internal
       (progn
         (backward-up-list)
         (forward-char +1)
         (point))
       (progn
         (up-list)
         (forward-char -1)
         (point))
       kill-conditional))))

(defun thing-replace-parentheses ()
  "Replace content in match parentheses with the content of currnt line."
  (interactive)
  (save-excursion
    (if (thing-edit-in-string-p)
        (thing-replace-internal
         (1+ (car (thing-edit-string-start+end-points)))
         (cdr (thing-edit-string-start+end-points)))
      (thing-replace-internal
       (progn
         (backward-up-list)
         (forward-char +1)
         (point))
       (progn
         (up-list)
         (forward-char -1)
         (point))))))

(defun thing-edit-in-string-p (&optional state)
  (or (nth 3 (or state (thing-edit-current-parse-state)))
      (and
       (eq (get-text-property (point) 'face) 'font-lock-string-face)
       (eq (get-text-property (- (point) 1) 'face) 'font-lock-string-face))
      (and
       (eq (get-text-property (point) 'face) 'font-lock-doc-face)
       (eq (get-text-property (- (point) 1) 'face) 'font-lock-doc-face))
      ))

(defun thing-edit-string-start+end-points (&optional state)
  "Return a cons of the points of open and close quotes of the string.
The string is determined from the parse state STATE, or the parse state
  from the beginning of the defun to the point.
This assumes that `thing-edit-in-string-p' has already returned true, i.e.
  that the point is already within a string."
  (save-excursion
    (let ((start (nth 8 (or state (thing-edit-current-parse-state)))))
      (goto-char start)
      (forward-sexp 1)
      (cons start (1- (point))))))

(defun thing-edit-current-parse-state ()
  "Return parse state of point from beginning of defun."
  (let ((point (point)))
    (beginning-of-defun)
    (parse-partial-sexp (point) point)))

(defun thing-copy-region-or-line (&optional kill-conditional)
  "Copy content of the current region or line.
If `KILL-CONDITIONAL' is non-nil, kill object,
otherwise copy object."
  (interactive)
  (save-excursion
    (let* ((active (region-active-p))
           (pos (or (and active (region-beginning))
                    (line-beginning-position)))
           (pos-end (or (and active (region-end))
                        (line-end-position))))
      (thing-edit-internal pos pos-end kill-conditional))))

(defun thing-cut-region-or-line ()
  "Cut content of the current region or line."
  (interactive)
  (thing-copy-region-or-line t))

(defun thing-replace-region-or-line ()
  "Replace the current region or line with the content."
  (interactive)
  (save-excursion
    (let* ((active (region-active-p))
           (pos (or (and active (region-beginning))
                    (line-beginning-position)))
           (pos-end (or (and active (region-end))
                        (line-end-position))))
      (thing-replace-internal pos pos-end))))

(defun thing-copy-whole-buffer (&optional kill-conditional)
  "Copy content of the current buffer.
If `KILL-CONDITIONAL' is non-nil, kill object,
otherwise copy object."
  (interactive)
  (save-excursion
    (thing-edit-internal (point-min) (point-max) kill-conditional)))

(defun thing-cut-whole-buffer ()
  "Cut content of the current buffer."
  (interactive)
  (thing-copy-whole-buffer t))

(defun thing-replace-whole-buffer ()
  "Replace the current buffer with the content."
  (interactive)
  (thing-replace 'buffer))

(provide 'thing-edit)

;;; thing-edit.el ends here
