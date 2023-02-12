dotnet nuget add source --name github "https://nuget.pkg.github.com/rytisgit/index.json"
dotnet nuget push ".\PuttyXtermEmulator.1.0.0.nupkg"  --api-key GithubKeyHere --source "github"