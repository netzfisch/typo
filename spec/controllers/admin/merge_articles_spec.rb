 require 'spec_helper'

    describe 'merge_article action' do
      before :each do
        Factory(:blog)
        #TODO delete this after remove fixture
        Profile.delete_all
        @user = Factory(:user, :text_filter => Factory(:markdown), :profile => Factory(:profile_admin, :label => Profile::ADMIN))
        @user.editor = 'simple'
        @user.save
        @article = Factory(:article)
        @article2 = Factory(:second_article)
        request.session = { :user => @user.id }
      end

      it 'should merge articles' do
        get :edit, 'id' => @article.id
        response.should render_template('_form')
        response.should have("merge_with")
        response.should have_button("Merge With This Article")
        response.should redirect_to(:controller => "admin/content", :action => "merge_articles")
      end
    end

