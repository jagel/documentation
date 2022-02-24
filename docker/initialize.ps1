$service=$args[0]

switch ($service) {
    "msql" {  
        docker-compose -f SqlServer.yml -p Infra up 
    }
    Default {
        Write-Error "Invalid argument select the followings parameters 
        `n ./intialize sql `n ./intialize postgres `n ./intialize mongo"  -Category InvalidArgument
    }
}