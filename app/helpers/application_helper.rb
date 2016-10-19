module ApplicationHelper

  delegate :url_helpers, to: 'Rails.application.routes'

  def meta_tag(tag, text)
    content_for :"meta_#{tag}", text
  end

  def page_title(text)
    content_for :title, text
  end

  def yield_page_title
    title=(content_for?(:title) ? content_for(:title) + " | " : @page_properties[:page_title]).to_s + "Katomaran Robotics"
    content_tag :title, title
  end

  def yield_meta_tag(tag)
    if @page_properties[:"meta_#{tag}"].present? || content_for?(:"meta_#{tag}")
      value = @page_properties[:"meta_#{tag}"] || content_for(:"meta_#{tag}")
      tag "meta", name: tag, content: value
    else
      nil
    end
  end

  def get_file_img(ext)
    file_extension_mapping={
        :doc => "ico-doc.png",
        :docx => "ico-doc.png",
        :pdf => "ico-pdf.png",
        :zip => "ico-zip.png",
        :tar => "ico-zip.png",
        :rar => "ico-zip.png",
        :txt => "ico-txt.png"
    }

    file_extension_mapping[ext.to_sym] ||= "ico-file.png"
  end

  def get_social_link(val)
    links={
        :facebook => "https://www.facebook.com/katomaran-robotics",
        :twitter => "https://twitter.com/KatomaranIndia",
        :google => "https://plus.google.com/+KatomaranIndia"
    }
    links[val]
  end

  def custom_autocomplete(name, search_obj, field, populate_obj)
    search_data=search_obj.collect{|x| {:name=>eval("x."+field), :id=>x.id}}.to_json
    prepopulate=populate_obj.collect{|x| {:name=>eval("x."+field), :id=>x.id}}.to_json
    id=name.gsub('[', '_').chop.gsub(']', '_').chop

    auto_complete="<input type='text' id='#{id}'/>
    <script type='text/javascript'>
        $(document).ready(function() {
             $('##{id}').tokenInput(#{search_data}, {
             prePopulate: #{prepopulate},
             preventDuplicates: true,
             tokenName:'#{name}[]',
            });
        });
    </script>"

    auto_complete
  end
end
