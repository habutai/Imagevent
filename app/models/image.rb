#require ‘rmagick’ # The rmagick gem is required to inspect/manipulate images

class Image < ActiveRecord::Base
  
  belongs_to :binary



     validates_presence_of( :upload, :name, :description )

     attr_accessor :upload, :name, :description
     
  def after_upload( model, file )
   # Insert any physical file validation requirements here

   image       = Magick::Image::read( file.path ).first
   self.width  = image.columns
   self.height = image.rows
  end
  
end
