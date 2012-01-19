# Strockets

Use Stitch allong with Sprockets

## Warning
This is currently under revision so the gem's API might change

## Installation

### Rails 3.1

Just include this gem in your Gemfile

```ruby
gem 'sprockets'
```

### Others

After adding the gem to your Gemfile, register Strockets on your sprockets environment:

```ruby
env.append_path Strockets.stitch_path

env.register_postprocessor(
  'application/javascript',
  Strockets::StitchPostprocessor
)

```
## Usage

By default Strockets will Stitch every file excluding application.js and those inside a vendor directory or a gem.

But you can force the stitching of a file by adding a directive to your file's header like

```javascript
//= stitch true|false
```

## Configuration

Strockets has the following options:

 * `Strockets.namespace`: Which namespace to use
 * `Strockets.default_to_stitch`: Default Action (to stitch or not to stitch)
 * `Strockets.stitch_exceptions`: Which files shouldn't follow the default action
