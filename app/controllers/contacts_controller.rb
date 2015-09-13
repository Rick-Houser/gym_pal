class ContactsController < ActionController::Base
	def new
		@contact = Contact.new
	end

	def create
	end
end