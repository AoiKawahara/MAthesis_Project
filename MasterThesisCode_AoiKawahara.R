###########################################
##  Master's Thesis Code - Aoi Kawahara  ##
###########################################

########################
## 1. Data Collection ##
########################

setwd('/Users/aoikawahara/Library/CloudStorage/OneDrive-KULeuven/Leuven/01_Master Thesis/Workplace')

#### List 1 ####
df_list1 <- lapply(1:20, function(i) {
  fread(paste0("data/part_1/may_july_chunk_", i, ".csv.gz"))})
names(df_list1) <- paste0("df", 1:20)
lapply(df_list1, function(df) table(df$date))  # No data during the aimed period
rm(df_list1)

#### List 2 ####
df_list2 <- lapply(21:40, function(i) {
  fread(paste0("data/part_2/may_july_chunk_", i, ".csv.gz"))})
names(df_list2) <- paste0("df", 21:40)
lapply(df_list2, function(df) table(df$date))  # No data during the aimed period
rm(df_list2)

#### List 3 ####
df_list3 <- lapply(41:60, function(i) {
  fread(paste0("data/part_3/may_july_chunk_", i, ".csv.gz"))})
names(df_list3) <- paste0("df", 41:60)
lapply(df_list3, function(df) table(df$date))
rm(df_list3)

#### List 4 ####
df_list4 <- lapply(61:80, function(i) {
  fread(paste0("data/part_4/may_july_chunk_", i, ".csv.gz"))})
names(df_list4) <- paste0("df", 61:80)
lapply(df_list4, function(df) table(df$date))  # No data during the aimed period
rm(df_list4)

#### List 5 ####
df_list5 <- lapply(81:100, function(i) {
  fread(paste0("data/part_5/may_july_chunk_", i, ".csv.gz"))})
names(df_list5) <- paste0("df", 81:100)
lapply(df_list5, function(df) table(df$date))
rm(df_list5)

#### List 6 ####
df_list6 <- lapply(101:120, function(i) {
  fread(paste0("data/part_6/may_july_chunk_", i, ".csv.gz"))})
names(df_list6) <- paste0("df", 101:120)
lapply(df_list6, function(df) table(df$date))

df_selected6 <- lapply(df_list6, function(df) {
  filtered_df <- df[df$date >= "2024-07-04" & df$date <= "2024-07-31", ]
  if (nrow(filtered_df) > 0) {
    return(filtered_df)}})
df_selected6 <- Filter(Negate(is.null), df_selected6)
rm(df_list6)

df_cleaned6 <- lapply(df_selected6, function(df) {
  filtered_df <- df %>%
    subset(lang == 'en') %>%
    subset(select = c(text, replyCount, retweetCount, likeCount, quoteCount, date, rawContent))})

head(df_cleaned6$df108$text)
head(df_cleaned6$df108$rawContent)
save(df_cleaned6, file = "df_cleaned6.rda")
rm(df_selected6)

df_all6 <- do.call(rbind, df_cleaned6)
rm(df_cleaned6)

#### List 7 ####
df_list7 <- lapply(121:140, function(i) {
  fread(paste0("data/part_7/may_july_chunk_", i, ".csv.gz"))})
names(df_list7) <- paste0("df", 121:140)
lapply(df_list7, function(df) table(df$date))

df_selected7 <- lapply(df_list7, function(df) {
  filtered_df <- df[df$date >= "2024-07-04" & df$date <= "2024-07-31", ]
  if (nrow(filtered_df) > 0) {
    return(filtered_df)}})
df_selected7 <- Filter(Negate(is.null), df_selected7)
rm(df_list7)

df_cleaned7 <- lapply(df_selected7, function(df) {
  filtered_df <- df %>%
    subset(lang == 'en') %>%
    subset(select = c(text, replyCount, retweetCount, likeCount, quoteCount, date, rawContent))})

save(df_cleaned7, file = "df_cleaned7.rda")
rm(df_selected7)

df_all7 <- do.call(rbind, df_cleaned7)
rm(df_cleaned7)

#### List 8 ####
df_list8 <- lapply(141:160, function(i) {
  fread(paste0("data/part_8/may_july_chunk_", i, ".csv.gz"))})
names(df_list8) <- paste0("df", 141:160)
lapply(df_list8, function(df) table(df$date))

df_selected8 <- lapply(df_list8, function(df) {
  filtered_df <- df[df$date >= "2024-07-04" & df$date <= "2024-07-31", ]
  if (nrow(filtered_df) > 0) {
    return(filtered_df)}})
df_selected8 <- Filter(Negate(is.null), df_selected8)
rm(df_list8)

df_cleaned8 <- lapply(df_selected8, function(df) {
  filtered_df <- df %>%
    subset(lang == 'en') %>%
    subset(select = c(text, replyCount, retweetCount, likeCount, quoteCount, date, rawContent))})

save(df_cleaned8, file = "df_cleaned8.rda")
rm(df_selected8)

df_all8 <- do.call(rbind, df_cleaned8)
rm(df_cleaned8)

#### List 9 ####
df_list9 <- lapply(161:180, function(i) {
  fread(paste0("data/part_9/may_july_chunk_", i, ".csv.gz"))})
names(df_list9) <- paste0("df", 161:180)
lapply(df_list9, function(df) table(df$date))

df_selected9 <- lapply(df_list9, function(df) {
  filtered_df <- df[df$date >= "2024-07-04" & df$date <= "2024-07-31", ]
  if (nrow(filtered_df) > 0) {
    return(filtered_df)}})
df_selected9 <- Filter(Negate(is.null), df_selected9)
rm(df_list9)

df_cleaned9 <- lapply(df_selected9, function(df) {
  filtered_df <- df %>%
    subset(lang == 'en') %>%
    subset(select = c(text, replyCount, retweetCount, likeCount, quoteCount, date, rawContent))})

save(df_cleaned9, file = "df_cleaned9.rda")
rm(df_selected9)

df_all9 <- do.call(rbind, df_cleaned9)
rm(df_cleaned9)

#### List 10 ####
df_list10 <- lapply(181:200, function(i) {
  fread(paste0("data/part_10/may_july_chunk_", i, ".csv.gz"))})
names(df_list10) <- paste0("df", 181:200)
lapply(df_list10, function(df) table(df$date))

df_selected10 <- lapply(df_list10, function(df) {
  filtered_df <- df[df$date >= "2024-07-04" & df$date <= "2024-07-31", ]
  if (nrow(filtered_df) > 0) {
    return(filtered_df)}})
df_selected10 <- Filter(Negate(is.null), df_selected10)
rm(df_list10)

df_cleaned10 <- lapply(df_selected10, function(df) {
  filtered_df <- df %>%
    subset(lang == 'en') %>%
    subset(select = c(text, replyCount, retweetCount, likeCount, quoteCount, date, rawContent))})

save(df_cleaned10, file = "df_cleaned10.rda")
rm(df_selected10)

df_all10 <- do.call(rbind, df_cleaned10)
rm(df_cleaned10)

#### List 11 ####
df_list11 <- lapply(201:220, function(i) {
  fread(paste0("data/part_11/may_july_chunk_", i, ".csv.gz"))})
names(df_list11) <- paste0("df", 201:220)
lapply(df_list11, function(df) table(df$date))

df_selected11 <- lapply(df_list11, function(df) {
  filtered_df <- df[df$date >= "2024-07-04" & df$date <= "2024-07-31", ]
  if (nrow(filtered_df) > 0) {
    return(filtered_df)}})
df_selected11 <- Filter(Negate(is.null), df_selected11)
rm(df_list11)

df_cleaned11 <- lapply(df_selected11, function(df) {
  filtered_df <- df %>%
    subset(lang == 'en') %>%
    subset(select = c(text, replyCount, retweetCount, likeCount, quoteCount, date, rawContent))})

save(df_cleaned11, file = "df_cleaned11.rda")
rm(df_selected11)

df_all11 <- do.call(rbind, df_cleaned11)
rm(df_cleaned11)

#### List 12 ####
df_list12 <- lapply(221:240, function(i) {
  fread(paste0("data/part_12/may_july_chunk_", i, ".csv.gz"))})
names(df_list12) <- paste0("df", 221:240)
lapply(df_list12, function(df) table(df$date))

df_selected12 <- lapply(df_list12, function(df) {
  filtered_df <- df[df$date >= "2024-07-04" & df$date <= "2024-07-31", ]
  if (nrow(filtered_df) > 0) {
    return(filtered_df)}})
df_selected12 <- Filter(Negate(is.null), df_selected12)
rm(df_list12)

df_cleaned12 <- lapply(df_selected12, function(df) {
  filtered_df <- df %>%
    subset(lang == 'en') %>%
    subset(select = c(text, replyCount, retweetCount, likeCount, quoteCount, date, rawContent))})

save(df_cleaned12, file = "df_cleaned12.rda")
rm(df_selected12)

df_all12 <- do.call(rbind, df_cleaned12)
rm(df_cleaned12)

#### List 13 ####
df_list13 <- lapply(241:260, function(i) {
  fread(paste0("data/part_13/may_july_chunk_", i, ".csv.gz"))})
names(df_list13) <- paste0("df", 241:260)
lapply(df_list13, function(df) table(df$date))

df_selected13 <- lapply(df_list13, function(df) {
  filtered_df <- df[df$date >= "2024-07-04" & df$date <= "2024-07-31", ]
  if (nrow(filtered_df) > 0) {
    return(filtered_df)}})
df_selected13 <- Filter(Negate(is.null), df_selected13)
rm(df_list13)

df_cleaned13 <- lapply(df_selected13, function(df) {
  filtered_df <- df %>%
    subset(lang == 'en') %>%
    subset(select = c(text, replyCount, retweetCount, likeCount, quoteCount, date, rawContent))})

save(df_cleaned13, file = "df_cleaned13.rda")
rm(df_selected13)

df_all13 <- do.call(rbind, df_cleaned13)
rm(df_cleaned13)

#### List 14 ####
df_list14 <- lapply(261:280, function(i) {
  fread(paste0("data/part_14/may_july_chunk_", i, ".csv.gz"))})
names(df_list14) <- paste0("df", 261:280)
lapply(df_list14, function(df) table(df$date))

df_selected14 <- lapply(df_list14, function(df) {
  filtered_df <- df[df$date >= "2024-07-04" & df$date <= "2024-07-31", ]
  if (nrow(filtered_df) > 0) {
    return(filtered_df)}})
df_selected14 <- Filter(Negate(is.null), df_selected14)
rm(df_list14)

df_cleaned14 <- lapply(df_selected14, function(df) {
  filtered_df <- df %>%
    subset(lang == 'en') %>%
    subset(select = c(text, replyCount, retweetCount, likeCount, quoteCount, date, rawContent))})

save(df_cleaned14, file = "df_cleaned14.rda")
rm(df_selected14)

df_all14 <- do.call(rbind, df_cleaned14)
rm(df_cleaned14)

#### List 15 ####
df_list15 <- lapply(281:300, function(i) {
  fread(paste0("data/part_15/may_july_chunk_", i, ".csv.gz"))})
names(df_list15) <- paste0("df", 281:300)
lapply(df_list15, function(df) table(df$date))

df_selected15 <- lapply(df_list15, function(df) {
  filtered_df <- df[df$date >= "2024-07-04" & df$date <= "2024-07-31", ]
  if (nrow(filtered_df) > 0) {
    return(filtered_df)}})
df_selected15 <- Filter(Negate(is.null), df_selected15)
rm(df_list15)

df_cleaned15 <- lapply(df_selected15, function(df) {
  filtered_df <- df %>%
    subset(lang == 'en') %>%
    subset(select = c(text, replyCount, retweetCount, likeCount, quoteCount, date, rawContent))})

save(df_cleaned15, file = "df_cleaned15.rda")
rm(df_selected15)

df_all15 <- do.call(rbind, df_cleaned15)
rm(df_cleaned15)

#### List 16 ####
df_list16 <- lapply(301:320, function(i) {
  fread(paste0("data/part_16/may_july_chunk_", i, ".csv.gz"))})
names(df_list16) <- paste0("df", 301:320)
lapply(df_list16, function(df) table(df$date))

df_selected16 <- lapply(df_list16, function(df) {
  filtered_df <- df[df$date >= "2024-07-04" & df$date <= "2024-07-31", ]
  if (nrow(filtered_df) > 0) {
    return(filtered_df)}})
df_selected16 <- Filter(Negate(is.null), df_selected16)
rm(df_list16)

df_cleaned16 <- lapply(df_selected16, function(df) {
  filtered_df <- df %>%
    subset(lang == 'en') %>%
    subset(select = c(text, replyCount, retweetCount, likeCount, quoteCount, date, rawContent))})

save(df_cleaned16, file = "df_cleaned16.rda")
rm(df_selected16)

df_all16 <- do.call(rbind, df_cleaned16)
rm(df_cleaned16)

#### List 17 ####
df_list17 <- lapply(321:340, function(i) {
  fread(paste0("data/part_17/may_july_chunk_", i, ".csv.gz"))})
names(df_list17) <- paste0("df", 321:340)
lapply(df_list17, function(df) table(df$date))

df_selected17 <- lapply(df_list17, function(df) {
  filtered_df <- df[df$date >= "2024-07-04" & df$date <= "2024-07-31", ]
  if (nrow(filtered_df) > 0) {
    return(filtered_df)}})
df_selected17 <- Filter(Negate(is.null), df_selected17)
rm(df_list17)

df_cleaned17 <- lapply(df_selected17, function(df) {
  filtered_df <- df %>%
    subset(lang == 'en') %>%
    subset(select = c(text, replyCount, retweetCount, likeCount, quoteCount, date, rawContent))})

save(df_cleaned17, file = "df_cleaned17.rda")
rm(df_selected17)

df_all17 <- do.call(rbind, df_cleaned17)
rm(df_cleaned17)

#### List 18 ####
df_list18 <- lapply(341:360, function(i) {
  fread(paste0("data/part_18/may_july_chunk_", i, ".csv.gz"))})
names(df_list18) <- paste0("df", 341:360)
lapply(df_list18, function(df) table(df$date))

df_selected18 <- lapply(df_list18, function(df) {
  filtered_df <- df[df$date >= "2024-07-04" & df$date <= "2024-07-31", ]
  if (nrow(filtered_df) > 0) {
    return(filtered_df)}})
df_selected18 <- Filter(Negate(is.null), df_selected18)
rm(df_list18)

df_cleaned18 <- lapply(df_selected18, function(df) {
  filtered_df <- df %>%
    subset(lang == 'en') %>%
    subset(select = c(text, replyCount, retweetCount, likeCount, quoteCount, date, rawContent))})

save(df_cleaned18, file = "df_cleaned18.rda")
rm(df_selected18)

df_all18 <- do.call(rbind, df_cleaned18)
rm(df_cleaned18)

#### List 19 ####
df_list19 <- lapply(361:380, function(i) {
  fread(paste0("data/part_19/may_july_chunk_", i, ".csv.gz"))})
names(df_list19) <- paste0("df", 361:380)
lapply(df_list19, function(df) table(df$date))

df_selected19 <- lapply(df_list19, function(df) {
  filtered_df <- df[df$date >= "2024-07-04" & df$date <= "2024-07-31", ]
  if (nrow(filtered_df) > 0) {
    return(filtered_df)}})
df_selected19 <- Filter(Negate(is.null), df_selected19)
rm(df_list19)

df_cleaned19 <- lapply(df_selected19, function(df) {
  filtered_df <- df %>%
    subset(lang == 'en') %>%
    subset(select = c(text, replyCount, retweetCount, likeCount, quoteCount, date, rawContent))})

save(df_cleaned19, file = "df_cleaned19.rda")
rm(df_selected19)

df_all19 <- do.call(rbind, df_cleaned19)
rm(df_cleaned19)

#### List 20 ####
df_list20 <- lapply(381:400, function(i) {
  fread(paste0("data/part_20/may_july_chunk_", i, ".csv.gz"))})
names(df_list20) <- paste0("df", 381:400)
lapply(df_list20, function(df) table(df$date))  # No data during the aimed period
rm(df_list20)

#### List 21 ####
df_list21 <- lapply(401:420, function(i) {
  fread(paste0("data/part_21/may_july_chunk_", i, ".csv.gz"))})
names(df_list21) <- paste0("df", 401:420)
lapply(df_list21, function(df) table(df$date))

df_selected21 <- lapply(df_list21, function(df) {
  filtered_df <- df[df$date >= "2024-07-04" & df$date <= "2024-07-31", ]
  if (nrow(filtered_df) > 0) {
    return(filtered_df)}})

rm(df_list21)
rm(df_selected21)

#### List 22 ####
df_list22 <- lapply(421:440, function(i) {
  fread(paste0("data/part_22/may_july_chunk_", i, ".csv.gz"))})
names(df_list22) <- paste0("df", 421:440)
lapply(df_list22, function(df) table(df$date))

df_selected22 <- lapply(df_list22, function(df) {
  filtered_df <- df[df$date >= "2024-07-04" & df$date <= "2024-07-31", ]
  if (nrow(filtered_df) > 0) {
    return(filtered_df)}})

df_selected22 <- Filter(Negate(is.null), df_selected22)
rm(df_list22)

df_cleaned22 <- lapply(df_selected22, function(df) {
  filtered_df <- df %>%
    subset(lang == 'en') %>%
    subset(select = c(text, replyCount, retweetCount, likeCount, quoteCount, date, rawContent))})

save(df_cleaned22, file = "df_cleaned22.rda")
rm(df_selected22)

df_all22 <- do.call(rbind, df_cleaned22)
rm(df_cleaned22)


#### Organize data according to date ####

df_alls <- list(df_all6, df_all7, df_all8, df_all9, df_all10, df_all11, df_all12, df_all13, df_all14, df_all15, df_all16, df_all17, df_all18, df_all19, df_all22)

rm(df_all6)
rm(df_all7)
rm(df_all8)
rm(df_all9)
rm(df_all10)
rm(df_all11)
rm(df_all12)
rm(df_all13)
rm(df_all14)
rm(df_all15)
rm(df_all16)
rm(df_all17)
rm(df_all18)
rm(df_all19)
rm(df_all22)

df_0704 <- do.call(rbind, lapply(df_alls, function(df) df[df$date == "2024-07-04", ]))
df_0705 <- do.call(rbind, lapply(df_alls, function(df) df[df$date == "2024-07-05", ]))
df_0706 <- do.call(rbind, lapply(df_alls, function(df) df[df$date == "2024-07-06", ]))
df_0707 <- do.call(rbind, lapply(df_alls, function(df) df[df$date == "2024-07-07", ]))
df_0708 <- do.call(rbind, lapply(df_alls, function(df) df[df$date == "2024-07-08", ]))
df_0709 <- do.call(rbind, lapply(df_alls, function(df) df[df$date == "2024-07-09", ]))
df_0710 <- do.call(rbind, lapply(df_alls, function(df) df[df$date == "2024-07-10", ]))
df_0711 <- do.call(rbind, lapply(df_alls, function(df) df[df$date == "2024-07-11", ]))
df_0712 <- do.call(rbind, lapply(df_alls, function(df) df[df$date == "2024-07-12", ]))
df_0713 <- do.call(rbind, lapply(df_alls, function(df) df[df$date == "2024-07-13", ]))
df_0714 <- do.call(rbind, lapply(df_alls, function(df) df[df$date == "2024-07-14", ]))
df_0715 <- do.call(rbind, lapply(df_alls, function(df) df[df$date == "2024-07-15", ]))
df_0716 <- do.call(rbind, lapply(df_alls, function(df) df[df$date == "2024-07-16", ]))
df_0717 <- do.call(rbind, lapply(df_alls, function(df) df[df$date == "2024-07-17", ]))
df_0718 <- do.call(rbind, lapply(df_alls, function(df) df[df$date == "2024-07-18", ]))
df_0719 <- do.call(rbind, lapply(df_alls, function(df) df[df$date == "2024-07-19", ]))
df_0720 <- do.call(rbind, lapply(df_alls, function(df) df[df$date == "2024-07-20", ]))
df_0721 <- do.call(rbind, lapply(df_alls, function(df) df[df$date == "2024-07-21", ]))
df_0722 <- do.call(rbind, lapply(df_alls, function(df) df[df$date == "2024-07-22", ]))
df_0723 <- do.call(rbind, lapply(df_alls, function(df) df[df$date == "2024-07-23", ]))
df_0724 <- do.call(rbind, lapply(df_alls, function(df) df[df$date == "2024-07-24", ]))
df_0725 <- do.call(rbind, lapply(df_alls, function(df) df[df$date == "2024-07-25", ]))
df_0726 <- do.call(rbind, lapply(df_alls, function(df) df[df$date == "2024-07-26", ]))
df_0727 <- do.call(rbind, lapply(df_alls, function(df) df[df$date == "2024-07-27", ]))
df_0728 <- do.call(rbind, lapply(df_alls, function(df) df[df$date == "2024-07-28", ]))
df_0729 <- do.call(rbind, lapply(df_alls, function(df) df[df$date == "2024-07-29", ]))
df_0730 <- do.call(rbind, lapply(df_alls, function(df) df[df$date == "2024-07-30", ]))
df_0731 <- do.call(rbind, lapply(df_alls, function(df) df[df$date == "2024-07-31", ]))

save(df_alls, file = "df_alls.rda")
rm(df_alls)

df_date_tables <- list(date = c("2024-07-04", "2024-07-05", "2024-07-06", "2024-07-07", "2024-07-08", "2024-07-09", "2024-07-10", "2024-07-11", "2024-07-12", "2024-07-13", "2024-07-14", "2024-07-15", "2024-07-16", "2024-07-17", "2024-07-18", "2024-07-19", "2024-07-20", "2024-07-21", "2024-07-22", "2024-07-23"),
                       nums = c(nrow(df_0704), nrow(df_0705), nrow(df_0706), nrow(df_0707), nrow(df_0708), nrow(df_0709), nrow(df_0710), nrow(df_0711), nrow(df_0712), nrow(df_0713), nrow(df_0714), nrow(df_0715), nrow(df_0716), nrow(df_0717), nrow(df_0718), nrow(df_0719), nrow(df_0720), nrow(df_0721), nrow(df_0722), nrow(df_0723)))

df_date_tables <- as.data.frame(df_date_tables)
sum(df_date_tables$nums)  # 9,844,825 posts in total

library(ggplot2)
library(ggthemes)

ggplot(df_date_tables, aes(x = date, y = nums, group = 1)) +
  geom_line() +
  labs(title = "Number of Posts by Date") +
  theme(axis.text.x = element_text(angle = 90))



#### Remove repliy posts ####

df_f_0704 <- df_0704[!grepl("^\\s*@+", df_0704$text), ]
df_f_0705 <- df_0705[!grepl("^\\s*@+", df_0705$text), ]
df_f_0706 <- df_0706[!grepl("^\\s*@+", df_0706$text), ]
df_f_0707 <- df_0707[!grepl("^\\s*@+", df_0707$text), ]
df_f_0708 <- df_0708[!grepl("^\\s*@+", df_0708$text), ]
df_f_0709 <- df_0709[!grepl("^\\s*@+", df_0709$text), ]
df_f_0710 <- df_0710[!grepl("^\\s*@+", df_0710$text), ]
df_f_0711 <- df_0711[!grepl("^\\s*@+", df_0711$text), ]
df_f_0712 <- df_0712[!grepl("^\\s*@+", df_0712$text), ]
df_f_0713 <- df_0713[!grepl("^\\s*@+", df_0713$text), ]
df_f_0714 <- df_0714[!grepl("^\\s*@+", df_0714$text), ]
df_f_0715 <- df_0715[!grepl("^\\s*@+", df_0715$text), ]
df_f_0716 <- df_0716[!grepl("^\\s*@+", df_0716$text), ]
df_f_0717 <- df_0717[!grepl("^\\s*@+", df_0717$text), ]
df_f_0718 <- df_0718[!grepl("^\\s*@+", df_0718$text), ]
df_f_0719 <- df_0719[!grepl("^\\s*@+", df_0719$text), ]
df_f_0720 <- df_0720[!grepl("^\\s*@+", df_0720$text), ]
df_f_0721 <- df_0721[!grepl("^\\s*@+", df_0721$text), ]
df_f_0722 <- df_0722[!grepl("^\\s*@+", df_0722$text), ]
df_f_0723 <- df_0723[!grepl("^\\s*@+", df_0723$text), ]

df_f_date_tables <- list(date = c("2024-07-04", "2024-07-05", "2024-07-06", "2024-07-07", "2024-07-08", "2024-07-09", "2024-07-10", "2024-07-11", "2024-07-12", "2024-07-13", "2024-07-14", "2024-07-15", "2024-07-16", "2024-07-17", "2024-07-18", "2024-07-19", "2024-07-20", "2024-07-21", "2024-07-22", "2024-07-23"),
                         nums = c(nrow(df_f_0704), nrow(df_f_0705), nrow(df_f_0706), nrow(df_f_0707), nrow(df_f_0708), nrow(df_f_0709), nrow(df_f_0710), nrow(df_f_0711), nrow(df_f_0712), nrow(df_f_0713), nrow(df_f_0714), nrow(df_f_0715), nrow(df_f_0716), nrow(df_f_0717), nrow(df_f_0718), nrow(df_f_0719), nrow(df_f_0720), nrow(df_f_0721), nrow(df_f_0722), nrow(df_f_0723)))

df_f_date_tables <- as.data.frame(df_f_date_tables)
sum(df_f_date_tables$nums)

ggplot(df_f_date_tables, aes(x = date, y = nums, group = 1)) +
  geom_line() +
  labs(title = "Number of Posts by Date") +
  theme(axis.text.x = element_text(angle = 90))


#### Load Data Set ####

load("backups/df_f_0704.rda")
load("backups/df_f_0705.rda")
load("backups/df_f_0706.rda")
load("backups/df_f_0707.rda")
load("backups/df_f_0708.rda")
load("backups/df_f_0709.rda")
load("backups/df_f_0710.rda")
load("backups/df_f_0711.rda")
load("backups/df_f_0712.rda")
load("backups/df_f_0713.rda")
load("backups/df_f_0714.rda")
load("backups/df_f_0715.rda")
load("backups/df_f_0716.rda")
load("backups/df_f_0717.rda")
load("backups/df_f_0718.rda")
load("backups/df_f_0719.rda")
load("backups/df_f_0720.rda")
load("backups/df_f_0721.rda")
load("backups/df_f_0722.rda")
load("backups/df_f_0723.rda")


############################
##  2. Text Preprocessing ##
############################

library(tidyverse)
library(tidytext)
library(textclean)
library(tm)
library(qdap)

#### Set functions ####

qdap_clean <- function(x) {
  x <- replace_abbreviation(x)            　 # "Dr." → "Doctor"
  x <- replace_contraction(x)                # "can't" → "cannot"
  x <- replace_ordinal(x)                    # "1st" → "first"
  x <- gsub("\\d+", "", x)                   # Removal of numbers
  x <- tolower(x)                            # Lowercasing the characters
  x <- str_remove_all(x, "#\\S+") 　　　　　 # Removal of hashtags
  x <- str_remove_all(x, "@\\S+")  　　　　　# Removal of user mentions
  x <- replace_symbol(x)                     # "&" → "and"
  x <- str_remove_all(x, "http[s]?://\\S+")  # Removal of links
  x <- replace_emoji(x)                      # Emojis → Word forms equivalents
  return(x)
}

tm_clean <- function(corpus) {
  corpus <- tm_map(corpus, removePunctuation)  # Remove punctuation (句読点)
  corpus <- tm_map(corpus, removeWords, stopwords("en"))    # Remove stopwords
  # corpus <- tm_map(corpus, content_transformer(stemDocument))  # Stemming
  corpus <- tm_map(corpus, stripWhitespace)    # 余分な余白
  return(corpus)}

#### Create corpus ####

df_qdap_0704 <- qdap_clean(df_f_0704$text)
df_qdap_0705 <- qdap_clean(df_f_0705$text)
df_qdap_0706 <- qdap_clean(df_f_0706$text)
df_qdap_0707 <- qdap_clean(df_f_0707$text)
df_qdap_0708 <- qdap_clean(df_f_0708$text)
df_qdap_0709 <- qdap_clean(df_f_0709$text)
df_qdap_0710 <- qdap_clean(df_f_0710$text)
df_qdap_0711 <- qdap_clean(df_f_0711$text)
df_qdap_0712 <- qdap_clean(df_f_0712$text)
df_qdap_0713 <- qdap_clean(df_f_0713$text)
df_qdap_0714 <- qdap_clean(df_f_0714$text)
df_qdap_0715 <- qdap_clean(df_f_0715$text)
df_qdap_0716 <- qdap_clean(df_f_0716$text)
df_qdap_0717 <- qdap_clean(df_f_0717$text)
df_qdap_0718 <- qdap_clean(df_f_0718$text)
df_qdap_0719 <- qdap_clean(df_f_0719$text)
df_qdap_0720 <- qdap_clean(df_f_0720$text)
df_qdap_0721 <- qdap_clean(df_f_0721$text)
df_qdap_0722 <- qdap_clean(df_f_0722$text)
df_qdap_0723 <- qdap_clean(df_f_0723$text)

corp_0704 <- VCorpus(VectorSource(df_qdap_0704)) %>% tm_clean()
corp_0705 <- VCorpus(VectorSource(df_qdap_0705)) %>% tm_clean()
corp_0706 <- VCorpus(VectorSource(df_qdap_0706)) %>% tm_clean()
corp_0707 <- VCorpus(VectorSource(df_qdap_0707)) %>% tm_clean()
corp_0708 <- VCorpus(VectorSource(df_qdap_0708)) %>% tm_clean()
corp_0709 <- VCorpus(VectorSource(df_qdap_0709)) %>% tm_clean()
corp_0710 <- VCorpus(VectorSource(df_qdap_0710)) %>% tm_clean()
corp_0711 <- VCorpus(VectorSource(df_qdap_0711)) %>% tm_clean()
corp_0712 <- VCorpus(VectorSource(df_qdap_0712)) %>% tm_clean()
corp_0713 <- VCorpus(VectorSource(df_qdap_0713)) %>% tm_clean()
corp_0714 <- VCorpus(VectorSource(df_qdap_0714)) %>% tm_clean()
corp_0715 <- VCorpus(VectorSource(df_qdap_0715)) %>% tm_clean()
corp_0716 <- VCorpus(VectorSource(df_qdap_0716)) %>% tm_clean()
corp_0717 <- VCorpus(VectorSource(df_qdap_0717)) %>% tm_clean()
corp_0718 <- VCorpus(VectorSource(df_qdap_0718)) %>% tm_clean()
corp_0719 <- VCorpus(VectorSource(df_qdap_0719)) %>% tm_clean()
corp_0720 <- VCorpus(VectorSource(df_qdap_0720)) %>% tm_clean()
corp_0721 <- VCorpus(VectorSource(df_qdap_0721)) %>% tm_clean()
corp_0722 <- VCorpus(VectorSource(df_qdap_0722)) %>% tm_clean()
corp_0723 <- VCorpus(VectorSource(df_qdap_0723)) %>% tm_clean()

corp_all <- c(corp_0704, corp_0705, corp_0706, corp_0707, corp_0708, corp_0709,
              corp_0710, corp_0711, corp_0712, corp_0713, corp_0714, corp_0715,
              corp_0716, corp_0717, corp_0718, corp_0719, corp_0720, corp_0721,
              corp_0722, corp_0723)


#### Add clean texts to data frame ####
cleaned_0704 <- lapply(corp_0704, function(doc) doc$content)
df_f_0704$cleanedText <- cleaned_0704

cleaned_0705 <- lapply(corp_0705, function(doc) doc$content)
df_f_0705$cleaned_0705 <- cleaned_0705

cleaned_0706 <- lapply(corp_0706, function(doc) doc$content)
df_f_0706$cleaned_0706 <- cleaned_0706

cleaned_0707 <- lapply(corp_0707, function(doc) doc$content)
df_f_0707$cleaned_0707 <- cleaned_0707

cleaned_0708 <- lapply(corp_0708, function(doc) doc$content)
df_f_0708$cleaned_0708 <- cleaned_0708

cleaned_0709 <- lapply(corp_0709, function(doc) doc$content)
df_f_0709$cleaned_0709 <- cleaned_0709

cleaned_0710 <- lapply(corp_0710, function(doc) doc$content)
df_f_0710$cleaned_0710 <- cleaned_0710

cleaned_0711 <- lapply(corp_0711, function(doc) doc$content)
df_f_0711$cleaned_0711 <- cleaned_0711

cleaned_0712 <- lapply(corp_0712, function(doc) doc$content)
df_f_0712$cleaned_0712 <- cleaned_0712

cleaned_0713 <- lapply(corp_0713, function(doc) doc$content)
df_f_0713$cleaned_0713 <- cleaned_0713

cleaned_0714 <- lapply(corp_0714, function(doc) doc$content)
df_f_0714$cleaned_0714 <- cleaned_0714

cleaned_0715 <- lapply(corp_0715, function(doc) doc$content)
df_f_0715$cleaned_0715 <- cleaned_0715

cleaned_0716 <- lapply(corp_0716, function(doc) doc$content)
df_f_0716$cleaned_0716 <- cleaned_0716

cleaned_0717 <- lapply(corp_0717, function(doc) doc$content)
df_f_0717$cleaned_0717 <- cleaned_0717

cleaned_0718 <- lapply(corp_0718, function(doc) doc$content)
df_f_0718$cleaned_0718 <- cleaned_0718

cleaned_0719 <- lapply(corp_0719, function(doc) doc$content)
df_f_0719$cleaned_0719 <- cleaned_0719

cleaned_0720 <- lapply(corp_0720, function(doc) doc$content)
df_f_0720$cleaned_0720 <- cleaned_0720

cleaned_0721 <- lapply(corp_0721, function(doc) doc$content)
df_f_0721$cleaned_0721 <- cleaned_0721

cleaned_0722 <- lapply(corp_0722, function(doc) doc$content)
df_f_0722$cleaned_0722 <- cleaned_0722

cleaned_0723 <- lapply(corp_0723, function(doc) doc$content)
df_f_0723$cleaned_0723 <- cleaned_0723

df_f_0704$text[25]
df_qdap_0704[25]
df_f_0704$cleaned_text[25]

#### LDA ####
dtm_all <- DocumentTermMatrix(corp_all)
