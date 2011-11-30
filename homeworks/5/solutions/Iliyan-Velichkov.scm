(define (myappend l1 l2)
  (if (null? l1) l2
      (cons (car l1) (myappend (cdr l1) l2)))
      )

(define (flatten ll)
  (cond ((null? ll) '())
        ((list? (car ll))  (append (flatten (car ll)) (flatten (cdr ll))))
        (else (cons (car ll) (flatten (cdr ll))))
        )
  )
