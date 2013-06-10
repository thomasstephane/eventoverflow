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

  def duration_calc(dstart,dend)
    if dstart && dend
      (dend - dstart) / 3600
    else
      0
    end
  end

  def extern_taken(extern)
    Event.find_by_extern_id(extern)
  end
end