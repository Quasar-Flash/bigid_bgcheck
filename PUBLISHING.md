# Publishing

After the Github and Rubygems authenticatication, push with the following command:

```sh
gem build bigid_bgcheck.gemspec
gem push --key github --host https://rubygems.pkg.github.com/quasar-flash bigid_bgcheck-0.3.0.gem
```

Don't forget to generate the release:
