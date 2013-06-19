class Parser < ActiveRecord::Base

	def self.numeric?(num)
		num =~ /[[:digit:]]/
	end

	def self.valid_page?(doc)

		tab = doc.search("#tab_3407").text.strip

		if tab != ""
			return false
		end

		if doc.title() == "404 - Chyba: 404"
			return false
		end

		return true

	end

	def self.orava_single(id)
		
		#6497

		puts "spracuvam idcko: " + id.to_s()
		html = Curl.get("http://pesnicky.orava.sk/index.php/piesne/#{id}").body_str
		doc = Nokogiri.HTML(html)
		
		if !valid_page?(doc)
			puts "skipping - wrong page"
			File.open('output', 'a') { |file| file.write("stranka bez textu, id -" + id.to_s() + "\n")}
			return
		end

		title = doc.search(".art-Post h1").first.text

#-----------------zistovanie prveho pismena ---------TOTO JE UZ ZBYTOCNE---------------------
		#zistime si prve pismenko nazvu a podla toho zaradnime do kategorie podla pismen

		firstLetter = FirstLetter.find_by_let(title[0,1].downcase)

		if firstLetter == nil
			puts "vytvaram novu pismenkovu kategoriu"
			firstLetter = FirstLetter.new(:let => title[0,1].downcase)
			firstLetter.save
		end

#-----------------vyvaranie zaznamu v databaze a zaradenie do regionu ------------------------------
		song = Song.find_by_title(title);
		if song == nil
			song = Song.new(:title => title, :title_norm => title.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/n, '').gsub(/ /, '_').to_s.downcase, :first_letter_id => firstLetter.id)
			song.save
		else
			puts "nepridal som"
			return
		end

		# zaradime piesen do random kategorie
		# najpr zistime ci uz existuje alebo nie
		if id % 2 == 0
			begin
			@region = Region.find(3)
	  		rescue ActiveRecord::RecordNotFound
		  		@region = Region.new(:name => 'Trencin')
		  		@region.save
	  		end
	  		
	  		@occur = Occurence.new(:region_id => @region.id, :song_id => song.id)
  			@occur.save
		end
		if id % 3 == 0
			begin
			@region = Region.find(2)
	  		rescue ActiveRecord::RecordNotFound
		  		@region = Region.new(:name => 'Klazdovce')
		  		@region.save
	  		end
	  		
	  		@occur = Occurence.new(:region_id => @region.id, :song_id => song.id)
  			@occur.save
		end
		if id % 4 == 0
			begin
			@region = Region.find(1)
	  		rescue ActiveRecord::RecordNotFound
		  		@region = Region.new(:name => 'Jardovce')
		  		@region.save
	  		end
	  		
	  		@occur = Occurence.new(:region_id => @region.id, :song_id => song.id)
  			@occur.save
		end	
		if id % 5 == 0
			begin
			@region = Region.find(4)
	  		rescue ActiveRecord::RecordNotFound
		  		@region = Region.new(:name => 'Kostelec')
		  		@region.save
	  		end
	  		
	  		@occur = Occurence.new(:region_id => @region.id, :song_id => song.id)
  			@occur.save
		end

#-------------------------- samotne kopirovanie textu zo stranky -----------------------------------
		# pomocou tohto zistujeme ci je zaciatok slohy
		start = true
		saved = false

		# jeden vers
		@line = ""

		# pole do ktoreho si ukladam slohy
		# @verse = Array.new

		doc.search(".mj_song_body pre").text.each_line do |s|

			if numeric?(s[0,1])
					# sme na zaciatku textu
					if start == true
						@line = s.gsub(/[[:digit:]]\./, "").strip
						start = false
						next
					end
					# nasli sme dalsiu slohu
					# num += 1

					verse = Verse.new(:text => @line, :song_id => song.id)
					verse.save
					saved = true

					#@verse << @line.strip
					#@line = ""

					start = true
					redo
				else		
					@line += s
			end
		end

		if !saved
			#zrejme neboli ocislovane slohy
			@line.each_line("\r\n\r") do |sloha|

				puts "nasiel som song bez cislovanie sloh"
				verse = Verse.new(:text => sloha, :song_id => song.id)
				verse.save

			end
		end
	end

	def self.orava_all
		for id in 6001..8000#6497
			orava_single(id)
		end
	end
end

