# URBNLin
URBNLin is a Xcode plugin that provides auto-completion for `URBNStr`.  
Both Objective-C and Swift are supported. It is based on the wonderful [Lin plugin](http://questbe.at/lin/). URBNLin was made to run along side Lin. So feel free to install both. Or just one or the other. This is essentially a fork that provides support for the very specific `URBNStr(KEY)` macro. Which maps to `NSLocalizedString(KEY, nil)`. The typical use of `URBNStr(KEY)` is `NSString` constant based usage as opposed to the `NSLocalizedString` usage of string literals. If you would like to use string literals your best bet is to roll with Lin. Enjoy!

## Installation
Download the project and build it, and then relaunch Xcode.  
URBNLin will be installed in `~/Library/Application Support/Developer/Shared/Xcode/Plug-ins` automatically.

If you want to uninstall URBNLin, remove URBNLin.xcplugin in the `Plug-ins` directory.


## Notes
* Supported Xcode versions
  * Xcode 6.1
  * Xcode 6.2 beta
* Supported functions
  * URBNStr


## License
URBNLin is released under the **MIT License**.