server_type_windows_xp = ServerType.create!(
  :name => 'Windows XP'
)
server_type_ubuntu_10_04 = ServerType.create!(
  :name => 'Ubuntu 10.04 LTS'
)
Server.create!(
  :name => 'sgapp01',
  :description => 'Holds iweb.',
  :server_type_id => server_type_ubuntu_10_04.id
)
server_sgdemo007 = Server.create!(
  :name => 'sgdemo007',
  :description => 'A sample Windows XP machine.',
  :server_type_id => server_type_windows_xp.id
)
category_a = Category.create!(
  :name => 'Category A',
  :server_type_id => server_type_windows_xp.id
)
category_b = Category.create!(
  :name => 'Category B',
  :server_type_id => server_type_windows_xp.id
)
category_c = Category.create!(
  :name => 'Category C',
  :server_type_id => server_type_windows_xp.id
)
Task.create!([
  { :name => 'Task 1', :category_id => category_a.id },
  { :name => 'Task 2', :category_id => category_a.id },
  { :name => 'Task 3', :category_id => category_a.id },
  { :name => 'Task 4', :category_id => category_a.id },
  { :name => 'Task 1', :category_id => category_b.id },
  { :name => 'Task 1', :category_id => category_c.id },
  { :name => 'Task 2', :category_id => category_c.id },
])
