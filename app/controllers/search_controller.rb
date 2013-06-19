class SearchController < ApplicationController

  def index
  	sql = 'SELECT id, first_name, last_name, sum(count) FROM
          (
            SELECT users.id, users.first_name, users.last_name,count(*) 
              FROM links
              JOIN users ON
              links.user_id = users.id
              GROUP BY user_id, first_name, last_name, users.id
            UNION
            SELECT users.id, users.first_name, users.last_name,count(*) 
              FROM verses
              JOIN users ON
              verses.user_id = users.id
              GROUP BY user_id, first_name, last_name, users.id
            UNION
            SELECT users.id, users.first_name, users.last_name,count(*) 
              FROM songs
              JOIN users ON
              songs.user_id = users.id
              GROUP BY user_id, first_name, last_name, users.id
          ) as tmp
          GROUP BY id, first_name, last_name
          ORDER BY sum DESC LIMIT 5'

  	@stats = ActiveRecord::Base.connection.execute(sql)

  	@users_counts = Array.new

  	@stats.each do |s|
  		user = User.find(s['id'])
  		@users_counts << {:links => user.links.count, :verses => user.verses.count, :songs => user.songs.count }
  	end

  end

  def result
  	@songs = Song.search_by_title(params[:title])
  end
  
end


