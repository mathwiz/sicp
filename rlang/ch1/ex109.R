inc <- function(x) { x + 1 }

dec <- function(x) { x - 1 }

plusRec <- function(a, b) { ifelse(a==0, b, inc(plusRec(dec(a), b))) }

plusIt <- function(a, b) { ifelse(a==0, b, plusIt(dec(a), inc(b))) }

