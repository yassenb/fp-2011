;f-n: 44583, Ivan Borisov Ivanov, grupa: 2,
(define (myAppend L1 L2)
  (if (null? L1) L2
      (cons (car L1) (myAppend (cdr L1) L2))))
(define (myFlatten L)
  (cond ((null? L) '())
        ((list? (car L)) (myAppend (myFlatten (car L)) (myFlatten (cdr L))))
        (else (cons (car L) (myFlatten (cdr L))))))