package kwkurse

class Kunde extends PersonRolle  {

    static hasMany = { teilnahme : KursTeilnahme }
    static constraints = {
    }
}
