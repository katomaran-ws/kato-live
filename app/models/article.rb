class Article < ActiveRecord::Base

  has_one :article_content
  has_and_belongs_to_many :tags
  belongs_to :category

  validates :title, presence: true
  validates :alias_url, uniqueness: true, allow_blank: true

  delegate :content, :page_title, :banner_image_url, :meta_keywords, :meta_description, to: :article_content

  scope :by_sequence, -> { order('sequence_number asc') }
  scope :by_updated, -> { order('updated_at desc') }
  scope :order_by_type, -> { order('article_type') }
  scope :published, -> { where('status =?', true) }
  scope :by_type, -> (type) { where('article_type =?', type) }
  scope :published_blog, -> { where('article_type = ? and status = ?', 'Blog', true) }
  scope :published_services, -> { where('article_type = ? and status = ? and heading_block = ?', 'Article', true, 'Services') }
  scope :published_events, -> { where('article_type = ? and status = ? and heading_block = ?', 'Article', true, 'Events') }
  scope :by_category, -> (id) { where('category_id = ?', id) }
  scope :by_tag, -> (id) { where('articles_tags.tag_id = (?)', id) }

  def display_date
    self["display_date"].strftime("%F %T") rescue nil
  end

  def status
    self["status"] ? true : false
  end

  def image_url
    self.article_content.banner_image_url
  end
end
