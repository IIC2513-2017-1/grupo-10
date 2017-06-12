# frozen_string_literal: true

require 'test_helper'

class ReactionRepresentationControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get reaction_representation_new_url
    assert_response :success
  end

  test 'should get create' do
    get reaction_representation_create_url
    assert_response :success
  end

  test 'should get destroy' do
    get reaction_representation_destroy_url
    assert_response :success
  end
end
