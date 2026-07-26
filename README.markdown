[![Gem Version](https://img.shields.io/gem/v/phamilie?logo=rubygems)](https://rubygems.org/gems/phamilie)
[![Check](https://img.shields.io/github/actions/workflow/status/toy/phamilie/check.yml?label=check&logo=github)](https://github.com/toy/phamilie/actions/workflows/check.yml)
[![Zizmor](https://img.shields.io/github/actions/workflow/status/toy/phamilie/zizmor.yml?label=zizmor&logo=data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAzNiAzNiI+PHBhdGggZmlsbD0iI0VCMjAyNyIgZD0iTTAgMzZBMzYgMzYgMCAwIDEgMzYgMHYzQTMzIDMzIDAgMCAwIDMgMzZ6Ii8+PHBhdGggZmlsbD0iI0YxOTAyMCIgZD0iTTMgMzZBMzMgMzMgMCAwIDEgMzYgM3YzQTMwIDMwIDAgMCAwIDYgMzZ6Ii8+PHBhdGggZmlsbD0iI0ZGQ0I0QyIgZD0iTTYgMzZBMzAgMzAgMCAwIDEgMzYgNnYzQTI3IDI3IDAgMCAwIDkgMzZ6Ii8+PHBhdGggZmlsbD0iIzVDOTAzRiIgZD0iTTkgMzZBMjcgMjcgMCAwIDEgMzYgOXYzQTI0IDI0IDAgMCAwIDEyIDM2eiIvPjxwYXRoIGZpbGw9IiMyMjY3OTgiIGQ9Ik0xMiAzNkEyNCAyNCAwIDAgMSAzNiAxMnYzQTIxIDIxIDAgMCAwIDE1IDM2eiIvPjxwYXRoIGZpbGw9IiM4NzY3QUMiIGQ9Ik0xNSAzNkEyMSAyMSAwIDAgMSAzNiAxNXYzQTE4IDE4IDAgMCAwIDE4IDM2eiIvPjwvc3ZnPg==)](https://github.com/toy/phamilie/actions/workflows/zizmor.yml)

# Phamilie

Originally forked from [deepfryed/similie](https://github.com/deepfryed/similie).

Phamilie is a simple DCT based image hashing interface that,

* computes a fingerprint based on low frequencies of an image.
* computes hamming distance between 2 fingerprints.

## Example

```ruby
require 'phamilie'

phamilie = Phamilie.new

lena1 = 'spec/lena1.png'
lena2 = 'spec/lena2.png' # lena1.png cropped and scaled
lena5 = 'spec/lena5.png' # a different image
lena6 = 'spec/lena6.png' # lena2.png rotated and scaled

phamilie.fingerprint(lena1) #=> 36170087496991428

phamilie.distance(lena1, lena2) #=> 2
phamilie.distance(lena1, lena5) #=> 12

phamilie.distance(lena1, lena6) #=> 19
phamilie.distance(lena2, lena6) #=> 19
phamilie.distance(lena5, lena6) #=> 23
phamilie.distance_with_rotations(lena1, lena6) #=> 2
phamilie.distance_with_rotations(lena2, lena6) #=> 0
phamilie.distance_with_rotations(lena5, lena6) #=> 12
```

## Caching

By default a Hash is used to cache fingerprints by path. Be carefull if images or current directory can change in process.

As cache you can use an instance of class responding to `[]` and `[]=`.

If using persistant cache take into account file size and mtime or even cryptographic hash of contents.

## Dependencies

* ruby 1.9.1+
* CImg
* libpng if you need to read png images
* libjpeg if you need to read jpeg images
* ImageMagick if you need to read other images

# License

GPL — using code from pHash library
