require 'sinatra'
require 'mandrill'


get '/' do
  erb :index
end

get '/contact' do
  erb :contact
end

get '/about' do
  erb :about
end

get '/sendemail' do
  m = Mandrill::API.new
  email = {
    :subject => "Message from Business Site",
    :text => "#{ params[:message] }",
    :from_name => "#{ params[:sender] }",
    :to => [
      {
        :email => "jim@nycda.com",
        :name => "#{ params[:receiver]}"
      }
    ],
    :html => "<html>#{params[:message]}</html>",
    :from_email => "themysteryman@aol.com"
  }
  emailstatus = m.messages.send email
  p emailstatus
  erb :sent
end