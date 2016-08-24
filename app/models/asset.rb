class Asset < ActiveRecord::Base

  ACCESS_CODE_MAPPING={"User" => 0, "Admin" => 1}

  before_save :access_code_mapping

  def access_code_mapping
    self.access_code=ACCESS_CODE_MAPPING[self.access]
  end

  def location_path
    self[:is_cloudinary] ? self[:cloudinary_url] : self[:location]
  end
end
