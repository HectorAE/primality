;; Functions to check the primality of a number
;; Coded by Hector Escobedo

;; Initial list of primes
(define primes
  '(2 3 5 7 11))

;; Function to check if a number is evenly divisible by any of a list
(define (isdiv n l)
  (map (lambda (x) (if (zero? (remainder n x)) #t #f)) l))

;; Function to check if a list contains an instance of some value
(define (any b l)
  (cond ((null? l) #f)
        ((equal? b (car l)) #t)
        (else (any b (cdr l)))))

;; Function to check if a list contains no instances of some value
(define (none b l)
  (cond ((null? l) #t)
        ((equal? b (car l)) #f)
        (else (none b (cdr l)))))

;; Function to evaluate whether a given number is prime
;; Note that as currently implemented, any large numbers with lowest
;; prime factors not in the primes list will appear prime.
(define (checkprime n)
  (cond ((<= n 1) #f) ; Preliminary conditions
        ((not (integer? n)) #f)
        ;((inexact? n) #f)
        ((any n primes) #t)
        (else (not (any #t (isdiv n primes))))))
