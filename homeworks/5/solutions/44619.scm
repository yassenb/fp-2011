(define (append1 sp1 sp2)
  (if(null? sp1) sp2
     (cons (car sp1) (append1 (cdr sp1) sp2))))

(define (flatten msp)
  (if(null? msp) ()
      (if(list? (car msp)) (append1 (flatten (car msp)) (flatten (cdr msp)))
         (cons (car msp) (flatten (cdr msp))))))

