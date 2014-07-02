require 'google_drive'

print "Enter Google username: "
username = gets.chomp
print "Enter password: "
password = gets.chomp

session = GoogleDrive.login(username, password)

all_files = session.files
all_files.each_with_index do |file, num|
  puts "#{num} ) #{file.title}"
end

print "\nSelect file to open: "
file_num = gets.chomp.to_i

open_file = all_files[file_num]


options = ("0".."#{open_file.worksheets.length - 1}").to_a

while true
  puts "\n"
  open_file.worksheets.each_with_index do |sheet, num|
    puts "#{num} | #{sheet.title}"
  end
  print "\nSelect sheet to open or 'q' to quit: "
  sheet_num = gets.chomp
  break if sheet_num == 'q'
  if options.include?(sheet_num)
    open_sheet = open_file.worksheets[sheet_num.to_i]
    puts "this sheet has #{open_sheet.rows.length} rows\n"
  else
    puts "That is not a valid sheet number\n"
  end
end
  



