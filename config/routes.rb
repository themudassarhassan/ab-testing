# frozen_string_literal: true

Rails.application.routes.draw do
  get '/article' => 'articles#index'

  resource :analytics, only: [:create]
end
