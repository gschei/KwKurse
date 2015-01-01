package kwkurse

class Rohstoff {
    static belongsTo = Kurs
    static hasMany = [kurse:Kurs]
    static constraints = {
    }
    String name

}
