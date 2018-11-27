# rubyTutor

## Base

### Syntax
每行不用`;` , 使用縮進2格

#### Comments: #
#### Multiline Comments:
```
=begin
This is a multiline comment and con spwan as many lines as you
like. But =begin and =end should come in the first line only. 
=end
```


### Variables

#### get variable type
{YOUR_VAR}.class. 
{YOUR_VAR}.is_a? {TYPE}

#### convert type
to_s：轉成字串(String)
to_i：轉成整數(Integer)
to_f：轉成浮點數(Float)
to_a：轉成陣列(Array)
to_h：轉成Hash

#### enum
* Rails 5 中，引入了 _prefix 和 _suffix 兩個選項來解決這個問題，它會給對應的 !、? 以及 scope 方法加上前/後綴以示區分
```ruby
# user.rb
enum status: [:temporary, :active, :deleted], _suffix: true
enum admin_status: [:active, :super_admin]

# rails console
user = User.active_status.first
user.active_status?
user.deleted_status!
```

*******************
### Operators
#### 三元運算
```ruby
expression ? true_expresion : false_expression
```

#### if
```ruby
if condition
    
end
```

#### else if
```ruby
if condition
    
elsif condition

end
```

#### else
```ruby
if condition
    
else
    
end
```

#### ==

#### True / False
只有 false 跟 nil 會得到假的值，所有其它的值都為真。（包括 0、0.0、"" 以及 []）。

#### while ... else

#### break / continue

#### for ... else

#### range()


*******************
### Number


*******************
### Strings


*******************
### Iterate


*******************
### Iterate Advanced

#### each
Executes an action using as parameter each element of the array. Returns the unmodified array.
```ruby
array.each{ |n| expression }
```

#### map / collect
Performs an action on each array element. The original array is not modified. Returns the modified array.
```ruby
array.map{ |n| expression }
array.collect{ |n| expression }
```

#### select / reject
(like python filter)
```ruby
array.select{ |n| expression }
array.reject{ |n| expression }
dict
array.select{ |k,v| expression }
```

#### reduce / inject
```ruby
array.reduce{ |x,y| expression }
array.inject{ |x,y| expression }
```

#### find / detect



*******************
### Functions


*******************
### Lambda
```ruby
f = lambda { |arg1, arg2, ...| expression }
f = -> (arg1, arg2, ...) { expression }
```


*******************
### Closure


*******************
### Modules


*******************
### Classes and Objects

#### 類別方法
```ruby
class << self
```

*******************
### DateTime


*******************
### JSON


*******************
### System


*******************
### Try...Except



**************************************
## 資料庫操作 ActiveRecord

*******************
### 資料表關聯

#### has one
- belongs_to
- optional
- class_name
- foreign_key
- touch
- counter_cache

optional: 透過 optional => true 可以允許 event 沒有 category 的情況。
```ruby
class Event < ApplicationRecord
  belongs_to :category, :optional => true
end
```

touch: 這會在修改時，也順道修改關聯資料的updated_at時間
```ruby
class Attendee < ApplicationRecord
    belongs_to :event, :touch => true
end
```

counter_cache: 關聯作計數的快取，假設Event身上有attendees_count這個欄位
```ruby
class Attendee < ApplicationRecord
    # 這樣ActiveRecord就會自動更新attendees_count的數字。
    belongs_to :event, :counter_cache => true
end
```

#### has_many
- class_name
- foreign_key
- scope
- dependent
- through
- source

scope: 匿名函式，可以設定關聯的範圍條件
```ruby
class Event < ApplicationRecord
    has_many :attendees
    has_many :paid_attendees, -> { where(:status => "paid") }, :class_name => 'Attendee'
    #...
end
```

class_name: 可以變更關聯的類別名稱
```ruby
# paid_attendees關聯，和另一個has_many :attendees都關聯到同一個attendees table
has_many :attendees
has_many :paid_attendees, :class_name => "Attendee"
```

dependent: 當物件刪除時，怎麼處理依賴它的資料
- `:destroy` 把依賴的attendees也一併刪除，並且執行Attendee的destroy回呼
- `:delete` 把依賴的attendees也一併刪除，但不執行Attendee的destroy回呼
- `:nullify` 這是預設值，不會幫忙刪除attendees，但會把attendees的外部鍵`event_id`都設成`NULL`
- `:restrict_with_exception` 如果有任何依賴的attendees資料，則連event都不允許刪除。執行刪除時會丟出錯誤例外`ActiveRecord::DeleteRestrictionError`。
- `:restrict_with_error` 不允許刪除。執行刪除時會回傳`false`，在`@event.errors`中會留有錯誤訊息。

through: 用於建立多對多的關係
source: 搭配`through`設定使用，當關聯的名稱不一致的時候，需要加上`source`指名是哪一種物件
```ruby
class Event < ApplicationRecord
    has_many :event_groupships
    has_many :classifications, :through => :event_groupships, :source => :group
end
```

foreign_key/primary_key: 
```ruby
class Event < ApplicationRecord
    belongs_to :paid_user, :class_name => "User", :foreign_key => "paid_user_id", primary_key: :uuid
    #...
end
```

#### joins, includes
- 對Model中的belongs_to和has_many關連，可以使用joins，也就是INNER JOIN
```ruby
Event.joins(:category)
# SELECT "events".* FROM "events" INNER JOIN "categories" ON "categories"."id" = "events"."category_id"

Event.joins(:category, :location)
# 可以一次關連多個
```

- 需要其關連物件的資料，例如上述的categories，我們會偏好使用includes。includes會將關連物件的資料也一併讀取出來，避免N+1問題
```ruby
Event.includes(:category, :attendees)
# SELECT "events".* FROM "events"
# SELECT "categories".* FROM "categories" WHERE "categories"."id" IN (1,2,3...)
# SELECT "attendees".* FROM "attendees" WHERE "attendees"."event_id" IN (4, 5, 6, 7, 8...)
```

#### Polymorphic Associations
可以讓一個 Model 不一定關連到某一個特定的 Model，秘訣在於除了整數的_id外部鍵之外，再加一個字串的_type欄位說明是哪一種Model

```ruby
rails g model comment content:text commentable_id:integer commentable_type

....
class Comment < ApplicationRecord
  belongs_to :commentable, :polymorphic => true
end

class Article < ApplicationRecord
  has_many :comments, :as => :commentable
end

class Photo < ApplicationRecord
  has_many :comments, :as => :commentable
end

```
告訴Rails如何去設定你的多型關係，現在讓我們進console實驗
```ruby
article = Article.first

# 透過關連新增留言
comment = article.comments.create(:content => "First Comment")

# 你可以發現 Rails 很聰明的幫我們指定了被留言物件的種類和id
comment.commentable_type => "Article"
comment.commentable_id => 1

# 也可以透過 commentable 反向回查關連的物件
comment.commentable => #<Article id: 1, ....>
```

#### ActiveSupport::Concern
就是將重複的程式，抽出來後放在 concerns 這個資料夾底下