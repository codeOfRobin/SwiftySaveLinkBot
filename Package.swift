import PackageDescription

let package = Package(
    name: "Slackbot",
    dependencies: 
    [
		.Package(url: "https://github.com/qutheory/vapor-ssl.git", majorVersion: 0, minor: 1)    
	]

)
