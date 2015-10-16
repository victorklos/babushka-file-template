
# Babushka file template

This project provides the development version of the file template from
`victorklos:babushka-deps`. If you are looking for the template itself to
directly use it with babushka, simply include a `require 'victorklos:noop'` at
some top level and babushka will make sure it understands `deps` of the `file`
template. This gets you an exact copy:
https://github.com/victorklos/babushka-deps/blob/master/templates/file.rb


## Rationale

Embedding the tests inside `victorklos:babushka-deps` didn't seem to make much
sense. So. There.


## Usage

The file template provides a simple way to create babushka dependencies that
create a file. The basic idea is to just do:

    dep 'somefile.txt.file' do
      content "hi there!"
    end

This will create a file `somefile.txt` with the given content.

Besides `content`, the file template also supports `url`, `source` and `render`
as "origins". These create files from urls (use this for gists), a literal
source (will result in a `curl` call with `file://` url) and an `erb` template
respectively.  Only a single origin can be specified.

As babushka does not support slashes in dep names you can use a pipe character
instead. So, `dep '|tmp|log.txt.file'` will create `/tmp/log.txt`.

By default, the file creation is one-off, meaning that a dependency is met when
the file exists. If you find use cases that are not covered by this behaviour
please create an issue.


## Contributing

You only need this project if you will be fixing/changing/extending my babushka
file template. If you do, just add tests, add code, run `rake test` till you
are happy and get on with life. It would be nice if you shared your work, pull
requests are gladly accepted.

The tests assume babushka is installed in `/usr/local/babushka`.

Remember to run `bundle install`.


## Licence

MIT, see LICENCE file.

