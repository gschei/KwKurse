package kwkurse

class Person {


    static hasMany = { rollen:PersonRolle }

    static constraints = {
    }

    String vorname
    String nachname
    String email
    boolean newsletter
    String geschlecht //m or w
    Date geburtsdatum

}
