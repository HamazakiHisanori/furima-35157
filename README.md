# テーブル設計

## users テーブル
| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmation | string  | null: false |
| first_name            | string  | null: false |
| last_name             | string  | null: false |
| first_name_kana       | string  | null: false |
| last_name_kana        | string  | null: false |
| year                  | integer | null: false |
| month                 | integer | null: false |
| day                   | integer | null: false |

### Association
- has-many :items
- has_many :buyers
- has_many :comments

## items テーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| image           | string     | null: false                    |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| category        | integer    | null: false                    |
| status          | integer    | null: false                    |
| delivery_charge | integer    | null: false                    |
| area            | integer    | null: false                    | 
| days            | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association
- has_many :comments
- has_one :buyer

## buyers テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :cash_code

## cash_cards テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| number   | string     | null: false                    |
| month    | string     | null: false                    |
| year     | string     | null: false                    |
| code     | string     | null; false                    |
| buyer_id | references | null: false, foreign_key: true |

### Association
- belongs_to :buyer

## comments テーブル
| Column  | Type       | Options                        |
| text    | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
