package kwkurse

class KursTermin {

    Kurs kurs
    static hasMany = [teilnehmer:Kursteilnahme]
    static constraints = {
    }
    Date kursbeginn
    int plaetze
    
}
