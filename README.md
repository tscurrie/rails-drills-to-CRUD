# Rails Review
## Weekend Mini-Lab: Time Trials

| Objective |
| :--- |
| Your goal is to build this project from scratch at least three times this weekend.  Attempt to complete the following functionality within **three** hours with an eventual target time of under **two** hours. |

**NOTE**: *Please use a timer to time yourself when working on part 1. You'll be doing part 1 at least three times! Please have your two `best` times recorded and ready to share on Monday, and have notes of questions that came up when doing this process.*

Each time you do this, create your rails app in a new directory like `trial1`, `trial2` or `trial3`.

**NOTE**: See below for submission instructions.

Resources:

* [rails generate](http://guides.rubyonrails.org/command_line.html#rails-generate)
* [rails destroy](http://guides.rubyonrails.org/command_line.html#rails-destroy)
* If you are not clear on how to edit a resource, take a look over this [section](http://guides.rubyonrails.org/getting_started.html#updating-articles) of the rails guides.
* [Ffaker Gem](https://github.com/ffaker/ffaker) - for seeding the database.
* [Rails Guides](http://guides.rubyonrails.org/) - everything you need to know to start up a new rails app.
* [Views glossary](https://github.com/sf-wdi-25/notes/blob/master/week-07-rails/day-04-rails/dusk-views/glossary.md)
* [auth tutorial](https://github.com/sf-wdi-25/public_library_app/blob/master/1_users_and_auth.md)

---
---
---

**START THE TIMER!** You have 3 hours!

---
---
---

## Part 1. Blog Time Trials

* Create your rails app in a directory like `trial1`, `trial2`, `trial3`.
* Use git properly: commit as you go!

### Models

Use the following when constructing a blog. You should not add styling or anything extra during time trials. This is barebones functionality.

* We need 3 models
  * a `user` model with the following attributes
    * `email`, `first_name`, `last_name`, `password_digest`
    * We need authentication in our `user` model, i.e. `User.confirm` and `secure_password`
    * We need simple validations on our user, i.e. a unique `email`, email and password confirmations, and presence for both attributes.
  * an `article` model
    * `title` and `content`
    * simple validations on the title and content for presence
* We need one association
  * 1 to Many: `user` and `article`

### Controllers & Views

* We need a `sites` controller with `index`, `about`, and `contact`
* We need a `users` controller with all seven resources
* We need an `articles` controller with all seven resources
* We need a `sessions` controller with at least `new` and `create`.
* We need `session_helper` methods for `login`, `logged_in?`, `logout`, and `current_user`.

### Authentication & Authorization

With all of the above `users` should be able to do the following:

* `users` can `sign_up`
* `users` can `login`
* `users` can `logout`
* `users` can view, create, and edit articles once logged in.
* `users` can only `edit`, `update`, and `destroy` their own articles


### Partial It Up

Go back through your application and create partials for your nav, login/signup forms, and any other areas with significant repetition in your html.

### Seed Your Application

Add the `ffaker` gem to your Gemfile and use it in your `db/seeds.rb` file to create fake users and associated articles, here's a [cheatsheet](http://ricostacruz.com/cheatsheets/ffaker.html) for it.

/db/seeds.rb

```ruby
# create 100 users
100.times do

  # build the user params
  user_params = Hash.new
  user_params[:email] = Faker::Internet.email
  user_params[:email_confirmation] = user_params[:email]
  user_params[:password]  = "123456"
  user_params[:password_confirmation] = user_params[:password]
  # save the user
  new_user = User.create(user_params)

  # create 10 articles for each user
  10.times do
    new_article = Article.new
    new_article.title = Faker::HipsterIpsum.words(rand(8)+2).join(" ")
    new_article.content = Faker::HipsterIpsum.paragraphs(1+ rand(4)).join("\n")
    # save the article
    new_article.save
    # associate the article with the user
    new_user.articles.push new_article
  end

end

```

---
---
---

**STOP THE TIMER!** Record your time and how far you got! Take a break. When you're ready, do it all over again! If you're still under three hours, you may push onward into part 2!

---
---
---


## Part 2. CRUD anything

<img src="https://cloud.githubusercontent.com/assets/1329385/11764306/6a85c4e8-a0df-11e5-8579-2f4886e1d121.gif">

**Objective:** Make something in Rails using all the aspects of CRUD. It's up to you to come up with an idea, but it must have **a model, views, controllers, and routes** to `create`, `read`, `update` and `delete` at least one resource.  You also need **at least one relationship**.

**NOTE** you don't need to add users and authentication. Actually, don't add authentication just to fulfill the CRUD requirement because that would be boring.

In addition, you are **required to use a gem or feature of Rails which hasn't been covered explicitly in class**.

Finally, please create this rails app in a directory named: `crud_app`.

## Example Gems or Rails Features

* <a href="https://github.com/markets/awesome-ruby" target="_blank">GIANT LIST OF AWESOME GEMS</a>
* <a href="http://code.tutsplus.com/articles/24-extremely-useful-ruby-gems-for-web-development--net-23863" target="_blank">CLICK BAIT</a>
* <a href="http://guides.rubyonrails.org/4_2_release_notes.html" target="_blank">Rails 4.2 Release Notes</a>
* <a href="http://guides.rubyonrails.org/4_1_release_notes.html" target="_blank">Rails 4.1 Release Notes</a>
* <a href="http://guides.rubyonrails.org/4_0_release_notes.html" target="_blank">Rails 4.0 Release Notes</a>
* <a href="https://blog.engineyard.com/2013/new-in-rails-4" target="_blank">Rails 4 Stuff</a>

## Getting started & Submission

Fork and clone this repository. Change the `readme.md` to reflect what your project does, and then submit a pull request back to this repo once you're done.  

Your PR should include 4 directories/rails-apps:
* trial1
* trial2
* trial3
* crud_app
