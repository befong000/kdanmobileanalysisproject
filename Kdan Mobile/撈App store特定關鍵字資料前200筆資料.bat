@:: ----- 將 Script.bat 加入 系統排程 ( 可以手動加入 [開始][程式集][啟動] 中 ) ------
@:: schtasks /Create /SC Daily /MO 1 /ST 12:30:00 /TN Script_iTunesKeywords /TR C:\Users\jacob\Downloads\iTunesKeywords\Script_iTunesKeywords.bat

@echo off
@set today=%date:~0,4%%date:~5,2%%date:~8,2%
@::set today代表定義日期
@set path=C:\Users\User\Downloads\iTunesKeywords
@::set path代表從電腦哪個路徑讀取要定義的參數
@cd/d C:\Program Files\curl
@:: md %today%\iTunesKeywords

@:: 將下載好的Rawdata依公司來命名
@::for 迴圈 ,eol=;常數,skip=1代表略過第一列,tokens=1,2,3*代表讀取第一二三個欄位*表示每一格全取,delims=,代表每一個資料依 , 分隔,%%i給箱子i存
@::取,echo %%i%%j%%k分別給i,j,k三變數
for /f "eol=; skip=1 tokens=1,2,3* delims=," %%i in (%path%\List_KeywordsTW.csv) do (
     @echo %%i %%j %%k
     @curl -o %path%\RawData\iTunesKeywords_%%i_%%j_%%k_%today%.json --insecure "https://itunes.apple.com/search?term=%%i&entity=%%j&country=%%k&limit=200"
)

@::  @curl -o %path%\RawData\iTunesKeywords_%%i_%%j_%%k_%today%.json --insecure "https://itunes.apple.com/search?term=%%i&entity=%%j&country=%%k&limit=200"
從itune此網址抓資料並且解密,然後依照此命名方式存成json檔
@pause





@:: curl -o c:\users\jacob\downloads\iTunesKeywords\RawData\iTunesKeywords_highlight_software_US_20141104.json --insecure "https://itunes.apple.com/search?term=highlight&entity=software&country=US&limit=200"