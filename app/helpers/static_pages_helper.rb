module StaticPagesHelper

	def image_exist?(rss)
		!(/<img.* \/>/).match(rss.description).nil?
	end
 
	def cut_image_url(rss)
		if /<img.* \/>/.match(rss.description) != nil
			rss.description.slice!(/<img.* \/>/.match(rss.description)[0])
			rss.description
		else
			rss.description
		end
	end

	def extract_image_url(rss)
		if /(http|https).*(.jpg|.jpeg|.png)/i.match(rss.description) != nil 
			/(http|https).*(.jpg|.jpeg|.png)/i.match(rss.description)[0]
		else
			rss.description
		end
	end

end
