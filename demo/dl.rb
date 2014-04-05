require 'nokogiri'
require 'open-uri'
require 'json'
require 'pry'

doc = Nokogiri::XML.parse open('http://wdcmdresden.com/feed/')
items = doc.search('item').map do |item|
  id = item.at('guid').text[/(\d+)$/, 1]
  date = DateTime.parse(item.at('pubDate').text)
  {
    id: id,
    title: item.at('title').text,
    body: item.search('.//content:encoded').inner_html.gsub(/<[^>]+>/,''),
    categories: item.search('category').map(&:text),
    authors: item.search('.//dc:creator').map(&:text),
    year: date.year,
    month: date.month,
    link: item.at('link').text,
    date: date.to_s
  }
end
File.open('02-wdcm.json','w+'){|f| f.write JSON.pretty_generate(items) }

commands = items.map do |item|
  "curl -X POST 'http://localhost:9200/wdcm/topics/#{item[:id]}' -d #{Shellwords.escape(item.to_json)}"
end

File.open('03-wdcm.sh','w+'){|f| f.write commands.join("\n") }
