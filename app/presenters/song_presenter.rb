class SongPresenter
  def initialize(params)
    @params = params
  end

  def list
    page = @params[:page].presence || 0
    limit = @params[:limit] || 100

    Song.all.limit(limit).offset(page * limit)
  end
end
