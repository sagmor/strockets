# Strockets

Use Stitch allong with Sprockets

## Warning
This is currently under revision so the gem's API might change

## Usage

Just include this gem in your Gemfile

```ruby
gem 'sprockets'
```

And all your javascript files will be compiled using Stitch/CommonJS.
You can add 

```javascript
// no-stitch
```

on any file's first line to prevent it from being stitched.

Alternatively you can enable the compatibility mode with

```ruby
Sprockets.compatibility_mode!
```

to conditionaly stitch files that have the following header:

```javascript
// stitch
```
