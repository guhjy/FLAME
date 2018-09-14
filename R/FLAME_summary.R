#' Summary
#'
#' \code{FLAME_summary} provides brief summary of FLAME implementation.
#'
#' @param FLAME_object object returned by applying the FLAME algorithm
#'   (\code{\link{FLAME_bit}}, \code{\link{FLAME_PostgreSQL}}, or
#'   \code{\link{FLAME_SQLite}})
#' @return (1) Number of units matched (2) Average treatment effect
#' (3) Summary of conditional average treatment effect (CATE) in boxplot
#' @export

FLAME_summary <- function(FLAME_object) {

  #number of matched units
  print(paste("Number of units matched = ", sum(result_bit[[4]]['matched'] >= 1)))

  # ATE
  df <- do.call(rbind,lapply(FLAME_object[[2]],simp))

  effect <- df[,which(colnames(df) == "effect")]
  size <- df[,which(colnames(df) == "size")]

  print(paste("Average treatment effect = ", sum(effect * size)/sum(size)))

  # CATE summary plot
  boxplot(effect, main = paste("CATE summary with", toString(sum(size)), "matched units",sep = " "),
                               ylab = "CATE" )

}
