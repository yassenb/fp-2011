(define (member1 s list)
  (if(null? list) #f
     (if(eq? s (car (car list))) (cdr ( car list))  
     (member1 s (cdr list)))))

(define (member2 s list)
  (if(null? list) #f
    (if(eq? s (car list)) #t
     (member2 s (cdr list)))))     
     

(define (app list1 list2 )
  (if(null? list1) list2
     (if(not (member2 (car list1) list2)) (cons (car list1) (app (cdr list1) list2)))))


(define (merge list1 list2)
  (if(member1 (car (car list1)) list2) (cons (cons  (car (car list1)) (app (cdr (car list1))  