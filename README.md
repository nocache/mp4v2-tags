# Mp4v2::Tags

Mp4v2::Tags is libmp4v2 binding for Ruby.

## Require

* libmp4v2

### Homebrew

```
brew install mp4v2
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mp4v2-tags', :git => "https://github.com/t-cyrill/mp4v2-tags"
```

And then execute:

    $ bundle

Or install it yourself as.

## Usage

```ruby
require './lib/mp4v2/tags'

filename = './example.m4a'

# Show aac tags
# IMPORTANT:: Currently, mp4v2 is not support all aac tags.
# Mp4v2::Native::MP4Tags.keys returns available keys.
# See also: lib/mp4v2/tags/native/mp4_tags.rb
tags = Mp4v2::Tags.fetch_mp4_tags filename
p tags

tags[:name] = 'Example music'
tags[:artist] = 'Example music'
tags[:album_artist] = 'Example music'

# Update tags
Mp4v2::Tags.store_mp4_tags filename, tags
```

## Contributing

1. Fork it ( https://github.com/t-cyrill/mp4v2-tags/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
