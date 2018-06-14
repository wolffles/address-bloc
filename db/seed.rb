require_relative '../models/address_book'
require_relative '../models/entry'
require 'bloc_record'

BlocRecord.connect_to('db/address_bloc.sqlite')

book = AddressBook.new(name: 'My Address Book')

puts 'Address Book new'
puts 'Entry new'
puts Entry.new(address_book_id: book.id, name: 'Foo One', phone_number:'999-999-9999', email: 'foo_one@email.com')
puts Entry.new(address_book_id: book.id, name: 'Foo Two', phone_number: '111-111-1111', email: 'foo_two@gmail.com' )
puts Entry.new(address_book_id: book.id, name: 'Foo Three', phone_number: '222-222-2222', email: 'foo_three@gmail.com' )
