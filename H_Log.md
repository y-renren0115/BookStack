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
