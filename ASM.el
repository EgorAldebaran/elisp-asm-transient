;;;; тут короче путаница вышла по имени sourcer-наоборот destination
(transient-define-prefix magic-asm-transient ()
  "Магическая команда АСМА"
  ["Магическая команда АСМА"
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
   ]
  ["Опции"
   ("-q" "Выход" transient-quit-one)])

(transient-define-prefix register-destination-transient ()
  "Регистр, куда отправляются данные"
  ["Регистр, втягивающий Свет Информации"
   ("a" "Твое конкретное Значение" (lambda () (interactive) (insert (format "$%s, " (read-string "?$ "))) (register-sourcer-transient)))
   ("j" "RAX (Accumulator)" (lambda () (interactive) (insert "%rax, ") (register-sourcer-transient)))
   ("h" "RBX (Base Register)" (lambda () (interactive) (insert "%rbx, ") (register-sourcer-transient)))
   ("n" "RCX (Counter Register)" (lambda () (interactive) (insert "%rcx, ") (register-sourcer-transient)))
   ("i" "RIP (Instruction Pointer)" (lambda () (interactive) (insert "%rip, ") (register-sourcer-transient)))
   ("d" "RDX (Data Register)" (lambda () (interactive) (insert "%rdx, ") (register-sourcer-transient)))
   ]
  ["Подсекции RAX"
   ("-a" "EAX (32-битный)" (lambda () (interactive) (insert "%eax, ") (register-sourcer-transient)))
   ("-b" "AH (8-битный)" (lambda () (interactive) (insert "%ah, ") (register-sourcer-transient)))
   ("-c" "AL (8-битный)" (lambda () (interactive) (insert "%al, ") (register-sourcer-transient)))
   ]
  ["Подсекции RBX"
   ("-x" "EBX (32-битный)" (lambda () (interactive) (insert "%ebx, ") (register-sourcer-transient)))
   ("-y" "BH (8-битный)" (lambda () (interactive) (insert "%bh, ") (register-sourcer-transient)))
   ("-z" "BL (8-битный)" (lambda () (interactive) (insert "%bl, ") (register-sourcer-transient)))
   ]
  ["Подсекции RCX"
   ("-r" "ECX (32-битный)" (lambda () (interactive) (insert "%ecx, ") (register-sourcer-transient)))
   ("-t" "CH (8-битный)" (lambda () (interactive) (insert "%ch, ") (register-sourcer-transient)))
   ("-u" "CL (8-битный)" (lambda () (interactive) (insert "%cl, ") (register-sourcer-transient)))
   ]
  ["Подсекции RDX"
   ("-g" "EDX (32-битный)" (lambda () (interactive) (insert "%edx, ") (register-sourcer-transient)))
   ("-v" "DH (8-битный)" (lambda () (interactive) (insert "%dh, ") (register-sourcer-transient)))
   ("-f" "DL (8-битный)" (lambda () (interactive) (insert "%dl, ") (register-sourcer-transient)))
   ]
  ["Опции"
   ("-q" "Выход" transient-quit-one)])

(transient-define-prefix register-sourcer-transient ()
  "Регистр - источник света"
  ["Регистр - источник Света Информации"
   ("a" "Твое конкретное значение" (lambda () (interactive) (insert (format "$%s" (read-string))) (finish-instruction)))
   ("j" "RAX (Accumulator)" (lambda () (interactive) (insert "%rax") (finish-instruction)))
   ("h" "RBX (Base Register)" (lambda () (interactive) (insert "%rbx") (finish-instruction)))
   ("n" "RCX (Counter Register)" (lambda () (interactive) (insert "%rcx") (finish-instruction)))
   ("i" "RIP (Instruction Pointer)" (lambda () (interactive) (insert "%rip") (finish-instruction)))
   ("d" "RDX (Data Register)" (lambda () (interactive) (insert "%rdx") (finish-instruction)))
   ]
  ["Подсекции RAX"
   ("-a" "EAX (32-битный)" (lambda () (interactive) (insert "%eax") (finish-instruction)))
   ("-b" "AH (8-битный)" (lambda () (interactive) (insert "%ah") (finish-instruction)))
   ("-c" "AL (8-битный)" (lambda () (interactive) (insert "%al") (finish-instruction)))
   ]
  ["Подсекции RBX"
   ("-x" "EBX (32-битный)" (lambda () (interactive) (insert "%ebx") (finish-instruction)))
   ("-y" "BH (8-битный)" (lambda () (interactive) (insert "%bh") (finish-instruction)))
   ("-z" "BL (8-битный)" (lambda () (interactive) (insert "%bl") (finish-instruction)))
   ]
  ["Подсекции RCX"
   ("-r" "ECX (32-битный)" (lambda () (interactive) (insert "%ecx") (finish-instruction)))
   ("-t" "CH (8-битный)" (lambda () (interactive) (insert "%ch") (finish-instruction)))
   ("-u" "CL (8-битный)" (lambda () (interactive) (insert "%cl") (finish-instruction)))
   ]
  ["Подсекции RDX"
   ("-g" "EDX (32-битный)" (lambda () (interactive) (insert "%edx") (finish-instruction)))
   ("-v" "DH (8-битный)" (lambda () (interactive) (insert "%dh") (finish-instruction)))
   ("-f" "DL (8-битный)" (lambda () (interactive) (insert "%dl") (finish-instruction)))
   ]
  ["Опции"
   ("-q" "Выход" transient-quit-one)])

(defun finish-instruction ()
  (insert "\n")  ; Завершаем строку новой строкой
  (transient-quit-one))  ; Завершаем текущий транзит

(global-set-key (kbd "C-c t") 'magic-asm-transient)


(set-face-attribute 'default nil :height 200)

(set-face-attribute 'transient-value nil :height 140)
