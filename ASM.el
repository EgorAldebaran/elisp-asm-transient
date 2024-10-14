;;;;global section
(setq asm-name-number-data "")

(transient-define-prefix magic-asm-transient ()
  "Магические команды Великого АСМА"
  [
   "Магические команды ВЕЛИКОГО АСМА\n" 
   [
    "Перемещения Тетраморфа"
    ("mv" "mov" (lambda () 
                  (interactive)
		  (indent-for-tab-command)
                  (insert "mov ") 
                  (register-destination-transient)))
    ("mb" "movb ПЕРЕМЕЩЕНИЕ 1 БАЙТА используй 8-битные значения" (lambda () 
								   (interactive)
								   (indent-for-tab-command)
								   (insert "movb ") 
								   (register-destination-transient)))
    ("mw" "movw ПЕРЕМЕЩЕНИЕ СЛОВА (2 БАЙТА)" (lambda () 
					       (interactive)
					       (indent-for-tab-command)
					       (insert "movw ") 
					       (register-destination-transient)))
    ("ml" "movl ПЕРЕМЕЩЕНИЕ ДВОЙНОГО СЛОВА (4 байта)" (lambda () 
							(interactive)
							(indent-for-tab-command)
							(insert "movl ") 
							(register-destination-transient)))
    ("mq" "movq ПЕРЕМЕЩЕНИЕ КВАДРАТНОГО-СЛОВА (8 байт)" (lambda () 
							  (interactive)
							  (indent-for-tab-command)
							  (insert "movq ") 
							  (register-destination-transient)))
    ("-mv" "mov ПЕРЕМЕСТИТЬ ИЗ МЕСТА В ПАМЯТИ" (lambda ()
						 (interactive)
						 (indent-for-tab-command)
						 (insert (format "mov %s\(%%rip\), " (substring (helm-asm-parse-data) 0 -1)))
						 (register-sourcer-transient)))
    ("-mw" "mov ПЕРЕМЕСТИТЬ ИЗ МЕСТА В ПАМЯТИ" (lambda ()
						 (interactive)
						 (indent-for-tab-command)
						 (insert (format "movw %s\(%%rip\), " (substring (helm-asm-parse-data) 0 -1)))
						 (register-sourcer-transient)))
    ("-ml" "mov ПЕРЕМЕСТИТЬ ИЗ МЕСТА В ПАМЯТИ" (lambda ()
						 (interactive)
						 (indent-for-tab-command)
						 (insert (format "movl %s\(%%rip\), " (substring (helm-asm-parse-data) 0 -1)))
						 (register-sourcer-transient)))
    ("-mq" "mov ПЕРЕМЕСТИТЬ ИЗ МЕСТА В ПАМЯТИ" (lambda ()
						 (interactive)
						 (indent-for-tab-command)
						 (insert (format "movq %s\(%%rip\), " (substring (helm-asm-parse-data) 0 -1)))
						 (register-sourcer-transient)))
    ("le" "lea ЗАГРУЗИТЬ АДРЕС ПЕРЕМЕННОЙ" (lambda () 
					     (interactive)
					     (indent-for-tab-command)
					     (insert (format "\lea %s(%%rip), " (read-string "какую переменную загрузить? "))) 
					     (register-sourcer-transient)))
       ;;;;----место для добавления перемещений
    ]
   [
    "Тетраморф и Платформа (КУБ)"
    ("pu" "push" (lambda ()
		   (interactive)
		   (indent-for-tab-command)
		   (insert "push ")
		   (register-sourcer-transient)))
    ("po" "pop" (lambda ()
		  (interactive)
		  (indent-for-tab-command)
		  (insert "pop ")
		  (register-sourcer-transient)))
    ("su" "sub - выделяем место в КУБЕ" (lambda ()
					  (interactive)
					  (indent-for-tab-command)
					  (insert (format "sub $%d, %%rsp\n" (read-number "сколько места выделяем? ")))))
    ;;;;----место для работы с платформой
    ]

   [
    "Состояние Тетраморфа"
    ("pu" "push" (lambda ()
		   (interactive)
		   (indent-for-tab-command)
		   (insert "push ")
		   (register-sourcer-transient)))
    ("po" "pop" (lambda ()
		  (interactive)
		  (indent-for-tab-command)
		  (insert "pop ")
		  (register-sourcer-transient)))
    ;;;;----место для работы с состоянием флагами
    ]
   
   ]
  
  [

   [
    "Служебные Команды"
    ("-c" "КОММЕНТАРИЙ" (lambda ()
			  (interactive)
			  (indent-for-tab-command)
			  (asm-comments)))
    ("be" "НАЧАЛО" (lambda ()
		     (interactive)
		     (indent-for-tab-command)
		     (insert ".section .text")
		     (pressReturn)
		     (indent-for-tab-command)
		     (insert ".global _start")
		     (pressReturn)
		     (insert "_start:")
		     (pressReturn)))
    ("en" "КОНЕЦ" (lambda ()
		    (interactive)
		    (indent-for-tab-command)
		    (insert "#====ЗАВЕРШЕНИЕ====#")
		    (pressReturn)
		    (indent-for-tab-command)
		    (insert "mov $1, %rax")
		    (pressReturn)
		    (indent-for-tab-command)
		    (insert "xor %rbx, %rbx")
		    (pressReturn)
		    (indent-for-tab-command)
		    (insert "int $0x80")))
    ]
   [
    "Служебные Команды"
    ("-c" "КОММЕНТАРИЙ" (lambda ()
			  (interactive)
			  (indent-for-tab-command)
			  (asm-comments)))
    ("be" "НАЧАЛО" (lambda ()
		     (interactive)
		     (indent-for-tab-command)
		     (insert ".section .text")
		     (pressReturn)
		     (indent-for-tab-command)
		     (insert ".global _start")
		     (pressReturn)
		     (insert "_start:")
		     (pressReturn)))
    ("en" "КОНЕЦ" (lambda ()
		    (interactive)
		    (indent-for-tab-command)
		    (insert "#====ЗАВЕРШЕНИЕ====#")
		    (pressReturn)
		    (indent-for-tab-command)
		    (insert "mov $1, %rax")
		    (pressReturn)
		    (indent-for-tab-command)
		    (insert "xor %rbx, %rbx")
		    (pressReturn)
		    (indent-for-tab-command)
		    (insert "int $0x80")))
    ]
   
   [
    :description "СЕКЦИЯ ДАННЫХ"
    ("ss" "section" (lambda ()
		      (interactive)
		      (asm-section-data)))
    ("-q" "Выйти из транзита" transient-quit-one)
    ]

   [
    :description "Информация"
    ("i" "info" (lambda ()
		  (interactive)
		  (asm-info)))
    ("-q" "Выйти из транзита" transient-quit-one)
    ]

   [
    :description "Информация"
    ("-q" "Выйти из транзита" transient-quit-one)
    ]

   ]
  )

(transient-define-prefix asm-section-data ()
  "Секция данных для АСМА"
  [
   "Секция статичных данных, глобальных и констант для АСМА"
   ("d" "data" (lambda ()
		 (interactive)
		 (indent-for-tab-command)
		 (insert ".section .data\n")
		 (asm-section-data)))
   ("n" "number-variable" (lambda ()
			    (interactive)
			    (let* ((variable-name (read-string "Название переменной: "))
				   (number (read-number "Введи значение переменной - числа "))
				   (choice (read-string "(b) - 1 байт 8 би от -128 до 128 for .byte\n(w) 2 байта 16 бит- от -32,768 до 32,767 for .word \n(d) 4байта 32 бита от -2,147,483,648 до 2,147,483,647- for dword\т(q) 8 байт 64 бита  0 до 18,446,744,073,709,551,615- for qword: "))
				   (return-choice
				    (cond ((equal choice "b")
					   ".byte")
					  ((equal choice "w")
					   ".word")
					  ((equal choice "d")
					   ".long")
					  ((equal choice "q")
					   ".quard")
					  (t (message "Введи корректное значение")))))
			      (insert (format "\%s:\n\t%s %#x\n"
					      variable-name
					      return-choice
					      number
					      ))
			      (setq asm-name-number-data variable-name))))
   ("q" "quit" transient-quit-one)
   ]
  )

(transient-define-prefix asm-comments ()
  "Комментарии для АСМА"
  ["Комментарии для АСМА"
   ("b" "Граница"
    (lambda ()
      (interactive)
      (indent-for-tab-command)
      (insert "#------------------#\n"))
    (finish-instruction))
   ("c" "Комментарий"
    (lambda ()
      (interactive)
      (indent-for-tab-command)
      (insert (format "#--%s--#\n" (read-string "Комментарий: "))))
    (finish-instruction))
   ])


(transient-define-prefix register-destination-transient ()
  "Регистр, откуда исходит Свет"
  [

   ("INFO" "ОТКУДА" (lambda () (interactive) (message "ОТКУДА?"))
    :description "ОТКУДА исходит Свет Информации?"
    :face 'red-for-asm)
   ("ra" "RAX (Accumulator)" (lambda () (interactive) (insert "%rax, ") (register-sourcer-transient))
    :description "RAX (Accumulator) - ВЕЧНОЕ - КОРОЛЕВСКАЯ ЗВЕЗДА ФОМАЛЬГАУТ"
    :face 'gold-for-asm)
   ("rx" "RBX (Base Register)" (lambda () (interactive) (insert "%rbx, ") (register-sourcer-transient)))
   ("rc" "RCX (Counter Register)" (lambda () (interactive) (insert "%rcx, ") (register-sourcer-transient)))
   ("ri" "RIP" (lambda () (interactive) (insert "%rip, ") (register-sourcer-transient))
    :description "RIP - НАСТОЯЩЕЕ - КОРОЛЕВСКАЯ ЗВЕЗДА РЕГУЛ"
    :face 'light-gray-for-asm-asm)
   ("rb" "RBP" (lambda () (interactive) (insert "%rbp, ") (register-sourcer-transient)))
   ("rs" "RSP" (lambda () (interactive) (insert "%rsp, ") (register-sourcer-transient))
    :description "RSP - БУДУЩЕЕ В ВЕЛИКОМ КУБЕ - КОРОЛЕВСКАЯ ЗВЕЗДА АЛЬДЕБАРАН"
    :face 'light-gray-for-asm-asm)
   ("rd" "RDX (Data Register)" (lambda () (interactive) (insert "%rdx, ") (register-sourcer-transient)))
   ("0" "ТВОЙ ВАРИАНТ" (lambda () 
                         (interactive)
                         (let ((user-input (read-string (propertize "что напишем? " 'face '(:foreground "orange" :weight bold)))))
                           (insert (format "%s, " user-input)))
                         (register-sourcer-transient))
    :description "Твой вариант..."
    :face 'light-gray-for-asm)
   ("-ra" "(RAX)" (lambda () (interactive) (insert "(%rax), ") (register-sourcer-transient)))
   ("-rb" "(RBX)" (lambda () (interactive) (insert "(%rbx), ") (register-sourcer-transient)))
   ("-rc" "(RCX)" (lambda () (interactive) (insert "(%rcx), ") (register-sourcer-transient)))
   ("-rd" "(RDX)" (lambda () (interactive) (insert "(%rdx), ") (register-sourcer-transient)))
   ]
  ["Подсекции RAX"
   ("ea" "EAX (32-битный)" (lambda () (interactive) (insert "%eax, ") (register-sourcer-transient)))
   ("ah" "AH (8-битный)" (lambda () (interactive) (insert "%ah, ") (register-sourcer-transient)))
   ("al" "AL (8-битный)" (lambda () (interactive) (insert "%al, ") (register-sourcer-transient)))
   ("-ea" "(EAX)" (lambda () (interactive) (insert "(%eax), ") (register-sourcer-transient)))
   ]
  ["Подсекции RBX"
   ("eb" "EBX (32-битный)" (lambda () (interactive) (insert "%ebx, ") (register-sourcer-transient)))
   ("bh" "BH (8-битный)" (lambda () (interactive) (insert "%bh, ") (register-sourcer-transient)))
   ("bl" "BL (8-битный)" (lambda () (interactive) (insert "%bl, ") (register-sourcer-transient)))
   ("-eb" "(EBX)" (lambda () (interactive) (insert "(%ebx), ") (register-sourcer-transient)))
   ]
  ["Подсекции RCX"
   ("ec" "ECX (32-битный)" (lambda () (interactive) (insert "%ecx, ") (register-sourcer-transient)))
   ("ch" "CH (8-битный)" (lambda () (interactive) (insert "%ch, ") (register-sourcer-transient)))
   ("cl" "CL (8-битный)" (lambda () (interactive) (insert "%cl, ") (register-sourcer-transient)))
   ("ed" "(ECX)" (lambda () (interactive) (insert "(%ecx), ") (register-sourcer-transient)))
   ]
  ["Подсекции RDX"
   ("ed" "EDX (32-битный)" (lambda () (interactive) (insert "%edx, ") (register-sourcer-transient)))
   ("dh" "DH (8-битный)" (lambda () (interactive) (insert "%dh, ") (register-sourcer-transient)))
   ("dl" "DL (8-битный)" (lambda () (interactive) (insert "%dl, ") (register-sourcer-transient)))
   ("-ed" "(EDX)" (lambda () (interactive) (insert "(%edx), ") (register-sourcer-transient)))
   ]
  ["Опции"
   ("-q" "Выход" transient-quit-one)])

(transient-define-prefix register-sourcer-transient ()
  "Регистр - приемник света"
  [
   ("INFO" "КУДА" (lambda () (interactive) (message "ОТКУДА?"))
    :description "КУДА отправляется Свет Информации?"
    :face 'magenta-for-asm)
   ("ra" "RAX (Accumulator)" (lambda () (interactive) (insert "%rax") (finish-instruction))
    :description "RAX (Accumulator) - ВЕЧНОЕ - КОРОЛЕВСКАЯ ЗВЕЗДА ФОМАЛЬГАУТ"
    :face 'gold-for-asm)
   ("rx" "RBX (Base Register)" (lambda () (interactive) (insert "%rbx") (finish-instruction)))
   ("rc" "RCX (Counter Register)" (lambda () (interactive) (insert "%rcx") (finish-instruction)))
   ("ri" "RIP (Instruction Pointer)" (lambda () (interactive) (insert "%rip") (finish-instruction))
    :description "RIP - НАСТОЯЩЕЕ - КОРОЛЕВСКАЯ ЗВЕЗДА РЕГУЛ"
    :face 'light-gray-for-asm)
   ("rb" "RBP" (lambda () (interactive (insert "%rbp\n") (finish-instruction))))
   ("rs" "RSP" (lambda () (interactive) (insert "%rsp") (finish-instruction))
    :description "RSP - БУДУЩЕЕ В ВЕЛИКОМ КУБЕ - КОРОЛЕВСКАЯ ЗВЕЗДА АЛЬДЕБАРАН"
    :face 'violet-for-asm)
   ("rd" "RDX (Data Register)" (lambda () (interactive) (insert "%rdx") (finish-instruction)))
   ("-ra" "(RAX)" (lambda () (interactive) (insert "(%rax)") (finish-instruction)))
   ("-rb" "(RBX)" (lambda () (interactive) (insert "(%rbx)") (finish-instruction)))
   ("-rc" "(RCX)" (lambda () (interactive) (insert "(%rcx)") (finish-instruction)))
   ("-rd" "(RDX)" (lambda () (interactive) (insert "(%rdx)") (finish-instruction)))
   ("0" "ТВОЙ ВАРИАНТ" (lambda () 
                         (interactive)
                         (let ((user-input (read-string (propertize "что напишем? " 'face '(:foreground "orange" :weight bold)))))
                           (insert (format "%s" user-input)))
                         (finish-instruction))
    :description "Твой вариант..."
    :face 'light-gray-for-asm)
   ]
  ["Подсекции RAX"
   ("ea" "EAX (32-битный)" (lambda () (interactive) (insert "%eax") (finish-instruction)))
   ("ah" "AH (8-битный)" (lambda () (interactive) (insert "%ah") (finish-instruction)))
   ("al" "AL (8-битный)" (lambda () (interactive) (insert "%al") (finish-instruction)))
   ("-ea" "(EAX)" (lambda () (interactive) (insert "(%eax)") (finish-instruction)))
   ]
  ["Подсекции RBX"
   ("eb" "EBX (32-битный)" (lambda () (interactive) (insert "%ebx") (finish-instruction)))
   ("bh" "BH (8-битный)" (lambda () (interactive) (insert "%bh") (finish-instruction)))
   ("bl" "BL (8-битный)" (lambda () (interactive) (insert "%bl") (finish-instruction)))
   ("-eb" "(EBX)" (lambda () (interactive) (insert "(%ebx)") (finish-instruction)))
   ]
  ["Подсекции RCX"
   ("ec" "ECX (32-битный)" (lambda () (interactive) (insert "%ecx") (finish-instruction)))
   ("ch" "CH (8-битный)" (lambda () (interactive) (insert "%ch") (finish-instruction)))
   ("cl" "CL (8-битный)" (lambda () (interactive) (insert "%cl") (finish-instruction)))
   ("-ec" "(ECX)" (lambda () (interactive) (insert "(%ecx)") (finish-instruction)))
   ]
  ["Подсекции RDX"
   ("ed" "EDX (32-битный)" (lambda () (interactive) (insert "%edx") (finish-instruction)))
   ("dh" "DH (8-битный)" (lambda () (interactive) (insert "%dh") (finish-instruction)))
   ("dl" "DL (8-битный)" (lambda () (interactive) (insert "%dl") (finish-instruction)))
   ("-ed" "(EDX)" (lambda () (interactive) (insert "(%edx)") (finish-instruction)))
   ]
  ["Опции"
   ("-q" "Выход" transient-quit-one)])

(defun finish-instruction ()
  (insert "\n")
  (indent-for-tab-command)
  ;;;;;завершение текущего транзита
  (transient-quit-one))

(defface red-for-asm
  '((t (:foreground "red" :weight bold)))
  "Красное выделение текста.")

(defface blue-for-asm
  '((t (:foreground "blue" :weight bold)))
  "Голубое выделение текста.")

(defface blue-for-asm
  '((t (:foreground "blue" :weight bold)))
  "Голубое выделение текста.")

(defface black-for-asm
  '((t (:foreground "black" :weight bold)))
  "Черное выделение текста.")

(defface red-for-asm
  '((t (:foreground "red" :weight bold)))
  "Красное выделение текста.")

(defface green-for-asm
  '((t (:foreground "green" :weight bold)))
  "Зеленое выделение текста.")

(defface yellow-for-asm
  '((t (:foreground "yellow" :weight bold)))
  "Желтое выделение текста.")

(defface blue-for-asm
  '((t (:foreground "blue" :weight bold)))
  "Голубое выделение текста.")

(defface magenta-for-asm
  '((t (:foreground "magenta" :weight bold)))
  "Магентовое выделение текста.")

(defface cyan-for-asm
  '((t (:foreground "cyan" :weight bold)))
  "Циановое выделение текста.")

(defface white-for-asm
  '((t (:foreground "white" :weight bold)))
  "Белое выделение текста.")

(defface light-gray-for-asm
  '((t (:foreground "light gray" :weight bold)))
  "Светло-серое выделение текста.")

(defface dark-gray-for-asm
  '((t (:foreground "dark gray" :weight bold)))
  "Темно-серое выделение текста.")

(defface light-red-for-asm
  '((t (:foreground "light red" :weight bold)))
  "Светло-красное выделение текста.")

(defface light-green-for-asm
  '((t (:foreground "light green" :weight bold)))
  "Светло-зеленое выделение текста.")

(defface light-yellow-for-asm
  '((t (:foreground "light yellow" :weight bold)))
  "Светло-желтое выделение текста.")

(defface light-blue-for-asm
  '((t (:foreground "light blue" :weight bold)))
  "Светло-голубое выделение текста.")

(defface light-magenta-for-asm
  '((t (:foreground "light magenta" :weight bold)))
  "Светло-магентовое выделение текста.")

(defface light-cyan-for-asm
  '((t (:foreground "light cyan" :weight bold)))
  "Светло-циановое выделение текста.")

(defface orange-for-asm
  '((t (:foreground "orange" :weight bold)))
  "Оранжевое выделение текста.")

(defface violet-for-asm
  '((t (:foreground "violet" :weight bold)))
  "Фиолетовое выделение текста.")

(defface pink-for-asm
  '((t (:foreground "pink" :weight bold)))
  "Розовое выделение текста.")

(defface gold-for-asm
  '((t (:foreground "gold" :weight bold)))
  "Золотое выделение текста.")


(defun my-read-string-with-style (prompt)
  (let ((styled-prompt (propertize prompt 'face '(:foreground "red" :weight bold))))
    (read-string styled-prompt)))

;;;(my-read-string-with-style "Введите значение: ")

(defun my-custom-new-line ()
  (interactive)
  (if (string-equal (file-name-extension buffer-file-name) "S")
      (funcall 'magic-asm-transient)
    (message "ВЕЛИКИЙ АСМ ПРИДАСТ СИЛУ!!!")  
    (newline)))

(define-key global-map (kbd "C-j") 'my-custom-new-line)


(transient-define-prefix asm-info ()
  "справочные материалы для асма"
  [
   "справочные материалы для АСМА"
   ("1" "размеры чисел" (lambda ()
			  (interactive)
			  (message "
Вот размеры чисел для различных директив в ассемблере:

    .byte — байт:
        Размер: 1 байт (8 бит).
        Диапазон значений:
            Для знаковых целых чисел: от -128 до 127.
            Для беззнаковых целых чисел: от 0 до 255.

    .word — слово:
        Размер: 2 байта (16 бит).
        Диапазон значений:
            Для знаковых целых чисел: от -32,768 до 32,767.
            Для беззнаковых целых чисел: от 0 до 65,535.

    .long — двойное слово:
        Размер: 4 байта (32 бита).
        Диапазон значений:
            Для знаковых целых чисел: от -2,147,483,648 до 2,147,483,647.
            Для беззнаковых целых чисел: от 0 до 4,294,967,295.
    .quad (иногда пишут .quad вместо .quard) — четверное слово:
        Размер: 8 байт (64 бита).
        Диапазон значений:
            Для знаковых целых чисел: от -9,223,372,036,854,775,808 до 9,223,372,036,854,775,807.
            Для беззнаковых целых чисел: от 0 до 18,446,744,073,709,551,615.
Эти диапазоны важны, когда ты выбираешь размер переменной, потому что превышение границ приведёт к переполнению или неправильной интерпретации данных.
")))
   ("g" "global - ГЛОБАЛЬНЫЕ ДАННЫЕ" (lambda ()
				       (interactive)
				       (asm-info-data-section)))
   ("q" "quit" transient-quit-one)
   ])

(defun parse-section-string (input)
  "Парсит строку INPUT и возвращает список пар (ключ . значение)."
  (let ((result '()))
    ;; Разделяем строку по пробелам и табуляциям
    (dolist (item (split-string input "[ \t]+" t))
      ;; Ищем ключи и значения по двоеточию
      (when (string-match "\\(.*?\\):\\s-*\\(.*\\)" item)
        (let ((key (match-string 1 item))
              (value (match-string 2 item)))
          (push (cons key value) result)))))
  (nreverse result))


(defun asm-info-data-section ()
  "Парсим данные и выводим из секций для данных"
  (let ((header (format "%-20s | %-20s\n" "ASM-DATA" "ASM-VALUE"))
	(separator (make-string 45 ?-))
	(table-rows ""))
    (dolist (i (asm-read-section-data (buffer-file-name))) 
      (setq table-rows
	    (concat table-rows (format "%-20s | %-20s\n" "ASM-DATA:" i))))
    (message "\n%s\n%s\n%s" header separator table-rows)))
;;;;(asm-info-data-section)
;;;(asm-read-section-data "../asm.S")

(defun asm-parse-data ()
  "собираю данные с секций"
  (let ((not-section-name '()))
    (dolist (i (asm-read-section-data (buffer-file-name)))
      (if (not (string-match-p  "section" i))
	  (push i not-section-name)))
    not-section-name))
;;;(asm-parse-data)

(defun helm-asm-parse-data ()
  (let* ((asm-data (helm :sources (helm-build-sync-source "ДАННЫЕ АСМА С СЕКЦИЙ"
				    :candidates (asm-parse-data)
				    :fuzzy-match t)
			 :buffer "*ASM static and global data*")))
    asm-data))
;;;;(insert (format "%s" (helm-asm-parse-data)))


;;(asm-parse-sections "../asm.S")
(defun asm-read-section-data (file-path)
  "Прочитать файл с ассемблерным кодом и вернуть его содержимое как список строк, исключая строки после .section .text."
  (let* ((source (with-temp-buffer
		   (insert-file-contents file-path)
		   (replace-regexp-in-string "[ \t]+" "" (buffer-string) "\n" t))))
    (setq source (split-string source))
    (let ((result '())
	  (found-text-section nil))
      (dolist (i source)
	(if (and (not found-text-section)
		 (string-match-p "\\.section+\\.text" i))
	    (setq found-text-section t)
	  (when (not found-text-section)
	    (push i result))))
      (nreverse result))))








