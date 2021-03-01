# テーブル設計

## users テーブル

| Column      | Type   | Options     |
| ----------  | ------ | ----------- |
| email       | string | null: false |
| password    | string | null: false |
| nickname    | string | null: false |
| miyoji      | text   | null: false |
| namae       | text   | null: false |
| kana_miyoji | text   | null: false |
| kana_namae  | text   | null: false |
| birth_data  | data   | null: false |

### Association

- has_many :items
- belongs_to :order


## items テーブル

| Column      | Type       | Options     |
| ----------  | ---------  | ----------- |
| goods       | text       | null: false |
| explanation | text       | null: false |
| category_id | integer    | null: false |
| status_id   | text       | null: false |
| user        | references | null: false | 

### Association

- belongs_to :users
- belongs_to :haisou
- has_many :orders


## haisous テーブル

| Column     | Type       | Options     |
| ---------- | ---------- | ----------- |
| burden_id  | text       | null: false |
| area_id    | text       | null: false |
| days_id    | text       | null: false |
| price      | integer    | null: false |
| item       | references | null: false | 

### Association

- has_one :item

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