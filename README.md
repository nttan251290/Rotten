# Rotten
Rotten Tomatoes (raw)
This is a movies app displaying box office and top rental DVDs using the Rotten Tomatoes API.

Time spent: <15 hours>

Features
Required
[ok] User can view a list of movies. Poster images load asynchronously.

[ok] User can view movie details by tapping on a cell.

[ok] User sees loading state while waiting for the API.

[ ] User sees error message when there is a network error: cl.ly/image/1l1L3M460c3C

[ok] User can pull to refresh the movie list.

Optional

[ ] All images fade in.

[ ] For the larger poster, load the low-res first and switch to high-res when complete.

[ ] All images should be cached in memory and disk: AppDelegate has an instance of NSURLCache and NSURLRequest makes a request with NSURLRequestReturnCacheDataElseLoad cache policy. I tested it by turning off wifi and restarting the app.

[ ] Customize the highlight and selection effect of the cell.

[ok] Customize the navigation bar.

[ok] Add a tab bar for Box Office and DVD.

[ ] Add a search bar: pretty simple implementation of searching against the existing table view data.

Walkthrough


![](https://github.com/nttan251290/Rotten/blob/master/Rottens-tomatoes.gif)
