WebApplication for search the optimal route between a list of cities (famous called Travel Sales Person Problem).

**Search_routes** aims to be as flexible as possible while helping you with dynamic data
The basic goal of Search_routes is to processing a search based of genetic algorithms and
determinate who have the better performance. It's mean the minimal distance including all the places. 

This application is based from the original code written by Sergio Fierens

Under License: MPL 1.1

Project: ai4r

Url: http://ai4r.org/

## Installation

Download as a simple ruby on rails application (Version 2.3.11):

```rails
rake db:migrate 
```

Run the following command to install it:

```gems
gem install rails -v 2.3.11
gem install sqlite3
```

```deploying
ruby script/server
```

It's important to determinate de matrix of cities for search in a CSV file as below:

```gems
public/data/list_places.csv
```

Run the URL:

```Browser
http://RAILS_URL/main/search
```

GPL Licence by Carlos Monterrosa Lopez
