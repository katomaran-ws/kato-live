class CreateData

  ## CreateData.create_report("Article")
  def self.create_report(name)
    Report.create(name_of_model: name)
  end

end