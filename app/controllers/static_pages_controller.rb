#encoding: utf-8

require 'rss'

class StaticPagesController < ApplicationController
  
  def index
  	@rss = @rss = RSS::Parser.parse(open('http://www.tvnet.lv/rss/frontpage.xml').read, false).items[0..4]
  end
  
end
