require 'sinatra'
require_relative 'contact'

Contact.create('Johnny', 'Bravo', 'johnny@bitmakerlabs.com', 'Rockstar')
Contact.create('nick', 'b', 'johnny@bitmakerlabs.com', 'Rockstar')
Contact.create('jack', 'brown', 'johnny@bitmakerlabs.com', 'Rockstar')
Contact.create('aaron', 'baldwin', 'johnny@bitmakerlabs.com', 'Rockstar')
Contact.create('steven', 'Bravo', 'johnny@bitmakerlabs.com', 'Rockstar')
Contact.create('eric', 'Bravo', 'johnny@bitmakerlabs.com', 'Rockstar')
Contact.create('harley', 'Bravo', 'johnny@bitmakerlabs.com', 'Rockstar')

get '/contacts/:id' do
  @contact = Contact.get(params[:id].to_i)
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
