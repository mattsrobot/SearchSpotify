//
// Copyright 2024 Matthew Wilkinson
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”),
// to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
// and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
// IN THE SOFTWARE.
//

import Foundation

let kMetalicaResponse =
"""
{
  "artists": {
    "href": "https://api.spotify.com/v1/search?query=metalica&type=artist&market=GB&locale=en-GB%2Cen%3Bq%3D0.9&offset=0&limit=20",
    "limit": 20,
    "next": "https://api.spotify.com/v1/search?query=metalica&type=artist&market=GB&locale=en-GB%2Cen%3Bq%3D0.9&offset=20&limit=20",
    "offset": 0,
    "previous": null,
    "total": 37,
    "items": [
      {
        "external_urls": {
          "spotify": "https://open.spotify.com/artist/2ye2Wgw4gimLv2eAKyk1NB"
        },
        "followers": {
          "href": null,
          "total": 26544666
        },
        "genres": ["hard rock", "metal", "old school thrash", "rock", "thrash metal"],
        "href": "https://api.spotify.com/v1/artists/2ye2Wgw4gimLv2eAKyk1NB",
        "id": "2ye2Wgw4gimLv2eAKyk1NB",
        "images": [
          {
            "url": "https://i.scdn.co/image/ab6761610000e5eb69ca98dd3083f1082d740e44",
            "height": 640,
            "width": 640
          },
          {
            "url": "https://i.scdn.co/image/ab6761610000517469ca98dd3083f1082d740e44",
            "height": 320,
            "width": 320
          },
          {
            "url": "https://i.scdn.co/image/ab6761610000f17869ca98dd3083f1082d740e44",
            "height": 160,
            "width": 160
          }
        ],
        "name": "Metallica",
        "popularity": 81,
        "type": "artist",
        "uri": "spotify:artist:2ye2Wgw4gimLv2eAKyk1NB"
      },
      {
        "external_urls": {
          "spotify": "https://open.spotify.com/artist/3qm84nBOXUEQ2vnTfUTTFC"
        },
        "followers": {
          "href": null,
          "total": 30310711
        },
        "genres": ["glam metal", "hard rock", "rock"],
        "href": "https://api.spotify.com/v1/artists/3qm84nBOXUEQ2vnTfUTTFC",
        "id": "3qm84nBOXUEQ2vnTfUTTFC",
        "images": [
          {
            "url": "https://i.scdn.co/image/ab6761610000e5eb50defaf9fc059a1efc541f4c",
            "height": 640,
            "width": 640
          },
          {
            "url": "https://i.scdn.co/image/ab6761610000517450defaf9fc059a1efc541f4c",
            "height": 320,
            "width": 320
          },
          {
            "url": "https://i.scdn.co/image/ab6761610000f17850defaf9fc059a1efc541f4c",
            "height": 160,
            "width": 160
          }
        ],
        "name": "Guns N' Roses",
        "popularity": 79,
        "type": "artist",
        "uri": "spotify:artist:3qm84nBOXUEQ2vnTfUTTFC"
      },
      {
        "external_urls": {
          "spotify": "https://open.spotify.com/artist/711MCceyCBcFnzjGY4Q7Un"
        },
        "followers": {
          "href": null,
          "total": 27822650
        },
        "genres": ["australian rock", "hard rock", "rock"],
        "href": "https://api.spotify.com/v1/artists/711MCceyCBcFnzjGY4Q7Un",
        "id": "711MCceyCBcFnzjGY4Q7Un",
        "images": [
          {
            "url": "https://i.scdn.co/image/ab6761610000e5ebc4c77549095c86acb4e77b37",
            "height": 640,
            "width": 640
          },
          {
            "url": "https://i.scdn.co/image/ab67616100005174c4c77549095c86acb4e77b37",
            "height": 320,
            "width": 320
          },
          {
            "url": "https://i.scdn.co/image/ab6761610000f178c4c77549095c86acb4e77b37",
            "height": 160,
            "width": 160
          }
        ],
        "name": "AC/DC",
        "popularity": 80,
        "type": "artist",
        "uri": "spotify:artist:711MCceyCBcFnzjGY4Q7Un"
      },
      {
        "external_urls": {
          "spotify": "https://open.spotify.com/artist/6mdiAmATAx73kdxrNrnlao"
        },
        "followers": {
          "href": null,
          "total": 8759314
        },
        "genres": ["alternative metal", "hard rock", "metal", "nwobhm", "rock"],
        "href": "https://api.spotify.com/v1/artists/6mdiAmATAx73kdxrNrnlao",
        "id": "6mdiAmATAx73kdxrNrnlao",
        "images": [
          {
            "url": "https://i.scdn.co/image/ab6761610000e5eb232a905537f61c00da9d16e0",
            "height": 640,
            "width": 640
          },
          {
            "url": "https://i.scdn.co/image/ab67616100005174232a905537f61c00da9d16e0",
            "height": 320,
            "width": 320
          },
          {
            "url": "https://i.scdn.co/image/ab6761610000f178232a905537f61c00da9d16e0",
            "height": 160,
            "width": 160
          }
        ],
        "name": "Iron Maiden",
        "popularity": 71,
        "type": "artist",
        "uri": "spotify:artist:6mdiAmATAx73kdxrNrnlao"
      },
      {
        "external_urls": {
          "spotify": "https://open.spotify.com/artist/3qnnMqOLAaL68YcZAvYwat"
        },
        "followers": {
          "href": null,
          "total": 4858
        },
        "genres": ["indonesian pop punk"],
        "href": "https://api.spotify.com/v1/artists/3qnnMqOLAaL68YcZAvYwat",
        "id": "3qnnMqOLAaL68YcZAvYwat",
        "images": [
          {
            "url": "https://i.scdn.co/image/ab67616d0000b273b418ec44be106488b32b8ec2",
            "height": 640,
            "width": 640
          },
          {
            "url": "https://i.scdn.co/image/ab67616d00001e02b418ec44be106488b32b8ec2",
            "height": 300,
            "width": 300
          },
          {
            "url": "https://i.scdn.co/image/ab67616d00004851b418ec44be106488b32b8ec2",
            "height": 64,
            "width": 64
          }
        ],
        "name": "Metalican",
        "popularity": 21,
        "type": "artist",
        "uri": "spotify:artist:3qnnMqOLAaL68YcZAvYwat"
      },
      {
        "external_urls": {
          "spotify": "https://open.spotify.com/artist/6olE6TJLqED3rqDCT0FyPh"
        },
        "followers": {
          "href": null,
          "total": 18763382
        },
        "genres": ["grunge", "permanent wave", "rock"],
        "href": "https://api.spotify.com/v1/artists/6olE6TJLqED3rqDCT0FyPh",
        "id": "6olE6TJLqED3rqDCT0FyPh",
        "images": [
          {
            "url": "https://i.scdn.co/image/84282c28d851a700132356381fcfbadc67ff498b",
            "height": 1057,
            "width": 1000
          },
          {
            "url": "https://i.scdn.co/image/a4e10b79a642e9891383448cbf37d7266a6883d6",
            "height": 677,
            "width": 640
          },
          {
            "url": "https://i.scdn.co/image/42ae0f180f16e2f21c1f2212717fc436f5b95451",
            "height": 211,
            "width": 200
          },
          {
            "url": "https://i.scdn.co/image/e797ad36d56c3fc8fa06c6fe91263a15bf8391b8",
            "height": 68,
            "width": 64
          }
        ],
        "name": "Nirvana",
        "popularity": 81,
        "type": "artist",
        "uri": "spotify:artist:6olE6TJLqED3rqDCT0FyPh"
      },
      {
        "external_urls": {
          "spotify": "https://open.spotify.com/artist/05fG473iIaoy82BF1aGhL8"
        },
        "followers": {
          "href": null,
          "total": 10582245
        },
        "genres": ["alternative metal", "nu metal", "rap metal", "rock"],
        "href": "https://api.spotify.com/v1/artists/05fG473iIaoy82BF1aGhL8",
        "id": "05fG473iIaoy82BF1aGhL8",
        "images": [
          {
            "url": "https://i.scdn.co/image/ab6761610000e5ebff9f4de8c13f6f563acbfaf1",
            "height": 640,
            "width": 640
          },
          {
            "url": "https://i.scdn.co/image/ab67616100005174ff9f4de8c13f6f563acbfaf1",
            "height": 320,
            "width": 320
          },
          {
            "url": "https://i.scdn.co/image/ab6761610000f178ff9f4de8c13f6f563acbfaf1",
            "height": 160,
            "width": 160
          }
        ],
        "name": "Slipknot",
        "popularity": 77,
        "type": "artist",
        "uri": "spotify:artist:05fG473iIaoy82BF1aGhL8"
      },
      {
        "external_urls": {
          "spotify": "https://open.spotify.com/artist/1Yox196W7bzVNZI7RBaPnf"
        },
        "followers": {
          "href": null,
          "total": 5125172
        },
        "genres": ["alternative metal", "hard rock", "melodic thrash", "metal", "old school thrash", "rock", "speed metal", "thrash metal"],
        "href": "https://api.spotify.com/v1/artists/1Yox196W7bzVNZI7RBaPnf",
        "id": "1Yox196W7bzVNZI7RBaPnf",
        "images": [
          {
            "url": "https://i.scdn.co/image/ab6761610000e5eb79058c0b634631533ed40b22",
            "height": 640,
            "width": 640
          },
          {
            "url": "https://i.scdn.co/image/ab6761610000517479058c0b634631533ed40b22",
            "height": 320,
            "width": 320
          },
          {
            "url": "https://i.scdn.co/image/ab6761610000f17879058c0b634631533ed40b22",
            "height": 160,
            "width": 160
          }
        ],
        "name": "Megadeth",
        "popularity": 69,
        "type": "artist",
        "uri": "spotify:artist:1Yox196W7bzVNZI7RBaPnf"
      },
      {
        "external_urls": {
          "spotify": "https://open.spotify.com/artist/2k6JE1LV7mSOavtrZ5m5qR"
        },
        "followers": {
          "href": null,
          "total": 1086
        },
        "genres": [],
        "href": "https://api.spotify.com/v1/artists/2k6JE1LV7mSOavtrZ5m5qR",
        "id": "2k6JE1LV7mSOavtrZ5m5qR",
        "images": [
          {
            "url": "https://i.scdn.co/image/ab67616d0000b273e0d2015304738c7bc08c5203",
            "height": 640,
            "width": 640
          },
          {
            "url": "https://i.scdn.co/image/ab67616d00001e02e0d2015304738c7bc08c5203",
            "height": 300,
            "width": 300
          },
          {
            "url": "https://i.scdn.co/image/ab67616d00004851e0d2015304738c7bc08c5203",
            "height": 64,
            "width": 64
          }
        ],
        "name": "SaD - Symphony and Metallica",
        "popularity": 10,
        "type": "artist",
        "uri": "spotify:artist:2k6JE1LV7mSOavtrZ5m5qR"
      },
      {
        "external_urls": {
          "spotify": "https://open.spotify.com/artist/7LPINZeKsePULDNFxjntFN"
        },
        "followers": {
          "href": null,
          "total": 121
        },
        "genres": [],
        "href": "https://api.spotify.com/v1/artists/7LPINZeKsePULDNFxjntFN",
        "id": "7LPINZeKsePULDNFxjntFN",
        "images": [
          {
            "url": "https://i.scdn.co/image/ab6761610000e5ebf5eae4e6b956806e803134f6",
            "height": 640,
            "width": 640
          },
          {
            "url": "https://i.scdn.co/image/ab67616100005174f5eae4e6b956806e803134f6",
            "height": 320,
            "width": 320
          },
          {
            "url": "https://i.scdn.co/image/ab6761610000f178f5eae4e6b956806e803134f6",
            "height": 160,
            "width": 160
          }
        ],
        "name": "Metallicity",
        "popularity": 2,
        "type": "artist",
        "uri": "spotify:artist:7LPINZeKsePULDNFxjntFN"
      },
      {
        "external_urls": {
          "spotify": "https://open.spotify.com/artist/0tWtQEPBx1mw7QLeGlB9BB"
        },
        "followers": {
          "href": null,
          "total": 686
        },
        "genres": [],
        "href": "https://api.spotify.com/v1/artists/0tWtQEPBx1mw7QLeGlB9BB",
        "id": "0tWtQEPBx1mw7QLeGlB9BB",
        "images": [
          {
            "url": "https://i.scdn.co/image/ab67616d0000b273a8da0ec26d5575fe31e121d5",
            "height": 640,
            "width": 640
          },
          {
            "url": "https://i.scdn.co/image/ab67616d00001e02a8da0ec26d5575fe31e121d5",
            "height": 300,
            "width": 300
          },
          {
            "url": "https://i.scdn.co/image/ab67616d00004851a8da0ec26d5575fe31e121d5",
            "height": 64,
            "width": 64
          }
        ],
        "name": "Mettalixa",
        "popularity": 3,
        "type": "artist",
        "uri": "spotify:artist:0tWtQEPBx1mw7QLeGlB9BB"
      },
      {
        "external_urls": {
          "spotify": "https://open.spotify.com/artist/7Cb4VdtakIlAvklqegssGB"
        },
        "followers": {
          "href": null,
          "total": 12534
        },
        "genres": [],
        "href": "https://api.spotify.com/v1/artists/7Cb4VdtakIlAvklqegssGB",
        "id": "7Cb4VdtakIlAvklqegssGB",
        "images": [
          {
            "url": "https://i.scdn.co/image/ab67616d0000b2730baa189d8d5e6ca03a5adfed",
            "height": 640,
            "width": 640
          },
          {
            "url": "https://i.scdn.co/image/ab67616d00001e020baa189d8d5e6ca03a5adfed",
            "height": 300,
            "width": 300
          },
          {
            "url": "https://i.scdn.co/image/ab67616d000048510baa189d8d5e6ca03a5adfed",
            "height": 64,
            "width": 64
          }
        ],
        "name": "Spartan Metallican Visionary",
        "popularity": 0,
        "type": "artist",
        "uri": "spotify:artist:7Cb4VdtakIlAvklqegssGB"
      },
      {
        "external_urls": {
          "spotify": "https://open.spotify.com/artist/5PQkePvARU89ft27ONH2aY"
        },
        "followers": {
          "href": null,
          "total": 424
        },
        "genres": [],
        "href": "https://api.spotify.com/v1/artists/5PQkePvARU89ft27ONH2aY",
        "id": "5PQkePvARU89ft27ONH2aY",
        "images": [
          {
            "url": "https://i.scdn.co/image/ab67616d0000b2730756de1d4df45cae502655ad",
            "height": 640,
            "width": 640
          },
          {
            "url": "https://i.scdn.co/image/ab67616d00001e020756de1d4df45cae502655ad",
            "height": 300,
            "width": 300
          },
          {
            "url": "https://i.scdn.co/image/ab67616d000048510756de1d4df45cae502655ad",
            "height": 64,
            "width": 64
          }
        ],
        "name": "Metalian",
        "popularity": 1,
        "type": "artist",
        "uri": "spotify:artist:5PQkePvARU89ft27ONH2aY"
      },
      {
        "external_urls": {
          "spotify": "https://open.spotify.com/artist/1AsOAmXcIKDiN1Cwe17iQP"
        },
        "followers": {
          "href": null,
          "total": 65
        },
        "genres": [],
        "href": "https://api.spotify.com/v1/artists/1AsOAmXcIKDiN1Cwe17iQP",
        "id": "1AsOAmXcIKDiN1Cwe17iQP",
        "images": [
          {
            "url": "https://i.scdn.co/image/ab67616d0000b273d32c16e77d71307df6c38b08",
            "height": 640,
            "width": 640
          },
          {
            "url": "https://i.scdn.co/image/ab67616d00001e02d32c16e77d71307df6c38b08",
            "height": 300,
            "width": 300
          },
          {
            "url": "https://i.scdn.co/image/ab67616d00004851d32c16e77d71307df6c38b08",
            "height": 64,
            "width": 64
          }
        ],
        "name": "Generaciones metalicas",
        "popularity": 1,
        "type": "artist",
        "uri": "spotify:artist:1AsOAmXcIKDiN1Cwe17iQP"
      },
      {
        "external_urls": {
          "spotify": "https://open.spotify.com/artist/5E2nkYdPcLEp7SkhhSyW3G"
        },
        "followers": {
          "href": null,
          "total": 7128
        },
        "genres": ["black thrash", "japanese heavy metal"],
        "href": "https://api.spotify.com/v1/artists/5E2nkYdPcLEp7SkhhSyW3G",
        "id": "5E2nkYdPcLEp7SkhhSyW3G",
        "images": [
          {
            "url": "https://i.scdn.co/image/ab67616d0000b27339ba50ac7657df2465fef334",
            "height": 640,
            "width": 640
          },
          {
            "url": "https://i.scdn.co/image/ab67616d00001e0239ba50ac7657df2465fef334",
            "height": 300,
            "width": 300
          },
          {
            "url": "https://i.scdn.co/image/ab67616d0000485139ba50ac7657df2465fef334",
            "height": 64,
            "width": 64
          }
        ],
        "name": "Metalucifer",
        "popularity": 13,
        "type": "artist",
        "uri": "spotify:artist:5E2nkYdPcLEp7SkhhSyW3G"
      },
      {
        "external_urls": {
          "spotify": "https://open.spotify.com/artist/7u12AuhJ5AaJIgZAZe0US8"
        },
        "followers": {
          "href": null,
          "total": 396143
        },
        "genres": ["comic metal"],
        "href": "https://api.spotify.com/v1/artists/7u12AuhJ5AaJIgZAZe0US8",
        "id": "7u12AuhJ5AaJIgZAZe0US8",
        "images": [
          {
            "url": "https://i.scdn.co/image/ab67616d0000b273533644c194069d80a08109cf",
            "height": 640,
            "width": 640
          },
          {
            "url": "https://i.scdn.co/image/ab67616d00001e025cee455d46a98b46e1c7dd73",
            "height": 300,
            "width": 300
          },
          {
            "url": "https://i.scdn.co/image/ab67616d00004851533644c194069d80a08109cf",
            "height": 64,
            "width": 64
          }
        ],
        "name": "Metalocalypse: Dethklok",
        "popularity": 53,
        "type": "artist",
        "uri": "spotify:artist:7u12AuhJ5AaJIgZAZe0US8"
      },
      {
        "external_urls": {
          "spotify": "https://open.spotify.com/artist/29lPjMvFLvXkr0Y3W8uZmj"
        },
        "followers": {
          "href": null,
          "total": 0
        },
        "genres": [],
        "href": "https://api.spotify.com/v1/artists/29lPjMvFLvXkr0Y3W8uZmj",
        "id": "29lPjMvFLvXkr0Y3W8uZmj",
        "images": [
          {
            "url": "https://i.scdn.co/image/ab67616d0000b273b5246c236bdd278f7757c8f8",
            "height": 640,
            "width": 640
          },
          {
            "url": "https://i.scdn.co/image/ab67616d00001e02b5246c236bdd278f7757c8f8",
            "height": 300,
            "width": 300
          },
          {
            "url": "https://i.scdn.co/image/ab67616d00004851b5246c236bdd278f7757c8f8",
            "height": 64,
            "width": 64
          }
        ],
        "name": "Nébula Metálica",
        "popularity": 3,
        "type": "artist",
        "uri": "spotify:artist:29lPjMvFLvXkr0Y3W8uZmj"
      },
      {
        "external_urls": {
          "spotify": "https://open.spotify.com/artist/2ItT9Xd93IZxujf5P5nggb"
        },
        "followers": {
          "href": null,
          "total": 5
        },
        "genres": [],
        "href": "https://api.spotify.com/v1/artists/2ItT9Xd93IZxujf5P5nggb",
        "id": "2ItT9Xd93IZxujf5P5nggb",
        "images": [],
        "name": "Metalic boys",
        "popularity": 4,
        "type": "artist",
        "uri": "spotify:artist:2ItT9Xd93IZxujf5P5nggb"
      },
      {
        "external_urls": {
          "spotify": "https://open.spotify.com/artist/47wBd6p1vSdIrgXxdc1Cde"
        },
        "followers": {
          "href": null,
          "total": 27
        },
        "genres": [],
        "href": "https://api.spotify.com/v1/artists/47wBd6p1vSdIrgXxdc1Cde",
        "id": "47wBd6p1vSdIrgXxdc1Cde",
        "images": [
          {
            "url": "https://i.scdn.co/image/ab67616d0000b2737ebaa72eca7e4cb70f4902ec",
            "height": 640,
            "width": 640
          },
          {
            "url": "https://i.scdn.co/image/ab67616d00001e027ebaa72eca7e4cb70f4902ec",
            "height": 300,
            "width": 300
          },
          {
            "url": "https://i.scdn.co/image/ab67616d000048517ebaa72eca7e4cb70f4902ec",
            "height": 64,
            "width": 64
          }
        ],
        "name": "MetallicaMan",
        "popularity": 0,
        "type": "artist",
        "uri": "spotify:artist:47wBd6p1vSdIrgXxdc1Cde"
      },
      {
        "external_urls": {
          "spotify": "https://open.spotify.com/artist/6jPnjdXijpUoqWR4YTWDo3"
        },
        "followers": {
          "href": null,
          "total": 19456
        },
        "genres": ["bases de freestyle", "rap sureno chileno"],
        "href": "https://api.spotify.com/v1/artists/6jPnjdXijpUoqWR4YTWDo3",
        "id": "6jPnjdXijpUoqWR4YTWDo3",
        "images": [
          {
            "url": "https://i.scdn.co/image/ab6761610000e5eb954c98c9fb3d1dac3f8e9d74",
            "height": 640,
            "width": 640
          },
          {
            "url": "https://i.scdn.co/image/ab67616100005174954c98c9fb3d1dac3f8e9d74",
            "height": 320,
            "width": 320
          },
          {
            "url": "https://i.scdn.co/image/ab6761610000f178954c98c9fb3d1dac3f8e9d74",
            "height": 160,
            "width": 160
          }
        ],
        "name": "Metalingüística",
        "popularity": 34,
        "type": "artist",
        "uri": "spotify:artist:6jPnjdXijpUoqWR4YTWDo3"
      }
    ]
  }
}

"""
