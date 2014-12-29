package kwkurse

class Kurs {
    static hasMany = [ rohstoffe:Rohstoff ]
    static constraints = {
    }
    String name
    String beschreibung
}
