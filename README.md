# SNS_20171220
記事投稿・いいね！機能を実装したSNS

## User

|カラム|型|
|-|-|
|name|String|
|email|String|
|password_digest|String| ※passwordカラムをBCRyptを利用して暗号化

## Post

|カラム|型|
|-|-|
|title|String|
|content|Text|
|user_id|Integer| ※Userモデルと紐付け
