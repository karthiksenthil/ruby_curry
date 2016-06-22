# using rake inbuilt test task
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/test*.rb']
  t.verbose = true
end

# task for force recompile option
Rake::TestTask.new do |t|
  t.name = "ftest"
  t.libs << "test"
  t.test_files = FileList['test/temp.rb']
  t.ruby_opts = "-f"
  t.verbose = true
end

# for custom rake test task
task :itest do
	sh "for t in $(ls test/test_*)
	do
		ruby -Ilib:test $t
	done"
end