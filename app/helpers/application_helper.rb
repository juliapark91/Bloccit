module ApplicationHelper
  def form_group_tag(errors, &block)
    if errors.any?
      content_tag :div, capture(&block), class: 'form-group has-error'
    else
      content_tag :div, capture(&block), class: 'form-group'
    end
  end

  def markdown_to_html(markdown)
    renderer = Redcarpet::Render::HTML.new
    extensions = {fenced_code_blocks: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render markdown).html_safe
  end

  def up_vote_link_classes(post)
    vote = current_user.voted(post)
    arrow = "glyphicon glyphicon-chevron-up"
    arrow += "#{@voted}" if vote && vote.up_vote?
    arrow
  end

  def down_vote_link_classes(post)
    vote = current_user.voted(post)
    arrow = "glyphicon glyphicon-chevron-down"
    arrow += "#{@voted}" if vote && vote.down_vote?
    arrow
  end
end
