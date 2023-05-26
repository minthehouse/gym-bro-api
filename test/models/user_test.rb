require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
  end

  test 'should be valid' do
    assert @user.valid?
  end

  test 'first_name should be present' do
    @user.first_name = ''
    assert_not @user.valid?
  end

  test 'last_name should be present' do
    @user.last_name = ''
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = ''
    assert_not @user.valid?
  end

  test 'email should be unique' do
    second_user = users(:two)
    second_user.email = @user.email
    second_user.save # it does save even if it is not valid unlike save?

    assert_not second_user.valid?
    assert_equal second_user.errors[:email], ['has already been taken']
  end

  test 'preferred_unit_for_weight should be interchangably either string(lbs) or integer(0)' do
    assert_equal 'lbs', @user.preferred_unit_for_weight
  end

  test 'height should be optional' do
    @user.height = ''
    assert @user.save
  end

  test 'weight should be optional' do
    @user.weight = ''
    assert @user.save
  end
  
end
