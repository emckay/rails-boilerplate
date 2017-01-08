class StaticPagesController < ApplicationController
  def landing
    flash.now[:notice] = 'success!'
    flash.now[:error] = ['error 1!', 'error 2']
  end
end
