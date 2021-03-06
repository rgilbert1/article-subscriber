namespace :scrape do

  desc 'Scrape only the given source'
  task :source, [:source] do |t, args|

    $logger.info('Running `rake scrape:source`')
    if args[:source].nil?
      $logger.fatal('Parameter `source` missing. Exiting.')
      exit
    end

    begin
      db = DbConnection.new
      source_name = args[:source]
      $logger.info("Using source: #{source_name}")

      articles = scrape source_name
      db.insert articles
    rescue => e
      $logger.error("An error occurred: #{e}")
    ensure
      db.disconnect
      $logger.close
    end

  end

  desc 'Scrape all the sources in sources.yml'
  task :all do

    begin
      db = DbConnection.new
      source_names.each do |source|
        $logger.info("Scraping source: #{source}")
        articles = scrape source
        db.insert articles
      end
    rescue => e
      $logger.error("An error occured: #{e}")
    ensure
      db.disconnect
      $logger.close
    end
  
  end

  def scrape source_name
    base_url, article_base_url, xpath = parse_sources_yaml source_name

    source = {
      :name => source_name,
      :base_url => base_url,
      :xpath => xpath,
      :article_base_url => article_base_url
    }

    source[:articles] = Parser.parse source

    source
  end

  def parse_sources_yaml source_name
    $logger.info('Attempting to load sources.yml')
    sources = load_sources
    return sources[source_name.to_sym][:base], sources[source_name.to_sym][:article_base], sources[source_name.to_sym][:xpath]
  end

  def source_names
    load_sources.map { |source| source.first }
  end

end