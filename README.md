# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ----------         | ------ | ----------- |
| email              | string | null: false ,unique :ture |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| miyoji             | string | null: false |
| namae              | string | null: false |
| kana_miyoji        | string | null: false |
| kana_namae         | string | null: false |
| birth_data         | data   | null: false |

### Association

- has_many :items
- has_many :buys


## items テーブル

| Column      | Type       | Options     |
| ----------  | ---------  | ----------- |
| goods       | string     | null: false |
| explanation | text       | null: false |
| category_id | integer    | null: false |
| status_id   | integer    | null: false |
| burden_id   | integer    | null: false |
| area_id     | integer    | null: false |
| day_id      | integer    | null: false |
| price       | integer    | null: false |
| user        | references | null: false | 

### Association

- belongs_to :user
- has_one :buys



##  buyテーブル

| Column     | Type             |  Options     |
| ---------- | ----------       | ----------- |
| item       | references       | null: false |
| user       | references       | null: false |


### Association

- belongs_to :item
- belongs_to :user
- has_one :order

## order テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| postal_code    | string     | null: false |
| prefectures_id | string     | null: false |
| city_name      | string     | null: false |
| address        | text       | null: false |
| building       | text       | null: false |
| phone number   | string     | null: false |
| buy            | references | null: false |

### Association

- belongs_to :buy