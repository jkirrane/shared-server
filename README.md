# TiF Shared Server

This is a Sinatra server that may be deployed on the Think it First shared local server. The initial purpose of the server is to act as a simple way to initiate dumps and ddownloads of MySQL databases. 

## Getting Started

The server uses Ruby, the Sinatra web framework and a SQLite3 database. There are a few Ruby gems that need to be installed, which you can find below.

### Prerequisities

Before running this server you'll need to have Ruby installed as well as the following gems.

Sinatra
```
gem install sinatra
```

DataMapper SQLite Adapter
```
gem instal dm-sqlite-adapter
```

DataMapper
```
gem install data_mapper
```

### Installing

After installing the gems and cloning the repository, you'll need to move the /config/config-sample.rb to /config/config.rb and populate it with your local mysql username/password. At this time, the server is not able to handle storing multiple mysql username/password pairs.

## Running the Server

Run the server by entering
```
ruby bin/app.rb
```
Access the site at http://localhost:8080/databases

## Running the tests

Automated tests have not yet been built.
