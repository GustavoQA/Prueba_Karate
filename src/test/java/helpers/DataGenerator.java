package helpers;
import com.github.javafaker.Faker;

public class DataGenerator {

    public static String getNombre(){
        Faker faker = new Faker();
        String nombre = faker.name().firstName();
        return nombre;
    }

    public static String getApellido(){
        Faker faker = new Faker();
        String apellido = faker.name().lastName();
        return apellido;
    }

    public static Integer getNumero(){
        Integer num = (int) (Math.random() * 9000) + 1000;
        return num;
    }

}
