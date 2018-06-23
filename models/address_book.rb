require_relative 'entry'
require "csv"
require 'bloc_record/base'


class AddressBook < BlocRecord::Base
  attr_accessor :entries

  def initialize(options={})
    super
    @entries = []
  end

  def add_entry(name, phone, email)
    Entry.create(name: name, phone_number: phone, email: email, address_book_id: self.id)
  end

  def import_from_csv(file_name)
    # Implementation goes here
    csv_text = File.read(file_name)
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
    csv.each do |row|
      row_hash = row.to_hash
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end
  end


end

#this is all I need? from what I've googled people recommend redefining respond_to? and one example some guy recreates alias. I have no experience using method_missing so I'm just unsure of which I actually needed.
