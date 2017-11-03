complete <- function(directory, ids=1:332)
{
  original_wd <- getwd()
  if(original_wd != directory)
  {
    setwd(directory)
  }
  library(stringi)
  id<-NULL
  nobs<-NULL
  for(i in ids)
  {
    i_pad<- stri_pad(i, 3, pad = "0")
    fname <- paste(i_pad,".csv",sep="")
    csv<-read.csv(fname)
    cnt_non_na<-length(which(!is.na(csv$sulfate)&!is.na(csv$nitrate)))
    nobs<-c(nobs,cnt_non_na)
    id<-c(id,i)
  }
  setwd(original_wd)
  data.frame(id,nobs)
}