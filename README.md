# rubyTutor

<!-- MarkdownTOC autolink="true" style="ordered" -->

1. [Base](#base)
  1. [Syntax](#syntax)
    1. [Comments:](#comments)
    1. [Multiline Comments:](#multiline-comments)
  1. [Variables](#variables)
    1. [get variable type](#get-variable-type)
    1. [convert type](#convert-type)
    1. [enum](#enum)
    1. [作用域](#%E4%BD%9C%E7%94%A8%E5%9F%9F)
  1. [Operators](#operators)
    1. [三元運算](#%E4%B8%89%E5%85%83%E9%81%8B%E7%AE%97)
    1. [if](#if)
    1. [else if](#else-if)
    1. [else](#else)
    1. [==](#)
    1. [True / False](#true--false)
    1. [while ... else](#while--else)
    1. [break / continue](#break--continue)
    1. [for ... else](#for--else)
    1. [range\(\)](#range)
    1. [switch / case](#switch--case)
  1. [Number](#number)
  1. [Strings](#strings)
    1. [常數 TODO](#%E5%B8%B8%E6%95%B8-todo)
    1. [切片](#%E5%88%87%E7%89%87)
    1. [長度](#%E9%95%B7%E5%BA%A6)
    1. [分割](#%E5%88%86%E5%89%B2)
    1. [連結](#%E9%80%A3%E7%B5%90)
    1. [取代 TODO](#%E5%8F%96%E4%BB%A3-todo)
    1. [尋找或計算 TODO](#%E5%B0%8B%E6%89%BE%E6%88%96%E8%A8%88%E7%AE%97-todo)
    1. [格式化 TODO](#%E6%A0%BC%E5%BC%8F%E5%8C%96-todo)
    1. [判斷 TODO](#%E5%88%A4%E6%96%B7-todo)
    1. [Regular Expressions](#regular-expressions)
  1. [Iterate](#iterate)
  1. [Iterate Advanced](#iterate-advanced)
    1. [each](#each)
    1. [map / collect](#map--collect)
    1. [select / reject](#select--reject)
    1. [reduce / inject](#reduce--inject)
    1. [find / detect](#find--detect)
  1. [Functions](#functions)
  1. [Lambda](#lambda)
  1. [Closure](#closure)
  1. [Modules](#modules)
  1. [Classes and Objects](#classes-and-objects)
    1. [類別方法](#%E9%A1%9E%E5%88%A5%E6%96%B9%E6%B3%95)
  1. [DateTime](#datetime)
    1. [時區](#%E6%99%82%E5%8D%80)
    1. [時間加減](#%E6%99%82%E9%96%93%E5%8A%A0%E6%B8%9B)
    1. [格式化](#%E6%A0%BC%E5%BC%8F%E5%8C%96)
  1. [JSON](#json)
  1. [System](#system)
  1. [Try...Except](#tryexcept)
  1. [網路](#%E7%B6%B2%E8%B7%AF)
    1. [解析url](#%E8%A7%A3%E6%9E%90url)
1. [演算法 Algorithm](#%E6%BC%94%E7%AE%97%E6%B3%95-algorithm)
  1. [亂數](#%E4%BA%82%E6%95%B8)
1. [功能 / Framework](#%E5%8A%9F%E8%83%BD--framework)
  1. [CSV](#csv)
1. [資料庫操作 ActiveRecord](#%E8%B3%87%E6%96%99%E5%BA%AB%E6%93%8D%E4%BD%9C-activerecord)
  1. [資料表關聯](#%E8%B3%87%E6%96%99%E8%A1%A8%E9%97%9C%E8%81%AF)
    1. [has one](#has-one)
    1. [has_many](#has_many)
    1. [joins, includes](#joins-includes)
    1. [Polymorphic Associations](#polymorphic-associations)
    1. [ActiveSupport::Concern](#activesupportconcern)

<!-- /MarkdownTOC -->


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

#### 作用域

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

#### switch / case
```ruby
case 'abcdef'
when 'aaa', 'bbb'
  puts "aaa or bbb"
when /def/
  puts "includes /def/"
end
```


*******************
### Number


*******************
### Strings

#### 常數 TODO
- string.ascii_letters
- string.ascii_lowercase
- string.ascii_uppercase
- string.digits
- string.hexdigits
- string.octdigits

#### 切片
```ruby
'123456789'[0..-1] 取全部
'123456789'[0..3] => '1234'
'123456789'[0,3]  => '123' 取長度
```

#### 長度
```ruby
str.size
str.length
```

#### 分割
```ruby
" now's  the time".split(' ')   #=> ["now's", "the", "time"]
" now's  the time".split(/ /)   #=> ["", "now's", "", "the", "time"]
"1, 2.34,56, 7".split(%r{,\s*}) #=> ["1", "2.34", "56", "7"]
```

#### 連結
`["keyboard", "monitor", "CPU"].join(",")`

#### 取代 TODO
- replace: `str.replace(old, new[, max])` default max可指定替換次數
- strip: 預設去除空白 `' abcabc '.strip()`

#### 尋找或計算 TODO
- find: 找不到則為-1 `str.find(find_str)`
- rfind: `str.rfind(find_str)`
- count: `str.count(count_str)`

#### 格式化 TODO

#### 判斷 TODO
- startswith: 字首是不是 `str.startswith({word})`
- endswith: 字尾是不是 `str.endswith({word})`
- isalnum: 是否只有英數 `str.isalnum()`

#### Regular Expressions
Rubalar: http://rubular.com/

```ruby
# new
re = Regexp.new(pat)

phone = "123-456-7890"
if phone =~ /(\d{3})-(\d{3})-(\d{4})/
  ext  = $1
  city = $2
  num  = $3
end
```

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
- Date
- Time
    - Time.current (not use Time.now)

```ruby
>>> Time.current.to_i == Time.now.to_i
true

>>> Time.current.to_i == Time.new.to_i
true
```

#### 時區
- Time.utc

#### 時間加減
```ruby
Time.local(2018, 11, 30)  本地時間
Time.utc(2008, 7, 8, 9, 10)

Time - 10 (減秒數)
Date - 10 (減天數)
expires = now + 10.days     # 10 days from now
expires - now             # 864000.0 (seconds)
(expires - now).to_hours  # 240.0 (hours)

Time.now t.strftime("pattern")
%a 星期几名称的缩写（比如 Sun）。
%A  星期几名称的全称（比如 Sunday）。
%b  月份名称的缩写（比如 Jan）。
%B  月份名称的全称（比如 January）。
%c  优选的本地日期和时间表示法。
%d  一个月中的第几天（01 到 31）。
%H  一天中的第几小时，24 小时制（00 到 23）。
%I  一天中的第几小时，12 小时制（01 到 12）。
%j  一年中的第几天（001 到 366）。
%m  一年中的第几月（01 到 12）。
%M  小时中的第几分钟（00 到 59）。
%p  子午线指示（AM 或 PM）。
%S  分钟中的第几秒（00 或 60）。
%U  当前年中的周数，从第一个星期日（作为第一周的第一天）开始（00 到 53）。
%W  当前年中的周数，从第一个星期一（作为第一周的第一天）开始（00 到 53）。
%w  一星期中的第几天（Sunday 是 0，0 到 6）。
%x  只有日期没有时间的优先表示法。
%X  只有时间没有日期的优先表示法。
%y  不带世纪的年份表示（00 到 99）。
%Y  带有世纪的年份。
%Z  时区名称。
%%  % 字符。
```

#### 格式化
Time.strftime(format)

*******************
### JSON
- JSON.generate(my_hash)  or. my_hash.to_json
- as_json 轉 ruby_json 格式
- JSON.parse(json_string)

*******************
### System


*******************
### Try...Except


*******************
### 網路

#### 解析url
URI.parse
```ruby
o = URI.parse('https://termly.io')

o.scheme
o.path
o.read
```


**************************************
## 演算法 Algorithm

*******************
### 亂數
```ruby
rand                    # float random
rand(1..10)             # range random
rand(max)               # int random
(1..100).to_a.sample    
(1..100).to_a.shuffle   # 洗牌
```




**************************************
## 功能 / Framework

*******************
### CSV
https://ruby-doc.org/stdlib-2.0.0/libdoc/csv/rdoc/CSV.html
https://github.com/roo-rb/roo



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