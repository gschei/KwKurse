package kwkurse



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class KundeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Kunde.list(params), model:[kundeInstanceCount: Kunde.count()]
    }

    def show(Kunde kundeInstance) {
        respond kundeInstance
    }

    def create() {
        respond new Kunde(params)
    }

    @Transactional
    def save(Kunde kundeInstance) {
        if (kundeInstance == null) {
            notFound()
            return
        }

        if (kundeInstance.hasErrors()) {
            respond kundeInstance.errors, view:'create'
            return
        }

        kundeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'kunde.label', default: 'Kunde'), kundeInstance.id])
                redirect kundeInstance
            }
            '*' { respond kundeInstance, [status: CREATED] }
        }
    }

    def edit(Kunde kundeInstance) {
        respond kundeInstance
    }

    @Transactional
    def update(Kunde kundeInstance) {
        if (kundeInstance == null) {
            notFound()
            return
        }

        if (kundeInstance.hasErrors()) {
            respond kundeInstance.errors, view:'edit'
            return
        }

        kundeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Kunde.label', default: 'Kunde'), kundeInstance.id])
                redirect kundeInstance
            }
            '*'{ respond kundeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Kunde kundeInstance) {

        if (kundeInstance == null) {
            notFound()
            return
        }

        kundeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Kunde.label', default: 'Kunde'), kundeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'kunde.label', default: 'Kunde'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
