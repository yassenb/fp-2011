(define (f pred1? pred2? op)
  (define (result x)
    ( cond ((eq? op 'and) (and (pred1? x) (pred2? x)))
           ((eq? op 'or)  (or (pred1? x) (pred2? x)))))
          
        result)
