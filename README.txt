= activesupport-jcache

== DESCRIPTION:

ActiveSupport-JCache is a jRuby on Rails extension that enables JCache backend store for Rails.cache

== FEATURES/PROBLEMS:

* No support for time-based key expiry 

== REQUIREMENTS:

* ActiveSupport 2.3.2 
* JCache-enabled store  

== INSTALL:

* sudo gem install activesupport-jcache 

== CONFIGURATION:

In your config/environment.rb, add the following:
  
  if defined?(JRUBY_VERSION)
    config.gem "activesupport-jcache", :lib => 'jcache_store'
    config.cache_store = :jcache_store
  end

== GOOGLE APP ENGINE:

ActiveSupport-JCache allows to interface with the MemCache API within the Google App Engine. No additional configuration required.

== LICENSE:

(The MIT License)

Copyright (c) 2009  Michael Rykov 

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
