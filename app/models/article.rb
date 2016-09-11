class Article < ActiveRecord::Base

  has_one :article_content
  has_and_belongs_to_many :tags
  belongs_to :category

  validates_presence_of :title
  validates_uniqueness_of  :alias_url, :allow_blank => true

  scope :by_sequence, -> { order('sequence_number asc') }
  scope :by_updated, -> { order('updated_at desc') }
  scope :published, -> { where('status =?', true) }
  scope :by_type, -> (type) { where('article_type =?', type) }
  scope :published_blog, -> { where('article_type = ? and status = ?', 'Blog', true) }
  scope :by_category, -> (id) { where('category_id = ?', id) }
  scope :by_tag, -> (id) { where('tag_ids = (?)', id) }


  def display_date
    self["display_date"].strftime("%F %T") rescue nil
  end

end
