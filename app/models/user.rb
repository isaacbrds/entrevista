class User < ApplicationRecord
  require 'roo'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #validates :full_name, presence: true
  enum role: [:admin, :client]
  has_one_attached :avatar

  #  def self.import(file)
  #   spreadsheet = open_spreadsheet(file)
  #   header = spreadsheet.row(1)
  #   (2..spreadsheet.last_row).each do |i|
  #     row = Hash[[header, spreadsheet.row(i)].transpose]
  #     user = find_by_id(row["id"]) || new
  #     user.attributes = row.to_hash.slice(*accessible_attributes)
  #     user.save!
  #   end
  # end 
    def self.import(file)
      xlsx = Roo::Excelx.new(file.tempfile)
      xlsx.each_row_streaming(offset: 1) do |row|
        user = self.new(id: row[0].value,full_name: row[1].value, email: row[2].value, password: row[3].value, password_confirmation: row[4].value)
        next if self.pluck(:id).include?(user.id)
        user.save
      end
    end
 end
