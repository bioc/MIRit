% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/topological-integration.R
\name{preparePathways}
\alias{preparePathways}
\title{Prepare miRNA-augmented pathways for integrative miRNA-mRNA pathway analyses}
\usage{
preparePathways(
  mirnaObj,
  database = "KEGG",
  organism = "Homo sapiens",
  minPc = 10,
  size = NULL,
  BPPARAM = bpparam()
)
}
\arguments{
\item{mirnaObj}{A \code{\link[=MirnaExperiment-class]{MirnaExperiment}} object
containing miRNA and gene data}

\item{database}{The name of the database to use. It must be one of: \code{KEGG},
\code{Reactome}, and \code{WikiPathways}. Default is \code{KEGG}}

\item{organism}{The name of the organism under consideration. The different
databases have different supported organisms. To see the list of supported
organisms for a given database, use the \code{\link[=supportedOrganisms]{supportedOrganisms()}} function.
Default specie is \verb{Homo sapiens}}

\item{minPc}{The minimum percentage of measured features that a pathway must
have for being considered in the analysis. Default is 10. See the \emph{details}
section for additional information}

\item{size}{An optional numeric vector of length 2, containing the minimum
and maximum number of nodes for each pathway. For example, if
\code{size = c(10, 150)}, all the pathways with less than 10 nodes and those with
more than 150 nodes will be discarded. Default is NULL to keep all pathways}

\item{BPPARAM}{The desired parallel computing behavior. This parameter
defaults to \code{BiocParallel::bpparam()}, but this can be edited. See
\code{\link[BiocParallel:register]{BiocParallel::bpparam()}} for information on parallel computing in R}
}
\value{
A \code{list} object containing the miRNA-augmented pathways as \code{graphNEL}
objects.
}
\description{
This function takes influential miRNA-mRNA interactions, identified by the
\code{\link[=mirnaIntegration]{mirnaIntegration()}} function, and adds them to biological pathways
retrieved from a pathway database such as \code{KEGG}, \code{WikiPathways} and
\code{Reactome}. The pathways returned from this function are needed to perform
a topologically-aware integrative pathway analysis (TAIPA) through the
\code{\link[=topologicalAnalysis]{topologicalAnalysis()}} function.
}
\details{
To create augmented pathways, this function uses the \code{graphite} R package
to download biological networks from the above mentioned databases. Then,
each pathway is converted to a \code{graph} object, and significant miRNA-mRNA
interactions are added to the network. Further, edge weights are added
according to interaction type.

At this point, biological pathways with few nodes measured are excluded
from this analysis. This is required because, during differential expression
analysis, lowly expressed features are removed. Therefore, some pathways
might result significantly affected even if only 1\% of nodes is perturbed.
The default behavior is to exclude pathways with less than 10\% of
representation (\code{minPc = 10}).

Finally, this function performs a breadth-first search (BFS) algorithm to
topologically sort pathway nodes so that each individual node occurs after
all its upstream nodes. Nodes within cycles are considered leaf nodes.

Information about pathway coverage, i.e. the percentage of nodes with
expression measurments, edge weights, topological sorting order, and the
parameters used to create the networks are all stored in the \code{graphData}
slot of each \code{graphNEL} object.
}
\examples{

\donttest{
# load example MirnaExperiment object
obj <- loadExamples()

# perform integration analysis with default settings
obj <- mirnaIntegration(obj)

# retrieve pathways from KEGG and augment them with miRNA-gene interactions
paths <- preparePathways(obj)

# perform the integrative pathway analysis with 1000 permutations
ipa <- topologicalAnalysis(obj, paths, nPerm = 1000)

# access the results of pathway analysis
integratedPathways(ipa)

# create a dotplot of integrated pathways
integrationDotplot(ipa)

# explore a specific biological network
visualizeNetwork(ipa, "Thyroid hormone synthesis")
}

}
\references{
Sales, G., Calura, E., Cavalieri, D. et al. graphite - a Bioconductor
package to convert pathway topology to gene network.
BMC Bioinformatics 13, 20 (2012),
\url{https://doi.org/10.1186/1471-2105-13-20}.
}
\author{
Jacopo Ronchi, \email{jacopo.ronchi@unimib.it}
}
