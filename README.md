# Memory Technical Challenge

This is Ruby on Rails app is a a small e-commerce dashboard built from sample order transactions. 
It allows the user to visualize previous orders data

## Versions :

Ruby - 2.5.1

Rails - 5.2.4

DB - PostgreSQL

Framework - Ruby on Rails

## To start :
To use this app locally, download the repo or clone it.
Or visit the app on production : [https://sofia-memory.herokuapp.com/](https://sofia-memory.herokuapp.com/)

### Installation:
```bash
bundle install
```
```bash
rails db:create
```
```bash
rails db:migrate
```
```bash
rails db:seed
```
NB : You can update the seed to import only part of the data found in the input csv file
```bash
rails server
```
Then go to ```http://localhost:3000/```

## How to test the app ?

### Via Rspec
Run ```rspec``` 