# アプリケーション名
Menu Bot


# アプリケーション概要
レシピの投稿とブックマークができ、投稿されたレシピを組み立てることで献立を作成することができる。
また、食材を登録しておくことで、指定した食材を使用するレシピで献立を作成することができる。


# URL
https://original-app.onrender.com


# テスト用アカウント
- Basic認証ID：admin
- Basic認証PW：123456
- メールアドレス：test123@com
- パスワード　　：test123


# 利用方法
## レシピ投稿・検索
 1. トップページ(一覧ページ)のヘッダーからユーザー新規登録を行う。
 2. トップページの投稿ボタンから、レシピの内容を入力して投稿する。
 [![Image from Gyazo](https://i.gyazo.com/c62266959fde7feaff0f2319bf9b8674.png)](https://gyazo.com/c62266959fde7feaff0f2319bf9b8674)
 3. 投稿内容を変更する場合は、トップページのレシピ画像をクリックし、編集ボタンを押して投稿内容を変更する。
 [![Image from Gyazo](https://i.gyazo.com/c84c5dd2a035742e0a81a87fa3cc5178.png)](https://gyazo.com/c84c5dd2a035742e0a81a87fa3cc5178)
 4. トップページの検索ボタンから、検索条件を入力して検索する。
 [![Image from Gyazo](https://i.gyazo.com/09c1c45b44c0814fba35004434dd79c3.jpg)](https://gyazo.com/09c1c45b44c0814fba35004434dd79c3)

## 献立作成(実装中)
 1. トップページ(一覧ページ)のヘッダーからユーザー新規登録を行う。
 2. トップページのヘッダーから献立作成ページに遷移する。
 3. 「主菜」「副菜」「汁物」のレシピをそれぞれ選択し、献立を作成する。

## 食材登録(追加実装予定)
 1. トップページ(一覧ページ)のヘッダーからユーザー新規登録を行う。
 2. トップページのヘッダーから食材登録ページへ遷移する。
 3. 賞味期限を入力して登録する。


# アプリケーションを作成した背景
家族や友人へのヒアリング、自分の生活面での困り事などから、共通する課題として「毎日の献立を決めるのが億劫」「毎日買い物に行くのは面倒だが、数日分の献立を予め決めておくのは難しい」が判明した。また、人により「食材を余らせてしまう」という課題も見受けられた。<br>
コロナ禍により外出を控えたい人も増えており、物価の高騰やフードロスの観点からも、効率的な自炊や食材購入をしたいと考える人は多いと推測し、献立作成アプリケーションを作成することにした。「食材を余らせてしまう」という課題に対する解決策として、「手持ち食材の登録機能」及び「登録した食材を使用した献立作成機能」を実装することにした。


# 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1jAq6VNEtTYRTrmWKwRD7ltH_rplMyBNCo5ukWGjbjEc/edit#gid=1141759730)


# 実装予定の機能
現在、献立作成機能を実装中。
今後は、手持ちの食材の登録機能の実装及び献立作成機能との連携を予定している。


# データベース設計
[![Image from Gyazo](https://i.gyazo.com/013af535c964cf173514da534cd9d4a9.png)](https://gyazo.com/013af535c964cf173514da534cd9d4a9)


# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/2142646d51120c8c92f370fbc8d4e566.png)](https://gyazo.com/2142646d51120c8c92f370fbc8d4e566)


# 開発環境
- フロントエンド　：HTML/CSS/JavaScript/JQuery
- バックエンド　　：Ruby 2.6.5/PostgreSQL 16.4
- インフラ　　　　：Render
- テスト　　　　　：RSpec 3.12
- テキストエディタ：Visual Studio Code
- タスク管理　　　：Git/GitHub


# ローカルでの動作方法
以下のコマンドを順に実行。
  % git clone https://github.com/mayumitanaka/original-app.git
  % cd original-app
  % bundle install
  % yarn install

# 工夫したポイント
・ブラウザで使用するアプリケーションのため、できる限り一覧表示を行うことで画面遷移が少なくなるようにした。
・トップページからの分岐が多いため、リンク箇所はアイコンや色を使うなどして、文字だけにならないようにした。
・一人暮らしや寮生活の場合は使用できる家電や調理器具が限られてくるため、検索条件に「調理器具」を入れることにより、自宅に無い調理器具が必要なレシピがヒットしないようにした。
・カテゴリーを「主菜・副菜・汁物」と「〇〇料理」の2つの要素に分けることで、より条件にあった検索を行えるようにした。
・献立の構成をカテゴリーに合わせて「主菜・副菜・汁物」にしたことで、バランスの良い献立がヒットするようにした。


# テーブル設計

## users テーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |

### Association
- has_many :recipes, dependent: :destroy
- has_many :favorites, dependent: :destroy
- has_many :favorite_recipes, through: :favorites, source: :recipe
- has_many :menus,   dependent: :destroy
- has_many :foods,   dependent: :destroy


## recipes テーブル
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| recipe_title      | string     | null: false                    |
| recipe_procedure  | text       | null: false                    |
| recipe_volume     | integer    | null: false                    |
| cooking_time      | integer    | null: false                    |
| tool_id           | integer    |                                |
| category_menu_id  | integer    | null: false                    |
| category_dish_id  | integer    |                                |
| user              | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many   :ingredients, dependent: :destroy
- has_many   :favorites, dependent: :destroy
- has_many   :menus
- belongs_to_active_hash :tool
- belongs_to_active_hash :category_menu
- belongs_to_active_hash :category_dish


## ingredients テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| ing      | string     | null: false                    |
| quantity | string     | null: false                    |
| recipe   | references | null: false, foreign_key: true |

### Association
- belongs_to :recipe


## favorites テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| recipe   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :recipe


## menus テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| recipe   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :recipe


## foods テーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| food_name   | string     | null: false                    |
| best_before | string     | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association
- belongs_to :user