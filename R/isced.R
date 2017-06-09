#' Create fake ISCED-F 2013 keywords
#'
#' ISCED Fields 2013 (ISCED-F 2013): International Standard Classification of Education - Fields of Education and Training
#'
#' @export
#' @template params
#' @param locale (character) the locale to use. options: en_US (default),
#' fr_FR, nl_NL.
#' @examples
#' ch_isced()
#' ch_isced(10)
#' ch_isced(500)
#'
#' ch_isced(locale = "fr_FR", n = 10)
#' ch_isced(locale = "nl_NL", n = 10)
ch_isced <- function(n = 1, locale = NULL) {
  assert(n, c('integer', 'numeric'))
  if (n == 1) {
    ISCEDProvider$new(locale = locale)$render()
  } else {
    x <- ISCEDProvider$new(locale = locale)
    replicate(n, x$render())
  }
}
