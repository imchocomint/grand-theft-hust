@echo off
setlocal enabledelayedexpansion

:: --- Configuration ---
set BASE_URL=https://reading.nxbbachkhoa.vn/doc-sach/c9648e7d-4c58-4d2a-8ba5-f7230271aae7/files/mobile/
set START_PAGE=1
set END_PAGE=456
:: Please replace the cookie string with your own 
set COOKIE_STRING="_ga=GA1.1.1981262382.1765113963; _ga_HFDYKEJJ3N=GS2.1.s1765113962^$o1^$g1^$t1765115281^$j48^$l0^$h0^"
set REFERER_HEADER="https://nxbbachkhoa.vn/"
set USER_AGENT="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36"
:: --- End Configuration ---

echo Starting download of %END_PAGE% pages...

for /L %%i in (%START_PAGE%,1,%END_PAGE%) do (
    set PAGE_NUM=%%i
    :: Pad the number with leading zeros (e.g., 1 -> 001)
    if !PAGE_NUM! lss 10 set OUTPUT_NAME=page_00!PAGE_NUM!.jpg
    if !PAGE_NUM! geq 10 if !PAGE_NUM! lss 100 set OUTPUT_NAME=page_0!PAGE_NUM!.jpg
    if !PAGE_NUM! geq 100 set OUTPUT_NAME=page_!PAGE_NUM!.jpg

    set FULL_URL=!BASE_URL!!PAGE_NUM!.jpg
    
    echo Downloading !PAGE_NUM! to !OUTPUT_NAME!...
    
    :: The ^ is used to escape the quotes in the curl command
    echo Downloading !PAGE_NUM! to !OUTPUT_NAME!...
    
    curl "!FULL_URL!" -H "accept: image/avif,image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8" -H "accept-language: en-US,en;q=0.9,vi;q=0.8" -b "!COOKIE_STRING!" -H "priority: i" -H "referer: !REFERER_HEADER!" -H "sec-ch-ua: \"Chromium\";v=\"142\", \"Google Chrome\";v=\"142\", \"Not_A Brand\";v=\"99\"" -H "sec-ch-ua-mobile: ?0" -H "sec-ch-ua-platform: \"Windows\"" -H "sec-fetch-dest: image" -H "sec-fetch-mode: no-cors" -H "sec-fetch-site: same-site" -H "user-agent: !USER_AGENT!" -o "!OUTPUT_NAME!"

    if errorlevel 1 (
        echo.
        echo.
    )
)

echo.
echo Download complete.
endlocal
pause