# テーブル設計

## Usersテーブル
| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| first_name_kanji | string  | null: false |
| first_name_kana  | string  | null: false |
| last_name_kanji  | string  | null: false |
| last_name_kana   | string  | null: false |
| birth_year       | integer | null: false |
| birth_month      | integer | null: false |
| birth_day        | integer | null: false |

### Association
- has_many :items
- has_many :purchases
- has_many :comments


## Itemsテーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user_id              | references | null: false, foreign_key: true |
| title                | string     | null: false                    |
| description          | text       | null: false                    |
| category             | string     | null: false                    |
| condition            | string     | null: false                    |
| price                | integer    | null: false                    |
| delivery_fee_payment | string     | null: false                    |
| send_from            | string     | null: false                    |
| send_within          | string     | null: false                    |

### Association
- belongs_to :user
- has_one :purchase
- has_many :comments


## Purchasesテーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user-id          | references | null: false, foreign_key: true |
| item-id          | references | null: false, foreign_key: true |
| card_number      | integer    | null: false                    |
| expiration_year  | integer    | null: false                    |
| expiration_month | integer    | null: false                    |
| security_code    | integer    | null: false                    |
| post_number      | integer    | null: false                    |
| prefecture       | string     | null: false                    |
| city             | string     | null: false                    |
| house_number     | integer    | null: false                    |
| building_name    | string     |                                |
| phone_number     | integer    | null: false                    |

### Association
- belongs_to :user
- belongs_to :item


## Commentsテーブル
| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user-id | references | null: false, foreign_key: true |
| item-id | references | null: false, foreign_key: true |
| text    | text       | null: false                    |

### Association
- belongs_to :user
- belongs_to :item