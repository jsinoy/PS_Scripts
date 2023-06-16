$users = get-localuser
foreach ($user in $users) {
	# Set users password to be changed at next logon
	$expUser = [ADSI]"WinNT://localhost/$user,user"
	$expUser.passwordExpired = 1 
	$expUser.setinfo()
	}`
WMIC UserAccount Where "Name='Administrator'" Set PasswordExpires=FALSE
WMIC UserAccount Where "Name='DefaultAccount'" Set PasswordExpires=FALSE
WMIC UserAccount Where "Name='Guest'" Set PasswordExpires=FALSE
WMIC UserAccount Where "Name='WDAGUtilityAccount'" Set PasswordExpires=FALSE