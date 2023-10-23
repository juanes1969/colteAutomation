function fn() {
    karate.configure('connectTimeout', 150000);
    karate.configure('readTimeout', 150000);

    var config ={
        baseUrl:"https://appqadocker.coltefinanciera.com.co:7000/customer-api/v3/",
        xApiKey:"a1340d9c-62a3-4636-ab62-015bc770b0a8",
        ssl: { trustAll: true }
    };

    return config;



}