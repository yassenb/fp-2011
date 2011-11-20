; #lang racket
(define (my.foldr op null l)
  (if (eq? l '())
      null
      (op (car l) (my.foldr op null (cdr l)))
   )
  )

(define (my.foldl op null l)
  (define (reverse p n) ;p[revious] and n[ext]
    (if (eq? n '())
       p
       (reverse (cons (car n) p) (cdr n))
    )
  )
  (my.foldr (lambda (x y) (op y x)) null (reverse '() l))
)


(define (flatten l)
  (define (_flatten res.so.far l)
    (cond
      ((eq? l '()) res.so.far)
      ((not (pair? l)) (cons l res.so.far))
      (else (_flatten (_flatten res.so.far (cdr l)) (car l)))
      )
    )
  (_flatten '() l)
)

(define (my.append l)
  (flatten l)
)

(flatten '((2) (()) (3 (4) 5) (6 7) (8 (9 (10)))))
