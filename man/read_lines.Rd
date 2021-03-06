% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/read_lines.R
\name{read_lines}
\alias{read_lines}
\title{Read lines from a file or string.}
\usage{
read_lines(file, n_max = -1L, progress = interactive())
}
\arguments{
\item{file}{Either a path to a file, a connection, or literal data
   (either a single string or a raw vector).

   Files ending in \code{.gz}, \code{.bz2}, \code{.xz}, or \code{.zip} will
   be automatically uncompressed. Files starting with \code{http://},
   \code{https://}, \code{ftp://}, or \code{ftps://} will be automatically
   downloaded.

   Literal data is most useful for examples and tests. It must contain at
   least one new line to be recognised as data (instead of a path).}

\item{n_max}{Number of lines to read. If \code{n} is -1, all lines in
file will be read.}

\item{progress}{Display a progress bar? By default it will only display
in an interactive session. The display is updated every 50,000 values
and will only display if estimated reading time is 5 seconds or more.}
}
\value{
A character vector with one element for each line.
}
\description{
Read lines from a file or string.
}
\examples{
read_lines(system.file("extdata/mtcars.csv", package = "readr"))
read_lines("1\\n\\n2")
read_lines("\\n")
}

