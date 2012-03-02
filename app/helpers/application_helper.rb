module ApplicationHelper
  def logo
    logo = image_tag("logo.png", :alt=>"sample app", :class=>"round") #additional qualifiers include :size=>"axb" :width=>"x" :height=>"y" :mouseover=>"2ndimgpath"
  end
  
  #Return a title on a per-page basis!                #Documentation comment
  def title                                           #Method definition
    base_title = "Ruby on Rails Tutorial Sample App"  #Variable assignment
    if @title.nil?                                    #BOOL test for nil
      base_title                                      #Implicit return
    else
      "#{base_title} | #{@title}"                     #String interpolation
    end
  end
end
