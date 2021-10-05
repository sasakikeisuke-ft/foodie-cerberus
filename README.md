# FoodieCerberus

# README

# アプリケーション概要

「今日のご飯は何にしよう？」のお悩み解決を目的に作成したアプリケーションです。<br>
料理とそのカテゴリー、食べた日付を登録することで、自分だけの献立一覧を作ることができます。<br>
また、料理それぞれにオリジナルタグをつけることができるため、検索する際に役立ちます。<br>
加えて、簡素ながら献立の提案機能も実装してあります。<br>
「豚肉」「アジ」といった材料を表すも良し。<br>
「〇〇の大好物」と目印にするもよし。<br>
ぜひ「今日のご飯」に役立ててください。<br>

# 🌐 URL
URL: https://foodie-cerberus.herokuapp.com<br>
ID: admin<br>
password: 2222

## テスト用アカウント
ユーザー名: sample_user<br>
メールアドレス: sample@sample.jp<br>
Password: a1234567

# 使い方

## 料理登録機能
料理に関する情報を登録します。<br>
登録する内容は、以下のようになっています。<br>
- 料理名
- 値段(安い、普通、高い、選択せず登録)
- カロリー(低い、普通、高い、選択せず登録)
- 大変さ(簡単、普通、大変、選択せず登録)
- カテゴリー選択
- 最後に食べた日
- 外部サイトへのリンク(参考にした献立ページへのリンクを登録)

### 登録フォーム
![登録フォーム](https://i.gyazo.com/f99d2ad72b16b42e4358a2dddc74eb07.png)

### 一覧画面
![一覧画面](https://i.gyazo.com/aff386e1f7863313354e1e065c180d7a.png)

### 料理の詳細画面
![料理の詳細画面](https://i.gyazo.com/00d24c8205538deda870cd794099d236.png)

## タグ登録機能
料理の詳細画面で、料理にタグをつけることができます。<br>
タグの新規登録画面もありますが、詳細画面でも新規タグを作成することができます。<br>
登録する内容は以下のようになっています。<br>
- タグ名
- カテゴリー


## 本日の献立登録機能
料理を本日の献立に追加すると「本日の献立」として一覧が表示されます。<br>
また、献立に登録したタグの一覧も表示されます。<br>
「食事の報告」ボタンを押すことで、各料理に登録されている「最後に食べた日」が当日に更新されます。<br>

![本日の献立](https://i.gyazo.com/69fe766ec8414e9f8a288ea8b814a089.png)


## 献立の提案機能
登録している料理から、<br>
- 「ランダムで一品」
- 「全料理で最も昔に食べた一品」
- 「各ジャンルから最も昔に食べた一品」
を提案します。

![献立のご提案](https://i.gyazo.com/1cce798dd40749095e1e4844b3ef1115.png)


## 料理検索機能
登録した料理に関する情報から、料理を検索することができます。<br>
検索内容は、以下となっています。<br>
- 料理名
- 値段(安い、普通、高い、選択せず登録)
- カロリー(低い、普通、高い、選択せず登録)
- 大変さ(簡単、普通、大変、選択せず登録)
- カテゴリー
- 最後に食べた日(降順、昇順)
- タグ

![検索](https://i.gyazo.com/beae8dabcc737c323c1cbd899bc925cb.png)



# テーブル設計

## usersテーブル

| column             | Type       | Options                   |
| ------------------ | ---------- | ------------------------- |
| nickname           | string     | null: false               |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |

### Association

- has_many :tags
- has_many :meals
- has_many :logs

## mealsテーブル

| column     | Type       | Options                   |
| ---------- | ---------- | ------------------------- |
| name       | string     | null: false               |
| last_day   | date       | null: false               |
| price_id   | integer    | null: false               |
| calorie_id | integer    | null: false               |
| user       | references | foreign_key: true         |
| link       | text       |                           |

### Association

- belongs_to :user
- has_many :meal_tag_relations
- has_many :tags, through: :meal_tag_relations
- has_many :logs

## tagsテーブル

| column      | Type       | Options                   |
| ----------- | ---------- | ------------------------- |
| name        | string     | null: false               |
| category_id | integer    | null: false               |
| user        | references | foreign_key: true         |

### Association

- belongs_to :user
- has_many :meal_tag_relations
- has_many :meals, through: :meal_tag_relations

## meal_tag_relationsテーブル

| column | Type       | Options                   |
| ------ | ---------- | ------------------------- |
| meal   | references | foreign_key: true         |
| tag    | references | foreign_key: true         |

### Association

- belongs_to :meal
- belongs_to :tag

## logsテーブル

| column | Type       | Options                   |
| ------ | ---------- | ------------------------- |
| user   | references | foreign_key: true         |
| meal   | references | foreign_key: true         |

### Association

- belongs_to :user
- belongs_to :meal
