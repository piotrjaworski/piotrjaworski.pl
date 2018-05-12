require 'sinatra'
require 'sinatra/reloader' if development?

set :views, ['app', 'views']
set :environment, ENV.fetch('RACK_ENV', 'development')
set :server, :puma
set :public_dir, 'public'

get '/' do
  @tutorials = [
    {
      title: "How to Setup Rails Application on Heroku – Redis, Sidekiq, Action Cable and Cron Configuration",
      description: "A tutorial which shows how to setup and deploy your Rails application on Heroku to a production environment in order to see it live.",
      link: "https://www.nopio.com/blog/setup-rails-application-heroku"
    },
    {
      title: "Elasticsearch with Rails – How to Create a Simple Search Engine in 1 Hour",
      description: "A tutorial which covers basic integration of Elasticsearch with Ruby on Rails.",
      link: "https://www.nopio.com/blog/elasticsearch-rails"
    },
    {
      title: "Sidekiq with Pusher – Why Is It Worth to Use Them Together?",
      description: "In this article, I cover is it worth to connect Pusher with Ruby on Rails.",
      link: "https://www.nopio.com/blog/sidekiq-with-pusher"
    },
    {
      title: "How to build Airbnb Map Clone using React with Ruby on Rails",
      description: "In this article, I show how to build an Airbnb Map clone using ReactJS and Ruby on Rails.",
      link: "https://www.nopio.com/blog/airbnb-map-tutorial-react-rails"
    },

    {
      title: "Hanami – Ruby Web Framework - Review",
      description: "A review which covers and briefly describes Hanami - Ruby web framework.",
      link: "https://www.nopio.com/blog/hanami-ruby-web-framework-review"
    },
    {
      title: "Ruby State Machine – AASM Tutorial with Sequel, SQLite, Rake and RSpec",
      description: "A tutorial which shows features of AASM - Ruby state machine connected with Sequel, SQLite and Rake.",
      link: "https://www.nopio.com/blog/ruby-state-machine-aasm-tutorial"
    },
    {
      title: "Rails API with Active Model Serializers – Part 2",
      description: "The second part of the tutorial which covers how to create a secure Rails API using HTTP Tokens and ActiveModelSerializers.",
      link: "https://www.nopio.com/blog/rails-api-tests-rspec"
    },
    {
      title: "Rails API with Active Model Serializers – Part 1",
      description: "The first part of the tutorial which covers how to create a secure Rails API using HTTP Tokens and ActiveModelSerializers.",
      link: "https://www.nopio.com/blog/rails-api-active-model-serializers"
    },
    {
      title: "Web Scraping in Ruby with Watir",
      description: "An article which covers how to automatically parse rich web pages using Watir.",
      link: "https://www.nopio.com/blog/web-scraping-with-watir"
    },
    {
      title: "How to set up Local Environment for Rails with SublimeText",
      description: "Article which covers local development configuration for Rails and JavaScript using SublimeText on macOS / UNIX.",
      link: "https://www.nopio.com/blog/local-environment-configuration-rails-sublimetext"
    },
    {
      title: "Rails Chat Application – part 2",
      description: "Tutorial which covers simple chat applications using Action Cable - new Rails 5 feature.",
      link: "https://www.nopio.com/blog/rails-chat-application-actioncable"
    },
    {
      title: "Rails Chat Application – part 1",
      description: "Tutorial which covers simple chat applications using Action Cable - new Rails 5 feature.",
      link: "https://www.nopio.com/blog/rails-real-time-chat-application-part-1"
    },
    {
      title: "AngularJS and Ruby on Rails Tutorial",
      description: "Tutorial which shows how to integrate Ruby on Rails with AngularJS.",
      link: "https://www.nopio.com/blog/angularjs-tutorial"
    },
    {
      title: "React On Rails – part 3",
      description: "Third part of the tutorial, which shows how to connect Ruby on Rails with Facebook's front-end framework - React.Js.",
      link: "https://www.nopio.com/blog/react-pagination-rails-tutorial"
    },
    {
      title: "React On Rails – part 2",
      description: "Second part of the tutorial, which shows how to connect Ruby on Rails with Facebook's front-end framework - React.Js.",
      link: "https://www.nopio.com/blog/react-on-rails-tutorial-part-2"
    },
    {
      title: "React On Rails – part 1",
      description: "First part of the tutorial, which shows how to connect Ruby on Rails with Facebook's front-end framework - React.Js.",
      link: "https://www.nopio.com/blog/react-rails-part-1-tutorial/"
    },
    {
      title: "Search application with Blacklight",
      description: "Tutorial which shows how to integrate Ruby on Rails with Apache Solr - using Blacklight.",
      link: "https://www.nopio.com/blog/create-search-application-blacklight/"
    }
  ]

  erb :index, layout: :application
end

helpers do
  def image_tag(name, params = {})
    "<img src='assets/images/#{name}' alt='#{params[:alt]}' id='#{params[:id]}' class='#{params[:class]}' />"
  end

  def mail_to(email, text)
    "<a href='mailto:#{email}'>#{text}</a>"
  end

  def stylesheet_tag(name)
    "<link href='assets/styles/#{name}' rel='stylesheet' type='text/css' />"
  end
end
