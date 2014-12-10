module ApplicationHelper
  DEFAULT_KEY_MATCHING = {
    alert: :danger,
    notice: :success,
    info: :info,
    secondary: :default,
    success: :success,
    error: :danger,
    warning: :warning
  }

  def display_flash_messages(key_matching = {})
    key_matching = DEFAULT_KEY_MATCHING.merge(key_matching)
    flash.reduce '' do |message, (key, value)|
      if value.is_a?(Array)
        value.each do |val|
          message += build_message(key: key, value: val, key_match: key_matching)
        end
        message
      else
        build_message(key: key, value: value, key_match: key_matching)
      end
    end.html_safe
  end

  private

  def build_message(args)
    html = '<div class="alert alert-dismissable alert-'
    html += "#{args[:key_match][args[:key].to_sym] || :standard}\">"
    html += '<button type="button" class="close" data-dismiss="alert">×</button>'
    html += "<p>#{args[:value]}</p></div>"
    html.html_safe
  end

end
