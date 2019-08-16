<p align="center">
  <img src="http://301222.selcdn.com/nekko-ch-cdn1/assets/icon/1.5x/%D0%A0%D0%B5%D1%81%D1%83%D1%80%D1%81%205%401.5x.png" alt="nekko.ch" width="400" />
</p>

<h1 align="center"></h1>

<p align="center">
  <a href="https://circleci.com/gh/nekko-ru/website"><img src="https://circleci.com/gh/nekko-ru/website.svg?style=svg"></a>
  <br />
  <a href="https://github.com/deissh/website/blob/master/README_RU.md">
    Версия на русском
  </a>
</p>

<p align="center">
  <b>Nekko is a content discovery platform that helps search and watch anime.</b></br>
  <span>This README outlines the details of collaborating on this application.</span></br>
  <sub>Made with ❤️ by <a href="https://github.com/deissh">@deissh</a> and may be you</sub>
</p>

<br />

* [Setup]()
* [Screenshots]()


## Setup

First time need:

1. Docker or Bundle, Puma/something else, PostgreSQL, Radis
2. Docker Compose (if you chose docker)

Production:

1. Server with Debian/Ubuntu...
2. Docker or Bundle, Puma/something else, PostgreSQL, Radis
3. NGINX
4. Domain

### Local (manual installing ruby, PgSQL and etc)

Install our dependencies for compiiling Ruby along with Node.js and Yarn

```bash
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo add-apt-repository ppa:chris-lea/redis-server
sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev dirmngr gnupg apt-transport-https ca-certificates redis-server redis-tools nodejs yarn
```

Next we're going to install Ruby using a Ruby version mmanager called rbenv. It is the easiest and simplest option, plus it comes with some handy plugins to let us easily manage environment variables in production.

```bash
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
git clone https://github.com/rbenv/rbenv-vars.git ~/.rbenv/plugins/rbenv-vars
exec $SHELL
rbenv install 2.6.3
rbenv global 2.6.3
ruby -v
```

The last step is to install Bundler:

```bash
gem install bundler
```

#### Running

some magic (todo)

```bash
rake db:migrate
rake db:seed
rails s
```


## Screenshots

<img src="https://i.imgur.com/WPgqVBp.jpg" />
