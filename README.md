# README

## Database design

### users (gem devise)
* association  
has_many :articles  
has_many :favorite_articles  
has_many :user_likes, through: :favorite_articles, source: :article

* column  
nickname :string, null: false  
avater :string


### articles
* association  
belongs_to :user　
has_many :favorite_articles, dependent: :destroy  
belongs_to :location

* column  
body :text, null: false  
title :string, null: false  
image :string, null: false  
references :user, foreign_key: true  
likes_count :integer  
references :location, foreign_key: true


### favorite_articles
* association  
belongs_to :user  
belongs_to :article, counter_cache: :likes_count

* column  
references :user, foreign_key: true  
references :article, foreign_key: true


### locations
* association  
'awesome_nested_set'gemの使用  
acts_as_nested_set  

has_many :articles

* column  
areaName :string, null: false  


## Ruby
* version 2.3.1
