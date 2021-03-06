% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mutate_term_count.R
\name{mutate_term_count}
\alias{mutate_term_count}
\title{Apply Normalization to Term/Token Columns}
\usage{
mutate_term_count(x, fun = function(x) as.integer(x > 0))
}
\arguments{
\item{x}{A \code{term_count} object.}

\item{fun}{A function to apply column-wise.}

\item{\ldots}{ignored.}
}
\value{
Returns a \code{term_count} object.
}
\description{
Apply normalization to a term count columns of \code{termco} object without
stripping the class & attributes of the object.
}
\examples{
\dontrun{
library(dplyr)

term_list <- list(
    `if` = c('if'),
    ans = c('an'),
    or = c('or'),
    buts = c('but')
)

out <- presidential_debates_2012 \%>\%
     with(term_count(dialogue, TRUE, term_list))

out

## default one-hot encoding
out \%>\%
    mutate_term_count()

## min-max scaling
out \%>\%
    mutate_term_count(function(x) (x - min(x)) / ((max(x) - min(x))))

## token counts
token_list <- list(
    person = c('sam', 'i'),
    place = c('here', 'house'),
    thing = c('boat', 'fox', 'rain', 'mouse', 'box', 'eggs', 'ham'),
    no_like = c('not like')
)

out2 <- token_count(sam_i_am, grouping.var = TRUE, token.list = token_list)

## default one-hot encoding
out2 \%>\%
    mutate_term_count()

## min-max scaling
out2 \%>\%
    mutate_term_count(function(x) (x - min(x)) / ((max(x) - min(x))))

}
}
