# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# README

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
