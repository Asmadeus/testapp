class SongPresenter
  def initialize(params)
    @params = params
  end

  def list
    page = @params[:page].presence.to_i || 0
    limit = @params[:limit].to_i || 100

    Song.all.limit(limit).offset(page * limit)
  end
end
