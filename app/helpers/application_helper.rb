module ApplicationHelper
	def s3_image_path(filename)
		"https://s3-us-west-2.amazonaws.com/web-folio/#{filename}"
	end

	def s3_image_tag(filename, options={})
		image_tag(s3_image_path(filename), options)
	end
end