module AgileZen
  # AgileZen::Stories module.
  module Stories

    def create_project_story(project_id, params, options={})
      params = params.to_json
      response_body = nil
      begin
        response = connection.post do |req|
          req.url "/api/v1/projects/#{project_id}/stories", options
          req.body = params
        end
        response_body = response.body
      rescue MultiJson::DecodeError => e
        #p 'Unable to parse JSON.'
      end
      
      response_body
      
    end

    def upload_story_attachment(project_id, story_id, file, options={})
      response_body = nil
      begin
        response = multipart_connection.post "/api/v1/projects/#{project_id}/stories/#{story_id}/attachments", { :file => file }
        response_body = response.body
      rescue MultiJson::DecodeError => e
        #p 'Unable to parse JSON.'
      end
      response_body
    end

    # Retrieve information for all stories of a given project.
    def project_stories(project_id, options={})
      response_body = nil
      begin
        response = connection.get do |req|
          req.url "/api/v1/projects/#{project_id}/stories", options
        end
        response_body = response.body
      rescue MultiJson::DecodeError => e
        #p 'Unable to parse JSON.'
      end
      
      response_body
    end
    
    # Retrieve information for an individual story of a given project.
    def project_story(project_id, story_id, options={})
      response_body = nil
      begin
        response = connection.get do |req|
          req.url "/api/v1/projects/#{project_id}/story/#{story_id}", options
        end
        response_body = response.body
      rescue MultiJson::DecodeError => e
        #p 'Unable to parse JSON.'
      end
      
      response_body
    end
    
  end
end
