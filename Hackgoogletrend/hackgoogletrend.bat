@:: ----- 將 Script.bat 加入 系統排程 ( 可以手動加入 [開始][程式集][啟動] 中 ) ------
@:: schtasks /Create /SC Daily /MO 1 /ST 12:30:00 /TN Script_iTunesKeywords /TR C:\Users\jacob\Downloads\iTunesKeywords\Script_iTunesKeywords.bat

@echo off
@set today=%date:~0,4%%date:~5,2%%date:~8,2%
@set path=C:\Users\User\Downloads\iTunesKeywords
@cd/d C:\Program Files\curl
@:: md %today%\iTunesKeywords

@:: 將下載好的Rawdata依公司來命名
for /f "eol=; skip=1 tokens=1,2,3* delims=," %%i in (%path%\List_KeywordsGT.csv) do (
     @echo %%i %%j %%k
     @curl -o %path%\RawData\iTunesKeywords_%%i_%%j_%%k_%today%.json --data "ajax=1&cid=%%i&geo=%%j&date=%%k" http://www.google.com/trends/topcharts/trendingchart
)

@pause



@:: curl -o C:\Users\User\Downloads\iTunesKeywords\RawData\iTunesKeywords_TESTING01.json --data "ajax=1&cid=shopping&geo=US&date=201310" http://www.google.com/trends/topcharts/trendingchart

@::目前遇到問題
@::cid只能搜尋actors演藝人員
@::無法搜尋其他類別?? EX:business_and_politics有試過  但無法搜索


cid=chemical_elements&geo=US&date=2013&cat=nature_and_science

curl -o C:\Users\User\Downloads\iTunesKeywords\RawData\iTunesKeywords_TESTING01.json --data "ajax=1&cid=actors&geo=US&date=201410" http://www.google.com/trends/topcharts/trendingchart

curl -o C:\Users\User\Downloads\iTunesKeywords\RawData\iTunesKeywords_TESTING01.json --data "#ajax=1&vm=cat&cid=nature_and_science&geo=US&date=201410&cat=nature_and_science" http://www.google.com/trends/topcharts/trendingchart


curl -o C:\Users\User\Downloads\iTunesKeywords\RawData\iTunesKeywords_TESTING01.json "http://hawttrends.appspot.com/?r=5&c=5&p=12"


curl -o C:\Users\User\Downloads\iTunesKeywords\RawData\iTunesKeywords_TESTING01.json --data "ajax=1&htd=20141119&pn=p1&htv=l" http://www.google.com/trends/hottrends/hotItems


curl -o C:\Users\User\Downloads\iTunesKeywords\RawData\iTunesKeywords_TESTING01.json --data "ajax=1&pn=p1&htv=m" http://www.google.com/trends/hottrends/hotItems


@::7.2013年10月美國熱門搜尋排行榜執行檔與儲存檔案路徑
curl -o C:\Users\User\Downloads\iTunesKeywords\RawData\iTunesKeywords_TESTING01.json --data "ajax=1&geo=US&date=201310" http://www.google.com/trends/topcharts/category

