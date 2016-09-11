class Gallery < ActiveRecord::Base
  has_many :images, class_name: Asset

  scope :by_active, -> { where('status = ?', true) }

  def status
    self["status"] ? true : false
  end

end
