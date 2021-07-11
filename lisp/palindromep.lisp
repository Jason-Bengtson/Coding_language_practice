
; 	 our test lists hard cast to variables
(setq pa1 '(a b b a))
(setq pa2 '(a b c b a))
(setq pa3 '(a b c))
(setq pa4 '(a (d e) b (d e) a))
(setq pa5 '(a (d e) b (e d) a))

(defun palindrome(s)
; 	 conditional checking if anything in list
  	(cond 
	  ((null s) t)
	      ((equal (car s) (car (last s)))
;	 recursive call with outter variables eliminated
	       (palindrome (cdr (reverse (cdr s)))))
	      )
; 	 function returns t if palindrome or nil otherwise
  )


;	 print statments testing if palindromes or not for each test case 

(princ "____________________")
(terpri)
(princ "Now to begin testing")
(terpri)
(princ "--------------------")
(terpri)

; test for first set
(if (palindrome pa1)
  (format t "t"))


(if (not (palindrome pa1))
  (format t "nil"))
(terpri)

; test for second set
(if (palindrome pa2)
  (format t "t"))


(if (not (palindrome pa2))
  (format t "nil"))
(terpri)

; test for third set
(if (palindrome pa3)
  (format t "t"))


(if (not (palindrome pa3))
  (format t "nil"))
(terpri)

;test for fourth set
(if (palindrome pa4)
  (format t "t"))


(if (not (palindrome pa4))
  (format t "nil"))
(terpri)

; test for fifth set
(if (palindrome pa5)
  (format t "t"))


(if (not (palindrome pa5))
  (format t "nil"))
(terpri)

(princ "____________________")
(terpri)
(princ "And thats all folks!")
(terpri)
(princ "--------------------")
(terpri)
