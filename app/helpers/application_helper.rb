module ApplicationHelper

  def embed(youtube_url)
    return youtube_url.split("=").last
  end

end
