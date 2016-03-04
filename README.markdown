# es-reindex add on - simple ruby script for copying ElasticSearch index

Simple ruby script to copy and reindex ElasticSearch index,
copying index settings and mapping(s).

Progress and time estimation is displayed during the scrolling process.

## Requirements

Ruby 1.8.6 or newer is required, use [rvm](https://rvm.io/) for convenience.

Following gems are required via `Gemfile`:

+ [rest-client] (https://github.com/archiloque/rest-client)
+ [oj] (https://github.com/ohler55/oj)

You can install the requirements locally via `bundler`:

    $ bundle install --path=.bundle

## Usage

Refer to script's help:

    $ ./reindex "ES host"  "hostname" "version number"

