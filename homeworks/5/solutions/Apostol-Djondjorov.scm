(define (append1 a b)
    (if (null? a) b (cons (car a)  (append1 (cdr a)  b) )
  )
 )

(define llready '())
(define (fl ll)
    (if(list? (car ll)) (fl (car ll))
         (append1 llready (car ll))        
    ) 
    (if (eq? (cdr ll) '()) llready
        (fl (cdr ll))
    )
  )
