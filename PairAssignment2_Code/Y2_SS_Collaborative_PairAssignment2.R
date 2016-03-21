#Gandrud // Session 05 // 2016-03-21

#get data from the web and create tables

library(WDI)

URL <- "http://real-chart.finance.yahoo.com/table.csv?s=%5EGDAXI&a=00&b=01&c=1991&d=02&e=21&f=2016&g=d&ignore=.csv"
DAX <- read.csv(URL)
DAX$Date <- as.Date(DAX$Date, "%Y-%m-%d")

URL <- "http://real-chart.finance.yahoo.com/table.csv?s=%5EN225&a=00&b=01&c=1991&d=02&e=21&f=2016&g=d&ignore=.csv"
NIKKEI <- read.csv(URL)
NIKKEI$Date <- as.Date(NIKKEI$Date, "%Y-%m-%d")

URL <- "http://real-chart.finance.yahoo.com/table.csv?s=%5EFTSE&a=00&b=01&c=1991&d=02&e=21&f=2016&g=d&ignore=.csv"
FTSE <- read.csv(URL)
FTSE$Date <- as.Date(FTSE$Date, "%Y-%m-%d")

URL <- "http://real-chart.finance.yahoo.com/table.csv?s=%5EFCHI&a=00&b=1&c=1991&d=02&e=21&f=2016&g=d&ignore=.csv"
CAC <- read.csv(URL)
CAC$Date <- as.Date(CAC$Date, "%Y-%m-%d")

URL <- "http://real-chart.finance.yahoo.com/table.csv?s=%5EBVSP&a=00&b=01&c=1991&d=02&e=21&f=2016&g=d&ignore=.csv"
IBOV <- read.csv(URL)
IBOV$Date <- as.Date(IBOV$Date, "%Y-%m-%d")

URL <- "http://real-chart.finance.yahoo.com/table.csv?s=OMRU.EX&a=00&b=01&c=1991&d=02&e=21&f=2016&g=d&ignore=.csv"
OMRU <- read.csv(URL)
OMRU$Date <- as.Date(OMRU$Date, "%Y-%m-%d")


iso <- c("DE", "US", "JP")
WDI <- WDI(country = "all", indicator = c("CM.MKT.TRAD.GD.ZS", #Stocks traded, total value (% of GDP) (4th column)
                                          "BN.KLT.DINV.CD.ZS", #Foreign direct investment (% of GDP)
                                          "CM.MKT.TRNR", #Stocks traded, turnover ratio (%)
                                          "NY.GDP.PCAP.KD.ZG", #GDP per capita growth (annual %)
                                          "NEGDIKSTKKD", #Estimated Capital stock (real 2005 US$)
                                          "NY.GDP.PCAP.KD"), #GDP per capita (constant 2005 US$)
           start=1991, end=2015)

summary(WDI$CM.MKT.TRAD.GD.ZS) #4339 NA's
summary(WDI$BN.KLT.DINV.CD.ZS) #5996
summary(WDI$CM.MKT.TRNR) # 4313 NA's
summary(WDI$NY.GDP.PCAP.KD.ZG) # 945 NA's
summary(WDI$NY.GDP.PCAP.KD) # 972 NA's

names(WDI)[4] <- 'stocks'
names(WDI)[5] <- 'fdi'
names(WDI)[6] <- 'sturnover'
names(WDI)[7] <- 'gdp.pc.gr'
names(WDI)[8] <- 'gdp.pc'

