class Puppy < ApplicationRecord
  belongs_to :user;

# def self.search(search)
#   if search
#     breed_type = Puppy.find_by(breed: search)
#     if breed_type
#       self.where(breed: breed_type)
#     else
#       @puppies = Puppy.all
#     end
#   else
#     @puppies = Puppy.all
#   end
# end
  has_one_attached :photo
end
