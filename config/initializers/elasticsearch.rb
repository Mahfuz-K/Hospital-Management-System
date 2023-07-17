# frozen_string_literal: true

# this is a config/elasticsearch
# config/initializers/elasticsearch.rb
Elasticsearch::Model.client = Elasticsearch::Client.new(
  hosts: 'http://localhost:9200'
)
