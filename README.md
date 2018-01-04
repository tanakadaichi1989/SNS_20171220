# SNS_20171220
記事投稿・いいね！機能を実装したSNS

## Userモデル

|カラム|型|
|-|-|
|name|String|
|email|String|
|password_digest|String| ※passwordカラムをBCRyptを利用して暗号化

name および emailカラムに下記制約を設定
'''Ruby
validates :name, {presence: true}
validates :email, {presence: true, uniqueness:true}
'''

## Postモデル

|カラム|型|
|-|-|
|title|String|
|content|Text|
|user_id|Integer| ※Userモデルと紐付け

## Likeモデル
|カラム|型|
|-|-|
|user_id|Integer|
|post_id|Integer|

