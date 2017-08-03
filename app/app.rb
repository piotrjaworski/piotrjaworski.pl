require 'dotenv/load'
require 'sinatra'
require 'sinatra/reloader' if development?

set :views, ['app', 'views']
set :environment, ENV.fetch('RACK_ENV', 'development')
set :server, :puma
set :public_dir, 'public'

get '/' do
  @tutorials = [
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
