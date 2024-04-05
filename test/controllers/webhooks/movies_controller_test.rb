require 'test_helper'

class Webhooks::MoviesControllerTest < ActionDispatch::IntegrationTest
  def setup
    # Load the webhook data from the JSON file
    file_path = file_fixture('webhooks/movie.json')
    @webhook = JSON.parse(file_path.read)
  end

  test 'should consume webhook' do
    # Send the POST request to the create action with the prepared data
    post webhooks_movies_url, params: @webhook

    # Check if the response status is 200 OK
    assert_response :ok

    # You can create other test files for each job or service that is called
    # For example, check if a record was created/updated in the database
  end
end
