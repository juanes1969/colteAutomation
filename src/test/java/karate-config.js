function fn() {
    karate.configure('connectTimeout', 150000);
    karate.configure('readTimeout', 150000);

    var config ={
        baseUrl:"https://appqadocker.coltefinanciera.com.co:7000/customer-api/v3/",
        urlAccount:"https://appqadocker.coltefinanciera.com.co:7000/account/v2/",
        xApiKey:"a1340d9c-62a3-4636-ab62-015bc770b0a8",
        xApiKeyAuth:"f6fc4c72-d79a-4429-92f1-39f6753602c6",
        secretKey: "C0lt3f1n4nci3r4_S3cr3t_P4ssw0rd1",
        bodyEncrypt: "eyJhbGciOiJBMjU2S1ciLCJlbmMiOiJBMTI4Q0JDLUhTMjU2In0.7LJ6cq9ctAlrO199JAN6U8tmfx1LUDd1uXaWqXnKOoj0MqSpXGMilw.CEODgH_kp74o6uHfE6AX3Q.oO0x01G6YcJfKE72wvVTZizQIz_9sefiV_3549QrMQkTtQuRQoFUJOvwauvtvPC8VCBawnU1t5BpKmVE6ek2P201Rse6050aGLHobY49ZEYRk6V7uHR42jZHmfVlQYbU1ll_PIP6TnoJF5lhUFslJptVypXsDO66iGrTC9ZXF0FMakpCXE0MNHAj-9htLn6C-KuSeuxV4YHaqaZI9ZCsxEAzGKwkTlAdxI8KAn73AUYRZxu3USwfVWX-sy9zyyJ2zZ_yshJIerJ8gAg9NNb5rrn-qGHlsePWd1Ezg2IwQgggI5Z1w9Y7i3E2ykYYuPQhGxls5Y_tbk5r4IjxeD8v4T_Ja_3OxVACsbNMJA0TCrWciLsrqsxnOCAWSx4mOqs3F3jj88xnsBBLeeibEWpJKgtgyv9z_tKHcI8ptwdHFzjph_n_CxnkH-eaWJp43qJ1ZIIa4gR1Z51ZmNkPS5ElxEJoU7vMoOjJtp7K0gszj8U4dyB50mwRqnc-S_bBHotzFYyG3HVzoLyxNLo9hC4f0HaR4xxcKEZJk9JHVE6G1b_xfIiHKdKLnSRAZREbq3dJPBFxApc4YHSn7W3laBN7xdImyWMdR-zIuJSBFI51NntbCH93WOKCL-tmaplZv2zgSWSgKryeMzNiT7N-0B5uBFqC0NExfq7aU-xBPCGWOk39NQ923nhuXFDb5T9Q13vxIV_FH6T22MHZYUQntfjB4A.nlqruUKnT5QbjASLoLMnMQ",
        urlDecrypt: "https://cf-068.coltefinanciera.com.co:7409/encryption-api/v0/",
        ssl: { trustAll: true }
    };

    return config;
}