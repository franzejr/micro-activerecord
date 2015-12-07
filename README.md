#MicroActive Record

Micro Active Record uses ideas from [Active Record](https://github.com/rails/rails/tree/master/activerecord) and try to create classes that connect Files: CSV, Text, YAML.


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


## Typical usage


## Authors

[@franzejr](http://github.com/franzejr)
[@rafaelsales](https://github.com/rafaelsales)


## Contributing

1. Fork it
2. Create your feature branch: `git checkout -b my-new-feature`
3. Run tests: `rake`
4. Commit your changes: `git commit -am 'Add some feature'`
5. Push to the branch: `git push origin my-new-feature`
6. Create new Pull Request
