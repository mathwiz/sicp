;; Run racket command line racket -f filetest.rkt -i
(define (filetest) (printf "This is the side effect of the function filetest\n") 0)
(printf "Loaded filetest.rkt for interactive use. Type (filetest) to see a function.\n")
(printf "Also try (= (filetest) 0)\n")
(printf "Note that the file does not start with #lang racket.\n")