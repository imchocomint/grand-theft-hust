# Grand Theft HUST
## Introduction
The TSA (Thinking Skills Assessment), commonly known as Đánh giá tư duy in Vietnamese (abbr. ĐGTD), is a new test for Vietnamese students, created by HUST (Hanoi University of Science & Technology). It is a much better version of the ACT, with reading, maths and a functioning sciences section. The test is hosted thrice a year, and all sessions end before June. It costs $19 (500000 VNđ) as of 7/12/25.

They have [a self-study book for half of the price of the test](https://nxbbachkhoa.vn/cam-nang-thi-danh-gia-tu-duy-xuat-ban-lan-thu-2-b12764.html). Apart from the printed book, you have access to 3 digital mock tests which you can redeem in MyTSA.

Lucky you broke people, they released [a digital version of the book](https://nxbbachkhoa.vn/ebook-free/12767/0/1). However...

## The catch
You can't download the book for offline viewing. You can't open Inspect mode on their page by pressing F12 or Ctrl + Shift + I. And if you forcefully do, the website will clear everything on the code (I do not know what a DOM is since I don't know JS) and force you to exit, while counting down 5 seconds to reload. And you can't seem to see the PDF file in the Network tab.

There is also one thing is that they don't give free mock test with the ebook. But why even bother with that?

## Deep dive
Using `view-source:`, I found the code:
```
<!DOCTYPE html><html><head><meta charset=utf-8><meta name=viewport content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"><meta http-equiv=X-UA-Compatible content="ie=edge"><meta name=robots content="noindex, nofollow"><link href=/favicon.png rel="shortcut icon" type=image/x-icon><title>Ebook C&#x1EA9;m nang thi &#x110;&#xE1;nh gi&#xE1; T&#x1B0; duy</title><link rel=stylesheet href=//reading.nxbbachkhoa.vn/lib/pdf/css/style.css><link rel=stylesheet href=//reading.nxbbachkhoa.vn/lib/pdf/css/player.css><link rel=stylesheet href=//reading.nxbbachkhoa.vn/lib/pdf/css/phoneTemplate.css><link rel=stylesheet href=//reading.nxbbachkhoa.vn/lib/pdf/css/template.css><link rel=stylesheet href=//reading.nxbbachkhoa.vn/lib/plugin/trial-limit-popup.css><style media=print>*{display:none}</style><script src=//reading.nxbbachkhoa.vn/lib/pdf/js/jquery-1.9.1.min.js></script><script src=//reading.nxbbachkhoa.vn/lib/pdf/js/language.js></script><script src=//reading.nxbbachkhoa.vn/doc-sach/c9648e7d-4c58-4d2a-8ba5-f7230271aae7/mobile/javascript/config.js></script><script src=//reading.nxbbachkhoa.vn/lib/pdf/js/config.js></script><script src="/lib/plugin/trial-limit-checker.js?v=r-EjWPCTKLMqqTZZ-yp9Gc5NKdAQQvYZDiRLTRm9G1c"></script><script>var UrlTracking='';aliasConfig.UIBaseURL='https://reading.nxbbachkhoa.vn/doc-sach/c9648e7d-4c58-4d2a-8ba5-f7230271aae7';bookConfig.OriginPageIndex=1;bookConfig.totalPageCount=456;bookConfig.thumbPath='https://reading.nxbbachkhoa.vn/doc-sach/c9648e7d-4c58-4d2a-8ba5-f7230271aae7/files/thumb/';bookConfig.UIBaseURL='https://reading.nxbbachkhoa.vn/doc-sach/c9648e7d-4c58-4d2a-8ba5-f7230271aae7/mobile/';bookConfig.bookTitle='https://reading.nxbbachkhoa.vn/doc-sach/c9648e7d-4c58-4d2a-8ba5-f7230271aae7';bookConfig.searchPositionJS='https://reading.nxbbachkhoa.vn/doc-sach/c9648e7d-4c58-4d2a-8ba5-f7230271aae7/mobile/javascript/text_position[1].js';bookConfig.searchTextJS='https://reading.nxbbachkhoa.vn/doc-sach/c9648e7d-4c58-4d2a-8ba5-f7230271aae7/mobile/javascript/search_config.js';bookConfig.normalPath='https://reading.nxbbachkhoa.vn/doc-sach/c9648e7d-4c58-4d2a-8ba5-f7230271aae7/files/mobile/';bookConfig.largePath='https://reading.nxbbachkhoa.vn/doc-sach/c9648e7d-4c58-4d2a-8ba5-f7230271aae7/files/mobile/';bookConfig.UrlCurentPage='';bookConfig.appLogoIcon='https://images.nxbbachkhoa.vn/avatar/image-20220611152112.svg';bookConfig.language='vi';try{for(var i=0;pageEditor!=undefined&&i<pageEditor.length;i++){if(pageEditor[i].length==0){continue;}for(var j=0;j<pageEditor[i].length;j++){var anno=pageEditor[i][j];if(anno==undefined)continue;if(anno.overAlpha==undefined){anno.overAlpha=bookConfig.LinkAlpha;}if(anno.outAlpha==undefined){anno.outAlpha=0;}if(anno.downAlpha==undefined){anno.downAlpha=bookConfig.LinkAlpha;}if(anno.overColor==undefined){anno.overColor=bookConfig.LinkDownColor;}if(anno.downColor==undefined){anno.downColor=bookConfig.LinkDownColor;}if(anno.outColor==undefined){anno.outColor=bookConfig.LinkDownColor;}if(anno.annotype=='com.mobiano.flipbook.pageeditor.TAnnoLink'){anno.alpha=bookConfig.LinkAlpha;}}}}catch(e){}try{$.browser.device=2;}catch(e){}$(document).ready(function(){var isTrialMode=false;if(isTrialMode){TrialLimitChecker.init({isTrialMode:true,maxTrialPages:456,currentPage:1,queryId:0,nameAscii:'',website:''});}});</script><script async src="//www.googletagmanager.com/gtag/js?id=G-HFDYKEJJ3N"></script><script>window.dataLayer=window.dataLayer||[];function gtag(){dataLayer.push(arguments);}gtag('js',new Date());gtag('config','G-HFDYKEJJ3N');</script><body><script src=//reading.nxbbachkhoa.vn/doc-sach/c9648e7d-4c58-4d2a-8ba5-f7230271aae7/mobile/javascript/search_config.js></script><script src=//reading.nxbbachkhoa.vn/doc-sach/c9648e7d-4c58-4d2a-8ba5-f7230271aae7/mobile/javascript/bookmark_config.js></script><script src=//reading.nxbbachkhoa.vn/lib/pdf/js/LoadingJS.js></script><script src="//reading.nxbbachkhoa.vn/lib/pdf/js/main.js?v=0.0.0"></script><script src="/lib/plugin/blocker.js?v=gjBRnV4rDnijITbt_kLguNI4jPmJY2dYF6-4Dcalhj8"></script>
```

It showed us one or two valuable things:
- They use FlippingBook to turn the PDF to a flipbook. It shreds the PDF to 400+ JPG files.
- The base URL for each image: `https://reading.nxbbachkhoa.vn/doc-sach/c9648e7d-4c58-4d2a-8ba5-f7230271aae7/files/mobile/`

Furthermore, if you forcefully open Inspect mode, you would find something like this:

<img width="573" height="88" alt="image" src="https://github.com/user-attachments/assets/177639c1-4e2e-4fd3-b211-8640022118ed" />

Copy as cURL for any of that. We would find
```
curl ^"https://reading.nxbbachkhoa.vn/doc-sach/c9648e7d-4c58-4d2a-8ba5-f7230271aae7/files/mobile/1.jpg?251128170538^" ^
  -H ^"accept: image/avif,image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8^" ^
  -H ^"accept-language: en-US,en;q=0.9^" ^
  -b ^"_ga=GA1.1.1242098992.1765118021; _ga_HFDYKEJJ3N=GS2.1.s1765118021^$o1^$g1^$t1765118038^$j43^$l0^$h0^" ^
  -H ^"priority: i^" ^
  -H ^"referer: https://nxbbachkhoa.vn/^" ^
  -H ^"sec-ch-ua: ^\^"Chromium^\^";v=^\^"142^\^", ^\^"Google Chrome^\^";v=^\^"142^\^", ^\^"Not_A Brand^\^";v=^\^"99^\^"^" ^
  -H ^"sec-ch-ua-mobile: ?0^" ^
  -H ^"sec-ch-ua-platform: ^\^"Windows^\^"^" ^
  -H ^"sec-fetch-dest: image^" ^
  -H ^"sec-fetch-mode: no-cors^" ^
  -H ^"sec-fetch-site: same-site^" ^
  -H ^"user-agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36^"
```
We have to notice 2 things: the link (first line) and the cache (fourth line).

### The link
`https://reading.nxbbachkhoa.vn/doc-sach/c9648e7d-4c58-4d2a-8ba5-f7230271aae7/files/mobile/1.jpg?251128170538`

We can see that it save the file as [page number].jpg. Follow that is a time code to block downloading. But we will talk about it later.

### The cache
You should save it. You will need it to download.

## Solution 1, and the barrier
I asked Gemini to made a script to download every image files. It threw out a batch file. You can see it in the code.

However, it is messy and have a lot of problems. Initial version of the code threw errors even if it is successful. It also threw multiple other errors that is unrelated to the prior, but still do its job. And it is slow.

Gemini found that the slow speed is due to the server checking the time code. And this time, it came up with [an idea most ingenious](https://projectmoon.miraheze.org/wiki/Canto_VII:_The_Dream_Ending/7-36:The_Tale_of_a_Great_Fixer_Who_Once_Reached_for_The_Dream/Node_8/Transcript#:~:text=Oh%2C%20and%20Sancho...%20I%20have%20conceived%20an%20idea%20most%20ingenious.).

## Solution 2
It threw a PowerShell script. It is faster. And also better. Download in code.

This time, it completely ignore the time code on the original download link. It generates a completely new one:

`$CacheBuster = (Get-Date -UFormat %s%N).Substring(0, 10)`

It is much faster, like five or ten times. And no data loss.

## Ending notes
I'll release the PDF file once I finished stitching the JPG file together.

And before you use the script, please replace the cookie with your own.

Thank you for reading.
