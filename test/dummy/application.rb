require 'rubygems'
require 'pathname'
require 'rails'
require 'action_controller/railtie'

class Page
  attr_accessor :name, :body

  def self.create name, body
    File.open((SmallNSexy.root + 'pages' + name).to_s, 'w') do |file| file << body end
    open name
  end

  def self.open name
    new name, File.read((SmallNSexy.root + 'pages' + name).to_s) rescue nil
  end

  def initialize name, body
    @name, @body = name, body
  end
  
  def to_json
    %Q{{"name": "#{name or 'null'}", "body": "#{body or 'null'}"}}
  end
end

class SmallNSexy < Rails::Application  
  config.session_store :cookie_store, :key => '_omg_session'
  config.secret_token = '1319d8ccf1b9bfbdefcb6aa380a044ce'
  # ^ because -> http://twitter.com/wycats/status/13898343700  
  config.encoding = "utf-8"
  
  routes.draw do |map|
    post  '/pages'        => 'sexy#create'
    get   '/pages/*name'  => 'sexy#show'
  end
end

class SexyController < ActionController::Base
  include Rails.application.routes.url_helpers
  def show
    if page = Page.open(params[:name])
      render :json => page.to_json
    else
      render :text => 'Not found', :status => :not_found
    end
  end

  def create
    if params[:name] and params[:body]
      page = Page.create params[:name], params[:body]
      render :json => page.to_json
    else
      render :text => 'Not found', :status => :not_found
    end
  end
end
