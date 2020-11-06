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

