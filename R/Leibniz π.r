#' pi
#'
#' Generates Pi to varying precision. Default iterations is 10e6.
#' @param pi A Liebniz approximation of pi
#' @return value of Pi to varying precision
#' @examples
#' pi <- pi(digits=50);
#' @export

# Using a variable input would be faster to find the decimals of pi for small number of digits
pi <- function(precision=10e8, digits=2000) {
  precision_bits <- ceiling(precision / log2(10))

  sum <- mpfr(0, precision_bits)
  for (i in 0:precision) {
    sum <- sum + mpfr((-1)^i, precision_bits) / mpfr((2*i+1), precision_bits)
  }
  return( mpfr(4*sum, digits))
}
