(define (myappend l1 l2)
  (if (null? l1) l2
      (cons (car l1) (myappend (cdr l1) l2)))
      )

