# 11/05(木) BookStack制作開始！

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