require 'spec_helper'

describe "Audits API" do

	before(:all) do
        AuditLog.all.each { |p| p.destroy }
    end

    it "should be able to create new audit log" do
    	expect(AuditLog.count).to eql 0

    	post '/api/v1/audits', audit_log: {
            http_method: "GET",
            request_time: Time.now.utc,
            audit_category: "Participant",
            raw_request_body: "{\"some_date\":\"value\"}"
        }

        response = JSON.parse(last_response.body)

        expect(response['http_method']).to eql "GET"
        expect(response['raw_request_body']).to eql "{\"some_date\":\"value\"}"
    end

    it "should be able to filter logs by category" do
        post "/api/v1/audits", audit_log: {
            http_method: "GET",
            request_time: Time.now.utc,
            audit_category: "Center",
            raw_request_body: "{}"
        }

        expect(AuditLog.count).to eql 2

        post "/api/v1/audits", audit_log: {
            http_method: "POST",
            request_time: Time.now.utc,
            audit_category: "Center",
            raw_request_body: "{\"key\":\"value\"}"
        }

        expect(AuditLog.count).to eql 3

        get "/api/v1/audits", search: {
            audit_category: "Center"
        }

        response = JSON.parse(last_response.body)

        expect(response.length).to eql 2
        expect(response[0]['raw_request_body']).to eql "{}"
        expect(response[1]['raw_request_body']).to eql "{\"key\":\"value\"}"
    end

    it "should be able to filter logs by user" do
        AuditLog.all.each { |p| p.destroy }
    end

    it "should be able to filter logs by array of users" do
        AuditLog.all.each { |p| p.destroy }
    end
end
