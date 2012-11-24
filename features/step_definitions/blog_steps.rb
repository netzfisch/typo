Given /^the blog is set up$/ do
  Blog.default.update_attributes!({:blog_name => 'Teh Blag', :base_url => 'http://localhost:3000'});
  Blog.default.save!
  #Blog.create!(:blog_name => 'Teh Blag', :base_url => 'http://localhost:3000')
  User.create!({:login => 'admin',
                :password => 'aaaaaaaa',
                :email => 'joe@snow.com',
                :profile_id => 1,
                :name => 'admin',
                :state => 'active'})
  Category.create!({:name => 'ruby',
                    :description => 'Everything about Ruby!'})
end

And /^I am logged into the admin panel$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'admin'
  fill_in 'user_password', :with => 'aaaaaaaa'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

Given /^the following articles exist/ do |articles_table|
  articles_table.hashes.each do |article|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Article.create!(article)
  end
end

Then /^I should see a flash "(.*?)"$/ do |arg1|
  page.should have_content(arg1)
end

Then /^I should see "(.*?)" and "(.*?)"$/ do |arg1, arg2|
  page.should have_content(arg1)
  page.should have_content(arg2)
end

