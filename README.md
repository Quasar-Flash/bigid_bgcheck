BigId Background Check's Library for Ruby
==============

Build Status
-----------------

[![Gem Version](https://badge.fury.io/rb/bigid_bgcheck.svg)](https://badge.fury.io/rb/bigid_bgcheck)
[![bigid_bgcheck](https://github.com/Quasar-Flash/bigid_bgcheck/actions/workflows/ruby.yml/badge.svg)](https://github.com/Quasar-Flash/bigid_bgcheck/actions/workflows/ruby.yml)
[![Quality Gate Status](https://sonarqube.eks.qflash.com.br/api/project_badges/measure?project=Quasar-Flash_bigid_bgcheck&metric=alert_status&token=23b79ee0eebe63611e370ffb911d9be245c99154)](https://sonarqube.eks.qflash.com.br/dashboard?id=Quasar-Flash_bigid_bgcheck)
[![Coverage](https://sonarqube.eks.qflash.com.br/api/project_badges/measure?project=Quasar-Flash_bigid_bgcheck&metric=coverage&token=23b79ee0eebe63611e370ffb911d9be245c99154)](https://sonarqube.eks.qflash.com.br/dashboard?id=Quasar-Flash_bigid_bgcheck)
[![Maintainability Rating](https://sonarqube.eks.qflash.com.br/api/project_badges/measure?project=Quasar-Flash_bigid_bgcheck&metric=sqale_rating&token=23b79ee0eebe63611e370ffb911d9be245c99154)](https://sonarqube.eks.qflash.com.br/dashboard?id=Quasar-Flash_bigid_bgcheck)

Project Scores
-----------------

[![Bugs](https://sonarqube.eks.qflash.com.br/api/project_badges/measure?project=Quasar-Flash_bigid_bgcheck&metric=bugs&token=23b79ee0eebe63611e370ffb911d9be245c99154)](https://sonarqube.eks.qflash.com.br/dashboard?id=Quasar-Flash_bigid_bgcheck)
[![Code Smells](https://sonarqube.eks.qflash.com.br/api/project_badges/measure?project=Quasar-Flash_bigid_bgcheck&metric=code_smells&token=23b79ee0eebe63611e370ffb911d9be245c99154)](https://sonarqube.eks.qflash.com.br/dashboard?id=Quasar-Flash_bigid_bgcheck)
[![Duplicated Lines (%)](https://sonarqube.eks.qflash.com.br/api/project_badges/measure?project=Quasar-Flash_bigid_bgcheck&metric=duplicated_lines_density&token=23b79ee0eebe63611e370ffb911d9be245c99154)](https://sonarqube.eks.qflash.com.br/dashboard?id=Quasar-Flash_bigid_bgcheck)
[![Lines of Code](https://sonarqube.eks.qflash.com.br/api/project_badges/measure?project=Quasar-Flash_bigid_bgcheck&metric=ncloc&token=23b79ee0eebe63611e370ffb911d9be245c99154)](https://sonarqube.eks.qflash.com.br/dashboard?id=Quasar-Flash_bigid_bgcheck)
[![Reliability Rating](https://sonarqube.eks.qflash.com.br/api/project_badges/measure?project=Quasar-Flash_bigid_bgcheck&metric=reliability_rating&token=23b79ee0eebe63611e370ffb911d9be245c99154)](https://sonarqube.eks.qflash.com.br/dashboard?id=Quasar-Flash_bigid_bgcheck)
[![Security Rating](https://sonarqube.eks.qflash.com.br/api/project_badges/measure?project=Quasar-Flash_bigid_bgcheck&metric=security_rating&token=23b79ee0eebe63611e370ffb911d9be245c99154)](https://sonarqube.eks.qflash.com.br/dashboard?id=Quasar-Flash_bigid_bgcheck)
[![Technical Debt](https://sonarqube.eks.qflash.com.br/api/project_badges/measure?project=Quasar-Flash_bigid_bgcheck&metric=sqale_index&token=23b79ee0eebe63611e370ffb911d9be245c99154)](https://sonarqube.eks.qflash.com.br/dashboard?id=Quasar-Flash_bigid_bgcheck)
[![Vulnerabilities](https://sonarqube.eks.qflash.com.br/api/project_badges/measure?project=Quasar-Flash_bigid_bgcheck&metric=vulnerabilities&token=23b79ee0eebe63611e370ffb911d9be245c99154)](https://sonarqube.eks.qflash.com.br/dashboard?id=Quasar-Flash_bigid_bgcheck)

Requirements
-----------------

- Ruby: Any version
- Bundler

Included Modules
-----------------

- [bigid-auth-ruby](https://github.com/Quasar-Flash/bigid-auth-ruby) - BigID API authentication module

Global Installation
-----------------

```sh
gem install bigid_bgcheck
```

Installation for Rails
-----------------

```ruby
# Add to the Gemfile
gem "bigid_bgcheck", "~> 0.3"
```

Installation using the Github Gem repo
-----------------

```ruby
source "https://rubygems.pkg.github.com/quasar-flash" do
  gem "bigid_bgcheck", "0.3.1"
end
```

Setting the BigID credentials
-----------------

```ruby
# Set the env variables
ENV["BIGID_USERNAME"] = "your_username"
ENV["BIGID_PASSWORD"] = "your_password"
```

Setting the BigID credentials - Rails Project
-----------------

Create the config/initializers/bigid.rb file and define:

```ruby
# Set the env variables
Bigid.configure do |config|
  config.username = "your_username"
  config.password = "your_password"
end
```

Applying a background check
-----------------

```ruby
require "bigid_bgcheck"

Bigid::Bgcheck::Request.new.call(
  document: "000.000.000-00",
  document_type: "CPF",
  group: "Default"
)
```

Result Example
-----------------

```ruby
#<Bigid::Bgcheck::Result:0x0000560fef3c1068
  @approved=false,
  @ticket_id="00000000000000000",
  @code=-1100,
  @message="Not Approved",
  @score=0,
  @limit_score=0.0>
```

Problems?
-----------------

**Please do not directly email any committers with questions or problems.**  A community is best served when discussions are held in public.

Searching the [issues](https://github.com/Quasar-Flash/bigid_bgcheck/issues) for your problem is also a good idea.

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

Please see [LICENSE](https://github.com/Quasar-Flash/bigid_bgcheck/blob/master/LICENSE.txt) for licensing details.

Authors
-----------------

Danilo Carolino, [@danilogco](https://github.com/danilogco) / [@Quasar-Flash](https://github.com/Quasar-Flash)
