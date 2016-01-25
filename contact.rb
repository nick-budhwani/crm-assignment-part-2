require 'active_record'
require 'mini_record'
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm-web.sqlite3')

class Contact
  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :id

  @@id = 1
  @@contacts = []

  def initialize(id, first_name, last_name, email, note)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
  end

  def self.create(first_name, last_name, email, note)
     new_contact = new(@@id, first_name, last_name, email, note)
      @@contacts << new_contact
      @@id += 1
     new_contact
  end

  def self.all
    @@contacts
  end

  def self.get(id)
    @@contacts.find {|contact| contact.id == id}
  end

  def self.search_by_attribute(name, value)
    @@contacts.find_all {|contact| contact.send(name.to_sym) == value}
  end

  def self.delete_all
    @@contacts = []
    @@id = 1
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def update(attribute, value)
    self.send((attribute.to_s + "=").to_sym, value)
  end

  def delete
    @@contacts.delete(self.class.get(@id)) #@@contacts.delete_if { |contact| contact.id == self.id }

  end

end
