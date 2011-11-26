(define (pair_switcher lst)
    (if (or (null? lst) (null? (cdr lst)))
        lst
        (cons (cadr lst) (cons (car lst) (pair_switcher (cdr (cdr lst)))))))


(pair_switcher '(1 2 3 4 5))          
(pair_switcher '(1 2 3 4 5 6))
(pair_switcher '())
(pair_switcher '(1))
                  