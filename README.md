BigId Background Check's Library for Ruby
==============

[![Gem Version](https://badge.fury.io/rb/bigid_bgcheck.svg)](https://badge.fury.io/rb/bigid_bgcheck)
[![Build Status](https://travis-ci.com/Quasar-Flash/bigid-bgcheck-ruby.svg?branch=master)](https://travis-ci.com/Quasar-Flash/bigid-bgcheck-ruby)

Requirements
-----------------

- Ruby: Any version
- Bundler

Included Modules
-----------------

- [bigid-auth-ruby](https://github.com/Quasar-Flash/bigid-auth-ruby) - BigID API authentication module

Global Installation
-----------------

    gem install bigid_bgcheck

Installation for Rails
-----------------

    # Add to the Gemfile
    gem "bigid_bgcheck", "~> 0.2"
    gem "bigid_bgcheck", github: "Quasar-Flash/bigid-bgcheck-ruby"

Setting the BigID credentials
-----------------

    # Set the env variables
    ENV["BIGID_USERNAME"] = "your_username"
    ENV["BIGID_PASSWORD"] = "your_password"

Setting the BigID credentials - Rails Project
-----------------

Create the config/initializers/bigid.rb file and define:

    # Set the env variables
    Bigid.configure do |config|
        config.username = "your_username"
        config.password = "your_password"
    end

Applying a background check
-----------------

    require "bigid_bgcheck"

    Bigid::Bgcheck::Request.new.call(
        document: "000.000.000-00",
        document_type: "CPF",
        group: "Default"
    )

Result Example
-----------------

    #<Bigid::Bgcheck::Result:0x0000560fef3c1068
        @approved=false,
        @ticket_id="00000000000000000",
        @code=-1100,
        @message="Not Approved",
        @score=0,
        @limit_score=0.0>

Problems?
-----------------

**Please do not directly email any committers with questions or problems.**  A community is best served when discussions are held in public.

Searching the [issues](https://github.com/Quasar-Flash/bigid-bgcheck-ruby/issues) for your problem is also a good idea.

Contributing
-----------------

- Check out the latest master to make sure the feature hasn"t been implemented or the bug hasn't been fixed yet;
- Check out the issue tracker to make sure someone already hasn"t requested it and/or contributed it;
- Fork the project;
- Start a feature/bugfix branch;
- Commit and push until you are happy with your contribution;
- Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.;
- Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

License
-----------------

Please see [LICENSE](https://github.com/Quasar-Flash/bigid-bgcheck-ruby/blob/master/LICENSE.txt) for licensing details.

Authors
-----------------

Danilo Carolino, [@danilogco](https://github.com/danilogco) / [@Quasar-Flash](https://github.com/Quasar-Flash)
