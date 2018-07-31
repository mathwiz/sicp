pickLanguage <-
function() {
    languages <- c("Clojure","Erlang","Haskell","Java","JavaScript","Julia","Lisp","Perl","Python","Racket","R","Ruby","Scala","Smalltalk")
    languages[sample(1:(length(languages)),1)]
}
