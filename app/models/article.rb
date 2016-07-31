class Article < ActiveRecord::Base

  has_one :article_content

  validates_presence_of :title
  # validates_presence_of :article_type
  validates_uniqueness_of  :alias_url, :allow_blank => true

  scope :by_sequence, -> { order('sequence_number asc') }
  scope :by_updated, -> { order('updated_at desc') }
  scope :published, -> { where('status =?', true) }
  scope :by_type, -> (type) { where('article_type =?', type) }

end
