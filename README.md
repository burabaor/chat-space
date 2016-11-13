# table
- **user**
    - has_many: groups, through: group_members
    - has_many: messages
- **group**
    - has_many: users, through: group_members
    - has_many: messages
- **message**
    - belongs_to: user
    - belongs_to: group
- **group_member**
    - belongs_to: user
    - belongs_to: group


##user

  |カラム名|型|オプション|
  |:--|:--|:--|
  |name|string|null:false|
  |email|string|null:false|
  |password|string|null:false|

##group
  |カラム名|型|オプション|
  |:--|:--|:--|
  |name|string|null:false|

##message
  |カラム名|型|オプション|
  |:--|:--|:--|
  |user_id|references|null: false, foreign_key: true|
  |group_id|references|null: false, foreign_key: true|
  |body|text|なし
  |image|string|なし

##group_member

  |カラム名|型|オプション|
  |:--|:--|:--|
  |user_id|references|null:false, foreign_key: true|
  |group_id|references|null:false, foreign_key: true|

