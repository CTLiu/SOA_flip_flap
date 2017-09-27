require 'yaml'
# Module that can be included (mixin) to take and output Yaml data
module YamlBuddy
  def take_yaml(yaml)
    yaml.to_yaml
    @data = {}
    @data = YAML.safe_load(yaml)
  end

  def to_yaml
    @data.to_yaml
  end
  # end of module
end
