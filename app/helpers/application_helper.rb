module ApplicationHelper

  def page_title
    title = ['obsessivearchives: job hunt']
    title.unshift @page_title if @page_title.present?
    title.join(' | ')
  end

  def page_description
    @page_description || 'obsessivearchives: job hunt - organizing your path to a better job'
  end

  def strip_url(url)
    url.sub!(/https\:\/\//, '') if url.include? "https://"
    url.sub!(/http\:\/\//, '') if url.include? "http://"
    url.sub!(/www./, '') if url.include? "www."
    return url
  end

end
