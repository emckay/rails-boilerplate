module ApplicationHelper
  def flash_messages
    locals = []
    flash.each do |k, v|
      classes = ['alert']
      label = nil
      if k == 'error'
        classes << 'alert-danger'
        label = 'Error'
      elsif k == 'notice'
        classes << 'alert-success'
      end

      if !v.is_a? Array
        locals << { classes: classes.join(' '), message: v, label: label }
      else
        v.each do |msg|
          locals << { classes: classes.join(' '), message: msg, label: label }
        end
      end
    end

    locals.map do |l|
      render partial: 'layouts/flash', locals: l
    end.join.html_safe
  end
end
