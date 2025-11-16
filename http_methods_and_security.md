1.

Using the POST HTTP request method instead of GET is not inherently more secure. If
we are using plain HTTP, all of a request, including its body, is sent as plain
text. This means that a skilled malicious actor can easily intercept, read and change
the data contained in the request, whether that data is stored in the URL or in the
body. Thus, in terms of security in transport, there is really nothing to choose
between GET and POST. We should simply follow the semantic rule that when we simply wish to retrieve information we use GET, and when we wish to change data on the server we use POST (or one of the other methods that signify server data mutation).

2.

HTTPS uses the Transport Layer Security (TLS) protocol to encrypt HTTP messages such
that they cannot be intercepted and viewed by other parties when travelling over
the network. If we wish to secure our application's data when it is transported
over the network, we should use HTTPS throughout our application.

