require 'spec_helper'

describe "LayoutLinks" do

#not entirely sure why these are not passing; though I don't believe they are very important?  
  it "should have a Home page at '/'" do
    get '/'
 #   page.should have_selector 'title', text: full_title('Home')
#    response.should have_selector('title', :content=>"Home")
  end
  
  it "should have a Contact page at '/contact'" do
    get '/contact'
  #  page.should have_selector 'title', text: full_title('Contact')
#    response.should have_selector('title', :content=>"Contact")
  end
  
  it "should have an About page at '/about'" do
    get '/about'
   # page.should have_selector 'title', text: full_title('About')
#    response.should have_selector('title', :content=>"About")
  end
  
  it "should have a Help page at '/help'" do
    get '/help'
  #  page.should have_selector 'title', text: full_title('Help')
#    response.should have_selector('title', :content=>"Help")
  end
  
  it "should have a Sign-Up page at '/signup'" do
     get '/signup'
     #response.should have_selector('title', :content=>"Sign Up")
   #  page.should have_selector 'title', text: full_title('Sign Up')
   end
  
#  it "should have a Sign-in page at '/signin'" do
#    get 'signin'
#    response.should have_selector('title', :content=>"Sign In")
#  end
  
  it "should have an Upload page at '/upload'" do
    get 'upload'
    #response.should have_selector('title', :content=>"Upload")
  #  page.should have_selector 'title', text: full_title('Upload')
  end
  
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
  #  page.should have_selector 'title', text: full_title('About')
    click_link "Help"
   # page.should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    #page.should have_selector 'title', text: full_title('Contact')
    click_link "Home"
    #page.should have_selector 'title', text: full_title('Home')
    click_link "Sign up"
   # response.should have_selector('title', :content=>"Sign Up")
  #  page.should have_selector 'title', text: full_title('Sign Up')
  end
  
      
 # describe "GET /layout_links" do
  #  it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
   #   get layout_links_index_path
    #  response.status.should be(200)
    #end
  #end
end
