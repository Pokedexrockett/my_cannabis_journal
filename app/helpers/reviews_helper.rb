module ReviewsHelper
    
    def display_header(review)
        if params[:strain_id]
            content_tag(:h1, "Add a Review for #{review.strain.name} -  #{review.strain.category}")
        else
          content_tag(:h1, "Create a review")
        end
    end
end
