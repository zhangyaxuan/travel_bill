module ApplicationHelper
	def select_users(users)
		html = ""
		users.each_with_index do |user, index|
			html += "<label>"
			html += check_box_tag "user_ids[]", user.id, nil, {id: "user_ids_#{index}"}
			html += user.login
			html += "</label>"
		end
		html.html_safe
	end
end