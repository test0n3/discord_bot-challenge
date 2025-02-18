require 'swagger_helper'

RSpec.describe 'Messages API', type: :request do
  path '/api/v1/messages' do
    get 'Retrieves all pending messages' do
      tags 'Messages'
      produces 'application/json'

      response '200', 'messages found' do
        schema type: :array, items: {
          type: :object,
          properties: {
            _id: { type: :integer, example: '67b279e706c1cbfae06616cc' },
            message_body: { type: :string, example: 'some foo bar message' },
            release_date: { type: :string, example: '2025-02-11' },
            state: { type: :integer, minimum: 1 }
          },
          required: [ '_id', 'message_body', 'release_date', 'state' ]
        }
        run_test!
      end
    end

    post 'Create a message' do
      tags 'Messages'
      consumes 'application/json'
      parameter name: :message, in: :body, schema: {
        type: :object,
        properties: {
          message_body: { type: :string },
          release_date: { type: :string, example: "2025-02-11" }
        },
        required: [ 'message_body', 'release_date' ]
      }

      produces 'application/json'
      response '201', 'message created' do
        let(:message) { {
          _id: '67b279e706c1cbfae06616cc',
          message_body: 'some foo bar message',
          release_date: '2025-02-11',
          state: 1 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:message) { { message_body: 'error message' } }
        run_test!
      end
    end
  end

  path '/api/v1/messages/{id}' do
    delete 'Delete a message' do
      tags 'Messages'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '204', 'message deleted' do
        let(:message) { { message_body: 'foo' } }
        run_test!
      end

      response '404', 'message not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
