module RoomsHelper

    def review_button(room)
        user_room = room.enrollments.where(user: current_user)
        if current_user
            if user_room.any?
                if user_room.pending_review.any?
                    link_to 'Add a review', edit_enrollment_path(user_room.first)
                else 
                    link_to 'Review', enrollment_path(user_room.first)
                end
            end
        end
    end
end
