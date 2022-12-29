# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |

### Association

- has_many :recipes, dependent: :destroy
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
| category_id       | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :ingredients
- has_many   :menus
- has_many   :recipe_tags
- belongs_to_active_hash :tool
- belongs_to_active_hash :category


## ingredients テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| ing      | string     | null: false                    |
| quantity | string     | null: false                    |
| recipe   | references | null: false, foreign_key: true |

### Association

- belongs_to :recipe


## menus テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| recipe   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :recipe


## recipe_tags テーブル

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
| food_name   | string     | null: false                    |
| best_before | string     | null: false                    |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user