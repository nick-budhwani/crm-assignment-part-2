require 'sinatra'
require_relative 'contact'

Contact.create('Johnny', 'Bravo', 'johnny@bitmakerlabs.com', 'Rockstar')

get '/contacts/1' do
  @contact = Contact.get(1)
  erb :show_contact
end

get '/' do
  @crm_app_name = "Nick's CRM"
  erb :index
end

get '/contacts' do
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

post '/contacts' do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/contacts')
end
