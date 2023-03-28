## Download coffee.csv and chardonnay.csv from GitHub to your PC:
## 1) raw.githubusercontent.com/birkenkrahe/tm/main/data/coffee.csv
## 2) raw.githubusercontent.com/birkenkrahe/tm/main/data/chardonnay.csv
library(tm)
coffee_df <- read.csv("coffee.csv")
coffee_vec <- coffee_df$text
coffee_src <- VectorSource(coffee_vec)
coffee_corpus <- VCorpus(coffee_src)
content(coffee_corpus[[998]])
chardonnay_df <- read.csv("chardonnay.csv")
chardonnay_vec <- chardonnay_df$text
chardonnay_src <- VectorSource(chardonnay_vec)
chardonnay_corpus <- VCorpus(chardonnay_src)
content(chardonnay_corpus[[998]])
clean_coffee_corpus <- function(corpus) {
    corpus <- tm_map(corpus,
                     removePunctuation)
    corpus <- tm_map(corpus,
                     content_transformer(tolower))
    corpus <- tm_map(corpus,
                     removeWords,
                     words = c(stopwords("en"), "coffee","beans","bean"))
    corpus <- tm_map(corpus,
                     stripWhitespace)
    return(corpus)
}
clean_coffee <- clean_coffee_corpus(coffee_corpus)
clean_chardonnay_corpus <- function(corpus) {
    corpus <- tm_map(corpus,
                     removePunctuation)
    corpus <- tm_map(corpus,
                     content_transformer(tolower))
    corpus <- tm_map(corpus,
                     removeWords,
                     words = c(stopwords("en"), "chardonnay"))
    corpus <- tm_map(corpus,
                     stripWhitespace)
    return(corpus)
}
clean_chardonnay <- clean_chardonnay_corpus(chardonnay_corpus)
load_packages <- function() {
    library(tm)
    library(qdap)
    library(SnowballC)
    library(wordcloud)
    search()
}
load_packages()
