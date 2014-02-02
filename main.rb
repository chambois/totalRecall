
require 'sinatra'

get '/' do
  erb :home
end

get '/questionnaire' do
	# ??? What to respond with for here?
end

post '/questionnaire' do
	erb :questionnaire 
end

get '/question' do
  
end

post '/question' do
  
end

# REST
# ====
# Question
#		create  => POST /question
#		get			=> GET /question/:id
#   update  => PUT /question/:id
#   delete  => DELETE /question/:id
# Questionnaire /questionnaire
#		create
#		get
#		update
#		delete
# Answer /answer
#		
#
#	Data Modelling
#	==============
#		Question --< Answer
#		Questionnaire --< Question
#
#		Question --- ProvidedAnswer
