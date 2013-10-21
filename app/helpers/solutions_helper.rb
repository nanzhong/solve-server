module SolutionsHelper
  def language_highlight_class(key)
    language =
      case key
      when 'python2', 'python3'
        'python'
      else
        key
      end

    "language-#{language}"
  end
end
