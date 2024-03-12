# frozen_string_literal: true

Rails.application.routes.draw do
  get '/article' => 'articles#show'

  get '/signup' => 'registration#new'

  resource :analytics, only: [:create]
end
