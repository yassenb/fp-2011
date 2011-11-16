(define (func pred1? pred2? s)
  (if (eq? 'and s) (and pred1? pred2?)
      (or pred1? pred2?)))
