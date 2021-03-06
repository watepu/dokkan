# Dokkan

## 概要
本の記録を効率化したくて作成したアプリです。  
見出しと一緒に内容を記録することで、「本ごと」「内容ごと」に記録を確認出来ます。  
![arcane-inlet-49890 herokuapp com_](https://user-images.githubusercontent.com/40508321/50552849-9cd5ac00-0cdf-11e9-93c4-84d7c7da216d.png)

## URL
http://arcane-inlet-49890.herokuapp.com/

## 開発環境
* Ruby 2.5.0
* Rails 5.1.6
* PostgreSQL 10.5

## 使い方
１. 新規登録からアカウントを作成  
２. ログインするとメニューが出てきますので「記録する」を選択  
３. 「記録一覧」画面から、「本ごと」「内容ごと」の記録を確認出来ます。

## 機能一覧
* ログイン機能（devise使用）
* CRUD機能
* 検索機能（ransack使用）
* 画像アップロード機能（carrierwave、mini_magick使用）
* 辞書機能
* 一対多アソシエーション
* 記録をすると自動的に、本ごと、見出しごとのメニューが重複無しで作成される機能
* 画像をAWSのS3サーバにアップロードするよう設定（fog-aws、dotenv-rails使用）
* AWSブランチにおいてAWSへデプロイ（Capistrano、unicorn、therubyracer使用）
