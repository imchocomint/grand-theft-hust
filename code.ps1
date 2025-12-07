# --- Configuration ---
$BASE_URL = "https://reading.nxbbachkhoa.vn/doc-sach/c9648e7d-4c58-4d2a-8ba5-f7230271aae7/files/mobile/"
$START_PAGE = 1
$END_PAGE = 456
# Please replace the cookie string with your own
$COOKIE_STRING = "_ga=GA1.1.1981262382.1765113963; _ga_HFDYKEJJ3N=GS2.1.s1765113962`$o1`$g1`$t1765115281`$j48`$l0`$h0"
$REFERER_HEADER = "https://nxbbachkhoa.vn/"
$USER_AGENT = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36"

# Add the following lines if they are missing:
$MaxRetries = 3
$DelaySeconds = 0.5   # Wait time after a successful download
$RetryDelaySeconds = 3 # Wait time before retrying a failed download

# Define all the required headers... (and so on)
# Define all the required headers in a Hashtable
$Headers = @{
    "accept" = "image/avif,image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8"
    "accept-language" = "en-US,en;q=0.9,vi;q=0.8"
    "priority" = "i"
    "referer" = $REFERER_HEADER
    # Note: PowerShell handles complex quoted strings in headers easily
    "sec-ch-ua" = '"Chromium";v="142", "Google Chrome";v="142", "Not_A Brand";v="99"'
    "sec-ch-ua-mobile" = "?0"
    "sec-ch-ua-platform" = '"Windows"'
    "sec-fetch-dest" = "image"
    "sec-fetch-mode" = "no-cors"
    "sec-fetch-site" = "same-site"
}

# Add the cookie string to the headers
$Headers["Cookie"] = $COOKIE_STRING

# --- Execution ---
Write-Host "Starting download of $END_PAGE pages..."

# --- Execution ---
Write-Host "Starting download of $END_PAGE pages..."

for ($i = $START_PAGE; $i -le $END_PAGE; $i++) {
    $OutputName = "page_{0:D3}.jpg" -f $i
    
    # Check if the file already exists and skip it
    if (Test-Path $OutputName) {
        Write-Host "Page $i already exists as $OutputName. Skipping." -ForegroundColor DarkYellow
        # Continue to the next page in the FOR loop
        continue 
    }
    
    $success = $false
    $attempt = 0
    
    # Construct the full URL
    # ... (Keep the CacheBuster lines here)
    $CacheBuster = (Get-Date -UFormat %s%N).Substring(0, 10) 
    $FullUrl = "$BASE_URL$i.jpg?$CacheBuster" 

    Write-Host "Downloading page $i to $OutputName..." -NoNewline
    
    do {
        $attempt++
        try {
            Invoke-WebRequest -Uri $FullUrl -Headers $Headers -UserAgent $USER_AGENT -OutFile $OutputName
            Write-Host " [Success]" -ForegroundColor Green
            $success = $true
            # The 'break' is now unnecessary because '$success' controls the do-while loop
        }
        catch {
            Write-Host " [Failure] (Attempt $attempt of $MaxRetries)" -ForegroundColor Yellow
            if ($attempt -lt $MaxRetries) {
                # ... (Keep the Retry delay logic here)
                Write-Host "  Retrying in $RetryDelaySeconds seconds..."
                Start-Sleep -Seconds $RetryDelaySeconds 
            }
            else {
                # ... (Keep the FINAL FAILURE message here)
                Write-Host "  *** FINAL FAILURE: Skipping page $i. ***" -ForegroundColor Red
            }
        }
    } while ($attempt -lt $MaxRetries -and -not $success) # Loop while attempts < max AND not successful
    
    # Introduce a short delay after every successful attempt to reduce throttling
    if ($success) {
        Start-Sleep -Seconds $DelaySeconds 
    }
}
Write-Host "`nDownload complete. Check the directory for all page_NNN.jpg files."