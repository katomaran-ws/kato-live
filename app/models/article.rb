class Article < ActiveRecord::Base

  has_one :article_content
  has_and_belongs_to_many :tags
  belongs_to :category

  validates :title, presence: true
  validates :alias_url, uniqueness: true, allow_blank: true

  scope :by_sequence, -> { order('sequence_number asc') }
  scope :by_updated, -> { order('updated_at desc') }
  scope :order_by_type, -> { order('article_type') }
  scope :published, -> { where('status =?', true) }
  scope :by_type, -> (type) { where('article_type =?', type) }
  scope :published_blog, -> { where('article_type = ? and status = ?', 'Blog', true) }
  scope :by_category, -> (id) { where('category_id = ?', id) }
  scope :by_tag, -> (id) { where('articles_tags.tag_id = (?)', id) }

  def display_date
    self["display_date"].strftime("%F %T") rescue nil
  end

  def status
    self["status"] ? true : false
  end

end
