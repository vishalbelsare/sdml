#' Gaussian Kernel Computation for
#' Kernel Local Fisher Discriminant Analysis
#'
#' Gaussian kernel computation for klfda.
#' 
#' Put kmatrixGauss function details here.
#' 
#' @param x n x d matrix of original samples.
#'          n is the number of samples.
#' @param sigma dimensionality of reduced space. (default: 0.001)
#' 
#' @return K n x n kernel matrix.
#'           n is the number of samples.
#' 
#' @keywords klfda kernel local fisher discriminant
#'           transformation mahalanobis metric
#'
#' @aliases kmatrixGauss
#' 
#' @note Put some note here.
#' 
#' @author Nan Xiao <\url{https://nanx.me}>
#' 
#' @seealso See \code{klfda} for the computation of
#'          kernel local fisher discriminant analysis
#' 
#' @export kmatrixGauss
#' 
#' @references
#' Sugiyama, M (2007).
#' Dimensionality reduction of multimodal labeled data by
#' local Fisher discriminant analysis.
#' \emph{Journal of Machine Learning Research}, vol.\bold{8}, 1027--1061.
#' 
#' Sugiyama, M (2006).
#' Local Fisher discriminant analysis for supervised dimensionality reduction.
#' In W. W. Cohen and A. Moore (Eds.), \emph{Proceedings of 23rd International
#' Conference on Machine Learning (ICML2006)}, 905--912.
#' 
#' @examples
#' NULL

kmatrixGauss <- function(x, sigma = 1) {
	x = t(as.matrix(x))
	d = nrow(x)
	n = ncol(x)
	X2 = t(as.matrix(colSums(x^2)))
	distance2 = repmat(X2, n, 1) + repmat(t(X2), 1, n) - 2 * t(x) %*% x
	K = exp(-distance2/(2 * sigma^2)) # To be tested
	return(K)
}

