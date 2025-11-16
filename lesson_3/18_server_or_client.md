## Gemfile ##

The Gemfile is used by Bundler on the server side. Bundler uses
the Gemfile to install the necessary dependencies for the project.
The dependencies are installed locally on the server in the Ruby
installation directories.

## Ruby files ##

Ruby files are executed on the server. Leaving aside WebAssembly, JavaScript
is the only general purpose language that runs in the client (browser).

## Stylesheets ##

CSS stylesheets are used by the client in order to render HTML pages. They
are 'executed' on the client side.

## JavaScript Files ##

JavaScript has traditionally been executed on the client side by the web
browser. However, with the advent of Node.js, JavaScript has been used
increasingly on the server side as well.

## View Templates ##

View template `.erb` files are executed on the server side in order to generate
HTML that is then, in turn, sent to the client to be displayed.

