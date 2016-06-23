# using rake inbuilt test task
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/test*.rb']
  t.verbose = true
end

# task for force recompile option
task :ftest do
  sh "rm -rf curry_examples/.curry/*"
  Rake::Task["test"].invoke
end

# for custom rake test task
task :itest do
	sh "for t in $(ls test/test_*)
	do
		ruby -Ilib:test $t
	done"
end