(define my_append (lambda lst
    (define (append_two l1 l2)
      (if (null? l1)
          l2
          (cons (car l1) (append_two (cdr l1) l2))))                 
    (define (help_append new_ls)
        (if (null? new_ls) '()
            (append_two (car new_ls) (help_append (cdr new_ls)))))
                    (help_append lst)
                    )
  )

(my_append '(1 2) '(3 4))
(my_append '(1 2) '(3 4) '(5 6 7))
(my_append '(1 2))
(my_append)
(my_append '(1 2) '(3 4) '(5 6 7) '(1 2 3 4 5 6 7))