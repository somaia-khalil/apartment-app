class ApartmentsController < ApplicationController
  # set :views, "app/views/apartments"
  set :method_override, true

  get '/apartments' do 
    @apartments = Apartment.all
    erb :"/apartments/index"
  end 
  get "/apartments/new" do
    erb :"/apartments/new"
  end

  get "/apartments/:id" do
    @apartment = Apartment.find(params[:id])
    erb :"/apartments/show"
  end

  post "/apartments" do
    Apartment.create(params)
    redirect "/apartments"
  end

  get "/apartments/:id/edit" do
    @apartment = Apartment.find(params[:id])
    erb :"/apartments/edit"
  end

  patch "/apartments/:id" do
    @apartment = Apartment.find(params[:id])
    @apartment.update(address: params[:address])
    redirect "/apartments"
  end

  delete "/apartments/:id" do
    Apartment.delete(params[:id])
    redirect "/apartments"
  end






end
