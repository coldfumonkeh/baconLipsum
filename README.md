# Bacon Lipsum

Finding yourself hog-tied for content? No need to be a swine. Use this for all of your filler content needs.

Bacon Lipsum is a ColdFusion component to interact with the [Bacon Lipsum API](https://baconipsum.com/json-api/)

[![cfmlbadges](https://cfmlbadges.monkehworks.com/images/badges/tested-with-testbox.svg)](https://cfmlbadges.monkehworks.com)
[![cfmlbadges](https://cfmlbadges.monkehworks.com/images/badges/compatibility-lucee-45.svg)](https://cfmlbadges.monkehworks.com)
[![cfmlbadges](https://cfmlbadges.monkehworks.com/images/badges/compatibility-lucee-5.svg)](https://cfmlbadges.monkehworks.com)

## Rasher into action

It's easy to get some meaty goodness into your text.

Instantiate the `baconLipsum.cfc` component.

```
var oBaconLipsum = new baconLipsum();
```

Make a request to the API:

```
var strHamlet = oBaconLipsum.getPiggyWithIt( format = 'text' );
```

If using `json` format (the default), you can optionally pass in the `deserialize` parameter set to true, which will return the CFML array instead of the JSON string:

```
var aText = oBaconLipsum.getPiggyWithIt(
	format      = 'json',
	deserialize = true
);
```

Parameters:

* `type` Options are 'all-meat' for meat only or 'meat-and-filler' for meat mixed with miscellaneous ‘lorem ipsum’ filler.
* `paras` optional number of paragraphs, defaults to 5
* `sentences` number of sentences (this overrides paragraphs)
* `startWithLorem` optional. Pass 1 to start the first paragraph with 'Bacon ipsum dolor'
* `format` Default is 'json'. Options are 'json', 'text' or 'html'


Testing
----------------
The component has been tested against Lucee 4.5 and Lucee 5, you silly sausage.


Download
----------------
[baconLipsum](https://github.com/coldfumonkeh/baconLipsum/downloads)

### 1.0.0 - November 15, 2017

- Commit: Initial Release


MIT License

Copyright (c) 2012 Matt Gifford (Monkeh Works Ltd)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
