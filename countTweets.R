#tweets_shiny.df <- parseTweets("tweetsd3.json", simplify = TRUE)
library(streamR)
library(tm)
library(wordcloud)

gbea
#tweets_shiny.df <- parseTweets("tweets.02.07.2016.summary", simplify = TRUE)
#to remove emojis
#tweets_shiny.df <- iconv(tweets_shiny.df, "ASCII", "UTF-8", sub="")
tweets_shiny.df$text <- sapply(tweets_shiny.df$text, function(row) iconv(row, "latin1", "ASCII", sub = ""))

hey <- nrow(tweets_shiny.df)


View (tweets_shiny.df)

#Tweets for All Candidates
#tweets_shiny.df <- tweets_shiny.df[order(as.POSIXct(tweets_shiny.df$created_at, format="%a %b %d %H:%M:%S %z %Y")), ]
#make tweets go to lowercase 
HillaryClinton <- tweets_shiny.df[grep("Hillary Clinton", tweets_shiny.df$text), ]
HillaryClinton_wo <- tweets_shiny.df[grep("HillaryClinton", tweets_shiny.df$text), ]
HillaryTotals <- rbind(HillaryClinton, HillaryClinton_wo)

#Separating into four
#manually searched  tweets_shiny.df for Sun Feb 07 19: and found first 5210 matched
CampaignTweets1.df <- tweets_shiny.df[1:5210,]

HillaryClinton1 <- CampaignTweets1.df[grep("Hillary Clinton", CampaignTweets1.df$text), ]
HillaryClinton_wo1 <-CampaignTweets1.df[grep("HillaryClinton", CampaignTweets1.df$text), ]
HillaryTotals1 <- rbind(HillaryClinton1, HillaryClinton_wo1)


BernieSanders1<- CampaignTweets1.df[grep("Bernie Sanders", CampaignTweets1.df$text), ]
BernieSanders_wo1 <- CampaignTweets1.df[grep("BernieSanders", CampaignTweets1.df$text), ]
BernieTotals1 <- rbind(BernieSanders1, BernieSanders_wo1)

DonaldTrump1<- CampaignTweets1.df[grep("Donald Trump", CampaignTweets1.df$text), ]
DonaldTrump_wo1 <- CampaignTweets1.df[grep("DonaldTrump", CampaignTweets1.df$text), ]
DonaldTotals1 <- rbind(DonaldTrump1, DonaldTrump_wo1)


TedCruz1<- CampaignTweets1.df[grep("Ted Cruz", CampaignTweets1.df$text), ]
TedCruz_wo1 <- CampaignTweets1.df[grep("TedCruz", CampaignTweets1.df$text), ]
TedTotals1 <- rbind(TedCruz1, TedCruz_wo1)


MarcoRubio1<- CampaignTweets1.df[grep("Marco Rubio",CampaignTweets1.df$text), ]
MarcoRubio_wo1 <- CampaignTweets1.df[grep("MarcoRubio", CampaignTweets1.df$text), ]
MarcoTotals1 <- rbind(MarcoRubio1, MarcoRubio_wo1)


#manually searched  tweets_shiny.df for Sun Feb 07 20: and found it ranged from 5211-8526
CampaignTweets2.df <- tweets_shiny.df[5211:8526,]

HillaryClinton2 <- CampaignTweets2.df[grep("Hillary Clinton", CampaignTweets2.df$text), ]
HillaryClinton_wo2 <-CampaignTweets2.df[grep("HillaryClinton", CampaignTweets2.df$text), ]
HillaryTotals2 <- rbind(HillaryClinton2, HillaryClinton_wo2)


BernieSanders2<- CampaignTweets2.df[grep("Bernie Sanders", CampaignTweets2.df$text), ]
BernieSanders_wo2 <- CampaignTweets2.df[grep("BernieSanders", CampaignTweets2.df$text), ]
BernieTotals2 <- rbind(BernieSanders2, BernieSanders_wo2)

DonaldTrump2<- CampaignTweets2.df[grep("Donald Trump", CampaignTweets2.df$text), ]
DonaldTrump_wo2 <- CampaignTweets2.df[grep("DonaldTrump", CampaignTweets2.df$text), ]
DonaldTotals2 <- rbind(DonaldTrump2, DonaldTrump_wo2)


TedCruz2<- CampaignTweets2.df[grep("Ted Cruz", CampaignTweets2.df$text), ]
TedCruz_wo2 <- CampaignTweets2.df[grep("TedCruz", CampaignTweets2.df$text), ]
TedTotals2 <- rbind(TedCruz2, TedCruz_wo2)


MarcoRubio2<- CampaignTweets2.df[grep("Marco Rubio",CampaignTweets2.df$text), ]
MarcoRubio_wo2 <- CampaignTweets2.df[grep("MarcoRubio", CampaignTweets2.df$text), ]
MarcoTotals2 <- rbind(MarcoRubio2, MarcoRubio_wo2)

#manually searched  tweets_shiny.df for Sun Feb 07 21: and found it ranged from 8527:15235
CampaignTweets3.df <- tweets_shiny.df[8527:15235,]


HillaryClinton3 <- CampaignTweets3.df[grep("Hillary Clinton", CampaignTweets3.df$text), ]
HillaryClinton_wo3 <-CampaignTweets3.df[grep("HillaryClinton", CampaignTweets3.df$text), ]
HillaryTotals3 <- rbind(HillaryClinton3, HillaryClinton_wo3)


BernieSanders3<- CampaignTweets3.df[grep("Bernie Sanders", CampaignTweets3.df$text), ]
BernieSanders_wo3 <- CampaignTweets3.df[grep("BernieSanders", CampaignTweets3.df$text), ]
BernieTotals3 <- rbind(BernieSanders3, BernieSanders_wo3)

DonaldTrump3<- CampaignTweets3.df[grep("Donald Trump", CampaignTweets3.df$text), ]
DonaldTrump_wo3 <- CampaignTweets3.df[grep("DonaldTrump", CampaignTweets3.df$text), ]
DonaldTotals3 <- rbind(DonaldTrump3, DonaldTrump_wo3)


TedCruz3<- CampaignTweets3.df[grep("Ted Cruz", CampaignTweets3.df$text), ]
TedCruz_wo3 <- CampaignTweets3.df[grep("TedCruz", CampaignTweets3.df$text), ]
TedTotals3 <- rbind(TedCruz3, TedCruz_wo3)


MarcoRubio3<- CampaignTweets3.df[grep("Marco Rubio",CampaignTweets3.df$text), ]
MarcoRubio_wo3 <- CampaignTweets3.df[grep("MarcoRubio", CampaignTweets3.df$text), ]
MarcoTotals3 <- rbind(MarcoRubio3, MarcoRubio_wo3)
#manually searched  tweets_shiny.df for Sun Feb 07 22: and found it ranged from 15236:21440,
CampaignTweets4.df <- tweets_shiny.df[15236:21440,]


HillaryClinton4 <- CampaignTweets4.df[grep("Hillary Clinton", CampaignTweets4.df$text), ]
HillaryClinton_wo4 <-CampaignTweets4.df[grep("HillaryClinton", CampaignTweets4.df$text), ]
HillaryTotals4 <- rbind(HillaryClinton4, HillaryClinton_wo4)


BernieSanders4<- CampaignTweets4.df[grep("Bernie Sanders", CampaignTweets4.df$text), ]
BernieSanders_wo4 <- CampaignTweets4.df[grep("BernieSanders", CampaignTweets4.df$text), ]
BernieTotals4 <- rbind(BernieSanders4, BernieSanders_wo4)

DonaldTrump4<- CampaignTweets4.df[grep("Donald Trump", CampaignTweets4.df$text), ]
DonaldTrump_wo4 <- CampaignTweets4.df[grep("DonaldTrump", CampaignTweets4.df$text), ]
DonaldTotals4 <- rbind(DonaldTrump4, DonaldTrump_wo4)


TedCruz4<- CampaignTweets4.df[grep("Ted Cruz", CampaignTweets4.df$text), ]
TedCruz_wo4 <- CampaignTweets4.df[grep("TedCruz", CampaignTweets4.df$text), ]
TedTotals4 <- rbind(TedCruz4, TedCruz_wo4)


MarcoRubio4<- CampaignTweets4.df[grep("Marco Rubio",CampaignTweets4.df$text), ]
MarcoRubio_wo4 <- CampaignTweets4.df[grep("MarcoRubio", CampaignTweets4.df$text), ]
MarcoTotals4 <- rbind(MarcoRubio4, MarcoRubio_wo4)

#manually searched  tweets_shiny.df for Sun Feb 07 23: and found it ranged from 21441:26829,
CampaignTweets5.df <- tweets_shiny.df[21441:26829,]


HillaryClinton5 <- CampaignTweets5.df[grep("Hillary Clinton", CampaignTweets5.df$text), ]
HillaryClinton_wo5 <-CampaignTweets5.df[grep("HillaryClinton", CampaignTweets5.df$text), ]
HillaryTotals5 <- rbind(HillaryClinton5, HillaryClinton_wo5)


BernieSanders5<- CampaignTweets5.df[grep("Bernie Sanders", CampaignTweets5.df$text), ]
BernieSanders_wo5 <- CampaignTweets5.df[grep("BernieSanders", CampaignTweets5.df$text), ]
BernieTotals5 <- rbind(BernieSanders5, BernieSanders_wo5)

DonaldTrump5<- CampaignTweets5.df[grep("Donald Trump", CampaignTweets5.df$text), ]
DonaldTrump_wo5 <- CampaignTweets5.df[grep("DonaldTrump", CampaignTweets5.df$text), ]
DonaldTotals5 <- rbind(DonaldTrump5, DonaldTrump_wo5)


TedCruz5<- CampaignTweets5.df[grep("Ted Cruz", CampaignTweets5.df$text), ]
TedCruz_wo5 <- CampaignTweets5.df[grep("TedCruz", CampaignTweets5.df$text), ]
TedTotals5 <- rbind(TedCruz5, TedCruz_wo5)


MarcoRubio5<- CampaignTweets5.df[grep("Marco Rubio",CampaignTweets5.df$text), ]
MarcoRubio_wo5 <- CampaignTweets5.df[grep("MarcoRubio", CampaignTweets5.df$text), ]
MarcoTotals5 <- rbind(MarcoRubio5, MarcoRubio_wo5)

#manually searched  tweets_shiny.df for Mon Feb 08: and found it ranged from 26830:26869,
CampaignTweets6.df <- tweets_shiny.df[26830:26869,]


HillaryClinton6 <- CampaignTweets6.df[grep("Hillary Clinton", CampaignTweets6.df$text), ]
HillaryClinton_wo6 <-CampaignTweets6.df[grep("HillaryClinton", CampaignTweets6.df$text), ]
HillaryTotals6 <- rbind(HillaryClinton6, HillaryClinton_wo6)


BernieSanders6<- CampaignTweets6.df[grep("Bernie Sanders", CampaignTweets6.df$text), ]
BernieSanders_wo6 <- CampaignTweets6.df[grep("BernieSanders", CampaignTweets6.df$text), ]
BernieTotals6 <- rbind(BernieSanders6, BernieSanders_wo6)

DonaldTrump6<- CampaignTweets6.df[grep("Donald Trump", CampaignTweets6.df$text), ]
DonaldTrump_wo6 <- CampaignTweets6.df[grep("DonaldTrump", CampaignTweets6.df$text), ]
DonaldTotals6 <- rbind(DonaldTrump6, DonaldTrump_wo6)


TedCruz6<- CampaignTweets6.df[grep("Ted Cruz", CampaignTweets6.df$text), ]
TedCruz_wo6 <- CampaignTweets6.df[grep("TedCruz", CampaignTweets6.df$text), ]
TedTotals6 <- rbind(TedCruz6, TedCruz_wo6)


MarcoRubio6<- CampaignTweets6.df[grep("Marco Rubio",CampaignTweets6.df$text), ]
MarcoRubio_wo6 <- CampaignTweets6.df[grep("MarcoRubio", CampaignTweets6.df$text), ]
MarcoTotals6 <- rbind(MarcoRubio6, MarcoRubio_wo6)

View (CampaignTweets1.df)

write.csv(HillaryTotals, file = "HillaryClintonTotalsTest.csv")
#load(HillaryTotals)




#tweets_shiny.df <- parseTweets("all_candidates.json", simplify = TRUE)
BernieSanders<- tweets_shiny.df[grep("Bernie Sanders", tweets_shiny.df$text), ]
BernieSanders_wo <- tweets_shiny.df[grep("BernieSanders", tweets_shiny.df$text), ]
BernieTotals <- rbind(BernieSanders, BernieSanders_wo)



#tweets_shiny.df <- parseTweets("all_candidates.json", simplify = TRUE)
DonaldTrump<- tweets_shiny.df[grep("Donald Trump", tweets_shiny.df$text), ]
DonaldTrump_wo <- tweets_shiny.df[grep("DonaldTrump", tweets_shiny.df$text), ]
DonaldTotals <- rbind(DonaldTrump, DonaldTrump_wo)


#tweets_shiny.df <- parseTweets("all_candidates.json", simplify = TRUE)
TedCruz<- tweets_shiny.df[grep("Ted Cruz", tweets_shiny.df$text), ]
TedCruz_wo <- tweets_shiny.df[grep("TedCruz", tweets_shiny.df$text), ]
TedTotals <- rbind(TedCruz, TedCruz_wo)


#tweets_shiny.df <- parseTweets("all_candidates.json", simplify = TRUE)
MarcoRubio<- tweets_shiny.df[grep("Marco Rubio", tweets_shiny.df$text), ]
MarcoRubio_wo <- tweets_shiny.df[grep("MarcoRubio", tweets_shiny.df$text), ]
MarcoTotals <- rbind(MarcoRubio, MarcoRubio_wo)