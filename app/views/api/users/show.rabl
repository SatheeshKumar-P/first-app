object @user => :user
attributes :first_name, :last_name, :email, :mobile_number
node(:notice) { @notice }
node(:errors) {@errors}
