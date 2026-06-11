# DB 設計

## users
| Column | Type | Options |
| :--- | :--- | :--- |
| nickname | string | null: false |
| email | string | null: false, unique: true |
| password | string | null: false |

### Association
- has_many :items
- has_many :orders

## items
| Column | Type | Options |
| :--- | :--- | :--- |
| name | string | null: false |
| description | text | null: false |
| category_id | integer | null: false |
| condition_id | integer | null: false |
| shipping_fee_status_id | integer | null: false |
| prefecture_id | integer | null: false |
| shipping_day_id | integer | null: false |
| price | integer | null: false |
| user | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## orders
| Column | Type | Options |
| :--- | :--- | :--- |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
