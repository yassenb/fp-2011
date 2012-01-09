;; Zad 1
(define (filter pred? lst)
  (apply append (map (lambda (x) 
         (if (pred? x)
             (list x)
             '()))
       lst)))
 

;; Zad 2
 
(define (removeAll elem L)
  (cond ((null? L) L)
        ((equal? elem (car L)) (removeAll elem (cdr L)))
        (else (cons (car L) (removeAll elem (cdr L))))))

(define (permute L)
  (if (= (length L) 1)
      (list L)
      (apply append (map (lambda (x) (map (lambda (y) (cons x y)) (permute (removeAll x L)))) L))))

 
;; Zad 3
;; helpers
(define (makesub startframe endframe text)
  (cons startframe (cons endframe text)))

(define (startframe sub) (car sub))

(define (endframe sub) (cadr sub))

(define (subtext sub) (cddr sub))


;; shift subtitles
(define (shift sub frames) 
  (makesub (+ (startframe sub) frames) (+ (endframe sub) frames) (subtext sub)))

;; recalculate fps for subtitles
(define (recalculate sub curfps fps)
  (makesub (round (* (/ (startframe sub) curfps) fps)) (round (* (/ (endframe sub) curfps) fps)) (subtext sub)))
          
