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

The Demo app shows the Top Paid Apps icons and screenshoots of the apps
The App is developed in iOS 8.0 compactible. 


