# In config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
 provider :google_oauth2, ENV['GOOGLE_APP_ID'], ENV['GOOGLE_APP_SECRET']


# OAuth2 documentations on prompts
 {
 	scope: 'email,profile',#ask for things from google 
 	prompt: 'select_account', #ask for certain prompts 
 	image_aspect_ratio:'square',
 	image_size: 50,

 }
end
