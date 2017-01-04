require 'rails_helper'

RSpec.feature "RegisterUsers", type: :feature do
  context "Landing page" do
    Steps "Going to Landing page" do
      Given "I visit localhost 3000:" do
        visit "/"
      end
      Then "I see Welcome!" do
        expect(page).to have_content("Welcome!")
      end
      Then "I can see a registration form" do
        expect(page).to have_content("Full name")
        expect(page).to have_content("Password")
      end
      # Then "I can press the submit button" do
      #   click_button "Submit"
      #   expect(page).to have_content("Congrats!")
      # end
    end
  end

  context "Succesfully completing the registration form" do
    Steps "Going to Landing page" do
      Given "I am on the landing page" do
        visit "/"
      end
      Then "I can enter info into form fields" do
        fill_in 'name', with: 'Max Stephen'
        fill_in 'address', with: '123 Street Lane Pl'
        fill_in 'city', with: 'Chula Vista'
        fill_in 'state', with: 'CA'
        fill_in 'zip', with: '91915'
        fill_in 'country', with: 'USA'
        fill_in 'email', with: 'ms@example.com'
        fill_in 'user_id', with: 'ms'
        fill_in 'password', with: '1235'
        click_button "Submit"
        expect(page).to have_content("Congrats!")
      end
    end
  end


  context "Confirming validations by unsuccesfully completing the registration form" do
    Steps "Going to Landing page" do
      Given "I am on the landing page" do
        visit "/"
      end
      Then "I can not submit a form without a username and password" do
        fill_in 'name', with: 'Max Stephen'
        fill_in 'address', with: '123 Street Lane Pl'
        fill_in 'city', with: 'Chula Vista'
        fill_in 'state', with: 'CA'
        fill_in 'zip', with: '91915'
        fill_in 'country', with: 'USA'
        fill_in 'email', with: 'ms@example.com'
        fill_in 'user_id', with: 'ms'
        # fill_in 'password', with: '1235'
        click_button "Submit"
        expect(page).to have_content("Registration failed")
      end
    end
  end

  context "Login succesfully" do
    Steps "Going to Landing Page" do
      Given "I am on the landing page and created a user" do
        visit "/"
        fill_in 'user_id', with: 'ms'
        fill_in 'password', with: '1234'
        click_button "Submit"
      end
      Then "I can input User ID and Password" do
        visit "/"
        fill_in 'l_user_id', with: 'ms'
        fill_in 'l_password', with: '1234'
        click_button "Log In"
        expect(page).to have_content("Hello ms")
      end
    end
  end
end
