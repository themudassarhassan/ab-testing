# README

## Assumptions

* We will have a content management system where content editors will write versions of
the same article and those versions will be saved to the database.

* One version can be assigned to multiple users
* When a user lands it will be assigned a version and it will remain the same.

## Application Dependencies
- Ruby `3.2.2`
- Rails `7.1.3`

## Local Setup

- Run `bin/setup` which will setup everything to run the application locally.
- Run 'bin/dev' to start the development server.
- Application will be available at `http://localhost:3000`
- Run `bundle exec rspec` to run test suit.

## Steps to follow

- Visit `http://localhost:3000/article` which will assign a random variation of an article to the user.
- Try to reload the page and the assinged variation should not change. Each reload should track `page_view` event.
- Clicking the signup button should track `signup` event and navigate to blank registration page.
- Visit `http://localhost:3000/article` via different browser which will assign another random variation.
- Perform above steps again.
- All events are being recorded in `Analytics` model in database.
- Run `bin/rails console` to access the application console.
