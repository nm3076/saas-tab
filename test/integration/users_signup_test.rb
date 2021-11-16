require "test_helper"

# ran command 'rails generate integration_test users_signup' to create this test file
# run 'bundle exec rake test' to test
class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get new_user_path
    assert_no_difference 'User.count' do
      post users_path, :params => {:user => { username:  "hello",
                               email: "user@invalid",
                               password:              "",
                               password_confirmation: "bar" }}
    end
    assert_template 'users/new'
  end


  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, :params => {:user => { name:  "Example User",
                                            email: "user@example.com",
                                            password:              "password",
                                            password_confirmation: "password" }}
      follow_redirect!
    end
    assert_template 'users/show'
    assert is_logged_in?
  end

end
