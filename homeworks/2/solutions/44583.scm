(define (rev l)
	(cond
		( (null? l) '() )
		( (null? (cdr l)) l)
		(else (cons (rev (cdr l)) (car l)))
	)
)