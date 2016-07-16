class ArticleContent < ActiveRecord::Base
  belongs_to :article, dependent: :destroy
end
