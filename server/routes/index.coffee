module.exports.setup = (app) ->
  
  articles = require('./db/articles')
  articles.get('/db/article', app)
  articles.post('/db/article', app)
  articles.put('/db/article/:handle', app)
  articles.getByHandle('/db/article/:handle', app)
  articles.postNewVersion('/db/article/:handle/new-version', app)
  
  app.get('/db/products', require('./db/product').get)
