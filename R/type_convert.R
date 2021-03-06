#' Re-convert character columns in existing data frame.
#'
#' This is useful if you need to do some manual munging - you can read the
#' columns in as character, clean it up with (e.g.) regular expressions and
#' then let readr take another stab at parsing it.
#'
#' @param df A data frame.
#' @inheritParams col_types_standardise
#' @inheritParams tokenizer_delim
#' @export
#' @examples
#' df <- data.frame(
#'   x = as.character(runif(10)),
#'   y = as.character(sample(10)),
#'   stringsAsFactors = FALSE
#' )
#' str(df)
#' str(type_convert(df))
#'
#' df <- data.frame(x = c("NA", "10"), stringsAsFactors = FALSE)
#' str(type_convert(df))
type_convert <- function(df, col_types = NULL, na = c("", "NA"), trim_ws = TRUE) {
  is_character <- vapply(df, is.character, logical(1))

  char_cols <- df[is_character]
  guesses <- lapply(char_cols, function(x) {
    x[x %in% na] <- NA
    collectorGuess(x)
  })
  col_types <- col_types_standardise(col_types, names(char_cols), guesses)

  df[is_character] <- lapply(seq_along(char_cols), function(i) {
    type_convert_col(char_cols[[i]], col_types[[i]], which(is_character)[i],
      na = na, trim_ws = trim_ws)
  })

  df
}
