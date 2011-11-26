(define subs (list '(0 1 "sub1") '(1 2 "sub2") '(2 3 "sub3")  '(3 4 "sub4")))
; shifts position
(define (shift_position lst shift_value)
  (map (lambda (x) (cons (+ (car x) shift_value) (cons (+ (cadr x) shift_value) (cons (car (cddr x)) '() )))) lst))

(shift_position subs 10)
(shift_position subs -10)
(newline)

(define (calc cadre_in_sec cadre_count)
  (define (help begin end)
    (if (> end cadre_count)
        '()
        (cons (list begin end) (help (+ end 1) (+ ( + 1 end) cadre_in_sec)))))
  (help 0 cadre_in_sec)
  )
; (0 4) 4-броя кадри в секунда
; 24 желания брой кадри
(calc 4 24) ; ((0 4) (5 9) (10 14) (15 19) (20 24))
(newline)
; remove bad words
(define subs1 (list '(0 1 "bad_word1") '(1 2 "sub2 is ok") '(2 3 "bad_word2")  '(3 4 "sub 4 is ok") '(5 6 "sub 5 is ok") '(7 8 "bad_word1") '(9 10 "bad_word3")))
(define bad_words (list "bad_word1" "bad_word2" "bad_word3"))
(define (cens_remover lst sub)
  (define (help res rs)
    (if (null? rs) 
        res
        (help (map (lambda (x) (cons (car x) (cons (cadr x) (cons (if (string-ci=? (caddr x) (car rs)) "" (caddr x)) '() )))) res) (cdr rs))
        ))
  (help sub lst)
  )
  
(cens_remover bad_words subs1)
 
 
   