#encoding: utf-8

require 'rss'

class StaticPagesController < ApplicationController
  
  def index
  	if signed_in? 
  		@rss = RSS::Parser.parse(open('http://www.tvnet.lv/rss/frontpage.xml').read, false).items[0..4]
  	else 
  		redirect_to login_path
  		flash[:danger] = "You should login to access this page."
  	end
  end

end
