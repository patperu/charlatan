#' ISCEDProvider
#'
#' @export
#' @keywords internal
#' @param locale (character) the locale to use. options: en_US (default),
#' fr_FR, nl_NL.
#' @details
#' \strong{Methods}
#'   \describe{
#'     \item{\code{render()}}{
#'       Make a ISCED keyword
#'     }
#'   }
#' @format NULL
#' @usage NULL
#' @examples
#' z <- ISCEDProvider$new()
#' z$render()
#'
#' z <- ISCEDProvider$new(locale = "fr_FR")
#' z$locale
#' z$render()
#'
#' z <- ISCEDProvider$new(locale = "nl_NL")
#' z$locale
#' z$render()
ISCEDProvider <- R6::R6Class(
  inherit = BaseProvider,
  'ISCEDProvider',
  public = list(
    locale = NULL,
    formats = NULL,

    initialize = function(locale = NULL) {
      if (!is.null(locale)) {
        # check locale globally supported
        super$check_locale(locale)
        # check job provider locales
        check_locale_(tolower(locale), ISCED_provider_locales)
        self$locale <- locale
      } else {
        self$locale <- 'en_US'
      }
      self$formats <- parse_eval("isced_narrow_field_", self$locale)
    },

    render = function() {
      super$random_element(self$formats)
    }
  )
)

#' @export
#' @rdname ISCEDProvider
ISCED_provider_locales <- c(
  "en_us", "fr_fr", "nl_nl"
)
