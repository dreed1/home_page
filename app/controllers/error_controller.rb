class ErrorController < ApplicationController
  def cats_404
    respond_to do |format|
      format.html { render status: 404 }
    end
  end
end
