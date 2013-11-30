
namespace :assets do
  desc 'sync assets to cdns'
  task :cdn => :environment do
    tool_folder="#{Rails.root}/script"
    # get tools from http://docs.qiniu.com/tools/v6/index.html and put them in tool_foolder
    `"#{tool_folder}/qrsync #{tool_folder}/conf.json"`
  end
end
