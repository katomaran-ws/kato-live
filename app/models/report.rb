class Report < ActiveRecord::Base

  def self.download_csv
    csv = self.downloadable_fields.join(",")+"\n"
    fields=self.downloadable_fields
    csv << eval(self.name_of_model).all.each do |obj|
      fields.each do |field|
        obj.field
      end.join(',')
    end.join("/n")
    csv
  end

end
