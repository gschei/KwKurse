package kwkurse

class Kurs {
    static hasMany = [ rohstoffe:Rohstoff, termin:KursTermin ]
    static constraints = {
    }
    String name
    String beschreibung
}
