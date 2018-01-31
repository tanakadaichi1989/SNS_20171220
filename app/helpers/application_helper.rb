module ApplicationHelper
    def full_page(title="")
        base_title = "SNS by Ruby on Rails"
        
        if title.empty?
            base_title
        else
            title + " | " + base_title
        end
    end
end
