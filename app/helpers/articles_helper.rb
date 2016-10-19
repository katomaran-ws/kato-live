module ArticlesHelper

  def page_properties_for(page)
    mapping = {
        :list_blog => {
            :page_title => "Our Blog"
        },
        :show_blog => {
            :half_banner=>true,
        },
        :tag_articles => {
            :half_banner => true
        },
        :category_articles => {
            :half_banner => true
        }
    }

    mapping[page.to_sym]
  end

end
