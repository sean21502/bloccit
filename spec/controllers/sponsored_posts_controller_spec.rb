require 'rails_helper'
include RandomData

RSpec.describe SponsoredPostsController, type: :controller do

  let(:sponsored_post) do
	  SponsoredPost.create(
		  id: 1,
		  title: RandomData.random_sentence,
		  body: RandomData.random_paragraph,
		  price: 99)
  end
	
	describe "GET #index" do
		it "returns http success" do
			get :index
			expect(response).to have_http_status(:success)
		end
		
		it "assigns sponsored_Post to @sponsored_post" do
			get :index
			expect(assigns(:sponsored_posts)).to eq([sponsored_post])
		end
	end
	
	describe "GET show" do
		it "returns http success" do
			get :show, params: {id: sponsored_post.id}
			expect(response).to have_http_status(:success)
		end
		
		it "returns the #show view" do
			get :show, params: {id: sponsored_post.id}
			expect(response).to render_template(:show)
	    end
		
		it "assigns sponsored_Post to @sponsored_post" do
			get :show, params: {id: sponsored_post.id}
			expect(assigns(:sponsored_post)).to eq(sponsored_post)
		end
	end

	describe "GET new" do
		it "returns http success" do
			get :new
			expect(response).to have_http_status(:success)
		end
		
		it "renders the #new view" do
			get :new
			expect(response).to render_template :new
		end
		
		it "instantiates @sponsored_posts" do
			get :new
			expect(assigns(:sponsored_post)).not_to be_nil 
		end
	end
	
	describe "POST create" do
		it "increases the number of sponsored_posts by 1" do
			expect{post :create, params: {sponsored_post: {title: "Title", body: "Body", price: 99}}}.to change(Sponsored_post,:count).by(1)
		end
		
		it "assigns the new question to @question" do
			post :create, params: {sponsored_post: sponsored_post.attributes}
			expect(assigns(:sponsored_post)).to eq SponsoredPost.last
		end
		
		it "redirects to the new question" do
			post :create, params: {sponsored_post: sponsored_post.attributes}
			expect(response).to redirect_to SponsoredPost.last
		end
	end

	describe "GET edit" do
		it "returns http success" do
			get :edit, params: {id: sponsored_post.id} 
			expect(response).to have_http_status(:success)
		end
		
		it "renders the #edit view" do
			get :edit, params: {id: sponsored_post.id} 
			expect(response).to render_template :edit
		end
	end

	describe "PUT update" do
		it "updates sponsored_post with expected attributes" do
			new_title = RandomData.random_sentence
			new_body = RandomData.random_paragraph
			
			put :update ,params:{id: sponsored_post.id, sponsored_post: { title: new_title, body: new_body, price: 99}}
			updated_sponsored_post = assigns(:sponsored_post)
			expect(updated_sponsored_post.id).to eq sponsored_post.id
			expect(updated_sponsored_post.title).to eq new_title
			expect(updated_sponsored_post.body).to eq new_body
		end
		
		it "redirects the updated sponsored_post" do
			new_title = RandomData.random_sentence
			new_body = RandomData.random_paragraph
			
			put :update ,params:{id: sponsored_post.id, question: { title: new_title, body: new_body, rice: 99}}
			expect(response).to redirect_to sponsored_post
		end
	end

	describe "DELETE destroy" do
		it "deletes the sponsored_post" do
			delete :destroy, params: {id: sponsored_post.id}
			count = SponsoredPost.where({id: sponsored_post.id}).size
			expect(count).to eq 0
		end
		
		it "redirects the sponsored_post index" do
			delete :destroy, params: {id: sponsored_post.id}
			expect(response).to redirect_to sponsored_post
		end
	end
end
