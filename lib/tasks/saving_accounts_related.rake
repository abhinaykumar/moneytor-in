namespace :banks do
  desc 'import Banks'
  task import_banks: :environment do
    doc = Nokogiri::HTML(URI.open('https://www.rbi.org.in/scripts/banklinks.aspx'))
    tables = doc.css('table.tablebg')

    tables.each do |table|
      rows = table.css('tr')
      sector = rows.first.css('th').text
      puts sector

      rows[2..(rows.length)].each do |row|
        next if row.css('td').blank?

        next if row.css('td').count < 2

        website = row.css('td a').map { |l| l['href'] }[0]
        puts website
        name = row.css('td').last.text
        puts name

        ListedBank.create!(name: name, website: website, sector: sector)
      end
    end
  end
end
