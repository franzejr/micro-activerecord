#MicroActive Record

Micro Active Record is a minimalistic and it uses ideas from [Active Record](https://github.com/rails/rails/tree/master/activerecord) trying to create classes that connect Files.

If you are looking for a use files as databases, for some specific reason, probably MicroActiveRecord can fits your interests.

## CSV

```ruby
Person < MicroActiveRecord::CSVAdapter
  columns :name, :age

  def initialize(hash)
    super(hash)
  end
end
```

## Features
  - Handy File Management, such as databases for CSV files
  - Simple ORM for files

## Typical usage

If you are creating a simple application and don't want to use a DBMS, you can just use files. CSV or TXT files. In this scenario, MicroActiveRecord can be handy for you. With a similar usage to ActiveRecord from Rails, you can deal with files using an ORM.

## Authors

- [@franzejr](http://github.com/franzejr)
- [@rafaelsales](https://github.com/rafaelsales)


## Contributing

1. Fork it
2. Create your feature branch: `git checkout -b my-new-feature`
3. Run tests: `rake`
4. Commit your changes: `git commit -am 'Add some feature'`
5. Push to the branch: `git push origin my-new-feature`
6. Create new Pull Request
