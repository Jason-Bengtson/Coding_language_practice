;Setting test cases to variables
(setq pa2 '(a b b a))
(setq pa3 '(a b c b a))
(setq pa4 '(a b c))
(setq pa5 '(a (d e) b (d e) a))
(setq pa6 '(a (d e) b (e d) a))

;function for recursively breaking down and checking
(defun palindrome(s num)
	 
;  		(format t "~%~d s" s)

		(setq s1 (car s))
;		(format t "~%~d s1" s1)
;		(terpri)

	        (setq s2 (car (reverse s)))
;		(format t "~%~d s2" s2)
;		(terpri)
	
		(setq s3 (cdr s))
		(setq s4 (cdr (reverse s3)))


;		(format t "~%~d  s4" s4)
;		(terpri)

		(if (not (equal s1 s2))
		  (format t "~%~d nil" num))
		  (terpri)

		(if (equal s1 s2)
		  (format t "~%~d t" num))
     	
		


; 	This is where Im trying to check if the s4 list is empty
;	Below the conditional is how im planning to then instigate
;	The recursion. Note that s4 is the list I wish to pass to 
;	The next call, while s1 and s2 are my first and last variables
;	And Palindrome is the name of the function 
;

		(cond
		  ;((null s4) 0)
		  ((null s4) format t "t")
		  ;((list s4) 1)
		  ((list s4) palindrome s4)
		  )


		;(if ((equal s1 s2) && (not nil))
		 ; (palindrome s4 'iter))

		)
	   
	;calling all palindrome test cases
(palindrome pa2 '1)
(palindrome pa3 '2)
(palindrome pa4 '3)
(palindrome pa5 '4)
(palindrome pa6 '5)
	      
