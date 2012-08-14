#!/usr/bin/env ruby

require 'erb'
require 'rexml/document'

if ARGV.length < 2
	puts "sitemap_merger.rb takes at least two arguments. The two (or more) sitemap.xml files you want to merge"
	exit(1)
end

bodies = []

ARGV.each do |sitemap_file|
	
	begin
		xml = File.read(sitemap_file)
		sitemap = REXML::Document.new(xml)

		sitemap.elements.each('database/body') do |url|
			bodies.push(url)	
		end
	rescue Exception => ex
		puts "#{sitemap_file} does not exist!"
		exit(1)
	end
end


static_sitemap = ERB.new <<EOF
<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<database application="Hazeron Scouter" version="0.3.3.4">
<% bodies.each do |url| %>
	<%= url %>
	<% end %>
</database>
EOF

puts static_sitemap.result