FakeWeb.allow_net_connect = false

def register_get(url, fixture_filename)
  fixture_data = File.open(File.expand_path("../../fixtures/#{fixture_filename}", __FILE__), 'rb') { |f| f.read }
  
  opts = {
    :body => fixture_data,
    :content_type => 'application/json; charset=utf-8'
  }
  FakeWeb.register_uri(:get, url, opts)
end

def register_post(url, body, fixture_filename)
  fixture_data = File.open(File.expand_path("../../fixtures/#{fixture_filename}", __FILE__), 'rb') { |f| f.read }
  
  opts = {
    :body => body,
    :content_type => 'application/json; charset=utf-8'
  }
  FakeWeb.register_uri(:post, url, opts)
end
