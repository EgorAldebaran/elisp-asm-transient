(transient-define-prefix magic-asm-transient ()
  "Магические команды Великого АСМА"
  [
   "Магические команды ВЕЛИКОГО АСМА\n" 
   [
    "Перемещения Тетраморфа"
    ("j" "mov" (lambda () 
                 (interactive)
		 (indent-for-tab-command)
                 (insert "mov ") 
                 (register-destination-transient)))
       ("b" "movb ПЕРЕМЕЩЕНИЕ 1 БАЙТА используй 8-битные значения" (lambda () 
								 (interactive)
								 (indent-for-tab-command)
								 (insert "movb ") 
								 (register-destination-transient)))
       ("w" "movw ПЕРЕМЕЩЕНИЕ СЛОВА (2 БАЙТА)" (lambda () 
						 (interactive)
						 (indent-for-tab-command)
						 (insert "movw ") 
						 (register-destination-transient)))
       ("l" "movl ПЕРЕМЕЩЕНИЕ ДВОЙНОГО СЛОВА (4 байта)" (lambda () 
							  (interactive)
							  (indent-for-tab-command)
							  (insert "movl ") 
							  (register-destination-transient)))
       ("q" "movq ПЕРЕМЕЩЕНИЕ КВАДРАТНОГО-СЛОВА (8 байт)" (lambda () 
							    (interactive)
							    (indent-for-tab-command)
							    (insert "movq ") 
							    (register-destination-transient)))
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
    ("c" "КОММЕНТАРИЙ" (lambda ()
			(interactive)
			(indent-for-tab-command)
			 (asm-comments)))
   ("s" "НАЧАЛО" (lambda ()
		   (interactive)
		   (indent-for-tab-command)
		   (insert ".section .text")
		   (pressReturn)
		   (indent-for-tab-command)
		   (insert ".global _start")
		   (pressReturn)
		   (insert "_start:")
		   (pressReturn)))
   ("e" "КОНЕЦ" (lambda ()
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
    ("c" "КОММЕНТАРИЙ" (lambda ()
			(interactive)
			(indent-for-tab-command)
			 (asm-comments)))
   ("s" "НАЧАЛО" (lambda ()
		   (interactive)
		   (indent-for-tab-command)
		   (insert ".section .text")
		   (pressReturn)
		   (indent-for-tab-command)
		   (insert ".global _start")
		   (pressReturn)
		   (insert "_start:")
		   (pressReturn)))
   ("e" "КОНЕЦ" (lambda ()
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
    :description "Информация"
    ("-q" "Выйти из транзита" transient-quit-one)
    ]

   [
    :description "Информация"
    ("-q" "Выйти из транзита" transient-quit-one)
    ]

   [
    :description "Информация"
    ("-q" "Выйти из транзита" transient-quit-one)
    ]

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
  "Регистр, куда отправляются данные"
  ["Регистр, втягивающий Свет Информации"
   ("j" "RAX (Accumulator)" (lambda () (interactive) (insert "%rax, ") (register-sourcer-transient))
    :description "RAX (Accumulator) - ВЕЧНОЕ - КОРОЛЕВСКАЯ ЗВЕЗДА ФОМАЛЬГАУТ"
    :face 'gold-for-asm)
   ("b" "RBX (Base Register)" (lambda () (interactive) (insert "%rbx, ") (register-sourcer-transient)))
   ("c" "RCX (Counter Register)" (lambda () (interactive) (insert "%rcx, ") (register-sourcer-transient)))
   ("i" "RIP" (lambda () (interactive) (insert "%rip, ") (register-sourcer-transient))
    :description "RIP - НАСТОЯЩЕЕ - КОРОЛЕВСКАЯ ЗВЕЗДА РЕГУЛ"
    :face 'red-for-asm)
   ("u" "RSP" (lambda () (interactive) (insert "%rsp, ") (register-sourcer-transient))
    :description "RSP - БУДУЩЕЕ В ВЕЛИКОМ КУБЕ - КОРОЛЕВСКАЯ ЗВЕЗДА АЛЬДЕБАРАН"
    :face 'blue-for-asm)
   ("d" "RDX (Data Register)" (lambda () (interactive) (insert "%rdx, ") (register-sourcer-transient)))
    ("0" "ТВОЙ ВАРИАНТ" (lambda () 
                         (interactive)
                         (let ((user-input (read-string (propertize "что напишем? " 'face '(:foreground "orange" :weight bold)))))
                           (insert (format "%s, " user-input)))
                         (register-sourcer-transient))
     :description "Твой вариант..."
     :face 'light-gray-for-asm)
   ("-a" "(RAX)" (lambda () (interactive) (insert "(%rax), ") (register-sourcer-transient)))
   ("-b" "(RBX)" (lambda () (interactive) (insert "(%rbx), ") (register-sourcer-transient)))
   ("-c" "(RCX)" (lambda () (interactive) (insert "(%rcx), ") (register-sourcer-transient)))
   ("-d" "(RDX)" (lambda () (interactive) (insert "(%rdx), ") (register-sourcer-transient)))
   ]
  ["Подсекции RAX"
   ("-a" "EAX (32-битный)" (lambda () (interactive) (insert "%eax, ") (register-sourcer-transient)))
   ("-b" "AH (8-битный)" (lambda () (interactive) (insert "%ah, ") (register-sourcer-transient)))
   ("-c" "AL (8-битный)" (lambda () (interactive) (insert "%al, ") (register-sourcer-transient)))
   ("-d" "(EAX)" (lambda () (interactive) (insert "(%eax), ") (register-sourcer-transient)))
   ]
  ["Подсекции RBX"
   ("-x" "EBX (32-битный)" (lambda () (interactive) (insert "%ebx, ") (register-sourcer-transient)))
   ("-y" "BH (8-битный)" (lambda () (interactive) (insert "%bh, ") (register-sourcer-transient)))
   ("-z" "BL (8-битный)" (lambda () (interactive) (insert "%bl, ") (register-sourcer-transient)))
   ("-k" "(EBX)" (lambda () (interactive) (insert "(%ebx), ") (register-sourcer-transient)))
   ]
  ["Подсекции RCX"
   ("-r" "ECX (32-битный)" (lambda () (interactive) (insert "%ecx, ") (register-sourcer-transient)))
   ("-t" "CH (8-битный)" (lambda () (interactive) (insert "%ch, ") (register-sourcer-transient)))
   ("-u" "CL (8-битный)" (lambda () (interactive) (insert "%cl, ") (register-sourcer-transient)))
   ("-j" "(ECX)" (lambda () (interactive) (insert "(%ecx), ") (register-sourcer-transient)))
   ]
  ["Подсекции RDX"
   ("-g" "EDX (32-битный)" (lambda () (interactive) (insert "%edx, ") (register-sourcer-transient)))
   ("-v" "DH (8-битный)" (lambda () (interactive) (insert "%dh, ") (register-sourcer-transient)))
   ("-f" "DL (8-битный)" (lambda () (interactive) (insert "%dl, ") (register-sourcer-transient)))
   ("-m" "(EDX)" (lambda () (interactive) (insert "(%edx), ") (register-sourcer-transient)))
   ]
  ["Опции"
   ("-q" "Выход" transient-quit-one)])

(transient-define-prefix register-sourcer-transient ()
  "Регистр - источник света"
  ["Регистр - источник Света Информации"
   ("j" "RAX (Accumulator)" (lambda () (interactive) (insert "%rax") (finish-instruction))
    :description "RAX (Accumulator) - ВЕЧНОЕ - КОРОЛЕВСКАЯ ЗВЕЗДА ФОМАЛЬГАУТ"
    :face 'gold-for-asm)
   ("h" "RBX (Base Register)" (lambda () (interactive) (insert "%rbx") (finish-instruction)))
   ("n" "RCX (Counter Register)" (lambda () (interactive) (insert "%rcx") (finish-instruction)))
   ("i" "RIP (Instruction Pointer)" (lambda () (interactive) (insert "%rip") (finish-instruction))
    :description "RIP - НАСТОЯЩЕЕ - КОРОЛЕВСКАЯ ЗВЕЗДА РЕГУЛ"
    :face 'red-for-asm)
   ("u" "RSP" (lambda () (interactive) (insert "%rsp") (finish-instruction))
    :description "RSP - БУДУЩЕЕ В ВЕЛИКОМ КУБЕ - КОРОЛЕВСКАЯ ЗВЕЗДА АЛЬДЕБАРАН"
    :face 'blue-for-asm)
   ("d" "RDX (Data Register)" (lambda () (interactive) (insert "%rdx") (finish-instruction)))
   ("p" "(RAX)" (lambda () (interactive) (insert "(%rax)") (finish-instruction)))
   ("b" "(RBX)" (lambda () (interactive) (insert "(%rbx)") (finish-instruction)))
   ("c" "(RCX)" (lambda () (interactive) (insert "(%rcx)") (finish-instruction)))
   ("m" "(RDX)" (lambda () (interactive) (insert "(%rdx)") (finish-instruction)))
   ("0" "ТВОЙ ВАРИАНТ" (lambda () 
                         (interactive)
                         (let ((user-input (read-string (propertize "что напишем? " 'face '(:foreground "orange" :weight bold)))))
                           (insert (format "%s" user-input)))
                         (finish-instruction))
    :description "Твой вариант..."
    :face 'light-gray-for-asm)
   ]
  ["Подсекции RAX"
   ("-a" "EAX (32-битный)" (lambda () (interactive) (insert "%eax") (finish-instruction)))
   ("-b" "AH (8-битный)" (lambda () (interactive) (insert "%ah") (finish-instruction)))
   ("-c" "AL (8-битный)" (lambda () (interactive) (insert "%al") (finish-instruction)))
   ("-d" "(EAX)" (lambda () (interactive) (insert "(%eax)") (finish-instruction)))
   ]
  ["Подсекции RBX"
   ("-x" "EBX (32-битный)" (lambda () (interactive) (insert "%ebx") (finish-instruction)))
   ("-y" "BH (8-битный)" (lambda () (interactive) (insert "%bh") (finish-instruction)))
   ("-z" "BL (8-битный)" (lambda () (interactive) (insert "%bl") (finish-instruction)))
   ("-k" "(EBX)" (lambda () (interactive) (insert "(%ebx)") (finish-instruction)))
   ]
  ["Подсекции RCX"
   ("-r" "ECX (32-битный)" (lambda () (interactive) (insert "%ecx") (finish-instruction)))
   ("-t" "CH (8-битный)" (lambda () (interactive) (insert "%ch") (finish-instruction)))
   ("-u" "CL (8-битный)" (lambda () (interactive) (insert "%cl") (finish-instruction)))
   ("-j" "(ECX)" (lambda () (interactive) (insert "(%ecx)") (finish-instruction)))
   ]
  ["Подсекции RDX"
   ("-g" "EDX (32-битный)" (lambda () (interactive) (insert "%edx") (finish-instruction)))
   ("-v" "DH (8-битный)" (lambda () (interactive) (insert "%dh") (finish-instruction)))
   ("-f" "DL (8-битный)" (lambda () (interactive) (insert "%dl") (finish-instruction)))
   ("-m" "(EDX)" (lambda () (interactive) (insert "(%edx)") (finish-instruction)))
   ]
  ["Опции"
   ("-q" "Выход" transient-quit-one)])

(defun finish-instruction ()
  (insert "\n")
  ;;;;;завершение текущего транзита
  (transient-quit-one))

(global-set-key (kbd "C-c t") 'magic-asm-transient)

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
