class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    erb :'/pets/new'
  end

  post '/pets' do
    @pets = Pet.create(params[:pet])
    if !params["owner"]["name"].empty?
      @pets.owner << Owner.create(name: params["owner"]["name"])
    end
    @pets.save
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  post '/pets/:id' do
    @pets = Owner.find(params[:id])
    @pets.update(params["owners"])
    if !params["owner"]["name"].empty?
      @pets.owners << Owner.create(name: params["owner"]["name"])
    end
    redirect to "pets/#{@pet.id}"
  end
end
