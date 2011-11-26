(define (filter1 pred? l)
  (define (helper pred? l1 l2)
    (cond ((null? l1) l2)
          ((pred? (car l1)) (helper pred? (cdr l1) (append l2 (list(car l1)))))
          (else (helper pred? (cdr l1) l2))))
  (helper pred? l '()))
(filter1 odd? '(1 2 3 4))

;================================================================================

(define (not_sw? a)
  (cond((equal? a 'fuck) #f)
       ((equal? a 'dick) #f)
       (else #t)))

(define (clear_list l)
  (filter not_sw? l))

(define (clear_subtitles l)
  (append (append (car l) (cadr l)) (clear_list(car(cdr(cdr l))))))

(define (dToi digits) 
  (let step ((digits digits) (n 0)) 
    (if (null? digits) 
    n 
    (step (cdr digits) (+ (* n 10) (car digits))))))
     
(define (add_offset l a)
  (define (helper l1 a l2)
    (if(null? (cdr l1))(append l2 (car l1))
       (helper (cdr l1) a (append l2 (list(+  a (dToi(car l1))))))))
  (helper l a '()))

(add_offset '((12)(23) (stupid fuck)) 5)
(clear_subtitles '((12) (23) (stupid fuck)))
