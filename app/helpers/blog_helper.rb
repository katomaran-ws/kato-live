module BlogHelper

  def get_next_article(article_id)
    ids=Article.published_blog.by_sequence.map(&:id)
    id=ids.index(article_id).to_i+1
    id = id>=ids.length ? id-ids.length : id
    Article.find(ids[id])
  end

  def get_prev_article(article_id)
    ids=Article.published_blog.by_sequence.map(&:id)
    id=ids.index(article_id).to_i-1
    id = id>=ids.length ? id-ids.length : id
    Article.find(ids[id])
  end

end
