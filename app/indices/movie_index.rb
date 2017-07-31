ThinkingSphinx::Index.define :movie, :with => :active_record do
  indexes title, sortable: true, as: :title
  indexes description
  indexes actors.name, as: :actor_name
  indexes year
  set_property enable_star: 1
  set_property min_prefix_len: 3
end
