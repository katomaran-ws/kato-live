class Asset < ActiveRecord::Base

  ACCESS_CODE_MAPPING={"User" => 0, "Admin" => 1}

  belongs_to :gallery

  before_save :access_code_mapping

  scope :by_sequence, -> { order('sequence_number asc') }

  def access_code_mapping
    self.access_code=ACCESS_CODE_MAPPING[self.access]
  end

  def location_path
    self[:is_cloudinary]=="Yes" ? self[:cloudinary_url] : self[:location].gsub("public", '')
  end

end
