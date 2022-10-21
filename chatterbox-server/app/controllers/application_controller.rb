class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do
    # returns an array of all messages as JSON, ordered by created_at in ascending order.
    messages = Message.all.order(:created_at)
    messages.to_json
  end

  post '/messages' do
    # creates a new message with a body and username from params
    # returns the newly created post as JSON.
    messages = Message.create(body: params[:body], username: params[:username])
    messages.to_json
  end

  patch '/messages/:id' do
    # updates the body of the message using params, and returns the updated message as JSON.
    message = Message.find(params[:id])
    message.update(body: params[:body])
    message.to_json 
  end

  delete '/messages/:id' do
    #  deletes the message from the database.
    message = Message.find(params[:id])
    message.destroy
    message.to_json 
  end
  
end
