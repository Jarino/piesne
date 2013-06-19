# encoding: utf-8
require 'curb'
require 'nokogiri'
require 'active_support'

class Kralik

	def self.test

		ahoj = "čo ti jebe"
		puts ahoj
		ahoj = ahoj.mb_chars.normalize(:kd).to_s()
		puts ahoj
	end

end

Kralik.test()