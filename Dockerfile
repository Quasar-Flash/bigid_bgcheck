FROM ruby:latest

ENV TZ="America/Sao_Paulo"

WORKDIR /src

COPY . .

COPY Gemfile ./

RUN gem update --system

RUN gem install bundler

RUN bundle check || bundle install --full-index --jobs 6 --retry 3

RUN rake install

RUN echo 'alias build="gem build bigid_bgcheck.gemspec"' >> ~/.bashrc

RUN echo 'alias release="rake release"' >> ~/.bashrc

RUN echo 'alias release_github="gem push --key github --host https://rubygems.pkg.github.com/quasar-flash "' >> ~/.bashrc

CMD ["irb"]
