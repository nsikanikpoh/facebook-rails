class QueryService
  def self.run_query(resource, query, target)
    resource.where(query, target)
  end
end
