(define (filter pred? l)
  (if (null? l)
    l
    (let ((h (car l))
          (ft (filter pred? (cdr l))))
      (if (pred? h)
        (cons h ft)
        ft))))

(define (merge map1 map2)
  (define (key entry)
    (car entry))
  (define (value entry)
    (cdr entry))
  (define (keys some-map)
    (map key some-map))
  (append
    (map (lambda (entry)
           (let ((entry-in-map2
                   (or (assv (key entry) map2)
                       (list (key entry)))))
             (cons (key entry)
                   (append
                     (value entry)
                     (filter (lambda (v)
                               (not (memv v (value entry))))
                             (value entry-in-map2))))))
         map1)
    (filter (lambda (entry)
              (not (memv (key entry) (keys map1))))
            map2)))
