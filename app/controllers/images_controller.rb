class ImagesController < ApplicationController
  def new
    @image = Image.new
  end
  
  def images
    @image = Image.new
  end
  
  def index
#    @image = Image.find(:all)
    render :images
  end

  def create
    @image = Image.new( params[:image] )
    #@user = User.find(params[:id])
    #otherwise @user is undefined?
   # @image.user_id = User.find(params[:id])
    #@user

    @image.save!

    flash[:notice] = “Successfully created image.”
    redirect_to @image
      rescue => e
        #logger.error( ‘Upload failed. ‘ + e )
       # flash[:error] = ‘Upload failed. Please try again.’
        render :images
      end
  end

