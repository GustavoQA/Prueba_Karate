function fn() { karate.configure('ssl', true);
    var env = karate.env;
    var urlDemo = '';
    var urlBook = '';
    var baseUrl = '';
    var baseSpotify = '';
    karate.log('Se realizó la ejecución en el ambiente: ', env);

 if (!env) {
     env = 'dev';
 }
 if (env === 'dev') {

 } else if (env === 'cert') {
    urlDemo = 'https://reqres.in'
    urlBook = 'https://restful-booker.herokuapp.com'
    baseUrl = 'https://reqres.in/'
    baseSpotify = 'https://api.spotify.com'
 }

 var config = {
    env: env,
    urlDemo: urlDemo,
    urlBook: urlBook,
    baseUrl: baseUrl,
    baseSpotify: baseSpotify
 }

 return config;
 }