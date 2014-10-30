require 'sinatra'
require 'mandrill'

#https://wireframe.cc/rUstuG
get '/' do
  erb :index
end

get '/contact' do
  erb :contact
end

get '/about' do
  erb :about
end

post '/sendemail' do
  m = Mandrill::API.new
  email = {
    :subject => "Message from Business Site",
    :text => "#{ params[:message] }",
    :from_name => "#{ params[:sender] }",
    :to => [
      {
        :email => "herrwagner1680@gmail.com",
        :name => "#{ params[:receiver]}"
      }
    ],
    :html => "<html>#{params[:message]}</html>",
    :from_email => "jim@nycda.com"
  }
  emailstatus = m.messages.send email
  p emailstatus
  erb :sent
end
