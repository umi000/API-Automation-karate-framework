package features.login;

import com.intuit.karate.junit5.Karate;

class UsersRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("users").relativeTo(getClass());
    }
    @Karate.Test
    Karate testUsers2() {
        return Karate.run("users").relativeTo(getClass());
    } 

}
