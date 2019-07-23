class FinderService
  def self.find_resource(classname, resource_name)
    classname.find(resource_name)
  end
end
