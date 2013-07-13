;; Functions to check the primality of a number
;; Coded by Hector Escobedo

;; The count procedure is in srfi-1
(use-modules (srfi srfi-1))

;; Initial list of primes
;; We could just reduce it to 2, but trivial is trivial
(define primes
  '(2 3 5 7 11))

;; Function to check if a number is evenly divisible by any of a list
(define (isdiv n l)
  (map (lambda (x) (if (zero? (remainder n x)) #t #f)) l))

;; Function that returns true if an element exists in a list
(define (any e l)
  (> (count (lambda (x) (equal? x e)) l) 0))

;; Function that returns true if an element isn't in a list
(define (none e l)
  (= (count (lambda (x) (equal? x e)) l) 0))

;; Function to evaluate whether a given number is prime
;; Note that as currently implemented, any large numbers with lowest
;; prime factors not in the primes list will appear prime.
(define (checkprime n pl)
  (cond ((<= n 1) #f) ; Preliminary conditions
        ((not (integer? n)) #f)
        ;((inexact? n) #f)
        ((any n pl) #t)
        (else (none #t (isdiv n pl)))))
