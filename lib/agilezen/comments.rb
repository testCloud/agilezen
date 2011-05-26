module AgileZen
  module Comments

    def project_story_comments(project_id, story_id, options={})
      response_body = nil
      begin
        response = connection.get do |req|
          req.url "/api/v1/projects/#{project_id}/stories/#{story_id}/comments", options
        end
        response_body = response.body
      rescue MultiJson::DecodeError => e
        #p 'Unable to parse JSON.'
      end
      
      response_body
    end

    def create_project_story_comment(project_id, story_id, params, options={})
      params = params.to_json
      response_body = nil
      begin
        response = connection.post do |req|
          req.url "/api/v1/projects/#{project_id}/stories/#{story_id}/comments", options
          req.body = params
        end
        response_body = response.body
      rescue MultiJson::DecodeError => e
        #p 'Unable to parse JSON.'
      end
      
      response_body
    end
      
  end
end
