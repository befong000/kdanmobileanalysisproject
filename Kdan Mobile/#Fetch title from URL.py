#Fetch title from URL
##前置作業：terminal 安裝套件
##sudo pip install beautifulsoup4
##sudo pip install mechanize
##Readdle網站文章範例:
import urllib2
from bs4 import BeautifulSoup
soup = BeautifulSoup(urllib2.urlopen("http://thenextweb.com/apps/2014/12/10/readdles-pdf-office-ipad-turns-images-editable-forms/"))
print soup.title 