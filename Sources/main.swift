import Vapor
import VaporSSL
import Foundation
import Strand

let headers: Headers = ["Accept": "application/json; charset=utf-8"]
let query: [String: StructuredDataRepresentable] = [
	"token": "xoxb-54407330709-DENiF8MyAD2vm0p0ERzKfQZD",
	"simple_latest": 1,
	"no_unreads": 1
]

let s = try Strand {
	do
	{
		let rtmResponse = try HTTPClient<SSLClientStream>.get("https://slack.com/api/rtm.start", headers: headers, query: query)
		print("Got response: \(rtmResponse.json)")
		guard let webSocketURL = rtmResponse.data["url"].string else { fatalError("Failed to start") }
		
		try WebSocket.connect(to: webSocketURL, using: HTTPClient<SSLClientStream>.self) { ws in
		    print("Connected")
		    ws.onText = { ws, text in
		        let event = try JSON.parse(Array(text.utf8))
		        print("Event: \(event)")
		    }
		}
	}
	catch _ {
		
	}
}



let app = Application()
//let request = NSMutableURLRequest(url: NSURL(string:"https://getpocket.com/v3/oauth/request")!)
//let session = NSURLSession.shared()
//let config = NSURLSessionConfiguration.default()
//request.httpMethod = "POST"
//let params = ["consumer_key": "56159-2590d5ecafa1d1e155b53f69", "redirect_uri": "http://www.comicsans.me"]
//request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//request.addValue("application/json", forHTTPHeaderField: "X-Accept")
//request.addValue("UTF-8", forHTTPHeaderField: "charset")
//request.httpBody = try NSJSONSerialization.data(withJSONObject: params, options: [NSJSONWritingOptions.prettyPrinted])
//let task = session.dataTask(with: request) { (data, response, error) in
//	let str = String(data: data!, encoding: NSUTF8StringEncoding)
//	print(str)
//}

app.get("w") { (request) -> ResponseRepresentable in
	return Response(redirect: "https://getpocket.com/auth/authorize?request_token=YOUR_REQUEST_TOKEN&redirect_uri=YOUR_REDIRECT_URI")
}
//task.resume()
print("Server starting 🎉")
app.start()



