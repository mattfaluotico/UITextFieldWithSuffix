# UITextFieldWithSuffix

Adds a suffix to a UIText Field. Great for Text Fields that use units! 

![screen](https://github.com/MattFaluotico/UITextFieldWithSuffix/blob/master/screen.png)

## Using it 

Drag `UITextFieldWithSuffix.h` and `UITextFieldWithSuffix.m` into your project.

Pod install coming soon.

Then just import `UITextFieldWithSuffix.h` in the classes you want to use it.

Then set the suffix property just like any other property. 

## Additional Methods 

`- (NSString*) getText;` returns the value of the UITextField without the suffix. Example: `330 grams` with a suffix of ` grams` would return `300`

## License 

`UITextFieldWithSuffix` is available under the MIT license. See the LICENSE file for more info.