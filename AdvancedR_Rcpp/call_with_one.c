#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
ROject callWithOne(Function f) {
  return f(1);
}
