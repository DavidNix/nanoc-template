# A Little Nanoc Template
Especially for hosting a static site on S3.

## Setup

You probably want to change the .ruby-gemset and .ruby-version if using rvm.

Do the ole `bundle install`.

See the config instructions for the [s3_website gem](https://github.com/laurilehmijoki/s3_website)

Change `s3_website.yml` to your config.

Run `3_website cfg apply`

### Featuring

Simple cache busting and cleaning - put your js and css into `content/js` or `content/css`.

Auto-inserting of asset links into `<head>`.

Minitest integration via `rake test`.

Use `rake upload` to upload your site to S3.

Only compress js and css when we're ready to upload the live site.

### LICENSE

Copyright (C) 2014  David Nix

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.