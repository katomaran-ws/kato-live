class Gallery < ActiveRecord::Base

  has_many :images, class_name: Asset

  scope :by_active, -> { where('status = ?', true) }

  def title_image
    Asset.find(self.title_image_id) rescue self.images.order('sequence_number').first
  end

  def images_without_title_image
    Asset.where(id: self.image_ids-[self.title_image_id]) rescue self.images
  end

  def status
    self["status"] ? true : false
  end

end
