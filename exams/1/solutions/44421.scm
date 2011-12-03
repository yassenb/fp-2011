(define (merge S V)
  (define (mergeList L1 L2)
    (append L1 (filter (lambda (x) (not (memq x L1))) L2)))
  
  (define (dictMember x D)
      (cond ((null? D) #f)
        ((equal? x (caar D)) D)
        (else (dictMember x (cdr D)))))

  (define (dictMemq x D)
  (cond ((null? D) #f)
        ((eq? x (caar D)) D)
        (else (dictMemq x (cdr D)))))
  
  (append S (filter (lambda (x) (not (dictMember x S))) V))
  )
