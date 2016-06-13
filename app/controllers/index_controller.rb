class IndexController < ApplicationController
  def index
    ap Try::Application.config.autoload_paths

    @list = ::SongPresenter.new(params).list
  end
end
