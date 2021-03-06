#' @name panPca
#' @title Principal component analysis of a pan-matrix
#' 
#' @description Computes a principal component decomposition of a pan-matrix, with possible
#' scaling and weightings.
#' 
#' @param pan.matrix A pan-matrix, see \code{\link{panMatrix}} for details.
#' @param scale An optional scale to control how copy numbers should affect the distances.
#' @param weights Vector of optional weights of gene clusters.
#' 
#' @details A principal component analysis (PCA) can be computed for any matrix, also a pan-matrix.
#' The principal components will in this case be linear combinations of the gene clusters. One major
#' idea behind PCA is to truncate the space, e.g. instead of considering the genomes as points in a
#' high-dimensional space spanned by all gene clusters, we look for a few \sQuote{smart} combinations
#' of the gene clusters, and visualize the genomes in a low-dimensional space spanned by these directions.
#' 
#' The \samp{scale} can be used to control how copy number differences play a role in the PCA. Usually
#' we assume that going from 0 to 1 copy of a gene is the big change of the genome, and going from 1 to
#' 2 (or more) copies is less. Prior to computing the PCA, the \samp{pan.matrix} is transformed according
#' to the following affine mapping: If the original value in \samp{pan.matrix} is \samp{x}, and \samp{x}
#' is not 0, then the transformed value is \samp{1 + (x-1)*scale}. Note that with \samp{scale=0.0}
#' (default) this will result in 1 regardless of how large \samp{x} was. In this case the PCA only
#' distinguish between presence and absence of gene clusters. If \samp{scale=1.0} the value \samp{x} is
#' left untransformed. In this case the difference between 1 copy and 2 copies is just as big as between
#' 1 copy and 0 copies. For any \samp{scale} between 0.0 and 1.0 the transformed value is shrunk towards
#' 1, but a certain effect of larger copy numbers is still present. In this way you can decide if the PCA
#' should be affected, and to what degree, by differences in copy numbers beyond 1.
#' 
#' The PCA may also up- or downweight some clusters compared to others. The vector \samp{weights} must
#' contain one value for each column in \samp{pan.matrix}. The default is to use flat weights, i.e. all
#' clusters count equal. See \code{\link{geneWeights}} for alternative weighting strategies.
#' 
#' @return A \code{list} with three tables:
#' 
#' \samp{Evar.tbl} has two columns, one listing the component number and one listing the relative 
#' explained variance for each component. The relative explained variance always sums to 1.0 over
#' all components. This value indicates the importance of each component, and it is always in
#' descending order, the first component being the most important.
#' This is typically the first result you look at after a PCA has been computed, as it indicates
#' how many components (directions) you need to capture the bulk of the total variation in the data.
#' 
#' \samp{Scores.tbl} has a column listing the \samp{GID.tag} for each genome, and then one column for each
#' principal component. The columns are ordered corresponding to the elements in \samp{Evar}. The
#' scores are the coordinates of each genome in the principal component space.
#' 
#' \samp{Loadings.tbl} is similar to \samp{Scores.tbl} but contain values for each gene cluster
#' instead of each genome. The columns are ordered corresponding to the elements in \samp{Evar}.
#' The loadings are the contributions from each gene cluster to the principal component directions.
#' NOTE: Only gene clusters having a non-zero variance is used in a PCA. Gene clusters with the
#' same value for every genome have no impact and are discarded from the \samp{Loadings}.
#' 
#' @author Lars Snipen and Kristian Hovde Liland.
#' 
#' @seealso \code{\link{distManhattan}}, \code{\link{geneWeights}}.
#' 
#' @examples 
#' # Loading a pan-matrix in this package
#' data(xmpl.panmat)
#' 
#' # Computing panPca
#' ppca <- panPca(xmpl.panmat)
#' 
#' \dontrun{
#' # Plotting explained variance
#' library(ggplot2)
#' ggplot(ppca$Evar.tbl) +
#'   geom_col(aes(x = Component, y = Explained.variance))
#' # Plotting scores
#' ggplot(ppca$Scores.tbl) +
#'   geom_text(aes(x = PC1, y = PC2, label = GID.tag))
#' # Plotting loadings
#' ggplot(ppca$Loadings.tbl) +
#'   geom_text(aes(x = PC1, y = PC2, label = Cluster))
#' }
#' 
#' @importFrom tibble as_tibble tibble
#' 
#' @export panPca
#' 
panPca <- function(pan.matrix, scale = 0.0, weights = rep(1, ncol(pan.matrix))){
  if((scale > 1) | (scale < 0)){
    warning("scale should be between 0.0 and 1.0, using scale=0.0")
    scale <- 0.0
  }
  idx <- which(pan.matrix > 0, arr.ind = T)
  pan.matrix[idx] <- 1 + (pan.matrix[idx] - 1) * scale
  pan.matrix <- t(t(pan.matrix) * weights)
  X <- pan.matrix[,which(apply(pan.matrix, 2, sd) > 0)]
  pca <- prcomp(X)
  pca.lst <- list(Evar.tbl     = tibble(Component = 1:length(pca$sdev),
                                        Explained.variance = pca$sdev^2/sum(pca$sdev^2)),
                  Scores.tbl   = as_tibble(pca$x, rownames = "GID.tag"),
                  Loadings.tbl = as_tibble(pca$rotation, rownames = "Cluster"))
  return(pca.lst)
}

