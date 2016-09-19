class Gallery < ActiveRecord::Base

  has_many :images, class_name: Asset

  # has_one :title_image, class_name: Asset, foreign_key: :title_image_id

  scope :by_active, -> { where('status = ?', true) }

  def title_image
    Asset.find_by_id(self.title_image_id)
  end

  def images_without_title_image
    self.images-[self.title_image] rescue self.images
  end

  def status
    self["status"] ? true : false
  end

end
