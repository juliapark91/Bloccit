module Paginate
def 

  page: params[:page], per_page: 10

  page = 0 # Or any page number (starts at 0)

  Resource.limit(10).offset(page * 10)
  #=> Returns an ActiveRecord Relation of ten Resource objects
end
end

