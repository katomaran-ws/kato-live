module CustomLinkHelper

  # custom_check_box_1("category[status]", true, @category.status, "category_status")
  def custom_check_box_1(name, true_val, value, label)
    custom_check_box_main(name, true_val, value, label, "toggle-round")
  end

  # custom_check_box_2("category[status]", true, @category.status, "category_status")
  def custom_check_box_2(name, true_val, value, label)
    custom_check_box_main(name, true_val, value, label, "toggle-round-flat")
  end

  # custom_check_box_3("category[status]", true, @category.status, "category_status", "YES", "NO")
  def custom_check_box_3(name, true_val, value, label, on_val=nil, off_val=nil)
    custom_check_box_main(name, true_val, value, label, "toggle-yes-no", on_val, off_val)
  end

  def custom_check_box_main(name, true_val, value, label, class_name, data_on=nil, data_off=nil)
    check=check_box_tag name, true_val, value, :class => "toggle #{class_name}".strip
    content=content_tag :label, nil, :for => label, "data-off" => data_off, "data-on" => data_on
    false_selector=hidden_field_tag(name, !true_val, id: nil)
    true_selector=content_tag :div, nil, :class => "switch" do
      check + content
    end
    false_selector + true_selector

    # <input type="hidden" value="false" name="category[status]">
    # <div class="switch">
    #      <input id="status" class="toggle toggle-round" type="checkbox" name="category[status]" value="true" checked="false">
    #      <label for="status"></label>
    # </div>
  end

  def custom_button_1(name="wayra", value = "Submit")
    # <button class="button button--wayra" value="Create Article" name="commit"> Submit Article </button>
    content_tag :button, value, :class => "button-1 button-#{name}".strip
  end

  def custom_button_2(value_1, value_2, name="rayen")
    content_tag :button, nil, class: "button-1 button-#{name}", 'data-text' => value_1 do
      content_tag :span, value_2
    end
    # <button data-text="Request a Quote" class="button-1 button-rayen">
    # <span>Request a Quote</span>
    # </button>
  end

  def custom_button_3(value:"Submit", icon:"fa-plus", name:"antiman", class_name:"")
    content_tag :button, nil, class: "button-1 button-#{name} #{class_name}".strip do
      (content_tag :i, nil, class:"fa #{icon}")+(content_tag :span, value)
    end

    # <button class="button-1 button-antiman">
    # <i class="fa fa-plus" aria-hidden="true"></i>
    # <span>Add New</span>
    # </button>
  end

  def custom_link_1(name="Link", link="javascript(void)", style="link-1")
    content_tag :a, name, href: link, class: style do
      content_tag :span, name
    end

    #   <a href="/our-services#r-n-d" class="link-1"><span>Know More</span></a>
  end

  def custom_link_2(link="javascript(void)", style="link-2")
    content_tag :a, nil, href: link, class: style do
      (content_tag :span)+(content_tag :span)
    end

    #   <a href="/our-services#r-n-d" class="link-1"><span>Know More</span></a>
  end

  def custom_link_3(name="Link", link="javascript(void)", style="link-3")
    content_tag :a, name, href: link, class: style do
      (content_tag :span)+(content_tag :span)+(content_tag :span)+(content_tag :span, nil, "data-val" => name)
    end

    #   <a href="/our-services#r-n-d" class="link-3"><span></span><span></span><span></span></a>
  end

end