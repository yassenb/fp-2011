(define( merge f g)
  (define(llist '())
  (if(( = (car f) (car g)))
       (apppend llist (car f))
       (append (append llist (car f)) (car g))
       )
     (if  (not(= (car f) (car(cdr g)))) (apppend1 (append1 llist (car(cdr g))) (car f)) ((append1 llist (car f) )))
     (if(not(= (car f) (car (cdr(cdr g))))) (append1 (append1 llist (car (cdr(cdr g)))) (car f)) (car f))
     (if(not(=(car f) (cdr(cdr(cdr g))))) (append1 (append1 llist (cdr(cdr(cdr g)))) (car f)) (append1 llist (car f)))
     (if(not(=(car (cdr f)) car g)) (append1 llist (car (cdr f)) (car g)) (append1 llist (car(cdr f))))
     (if(not(= (car (cdr f)) (car (cdr f)))) (append1 (append1 llist (car(cdr f))) (car(cdr f))) (append1 llist (car (cdr f))))
            