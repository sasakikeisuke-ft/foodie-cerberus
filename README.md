# FoodieCerberus

# README

# アプリケーション概要

「今日のご飯は何にしよう？」のお悩み解決を目的に作成したアプリケーションです。
料理とそのカテゴリー、食べた日付を登録することで、自分だけの献立一覧を作ることができます。
また簡素ながら献立の提案機能があります。
提案内容は、「ランダムに一品」のほか、
「登録した料理で食べた日付が最も昔の料理」を「全料理から」または「カテゴリーごと」でそれぞれ提案されます。
また、料理それぞれにオリジナルタグをつけることができます。
「豚肉」「アジ」といった材料を表すも良し。
「〇〇の大好物」と目印にするもよし。
ぜひ「今日のご飯」に役立ててください。

# 🌐 URL
URL: https://foodie-cerberus.herokuapp.com
ID: admin
password: 2222

## テスト用アカウント
メールアドレス: sample@sample.jp
Password: a1234567

# 使い方

## 料理登録機能

料理に関する情報を登録します。
登録する内容は、以下のようになっています。
- 料理名
- 値段(安い、普通、高い、選択せず登録)
- カロリー(低い、普通、高い、選択せず登録)
- 大変さ(簡単、普通、大変、選択せず登録)
- カテゴリー選択
- 最後に食べた日
- 外部サイトへのリンク(参考にした献立ページへのリンクを登録)


## タグ登録機能

料理にタグをつけることができます。
登録する内容は以下のようになっています。
- タグ名
- カテゴリー

## 本日の献立登録機能

料理を本日の献立に追加すると「本日の献立」として一覧が表示されます。
また、献立に登録したタグの一覧も表示されます。
「食事の報告」ボタンを押すことで、各料理に登録されている「最後に食べた日」が当日に更新されます。

## 料理検索機能

登録した料理に関する情報から、料理を検索することができます。
検索内容は、以下となっています。
- 料理名
- 値段(安い、普通、高い、選択せず登録)
- カロリー(低い、普通、高い、選択せず登録)
- 大変さ(簡単、普通、大変、選択せず登録)
- カテゴリー
- 最後に食べた日(降順、昇順)
- タグ



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
