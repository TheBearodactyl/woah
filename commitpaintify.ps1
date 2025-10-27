param(
	[int]$Iterations = 20
)

for ($i = 1; $i -le $Iterations; $i++)
{
	if (Test-Path "commitgraph.txt")
	{
		Move-Item -Force "commitgraph.txt" "commitgraph1.txt"
	} elseif (Test-Path "commitgraph1.txt")
	{
		Move-Item -Force "commitgraph1.txt" "commitgraph.txt"
	} else
	{
		Write-Host "Neither commitgraph.txt nor commitgraph1.txt exists. Exiting."
		exit 1
	}

	git add .
	git commit -m "commit graph painter be like (part $i) (just making it so that more commits are added lol)"
	git push -u origin main
}
