% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/term_count.R
\name{print.term_count}
\alias{print.term_count}
\title{Prints a term_count Object}
\usage{
\method{print}{term_count}(x, digits = 2, weight = "percent",
  zero.replace = "0", pretty = getOption("termco_pretty"), ...)
}
\arguments{
\item{x}{The term_count object.}

\item{digits}{The number of digits displayed.}

\item{weight}{The weight type.  Currently the following are available:
\code{"proportion"}, \code{"percent"}.  See \code{\link[termco]{weight}} for
additional information.}

\item{zero.replace}{The value to replace zero count elements with; defaults
to \code{"0"}.}

\item{pretty}{logical.  If \code{TRUE} the counts print in a pretty fashion,
combining count and weighted information into a single display.
\code{pretty} printing can be permanently removed with
\code{\link[termco]{as_count}}.}

\item{\ldots}{ignored}
}
\description{
Prints a term_count object.
}
