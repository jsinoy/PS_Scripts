$users = get-localuser
foreach ($user in $users) {
	# Set users password to be changed at next logon for all users
	$expUser = [ADSI]"WinNT://localhost/$user,user"
	$expUser.passwordExpired = 1 
	$expUser.setinfo()
	}`
 # This line below reverts back the changes for default accounts
WMIC UserAccount Where "Name='Administrator'" Set PasswordExpires=FALSE
WMIC UserAccount Where "Name='DefaultAccount'" Set PasswordExpires=FALSE
WMIC UserAccount Where "Name='Guest'" Set PasswordExpires=FALSE
WMIC UserAccount Where "Name='WDAGUtilityAccount'" Set PasswordExpires=FALSE
