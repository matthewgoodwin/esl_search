class TimePickerInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    # merged_input_options is native syntax
    merged_input_options = merge_wrapper_options(input_html_options, wrapper_options)
    # template.content_tag creates a custom div-wrapper that we give a class and an id
    template.content_tag(:div, class: 'input-group time') do
      # @builder builds a text field for the calendar..calanders need text fields
      input = @builder.text_field(attribute_name, merged_input_options)
      # template.content_tag creates a span_tag nested-wrapper, that we assign the native Bootstrap class 'input-group-addon'
      span = template.content_tag(:span, class: 'input-group-addon') do
        # template.content_tag creates a nested span_tag , that we assign the native Bootstrap class 'glyphicon glyphicon-calendar'
        template.content_tag(:span, '', class: 'glyphicon glyphicon-time')
      end
      # concatenate "#{input} #{span}".html_safe because the
      # template.content_tag(:div, class: 'input-group date') needs
      # to return both input and span --in that order
      "#{input} #{span}".html_safe
    end
  end
  def label(_); end
end
