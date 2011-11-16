(define (swap_two_two sp) 
  (cond((null? sp) ())
       ((null? (cdr sp))  sp) 
       (else (cons (car(cdr sp))  (cons (car sp) (swap_two_two (cdr (cdr sp))))))))

(define (concatenate sp1 sp2)
  (if(null? sp1) sp2
     (cons (car sp1) (concatenate (cdr sp1) sp2))))