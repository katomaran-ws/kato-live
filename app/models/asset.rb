class Asset < ActiveRecord::Base

  ACCESS_CODE_MAPPING={"User" => 0, "Admin" => 1}

  belongs_to :gallery

  before_save :access_code_mapping

  scope :by_sequence, -> { order('sequence_number asc') }
  scope :active, -> { where('status =?', true) }
  scope :all_documents, -> { where('asset_type = ?', "Document") }
  scope :all_images, -> { where('asset_type = ?', "Image") }

  def access_code_mapping
    self.access_code=ACCESS_CODE_MAPPING[self.access]
  end

  def location_path
    self[:is_cloudinary]=="Yes" ? self[:cloudinary_url] : self[:location].gsub("public", '')
  end

  def get_file_type
    self.location.split('/')[-1].split('.')[-1]
  end

end
