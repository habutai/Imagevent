class BinaryObserver < ActiveRecord::Observer
  
  observe :image
  
  def before_create(model) #in this case, the Image model is passed
    if model.respond_to?('before_upload')
      model.before_upload(model) rescue raise
    end
    
    binary = Binary.new.upload(model.upload)
    
    if model.respond_to?('after_upload')
      model.after_upload(model, binary) rescue raise
    end
    
    binary          = binary.store()
    model.binary_id = binary.id
    model.active    = 1
    rescue => e
      #Because we're raising an exception, Rails will rollback the binary save operation @ the database level
      File.delete(File.join(Rails.root, binary.path)) if binary
      #Re-throw any raised exception
      raise e
    end
  end