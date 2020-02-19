class TenantsController < ApplicationController
  # set :views, "app/views"

  get '/tenants' do 
    @tenants = Tenant.all
    erb :"/tenants/index"
  end 

  get '/tenants/new' do 
    @apartments = Apartment.all
    erb :"/tenants/new"
  end

  get '/tenants/:id' do 
    @tenant = Tenant.find(params[:id])
    erb :"/tenants/show"
  end 

  post '/tenants' do 
    @tenant = Tenant.create(params)
    redirect '/tenants'
  end 

  get '/tenants/:id/edit' do 
    @tenant = Tenant.find(params[:id])
    erb :"/tenants/edit"
  end 

  patch '/tenants/:id' do
   
    @tenant = Tenant.find(params[:id])
    @tenant.update(name: params[:name])
    redirect '/tenants'
  end 

  delete '/tenants/:id' do
    Tenant.delete(params[:id])
    redirect '/tenants'
  end 


end
