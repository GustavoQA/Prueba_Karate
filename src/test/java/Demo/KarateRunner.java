package Demo;

import com.intuit.karate.junit5.Karate;


public class KarateRunner {

    @Karate.Test
    Karate testSample() {
                //return Karate.run("classpath:examples/01-Post/prueba.feature")
        return Karate.run("classpath:examples/02-Get/albumSpotify.feature")
                .karateEnv("cert");
               //.tags("@SPY");
    }
}
