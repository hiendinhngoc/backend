# Fake tinder

This is the back-end version of tinder( :couple: ) cloning app. There are some basic functions:

* `GET /api/v1/users` => Shows potential partner info

* `POST /api/v1/user/like` => Likes an interesting user

* `POST /api/v1/user/pass` => Stays away from someone

* `GET /api/v1/user/favoriting` => Group of favourite guys

* `GET /api/v1/user/matching` => We have so much in common

## Versions
- Ruby: 3.0.2
- Rails: 6.1.4.1
- Database: sqlite3(1.4)


## Running test
`$bundle exec rspec`
or
`$bundle exec rspec spec/path/to/your/file`

## Lint check
`$rububop`
or
`$rubocop path/to/your/file`

auto fix the error by adding `-a` or `-A`(be careful) options

## Running
`$rails s -p 3001`
