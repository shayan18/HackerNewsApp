# HackerNewsApp
An App that shows list of top stories from HackerNews around the world

### Application Architecture and Pods Used:
1. MVVM
3. Moya (Networking Layer)
### Advantage of Moya:
Code readability, easy to modularise, testable code clear usage of different endpoints

### Compromises
1. There can be a case with in the completion handler you'll need to confirm that the cell is still valid, it may have been reused during the async operation so this is compromise i made in given time.
2. Application lacks user experience as i was unable to add activity loader and other user experience stuff.
3. Unable to test negative cases so application may lack reliablity but if given time and if done proper testing it can pass all user tests cases.
4. The Application lacks finising touches like AppIcon and launcher screen etc.


