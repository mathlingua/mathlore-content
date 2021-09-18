
$MATHLINGUA_JAR = ".bin/mathlingua.jar"
$RELEASES_FILE = ".bin/releases"

if (!(Test-Path .bin)) {
  New-Item .bin -itemType Directory | Out-Null
}

if (!(Test-Path $MATHLINGUA_JAR)) {
  echo "Initial run of mlg detected..."
  echo "Downloading the latest version of MathLingua..."

  if (!(Test-Path content)) {
    New-Item content -itemType Directory | Out-Null
  }

  try {
    Invoke-WebRequest https://api.github.com/repos/DominicKramer/mathlingua/releases/latest -OutFile $RELEASES_FILE  | Out-Null
    $RELEASE_URL = Select-String '"browser_download_url":"(.*?)"' $RELEASES_FILE | %{$_.Matches.Groups[1].value}
    Invoke-WebRequest $RELEASE_URL -OutFile $MATHLINGUA_JAR
    Remove-Item $RELEASES_FILE  | Out-Null
    echo "Download complete"
    echo "Please re-run your command"
    exit
  } catch {
    echo "ERROR: Failed downloading the latest version of MathLingua"
    echo ""
    echo "To address this manually download the latest MathLingua release from"
    echo "https://github.com/DominicKramer/mathlingua/releases to .bin/mathlingua.jar"
  }
}

Start-Process java -ArgumentList "-jar .bin/mathlingua.jar ${Args}" -Wait
