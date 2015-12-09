collection @users => :user
attributes :first_name, :last_name, :email, :mobile_number

node :@errors do |o|
    o.errors
end