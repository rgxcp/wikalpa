# 🌵 Wikalpa

A wild wild west of Indonesian community driven discussion platform.

## 🚦 Status

[![Test](https://github.com/rgxcp/wikalpa/actions/workflows/test.yml/badge.svg)](https://github.com/rgxcp/wikalpa/actions/workflows/test.yml) [![Build](https://github.com/rgxcp/wikalpa/actions/workflows/build.yml/badge.svg)](https://github.com/rgxcp/wikalpa/actions/workflows/build.yml) [![Release](https://github.com/rgxcp/wikalpa/actions/workflows/release.yml/badge.svg)](https://github.com/rgxcp/wikalpa/actions/workflows/release.yml) [![codecov](https://codecov.io/gh/rgxcp/wikalpa/branch/main/graph/badge.svg?token=22C69ZCF4L)](https://codecov.io/gh/rgxcp/wikalpa)

MAINTAINING

## 📰 Table of Contents

| Content                                            |
| -------------------------------------------------- |
| [Status](#-status)                                 |
| [Links](#-links)                                   |
| [Requirements](#-requirements)                     |
| [How to: Setup Project](#-setup-project)           |
| [How to: Run Test Suite](#-run-test-suite)         |
| [How to: Run App on Local](#-run-app-on-local)     |
| [How to: Run Dockerized App](#-run-dockerized-app) |

## 🔗 Links

- [ERD](https://drive.google.com/file/d/1RDpWLb1sisBXBDSx0idp9TvRBGxbRrJl/view?usp=sharing)
- [Notion](https://torch-colony-099.notion.site/Wikalpa-2ba39daf9bb14ce3adf8b6c396dab55d)
- [SwaggerHub](https://app.swaggerhub.com/apis-docs/rgxcp/wikalpa/1.0.0)
- [Postman Workspace](https://www.postman.com/dark-desert-364453/workspace/wikalpa)
- [StackShare](https://stackshare.io/rgxcp/wikalpa)

## 🧾 Requirements

1. Git
2. Ruby
3. Bundler
4. PostgreSQL
5. Redis
6. SQLite3
7. Docker (_Optional_)
8. Docker Compose (_Optional_)
9. Postman (_Optional_)

## 🥋 How to

### 🔭 Setup Project

1. Clone the repository.
   ```
   $ git clone https://github.com/rgxcp/wikalpa.git
   ```
2. Add the following lines to your `.bashrc`, `.zshrc`, or any others shell configuration file for your machine setup.
   ```bash
   export RAILS_MASTER_KEY=
   export JWT_KEY=
   ```

### 🔬 Run Test Suite

1. Make sure you have [setup the project](#-setup-project).
2. Install the dependencies.
   ```
   $ bundle install
   ```
3. Run the test.
   ```
   $ bundle exec rspec
   ```

### 🏡 Run App on Local

1. Make sure you have [setup the project](#-setup-project).
2. Install the dependencies.
   ```
   $ bundle install
   ```
3. Setup the database.
   ```
   $ bin/rails db:setup
   ```
4. Run the server.
   ```
   $ bin/rails s
   ```
5. Run Sidekiq.
   ```
   $ bundle exec sidekiq
   ```

### 🚢 Run Dockerized App

1. Download the `docker-compose.yml` file and place it somewhere else.
2. Configure the required environment variables in it.
   ```yml
   - RAILS_MASTER_KEY=
   - JWT_KEY=
   - WIKALPA_DATABASE_PASSWORD=
   ```
3. Run the container.
   ```
   $ sudo docker-compose up -d
   ```
4. Setup the database.
   ```
   $ sudo docker exec wikalpa_api bin/rails db:setup
   ```
5. Run Sidekiq.
   ```
   $ sudo docker exec wikalpa_api bundle exec sidekiq
   ```
