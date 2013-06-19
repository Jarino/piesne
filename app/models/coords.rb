class Coords < ActiveRecord::Base

	def self.update

		html = File.open("app/views/map/index.html.erb");
		doc = Nokogiri.HTML(html)

		doc.search('area').each do |a|
			if a.attr('id') == '11'
				return
			end

			region = Region.find(a.attr('id'))
			puts "nasiel som " + region.name + " pod id " + a.attr('id')
			region.coords = a.attr('coords')
			region.save

		end
	end

	def self.get
		html = File.open("app/views/map/backup");
		doc = Nokogiri.HTML(html)

		doc.search('area').each do |a|
			if Integer(a.attr('id')) < 11
				next
			end

			puts "Spracuvavam idcko " + a.attr('id')
			region = Region.new(:name => a.attr('id'))
			region.coords = a.attr('coords')
			region.id = Integer(a.attr('id'))
			region.save
		end
	end

end