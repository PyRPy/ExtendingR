#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
std::map<double, int> tableC(NumericVector x) {
  std::map<double, int> counts;
  
  int n = x.size();
  for (int i = 0; i < n; i++) {
    counts[x[i]]++;
  }
  return counts;
}

/*** R
tableC(c(1, 2, 4, 5, 3, 2, 1, 5))
*/

