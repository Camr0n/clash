# Clash

Clash is a diff based testing framework for static sites.

[![Build Status](https://travis-ci.org/imathis/clash.svg)](https://travis-ci.org/imathis/clash)
[![Gem Version](http://img.shields.io/gem/v/clash.svg)](https://rubygems.org/gems/clash)
[![License](http://img.shields.io/:license-mit-blue.svg)](http://imathis.mit-license.org)

## Installation

Add this line to your application's Gemfile:

    gem 'clash'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install clash

## Usage

```
clash [test(s)] [options]
```

To run only specific tests, pass test numbers separated by commas.

```
$ clash 1     # run only the first test
$ clash 2,3   # run the second and third tests
```

### CLI options
  
```
-f, --file    FILE      Use a specific test file (default: .clash.yml)
-c, --context NUMBER    On diff errors, show NUMBER of lines of surrounding context (default: 2)
-h, --help              show this message
```

## Configuration
  
Clash reads its configuration from a .clash.yml file in the root of your project. Use the --file
option to choose a different configuration file.

Simple configuration:
Clash will build the site with Jekyll, and compare the contents of _site/ to expected/.

```
build: true
compare: _site, expected
```

### Configuration options

| Option           | Type           | Description                                              |
|:-----------------|:---------------|:---------------------------------------------------------|
| name             | String         | Include a descriptive name with test output.             |
| before           | String/Array   | Run system command(s) before running tests.              |
| build            | Boolean        | Build the site with Jekyll.                              |
| config           | Hash           | Configure Jekyll, Octopress or Ink plugins. (Info below) |
| compare          | String/Array   | Compare files or directories. e.g. "a.md, b.md"          |
| enforce_missing  | String/Array   | Ensure that these files are not found.                   |
| after            | String/Array   | Run system command(s) after running tests.               |

Note: in the table above, String/Array means a single argument can be a string, but mutliples
can be passed as an array. For example:

```yaml
compare: _site, expected                      # Compare two directories
compare:                                      # Compare mutiple items
  - _site/index.html, expected/index.html
  - _site/atom.xml, expected/atom.xml
  - _site/posts, expected/posts
```

To run multiple tests each test should be an array, for example:

```
-
  name: Check site build
  build: true
  compare: _site, _expected
-
  name: Check asset compression
  compare: _cdn_build, _cdn_expected
```

Note: When running multiple tests, adding a name can help the reading of test failures.

### Configuring Jekyll, Octopress and Octopress Ink plugins

```
build: true
config:
  jekyll:    
    - _configs/config.yml
    - _configs/test1.yml
  octopress: _configs/octopress.yml
  feed:      _configs/feed.yml
```

In this example:

- Jekyll will build with `--config _configs/config.yml,_configs/test1.yml`
- _configs/octopress.yml will be copied to ./_octopress.yml (and removed after tests)
- _configs/feed.yml will be copied to ./_plugins/feed/config.yml (and removed after tests)

This will not overwrite existing files as they will be backed up an restored after tests.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/clash/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
