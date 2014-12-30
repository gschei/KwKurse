package kwkurse

class KursTermin {

    Kurs kurs
    static hasMany = [teilnehmer:KursTeilnahme]
    static constraints = {
    }
    Date kursbeginn
    int plaetze
    boolean erinnerungVersendet

    
}
