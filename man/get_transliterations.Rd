% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_transliterations.R
\name{get_transliterations}
\alias{get_transliterations}
\title{Obtain table of transliterations}
\usage{
get_transliterations(
  language = c("armenian", "հայերէն", "հայերեն", "hayeren", "hy",
    "bulgarian", "български език", "bǎlgarski ezik", "bg", "czech",
    "čeština", "český jazyk", "cs", "danish", "dansk", "da", "french", "français",
    "fr", "georgian", "kartuli", "ქართული", "ka", "german", "deutsch",
    "deutsche Sprache", "de", "greek", "ελληνικά", "el", "hungarian", "magyar",
    "hu", "norwegian", "norsk", "no", "polish", "język polski", "pl", "romanian",
    "limba română", "ro", "russian",      "русский язык", "ru", "slovene",
    "slovenian", "slovenski jezik", "slovenščina", "sl", "all")
)
}
\arguments{
\item{language}{the name of the source language for the text to be processed.}
}
\description{
This function returns a data frame with transliterations for a
specific language, or, a large default set of transliterations that is
language agnostic. The function is primarily called by the 'unidecode()'
function.
}
