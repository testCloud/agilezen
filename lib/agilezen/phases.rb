module AgileZen
  # AgileZen::Stories module.
  module Phases

    def project_phases(project_id, options={})
      response_body = nil
      begin
        response = connection.get do |req|
          req.url "/api/v1/projects/#{project_id}/phases", options
        end
        response_body = response.body
      rescue MultiJson::DecodeError => e
        #p 'Unable to parse JSON.'
      end
      
      response_body
    end
      
  end
end
