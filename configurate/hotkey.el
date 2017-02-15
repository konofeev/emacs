;; Горячие клавиши
;; Как общая функциональность, так и плагины

;; Выход из режима ввода и редактирование комбинацией Shift-Space
(define-key evil-insert-state-map (kbd "S-SPC") 'evil-normal-state)
(define-key evil-replace-state-map (kbd "S-SPC") 'evil-normal-state)

;; Сохранение файла
(define-key evil-normal-state-map (kbd "SPC w") 'save-buffer)

;; Закрыть всё
(define-key evil-normal-state-map (kbd "SPC ESC") 'save-buffers-kill-terminal)

;; Открыть буфер
(define-key evil-normal-state-map (kbd "SPC b") 'ido-switch-buffer)

;; Очистить терминал eshell
(add-hook 'eshell-mode-hook
      '(lambda()
          (local-set-key (kbd "C-l") 'eshell-clear-buffer)))

;; Закладки
(define-key evil-normal-state-map (kbd "SPC m s") 'bookmark-set)
(define-key evil-normal-state-map (kbd "SPC m g") 'bookmark-jump)
(define-key evil-normal-state-map (kbd "SPC m l") 'bookmark-bmenu-list)

;; Заметки - org-mode
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

;; Переход по строкам
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)

;; Переключение комментирования выделенного участка текста
(define-key evil-visual-state-map (kbd "g c") 'comment-or-uncomment-region)
(define-key evil-normal-state-map (kbd ", b") 'toggle-truncate-lines)

;; Буферы
(global-set-key (kbd "<f2>") 'bs-show)

;; Выравнивание кода
(define-key evil-visual-state-map (kbd "SPC a") 'align-repeat)
(define-key evil-visual-state-map (kbd "SPC s") 'align-common)

;; Projectile
(define-key evil-normal-state-map (kbd "SPC p p") 'projectile-switch-project)
(define-key evil-normal-state-map (kbd "SPC p f") 'projectile-find-file)
(define-key evil-normal-state-map (kbd "SPC p b") 'projectile-switch-to-buffer)

;; Открыть файл настроек
(define-key evil-normal-state-map (kbd "SPC o e") 'open-emacs-configurate)

;; Открыть файл заметок
(define-key evil-normal-state-map (kbd "SPC o j") 'open-org-java)

;; Коректная работа клавиши escape
(defun minibuffer-keyboard-quit ()
  "Отстановить рекурсивное редактирование.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

;; Вставка пробелов при переводе строки
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Использование тегов - Gnu Global
(define-key evil-normal-state-map (kbd "C-]") 'gtags-find-pattern)
(define-key evil-normal-state-map (kbd "C-t") 'gtags-pop-stack)

;; Подсветка слов
(define-key evil-normal-state-map (kbd ", m m") 'highlight-symbol)
(define-key evil-normal-state-map (kbd ", m r") 'highlight-regexp)

;; Запуск шелла
(define-key evil-normal-state-map (kbd "SPC r s") 'eshell)

;; Подсказки в командах alt-x
(global-set-key (kbd "M-x") 'smex)
(define-key evil-normal-state-map (kbd "SPC SPC") 'smex)
