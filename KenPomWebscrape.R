install.packages('rvest')
library(rvest)

#Load URL
url2003 <-"https://kenpom.com/index.php?y=2003"
url2004 <-"https://kenpom.com/index.php?y=2004"
url2005 <-"https://kenpom.com/index.php?y=2005"
url2006 <-"https://kenpom.com/index.php?y=2006"
url2007 <-"https://kenpom.com/index.php?y=2007"
url2008 <- "https://kenpom.com/index.php?y=2008"
url2009 <- "https://kenpom.com/index.php?y=2009"
url2010 <- "https://kenpom.com/index.php?y=2010"
url2011 <- "https://kenpom.com/index.php?y=2011"
url2012 <-"https://kenpom.com/index.php?y=2012"
url2013 <-"https://kenpom.com/index.php?y=2013"
url2014 <-"https://kenpom.com/index.php?y=2014"
url2015 <-"https://kenpom.com/index.php?y=2015"
url2016 <-"https://kenpom.com/index.php?y=2016"
url2017 <- "https://kenpom.com/index.php?y=2017"
url2018 <- "https://kenpom.com/index.php?y=2018"
url2019 <- "https://kenpom.com/"

urls <- c(url2003,url2004,url2005,url2006,url2007,url2008,url2009, url2010,url2011
          , url2012, url2013, url2014, url2015, url2016, url2017, url2018,url2019)

j <- 2003
while(j < 2020){
    for(i in urls) {
        download.file(i, destfile = paste("DataFiles/KenPom"
                                          , j, ".html", sep = ""))
        j <- j + 1
    }
}

#Initializing Values

k <- 2003

Year <- integer()
ranks <- integer()
teams <- character()
conf <- character()
WinLoss <- character()
AdEfM <- integer()
AdOfE <- integer()
AdOfER <- integer()
AdDeE <- integer()
AdDeER <- integer()
AdTempo <- integer()
AdTempoR <- integer()
Luck <- integer()
LuckRank <- integer()
AdSoS <- integer()
AdSoSR <- integer()

setwd('DataFiles/')
#Running loop for parsing all data into vectors
while ( k < 2020){
  webpage <- read_html(paste("KenPom", k, ".html", sep = ""))
  kenpom_data_html <- html_nodes(webpage, 'tr td')
  data <- html_text(kenpom_data_html)
  
  if(k == 2003){
    Year <- c(Year, rep(k, 327))
  } else if(k == 2004){
    Year <- c(Year, rep(k, 326))
  } else if(k == 2005){
    Year <- c(Year, rep(k, 330))
  } else if(k == 2006){
    Year <- c(Year, rep(k, 334))
  } else if(k == 2007){
    Year <- c(Year, rep(k, 336))
  } else if(k == 2008){
    Year <- c(Year, rep(k, 341))
  } else if(k == 2009){
    Year <- c(Year, rep(k, 344))
  } else if(k == 2010){
    Year <- c(Year, rep(k, 347))
  } else if(k == 2011 |k == 2012){
    Year <- c(Year, rep(k, 345))
  } else if(k == 2013){
    Year <- c(Year, rep(k, 347))
  } else if(k == 2019){
    Year <- c(Year, rep(k, 353))
  } else {
    Year <- c(Year, rep(k, 351))
  }
    
  
  
  
  #Parsing Ranks
  i <- 1
  
  while(i < length(data)){
    ranks <- c(ranks, data[i])
    i <- i + 21
  }
  
  #Parsing Teams
  
  i <- 2
  
  while(i < length(data)){
    teams <- c(teams, data[i])
    i <- i + 21
  }
  
  
  #Parsing Conf
  i <- 3
 
  while(i < length(data)){
    conf <- c(conf, data[i])
    i <- i + 21
  }
  
  #Parsing Win-Loss
  
  i <- 4
  
  while(i < length(data)){
    WinLoss <- c(WinLoss, data[i])
    i <- i + 21
  }
  
  #Parsing Adjusted Efficiency Margin
  i <- 5
  
  while(i < length(data)){
    AdEfM <- c(AdEfM, data[i])
    i <- i + 21
  }
  
  #Parsing Adjusted Offensive Efficiency
  i <- 6
  
  while(i < length(data)){
    AdOfE <- c(AdOfE, data[i])
    i <- i + 21
  }
  
  #Parsing Adjusted Offensive Efficiency Rank
  
  i <- 7
  
  while(i < length(data)){
    AdOfER <- c(AdOfER, data[i])
    i <- i + 21
  }
  
  #Parsing Adjusted Defensive Efficiency
  
  i <- 8
  
  while(i < length(data)){
    AdDeE <- c(AdDeE, data[i])
    i <- i + 21
  }
  
  #Parsing Adjusted Defensive Efficiency Rank
  i <- 9
  
  while(i < length(data)){
    AdDeER <- c(AdDeER, data[i])
    i <- i + 21
  }

  #Parsing Adjusted Tempo
  i <- 10
  
  while(i < length(data)){
    AdTempo <- c(AdTempo, data[i])
    i <- i + 21
  }
  
  #Parsing Adjusted Tempo Rank
  i <- 11
  
  while(i < length(data)){
    AdTempoR <- c(AdTempoR, data[i])
    i <- i + 21
  }
  
  #Parsing Luck
  i <- 12
  
  while(i < length(data)){
    Luck <- c(Luck, data[i])
    i <- i + 21
  }
  
  #Parsing Luck Rank
  i <- 13
 
  while(i < length(data)){
    LuckRank <- c(LuckRank, data[i])
    i <- i + 21
  }
  
  #Parsing Adjusted Strength of Schedule Rating
  i <- 14
  
  while(i < length(data)){
    AdSoS <- c(AdSoS, data[i])
    i <- i + 21
  }
  
  #Parsing Adjusted Strength of Schedule Rating Rank
  i <- 15
  
  while(i < length(data)){
    AdSoSR <- c(AdSoSR, data[i])
    i <- i + 21
  }
  
  k <- k + 1
}

KenPomData <- data.frame(Year = Year, Rank = ranks, Teams = teams, Conf = conf,
                         WinLoss = WinLoss, AdjustedEM = AdEfM, AdOfE, AdOfER, 
                         AdDeE, AdDeER, AdTempo, AdTempoR, Luck, LuckRank,
                         AdSoS, AdSoSR)

write.csv(KenPomData,"KenPomData.csv")
