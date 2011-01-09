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
  { :name => 'Check application log for warning and error messages for service startup errors, application or database errors and unauthorized application installs', :category_id => category_a.id },
  { :name => 'Check security log for warning and error messages for invalid logons, unauthorized user creating, opening or deleting files', :category_id => category_a.id },
  { :name => 'Check system log for warning and error messages for hardware and network failures', :category_id => category_a.id },
  { :name => 'Check web/database/application logs for warning and error messages', :category_id => category_a.id },
  { :name => 'Check directory services log on domain controllers', :category_id => category_a.id },
  { :name => 'Check for memory usage', :category_id => category_a.id },
  { :name => 'Check for system paging', :category_id => category_a.id },
  { :name => 'Check CPU usage', :category_id => category_b.id },
  { :name => 'Run dcdiag', :category_id => category_c.id },
  { :name => 'Visually check the equipment for amber lights, alarms, etc.', :category_id => category_c.id },
  { :name => 'Check all drives for adequate free space', :category_id => category_c.id },
])
