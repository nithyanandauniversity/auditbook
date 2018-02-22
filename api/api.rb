Dir["#{File.dirname(__FILE__)}/modules/**/*.rb"].each { |f| require f; puts f }

module AuditBook
	class API < Grape::API
		version 'v1', using: :path
		format :json

		get do
			"Hello api"
		end

		mount AuditBook::AuditsAPI
	end
end
