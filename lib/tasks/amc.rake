namespace :amc do
  desc 'import amc xml file'
  task :import_xml => :environment do
    unless ENV.include?('file') && File.exists?(ENV['file'])
      raise "usage: rake file=XML_FILE" 
    end
    filename = ENV['file']
    Movie.import_from_amc_xml(File.open(filename).read)
  end
end
