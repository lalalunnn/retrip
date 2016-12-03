# README

* Database

### users (gem devise)
* association  
has_many :favorite_articles  
has_many :articles, through: :favorite_articles

* column  
nickname :string, null: false


### articles
* association  
has_many :favorite_articles  
has_many :users, through: :favorite_articles

* column  
body :text, null: false  
title :string, null: false  
image :string, null: false


### favorite_articles
* association  
belongs_to :user  
belongs_to :article

* column  
references :user, foreign_key: true  
references :article, foreign_key: true


* Ruby version 2.3.1
