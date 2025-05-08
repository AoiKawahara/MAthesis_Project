###########################################
##  Master's Thesis Code - Aoi Kawahara  ##
###########################################

##########################
##  1. Data Collection  ##
##########################

setwd('/Users/aoikawahara/Library/CloudStorage/OneDrive-KULeuven/Leuven/01_Master Thesis/Workplace')

library(dplyr)
library(scales)

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
  scale_y_continuous(labels = comma) +
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

setnames(df_f_0705, "cleaned_0705", "cleanedText")
setnames(df_f_0706, "cleaned_0706", "cleanedText")
setnames(df_f_0707, "cleaned_0707", "cleanedText")
setnames(df_f_0708, "cleaned_0708", "cleanedText")
setnames(df_f_0709, "cleaned_0709", "cleanedText")
setnames(df_f_0710, "cleaned_0710", "cleanedText")
setnames(df_f_0711, "cleaned_0711", "cleanedText")
setnames(df_f_0712, "cleaned_0712", "cleanedText")
setnames(df_f_0713, "cleaned_0713", "cleanedText")
setnames(df_f_0714, "cleaned_0714", "cleanedText")
setnames(df_f_0715, "cleaned_0715", "cleanedText")
setnames(df_f_0716, "cleaned_0716", "cleanedText")
setnames(df_f_0717, "cleaned_0717", "cleanedText")
setnames(df_f_0718, "cleaned_0718", "cleanedText")
setnames(df_f_0719, "cleaned_0719", "cleanedText")
setnames(df_f_0720, "cleaned_0720", "cleanedText")
setnames(df_f_0721, "cleaned_0721", "cleanedText")
setnames(df_f_0722, "cleaned_0722", "cleanedText")
setnames(df_f_0723, "cleaned_0723", "cleanedText")




#############################
##  2. Text Preprocessing  ##
#############################

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

save(corp_all, file = "backups/corp_all.rda")
rm(corp_all)

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

df_f_0704$text[64]
# "THE PROBLIM WITH MAGA-TRUMPISM:\n\"\"Conspiracies, entrapment, assaults, false imprisonments are part of warfare. USA citizens did not realize that white America was the enemy. Blacks, Indians and Chicanos have known for a long time the open warfare against their existence.\"\" BRUSSELL https://t.co/vhICZ0z9ue"
df_qdap_0704[64]
# "the problim with maga-trumpism: conspiracies, entrapment, assaults, false imprisonments are part of warfare. usa citizens did not realize that white america was the enemy. blacks, indians and chicanos have known for a long time the open warfare against their existence. brussell "
df_f_0704$cleanedText[64]
# "problim magatrumpism conspiracies entrapment assaults false imprisonments part warfare usa citizens realize white america enemy blacks indians chicanos known long time open warfare existence brussell "

save(df_qdap_0704, file = "backups/df_qdap_0704.rda")
save(df_qdap_0705, file = "backups/df_qdap_0705.rda")
save(df_qdap_0706, file = "backups/df_qdap_0706.rda")
save(df_qdap_0707, file = "backups/df_qdap_0707.rda")
save(df_qdap_0708, file = "backups/df_qdap_0708.rda")
save(df_qdap_0709, file = "backups/df_qdap_0709.rda")
save(df_qdap_0710, file = "backups/df_qdap_0710.rda")
save(df_qdap_0711, file = "backups/df_qdap_0711.rda")
save(df_qdap_0712, file = "backups/df_qdap_0712.rda")
save(df_qdap_0713, file = "backups/df_qdap_0713.rda")
save(df_qdap_0714, file = "backups/df_qdap_0714.rda")
save(df_qdap_0715, file = "backups/df_qdap_0715.rda")
save(df_qdap_0716, file = "backups/df_qdap_0716.rda")
save(df_qdap_0717, file = "backups/df_qdap_0717.rda")
save(df_qdap_0718, file = "backups/df_qdap_0718.rda")
save(df_qdap_0719, file = "backups/df_qdap_0719.rda")
save(df_qdap_0720, file = "backups/df_qdap_0720.rda")
save(df_qdap_0721, file = "backups/df_qdap_0721.rda")
save(df_qdap_0722, file = "backups/df_qdap_0722.rda")
save(df_qdap_0723, file = "backups/df_qdap_0723.rda")

rm(df_qdap_0704)
rm(df_qdap_0705)
rm(df_qdap_0706)
rm(df_qdap_0707)
rm(df_qdap_0708)
rm(df_qdap_0709)
rm(df_qdap_0710)
rm(df_qdap_0711)
rm(df_qdap_0712)
rm(df_qdap_0713)
rm(df_qdap_0714)
rm(df_qdap_0715)
rm(df_qdap_0716)
rm(df_qdap_0717)
rm(df_qdap_0718)
rm(df_qdap_0719)
rm(df_qdap_0720)
rm(df_qdap_0721)
rm(df_qdap_0722)
rm(df_qdap_0723)

save(corp_0704, file = "backups/corp_0704.rda")
save(corp_0705, file = "backups/corp_0705.rda")
save(corp_0706, file = "backups/corp_0706.rda")
save(corp_0707, file = "backups/corp_0707.rda")
save(corp_0708, file = "backups/corp_0708.rda")
save(corp_0709, file = "backups/corp_0709.rda")
save(corp_0710, file = "backups/corp_0710.rda")
save(corp_0711, file = "backups/corp_0711.rda")
save(corp_0712, file = "backups/corp_0712.rda")
save(corp_0713, file = "backups/corp_0713.rda")
save(corp_0714, file = "backups/corp_0714.rda")
save(corp_0715, file = "backups/corp_0715.rda")
save(corp_0716, file = "backups/corp_0716.rda")
save(corp_0717, file = "backups/corp_0717.rda")
save(corp_0718, file = "backups/corp_0718.rda")
save(corp_0719, file = "backups/corp_0719.rda")
save(corp_0720, file = "backups/corp_0720.rda")
save(corp_0721, file = "backups/corp_0721.rda")
save(corp_0722, file = "backups/corp_0722.rda")
save(corp_0723, file = "backups/corp_0723.rda")

rm(corp_0704)
rm(corp_0705)
rm(corp_0706)
rm(corp_0707)
rm(corp_0708)
rm(corp_0709)
rm(corp_0710)
rm(corp_0711)
rm(corp_0712)
rm(corp_0713)
rm(corp_0714)
rm(corp_0715)
rm(corp_0716)
rm(corp_0717)
rm(corp_0718)
rm(corp_0719)
rm(corp_0720)
rm(corp_0721)
rm(corp_0722)
rm(corp_0723)



#### EDA ####


################
##   3. LDA   ##
################

library(slam)
library(tokenizers)
library(topicmodels)
library(topicdoc)
library(text2vec)
library(Matrix)

library(wordcloud)

#### Coherence Values ####

# Create sample data frame

df_sample_0704 <- df_f_0704 %>% slice_sample(n = 100)
df_sample_0705 <- df_f_0705 %>% slice_sample(n = 100)
df_sample_0706 <- df_f_0706 %>% slice_sample(n = 100)
df_sample_0707 <- df_f_0707 %>% slice_sample(n = 100)
df_sample_0708 <- df_f_0708 %>% slice_sample(n = 100)
df_sample_0709 <- df_f_0709 %>% slice_sample(n = 100)
df_sample_0710 <- df_f_0710 %>% slice_sample(n = 100)
df_sample_0711 <- df_f_0711 %>% slice_sample(n = 100)
df_sample_0712 <- df_f_0712 %>% slice_sample(n = 100)
df_sample_0713 <- df_f_0713 %>% slice_sample(n = 100)
df_sample_0714 <- df_f_0714 %>% slice_sample(n = 100)
df_sample_0715 <- df_f_0715 %>% slice_sample(n = 100)
df_sample_0716 <- df_f_0716 %>% slice_sample(n = 100)
df_sample_0717 <- df_f_0717 %>% slice_sample(n = 100)
df_sample_0718 <- df_f_0718 %>% slice_sample(n = 100)
df_sample_0719 <- df_f_0719 %>% slice_sample(n = 100)
df_sample_0720 <- df_f_0720 %>% slice_sample(n = 100)
df_sample_0721 <- df_f_0721 %>% slice_sample(n = 100)
df_sample_0722 <- df_f_0722 %>% slice_sample(n = 100)
df_sample_0723 <- df_f_0723 %>% slice_sample(n = 100)

df_sample <- bind_rows(df_sample_0704, df_sample_0705, df_sample_0706, df_sample_0707, df_sample_0708, df_sample_0709, df_sample_0710, df_sample_0711, df_sample_0712, df_sample_0713, df_sample_0714, df_sample_0715, df_sample_0716, df_sample_0717, df_sample_0718, df_sample_0719, df_sample_0720, df_sample_0721, df_sample_0722, df_sample_0723)

df_sample <- df_sample %>%
  filter(str_trim(cleanedText) != "")

sample_tokens <- df_sample %>% unnest_tokens(term, cleanedText)
sample_corpus <- Corpus(VectorSource(df_sample$cleanedText))
sample_dtm <- DocumentTermMatrix(sample_corpus)

# Compute coherence values
compute_coherence_values <- function(sample_dtm, sample_tokens, k_min = 3, k_max = 20, step = 1, seed = 1234) {
  k_list <- seq(k_min, k_max, by = step)
  coherence_values <- c()
  lda_models <- list()
  
  for (k in k_list) {
    cat("Training LDA with", k, "topics...\n")
    
    lda_model <- LDA(sample_dtm, control = list(seed = 33), k = k)
    lda_models[[as.character(k)]] <- lda_model
    
    diagnostics <- topic_diagnostics(lda_model, sample_dtm)
    coherence <- mean(diagnostics$topic_coherence)
    coherence_values <- c(coherence_values, coherence)
    
    }
  return(list(models = lda_models, coherence = coherence_values, k = k_list))
}

result <- compute_coherence_values(sample_dtm, sample_tokens, k_min = 3, k_max = 20)
save(result, file = "backups/result.rda")

coherence_data <- data.frame(k = result$k, coherence = result$coherence)

ggplot(coherence_data, aes(x = k, y = coherence)) +
  geom_line() +
  geom_point() +
  labs(title = "Coherence vs. Number of Topics", x = "Number of Topics (k)", y = "Coherence Score") +
  theme_minimal()

## Decided 4 topics

#### 0.05-0.95? ####
term_freqs <- col_sums(dtm_all)

df_term_freq <- as.data.frame(table(term_freqs))
colnames(df_term_freq) <- c("frequency", "num_terms")
df_term_freq$frequency <- as.numeric(df_term_freq$frequency)

ggplot(df_term_freq, aes(x = frequency, y = num_terms)) +
  geom_line(color = "tomato", linewidth = 1) +
  labs(title = "Term Frequency Line Plot",
       x = "Term Frequency",
       y = "Number of Terms") +
  xlim(0,55) +
  theme_minimal()

# Terms that appear more than 2 times and less than 50 times
selected_terms <- names(term_freqs[term_freqs > 2 & term_freqs < quantile(term_freqs, 0.95)])
dtm_filtered <- dtm_all[, selected_terms]

# こんなに削ったら、topicが割り当てられないpostが出てきそう。

#### Text Preprocessing for All Corpus ####

df_f_all <- bind_rows(df_f_0704, df_f_0705, df_f_0706, df_f_0707, df_f_0708, df_f_0709, df_f_0710, df_f_0711, df_f_0712, df_f_0713, df_f_0714, df_f_0715, df_f_0716, df_f_0717, df_f_0718, df_f_0719, df_f_0720, df_f_0721, df_f_0722, df_f_0723)
df_f_all <- df_f_all %>%
  mutate(id = row_number())
# 3164058

df_f_all <- df_f_all %>% filter(str_trim(cleanedText) != "")
# 3164058

df_f_all <- subset(df_f_all, !(is.na(df_f_all$cleanedText)))
# 3161348

table(is.na(df_f_all$cleanedText))  # FALSE for all the doc

# tokens <- df_f_all %>% unnest_tokens(term, cleanedText)
corp_f_all <- corp_all[df_f_all$id]

# dtm_all <- DocumentTermMatrix(corp_all)
# save(dtm_all, file = "backups/dtm_all.rda")

dtm_f_all <- DocumentTermMatrix(corp_f_all, control = list(wordLengths=c(1, Inf)))

#### LDA & Dominant Topics ####
LDA4 <- LDA(dtm_f_all, control = list(seed = 33), k = 4)
save(LDA4, file = "backups/LDA4.rda")

top_terms <- terms(LDA4, 20)
top_terms$

dominant_topics <- get_topics(LDA4)
dominant_topics

dominant_topics_df <- as.data.frame(dominant_topics)
gamma_df <- as.data.frame(LDA4@gamma)

df_ff_all <- bind_cols(df_f_all, dominant_topics_df, gamma_df)
df_ff_all <- df_ff_all %>% rename("topic1" = V1) %>% rename("topic2" = V2) %>% rename("topic3" = V3) %>% rename("topic4" = V4)

save(df_ff_all, file = "backups/df_ff_all.rda")

#### EDA ####

word_counts <- slam::col_sums(dtm_f_all)
top100_freq_df <- data.frame(term = names(word_counts), freq = word_counts) %>%
  arrange(desc(freq)) %>%
  slice_head(n = 100)

wordcloud(words = top100_freq_df$term, freq = word_freq_df$freq,
          min.freq = 1, max.words = 100,
          random.order = FALSE)

top30_freq_df <- word_freq_df %>%
  slice_head(n = 30)

ggplot(top30_freq_df, aes(x = reorder(term, freq), y = freq)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  coord_flip() +
  labs(title = "Top 30 Word Frequency Distribution", x = "Words", y = "Frequency") +
  theme_minimal()


df_ff_all_n22 <- df_ff_all %>% filter(date != '2024-07-22')

summary(df_ff_all$topic1)
#  Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
#  0.0912  0.2476  0.2500  0.2500  0.2525  0.5751

summary(df_ff_all$topic2)
#  Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
#  0.1035  0.2474  0.2498  0.2500  0.2523  0.6408

summary(df_ff_all$topic3)
#  Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
#  0.1159  0.2473  0.2498  0.2500  0.2523  0.6567

summary(df_ff_all$topic4)
#  Min. 1st Qu.  Median    Mean 3rd Qu.    Max.
#  0.09588 0.24742 0.24975 0.25000 0.25228 0.68883

# Document Count per Dominant Topic (All Time)
dominant_topic_df <- as.data.frame(table(df_ff_all$dominant_topics))
colnames(dominant_topic_df) <- c("Topic", "Count")

ggplot(dominant_topic_df, aes(x = factor(Topic), y = Count, fill = factor(Topic))) +
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = comma) +
  labs(title = "Document Count per Dominant Topic", x = "Topic", y = "Number of Documents") +
  theme_minimal() +
  theme(legend.position = "none")

dominant_topic_df <- as.data.frame(table(df_ff_all_n22$dominant_topics))
colnames(dominant_topic_df) <- c("Topic", "Count")

# Topic Trends Over Time (Percentage)
topic_by_date <- df_ff_all %>%
  group_by(date, dominant_topics) %>%
  summarise(count = n(), .groups = "drop")

topic_by_date <- df_ff_all_n22 %>%
  group_by(date, dominant_topics) %>%
  summarise(count = n(), .groups = "drop")

topic_by_date <- topic_by_date %>%
  group_by(date) %>%
  mutate(total_posts = sum(count), percentage = count / total_posts) %>%
  ungroup()

ggplot(topic_by_date, aes(x = date, y = percentage, color = factor(dominant_topics))) +
  geom_line() +
  labs(title = "Topic Trends Over Time (Percentage)", x = "Date", y = "Percentage of Posts", color = "Topic") +
  scale_x_date(date_breaks = "1 day", date_labels = "%d") +
  theme_minimal() +
  theme(legend.position = "bottom")

# Linear Specification
# lm_topic1 <- lm(percentage ~ date, data = topic_by_date)
# summary(lm_topic1)

# ggplot(topic_by_date, aes(x = date, y = percentage, color = factor(dominant_topics))) +
#   geom_smooth(method = "lm", se = FALSE) +
#   labs(title = "Topic Trends Over Time (Regression)") +
#   scale_x_date(date_breaks = "1 day", date_labels = "%d") +
#   theme_minimal()

# Averages Likes per Topic Over Time
topic_likes <- df_ff_all %>%
  group_by(date, dominant_topics) %>%
  summarise(mean_likes = mean(as.integer(likeCount))) %>% 
  ungroup()

topic_likes <- df_ff_all_n22 %>%
  group_by(date, dominant_topics) %>%
  summarise(mean_likes = mean(as.integer(likeCount))) %>% 
  ungroup()

ggplot(topic_likes, aes(x = date, y = mean_likes, color = factor(dominant_topics))) +
  geom_line() +
  labs(title = "Averages Likes per Topic Over Time", x = "Date", y = "Average Like Counts", color = "Topic") +
  theme_minimal()

#### Topic vs Engagement ####
df_ff_all$logLikeCount <- log(as.numeric(df_ff_all$likeCount) + 1)

ggplot(df_ff_all, aes(x = factor(dominant_topics), y = log(as.numeric(likeCount) + 1))) +
  geom_boxplot(fill = "skyblue") +
  labs(title = "Distribution of Like Counts by Dominant Topic", x = "Dominant Topic", y = "Like Count") +
  theme_minimal()

df_ff_all <- df_ff_all %>%
  mutate(like_category = case_when(
    as.numeric(likeCount) == 0 ~ "0",
    as.numeric(likeCount) <= 10 ~ "1-10",
    as.numeric(likeCount) <= 100 ~ "11-100",
    as.numeric(likeCount) <= 1000 ~ "101-1000",
    TRUE ~ "1000+"))
df_ff_all$like_category <- factor(df_ff_all$like_category, levels = c("0", "1-10", "11-100", "101-1000", "1000+"))

table(df_ff_all$like_category)
# 0     1-10    1000+ 101-1000   11-100 
# 1737914  1056017    29476    88476   249465

ggplot(df_ff_all, aes(x = factor(dominant_topics), fill = like_category)) +
  geom_bar(position = "fill") +
  labs(title = "Proportion of Like Counts by Topic", x = "Dominant Topic", y = "Proportion", fill = "Like Category") +
  theme_minimal()

df_topic_likes <- df_ff_all_n22 %>%
  group_by(date, dominant_topics) %>%
  summarise(mean_likes = mean(as.numeric(likeCount))) %>%
  ungroup()

ggplot(df_topic_likes, aes(x = date, y = mean_likes, color = factor(dominant_topics))) +
  geom_line() +
  labs(title = "Mean Like Count by Topic over Time", x = "Date", y = "Mean Likes", color = "Dominant Topic") +
  scale_x_date(date_breaks = "1 day", date_labels = "%d") +
  theme_minimal() +
  theme(legend.position = "bottom")
  
df_ff_all_T1 <- df_ff_all %>%
  filter(dominant_topics == 1)

ggplot(df_ff_all_T1, aes(x = date, fill = like_category)) +
  geom_bar(position = "fill") +
  labs(title = "Boxplot of Like Count (log scale) for Topic 1 by Date", x = "Date", y = "Log(Like Count + 1)") +
  scale_x_date(date_breaks = "1 day", date_labels = "%d") +
  theme_minimal()



#############################
##  4. Sentiment Analysis  ##
#############################

library(vader)
library(wordcloud)

#### Trial on Sample Data Frame ####

# 1. Define the Aspects
aspects <- list(Biden = c("biden", "joe", "democrats", "democrat"),
                Trump = c("trump", "donald", "gop",  "maga", "rnc", "trumps", "blue", "conservative"),
                Assassination = c("assassination", "attempt"))

# 2. Define the ASBA function
get_aspect_sentiment <- function(text) {
  aspect_sentiments <- tibble(aspect = character(),
                              compound = double(),
                              pos = double(),
                              neu = double(),
                              neg = double(),
                              words = list())
  
  for (aspect in names(aspects)) {
    keywords <- aspects[[aspect]]
    aspect_sentences <- text[grepl(paste(keywords, collapse = "|"), text, ignore.case = TRUE)]
    
    if (length(aspect_sentences) > 0) {
      sentiment <- as.list(get_vader(paste(aspect_sentences, collapse = ". ")))
      words_list <- list(strsplit(paste(aspect_sentences, collapse = " "), " ")[[1]])
      
      if (all(c("compound", "pos", "neu", "neg") %in% names(sentiment))) {
        aspect_sentiments <- aspect_sentiments %>%
          add_row(aspect = aspect,
                  compound = as.numeric(sentiment$compound),
                  pos = as.numeric(sentiment$pos),
                  neu = as.numeric(sentiment$neu),
                  neg = as.numeric(sentiment$neg),
                  words = words_list)}}}
  return(aspect_sentiments)}

# 3. Apply the Function
aspect_sentiments <- df_sample %>%
  rowwise() %>%
  mutate(aspect_sentiment = list({cat("Processing row:", cur_group_id(), "\n")
    get_aspect_sentiment(cleanedText)})) %>%
  unnest(aspect_sentiment)

head(df_sample$cleanedText)

# 4. Display results table
aspect_summary <- aspect_sentiments %>%
  group_by(aspect) %>%
  summarise(avg_compound = mean(compound, na.rm = TRUE),
            avg_pos = mean(pos, na.rm = TRUE),
            avg_neu = mean(neu, na.rm = TRUE),
            avg_neg = mean(neg, na.rm = TRUE),
            count = n())

#### 0704 ####
ABSA_0704 <- df_f_0704 %>%
  rowwise() %>%
  mutate(aspect_sentiment = list({cat("Processing row:", cur_group_id(), "\n")
    get_aspect_sentiment(cleanedText)})) %>%
  unnest(aspect_sentiment)
save(ABSA_0704, file = "ABSA_0704.rda")

ABSA_0704_summary <- ABSA_0704 %>%
  group_by(aspect) %>%
  summarise(avg_compound = mean(compound, na.rm = TRUE),
            avg_pos = mean(pos, na.rm = TRUE),
            avg_neu = mean(neu, na.rm = TRUE),
            avg_neg = mean(neg, na.rm = TRUE),
            count = n())

#### 0705 ####
ABSA_0705 <- df_f_0705 %>%
  rowwise() %>%
  mutate(aspect_sentiment = list({cat("Processing row:", cur_group_id(), "\n")
    get_aspect_sentiment(cleanedText)})) %>%
  unnest(aspect_sentiment)
save(ABSA_0705, file = "ABSA_0705.rda")

ABSA_0705_summary <- ABSA_0705 %>%
  group_by(aspect) %>%
  summarise(avg_compound = mean(compound, na.rm = TRUE),
            avg_pos = mean(pos, na.rm = TRUE),
            avg_neu = mean(neu, na.rm = TRUE),
            avg_neg = mean(neg, na.rm = TRUE),
            count = n())

#### 0706 ####
ABSA_0706 <- df_f_0706 %>%
  rowwise() %>%
  mutate(aspect_sentiment = list({cat("Processing row:", cur_group_id(), "\n")
    get_aspect_sentiment(cleanedText)})) %>%
  unnest(aspect_sentiment)
save(ABSA_0706, file = "ABSA_0706.rda")

ABSA_0706_summary <- ABSA_0706 %>%
  group_by(aspect) %>%
  summarise(avg_compound = mean(compound, na.rm = TRUE),
            avg_pos = mean(pos, na.rm = TRUE),
            avg_neu = mean(neu, na.rm = TRUE),
            avg_neg = mean(neg, na.rm = TRUE),
            count = n())

#### 0707 ####
ABSA_0707 <- df_f_0707 %>%
  rowwise() %>%
  mutate(aspect_sentiment = list({cat("Processing row:", cur_group_id(), "\n")
    get_aspect_sentiment(cleanedText)})) %>%
  unnest(aspect_sentiment)
save(ABSA_0707, file = "ABSA_0707.rda")

ABSA_0707_summary <- ABSA_0707 %>%
  group_by(aspect) %>%
  summarise(avg_compound = mean(compound, na.rm = TRUE),
            avg_pos = mean(pos, na.rm = TRUE),
            avg_neu = mean(neu, na.rm = TRUE),
            avg_neg = mean(neg, na.rm = TRUE),
            count = n())

#### 0708 ####
ABSA_0708 <- df_f_0708 %>%
  rowwise() %>%
  mutate(aspect_sentiment = list({cat("Processing row:", cur_group_id(), "\n")
    get_aspect_sentiment(cleanedText)})) %>%
  unnest(aspect_sentiment)
save(ABSA_0708, file = "ABSA_0708.rda")
beep()

ABSA_0708_summary <- ABSA_0708 %>%
  group_by(aspect) %>%
  summarise(avg_compound = mean(compound, na.rm = TRUE),
            avg_pos = mean(pos, na.rm = TRUE),
            avg_neu = mean(neu, na.rm = TRUE),
            avg_neg = mean(neg, na.rm = TRUE),
            count = n())

#### 0709 ####
ABSA_0709 <- df_f_0709 %>%
  rowwise() %>%
  mutate(aspect_sentiment = list({cat("Processing row:", cur_group_id(), "\n")
    get_aspect_sentiment(cleanedText)})) %>%
  unnest(aspect_sentiment)
save(ABSA_0709, file = "backups/ABSA_0709.rda")

ABSA_0709_summary <- ABSA_0709 %>%
  group_by(aspect) %>%
  summarise(avg_compound = mean(compound, na.rm = TRUE),
            avg_pos = mean(pos, na.rm = TRUE),
            avg_neu = mean(neu, na.rm = TRUE),
            avg_neg = mean(neg, na.rm = TRUE),
            count = n())

#### 0710 ####
ABSA_0710 <- df_f_0710 %>%
  rowwise() %>%
  mutate(aspect_sentiment = list({cat("Processing row:", cur_group_id(), "\n")
    get_aspect_sentiment(cleanedText)})) %>%
  unnest(aspect_sentiment)
save(ABSA_0710, file = "backups/ABSA_0710.rda")

ABSA_0710_summary <- ABSA_0710 %>%
  group_by(aspect) %>%
  summarise(avg_compound = mean(compound, na.rm = TRUE),
            avg_pos = mean(pos, na.rm = TRUE),
            avg_neu = mean(neu, na.rm = TRUE),
            avg_neg = mean(neg, na.rm = TRUE),
            count = n())

#### 0711 ####
ABSA_0711 <- df_f_0711 %>%
  rowwise() %>%
  mutate(aspect_sentiment = list({cat("Processing row:", cur_group_id(), "\n")
    get_aspect_sentiment(cleanedText)})) %>%
  unnest(aspect_sentiment)
save(ABSA_0711, file = "backups/ABSA_0711.rda")

ABSA_0711_summary <- ABSA_0711 %>%
  group_by(aspect) %>%
  summarise(avg_compound = mean(compound, na.rm = TRUE),
            avg_pos = mean(pos, na.rm = TRUE),
            avg_neu = mean(neu, na.rm = TRUE),
            avg_neg = mean(neg, na.rm = TRUE),
            count = n())

#### 0712 ####
ABSA_0712 <- df_f_0712 %>%
  rowwise() %>%
  mutate(aspect_sentiment = list({cat("Processing row:", cur_group_id(), "\n")
    get_aspect_sentiment(cleanedText)})) %>%
  unnest(aspect_sentiment)
save(ABSA_0712, file = "backups/ABSA_0712.rda")

ABSA_0712_summary <- ABSA_0712 %>%
  group_by(aspect) %>%
  summarise(avg_compound = mean(compound, na.rm = TRUE),
            avg_pos = mean(pos, na.rm = TRUE),
            avg_neu = mean(neu, na.rm = TRUE),
            avg_neg = mean(neg, na.rm = TRUE),
            count = n())

#### 0713 ####
ABSA_0713 <- df_f_0713 %>%
  rowwise() %>%
  mutate(aspect_sentiment = list({cat("Processing row:", cur_group_id(), "\n")
    get_aspect_sentiment(cleanedText)})) %>%
  unnest(aspect_sentiment)
save(ABSA_0713, file = "backups/ABSA_0713.rda")

ABSA_0713_summary <- ABSA_0713 %>%
  group_by(aspect) %>%
  summarise(avg_compound = mean(compound, na.rm = TRUE),
            avg_pos = mean(pos, na.rm = TRUE),
            avg_neu = mean(neu, na.rm = TRUE),
            avg_neg = mean(neg, na.rm = TRUE),
            count = n())

#### 0714 ####
ABSA_0714 <- df_f_0714 %>%
  rowwise() %>%
  mutate(aspect_sentiment = list({cat("Processing row:", cur_group_id(), "\n")
    get_aspect_sentiment(cleanedText)})) %>%
  unnest(aspect_sentiment)
save(ABSA_0714, file = "backups/ABSA_0714.rda")

ABSA_0714_summary <- ABSA_0714 %>%
  group_by(aspect) %>%
  summarise(avg_compound = mean(compound, na.rm = TRUE),
            avg_pos = mean(pos, na.rm = TRUE),
            avg_neu = mean(neu, na.rm = TRUE),
            avg_neg = mean(neg, na.rm = TRUE),
            count = n())

#### 0715 ####
ABSA_0715 <- df_f_0715 %>%
  rowwise() %>%
  mutate(aspect_sentiment = list({cat("Processing row:", cur_group_id(), "\n")
    get_aspect_sentiment(cleanedText)})) %>%
  unnest(aspect_sentiment)
save(ABSA_0715, file = "backups/ABSA_0715.rda")

ABSA_0715_summary <- ABSA_0715 %>%
  group_by(aspect) %>%
  summarise(avg_compound = mean(compound, na.rm = TRUE),
            avg_pos = mean(pos, na.rm = TRUE),
            avg_neu = mean(neu, na.rm = TRUE),
            avg_neg = mean(neg, na.rm = TRUE),
            count = n())

#### 0716 ####
ABSA_0716 <- df_f_0716 %>%
  rowwise() %>%
  mutate(aspect_sentiment = list({cat("Processing row:", cur_group_id(), "\n")
    get_aspect_sentiment(cleanedText)})) %>%
  unnest(aspect_sentiment)
save(ABSA_0716, file = "backups/ABSA_0716.rda")

ABSA_0716_summary <- ABSA_0716 %>%
  group_by(aspect) %>%
  summarise(avg_compound = mean(compound, na.rm = TRUE),
            avg_pos = mean(pos, na.rm = TRUE),
            avg_neu = mean(neu, na.rm = TRUE),
            avg_neg = mean(neg, na.rm = TRUE),
            count = n())

#### 0717 ####
ABSA_0717 <- df_f_0717 %>%
  rowwise() %>%
  mutate(aspect_sentiment = list({cat("Processing row:", cur_group_id(), "\n")
    get_aspect_sentiment(cleanedText)})) %>%
  unnest(aspect_sentiment)
save(ABSA_0717, file = "backups/ABSA_0717.rda")

ABSA_0717_summary <- ABSA_0717 %>%
  group_by(aspect) %>%
  summarise(avg_compound = mean(compound, na.rm = TRUE),
            avg_pos = mean(pos, na.rm = TRUE),
            avg_neu = mean(neu, na.rm = TRUE),
            avg_neg = mean(neg, na.rm = TRUE),
            count = n())

#### 0718 ####
ABSA_0718 <- df_f_0718 %>%
  rowwise() %>%
  mutate(aspect_sentiment = list({cat("Processing row:", cur_group_id(), "\n")
    get_aspect_sentiment(cleanedText)})) %>%
  unnest(aspect_sentiment)
save(ABSA_0718, file = "backups/ABSA_0718.rda")

ABSA_0718_summary <- ABSA_0718 %>%
  group_by(aspect) %>%
  summarise(avg_compound = mean(compound, na.rm = TRUE),
            avg_pos = mean(pos, na.rm = TRUE),
            avg_neu = mean(neu, na.rm = TRUE),
            avg_neg = mean(neg, na.rm = TRUE),
            count = n())

#### 0719 ####
ABSA_0719 <- df_f_0719 %>%
  rowwise() %>%
  mutate(aspect_sentiment = list({cat("Processing row:", cur_group_id(), "\n")
    get_aspect_sentiment(cleanedText)})) %>%
  unnest(aspect_sentiment)
save(ABSA_0719, file = "backups/ABSA_0719.rda")

ABSA_0719_summary <- ABSA_0719 %>%
  group_by(aspect) %>%
  summarise(avg_compound = mean(compound, na.rm = TRUE),
            avg_pos = mean(pos, na.rm = TRUE),
            avg_neu = mean(neu, na.rm = TRUE),
            avg_neg = mean(neg, na.rm = TRUE),
            count = n())

#### 0720 ####
ABSA_0720 <- df_f_0720 %>%
  rowwise() %>%
  mutate(aspect_sentiment = list({cat("Processing row:", cur_group_id(), "\n")
    get_aspect_sentiment(cleanedText)})) %>%
  unnest(aspect_sentiment)
save(ABSA_0720, file = "backups/ABSA_0720.rda")

ABSA_0720_summary <- ABSA_0720 %>%
  group_by(aspect) %>%
  summarise(avg_compound = mean(compound, na.rm = TRUE),
            avg_pos = mean(pos, na.rm = TRUE),
            avg_neu = mean(neu, na.rm = TRUE),
            avg_neg = mean(neg, na.rm = TRUE),
            count = n())

#### 0721 ####
ABSA_0721 <- df_f_0721 %>%
  rowwise() %>%
  mutate(aspect_sentiment = list({cat("Processing row:", cur_group_id(), "\n")
    get_aspect_sentiment(cleanedText)})) %>%
  unnest(aspect_sentiment)
save(ABSA_0721, file = "backups/ABSA_0721.rda")

ABSA_0721_summary <- ABSA_0721 %>%
  group_by(aspect) %>%
  summarise(avg_compound = mean(compound, na.rm = TRUE),
            avg_pos = mean(pos, na.rm = TRUE),
            avg_neu = mean(neu, na.rm = TRUE),
            avg_neg = mean(neg, na.rm = TRUE),
            count = n())

#### 0721 ####
ABSA_0722 <- df_f_0722 %>%
  rowwise() %>%
  mutate(aspect_sentiment = list({cat("Processing row:", cur_group_id(), "\n")
    get_aspect_sentiment(cleanedText)})) %>%
  unnest(aspect_sentiment)
save(ABSA_0722, file = "backups/ABSA_0722.rda")

ABSA_0722_summary <- ABSA_0722 %>%
  group_by(aspect) %>%
  summarise(avg_compound = mean(compound, na.rm = TRUE),
            avg_pos = mean(pos, na.rm = TRUE),
            avg_neu = mean(neu, na.rm = TRUE),
            avg_neg = mean(neg, na.rm = TRUE),
            count = n())

#### 0723 ####
ABSA_0723 <- df_f_0723 %>%
  rowwise() %>%
  mutate(aspect_sentiment = list({cat("Processing row:", cur_group_id(), "\n")
    get_aspect_sentiment(cleanedText)})) %>%
  unnest(aspect_sentiment)
save(ABSA_0723, file = "backups/ABSA_0723.rda")

ABSA_0723_summary <- ABSA_0723 %>%
  group_by(aspect) %>%
  summarise(avg_compound = mean(compound, na.rm = TRUE),
            avg_pos = mean(pos, na.rm = TRUE),
            avg_neu = mean(neu, na.rm = TRUE),
            avg_neg = mean(neg, na.rm = TRUE),
            count = n())


#### ABSA summary organized by Aspects ####
dates <- sprintf("070%s", 4:9)
dates <- c(dates, sprintf("071%s", 0:9))
dates <- c(dates, "0720", "0721", "0723")

ABSA_Assassination_Summary <- purrr::map_dfr(
  dates,
  function(d) {
    df_name <- paste0("ABSA_", d, "_summary")
    df <- get(df_name)
    df <- df[df$aspect == "Assassination", ]
    df$date <- as.Date(paste0("2024-", substr(d, 1, 2), "-", substr(d, 3, 4)))
    return(df)})

ABSA_Trump_Summary <- purrr::map_dfr(
  dates,
  function(d) {
    df_name <- paste0("ABSA_", d, "_summary")
    df <- get(df_name)
    df <- df[df$aspect == "Trump", ]
    df$date <- as.Date(paste0("2024-", substr(d, 1, 2), "-", substr(d, 3, 4)))
    return(df)})

ABSA_Biden_Summary <- purrr::map_dfr(
  dates,
  function(d) {
    df_name <- paste0("ABSA_", d, "_summary")
    df <- get(df_name)
    df <- df[df$aspect == "Biden", ]
    df$date <- as.Date(paste0("2024-", substr(d, 1, 2), "-", substr(d, 3, 4)))
    return(df)})

#### EDA ####

ggplot(ABSA_Assassination_Summary, aes(x = date)) +
  geom_line(aes(y = avg_compound, color = "Compound sentiment score")) +
  geom_line(aes(y = avg_pos, color = "Average positive score")) +
  geom_line(aes(y = avg_neg, color = "Average negative score")) +
  scale_color_manual(values = c("Compound sentiment score" = "black", "Average positive score" = "forestgreen", "Average negative score" = "firebrick")) +
  labs(title = "Trend line of Sentiments related to Assassination", x = "Date", y = "Scores", color = "Sentiment Type") +
  scale_x_date(date_breaks = "1 day", date_labels = "%d") +
  theme_minimal() +
  theme(legend.position = "bottom")

ggplot(ABSA_Trump_Summary, aes(x = date)) +
  geom_line(aes(y = avg_compound, color = "Compound sentiment score")) +
  geom_line(aes(y = avg_pos, color = "Average positive score")) +
  geom_line(aes(y = avg_neg, color = "Average negative score")) +
  scale_color_manual(values = c("Compound sentiment score" = "black", "Average positive score" = "forestgreen", "Average negative score" = "firebrick")) +
  labs(title = "Trend line of Sentiments related to Trump", x = "Date", y = "Scores", color = "Sentiment Type") +
  scale_x_date(date_breaks = "1 day", date_labels = "%d") +
  theme_minimal() +
  theme(legend.position = "bottom")

ggplot(ABSA_Biden_Summary, aes(x = date)) +
  geom_line(aes(y = avg_compound, color = "Compound sentiment score")) +
  geom_line(aes(y = avg_pos, color = "Average positive score")) +
  geom_line(aes(y = avg_neg, color = "Average negative score")) +
  scale_color_manual(values = c("Compound sentiment score" = "black", "Average positive score" = "forestgreen", "Average negative score" = "firebrick")) +
  labs(title = "Trend line of Sentiments related to Biden", x = "Date", y = "Scores", color = "Sentiment Type") +
  scale_x_date(date_breaks = "1 day", date_labels = "%d") +
  theme_minimal() +
  theme(legend.position = "bottom")

top_neg_trump <- ABSA_neg %>%
  filter(aspect == "Trump") %>%
  filter(date >= as.Date("2024-07-15")) %>%
  arrange(desc(neg)) %>%
  select(neg, text)

top_pos_trump <- ABSA_pos %>%
  filter(aspect == "Trump") %>%
  filter(date >= as.Date("2024-07-15")) %>%
  arrange(desc(pos)) %>%
  select(pos, text)

top_neg_assassination <- ABSA_neg %>%
  filter(aspect == "Assassination") %>%
  arrange(desc(neg)) %>%
  select(neg, text)

#### Sentiment vs Engagement ####
ABSA_all <- bind_rows(ABSA_0704, ABSA_0705, ABSA_0706, ABSA_0707, ABSA_0708, ABSA_0709, ABSA_0710, ABSA_0711, ABSA_0712, ABSA_0713, ABSA_0714, ABSA_0715, ABSA_0716, ABSA_0717, ABSA_0718, ABSA_0719, ABSA_0720, ABSA_0721, ABSA_0722, ABSA_0723)

ABSA_pos <- ABSA_all %>%
  filter(compound > 0)　%>%
  select(text, likeCount, retweetCount, likeCount, aspect, compound, pos, neg, neu, date) %>%
  mutate(logLikeCount = log(as.numeric(likeCount) + 1))

ABSA_neg <- ABSA_all %>%
  filter(compound < 0)　%>%
  select(text, likeCount, retweetCount, likeCount, aspect,compound, pos, neg, neu, date) %>%
  mutate(logLikeCount = log(as.numeric(likeCount) + 1))

ggplot(ABSA_pos, aes(x = logLikeCount, y = compound)) +
  geom_point(size = 0.1) +
  labs(title = "Correlation between likeCount and Compound Score", x = "likeCount", y = "compound")

ggplot(ABSA_neg, aes(x = logLikeCount, y = compound)) +
  geom_point(size = 0.1) +
  labs(title = "Correlation between likeCount and Compound Score", x = "likeCount", y = "compound")

###########################################
##  5. Interrupted Time Series Analysis  ##
###########################################

library(nlme)
library(AICcmodavg)

#### ITS on Trump ####

ITS_Trump <- ABSA_Trump_Summary %>%
  select(avg_compound, date) %>%
  mutate(intervention = if_else(date >= as.Date("2024-07-13"), 1, 0),
         post.intervention.time = if_else(intervention == 1, cumsum(intervention), 0),
         time = row_number())

model_T1 = gls(avg_compound ~ time + intervention + post.intervention.time, data = ITS_Trump, method = "ML")
summary(model_T1)

ITS_Trump <- ITS_Trump %>%
  mutate(model_T1.predictions = predictSE.gls (model_T1, ITS_Trump, se.fit = T)$fit,
         model_T1.se = predictSE.gls (model_T1, ITS_Trump, se.fit = T)$se)

ggplot(ITS_Trump, aes(x = time, y = avg_compound)) +
  geom_ribbon(aes(ymin = model_T1.predictions - (1.96 * model_T1.se), ymax = model_T1.predictions + (1.96 * model_T1.se)), fill = "lightgreen") +
  geom_line(aes(time, model_T1.predictions), color="black", lty=1) +
  geom_point(alpha = 0.3)


#### ITS on Biden ####
ITS_Biden <- ABSA_Biden_Summary %>%
  select(avg_compound, date) %>%
  mutate(intervention = if_else(date >= as.Date("2024-07-13"), 1, 0),
         post.intervention.time = if_else(intervention == 1, cumsum(intervention), 0),
         time = row_number())

model_B1 = gls(avg_compound ~ time + intervention + post.intervention.time, data = ITS_Biden, method = "ML")
summary(model_B1)

ITS_Biden <- ITS_Biden %>%
  mutate(model_B1.predictions = predictSE.gls (model_B1, ITS_Biden, se.fit = T)$fit,
         model_B1.se = predictSE.gls (model_B1, ITS_Biden, se.fit = T)$se)

ggplot(ITS_Biden, aes(x = time, y = avg_compound)) +
  geom_ribbon(aes(ymin = model_B1.predictions - (1.96 * model_B1.se), ymax = model_B1.predictions + (1.96 * model_B1.se)), fill = "lightgreen") +
  geom_line(aes(time, model_B1.predictions), color="black", lty=1) +
  geom_point(alpha = 0.3)


#### ITS on Assassination ####
ITS_Assassination <- ABSA_Assassination_Summary %>%
  select(avg_compound, date) %>%
  mutate(intervention = if_else(date >= as.Date("2024-07-13"), 1, 0),
         post.intervention.time = if_else(intervention == 1, cumsum(intervention), 0),
         time = row_number())

model_A1 = gls(avg_compound ~ time + intervention + post.intervention.time, data = ITS_Assassination, method = "ML")
summary(model_A1)

ITS_Assassination <- ITS_Assassination %>%
  mutate(model_A1.predictions = predictSE.gls (model_A1, ITS_Assassination, se.fit = T)$fit,
         model_A1.se = predictSE.gls (model_A1, ITS_Assassination, se.fit = T)$se)

ggplot(ITS_Assassination, aes(x = time, y = avg_compound)) +
  geom_ribbon(aes(ymin = model_A1.predictions - (1.96 * model_A1.se), ymax = model_A1.predictions + (1.96 * model_A1.se)), fill = "lightgreen") +
  geom_line(aes(time, model_A1.predictions), color="black", lty=1) +
  geom_point(alpha = 0.3)