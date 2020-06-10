Ethiopiamerged2 <- Ethiopiamerged[Ethiopiamerged$confirmed>=1, ]
Ethiopiamerged2 <- Ethiopiamerged2[!is.na(Ethiopiamerged2$date),]

df <- data.frame(time=seq_len(nrow(Ethiopiamerged2)),
                 date = Ethiopiamerged2$date,
                 cuml_cases = Ethiopiamerged2$confirmed,
                 cuml_deaths = Ethiopiamerged2$deaths,
                 cuml_recovered = Ethiopiamerged2$recovered
                 #cuml_tests = Ethiopiamerged2$total_tests
                 )


n <- nrow(df)
df$cases <- sapply(seq_len(n), function(i){
  if(i==1){
    df$cuml_cases[i]
  }else{
    df$cuml_cases[i]-df$cuml_cases[i-1]
  }
})
df$deaths <- sapply(seq_len(n), function(i){
  if(i==1){
    df$cuml_deaths[i]
  }else{
    df$cuml_deaths[i]-df$cuml_deaths[i-1]
  }
})

df$recoveries <- sapply(seq_len(n), function(i){
  if(i==1){
    df$cuml_recovered[i]
  }else{
    df$cuml_recovered[i]-df$cuml_recovered[i-1]
  }
})

# df$tests <- sapply(seq_len(n), function(i){
#   if(i==1){
#     df$cuml_tests[i]
#   }else{
#     df$cuml_tests[i]-df$cuml_tests[i-1]
#   }
# })



today.updates <- data.frame(time=max(df$time, na.rm = TRUE)+1, 
                            date=date.today, 
                            cuml_cases=max(df$cuml_cases, na.rm = TRUE)+cases.today, 
                            cuml_deaths=max(df$cuml_deaths, na.rm = TRUE)+deaths.today,
                            cuml_recovered = max(df$cuml_recovered, na.rm = TRUE)+recoveries.today,
                            #cuml_tests = max(df$cuml_tests, na.rm = TRUE)+tests.today,
                            cases=cases.today,
                            deaths=deaths.today,
                            recoveries=recoveries.today
                            #tests=tests.today
                            )
df <- rbind(df, today.updates)
saveRDS(df, "data/EthioCOVID19_updates.rds")
