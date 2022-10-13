# A partir de l'exemple https://www.it-connect.fr/powershell-et-foreach-object-parallel-traitement-des-objets-en-parralele/
# Ne marche qu'a partir de powershell 7
# Les Keys/value du header pas dans le même index entre powershell 5 et powershell 7 

#$result = 1..10 | ForEach-Object -Parallel {Invoke-WebRequest -URI https://snoopdog.simplonsanlab.space/ -Method Post -Body @{vote="Cats"} -UseBasicParsing; Start-Sleep -Seconds 1;} -ThrottleLimit 2

# première boucle de 1 a 100, 5 secondes entre envoie de chaque bloc de 10 requêtes
1..100| ForEach-Object -Parallel {
    Invoke-WebRequest -URI https://sankubernetes.simplonsanlab.space/ `
                      -Method Post `                      -Body @{vote="Dogs"} `
                      -UseBasicParsing;
    Start-Sleep -Seconds 5;
} -ThrottleLimit 10

