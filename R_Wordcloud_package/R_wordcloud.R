install.packages("wordcloud")
install.packages("tm")
lords <- Corpus (DirSource("temp/"))   # 匯入剛才抓完的文章，temp/ 是儲存下載文章的資料夾, 這些文章變成我們分析的語料庫。
inspect(lords)                                         #看一下資料

#開始做文章格式整理
lords <- tm_map(lords, stripWhitespace)  #清掉空白的地方

lords <- tm_map(lords, tolower)  #無法轉換

lords <- tm_map(lords, removeWords, stopwords("english")) #清除英文常用的斷語,因為他們無法提供資訊

lords <- tm_map(lords, removeWords, c("noble", "lord")) #清除文章中的noble,lord兩字

lords <- tm_map(lords, stemDocument)
