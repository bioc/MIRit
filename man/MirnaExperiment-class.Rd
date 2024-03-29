% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllClasses.R, R/show-methods.R
\docType{class}
\name{MirnaExperiment-class}
\alias{MirnaExperiment-class}
\alias{mirnaDE,MirnaExperiment-method}
\alias{geneDE,MirnaExperiment-method}
\alias{significantMirnas,MirnaExperiment-method}
\alias{significantGenes,MirnaExperiment-method}
\alias{pairedSamples,MirnaExperiment-method}
\alias{mirnaTargets,MirnaExperiment-method}
\alias{integration,MirnaExperiment-method}
\alias{show,MirnaExperiment-method}
\title{The 'MirnaExperiment' class}
\usage{
\S4method{mirnaDE}{MirnaExperiment}(object, onlySignificant = TRUE, param = FALSE, returnObject = FALSE)

\S4method{geneDE}{MirnaExperiment}(object, onlySignificant = TRUE, param = FALSE, returnObject = FALSE)

\S4method{significantMirnas}{MirnaExperiment}(object)

\S4method{significantGenes}{MirnaExperiment}(object)

\S4method{pairedSamples}{MirnaExperiment}(object)

\S4method{mirnaTargets}{MirnaExperiment}(object)

\S4method{integration}{MirnaExperiment}(object, param = FALSE)

\S4method{show}{MirnaExperiment}(object)
}
\arguments{
\item{object}{An object of class \code{\link[=MirnaExperiment-class]{MirnaExperiment}}}

\item{onlySignificant}{Logical, if \code{TRUE} differential expression results
will be returned just for statistically significant miRNAs/genes, if \code{FALSE}
the full table of miRNA/gene differential expression will be provided.
Default is \code{TRUE} to only report significant miRNAs/genes}

\item{param}{Logical, whether to return the complete \code{list} object with
the parameters used, or just the results stored in \code{data}. Default is FALSE}

\item{returnObject}{Logical, if \code{TRUE} this function will return the
limma/edgeR/DESeq2 object used for differential expression analysis}
}
\value{
\itemize{
\item the \code{mirnaDE()} function returns a \code{data.frame} object with the results
of miRNA differential expression analysis.
}

\itemize{
\item the \code{geneDE()} function returns a \code{data.frame} object with the results
of gene differential expression analysis.
}

\itemize{
\item the \code{significantMirnas()} function gives back a \code{character} vector with the
names of differentially expressed miRNAs.
}

\itemize{
\item the \code{significantGenes()} function gives back a \code{character} vector with the
names of differentially expressed genes.
}

\itemize{
\item the \code{pairedSamples()} function returns a \code{logical} object that specifies
if the MirnaExperiment object has paired measurements or not.
}

\itemize{
\item the \code{mirnaTargets()} function provides a \code{data.frame} object with the
list of target genes for the differentially expressed miRNAs.
}

\itemize{
\item the \code{integration()} function gives back a \code{data.frame} object with the
results of the integrative miRNA-mRNA analysis.
}
}
\description{
This class extends the
\code{\link[MultiAssayExperiment:MultiAssayExperiment-class]{MultiAssayExperiment}}
from the homonym package to provide the flexibility of handling genomic data
of both microRNAs and their targets, allowing to store information about
microRNA and gene expression, differential expression results, microRNA
targets and miRNA-gene integration analysis.

This class can be used to manage genomic data deriving from different
sources, like RNA-Seq, microarrays and mass spectrometry. Moreover, microRNA
and gene expression levels may originate from the same individuals
(paired samples) or from different subjects (unpaired samples).
}
\section{Functions}{
\itemize{
\item \code{mirnaDE(MirnaExperiment)}: Access the results of miRNA differential
expression

\item \code{geneDE(MirnaExperiment)}: Access the results of gene differential
expression

\item \code{significantMirnas(MirnaExperiment)}: Access the names of differentially
expressed miRNAs

\item \code{significantGenes(MirnaExperiment)}: Access the names of differentially
expressed genes

\item \code{pairedSamples(MirnaExperiment)}: Check if the object derives from
sample-matched data

\item \code{mirnaTargets(MirnaExperiment)}: Extract the miRNA-targets interactions
retrieved for the differentially expressed miRNAs

\item \code{integration(MirnaExperiment)}: Access the results of the integrative
miRNA-mRNA analysis

\item \code{show(MirnaExperiment)}: Show method for objects of class
MirnaExperiment

}}
\section{Slots}{

\describe{
\item{\code{ExperimentList}}{An \code{ExperimentList} class object for each assay dataset}

\item{\code{colData}}{A \code{DataFrame} of all clinical/specimen data available across
experiments}

\item{\code{sampleMap}}{A \code{DataFrame} of translatable identifiers of samples and
participants}

\item{\code{metadata}}{Additional data describing the object}

\item{\code{drops}}{A metadata \code{list} of dropped information}

\item{\code{mirnaDE}}{A \code{list} object containing the results of miRNA differential
expression}

\item{\code{geneDE}}{A \code{list} object containing the results of gene differential
expression}

\item{\code{pairedSamples}}{A \code{logical} parameter that specifies whether miRNA and
gene expression measurements derive from the same individuals (\code{TRUE}) or
from different subjects (\code{FALSE})}

\item{\code{targets}}{A \code{data.frame} object containing miRNA-target pairs. This
slot is commonly populated by the \code{\link[=getTargets]{getTargets()}} function}

\item{\code{integration}}{A \code{list} object containing the results
of the integration analysis between miRNA and gene expression values. This
slot is commonly populated by the \code{\link[=mirnaIntegration]{mirnaIntegration()}} function}
}}

\note{
To create a \code{\link[=MirnaExperiment-class]{MirnaExperiment}} object, you can use
the \code{\link[=MirnaExperiment]{MirnaExperiment()}} constructor function, which allows to easily build
and verify a valid object starting from miRNA and gene expression matrices.
}
\section{ExperimentList}{


The \code{\link[MultiAssayExperiment:ExperimentList]{ExperimentList}} slot is designed
to contain results from each experiment/assay. In this case, it holds miRNA
and gene expression matrices. It contains a
\code{\link[S4Vectors:SimpleList-class]{SimpleList-class}}.
}

\section{colData}{


The \code{colData} slot is a collection of primary specimen data valid across all
experiments. This slot is strictly of class \code{\link{DataFrame}} but arguments for
the constructor function allow arguments to be of class \code{data.frame} and
subsequently coerced.
}

\section{sampleMap}{


The \code{sampleMap} contains a \code{\link{DataFrame}} of translatable identifiers of
samples and participants or biological units. The standard column names of
the sampleMap are "assay", "primary", and "colname". Note that the "assay"
column is a factor corresponding to the names of each experiment in the
\code{\link[MultiAssayExperiment:ExperimentList]{ExperimentList}}. In the case where
these names do not match between the sampleMap and the experiments, the
documented experiments in the \code{sampleMap} take precedence and experiments
are dropped by the harmonization procedure. The constructor function will
generate a \code{sampleMap} in the case where it is not provided and this method
may be a 'safer' alternative for creating the \code{MultiAssayExperiment} (so
long as the rownames are identical in the \code{colData}, if provided). An empty
\code{sampleMap} may produce empty experiments if the levels of the "assay"
factor in the \code{sampleMap} do not match the names in the
\code{\link[MultiAssayExperiment:ExperimentList]{ExperimentList}}.
}

\section{mirnaDE and geneDE}{


\code{mirnaDE} and \code{geneDE} consist of two \code{list} objects storing information
regarding miRNA and gene differential expression, including:
\itemize{
\item \code{data}, which contains differential expression results in a \code{data.frame}
with five columns:
\itemize{
\item \code{ID}: indicates the name of the miRNA/gene;
\item \code{logFC}: indicates the fold change of each feature in logarithmic scale;
\item \code{AveExpr}: represents the average expression of each miRNA/gene;
\item \code{P.Value}: indicates the resulting p-value;
\item \code{adj.P.Val}: contains the p-values adjusted for multiple testing.
}
\item \code{significant}, which is a \code{character} vector containing the names of
significantly differentially expressed miRNAs/genes that passed the
thresholds;
\item \code{method}, which specifies the procedure used to determine differentially
expressed miRNAs/gens (eg. "limma-voom", "edgeR", "DESeq2", "limma");
\item \code{group}, which is the column name of the variable (in colData) used for
differential expression analysis;
\item \code{contrast}, which represents the groups that are compared during
differential expression analysis (e.g. 'disease-healthy');
\item \code{design}, which outlines the R \code{formula} used for fitting the model. It
includes the variable of interest (\code{group}) together with eventual
covariates (e.g. '~ 0 + disease + sex');
\item \code{pCutoff}, which indicates the p-value cutoff used for DE analysis;
\item \code{pAdjustment}, the approach used for multiple testing correction;
\item \code{logFC}, which states the log2 Fold Change cutoff used for DE analysis;
\item \code{deObject}, an object deriving from limma/edgeR/DESeq2, that holds
additional information regarding data processing.
}

MiRNA differential expression results can be accessed through the \code{\link[=mirnaDE]{mirnaDE()}}
function, for additional details see \code{?mirnaDE}. Similarly, gene
differential expression results can be accessed through the \code{\link[=geneDE]{geneDE()}}
function, for additional details see \code{?geneDE}.
}

\section{pairedSamples}{


As already mentioned, \code{pairedSamples} must be \code{TRUE} when miRNA and gene
expression derive from the same subjects, while it must \code{FALSE} if this is
not the case.
}

\section{targets}{


\code{targets} is a \code{data.frame} with miRNA-target interactions, as retrieved by
\code{\link[=getTargets]{getTargets()}} function.
}

\section{integration}{


Lastly, \code{integration} slot contains a \code{list} object that stores
the results and the options used for performing the integrative miRNA-gene
analysis. In particular, \code{integration} contains:
\itemize{
\item \code{data}, which is a \code{data.frame} object with the results of the integrative
analysis;
\item \code{method}, which specifies the procedure used to perform the integrative
analysis;
\item \code{pCutoff}, which indicates the p-value cutoff used for the analysis;
\item \code{pAdjustment}, the approach used for multiple testing correction.
}

Moreover, \code{data} differs on the basis of the integration strategy used. For
the one-sided association test integration, and for integration based on
rotation gene set tests, this \code{data.frame} has seven columns:
\itemize{
\item \code{microRNA}: the miRNA ID;
\item \code{mirna.direction}: the fold change direction of the DE-miRNA (\code{Up} or
\code{Down});
\item \code{gene.direction}: the fold change direction of target genes (\code{Up} or
\code{Down});
\item \code{DE}: represents the number of differentially expressed targets;
\item \code{targets}: represents the total number of targets for this miRNA;
\item \code{P.Val}: indicates the resulting p-value;
\item \code{adj.P.Val}: contains test p-values corrected for multiple testing;
\item \code{DE.targets}: contains the list of differentially expressed targets whose
expression is negatively associated with miRNA expression.
}

Instead, when a correlation analysis is performed, \code{data} has six columns:
\itemize{
\item \code{microRNA}: the miRNA ID;
\item \code{Target}: the correlated target gene;
\item \code{microRNA.Direction}: the fold change direction of the DE-miRNA;
\item \code{Corr.Coeff}: the value of the correlation coefficient used;
\item \code{Corr.P.Value}: the p-value resulting from the correlation analysis;
\item \code{Corr.Adjusted.P.Val}: contains the correlation p-values corrected for
multiple testing.
}

To access the results of the integrative analysis, the \code{data} slot can be
accessed through the \code{\link[=integration]{integration()}} function.
}

\references{
Marcel Ramos et al. Software For The Integration Of Multiomics Experiments
In Bioconductor. Cancer Research, 2017 November 1; 77(21); e39-42. DOI:
\url{10.1158/0008-5472.CAN-17-0344}
}
\seealso{
See \code{\link[MultiAssayExperiment:MultiAssayExperiment-class]{MultiAssayExperiment-class}}
for additional information.
}
\author{
Jacopo Ronchi, \email{jacopo.ronchi@unimib.it}
}
