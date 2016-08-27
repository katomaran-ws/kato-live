require 'csv'
class Report < ActiveRecord::Base

  def self.download_csv(values)
    csv = self.downloadable_fields.join(",")+"\n"
    fields=self.downloadable_fields
    csv << eval(self.name_of_model).all.each do |obj|
      fields.each do |field|
        obj.field
      end.join(',')
    end.join("/n")
    csv
  end

  def to_csv(data, options = {})
    attributes=eval(self.downloadable_fields)
    CSV.generate(options) do |csv|
      csv.add_row attributes.map{|x| x.camelize}

      # Iterate through all the rows.
      data.each do |foo|
        values = foo.attributes.slice(*attributes).values
        csv.add_row values
      end
    end
  end

end
