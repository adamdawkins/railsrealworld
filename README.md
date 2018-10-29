# README

## General Functionality
[ ] Authenticate users via JWT (login/signup pages + logout button on settings page)
[ ] CRU* users (sign up & settings page - no deleting required)
    ☑︎ 
[ ] CRUD Articles
    ☑︎ 
[ ] CR*D Comments on articles (no updating required)
[ ] GET and display paginated lists of articles
[ ] Favorite articles
[ ] Follow other users

## API Spec
- We'll only follow this as far as a traditional Rails front-end requires
[ ] Registration: POST /api/users
  Required fields: email, username, password
[ ] Get Current User: GET /api/user 
  - Authentication required
  - returns a User that's the current user
[ ] Update User : Put /api/user
  - Auth required, returns user
  - Accepted fields: email, username, password, image, bio 
  - Returns the user

[ ] Get profile : /api/profiles/:username - returns a Profile

[ ] Follow User: POST /api/profiles/:username/follow
  - Authenticated required
  - returns a Profile
[ ] Unfollow User: DELETE /api/profiles/:username/follow
  - Authenticated required
  - returns a Profile

[ ] List articles: GET /api/articles
  - returns most recent articles globally by default
  - accepts ?tag
  - accepts ?author
  - favouried by user ?favorited
  - Limit number of articles `?limit=20` (default 20)
  - offset / skip - deafult is 0: `?offset=0`
[ ] Feed articles: GET api/articles/feed
  - can also take `limit`
  - and `offset` paramateres
  - Authenication required
  - will return mulitple articles by followed users, ordered by most recent first

[ ] Get article: GET /api/articles/:slug
  - Returns a single article
[ ] Create article: POST /api/articles
  - Authentication required
  - will return an article
[ ] update article: PUT /api/articles/:slug
  - `slug` gets changed when the title is changed
  - Auth required
  - returns article

[ ] delete article: DELETE /api/articles/:slug

[ ] Add comments to an article: POST /api/articles/:slug/comments
  - Auth required
  - returns comment

[ ] get comments from an article: GET /api/articles/:slug/comments
  - returns multiple comments

[ ] Delete  comment: DELETE /api/articles/:slug/comments/:id
  - Auth required

[ ] Favourite article: POST /api/articles/:slug/favorite
  - Auth required, returns the Article

[ ] Unfavourite article: DELETE /api/articles/:slug/favourite
  - Auth required, returns the Article


[ ] Get tags: GET /api/tags
  - returns a list of tags

## Front-end spec
[ ] - Home page (URL: / )
  - List of tags
  List of articles pulled from either 
  - Feed
  - Global
  - or by Tag
  - Pagination for list of articles
[ ] Sign in/Sign up pages (URL: /login, /register )
[ ] Settings page (URL: /settings )
[ ] Editor page to create/edit articles
  - /editor
  - /editor/:slug
[ ] Article page (URL: /article/article-slug-here )
  - Delete article button (only shown to article's author)
  - Render markdown from server client side
  - Comments section at bottom of page
  - Delete comment button (only shown to comment's author)
[ ] Profile page (URL: /profile/:username, /profile/:username/favorites )
  - Show basic user info
  - List of articles populated from author's created articles
  - or author's favorited articles

