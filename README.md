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
`array.each{ |n| expression }`

#### map / collect
Performs an action on each array element. The original array is not modified. Returns the modified array.
`array.map{ |n| expression }`
`array.collect{ |n| expression }`

#### select / reject
(like python filter)
`array.select{ |n| expression }`
`array.reject{ |n| expression }`
dict
`array.select{ |k,v| expression }`

#### reduce / inject
`array.reduce{ |x,y| expression }`
`array.inject{ |x,y| expression }`

#### find / detect



*******************
### Functions


*******************
### Lambda
`f = lambda { |arg1, arg2, ...| expression }`
`f = -> (arg1, arg2, ...) { expression }`


*******************
### Closure


*******************
### Modules


*******************
### Classes and Objects


*******************
### DateTime


*******************
### JSON


*******************
### System


*******************
### Try...Except
