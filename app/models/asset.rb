class Asset < ActiveRecord::Base

  def self.save_file(upload)
    # name = upload.original_filename
    # directory = 'private'
    # create the file path
    # path = File.join(directory,name)
    # write the file
    # File.open(path, "w+") { |f| f.write(upload.read)}

    # FileUtils.move upload.path, path
  end

end
