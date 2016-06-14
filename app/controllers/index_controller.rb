class IndexController < ApplicationController
  def list
    ap Try::Application.config.autoload_paths

    @list = ::SongPresenter.new(params).list

    render json: @list
  end

  def index
  
  end
end
