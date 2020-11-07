# 11/05(木) BookStack制作開始！

# 作業用ブランチは必ずdevelopブランチ(統合ブランチ)から切って作業する！
# 手順: topicで機能追加 → topicの作業内容をリモートに反映 → Githubでプルリク・マージでdevelopに内容を結合
  → developに正しくマージされたかInsightのNetworkで確認 → ローカルでdevelopブランチに移動 → リモートdevelopの内容を"Pull"
  → ローカルdevelopに正しくpullできていたら,topic2に移動して同じくdevelop(統合ブランチ)からpull → 一連の流れ完了！

## Gitについて
 - master
 - develop
 - その他topicブランチ(機能ごと)

## 機能について
 - deviseによるログイン機能実装
 - refile,mini-magicによる画像投稿機能実装
 - 本のCRUD機能実装

# topic1: BookStackで使用するGemのインポート
+ gem 'pry-byebug'
+ gem 'bootstrap-sass'
+ gem 'jquery-rails'
+ gem 'devise'
+ gem "refile", require: "refile/rails", github: 'manfe/refile'
+ gem "refile-mini_magick"

# topic2: BookStackで必要なモデル・テーブルの作成
- book.rb
- user.rb
- 
## テーブル・スキーマ

### booksテーブル
+ t.string "title"
+ t.text "contents"
+ t.integer "user_id"
### usersテーブル
+ t.string :email
+ t.string :encrypted_password
+ t.string :nickname(within: 6chara)

# topic3: BookStackで必要なコントローラーの作成
- books_controller.rb
- users_controller.rb
- top_controller.rb

# topic4: 各viewsとルーティングの設定実装
~views~
## 各viewファイルの作成&用意
 books
 + _form.html.erb
 + edit.html.erb
 + index.html.erb
 + show.html.erb
 
 users
 + _info.html.erb
 + edit.html.erb
 + index.html.erb
 + show.html.erb
 
 tops
 + top.html.erb
 + about.html.erb
 - 上のビュフーファイルをそれぞれ追加した！

## 各ビューファイルのルーティング設定！
~routes.rb~
  devise_for :users
  root 'tops#top'
  get '/tops/about' => 'tops#about'
  resources :books
  resources :users

# topic5: 各views・controller・modelの詳細設定
## views
 + 各viweページの大まかなレイアウト作成
 + bootstrapを使うための設定(application.scss,application.jsを変更) 

## controller
 + 各controllerのアクション・処理内容の実装
 + 
 
## model・テーブル
 + バリデーションやアソシエーションの実装
 + usersテーブルに自己紹介文を簡単に記述するためのカラム :introducesを追加
 + 画像保存用のカラム user_image_idを追加

# topic6: 各viewsのレイアウト変更、その他仕様変更等
