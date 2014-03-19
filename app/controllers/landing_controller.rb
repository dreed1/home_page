class LandingController < ApplicationController
  def index
    FlickRaw.api_key = ENV['FLICKR_API_KEY']
    FlickRaw.shared_secret = ENV['FLICKR_API_SECRET']

    @user_id = '115503225@N04'

    @list  = flickr.photos.search(:user_id => @user_id)
    
    puts @list.count
    render :layout => 'main_layout'
  end
end
