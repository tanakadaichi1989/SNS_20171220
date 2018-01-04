# SNS_20171220
記事投稿・いいね！機能を実装したSNS

## Userモデル

|カラム|型|
|-|-|
|name|String|
|email|String|
|password_digest|String| ※passwordカラムをBCRyptを利用して暗号化

name および email カラムに下記制約を設定
```Ruby:models/user.rb
validates :name, {presence: true}
validates :email, {presence: true, uniqueness:true}
```

## Postモデル

|カラム|型|
|-|-|
|title|String|
|content|Text|
|user_id|Integer| ※Userモデルと紐付け

title および content カラムに下記制約を設定
```Ruby:models/post.rb
validates :title, {presence: true}
validates :content, {presence: true}
```

## Likeモデル
|カラム|型|
|-|-|
|user_id|Integer|
|post_id|Integer|

user_id および post_id カラムに下記制約を設定
```Ruby:models/like.rb
validates :user_id, {presence: true}
validates :post_id, {presence: true}
```

