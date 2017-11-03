corr <- function(directory, threshold)
{
  files <- list.files(path="/Users/saidhalli/Downloads/specdata", pattern="*.csv", full.names=T, recursive=FALSE)
  corrs<-NULL
  for(f in files)
  {
    csv_non_na<-na.omit(read.csv(f)[,c("sulfate","nitrate")])
    if(nrow(csv_non_na) > threshold)
    {
      corrs<-c(corrs,cor(csv_non_na$sulfate, csv_non_na$nitrate))
    }
  }
  corrs
}