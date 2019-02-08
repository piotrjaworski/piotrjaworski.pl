require 'sinatra'
require 'sinatra/reloader' if development?
require 'yaml'

set :views, ['app', 'views']
set :environment, ENV.fetch('RACK_ENV', 'development')
set :server, :puma
set :public_dir, 'public'

get '/' do
  yaml_data = YAML.load_file('app/data.yml')

  @tutorials = yaml_data['tutorials']
  @talks = yaml_data['talks']
  @opensource = yaml_data['opensource']
  @backend =  yaml_data['backend']
  @frontend = yaml_data['frontend']
  @other = yaml_data['other']

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

  def pdf_tag(pdf_name, description)
    "<a href='/files/#{pdf_name}' target='_blank'>#{description}</a>"
  end
end
