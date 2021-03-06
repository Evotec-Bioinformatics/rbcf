##Print the Samples in the VCF header
#' The samples are defined in the '\#CHROM' line of the VCF
# load rbcf
library(rbcf)
# we don't need the index for this file
fp <- bcf.open("./data/rotavirus_rf.01.vcf",FALSE)
# error on opening (exit 0 for tests)
if(is.null(fp)) quit(save="no",status=0,runLast=FALSE)
# print the number of samples
paste("Number of samples:",bcf.nsamples(fp))
# get the name for the 1st sample
paste("First sample:",bcf.sample.at(fp,1))
# get the 1-based index for the samples
bcf.sample2index(fp,c("S1","S2","S3","missing"))
# get all the samples
bcf.samples(fp)
# dispose the vcf reader
bcf.close(fp)
