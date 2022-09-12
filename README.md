
# Applescripts to provice custom protocol handlers for sftp:// in ForkLift 3 an ssh:// in Terminal.app or both

## Installation

Open one of the applescript files in apple script editor and same them as an app.

Then in finder use "show contents" on the created app and insert the follwing lines in `content/Info.plist` and insert one of the following lines inside the `<dict>` node.

### for sftp://

```xml
<key>CFBundleURLTypes</key>
<array>
	<dict>
		<key>CFBundleURLName</key>
		<string>Handler for sftp-Links</string>
		<key>CFBundleURLSchemes</key>
		<array>
			<string>sftp</string>
		</array>
	</dict>
</array>
```

### for ssh://

```xml
<key>CFBundleURLTypes</key>
<array>
	<dict>
		<key>CFBundleURLName</key>
		<string>Handler for ssh-Links</string>
		<key>CFBundleURLSchemes</key>
		<array>
			<string>ssh</string>
		</array>
	</dict>
</array>
```

## Example Links

<a href="ssh://username:password@example.com">Demo ssh link</a>  
<a href="ssh://username:password@example.com:2222">Demo ssh link with port</a>  
<a href="sftp://username:password@example.com">Demo sftp link</a>  
<a href="sftp://username:password@example.com:2222">Demo sftp link with port</a>  
