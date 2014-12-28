UIImageView-Async-download
==========================

UIImageView Extension for downloading and setting an image from remote URL.  

![solarized vim](http://i.imgur.com/t2g8coS.png)
![solarized vim](http://i.imgur.com/Q7gbj3k.png)

Usage
========
Include UIImageView+Networking.h into the file were it requires set remote image.

    [self.imageView setImage:[UIImage imageNamed:@"PlaceHolderBG"]];
    [self.imageView setImageURL:[NSURL URLWithString:imageURL]];

set the remote image Url as shown above to the imageView.
That's it :)

The demo app show the usage of UIImageView Extension. The app downloads all top paid itunes app details like icons, screenshots, summary, etc. and display them appropriately.

app is auto layout enabled, which uses resizable UITableViewCell dynamically calculating the cell height,
app uses NSURLSessions to download the image from the remote server using NSURLSessionDownloadTask.


