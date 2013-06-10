module EventsHelper

  def sort_desc(events_list)
    events_list.sort_by {|event| event.starts_at}.reverse
  end

  def sort_asc(events_list)
    events_list.sort_by {|event| event.starts_at}
  end

  def sort_top(events_list)
    events_list.sort_by {|event| event.sum_votes}.reverse
  end
end