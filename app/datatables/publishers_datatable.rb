class PublishersDatatable
delegate :params, :h, :link_to, :number_to_currency, to: :@view

def initialize(view)
  @view = view
end
def as_json(options = {})
  {
    sEcho: params[:sEcho].to_i,
    #iTotalRecords: Publisher.count,
    #iTotalDisplayRecords: publishers.total_entries,
    aaData: data
  }
end

private
def data
  @publishers=Publisher.all
  @publishers.map do |publisher|
    [
      #link_to(product.name, product),
      h(publisher.id),
      h(publisher.title),
       h(publisher.content)
    ]
  end
end
def publishers
@publishers ||= fetch_publishers
end	
def fetch_publishers
  publishers = Publisher.order("id").reverse
  publishers = publishers.page(page).per_page('25')
  if params[:sSearch].present?
    publishers = publishers.where("id like :search or title like :search", search: "%#{params[:sSearch]}%")
  end
  publishers
end
end