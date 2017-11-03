pollutantmean <- function(directory, pollutant, id=1:332)
{
  original_wd <- getwd()
  if(original_wd != directory)
  {
    setwd(directory)
  }
  library(stringi)
  df<-NULL
  for(i in id)
  {
    i_pad<- stri_pad(i, 3, pad = "0")
    fname <- paste(i_pad,".csv",sep="")
    df <- c(read.csv(fname)[,pollutant], df)
  }
  setwd(original_wd)
  mean(df, na.rm = TRUE)
}