library(XML)
library(httr)

## Get all URLs to check for tracking codes

url <- "http://www.connectwise.com"
html <- htmlTreeParse(url, useInternalNodes=T)
links <- getHTMLLinks(url, externalOnly = TRUE, xpQuery = "//a/@href", baseURL = url)

## Get all of the Sitemap.XML Links

sitemaphtml <- htmlTreeParse(sitemap, useInternalNodes=T)
sitemap <- "http://www.connectwise.com/sitemap.xml"
sitemaplinks <- xpathSApply(sitemaphtml, "//loc")

## Get the Robots.txt file

con = url("http://www.connectwise.com/robots.txt")
robots = readLines(con)
close(con)

## Get all of the tags on each page

anyscripts <- xpathSApply(html, "//script")
cwdmscripts <- xpathSApply(html, "//script[@src='/js/cwdm.min.js']")

