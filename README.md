# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| tool_id            | integer | null: false               |

### Association

- has_many :recipes, dependent: :destroy
- has_many :menus,   dependent: :destroy
- has_many :foods,   dependent: :destroy
- belongs_to_active_hash :tool


## recipes テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| recipe-title      | string     | null: false                    |
| recipe-procedure  | text       | null: false                    |
| recipe-volume     | integer    | null: false                    |
| recipe-material   | string     | null: false                    |
| recipe-quantity   | integer    | null: false                    |
| cooking-time      | integer    | null: false                    |
| tool_id           | integer    | null: false                    |
| category_id       | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :menus
- has_many   :recipe-tags
- belongs_to_active_hash :tool
- belongs_to_active_hash :category


## menus テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| recipe   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :recipe


## recipe-tags テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| recipe   | references | null: false, foreign_key: true |
| tag      | references | null: false, foreign_key: true |

### Association

- belongs_to :recipe
- belongs_to :tag


## tags テーブル

| Column     | Type     | Options        |
| ---------- | -------- | -------------- |
| bookmark   | string   | null: false    |
| main       | string   | null: false    |
| sub        | string   | null: false    |
| soup       | string   | null: false    |
| vegetable  | string   | null: false    |
| meet       | string   | null: false    |
| egg        | string   | null: false    |
| fish       | string   | null: false    |
| bean       | string   | null: false    |

### Association

- has_many   :recipe-tags


## foods テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| food-name   | string     | null: false                    |
| best-before | string     | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user