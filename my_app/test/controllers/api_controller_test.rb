require 'test_helper'

class ApiControllerTest < ActionDispatch::IntegrationTest
    test 'should get index' do
        get api_index_url
        assert_response(200)
    end

    test 'request not found' do
        get api_path id: '10'
        assert_response(404)
    end

    test 'post a comment' do
        get api_index_url

        post api_index_url id: '1', params: { request: { id: '1', comment: 'can create' } }
        assert_response(200)
    end

    test 'put method not allowed' do
        put api_path id: '1', params: { request: { id: '1', comment: 'can create' } }
        assert_response(405)
    end

    test 'get a request' do
        assert_routing '/api/2', controller: 'api', action: 'show', id: '2'
    end

end
