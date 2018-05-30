class Virus < ApplicationRecord
  def Virus.get_pagination(search_text, page, per_page)
		if page
			WillPaginate::Collection.create(page, per_page) do |pager|
				if search_text.blank?
					sql2="select * from viri
            LIMIT #{pager.per_page} OFFSET #{pager.offset}"
					@ketqua = ActiveRecord::Base.connection.execute(sql2).to_a
				else
					search_text = "%#{search_text.to_s.downcase}%"
					sql="select * from viri
            where ((profile LIKE '#{search_text}') or (risk_assessment LIKE '#{search_text}') or (date_discovered LIKE '#{search_text}')
            or (date_added LIKE '#{search_text}')  or (origin LIKE '#{search_text}')  or (length LIKE '#{search_text}')
            or (type_virus LIKE '#{search_text}')  or (subtype LIKE '#{search_text}')  or (dat_required LIKE '#{search_text}')
            or (description LIKE '#{search_text}') )
            LIMIT #{pager.per_page} OFFSET #{pager.offset}"
					sql1="select * from viri
            where ((profile LIKE '#{search_text}') or (risk_assessment LIKE '#{search_text}') or (date_discovered LIKE '#{search_text}')
            or (date_added LIKE '#{search_text}')  or (origin LIKE '#{search_text}')  or (length LIKE '#{search_text}')
            or (type_virus LIKE '#{search_text}')  or (subtype LIKE '#{search_text}')  or (dat_required LIKE '#{search_text}')
            or (description LIKE '#{search_text}') )"

					@ketqua = ActiveRecord::Base.connection.execute(sql).to_a
					@total = ActiveRecord::Base.connection.execute(sql1).to_a.count
				end
			end
		else 
			sql3="select * from viri"
			@ketqua = ActiveRecord::Base.connection.execute(sql3).to_a
		end
				if search_text.blank?
			sql4="select * from viri"

			@total = ActiveRecord::Base.connection.execute(sql4).to_a.count
		end
		# byebug
		return @ketqua, @total
	end
end
