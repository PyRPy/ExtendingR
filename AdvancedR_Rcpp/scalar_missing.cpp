#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
List scalar_missing() {
  int int_s = NA_INTEGER;
  String chr_s = NA_STRING;
  bool lgl_s = NA_LOGICAL;
  double num_s = NA_REAL;
  
  return List::create(int_s, chr_s, lgl_s, num_s);
}

/*** R
str(scalar_missing())
*/
