# Enigmates

[![Code Climate](https://codeclimate.com/github/gschorkopf/enigmates.png)](https://codeclimate.com/github/gschorkopf/enigmates)
[![Coverage Status](https://coveralls.io/repos/gschorkopf/enigmates/badge.png)](https://coveralls.io/r/gschorkopf/enigmates)
[![Build Status](https://travis-ci.org/gschorkopf/enigmates.png)](https://travis-ci.org/gschorkopf/enigmates)

### Solvin' puzzles. Bring your friends.

#### About Enigmates

This project is under construction. The MVP will be available Thursday, July 18th.

Enigmates is an open source project for gSchool, built as a mastery project by [Geoff Schorkopf](http://www.github.com/gschorkopf). Enigmates sharpens your mind with daily puzzles you can solve simultaneously with friends -- or with a complete stranger. Modes include 'versus' and 'co-op', and puzzle varieties include map challenges, sporcle-styled lists, and more. The app uses Faye for pubsub, d3 for puzzle visuals, and Omniauth for authorization (Twitter, Google, and Facebook).

#### Visit Enigmates's production site

Production server is available at [enigmates.herokuapp.com](http://enigmates.herokuapp.com).

#### Install Enigmates locally

To install and deploy:
* Pull down repository
* `bundle install`
* rake db:migrate; rake db:seed
* `unicorn -p 8080`
* `rackup private_pub.ru -s thin -E production`

To run tests, run `rake db:test:prepare; rspec`.

#### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

#### Contact

Feel free to contact me via Twitter: [Geoff Schorkopf](http://twitter.com/gschork)
