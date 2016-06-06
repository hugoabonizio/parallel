# Parallel.cr

Parallel processing in Crystal

```crystal
Parallel.map(1..10) do |x|
  # CPU-heavy stuff...
  puts x
end
```

```crystal
Parallel.map(['a', 'b', 'c']) do |x|
  # CPU-heavy stuff...
  puts x
end
```

## Installation


Add this to your application's `shard.yml`:

```yaml
dependencies:
  parallel:
    github: hugoabonizio/parallel
```


## Usage


```crystal
require "parallel"
```


TODO: Write usage instructions here

## Development

TODO: Write development instructions here

## Contributing

1. Fork it ( https://github.com/hugoabonizio/parallel.cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [[hugoabonizio]](https://github.com/[your-github-name])  - creator, maintainer
