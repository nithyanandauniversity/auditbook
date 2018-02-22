module AuditBook
	class AuditsAPI < Grape::API

		namespace "audits" do

			get do
				if params[:search]
					audits = AuditLog.order(:request_time)

					if params[:search][:audit_category]
						audits = audits.where(audit_category: params[:search][:audit_category])
					end

					if params[:search][:current_user]
						audits = audits.where(current_user: params[:search][:audit_category])
					end

					audits
				end
			end

			post do
				audits = AuditLog.create(params[:audit_log])
				audits
			end
		end

	end
end
