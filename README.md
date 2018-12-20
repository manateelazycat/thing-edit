# What is thing-edit ?
This package is some useful functions that base on `thingatpt.el'.
Those function can copy or paste special data object quickly and don't need to move cursor.

## Installation
Clone or download this repository (path of the folder is the `<path-to-thing-edit>` used below).

In your `~/.emacs`, add the following two lines:
```Elisp
(add-to-list 'load-path "<path-to-thing-edit>") ; add thing-edit to your load-path
(require 'thing-edit)
```

## Usage
Bind your favorite key to functions:

| Function                      | Description                             |
| :--------                     | :----                                   |
| thing-paste-sexp              | paste regular expression around cursor. |
| thing-copy-sexp               | copy regular expression around cursor.  |
|                               |                                         |
| thing-paste-email             | paste email string around cursor        |
| thing-copy-email              | copy email string around cursor.        |
|                               |                                         |
| thing-paste-filename          | paste filename string around cursor.    |
| thing-copy-filename           | copy filename string around cursor.     |
|                               |                                         |
| thing-paste-url               | paste url string around cursor.         |
| thing-copy-url                | copy url string around cursor.          |
|                               |                                         |
| thing-paste-word              | paste word string around cursor.        |
| thing-copy-word               | copy word string around cursor.         |
|                               |                                         |
| thing-paste-symbol            | paste symbol string around cursor.      |
| thing-copy-symbol             | copy symbol string around cursor.       |
|                               |                                         |
| thing-paste-defun             | paste function string around cursor.    |
| thing-copy-defun              | copy function string around cursor.     |
|                               |                                         |
| thing-paste-list              | paste list string around cursor.        |
| thing-copy-list               | copy list string around cursor.         |
|                               |                                         |
| thing-paste-sentence          | paste sentence string around cursor.    |
| thing-copy-sentence           | copy sentence string around cursor.     |
|                               |                                         |
| thing-paste-whitespace        | paste whitespace string around cursor.  |
| thing-copy-whitespace         | copy whitespace string around cursor.   |
|                               |                                         |
| thing-paste-page              | paste page string around cursor.        |
| thing-copy-page               | copy page string around cursor.         |
|                               |                                         |
| thing-paste-line              | paste current line.                     |
| thing-copy-line               | copy current line.                      |
|                               |                                         |
| thing-paste-to-line-end       | paste string to end of line.            |
| thing-copy-to-line-end        | copy string to end of line.             |
|                               |                                         |
| thing-paste-to-line-beginning | paste string to beginning of line.      |
| thing-copy-to-line-beginning  | copy string to beginning of line.       |
|                               |                                         |
| thing-paste-comment           | paste comment.                          |
| thing-copy-comment            | copy comment.                           |
|                               |                                         |
| thing-paste-paragrap          | paste paragraph around cursor.          |
| thing-copy-paragrap           | copy paragraph around cursor.           |
|                               |                                         |
| thing-paste-parentheses       | paste parentheses around cursor.        |
| thing-copy-parentheses        | copy parentheses around cursor.         |

