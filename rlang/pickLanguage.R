pickLanguage <-
function() {
    languages <- c("Clojure","Elixir","Erlang","Haskell","Java","JavaScript","Julia","Lisp","Octave","Perl","Python","Racket","R","Ruby","Scala","Smalltalk")
    languages[sample(1:(length(languages)),1)]
}
