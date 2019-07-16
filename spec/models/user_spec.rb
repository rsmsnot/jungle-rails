require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.create(
      email: 'test@test.com',
      first_name: 'test',
      last_name: 'test',
      password: 'password',
      password_confirmation: 'password'
    )
  end

  describe 'Validations' do

    it "should save the user if all fields are valid" do
      @user.save
      expect(@user).to be_valid
      puts @user.errors.full_messages 
    end

    it "is not valid without an email address" do
      @user.email = nil
      expect(@user).to_not be_valid
      puts @user.errors.full_messages 

    end

    it "is not valid if the email address is not unique" do
      @second_user = User.new(
      email: 'test@test.com',
      first_name: 'test2',
      last_name: 'test2',
      password: 'password2',
      password_confirmation: 'password2'
    )
      @second_user.email = nil
      expect(@second_user).to_not be_valid
      puts @second_user.errors.full_messages 

    end

    it "is not valid without a first name" do
      @user.first_name = nil
      expect(@user).to_not be_valid
      puts @user.errors.full_messages 

    end

    it "is not valid without a last name" do
      @user.last_name = nil
      expect(@user).to_not be_valid
      puts @user.errors.full_messages 

    end

    it "is not valid without a password" do
      @user.password = nil
      expect(@user).to_not be_valid
      puts @user.errors.full_messages 

    end

    it "is not valid if the password is too short" do
      @user.password = 'test'
      @user.password_confirmation = 'test'
      expect(@user).to_not be_valid
      puts @user.errors.full_messages 

    end

    it "is not valid if password and password confirmation do not match" do
      @user.password_confirmation = "testing"
      expect(@user).to_not be_valid
      puts @user.errors.full_messages 
    end


  end

  describe '.authenticate_with_credentials' do

  it "should return the user if the correct email and password are given" do
    expect(User.authenticate_with_credentials('test@test.com', 'password')).to eql @user
  end

  it "should not authenticate when the incorrect password is given" do
    expect(User.authenticate_with_credentials('test@test.com', 'wrongpassword')).to eq nil

  end

  it "should not authenticate when the incorrect email is given" do
    expect(User.authenticate_with_credentials('test123@test.com', 'password')).to eq nil

  end

  it "should authenticate when the email address is uppercase" do
    expect(User.authenticate_with_credentials('TEST@TEST.COM', 'password')).to eql @user

  end

  it "should authenticate when the email address contains whitespace" do
    expect(User.authenticate_with_credentials('   test@test.com   ', 'password')).to eql @user

  end





  end

end

