# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ----------         | ------ | ----------- |
| email              | string | null: false |
| encrypted_password | string | null: false |
| nickname           | string | null: false |
| miyoji             | string | null: false |
| namae              | string | null: false |
| kana_miyoji        | string | null: false |
| kana_namae         | string | null: false |
| birth_data         | data   | null: false |

### Association

- has_many :items
- belongs_to :order


## items テーブル

| Column      | Type       | Options     |
| ----------  | ---------  | ----------- |
| goods       | string     | null: false |
| explanation | text       | null: false |
| category_id | integer    | null: false |
| status_id   | integer    | null: false |
| burden_id   | text       | null: false |
| area_id     | text       | null: false |
| days_id     | text       | null: false |
| price       | integer    | null: false |
| item        | references | null: false | 
| user        | references | null: false | 

### Association

- belongs_to :users
- belongs_to :buy
- has_many :orders


##  buyテーブル

| Column     | Type             |  Options     |
| ---------- | ----------       | ----------- |
| item       | referwnces       | null: false |
| order      | referwnces       | null: false |


### Association

- belongs_to :item
- belongs_to :order

## order テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| postal_code    | integer    | null: false |
| prefectures_id | string     | null: false |
| city_name      | string     | null: false |
| address        | text       | null: false |
| building       | text       | null: false |
| phone number   | integer    | null: false |
| user           | references | null: false | 
| item           | references | null: false | 

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :buy