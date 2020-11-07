# topi2以降 簡易作業ログ(Applogより詳細な)

## topic2: BookStackに必要なモデル・テーブルの作成
+ rails g model book 実行
+ t.string  :title
  t.text    :contents
  t.integer :user_idをマイグレーションファイルに書き込みマイグレート。(17:03)

〜11/06 作業開始！〜
(⭐️)ゴール: いいね・コメント機能以外のBookStackの要素を全て追加する！

## devise周りの設定の導入！！
+ rails g devise:installを実行!(12:03)
  - 正常に導入できた！
  
+ rails g devise Userの実行！
  - 正常にUserモデル作成完了!
  
+ Userテーブルのスキーマを確認する！
 +t.string :email
 + t.string :encrypted_password
 + t.string :nickname(within: 6chara)
- 上記の3つのカラムがメインでユーザー情報を登録する！(ログインはニックネームとパスワードで！)

+ Userのマイグレーションファイルにt.string  :nicknameを追記&マイグレート実行！
+ rails db:migrate - 実行成功！

## ここで,BookStacksにおけるモデルの実装&導入は終了したからここでGithubでチーム開発一連の流れをやる！

 手順: topicで機能追加 → topicの作業内容をリモートに反映 → Githubでプルリク・マージでdevelopに内容を結合
  → developに正しくマージされたかInsightのNetworkで確認 → ローカルでdevelopブランチに移動 → リモートdevelopの内容を"Pull"
  → ローカルdevelopに正しくpullできていたら,topic2に移動して同じくdevelop(統合ブランチ)からpull → 一連の流れ完了！
  
## 上のdevelop ← topic2のプルリク・マージが完了した！そして,リモートからのpullも完了して、コンフリクトや不具合も全くない！

~topic3: 各contorollerの実装~
## ここでコントローラー周りの実装をtopic3ブランチを切って作成することとする！
+ git checkout -b topic3
+ (topic3) git add - commit - push でリモートにtopic3を反映させた！

### 各コントローラーの作成&用意
  + rails g model books
  + rails g controller users
  + rails g controller tops
　- 上のコマンドでそれぞれ作成した！

## ここで各コントローラーの作成&導入が完了したのでここで,リモートに反映させる！ - 完了

~topi4: 各viewsとルーティングの設定~
## ここで各ビューページとルーティン周りの実装に関してtopic4を切って開発を進める！
+ git checkout -b topic4
+ git add - commit - pushにてリモートにも内容を反映させる！！
~routes.rb~
devise_for :users
  root 'tops#top'
  get '/tops/about' => 'tops#about'
  resources :books
  resources :users

~topic4実装完了！~

~topic5: views・contoroller・modelの詳細設定~
# contoroller
 - books
 - users
 - tops
 -コントローラーの各アクション・処理内容を実装して行った！ - 詳細は各controller参照
 + contorollerの各カラム名だけエラーが出ないように変更しておく。

# model
 - book.rb
 - user.rb
 + rails g migration add_introduces_to_users introduces:text
 + rails g migration add_user_image_id_to_users user_image_id:string
 
# views
 + 各viewfileでとりあえずのhtml/css/bootstrapによるレイアウトデザインが完了した！
 
~topic5実装完了！~
 
~topic6: フロント部分の変更やその他不具合の修正~
# views
 + application.html.erbにヘッダーナビゲーションの追加,ブラッシュアップ。
 + top.html.erb,application.html.erbのレイアウト崩れの修正。
 (⭐️⭐️) ログイン前の画面でも投稿された本 = books#indexのみは閲覧できるようにしておく！ 
 → この機能は最後の方にとっておくこととする。
 
 + deviseのsign in,sign up画面をもう少しレイアウトを整える！
 + あ,今の今までdeviseのviewを用意するのを忘れてた！
 (⭐️)Sign In,Sign Up画面のレイアウト設定完了！！(18:02)

 ## 現在11/06 18:45分時点 ログイン後の画面もエラーなく表示されている！あとはCRUDなどの機能を検証して、エラーが出ないか？,画像投稿やルーティングなどが
                          正いか?などを検証・実装していく！

# controllers

# models

# tables

〜11/07 8:55 作業開始！〜
## 8:55 ~まず昨日作業していた分だけリモートリポジトリ に反映させた！

## topic6の内容
1.各ページのレイアウトと処理の挙動確認
2.各ファイルの変数名や不要な記述の添削

### topic6詳細内容変更開始！
+ まず,user#editで画像が投稿できないエラーを解消した!
+ 次に,user#show画面を全体的に真ん中に寄せて,レイアウトを改善する！
+ users#showのレイアウト編集完了！
+ 本の新規投稿でエラーが発生 - 解消！
+ booksのedit/destroyでも,変数名&カラム名の違いからエラーが発生！ - 解消
+ よし！ログイン後の画面も大体レイアウトを整えて,さらに変数名も改善することによって,まだ細かいコードは修正の余地があるが概ね完成！

### Nicknameでのログイン機能実装
  + 次に,BookStackの使用通り,ログインはNicknameとパスワードでできるように変更する！
  + 10:25 Nicknameとpassでログインできる使用に変更完了！

~topic6 以上の変更を持ってtopic6の変更を終了する！~


~topic7: コメント機能・いいね機能の実装~
# 1.コメント機能の実装
# 2.いいね機能の実装

## 10:55~ コメント機能実装取り掛かる！
~イメージは、books#index - 本のタイトルをクリックすることでbooks#show - コメント入力&送信 - 各ビューページに反映~
+ comment modelを作成 - rails g model comment
+ commentテーブルのスキーマを以下のように編集してマイグレートする。
　- t.integer "user_id"
  - t.integer "book_id"
  - t.string "comment"
 + migrate完了！

+ 続いて,comments_controllerを作成 - rails g controller comments
+ comments_controllerの中身を追記した。
+ 続いて,comment modelの詳細設定として,アソシエーションとバリデーションを設定した。
+ 続いて各ビューファイルの内容を変更する！ - いや,各viewファイルのレイアウト編集はlike_controllerまで作成した後に行おう！
~view以外のcomment機能実装完了！~

## 11:20~ いいね機能実装に取り掛かる！
+ like modelを作成 -rails g model like
+ likeテーブルのスキーマを以下のように変更し,マイグレートする。
 - t.integer "user_id"
 - t.integer "book_id"
+ migrate完了！
+ 続いて,likes_controllerを作成 - rails g controller likes
+ 続いて,like modelの詳細設定として,アソシエーションとバリデーションを追加した。
~view以外のlike機能実装完了！~

## 11:39~ コメント・いいね機能追加に伴う,ルーティング/viewの変更開始！
+ まず,ルーティングについてbooksがcommentとlikeをネストするような形に変更する！ - routes.rbにおいて設定完了！
+ ここで,views以外のコメント・いいね機能がだいぶ揃ってきたからリモートにプッシュする - git push

