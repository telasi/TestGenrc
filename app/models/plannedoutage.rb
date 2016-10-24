class Plannedoutage < ActiveRecord::Base
	self.table_name='plannedoutages'
  CASE_ID = 1

  def to_hash
            fields = [
						"id",
						"disabling_area",
						"break_reason",
						"break_start_date",
						"break_end_date",
						"abonent_amount",
						"self_governed_district_name",
						"self_gov_district_ab_count",
						"jit_infromation_consumer_count",
						"compare_date_2",
						"list_of_media",
						"info_url",
						"sms",
						"record_status",
						"log_day",
						"response_id",
						"outg_base_description",
						"outg_comment",
						"outg_base_id"
					 ]

  	self.serializable_hash.map{ |k,v| [fields[fields.index{ |s| s.casecmp(k)==0 }] ,v] if fields.any?{ |s| s.casecmp(k)==0 } }.compact.to_h
  end

  def stage
	1
  end

end