# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| name            | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birth_date_1i   | integer | null: false |
| birth_date_2i   | integer | null: false |
| birth_date_3i   | integer | null: false |

### Association

- has_many :items
- has_many :orders



## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| seller_name     | string     | null: false                    |
| category        | integer    | null: false                    |
| item_condition  | integer    | null: false                    |
| delivery_charge | integer    | null: false                    |
| shipping_area   | integer    | null: false                    |
| shipping_days   | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order



## orders テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user_id  | references | null: false, foreign_key: true |
| order_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery



## deliveries テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_codet  | integer    | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| order_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :order
