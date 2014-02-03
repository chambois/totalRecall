
require 'sinatra'
require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/recall.db")

class Questionnaire
	include DataMapper::Resource
	property :id, Serial
	property :title, Text, :required => true
  property :created_at, DateTime
	property :updated_at, DateTime
end

DataMapper.finalize.auto_upgrade!  

get '/' do
  erb :home
end

get '/questionnaires' do
	# ??? What to respond with for here?
	# !!! A list of questionnaires + link to create new one
	# ??? Do we also send back form to create
	@questionnaires = Questionnaire.all	
	erb :questionnaires 
end

get '/questionnaire' do
	# ??? What to respond with for here?
	# !!! A list of questionnaires + link to create new one
	# ??? Do we also send back form to create
	#@questionnaire = Questionnaire.new	
	erb :questionnaire_form
end

get '/questionnaire/:id' do
	@questionnaire = Questionnaire.get params[:id]
	erb :questionnaire
end

post '/questionnaire' do
  # Create a questionnaire here
	q = Questionnaire.new
	q.title = params[:title]
  q.created_at = Time.now
	q.updated_at = Time.now
	q.save
	redirect '/'
end

get '/question' do
  # return form for question
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
# Answer /answer - give it a uri as we want to refer to it later (history)
#		
#
#	Data Modelling
#	==============
#		Question --< Answer
#		Questionnaire --< Question
#
#		Question --- ProvidedAnswer
