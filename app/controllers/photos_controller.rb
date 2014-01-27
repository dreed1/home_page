require 'flickraw'

class PhotosController < ApplicationController
  def index
    FlickRaw.api_key = ENV['FLICKR_API_KEY']
    FlickRaw.shared_secret = ENV['FLICKR_API_SECRET']

    @user_id = '115503225@N04'

    @list  = flickr.photos.getContactsPublicPhotos(:user_id => @user_id, :include_self => '1', :extras => 'extras', :count => '50')
    
    render :layout => 'main_layout'
  end
end
