# frozen_string_literal: true

require 'test_helper'

class ReactionControllerTest < ActionDispatch::IntegrationTest
  test 'should get create' do
    get reaction_create_url
    assert_response :success
  end

  test 'should get destroy' do
    get reaction_destroy_url
    assert_response :success
  end
end
